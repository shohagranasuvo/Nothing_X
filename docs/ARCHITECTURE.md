# Nothing X Mod — Technical Architecture

This document provides an in-depth breakdown of the architecture, reverse engineering methodologies, and runtime injection techniques used to enhance **Nothing X** (`com.nothing.smartcenter`, v3.10.1) with real-time health telemetry, custom in-menu UI docking, an awake-aware sleep timer, and a 6-wave watch wake-up alarm system.

---

## 1. System Overview

```
                      +---------------------------------------+
                      |       Nothing X (com.nothing)         |
                      |  FlutterActivity / MainActivity.kt    |
                      +-------------------+-------------------+
                                          |
                      +-------------------+-------------------+
                      |      Window.Callback Proxy Hook       |
                      |  (Intercepts Tab Touches 0ms Latency) |
                      +---------+-------------------+---------+
                                |                   |
               [Tapped "My Devices"]             [Tapped "Health"]
                                |                   |
                                v                   v
                        Hide Custom Card     Show Custom Card Docked
                         (View.GONE)             (#1A1A1C, 20dp radius)
                                                    |
                   +--------------------------------+-------------------------------+
                   |                                                                |
                   v                                                                v
   +-------------------------------+                                +-------------------------------+
   |   Live Telemetry Scraper      |                                |   Sleep Timer & Alarm Engine  |
   |   - Flutter Semantics Tree    |                                |   - AlarmManager (RTC_WAKEUP) |
   |   - SQLite (AddUpNetModel)    |                                |   - Awake Auto-Pause Watchdog |
   |   - 95 BPM, 98% SpO2, 13 St   |                                |   - 6-Wave Watch Vibration    |
   +---------------+---------------+                                +---------------+---------------+
                   |                                                                |
                   +--------------------------------+-------------------------------+
                                                    |
                                                    v
                                    +-------------------------------+
                                    |     CMF Watch Pro 2-14CA      |
                                    |   BLE GATT Notification Pipe  |
                                    +-------------------------------+
```

---

## 2. Overcoming the Flutter Touch Interception Barrier

### The Challenge
Nothing X is built primarily on **Flutter** (`io.flutter.embedding.android.FlutterView`), wrapped inside `MainActivity` (`FlutterActivity`). Because `FlutterView` intercepts and consumes all touch events through `onTouchEvent(MotionEvent)`, attaching conventional Android view listeners (such as `DecorView.setOnTouchListener`) fails—Flutter consumes the events before the root decor view receives them.

### The Solution: Dynamic `Window.Callback` Proxy
In the Android framework, the window event pipeline travels:
```
Activity.dispatchTouchEvent() -> Window.superDispatchTouchEvent() -> DecorView -> Child Views
```
Before reaching any child view, the window delegates event dispatching to its registered `Window.Callback`. 

We hook `Window.Callback` using Java Reflection and dynamic proxy (`java.lang.reflect.Proxy`):

```java
final Window.Callback originalCallback = window.getCallback();
Window.Callback proxy = (Window.Callback) Proxy.newProxyInstance(
    Window.Callback.class.getClassLoader(),
    new Class<?>[]{Window.Callback.class},
    new InvocationHandler() {
        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            if ("dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1) {
                MotionEvent event = (MotionEvent) args[0];
                if (event != null && event.getAction() == MotionEvent.ACTION_UP) {
                    float x = event.getRawX();
                    float y = event.getRawY();
                    // Detect top tab coordinate bounds (Y in [45dp..130dp])
                    if (y >= dp(activity, 45) && y <= dp(activity, 130)) {
                        if (x < dp(activity, 140)) {
                            // "My devices" tab
                            sIsHealthTabActive = false;
                            card.setVisibility(View.GONE);
                        } else if (x >= dp(activity, 140) && x <= dp(activity, 260)) {
                            // "Health" tab
                            sIsHealthTabActive = true;
                            card.setVisibility(View.VISIBLE);
                            card.bringToFront();
                            updateCardContent(...);
                        }
                    }
                }
            }
            return originalCallback.invoke(originalCallback, args);
        }
    }
);
window.setCallback(proxy);
```
**Result**: 100% deterministic, immediate detection of tab switching between "My devices" and "Health" without interfering with Flutter gestures or animations.

---

## 3. Real-Time Telemetry via Flutter Semantics Bridge

### The Challenge
When Nothing X receives live Bluetooth GATT telemetry from the CMF Watch Pro 2, it updates the Flutter widget state. Standard Android `AccessibilityNodeInfo` queries return empty virtual nodes because Flutter disables its internal semantics tree unless an accessibility service is active.

### The Solution: Reflexive Channel Enablement & Tree Walking
1. **Engine Semantics Activation**:
   We locate `FlutterView` in the decor hierarchy, query `getAttachedFlutterEngine()`, obtain `getAccessibilityChannel()`, and invoke `onAndroidAccessibilityEnabled()`.
2. **Semantics Tree Traversal**:
   We access the internal `AccessibilityBridge` on `FlutterView` and read `flutterSemanticsTree` (`Map<Integer, SemanticsNode>`):
   - **Heart Rate**: Extracted via `(\\d{2,3})\\s*bpm` pattern (e.g. `95 bpm`).
   - **Blood Oxygen**: Extracted via `(\\d{2,3})\\s*%` pattern (e.g. `98%`).
   - **Steps**: Extracted via `(\\d+)\\s*/\\s*\\d+` pattern (e.g. `13/5000`).
   - **Active Tab**: Validates `isSelected` semantics flag on `Tab 2 of 2 (Health)`.

---

## 4. SQLite Storage Engine (`nothing_x.db`)

When the app is opened cold or running in the background, we query the local SQLite database `/data/data/com.nothing.smartcenter/databases/nothing_x.db`:

- **Static vs Dynamic Metric Resolution**:
  - `HeartRateReportDbModelTable`: Contains historical midnight readings and resting minimums (often `56 BPM`).
  - `AddUpNetModelTable`: Contains aggregated records (`AddUpNetModelType.heartRate...`) with `lastValue` storing the **live measurement** (`95 BPM`).
- Our data engine prioritizes `AddUpNetModelTable` and live semantics over static baseline tables, ensuring zero latency and accurate metrics.

---

## 5. Background Reliability & Awake Watchdog

1. **State Persistence**: State is serialized into `nothing_x_sleep_timer.xml` (`SharedPreferences`).
2. **Exact Wake-Up**: Scheduled using `AlarmManager.setExactAndAllowWhileIdle()` (`RTC_WAKEUP`), waking the CPU even in Android Doze mode.
3. **Reboot Resilience**: Hooked into `com.nothing.foreground.service.RebootReceiver` to reschedule timers upon phone reboot.
4. **Awake Watchdog**: In `checkAwakeAndAutoStopIfNeeded()`, if heart rate elevates (`>= 78 BPM` or `+12 BPM` above sleep threshold) or step movements occur after the 90-second start grace period, the timer pauses automatically to prevent waking up an already alert user.
