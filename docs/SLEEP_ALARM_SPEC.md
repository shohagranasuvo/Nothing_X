# Sleep Timer & Smart Wake-Up Alarm Specification

This document outlines the state machine, alarm dispatch logic, 6-wave watch vibration bursts, and awake auto-pause heuristics implemented in `NothingXEnhancer.java`.

---

## 1. State Machine

```
              +---------------------+
              |      STATE_IDLE     |
              +----------+----------+
                         |
           +-------------+-------------+
           | [▶ Start]                 | [◉ Auto-Sleep]
           v                           v
  +------------------+       +------------------+
  |  STATE_RUNNING   |       |   STATE_ARMED    |
  +--------+---------+       +--------+---------+
           |                          |
           | (Awake Detected          | (Sleep Detected:
           |  HR >= 78 or Steps)      |  HR <= 65 BPM)
           v                          v
  +------------------+       +------------------+
  |   STATE_PAUSED   |       |  STATE_RUNNING   |
  +--------+---------+       +--------+---------+
           |                          |
           | [▶ Resume]               | (Target Epoch Reached)
           v                          v
  +------------------+       +------------------+
  |  STATE_RUNNING   |       | 6-Wave Wake-Up   |
  +------------------+       | Alarm Burst      |
                             +--------+---------+
                                      |
                                      v
                             +------------------+
                             | STATE_COMPLETED  |
                             +------------------+
```

---

## 2. Modes of Operation

### Manual Sleep Timer (`STATE_RUNNING`)
- User selects duration (e.g. 20m, 30m, 1h, 2h, or custom minutes).
- Taps **`▶ Start`**.
- An exact RTC alarm is registered with Android's `AlarmManager` via `setExactAndAllowWhileIdle()`.
- Baseline step count and start heart rate are saved for awake watchdog tracking.

### Smart Watch-Aware Auto-Sleep (`STATE_ARMED`)
- User taps **`◉ Auto-Sleep`**.
- The timer remains in standby while monitoring the connected CMF Watch Pro 2.
- When the watch syncs resting heart rate (`HR <= threshold`, default 65 BPM) and confirms 0 steps (stillness), the timer begins the countdown automatically.

### Awake Watchdog (`STATE_PAUSED`)
- While running, `checkAwakeAndAutoStopIfNeeded()` monitors telemetry:
  1. **Movement / Steps**: If current steps exceed baseline by more than 3 steps, user is walking.
  2. **Elevated Heart Rate**: If current heart rate is `>= 78 BPM` (or `>= threshold + 12 BPM`) after the initial 90-second start grace period, user is awake.
- When awake is confirmed:
  - Alarm is cancelled immediately.
  - Remaining time is preserved.
  - State shifts to `STATE_PAUSED` with reason: `"Awake heart rate (95 BPM) • Timer paused"`.
  - Notification is sent to phone and watch.

---

## 3. 6-Wave Watch Wake-Up Alarm Burst

When the timer finishes, standard soft notifications often fail to wake a sleeping user. Nothing X Mod initiates a persistent **6-wave wake-up burst**:

```
Wave 1 (T+0s)   -> High-Priority Heads-Up Notification + Alarm Sound + Watch BLE Vibration Packet
Wave 2 (T+7s)   -> High-Priority Heads-Up Notification + Alarm Sound + Watch BLE Vibration Packet
Wave 3 (T+14s)  -> High-Priority Heads-Up Notification + Alarm Sound + Watch BLE Vibration Packet
Wave 4 (T+21s)  -> High-Priority Heads-Up Notification + Alarm Sound + Watch BLE Vibration Packet
Wave 5 (T+28s)  -> High-Priority Heads-Up Notification + Alarm Sound + Watch BLE Vibration Packet
Wave 6 (T+35s)  -> High-Priority Heads-Up Notification + Alarm Sound + Watch BLE Vibration Packet
```

- Each wave posts with `Notification.FLAG_INSISTENT`, bypassing Doze and DND restrictions via `NotificationChannel.setBypassDnd(true)` and `AudioAttributes.USAGE_ALARM`.
- Simultaneously triggers continuous hardware vibration on both phone and connected CMF Watch Pro 2.
- Tapping **`⏹ STOP ALARM`** cancels all subsequent waves instantly.
