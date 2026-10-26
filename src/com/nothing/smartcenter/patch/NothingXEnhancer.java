package com.nothing.smartcenter.patch;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.media.AudioAttributes;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.nothing.nt_route.TestActivity;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * NothingXEnhancer integrates the Sleep Timer, Health Monitoring inspector,
 * and Nothing Watch Pro 2 Notification bridge directly into the original
 * Nothing X application (com.nothing.smartcenter).
 */
public final class NothingXEnhancer {
    public static final String TAG = "NothingXEnhancer";
    public static final String PREFS_NAME = "nothing_x_sleep_timer";
    public static final String ACTION_WAKE_UP = "com.nothing.smartcenter.ACTION_WAKE_UP";
    public static final String EXTRA_SLEEP_TIMER_ALARM = "nt_sleep_timer_alarm";
    public static final String EXTRA_SLEEP_DETECTOR_POLL = "nt_sleep_detector_poll";
    public static final String EXTRA_TIMER_ID = "nt_timer_id";
    public static final String CHANNEL_ID = "nothing_x_sleep_timer_channel";

    public static final int NOTIF_ID_SLEEP_TIMER = 40501;
    public static final int NOTIF_ID_WATCH_TEST = 40502;
    public static final int REQ_CODE_SLEEP_POLL = 40503;

    public static final String STATE_IDLE = "IDLE";
    public static final String STATE_ARMED = "ARMED";
    public static final String STATE_RUNNING = "RUNNING";
    public static final String STATE_PAUSED = "PAUSED";
    public static final String STATE_COMPLETED = "COMPLETED";

    private static final Map<String, String> sFlutterHealthCache =
            Collections.synchronizedMap(new LinkedHashMap<String, String>());
    private static final Map<String, String> sFlutterRawJsonCache =
            Collections.synchronizedMap(new LinkedHashMap<String, String>());
    private static final Map<String, Long> sFlutterTimestampCache =
            Collections.synchronizedMap(new LinkedHashMap<String, Long>());
    private static volatile long sFlutterHealthCacheTimeMs = 0L;
    private static volatile long sLastArmedPollMs = 0L;
    private static volatile long sLastLifecyclePulseMs = 0L;
    private static volatile long sLastDbRefreshMs = 0L;
    private static volatile Map<String, String> sCachedDashboardMap = null;
    private static volatile boolean sDbRefreshInFlight = false;

    // 6-Wave Wake-Up Burst state
    private static volatile boolean sWakeUpBurstActive = false;
    private static volatile int sWakeUpBurstCurrentWave = 0;
    private static volatile int sWakeUpBurstTotalWaves = 6;
    private static volatile Ringtone sActiveAlarmRingtone = null;
    private static final Handler sBurstHandler = new Handler(Looper.getMainLooper());
    private static volatile boolean sLoggedDbSchemaOnce = false;

    // Live scraped real-time metrics & tab state from Nothing X's own UI
    public static volatile int sLiveHeartRateBpm = 0;
    public static volatile String sLiveSpo2Val = null;
    public static volatile String sLiveStepVal = null;
    public static volatile boolean sIsHealthTabActive = false;

    private NothingXEnhancer() {}

    /**
     * Called from com.nothing.smartcenter.host.MainActivity.onPostResume()
     * Integrates the Sleep Timer & Smart Alarm directly inside Nothing X's Health menu
     * as a custom layout card, completely hiding on "My devices" and other tabs.
     */
    public static void attachToMainActivity(final Activity activity) {
        if (activity == null) return;
        try {
            ensureTimerRestored(activity.getApplicationContext());
            final View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
            if (decor == null) return;
            final ViewGroup content = (ViewGroup) decor.findViewById(android.R.id.content);
            if (content == null) return;

            // Remove old floating pill if present so it never obstructs other tabs
            View oldPill = content.findViewWithTag("nt_sleep_health_fab");
            if (oldPill != null) {
                content.removeView(oldPill);
            }

            View existingCard = content.findViewWithTag("nt_health_custom_card");
            if (existingCard != null) {
                existingCard.bringToFront();
                return;
            }

            // Create Authentic Nothing X Health Menu Custom Layout Card
            final LinearLayout card = new LinearLayout(activity);
            card.setTag("nt_health_custom_card");
            card.setOrientation(LinearLayout.VERTICAL);
            int padH = dp(activity, 16);
            int padV = dp(activity, 13);
            card.setPadding(padH, padV, padH, padV);

            GradientDrawable bg = new GradientDrawable();
            bg.setColor(Color.parseColor("#F21C1C1E"));
            bg.setCornerRadius(dp(activity, 22));
            bg.setStroke(dp(activity, 1), Color.parseColor("#2C2C2E"));
            card.setBackground(bg);
            if (Build.VERSION.SDK_INT >= 21) {
                card.setElevation(dp(activity, 8));
            }

            final FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL
            );
            lp.leftMargin = dp(activity, 16);
            lp.rightMargin = dp(activity, 16);
            lp.bottomMargin = dp(activity, 24);

            // Default: GONE until Health tab is detected!
            card.setVisibility(View.GONE);

            // 1. Top row: Icon + Title + Status Pill
            LinearLayout headerRow = new LinearLayout(activity);
            headerRow.setOrientation(LinearLayout.HORIZONTAL);
            headerRow.setGravity(Gravity.CENTER_VERTICAL);

            TextView iconTv = new TextView(activity);
            iconTv.setText("⏰");
            iconTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            iconTv.setGravity(Gravity.CENTER);
            int iconSize = dp(activity, 30);
            LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(iconSize, iconSize);
            iconTv.setLayoutParams(iconLp);
            GradientDrawable iconBg = new GradientDrawable();
            iconBg.setColor(Color.parseColor("#2C2C2E"));
            iconBg.setCornerRadius(iconSize / 2f);
            iconTv.setBackground(iconBg);
            headerRow.addView(iconTv);

            LinearLayout titleCol = new LinearLayout(activity);
            titleCol.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams tcLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            tcLp.leftMargin = dp(activity, 10);

            TextView titleTv = new TextView(activity);
            titleTv.setText("Sleep Timer & Smart Alarm");
            titleTv.setTextColor(Color.WHITE);
            titleTv.setTypeface(Typeface.SERIF, Typeface.NORMAL);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            titleCol.addView(titleTv);

            final TextView subTv = new TextView(activity);
            subTv.setText("Auto-stops when awake • 6x Watch Vibration");
            subTv.setTextColor(Color.parseColor("#8E8E93"));
            subTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f);
            titleCol.addView(subTv);

            headerRow.addView(titleCol, tcLp);

            final TextView badgeTv = new TextView(activity);
            badgeTv.setText("READY");
            badgeTv.setTextColor(Color.parseColor("#8E8E93"));
            badgeTv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
            badgeTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f);
            int bpH = dp(activity, 8);
            int bpV = dp(activity, 4);
            badgeTv.setPadding(bpH, bpV, bpH, bpV);
            GradientDrawable bbg = new GradientDrawable();
            bbg.setColor(Color.parseColor("#2C2C2E"));
            bbg.setCornerRadius(dp(activity, 10));
            badgeTv.setBackground(bbg);
            headerRow.addView(badgeTv);

            card.addView(headerRow);

            // 2. Middle Row: Countdown + Live Health Ticker
            LinearLayout midRow = new LinearLayout(activity);
            midRow.setOrientation(LinearLayout.HORIZONTAL);
            midRow.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams midLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            midLp.topMargin = dp(activity, 6);
            midLp.bottomMargin = dp(activity, 6);

            final TextView countTv = new TextView(activity);
            countTv.setText("02:00:00");
            countTv.setTextColor(Color.WHITE);
            countTv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
            countTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
            midRow.addView(countTv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            final TextView metricsTickerTv = new TextView(activity);
            metricsTickerTv.setText("♥ -- BPM • 💧 -- % • 👣 --");
            metricsTickerTv.setTextColor(Color.parseColor("#8E8E93"));
            metricsTickerTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
            metricsTickerTv.setGravity(Gravity.END);
            midRow.addView(metricsTickerTv);

            card.addView(midRow, midLp);

            // 3. Action Buttons Row: [ ▶ Start ] [ ◉ Auto-Sleep ] [ ⚙ Full ]
            final LinearLayout actionsRow = new LinearLayout(activity);
            actionsRow.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams actLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );

            final Button btnAction1 = createCustomCardButton(activity, "▶ Start", "#D71921", "#FFFFFF");
            final Button btnAction2 = createCustomCardButton(activity, "◉ Auto-Sleep", "#2C2C2E", "#FFFFFF");
            final Button btnAction3 = createCustomCardButton(activity, "⚙ Full", "#2C2C2E", "#FFFFFF");

            actionsRow.addView(btnAction1, weightedParams(activity, 0, 4));
            actionsRow.addView(btnAction2, weightedParams(activity, 4, 4));
            actionsRow.addView(btnAction3, weightedParams(activity, 4, 0));

            btnAction1.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    SharedPreferences prefs = getPrefs(activity);
                    String state = prefs.getString("state", STATE_IDLE);
                    if (isWakeUpBurstActive()) {
                        stopWakeUpAlarmBurst(activity);
                    } else if (STATE_RUNNING.equals(state)) {
                        pauseTimer(activity);
                    } else if (STATE_PAUSED.equals(state)) {
                        resumeTimer(activity);
                    } else {
                        long dur = prefs.getLong("duration_ms", 2L * 3600_000L);
                        startTimer(activity, dur);
                    }
                    updateCardContent(activity, card, subTv, badgeTv, countTv, metricsTickerTv, btnAction1, btnAction2, btnAction3);
                }
            });

            btnAction2.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    SharedPreferences prefs = getPrefs(activity);
                    String state = prefs.getString("state", STATE_IDLE);
                    if (isWakeUpBurstActive()) {
                        stopWakeUpAlarmBurst(activity);
                    } else if (STATE_RUNNING.equals(state) || STATE_ARMED.equals(state) || STATE_PAUSED.equals(state)) {
                        cancelTimer(activity);
                    } else {
                        long dur = prefs.getLong("duration_ms", 2L * 3600_000L);
                        int thr = prefs.getInt("armed_hr_threshold", 65);
                        armTimerForWatchSleep(activity, dur, thr);
                    }
                    updateCardContent(activity, card, subTv, badgeTv, countTv, metricsTickerTv, btnAction1, btnAction2, btnAction3);
                }
            });

            btnAction3.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    try {
                        activity.startActivity(new Intent(activity, TestActivity.class));
                    } catch (Throwable ignored) {}
                }
            });

            card.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    try {
                        activity.startActivity(new Intent(activity, TestActivity.class));
                    } catch (Throwable ignored) {}
                }
            });

            card.addView(actionsRow, actLp);
            content.addView(card, lp);

            // Restore persistent tab state (defaults to false so My devices stays clean)
            sIsHealthTabActive = getPrefs(activity).getBoolean("is_health_tab_active", false);
            card.setVisibility(sIsHealthTabActive ? View.VISIBLE : View.GONE);

            // Install Window.Callback dynamic proxy to intercept user tab taps before Flutter consumes them
            try {
                final Window window = activity.getWindow();
                final Window.Callback originalCallback = window != null ? window.getCallback() : null;
                if (window != null && originalCallback != null && !(Proxy.isProxyClass(originalCallback.getClass()))) {
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
                                            // Top tab bar area: Y in [45dp .. 130dp]
                                            if (y >= dp(activity, 45) && y <= dp(activity, 130)) {
                                                if (x < dp(activity, 140)) {
                                                    // "My devices" tab clicked
                                                    sIsHealthTabActive = false;
                                                    card.setVisibility(View.GONE);
                                                    getPrefs(activity).edit().putBoolean("is_health_tab_active", false).apply();
                                                } else if (x >= dp(activity, 140) && x <= dp(activity, 260)) {
                                                    // "Health" tab clicked
                                                    sIsHealthTabActive = true;
                                                    card.setVisibility(View.VISIBLE);
                                                    card.bringToFront();
                                                    getPrefs(activity).edit().putBoolean("is_health_tab_active", true).apply();
                                                    updateCardContent(activity, card, subTv, badgeTv, countTv, metricsTickerTv, btnAction1, btnAction2, btnAction3);
                                                }
                                            }
                                        }
                                    }
                                    if (originalCallback != null) {
                                        return method.invoke(originalCallback, args);
                                    }
                                    if (method.getReturnType().equals(boolean.class)) {
                                        return false;
                                    }
                                    return null;
                                }
                            }
                    );
                    window.setCallback(proxy);
                }
            } catch (Throwable t) {
                Log.w(TAG, "Window callback proxy note: " + t.getMessage());
            }

            // Periodic Ticker: scrapes live metrics, checks tab state, updates card & checks auto-stop when awake
            final Handler tickerHandler = new Handler(Looper.getMainLooper());
            Runnable ticker = new Runnable() {
                @Override
                public void run() {
                    if (activity.isFinishing() || activity.isDestroyed()) return;
                    try {
                        scrapeMetricsFromDecorView(decor);
                        card.setVisibility(sIsHealthTabActive ? View.VISIBLE : View.GONE);
                        if (sIsHealthTabActive) {
                            card.bringToFront();
                            updateCardContent(activity, card, subTv, badgeTv, countTv, metricsTickerTv, btnAction1, btnAction2, btnAction3);
                        }
                        checkAndCompleteIfExpired(activity);
                    } catch (Throwable ignored) {}
                    tickerHandler.postDelayed(this, 800L);
                }
            };
            tickerHandler.post(ticker);

        } catch (Throwable t) {
            Log.e(TAG, "attachToMainActivity error", t);
        }
    }

    private static Button createCustomCardButton(Context context, String text, String bgHex, String fgHex) {
        Button b = new Button(context);
        b.setAllCaps(false);
        b.setText(text);
        b.setTextColor(Color.parseColor(fgHex));
        b.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        b.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        int pH = dp(context, 10);
        int pV = dp(context, 7);
        b.setPadding(pH, pV, pH, pV);
        b.setMinHeight(0);
        b.setMinimumHeight(0);
        b.setMinWidth(0);
        b.setMinimumWidth(0);
        b.setBackground(createButtonBg(bgHex, 14));
        return b;
    }

    private static GradientDrawable createButtonBg(String bgHex, int radiusDp) {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor(bgHex));
        bg.setCornerRadius(radiusDp * 2.5f);
        return bg;
    }

    private static LinearLayout.LayoutParams weightedParams(Context context, int leftDp, int rightDp) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        lp.leftMargin = dp(context, leftDp);
        lp.rightMargin = dp(context, rightDp);
        return lp;
    }

    private static void updateCardContent(
            Context context,
            View card,
            TextView subTv,
            TextView badgeTv,
            TextView countTv,
            TextView metricsTickerTv,
            Button btn1,
            Button btn2,
            Button btn3
    ) {
        try {
            SharedPreferences prefs = getPrefs(context);
            String state = prefs.getString("state", STATE_IDLE);
            long dur = prefs.getLong("duration_ms", 2L * 3600_000L);
            long target = prefs.getLong("target_epoch_ms", 0L);
            long remPaused = prefs.getLong("remaining_ms", 0L);

            boolean isBurst = isWakeUpBurstActive();
            if (isBurst) {
                int wave = getWakeUpBurstCurrentWave();
                stylePill(badgeTv, "🔔 WAKING UP", "#3A1518", "#FF453A");
                countTv.setText("00:00:00");
                subTv.setText("Wave " + wave + "/6 vibrating Watch Pro 2!");
                btn1.setText("⏹ STOP ALARM");
                btn1.setBackground(createButtonBg("#D71921", 16));
                btn2.setText("⚙ Full");
                btn2.setVisibility(View.VISIBLE);
                btn3.setVisibility(View.GONE);
                return;
            }

            btn3.setVisibility(View.VISIBLE);
            btn3.setText("⚙ Full");

            // Format live metric ticker with dynamic watch data
            Map<String, String> dash = getCleanDashboardData(context);
            String hrStr = sLiveHeartRateBpm > 0 ? (sLiveHeartRateBpm + " BPM") : (dash != null && dash.containsKey("hr_val") ? dash.get("hr_val") : "-- BPM");
            String spo2Str = sLiveSpo2Val != null ? sLiveSpo2Val : (dash != null && dash.containsKey("spo2_val") ? dash.get("spo2_val") : "-- %");
            String stepStr = sLiveStepVal != null ? (sLiveStepVal + " steps") : (dash != null && dash.containsKey("step_val") ? (dash.get("step_val") + " steps") : "--");
            metricsTickerTv.setText("♥ " + hrStr + " • 💧 " + spo2Str + " • 👣 " + stepStr);

            if (STATE_RUNNING.equals(state)) {
                long rem = Math.max(0L, target - System.currentTimeMillis());
                stylePill(badgeTv, "● RUNNING", "#143822", "#30D158");
                countTv.setText(formatHhMmSs(rem));
                subTv.setText("Wake-up at " + formatClockShort(target) + " • Stops if awake");
                btn1.setText("⏸ Pause");
                btn1.setBackground(createButtonBg("#2C2C2E", 16));
                btn2.setText("⏹ Stop");
                btn2.setBackground(createButtonBg("#3A181B", 16));
            } else if (STATE_ARMED.equals(state)) {
                int thr = prefs.getInt("armed_hr_threshold", 65);
                stylePill(badgeTv, "◉ ARMED", "#0D3B47", "#64D2FF");
                countTv.setText(formatHhMmSs(dur));
                String detail = prefs.getString("armed_status_detail", "Waiting for Watch HR ≤ " + thr + " BPM");
                subTv.setText(detail);
                btn1.setText("▶ Start Now");
                btn1.setBackground(createButtonBg("#D71921", 16));
                btn2.setText("⏹ Cancel");
                btn2.setBackground(createButtonBg("#3A181B", 16));
            } else if (STATE_PAUSED.equals(state)) {
                String pauseReason = prefs.getString("paused_reason", "Paused");
                stylePill(badgeTv, "⏸ PAUSED", "#3A2E0D", "#FFD60A");
                countTv.setText(formatHhMmSs(remPaused));
                subTv.setText(pauseReason + " • Tap Resume");
                btn1.setText("▶ Resume");
                btn1.setBackground(createButtonBg("#30D158", 16));
                btn2.setText("⏹ Reset");
                btn2.setBackground(createButtonBg("#3A181B", 16));
            } else if (STATE_COMPLETED.equals(state)) {
                stylePill(badgeTv, "✓ DONE", "#3A1518", "#FF453A");
                countTv.setText("00:00:00");
                subTv.setText("Alarm finished • Tap Start for new timer");
                btn1.setText("▶ Start");
                btn1.setBackground(createButtonBg("#D71921", 16));
                btn2.setText("◉ Auto-Sleep");
                btn2.setBackground(createButtonBg("#2C2C2E", 16));
            } else {
                stylePill(badgeTv, "READY", "#2C2C2E", "#8E8E93");
                countTv.setText(formatHhMmSs(dur));
                subTv.setText("Auto-stops when awake • 6x Watch Vibration");
                btn1.setText("▶ Start");
                btn1.setBackground(createButtonBg("#D71921", 16));
                btn2.setText("◉ Auto-Sleep");
                btn2.setBackground(createButtonBg("#2C2C2E", 16));
            }
        } catch (Throwable ignored) {}
    }

    private static void stylePill(TextView tv, String text, String bgHex, String fgHex) {
        tv.setText(text);
        tv.setTextColor(Color.parseColor(fgHex));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor(bgHex));
        bg.setCornerRadius(20);
        tv.setBackground(bg);
    }

    /**
     * Extracts real-time metrics (Heart rate: 95 bpm, Blood oxygen: 98%, Steps: 13)
     * and detects whether the Health tab is currently active using direct Flutter
     * semantics reflection and AccessibilityNodeInfo fallback.
     */
    public static void scrapeMetricsFromDecorView(View root) {
        if (root == null) return;
        try {
            ensureFlutterAccessibilityEnabled(root);
            scrapeFromFlutterSemanticsTree(root);
            AccessibilityNodeInfo node = root.createAccessibilityNodeInfo();
            if (node != null) {
                scrapeNodeRecursively(node);
                node.recycle();
            }
        } catch (Throwable ignored) {}
    }

    private static View findFlutterView(View root) {
        if (root == null) return null;
        if (root.getClass().getName().contains("FlutterView")) return root;
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View res = findFlutterView(vg.getChildAt(i));
                if (res != null) return res;
            }
        }
        return null;
    }

    private static void ensureFlutterAccessibilityEnabled(View root) {
        try {
            View fv = findFlutterView(root);
            if (fv == null) return;
            Method getEngineMethod = fv.getClass().getMethod("getAttachedFlutterEngine");
            Object engine = getEngineMethod.invoke(fv);
            if (engine != null) {
                Method getAccChan = engine.getClass().getMethod("getAccessibilityChannel");
                Object accChan = getAccChan.invoke(engine);
                if (accChan != null) {
                    Method enableMethod = accChan.getClass().getMethod("onAndroidAccessibilityEnabled");
                    enableMethod.invoke(accChan);
                }
            }
        } catch (Throwable ignored) {}
    }

    private static void scrapeFromFlutterSemanticsTree(View root) {
        try {
            View fv = findFlutterView(root);
            if (fv == null) return;
            Field abField = getDeclaredFieldRecursive(fv.getClass(), "accessibilityBridge");
            if (abField == null) return;
            abField.setAccessible(true);
            Object ab = abField.get(fv);
            if (ab == null) return;

            Field treeField = getDeclaredFieldRecursive(ab.getClass(), "flutterSemanticsTree");
            if (treeField == null) return;
            treeField.setAccessible(true);
            Map<?, ?> tree = (Map<?, ?>) treeField.get(ab);
            if (tree == null || tree.isEmpty()) return;

            for (Object node : tree.values()) {
                if (node == null) continue;
                Field labelF = getDeclaredFieldRecursive(node.getClass(), "label");
                Field valueF = getDeclaredFieldRecursive(node.getClass(), "value");
                Field flagsF = getDeclaredFieldRecursive(node.getClass(), "flags");

                String label = labelF != null ? (String) labelF.get(node) : null;
                String val = valueF != null ? (String) valueF.get(node) : null;
                long flags = flagsF != null ? flagsF.getLong(node) : 0L;
                boolean isSelected = (flags & 4L) != 0L;

                String text = (label != null ? label : "") + "\n" + (val != null ? val : "");
                if (text.trim().isEmpty()) continue;

                // 1. Tab detection
                if (text.contains("Health") && text.contains("Tab 2 of 2")) {
                    if (isSelected) {
                        sIsHealthTabActive = true;
                    }
                } else if (text.contains("My devices") && text.contains("Tab 1 of 2")) {
                    if (isSelected) {
                        sIsHealthTabActive = false;
                    }
                }

                // 2. Heart rate: "Heart rate\n95 bpm..."
                if (text.toLowerCase(Locale.US).contains("heart rate")) {
                    Matcher m = Pattern.compile("(\\d{2,3})\\s*bpm", Pattern.CASE_INSENSITIVE).matcher(text);
                    if (m.find()) {
                        int hr = Integer.parseInt(m.group(1));
                        if (hr >= 35 && hr <= 230) {
                            sLiveHeartRateBpm = hr;
                        }
                    }
                }

                // 3. Blood oxygen: "Blood oxygen\n98%..."
                if (text.toLowerCase(Locale.US).contains("blood oxygen") || text.toLowerCase(Locale.US).contains("spo2")) {
                    Matcher m = Pattern.compile("(\\d{2,3})\\s*%", Pattern.CASE_INSENSITIVE).matcher(text);
                    if (m.find()) {
                        int v = Integer.parseInt(m.group(1));
                        if (v >= 70 && v <= 100) {
                            sLiveSpo2Val = v + " %";
                        }
                    }
                }

                // 4. Steps: "Steps\n13/5000" or "Steps 13/5000"
                if (text.toLowerCase(Locale.US).contains("steps") || text.toLowerCase(Locale.US).contains("step")) {
                    Matcher m = Pattern.compile("(\\d+)\\s*/\\s*\\d+", Pattern.CASE_INSENSITIVE).matcher(text);
                    if (m.find()) {
                        sLiveStepVal = m.group(1);
                    }
                }
            }
        } catch (Throwable ignored) {}
    }

    private static Field getDeclaredFieldRecursive(Class<?> clazz, String fieldName) {
        Class<?> curr = clazz;
        while (curr != null && curr != Object.class) {
            try {
                Field f = curr.getDeclaredField(fieldName);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException e) {
                curr = curr.getSuperclass();
            }
        }
        return null;
    }

    private static void scrapeNodeRecursively(AccessibilityNodeInfo node) {
        if (node == null) return;
        try {
            CharSequence cd = node.getContentDescription();
            CharSequence txt = node.getText();
            String str = (cd != null ? cd.toString() : "") + " " + (txt != null ? txt.toString() : "");

            if (!str.isEmpty()) {
                // 1. Tab detection
                if (str.contains("Health") && str.contains("Tab 2 of 2")) {
                    if (node.isSelected()) {
                        sIsHealthTabActive = true;
                    }
                } else if (str.contains("My devices") && str.contains("Tab 1 of 2")) {
                    if (node.isSelected()) {
                        sIsHealthTabActive = false;
                    }
                }

                // 2. Heart rate detection: "Heart rate\n95 bpm..."
                if (str.toLowerCase(Locale.US).contains("heart rate")) {
                    Matcher m = Pattern.compile("(\\d{2,3})\\s*bpm", Pattern.CASE_INSENSITIVE).matcher(str);
                    if (m.find()) {
                        int hr = Integer.parseInt(m.group(1));
                        if (hr >= 35 && hr <= 230) {
                            sLiveHeartRateBpm = hr;
                        }
                    }
                }

                // 3. Blood oxygen: "Blood oxygen\n98%..."
                if (str.toLowerCase(Locale.US).contains("blood oxygen") || str.toLowerCase(Locale.US).contains("spo2")) {
                    Matcher m = Pattern.compile("(\\d{2,3})\\s*%", Pattern.CASE_INSENSITIVE).matcher(str);
                    if (m.find()) {
                        int val = Integer.parseInt(m.group(1));
                        if (val >= 70 && val <= 100) {
                            sLiveSpo2Val = val + " %";
                        }
                    }
                }

                // 4. Steps: "Steps 13/5000" or "Steps\n13"
                if (str.toLowerCase(Locale.US).contains("steps") || str.toLowerCase(Locale.US).contains("step")) {
                    Matcher m = Pattern.compile("(\\d+)\\s*/\\s*\\d+", Pattern.CASE_INSENSITIVE).matcher(str);
                    if (m.find()) {
                        sLiveStepVal = m.group(1);
                    }
                }
            }

            int count = node.getChildCount();
            for (int i = 0; i < count; i++) {
                AccessibilityNodeInfo child = node.getChild(i);
                if (child != null) {
                    scrapeNodeRecursively(child);
                    child.recycle();
                }
            }
        } catch (Throwable ignored) {}
    }

    public static SharedPreferences getPrefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    // =========================================================================
    // PHASE 5 — SLEEP TIMER SCHEDULING, STATE PERSISTENCE & RECOVERY
    // =========================================================================

    public static synchronized void startTimer(Context context, long durationMs) {
        startTimerInternal(context, durationMs, "Manual Start");
    }

    private static synchronized void startTimerInternal(Context context, long durationMs, String startTriggerReason) {
        Context appCtx = context.getApplicationContext();
        cancelSleepDetectorPoll(appCtx);
        long now = System.currentTimeMillis();
        long targetEpochMs = now + durationMs;
        long timerId = now;

        WatchHealthSnapshot snap = readWatchHealthSnapshot(appCtx);
        int baseSteps = snap.stepRows;
        int baseHr = snap.latestHrBpm > 0 ? snap.latestHrBpm : sLiveHeartRateBpm;

        SharedPreferences prefs = getPrefs(appCtx);
        prefs.edit()
                .putString("state", STATE_RUNNING)
                .putLong("duration_ms", durationMs)
                .putLong("target_epoch_ms", targetEpochMs)
                .putLong("remaining_ms", durationMs)
                .putLong("timer_id", timerId)
                .putLong("started_at_ms", now)
                .putInt("sleep_baseline_steps", baseSteps)
                .putInt("sleep_start_hr", baseHr)
                .remove("paused_reason")
                .putString("start_trigger_reason", startTriggerReason != null ? startTriggerReason : "Manual Start")
                .apply();

        scheduleAlarm(appCtx, targetEpochMs, timerId);
        Log.i(TAG, "Sleep Timer started (" + startTriggerReason + "): durationMs=" + durationMs + " target=" + targetEpochMs + " timerId=" + timerId);
    }

    /**
     * Option A: Arms the Sleep Timer to wait until the connected Nothing Watch Pro 2
     * detects resting/sleep Heart Rate (<= hrThresholdBpm) with 0 new steps (or a new
     * SleepReportDbModelTable record), then automatically starts the countdown.
     */
    public static synchronized void armTimerForWatchSleep(Context context, long durationMs, int hrThresholdBpm) {
        Context appCtx = context.getApplicationContext();
        cancelAlarm(appCtx);
        cancelSleepDetectorPoll(appCtx);

        if (hrThresholdBpm < 40 || hrThresholdBpm > 110) {
            hrThresholdBpm = 65;
        }

        long now = System.currentTimeMillis();
        WatchHealthSnapshot snap = readWatchHealthSnapshot(appCtx);

        String initialDetail = (snap.latestHrBpm > 0 ? ("Watch HR " + snap.latestHrBpm + " BPM • ") : "")
                + "Starts when HR ≤ " + hrThresholdBpm + " BPM & 0 steps";

        SharedPreferences prefs = getPrefs(appCtx);
        prefs.edit()
                .putString("state", STATE_ARMED)
                .putLong("duration_ms", durationMs)
                .putLong("target_epoch_ms", 0L)
                .putLong("remaining_ms", durationMs)
                .putLong("armed_at_ms", now)
                .putInt("armed_hr_threshold", hrThresholdBpm)
                .putInt("armed_baseline_hr_rows", snap.hrRows)
                .putLong("armed_baseline_hr_time_ms", snap.latestHrTimeMs)
                .putInt("armed_baseline_step_rows", snap.stepRows)
                .putInt("armed_baseline_sleep_rows", snap.sleepRows)
                .putLong("armed_last_check_ms", now)
                .putString("armed_status_detail", initialDetail)
                .apply();

        scheduleSleepDetectorPoll(appCtx, now + 60_000L);
        requestFlutterHealthSync(appCtx, null);
        Log.i(TAG, "Sleep Timer ARMED for Watch Sleep detection: durationMs=" + durationMs + " hrThreshold=" + hrThresholdBpm);
    }

    public static synchronized void checkWatchSleepAndAutoStart(Context context) {
        Context appCtx = context.getApplicationContext();
        SharedPreferences prefs = getPrefs(appCtx);
        String state = prefs.getString("state", STATE_IDLE);
        if (!STATE_ARMED.equals(state)) return;

        long now = System.currentTimeMillis();
        long lastCheck = prefs.getLong("armed_last_check_ms", 0L);
        if (now - lastCheck < 3000L) {
            return;
        }
        prefs.edit().putLong("armed_last_check_ms", now).apply();

        // Trigger Flutter sync opportunistically if engine is active
        if (now - sFlutterHealthCacheTimeMs > 25_000L) {
            requestFlutterHealthSync(appCtx, null);
        }

        long durationMs = prefs.getLong("duration_ms", 2L * 3600_000L);
        long armedAtMs = prefs.getLong("armed_at_ms", now);
        int hrThreshold = prefs.getInt("armed_hr_threshold", 65);
        int baseSleepRows = prefs.getInt("armed_baseline_sleep_rows", 0);
        int baseStepRows = prefs.getInt("armed_baseline_step_rows", 0);
        long baseHrTimeMs = prefs.getLong("armed_baseline_hr_time_ms", 0L);

        WatchHealthSnapshot snap = readWatchHealthSnapshot(appCtx);

        // 1. Check if SleepReportDbModelTable received a new sleep record
        if (snap.sleepRows > baseSleepRows) {
            String reason = "Watch Sleep detected at " + formatClockShort(now);
            startTimerInternal(appCtx, durationMs, reason);
            return;
        }

        // 2. Check if user walked (new step rows in StepReportDbModelTable)
        if (snap.stepRows > baseStepRows) {
            prefs.edit()
                    .putInt("armed_baseline_step_rows", snap.stepRows)
                    .putLong("armed_baseline_hr_time_ms", snap.latestHrTimeMs)
                    .putString("armed_status_detail",
                            "Movement detected at " + formatClockShort(now) + " • Waiting for stillness")
                    .apply();
            return;
        }

        // 3. Check if a new Watch Heart Rate reading arrived after arming that is <= hrThreshold with 0 steps
        if (snap.latestHrBpm > 30 && snap.latestHrTimeMs > baseHrTimeMs && snap.latestHrTimeMs >= armedAtMs - 30_000L) {
            if (snap.latestHrBpm <= hrThreshold) {
                String reason = "Sleep HR " + snap.latestHrBpm + " BPM detected at " + formatClockShort(snap.latestHrTimeMs);
                startTimerInternal(appCtx, durationMs, reason);
                return;
            } else {
                prefs.edit()
                        .putLong("armed_baseline_hr_time_ms", snap.latestHrTimeMs)
                        .putString("armed_status_detail",
                                "Watch HR " + snap.latestHrBpm + " BPM • Waiting for ≤ " + hrThreshold + " BPM")
                        .apply();
                return;
            }
        }

        // 4. Sustained resting HR on connected watch + 0 steps + stillness window (>= 2 minutes armed with recent resting HR <= threshold)
        long armedElapsedMs = now - armedAtMs;
        if (snap.watchBleConnected
                && snap.latestHrBpm > 30
                && snap.latestHrBpm <= hrThreshold
                && (now - snap.latestHrTimeMs) <= 15L * 60_000L
                && armedElapsedMs >= 120_000L) {
            String reason = "Resting HR " + snap.latestHrBpm + " BPM • Auto-started at " + formatClockShort(now);
            startTimerInternal(appCtx, durationMs, reason);
            return;
        }

        // Update live monitoring status detail
        String detail = "Watch HR " + (snap.latestHrBpm > 0 ? (snap.latestHrBpm + " BPM") : "--")
                + " • Target ≤ " + hrThreshold + " BPM • Armed " + formatHhMmSs(armedElapsedMs);
        prefs.edit().putString("armed_status_detail", detail).apply();
    }

    private static final class WatchHealthSnapshot {
        boolean watchBleConnected;
        int hrRows;
        int latestHrBpm;
        long latestHrTimeMs;
        int stepRows;
        int sleepRows;
    }

    private static WatchHealthSnapshot readWatchHealthSnapshot(Context context) {
        WatchHealthSnapshot snap = new WatchHealthSnapshot();
        try {
            BluetoothManager bm = (BluetoothManager) context.getSystemService(Context.BLUETOOTH_SERVICE);
            if (bm != null) {
                List<BluetoothDevice> gattDevs = bm.getConnectedDevices(BluetoothProfile.GATT);
                if (gattDevs != null && !gattDevs.isEmpty()) {
                    snap.watchBleConnected = true;
                }
            }
        } catch (Throwable ignored) {}

        List<File> dbFiles = findSqliteDatabases(context);
        File nothingXDb = null;
        for (File f : dbFiles) {
            if ("nothing_x.db".equalsIgnoreCase(f.getName())) {
                nothingXDb = f;
                break;
            }
        }
        if (nothingXDb == null || !nothingXDb.exists()) {
            return snap;
        }

        SQLiteDatabase db = null;
        try {
            db = SQLiteDatabase.openDatabase(nothingXDb.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);
            snap.hrRows = countRowsSafe(db, "HeartRateReportDbModelTable");
            snap.stepRows = countRowsSafe(db, "StepReportDbModelTable");
            snap.sleepRows = countRowsSafe(db, "SleepReportDbModelTable");

            Cursor c = null;
            try {
                MetricPoint addUpHr = queryAddUpMetric(db, "heartRate");
                if (addUpHr != null && addUpHr.primaryValue != null) {
                    try {
                        snap.latestHrBpm = Integer.parseInt(addUpHr.primaryValue);
                        snap.latestHrTimeMs = addUpHr.epochMs;
                    } catch (Throwable ignored) {}
                }
                if (snap.latestHrBpm <= 0) {
                    MetricPoint hrPoint = queryLatestMetricPoint(db, "HeartRateReportDbModelTable");
                    if (hrPoint != null && hrPoint.primaryValue != null) {
                        try {
                            snap.latestHrBpm = Integer.parseInt(hrPoint.primaryValue);
                            snap.latestHrTimeMs = hrPoint.epochMs;
                        } catch (Throwable ignored) {}
                    }
                }
                if (snap.latestHrBpm <= 0) {
                    c = db.rawQuery("SELECT value, time FROM \"HeartRateReportDbModelTable\" ORDER BY time DESC LIMIT 1", null);
                    if (c != null && c.moveToFirst()) {
                        snap.latestHrBpm = c.getInt(0);
                        snap.latestHrTimeMs = normalizeEpochMs(c.getLong(1));
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                if (c != null) try { c.close(); } catch (Throwable ignored) {}
            }
            if (sLiveHeartRateBpm > 0) {
                snap.latestHrBpm = sLiveHeartRateBpm;
                snap.latestHrTimeMs = System.currentTimeMillis();
            }
        } catch (Throwable ignored) {
        } finally {
            if (db != null) try { db.close(); } catch (Throwable ignored) {}
        }
        return snap;
    }

    private static int countRowsSafe(SQLiteDatabase db, String table) {
        Cursor c = null;
        try {
            c = db.rawQuery("SELECT COUNT(*) FROM \"" + table + "\"", null);
            if (c != null && c.moveToFirst()) {
                return c.getInt(0);
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
        return 0;
    }

    private static PendingIntent buildSleepPollPendingIntent(Context context) {
        Intent intent = new Intent();
        intent.setClassName(context.getPackageName(), "com.nothing.nt_lifecycle.receiver.KeepAliveReceiver");
        intent.setAction(ACTION_WAKE_UP);
        intent.putExtra(EXTRA_SLEEP_DETECTOR_POLL, true);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= 23) {
            flags |= PendingIntent.FLAG_IMMUTABLE;
        }
        return PendingIntent.getBroadcast(context, REQ_CODE_SLEEP_POLL, intent, flags);
    }

    private static void scheduleSleepDetectorPoll(Context context, long triggerAtMs) {
        try {
            AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            if (am == null) return;
            PendingIntent pi = buildSleepPollPendingIntent(context);
            if (Build.VERSION.SDK_INT >= 23) {
                am.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAtMs, pi);
            } else {
                am.set(AlarmManager.RTC_WAKEUP, triggerAtMs, pi);
            }
        } catch (Throwable t) {
            Log.w(TAG, "scheduleSleepDetectorPoll error: " + t.getMessage());
        }
    }

    private static void cancelSleepDetectorPoll(Context context) {
        try {
            AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            if (am != null) {
                am.cancel(buildSleepPollPendingIntent(context));
            }
        } catch (Throwable ignored) {}
    }

    public static synchronized void pauseTimer(Context context) {
        Context appCtx = context.getApplicationContext();
        SharedPreferences prefs = getPrefs(appCtx);
        String state = prefs.getString("state", STATE_IDLE);
        if (!STATE_RUNNING.equals(state)) return;

        long target = prefs.getLong("target_epoch_ms", 0L);
        long remaining = Math.max(1000L, target - System.currentTimeMillis());
        cancelAlarm(appCtx);

        prefs.edit()
                .putString("state", STATE_PAUSED)
                .putLong("remaining_ms", remaining)
                .putLong("target_epoch_ms", 0L)
                .apply();
        Log.i(TAG, "Sleep Timer paused: remainingMs=" + remaining);
    }

    public static synchronized void resumeTimer(Context context) {
        Context appCtx = context.getApplicationContext();
        SharedPreferences prefs = getPrefs(appCtx);
        String state = prefs.getString("state", STATE_IDLE);
        if (!STATE_PAUSED.equals(state)) return;

        long remaining = prefs.getLong("remaining_ms", 0L);
        if (remaining <= 0L) remaining = 60_000L;
        long now = System.currentTimeMillis();
        long targetEpochMs = now + remaining;
        long timerId = prefs.getLong("timer_id", now);

        prefs.edit()
                .putString("state", STATE_RUNNING)
                .putLong("target_epoch_ms", targetEpochMs)
                .apply();

        scheduleAlarm(appCtx, targetEpochMs, timerId);
        Log.i(TAG, "Sleep Timer resumed: remainingMs=" + remaining + " target=" + targetEpochMs);
    }

    public static synchronized void cancelTimer(Context context) {
        Context appCtx = context.getApplicationContext();
        stopWakeUpAlarmBurst(appCtx);
        cancelAlarm(appCtx);
        cancelSleepDetectorPoll(appCtx);
        SharedPreferences prefs = getPrefs(appCtx);
        prefs.edit()
                .putString("state", STATE_IDLE)
                .putLong("target_epoch_ms", 0L)
                .putLong("remaining_ms", 0L)
                .apply();
        Log.i(TAG, "Sleep Timer cancelled");
    }

    private static PendingIntent buildAlarmPendingIntent(Context context, long timerId) {
        Intent intent = new Intent();
        intent.setClassName(context.getPackageName(), "com.nothing.nt_lifecycle.receiver.KeepAliveReceiver");
        intent.setAction(ACTION_WAKE_UP);
        intent.putExtra(EXTRA_SLEEP_TIMER_ALARM, true);
        intent.putExtra(EXTRA_TIMER_ID, timerId);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= 23) {
            flags |= PendingIntent.FLAG_IMMUTABLE;
        }
        return PendingIntent.getBroadcast(context, NOTIF_ID_SLEEP_TIMER, intent, flags);
    }

    private static void scheduleAlarm(Context context, long targetEpochMs, long timerId) {
        AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        if (am == null) return;
        PendingIntent pi = buildAlarmPendingIntent(context, timerId);

        try {
            if (Build.VERSION.SDK_INT >= 31 && !am.canScheduleExactAlarms()) {
                am.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, targetEpochMs, pi);
                Log.i(TAG, "Scheduled via setAndAllowWhileIdle for " + targetEpochMs);
                return;
            }
            Intent showIntent = new Intent(context, TestActivity.class);
            int showFlags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 23) showFlags |= PendingIntent.FLAG_IMMUTABLE;
            PendingIntent showPi = PendingIntent.getActivity(context, NOTIF_ID_SLEEP_TIMER + 10, showIntent, showFlags);
            AlarmManager.AlarmClockInfo clockInfo = new AlarmManager.AlarmClockInfo(targetEpochMs, showPi);
            am.setAlarmClock(clockInfo, pi);
            Log.i(TAG, "Scheduled exact AlarmClock for " + targetEpochMs);
        } catch (Throwable t1) {
            try {
                if (Build.VERSION.SDK_INT >= 23) {
                    am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, targetEpochMs, pi);
                } else {
                    am.setExact(AlarmManager.RTC_WAKEUP, targetEpochMs, pi);
                }
            } catch (Throwable t2) {
                if (Build.VERSION.SDK_INT >= 23) {
                    am.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, targetEpochMs, pi);
                } else {
                    am.set(AlarmManager.RTC_WAKEUP, targetEpochMs, pi);
                }
            }
        }
    }

    private static void cancelAlarm(Context context) {
        try {
            AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            if (am != null) {
                PendingIntent pi = buildAlarmPendingIntent(context, 0L);
                am.cancel(pi);
            }
        } catch (Throwable t) {
            Log.e(TAG, "cancelAlarm error", t);
        }
    }

    /**
     * Hooked into KeepAliveReceiver.onReceive(Context, Intent).
     * Returns true if the broadcast was a Sleep Timer alarm so KeepAliveReceiver returns immediately.
     */
    public static boolean handleBroadcast(Context context, Intent intent) {
        if (context == null || intent == null) return false;
        try {
            if (intent.getBooleanExtra(EXTRA_SLEEP_DETECTOR_POLL, false)) {
                PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
                PowerManager.WakeLock wl = null;
                if (pm != null) {
                    wl = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "nothingx:sleep_poll_wl");
                    wl.acquire(8_000L);
                }
                try {
                    checkWatchSleepAndAutoStart(context);
                    SharedPreferences prefs = getPrefs(context);
                    if (STATE_ARMED.equals(prefs.getString("state", STATE_IDLE))) {
                        scheduleSleepDetectorPoll(context, System.currentTimeMillis() + 60_000L);
                    }
                } finally {
                    if (wl != null && wl.isHeld()) wl.release();
                }
                return true;
            }

            if (!intent.getBooleanExtra(EXTRA_SLEEP_TIMER_ALARM, false)) {
                // Also opportunistically check if an active timer has expired or armed sleep detected
                ensureTimerRestored(context);
                return false;
            }

            PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
            PowerManager.WakeLock wl = null;
            if (pm != null) {
                wl = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "nothingx:sleeptimer_wl");
                wl.acquire(10_000L);
            }
            try {
                completeTimerAndNotifyOnce(context, intent.getLongExtra(EXTRA_TIMER_ID, -1L));
            } finally {
                if (wl != null && wl.isHeld()) {
                    wl.release();
                }
            }
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "handleBroadcast error", t);
            return false;
        }
    }

    /**
     * Hooked into RebootReceiver.onReceive(Context, Intent) on BOOT_COMPLETED / MY_PACKAGE_REPLACED.
     */
    public static void handleRebootBroadcast(Context context, Intent intent) {
        if (context == null) return;
        try {
            Log.i(TAG, "handleRebootBroadcast action=" + (intent != null ? intent.getAction() : "null"));
            ensureTimerRestored(context.getApplicationContext());
        } catch (Throwable t) {
            Log.e(TAG, "handleRebootBroadcast error", t);
        }
    }

    public static synchronized void ensureTimerRestored(Context context) {
        try {
            SharedPreferences prefs = getPrefs(context);
            String state = prefs.getString("state", STATE_IDLE);
            if (STATE_ARMED.equals(state)) {
                checkWatchSleepAndAutoStart(context);
                if (STATE_ARMED.equals(prefs.getString("state", STATE_IDLE))) {
                    scheduleSleepDetectorPoll(context, System.currentTimeMillis() + 60_000L);
                }
                return;
            }
            if (!STATE_RUNNING.equals(state)) return;

            long target = prefs.getLong("target_epoch_ms", 0L);
            long timerId = prefs.getLong("timer_id", 0L);
            long now = System.currentTimeMillis();
            if (target <= now) {
                completeTimerAndNotifyOnce(context, timerId);
            } else {
                scheduleAlarm(context, target, timerId);
            }
        } catch (Throwable t) {
            Log.e(TAG, "ensureTimerRestored error", t);
        }
    }

    public static synchronized void checkAndCompleteIfExpired(final Context context) {
        SharedPreferences prefs = getPrefs(context);
        String state = prefs.getString("state", STATE_IDLE);
        if (STATE_ARMED.equals(state)) {
            long now = System.currentTimeMillis();
            if (now - sLastArmedPollMs >= 10_000L) {
                sLastArmedPollMs = now;
                final Context appCtx = context.getApplicationContext();
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            checkWatchSleepAndAutoStart(appCtx);
                        } catch (Throwable ignored) {}
                    }
                }).start();
            }
            return;
        }
        if (STATE_RUNNING.equals(state)) {
            checkAwakeAndAutoStopIfNeeded(context);
            long target = prefs.getLong("target_epoch_ms", 0L);
            long timerId = prefs.getLong("timer_id", 0L);
            if (target > 0L && System.currentTimeMillis() >= target) {
                completeTimerAndNotifyOnce(context, timerId);
            }
        }
    }

    /**
     * Checks if the user has woken up (elevated heart rate or steps on watch)
     * while the Sleep Timer is running, and automatically pauses the countdown.
     */
    public static synchronized void checkAwakeAndAutoStopIfNeeded(final Context context) {
        final Context appCtx = context.getApplicationContext();
        SharedPreferences prefs = getPrefs(appCtx);
        String state = prefs.getString("state", STATE_IDLE);
        if (!STATE_RUNNING.equals(state)) return;

        long startedAt = prefs.getLong("started_at_ms", 0L);
        long now = System.currentTimeMillis();
        // Allow a grace period of 90 seconds after starting so laying down doesn't trip awake immediately
        if (startedAt > 0L && (now - startedAt < 90_000L)) {
            return;
        }

        int hrThreshold = prefs.getInt("armed_hr_threshold", 65);
        int sleepBaseSteps = prefs.getInt("sleep_baseline_steps", -1);

        WatchHealthSnapshot snap = readWatchHealthSnapshot(appCtx);
        int currentHr = snap.latestHrBpm > 0 ? snap.latestHrBpm : sLiveHeartRateBpm;
        int currentSteps = snap.stepRows;

        boolean isAwake = false;
        String awakeReason = "";

        // 1. Walking / steps detected
        if (sleepBaseSteps >= 0 && currentSteps > sleepBaseSteps + 3) {
            isAwake = true;
            awakeReason = "Movement / walking detected on watch";
        }
        // 2. High awake heart rate (e.g. >= 78 BPM or >= hrThreshold + 12 BPM)
        else if (currentHr > 0 && currentHr >= Math.max(78, hrThreshold + 12)) {
            isAwake = true;
            awakeReason = "Awake heart rate (" + currentHr + " BPM)";
        }

        if (isAwake) {
            long target = prefs.getLong("target_epoch_ms", 0L);
            long remaining = Math.max(1000L, target - now);
            cancelAlarm(appCtx);

            prefs.edit()
                    .putString("state", STATE_PAUSED)
                    .putLong("remaining_ms", remaining)
                    .putLong("target_epoch_ms", 0L)
                    .putString("paused_reason", awakeReason)
                    .apply();

            Log.i(TAG, "Sleep timer auto-paused because user is awake: " + awakeReason);
            postPhoneAndWatchNotification(
                    appCtx,
                    NOTIF_ID_SLEEP_TIMER,
                    "Sleep Timer Paused • Awake Detected",
                    awakeReason + " — Timer paused. Tap Resume when sleeping.",
                    false
            );
        }
    }

    private static synchronized void completeTimerAndNotifyOnce(Context context, long incomingTimerId) {
        SharedPreferences prefs = getPrefs(context);
        long savedTimerId = prefs.getLong("timer_id", 0L);
        long notifiedForId = prefs.getLong("notified_for_id", -1L);
        long durationMs = prefs.getLong("duration_ms", 0L);

        long effectiveId = savedTimerId != 0L ? savedTimerId : incomingTimerId;
        if (effectiveId != 0L && effectiveId == notifiedForId) {
            Log.i(TAG, "Duplicate notification prevented for timerId=" + effectiveId);
            return;
        }

        prefs.edit()
                .putString("state", STATE_COMPLETED)
                .putLong("remaining_ms", 0L)
                .putLong("target_epoch_ms", 0L)
                .putLong("notified_for_id", effectiveId)
                .putLong("last_completed_at_ms", System.currentTimeMillis())
                .apply();

        String body = "Sleep Timer (" + formatDurationShort(durationMs) + ") finished! Wake up!";
        startWakeUpAlarmBurst(context, "⏰ WAKE UP • Nothing X", body, 6);
    }

    public static boolean isWakeUpBurstActive() {
        return sWakeUpBurstActive;
    }

    public static int getWakeUpBurstCurrentWave() {
        return sWakeUpBurstCurrentWave;
    }

    public static int getWakeUpBurstTotalWaves() {
        return sWakeUpBurstTotalWaves;
    }

    /**
     * Triggers a 6-wave repeated notification & vibration burst (every 3.5 seconds)
     * so the connected CMF Watch Pro 2 vibrates 6 distinct times and the phone
     * plays an audible wake-up alarm + strong vibration.
     */
    public static synchronized void startWakeUpAlarmBurst(
            final Context context,
            final String baseTitle,
            final String baseMessage,
            final int totalWaves
    ) {
        final Context appCtx = context.getApplicationContext();
        stopWakeUpAlarmBurst(appCtx);

        final int waves = (totalWaves >= 4 && totalWaves <= 10) ? totalWaves : 6;
        sWakeUpBurstActive = true;
        sWakeUpBurstCurrentWave = 1;
        sWakeUpBurstTotalWaves = waves;

        // Acquire wake lock + start phone alarm ringtone on background thread to avoid UI block
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    PowerManager pm = (PowerManager) appCtx.getSystemService(Context.POWER_SERVICE);
                    if (pm != null) {
                        PowerManager.WakeLock wl = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "nothingx:wakeup_burst_wl");
                        wl.acquire(waves * 4200L);
                    }
                } catch (Throwable ignored) {}

                try {
                    Uri alarmUri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM);
                    if (alarmUri == null) {
                        alarmUri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
                    }
                    if (alarmUri != null && sWakeUpBurstActive) {
                        Ringtone r = RingtoneManager.getRingtone(appCtx, alarmUri);
                        if (r != null && sWakeUpBurstActive) {
                            if (Build.VERSION.SDK_INT >= 21) {
                                r.setAudioAttributes(new AudioAttributes.Builder()
                                        .setUsage(AudioAttributes.USAGE_ALARM)
                                        .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                                        .build());
                            }
                            r.play();
                            sActiveAlarmRingtone = r;
                        }
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "Ringtone play note: " + t.getMessage());
                }
            }
        }).start();

        // Schedule 6 consecutive Watch + Phone notification waves spaced 3.5 seconds apart
        for (int i = 1; i <= waves; i++) {
            final int waveNum = i;
            long delayMs = (i - 1) * 3500L;
            sBurstHandler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    if (!sWakeUpBurstActive) return;
                    sWakeUpBurstCurrentWave = waveNum;

                    final String waveTitle = baseTitle + " [" + waveNum + "/" + waves + "]";
                    final String waveMsg = baseMessage + " (Alert " + waveNum + " of " + waves + " • "
                            + formatClockShort(System.currentTimeMillis()) + ")";
                    final int notifId = 40510 + waveNum;

                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            if (!sWakeUpBurstActive) return;
                            postPhoneAndWatchNotification(appCtx, notifId, waveTitle, waveMsg, true);
                            vibratePhoneStrong(appCtx);
                        }
                    }).start();

                    if (waveNum >= waves) {
                        sBurstHandler.postDelayed(new Runnable() {
                            @Override
                            public void run() {
                                stopWakeUpAlarmBurst(appCtx);
                            }
                        }, 4000L);
                    }
                }
            }, delayMs);
        }
    }

    public static synchronized void stopWakeUpAlarmBurst(Context context) {
        sWakeUpBurstActive = false;
        sWakeUpBurstCurrentWave = 0;
        sBurstHandler.removeCallbacksAndMessages(null);
        try {
            if (sActiveAlarmRingtone != null) {
                if (sActiveAlarmRingtone.isPlaying()) {
                    sActiveAlarmRingtone.stop();
                }
                sActiveAlarmRingtone = null;
            }
        } catch (Throwable ignored) {}
        try {
            if (context != null) {
                Vibrator vib = (Vibrator) context.getApplicationContext().getSystemService(Context.VIBRATOR_SERVICE);
                if (vib != null) vib.cancel();
            }
        } catch (Throwable ignored) {}
    }

    private static void vibratePhoneStrong(Context context) {
        try {
            Vibrator vib = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
            if (vib == null || !vib.hasVibrator()) return;
            long[] pattern = new long[]{0, 500, 200, 500, 200, 600};
            if (Build.VERSION.SDK_INT >= 26) {
                AudioAttributes attrs = new AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_ALARM)
                        .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                        .build();
                vib.vibrate(VibrationEffect.createWaveform(pattern, -1), attrs);
            } else {
                vib.vibrate(pattern, -1);
            }
        } catch (Throwable ignored) {}
    }

    // =========================================================================
    // PHASE 7 — NOTHING WATCH PRO 2 NOTIFICATION DELIVERY & TEST INFRASTRUCTURE
    // =========================================================================

    public static String postPhoneAndWatchNotification(
            Context context,
            int notificationId,
            String title,
            String message,
            boolean alsoTriggerDirectWatchBridgeIfIdle
    ) {
        StringBuilder status = new StringBuilder();
        Context appCtx = context.getApplicationContext();
        try {
            NotificationManager nm = (NotificationManager) appCtx.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) {
                return "ERROR: NotificationManager unavailable";
            }

            if (Build.VERSION.SDK_INT >= 26) {
                NotificationChannel channel = new NotificationChannel(
                        CHANNEL_ID,
                        "Nothing X Sleep Timer & Watch Alerts",
                        NotificationManager.IMPORTANCE_HIGH
                );
                channel.setDescription("Notifications for Nothing X Sleep Timer and Watch Pro 2 alerts");
                channel.enableVibration(true);
                channel.setVibrationPattern(new long[]{0, 300, 150, 300});
                channel.setLockscreenVisibility(Notification.VISIBILITY_PUBLIC);
                nm.createNotificationChannel(channel);
            }

            Intent openIntent = new Intent(appCtx, TestActivity.class);
            openIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            int piFlags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 23) piFlags |= PendingIntent.FLAG_IMMUTABLE;
            PendingIntent contentPi = PendingIntent.getActivity(appCtx, notificationId, openIntent, piFlags);

            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= 26) {
                builder = new Notification.Builder(appCtx, CHANNEL_ID);
            } else {
                builder = new Notification.Builder(appCtx);
                builder.setPriority(Notification.PRIORITY_HIGH);
            }

            int iconRes = appCtx.getApplicationInfo().icon;
            if (iconRes == 0) iconRes = android.R.drawable.ic_lock_idle_alarm;

            builder.setSmallIcon(iconRes)
                    .setContentTitle(title)
                    .setContentText(message)
                    .setStyle(new Notification.BigTextStyle().bigText(message))
                    .setContentIntent(contentPi)
                    .setWhen(System.currentTimeMillis())
                    .setShowWhen(true)
                    .setAutoCancel(true)
                    .setOngoing(false)
                    .setDefaults(Notification.DEFAULT_ALL);

            if (Build.VERSION.SDK_INT >= 21) {
                builder.setCategory(Notification.CATEGORY_REMINDER);
                builder.setVisibility(Notification.VISIBILITY_PUBLIC);
            }

            Notification notification = builder.build();
            // Ensure FLAG_AUTO_CANCEL is set and FLAG_ONGOING_EVENT is cleared so
            // NothingNotificationService.isNotificationOnGoing() allows forwarding to Watch Pro 2
            notification.flags |= Notification.FLAG_AUTO_CANCEL;
            notification.flags &= ~Notification.FLAG_ONGOING_EVENT;
            notification.flags &= ~Notification.FLAG_NO_CLEAR;

            nm.notify(notificationId, notification);
            status.append("Phone Notification posted (ID=").append(notificationId).append(", channel=").append(CHANNEL_ID).append(").\n");

            if (alsoTriggerDirectWatchBridgeIfIdle) {
                String bridgeResult = forwardToWatchBridgeDirectly(appCtx, notificationId, title, message, "com.nothing.smartcenter");
                status.append(bridgeResult);
            }
        } catch (Throwable t) {
            Log.e(TAG, "postPhoneAndWatchNotification error", t);
            status.append("Error posting notification: ").append(t.getMessage());
        }
        return status.toString();
    }

    /**
     * Invokes NothingNotificationManager's registered StatusBarNotificationListeners
     * (NtSystemRuntimePlugin$notificationListener$1 -> NtSystemRuntimeFlutterApi.onNotificationReceive)
     * so the connected Nothing Watch Pro 2 receives the notification payload via Nothing X's native bridge.
     */
    public static String forwardToWatchBridgeDirectly(
            Context context,
            int notificationId,
            String title,
            String message,
            String packageNameOverride
    ) {
        try {
            ClassLoader cl = context.getClassLoader();
            Class<?> mgrClass = Class.forName("com.nothing.nt_system_runtime.notify.NothingNotificationManager", false, cl);
            Field instanceField = mgrClass.getDeclaredField("INSTANCE");
            instanceField.setAccessible(true);
            Object mgrInstance = instanceField.get(null);

            Method getListeners = mgrClass.getDeclaredMethod("getListeners");
            getListeners.setAccessible(true);
            List<?> listeners = (List<?>) getListeners.invoke(mgrInstance);

            if (listeners == null || listeners.isEmpty()) {
                return "Watch Bridge: 0 active StatusBarNotificationListeners registered (Flutter engine or Watch BLE idle). Notification will be picked up by NothingNotificationService if Notification Access is enabled.";
            }

            Class<?> infoClass = Class.forName("NtNotificationInfo", false, cl);
            Constructor<?> ctor = infoClass.getDeclaredConstructor(
                    Long.class,
                    String.class,
                    Long.class,
                    String.class,
                    String.class,
                    Boolean.class,
                    String.class,
                    String.class,
                    Long.class,
                    List.class
            );
            ctor.setAccessible(true);

            long now = System.currentTimeMillis();
            String pkg = (packageNameOverride != null && !packageNameOverride.isEmpty())
                    ? packageNameOverride
                    : context.getPackageName();
            String uniqueKey = pkg + now + title;

            Object ntInfo = ctor.newInstance(
                    Long.valueOf(notificationId),
                    pkg,
                    Long.valueOf(now),
                    title,
                    message,
                    Boolean.FALSE,
                    uniqueKey,
                    CHANNEL_ID,
                    Long.valueOf(0L),
                    Collections.emptyList()
            );

            Class<?> listenerInterface = Class.forName("com.nothing.nt_system_runtime.notify.StatusBarNotificationListener", false, cl);
            Method onReceive = listenerInterface.getDeclaredMethod("onReceive", infoClass);
            onReceive.setAccessible(true);

            int dispatched = 0;
            for (Object listener : new ArrayList<Object>(listeners)) {
                if (listener != null) {
                    onReceive.invoke(listener, ntInfo);
                    dispatched++;
                }
            }
            return "Watch Bridge: Dispatched NtNotificationInfo (pkg=" + pkg + ", id=" + notificationId + ") to " + dispatched + " active listener(s) -> NtSystemRuntimeFlutterApi.onNotificationReceive.";
        } catch (Throwable t) {
            Log.e(TAG, "forwardToWatchBridgeDirectly error", t);
            return "Watch Bridge note: " + t.getClass().getSimpleName() + ": " + t.getMessage();
        }
    }

    // =========================================================================
    // PHASE 6 — HEALTH MONITORING INVESTIGATION & REAL DATA ACCESS
    // =========================================================================

    public static void requestFlutterHealthSync(Context context, final Runnable onUpdated) {
        try {
            ClassLoader cl = context.getClassLoader();
            Class<?> cacheClass = Class.forName("io.flutter.embedding.engine.FlutterEngineCache", false, cl);
            Object cacheInstance = cacheClass.getDeclaredMethod("getInstance").invoke(null);
            final Object flutterEngine = cacheClass.getDeclaredMethod("get", String.class).invoke(cacheInstance, "main");
            if (flutterEngine == null) {
                return;
            }

            // Pulse Flutter LifecycleChannel (at most once every 15s) so _FitnessProvider
            // triggers a real-time BLE watch sync even while TestActivity is in foreground.
            long nowPulse = System.currentTimeMillis();
            if (nowPulse - sLastLifecyclePulseMs >= 15_000L) {
                sLastLifecyclePulseMs = nowPulse;
                try {
                    final Object lifecycleChannel = flutterEngine.getClass().getDeclaredMethod("getLifecycleChannel").invoke(flutterEngine);
                    if (lifecycleChannel != null) {
                        lifecycleChannel.getClass().getDeclaredMethod("appIsInactive").invoke(lifecycleChannel);
                        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                            @Override
                            public void run() {
                                try {
                                    lifecycleChannel.getClass().getDeclaredMethod("appIsResumed").invoke(lifecycleChannel);
                                    lifecycleChannel.getClass().getDeclaredMethod("aWindowIsFocused").invoke(lifecycleChannel);
                                } catch (Throwable ignored) {}
                            }
                        }, 120L);
                    }
                } catch (Throwable ignored) {}
            }

            Object dartExecutor = flutterEngine.getClass().getDeclaredMethod("getDartExecutor").invoke(flutterEngine);
            Object binaryMessenger = dartExecutor.getClass().getDeclaredMethod("getBinaryMessenger").invoke(dartExecutor);

            Class<?> messengerInterface = Class.forName("io.flutter.plugin.common.BinaryMessenger", false, cl);
            Class<?> apiClass = Class.forName("com.nothing.generate.NtSyncHealthFlutterApi", false, cl);
            Constructor<?> apiCtor = apiClass.getDeclaredConstructor(messengerInterface, String.class);
            Object apiInstance = apiCtor.newInstance(binaryMessenger, "");

            Class<?> syncTypeClass = Class.forName("com.nothing.generate.SyncType", false, cl);
            Class<?> func1Interface = Class.forName("kotlin.jvm.functions.Function1", false, cl);
            Method getSyncDataMethod = apiClass.getDeclaredMethod("getSyncData", syncTypeClass, func1Interface);

            String[] typesToQuery = new String[]{
                    "HEART_RATE",
                    "OXYGEN_SATURATION",
                    "STEP",
                    "SLEEP",
                    "EXERCISE",
                    "RESTING_HEART",
                    "RESPIRATORY_RATE",
                    "BODY_TEMPERATURE"
            };

            for (final String typeName : typesToQuery) {
                try {
                    Object enumVal = Enum.valueOf((Class<Enum>) syncTypeClass, typeName);
                    Object callbackProxy = Proxy.newProxyInstance(
                            cl,
                            new Class<?>[]{func1Interface},
                            new InvocationHandler() {
                                @Override
                                public Object invoke(Object proxy, Method method, Object[] args) {
                                    if (args != null && args.length == 1 && args[0] != null) {
                                        parseFlutterSyncResult(typeName, args[0]);
                                        if (onUpdated != null) {
                                            new Handler(Looper.getMainLooper()).post(onUpdated);
                                        }
                                    }
                                    return null;
                                }
                            }
                    );
                    getSyncDataMethod.invoke(apiInstance, enumVal, callbackProxy);
                } catch (Throwable inner) {
                    Log.w(TAG, "SyncType query skipped for " + typeName + ": " + inner.getMessage());
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "requestFlutterHealthSync error: " + t.getMessage());
        }
    }

    private static void parseFlutterSyncResult(String typeName, Object kotlinResultBox) {
        try {
            Object rawValue = kotlinResultBox;
            try {
                Field valField = kotlinResultBox.getClass().getDeclaredField("value");
                valField.setAccessible(true);
                rawValue = valField.get(kotlinResultBox);
            } catch (Throwable ignored) {}

            if (rawValue instanceof List) {
                List<?> list = (List<?>) rawValue;
                if (list.isEmpty()) {
                    sFlutterHealthCache.put(typeName, "0 records returned by NtSyncHealthFlutterApi");
                } else {
                    Object latest = list.get(list.size() - 1);
                    Method getJson = latest.getClass().getDeclaredMethod("getJsonData");
                    Method getStart = latest.getClass().getDeclaredMethod("getStart");
                    Method getEnd = latest.getClass().getDeclaredMethod("getEnd");
                    String rawJson = String.valueOf(getJson.invoke(latest));
                    Long start = (Long) getStart.invoke(latest);
                    Long end = (Long) getEnd.invoke(latest);
                    long ts = (end != null && end > 0) ? end : (start != null ? start : 0L);
                    long normTs = normalizeEpochMs(ts);
                    if (rawJson != null && !rawJson.isEmpty() && !"null".equalsIgnoreCase(rawJson)) {
                        sFlutterRawJsonCache.put(typeName, rawJson);
                        if (normTs > 0) {
                            sFlutterTimestampCache.put(typeName, normTs);
                        }
                    }
                    String tsStr = normTs > 0 ? formatTime(normTs) : "no-timestamp";
                    String json = rawJson != null ? rawJson : "";
                    if (json.length() > 160) json = json.substring(0, 160) + "...";
                    sFlutterHealthCache.put(
                            typeName,
                            "[PERIODICALLY UPDATED] " + list.size() + " synced record(s) | Latest (" + tsStr + "): " + json
                    );
                }
                sFlutterHealthCacheTimeMs = System.currentTimeMillis();
            }
        } catch (Throwable t) {
            Log.w(TAG, "parseFlutterSyncResult error", t);
        }
    }

    /**
     * Collects a complete, truthful report of Watch BLE state, local SQLite health tables
     * in nothing_x.db, and NtSyncHealthFlutterApi readings. Never invents sensor values.
     */
    public static String buildHealthMonitoringReport(Context context) {
        StringBuilder sb = new StringBuilder();
        Context appCtx = context.getApplicationContext();

        // 1. Watch Bluetooth / BLE Connection Inspection
        sb.append("━━ WATCH & BLE CONNECTION STATUS ━━\n");
        boolean watchConnected = false;
        try {
            BluetoothManager bm = (BluetoothManager) appCtx.getSystemService(Context.BLUETOOTH_SERVICE);
            BluetoothAdapter adapter = bm != null ? bm.getAdapter() : BluetoothAdapter.getDefaultAdapter();
            if (adapter == null || !adapter.isEnabled()) {
                sb.append("• Bluetooth Adapter: Disabled or unavailable\n");
            } else {
                sb.append("• Bluetooth Adapter: Enabled\n");
                try {
                    if (bm != null) {
                        List<BluetoothDevice> gattDevs = bm.getConnectedDevices(BluetoothProfile.GATT);
                        if (gattDevs != null && !gattDevs.isEmpty()) {
                            for (BluetoothDevice d : gattDevs) {
                                String name = d.getName();
                                sb.append("• Connected BLE GATT Device: ")
                                        .append(name != null ? name : "Unknown")
                                        .append(" [").append(d.getAddress()).append("]\n");
                                watchConnected = true;
                            }
                        } else {
                            sb.append("• Connected BLE GATT Devices: 0\n");
                        }
                    }
                    Set<BluetoothDevice> bonded = adapter.getBondedDevices();
                    if (bonded != null && !bonded.isEmpty()) {
                        int count = 0;
                        for (BluetoothDevice d : bonded) {
                            String name = d.getName();
                            if (name != null && (name.toLowerCase(Locale.US).contains("watch")
                                    || name.toLowerCase(Locale.US).contains("cmf")
                                    || name.toLowerCase(Locale.US).contains("nothing"))) {
                                sb.append("• Paired Nothing/CMF Wearable: ").append(name)
                                        .append(" [").append(d.getAddress()).append("]\n");
                                count++;
                            }
                        }
                        if (count == 0) {
                            sb.append("• Paired Nothing/CMF Wearables: 0 (Total bonded BT devices: ").append(bonded.size()).append(")\n");
                        }
                    }
                } catch (SecurityException se) {
                    sb.append("• Bluetooth query requires BLUETOOTH_CONNECT permission (").append(se.getMessage()).append(")\n");
                }
            }
        } catch (Throwable t) {
            sb.append("• Bluetooth status check error: ").append(t.getMessage()).append("\n");
        }

        sb.append("• Real-Time Streaming Note: Nothing Watch Pro 2 (model D398 / ID 34F72851) ")
                .append(watchConnected
                        ? "is connected over BLE; live readings update when watch measurement/sync runs.\n\n"
                        : "is not currently streaming over BLE. Real-time live sensor stream is [UNAVAILABLE] until the watch is connected.\n\n");

        // 2. Local SQLite Database Inspection (nothing_x.db & app_flutter databases)
        sb.append("━━ HEALTH METRICS (ACTUAL READINGS & TIMESTAMPS) ━━\n");
        List<File> dbFiles = findSqliteDatabases(appCtx);
        File nothingXDb = null;
        for (File f : dbFiles) {
            if ("nothing_x.db".equalsIgnoreCase(f.getName())) {
                nothingXDb = f;
                break;
            }
        }

        Map<String, String> metricSummaries = new LinkedHashMap<String, String>();
        metricSummaries.put("Heart Rate (BPM)", null);
        metricSummaries.put("SpO2 / Blood Oxygen (%)", null);
        metricSummaries.put("Steps & Activity", null);
        metricSummaries.put("Sleep", null);
        metricSummaries.put("Stress", null);
        metricSummaries.put("Vitality (VII) & Sport", null);

        if (nothingXDb != null && nothingXDb.exists()) {
            SQLiteDatabase db = null;
            try {
                db = SQLiteDatabase.openDatabase(nothingXDb.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);
                List<String> tables = listTables(db);
                for (String table : tables) {
                    String lower = table.toLowerCase(Locale.US);
                    if (lower.contains("heart_rate") || lower.contains("heartrate")) {
                        metricSummaries.put("Heart Rate (BPM)", queryLatestTableRowSummary(db, table));
                    } else if (lower.contains("spo2") || lower.contains("oxygen")) {
                        metricSummaries.put("SpO2 / Blood Oxygen (%)", queryLatestTableRowSummary(db, table));
                    } else if (lower.contains("step")) {
                        metricSummaries.put("Steps & Activity", queryLatestTableRowSummary(db, table));
                    } else if (lower.contains("sleep")) {
                        metricSummaries.put("Sleep", queryLatestTableRowSummary(db, table));
                    } else if (lower.contains("stress")) {
                        metricSummaries.put("Stress", queryLatestTableRowSummary(db, table));
                    } else if (lower.contains("vii") || lower.contains("sport")) {
                        String prev = metricSummaries.get("Vitality (VII) & Sport");
                        String cur = queryLatestTableRowSummary(db, table);
                        metricSummaries.put("Vitality (VII) & Sport", prev == null ? cur : (prev + " | " + cur));
                    }
                }
            } catch (Throwable t) {
                sb.append("• SQLite read error on nothing_x.db: ").append(t.getMessage()).append("\n");
            } finally {
                if (db != null) {
                    try { db.close(); } catch (Throwable ignored) {}
                }
            }
        }

        // Merge with NtSyncHealthFlutterApi cache if available
        appendMetricLine(sb, "1. Heart Rate",
                metricSummaries.get("Heart Rate (BPM)"),
                sFlutterHealthCache.get("HEART_RATE"),
                "HeartRateReportDbModelTable / SyncType.HEART_RATE");

        appendMetricLine(sb, "2. SpO2 (Blood Oxygen)",
                metricSummaries.get("SpO2 / Blood Oxygen (%)"),
                sFlutterHealthCache.get("OXYGEN_SATURATION"),
                "Spo2ReportDbModelTable / SyncType.OXYGEN_SATURATION");

        appendMetricLine(sb, "3. Steps & Activity",
                metricSummaries.get("Steps & Activity"),
                sFlutterHealthCache.get("STEP"),
                "StepReportDbModelTable / SyncType.STEP");

        appendMetricLine(sb, "4. Sleep",
                metricSummaries.get("Sleep"),
                sFlutterHealthCache.get("SLEEP"),
                "SleepReportDbModelTable / SyncType.SLEEP");

        appendMetricLine(sb, "5. Stress",
                metricSummaries.get("Stress"),
                null,
                "StressReportDbModelTable (Watch BLE -> nothing_x.db)");

        appendMetricLine(sb, "6. Exercise / Other (Resting HR, Resp. Rate, Temp)",
                metricSummaries.get("Vitality (VII) & Sport"),
                firstNonNull(
                        sFlutterHealthCache.get("EXERCISE"),
                        sFlutterHealthCache.get("RESTING_HEART"),
                        sFlutterHealthCache.get("RESPIRATORY_RATE"),
                        sFlutterHealthCache.get("BODY_TEMPERATURE")
                ),
                "SportReportDbModelTable / SyncType.EXERCISE");

        sb.append("\n━━ STORAGE & INTERFACE DIAGNOSTICS ━━\n");
        if (dbFiles.isEmpty()) {
            sb.append("• Local SQLite files found: 0 (nothing_x.db is created once a Nothing/CMF Watch syncs).\n");
        } else {
            for (File f : dbFiles) {
                sb.append("• DB File: ").append(f.getName())
                        .append(" (").append(f.length() / 1024).append(" KB, updated ")
                        .append(formatTime(f.lastModified())).append(")\n");
            }
        }
        if (sFlutterHealthCacheTimeMs > 0L) {
            sb.append("• NtSyncHealthFlutterApi last queried: ").append(formatTime(sFlutterHealthCacheTimeMs)).append("\n");
        } else {
            sb.append("• NtSyncHealthFlutterApi: Ready (tap Refresh while Flutter engine is active)\n");
        }

        return sb.toString();
    }

    private static void appendMetricLine(
            StringBuilder sb,
            String label,
            String dbSummary,
            String flutterSummary,
            String sourceDesc
    ) {
        sb.append("▸ ").append(label).append("\n");
        sb.append("  Source: ").append(sourceDesc).append("\n");
        boolean hasData = false;
        if (dbSummary != null && !dbSummary.isEmpty()) {
            sb.append("  SQLite: ").append(dbSummary).append("\n");
            hasData = true;
        }
        if (flutterSummary != null && !flutterSummary.isEmpty() && !flutterSummary.startsWith("0 records")) {
            sb.append("  HealthSync: ").append(flutterSummary).append("\n");
            hasData = true;
        }
        if (!hasData) {
            sb.append("  Status: [UNAVAILABLE] — No synced watch measurements found yet. Connect Nothing Watch Pro 2 and sync in Nothing X.\n");
        }
    }

    private static String firstNonNull(String... items) {
        if (items == null) return null;
        for (String s : items) {
            if (s != null && !s.isEmpty() && !s.startsWith("0 records")) return s;
        }
        return null;
    }

    private static List<File> findSqliteDatabases(Context context) {
        List<File> result = new ArrayList<File>();
        try {
            File dataDir = Build.VERSION.SDK_INT >= 24 ? context.getDataDir() : context.getFilesDir().getParentFile();
            if (dataDir != null && dataDir.exists()) {
                scanForDbFiles(dataDir, result, 0);
            }
        } catch (Throwable ignored) {}
        return result;
    }

    private static void scanForDbFiles(File dir, List<File> out, int depth) {
        if (dir == null || depth > 3) return;
        File[] children = dir.listFiles();
        if (children == null) return;
        for (File f : children) {
            if (f.isDirectory()) {
                String name = f.getName();
                if (!"lib".equals(name) && !"code_cache".equals(name) && !"cache".equals(name)) {
                    scanForDbFiles(f, out, depth + 1);
                }
            } else if (f.getName().endsWith(".db")) {
                out.add(f);
            }
        }
    }

    private static List<String> listTables(SQLiteDatabase db) {
        List<String> tables = new ArrayList<String>();
        Cursor c = null;
        try {
            c = db.rawQuery("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'android_%' AND name NOT LIKE 'sqlite_%'", null);
            while (c != null && c.moveToNext()) {
                tables.add(c.getString(0));
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
        return tables;
    }

    private static String queryLatestTableRowSummary(SQLiteDatabase db, String table) {
        Cursor countCursor = null;
        Cursor rowCursor = null;
        try {
            int totalRows = 0;
            countCursor = db.rawQuery("SELECT COUNT(*) FROM \"" + table + "\"", null);
            if (countCursor != null && countCursor.moveToFirst()) {
                totalRows = countCursor.getInt(0);
            }
            if (totalRows == 0) {
                return "[UNAVAILABLE] Table \"" + table + "\" has 0 stored records.";
            }

            rowCursor = db.rawQuery("SELECT * FROM \"" + table + "\" ORDER BY rowid DESC LIMIT 1", null);
            if (rowCursor != null && rowCursor.moveToFirst()) {
                String[] cols = rowCursor.getColumnNames();
                StringBuilder rowSb = new StringBuilder();
                long detectedEpochMs = 0L;
                for (int i = 0; i < cols.length; i++) {
                    String col = cols[i];
                    String val = null;
                    try {
                        int type = rowCursor.getType(i);
                        if (type == Cursor.FIELD_TYPE_INTEGER) {
                            long lv = rowCursor.getLong(i);
                            val = String.valueOf(lv);
                            String cl = col.toLowerCase(Locale.US);
                            if (cl.contains("time") || cl.contains("date") || cl.contains("ts") || cl.contains("start") || cl.contains("end") || cl.contains("create")) {
                                long norm = normalizeEpochMs(lv);
                                if (norm > 1577836800000L && norm <= System.currentTimeMillis() + 86400000L) {
                                    detectedEpochMs = Math.max(detectedEpochMs, norm);
                                }
                            }
                        } else if (type == Cursor.FIELD_TYPE_FLOAT) {
                            val = String.valueOf(rowCursor.getDouble(i));
                        } else if (type == Cursor.FIELD_TYPE_STRING) {
                            val = rowCursor.getString(i);
                            if (val != null && val.length() > 120) {
                                val = val.substring(0, 120) + "...";
                            }
                        }
                    } catch (Throwable ignored) {}

                    if (val != null && !val.isEmpty() && !"null".equalsIgnoreCase(val)) {
                        if (rowSb.length() > 0) rowSb.append(", ");
                        rowSb.append(col).append("=").append(val);
                    }
                }

                long ageMs = detectedEpochMs > 0 ? (System.currentTimeMillis() - detectedEpochMs) : Long.MAX_VALUE;
                String freshnessTag;
                if (detectedEpochMs > 0 && ageMs < 3600_000L) {
                    freshnessTag = "[PERIODICALLY UPDATED]";
                } else {
                    freshnessTag = "[HISTORICAL]";
                }
                String tsInfo = detectedEpochMs > 0 ? (" | Timestamp: " + formatTime(detectedEpochMs)) : "";
                return freshnessTag + " (" + totalRows + " rows in " + table + tsInfo + ") -> " + rowSb.toString();
            }
        } catch (Throwable t) {
            return "Query error on " + table + ": " + t.getMessage();
        } finally {
            if (countCursor != null) try { countCursor.close(); } catch (Throwable ignored) {}
            if (rowCursor != null) try { rowCursor.close(); } catch (Throwable ignored) {}
        }
        return null;
    }

    public static long normalizeEpochMs(long raw) {
        if (raw <= 0L) return 0L;
        if (raw < 10_000_000_000L) {
            return raw * 1000L;
        }
        return raw;
    }

    public static String formatHhMmSs(long ms) {
        if (ms < 0L) ms = 0L;
        long totalSec = (ms + 999L) / 1000L;
        long hrs = totalSec / 3600L;
        long mins = (totalSec % 3600L) / 60L;
        long secs = totalSec % 60L;
        return String.format(Locale.US, "%02d:%02d:%02d", hrs, mins, secs);
    }

    public static String formatDurationShort(long ms) {
        if (ms <= 0L) return "0m";
        long totalMins = Math.round(ms / 60000.0);
        long hrs = totalMins / 60;
        long mins = totalMins % 60;
        if (hrs > 0 && mins > 0) return hrs + "h " + mins + "m";
        if (hrs > 0) return hrs + (hrs == 1 ? " hour" : " hours");
        return mins + " min";
    }

    public static String formatTime(long epochMs) {
        if (epochMs <= 0L) return "N/A";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a", Locale.US);
        return sdf.format(new Date(epochMs));
    }

    public static String formatClockShort(long epochMs) {
        if (epochMs <= 0L) return "--:--";
        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a", Locale.US);
        return sdf.format(new Date(epochMs));
    }

    /**
     * Returns clean, human-friendly key-value metrics for the modern Nothing OS UI cards
     * without blocking the UI thread on SQLite or Bluetooth Binder calls.
     */
    public static Map<String, String> getCleanDashboardData(final Context context) {
        final Context appCtx = context.getApplicationContext();
        Map<String, String> current = sCachedDashboardMap;
        long now = System.currentTimeMillis();
        if (current == null) {
            // Initial synchronous load on first open, then all subsequent refreshes run in background
            current = computeDashboardDataInternal(appCtx);
            sCachedDashboardMap = current;
            sLastDbRefreshMs = now;
            return current;
        }
        if (!sDbRefreshInFlight && (now - sLastDbRefreshMs >= 2000L)) {
            sDbRefreshInFlight = true;
            sLastDbRefreshMs = now;
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        sCachedDashboardMap = computeDashboardDataInternal(appCtx);
                    } catch (Throwable ignored) {
                    } finally {
                        sDbRefreshInFlight = false;
                    }
                }
            }).start();
        }
        return current;
    }

    private static Map<String, String> computeDashboardDataInternal(Context appCtx) {
        Map<String, String> out = new LinkedHashMap<String, String>();

        boolean bleConnected = false;
        String watchName = "Watch Pro 2";
        try {
            BluetoothManager bm = (BluetoothManager) appCtx.getSystemService(Context.BLUETOOTH_SERVICE);
            if (bm != null) {
                List<BluetoothDevice> gattDevs = bm.getConnectedDevices(BluetoothProfile.GATT);
                if (gattDevs != null && !gattDevs.isEmpty()) {
                    bleConnected = true;
                    String n = gattDevs.get(0).getName();
                    if (n != null && !n.isEmpty()) watchName = n;
                }
            }
        } catch (Throwable ignored) {}

        out.put("watch_connected", bleConnected ? "1" : "0");
        out.put("watch_name", watchName);

        // Defaults when a metric has 0 stored records
        out.put("hr_val", "-- BPM");
        out.put("hr_badge", "NO DATA");
        out.put("hr_sub", "Waiting for watch");

        out.put("spo2_val", "-- %");
        out.put("spo2_badge", "NO DATA");
        out.put("spo2_sub", "Measure on watch");

        out.put("step_val", "0");
        out.put("step_badge", "SYNCED");
        out.put("step_sub", "No steps recorded yet");

        out.put("sleep_val", "--");
        out.put("sleep_badge", "NO DATA");
        out.put("sleep_sub", "Syncs after sleep");

        out.put("stress_val", "--");
        out.put("stress_badge", "NO DATA");
        out.put("stress_sub", "Measure on watch");

        out.put("sport_val", "Ready");
        out.put("sport_badge", bleConnected ? "CONNECTED" : "STANDBY");
        out.put("sport_sub", watchName);

        List<File> dbFiles = findSqliteDatabases(appCtx);
        File nothingXDb = null;
        for (File f : dbFiles) {
            if ("nothing_x.db".equalsIgnoreCase(f.getName())) {
                nothingXDb = f;
                break;
            }
        }

        if (nothingXDb != null && nothingXDb.exists()) {
            SQLiteDatabase db = null;
            try {
                db = SQLiteDatabase.openDatabase(nothingXDb.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY);

                if (!sLoggedDbSchemaOnce) {
                    sLoggedDbSchemaOnce = true;
                    try {
                        List<String> allTables = listTables(db);
                        for (String tName : allTables) {
                            int cnt = countRowsSafe(db, tName);
                            if (cnt > 0) {
                                Log.i(TAG, "DB_DUMP [" + tName + "] rows=" + cnt + " -> " + queryLatestTableRowSummary(db, tName));
                            }
                        }
                    } catch (Throwable ignored) {}
                }

                // 1. Heart Rate: Check live scraped real-time value first
                if (sLiveHeartRateBpm > 0) {
                    out.put("hr_val", sLiveHeartRateBpm + " BPM");
                    out.put("hr_badge", "LIVE SYNC");
                    out.put("hr_sub", "Updated " + formatClockShort(System.currentTimeMillis()));
                } else {
                    MetricPoint hr = queryAddUpMetric(db, "heartRate");
                    if (hr == null || hr.primaryValue == null || "56".equals(hr.primaryValue)) {
                        MetricPoint hrReport = queryLatestMetricPoint(db, "HeartRateReportDbModelTable");
                        if (hrReport != null && hrReport.primaryValue != null && !"56".equals(hrReport.primaryValue)) {
                            hr = hrReport;
                        }
                    }
                    if (hr == null || hr.primaryValue == null) {
                        hr = parseMetricFromFlutterCache("HEART_RATE", false);
                    }
                    if (hr != null && hr.primaryValue != null) {
                        out.put("hr_val", hr.primaryValue + " BPM");
                        boolean recent = hr.epochMs > 0 && (System.currentTimeMillis() - hr.epochMs) < 15L * 60_000L;
                        out.put("hr_badge", recent ? "LIVE SYNC" : "SYNCED");
                        out.put("hr_sub", hr.epochMs > 0 ? ("Updated " + formatClockShort(hr.epochMs)) : "Synced from Watch");
                    }
                }

                // 2. SpO2
                if (sLiveSpo2Val != null && !sLiveSpo2Val.isEmpty()) {
                    out.put("spo2_val", sLiveSpo2Val);
                    out.put("spo2_badge", "LIVE SYNC");
                    out.put("spo2_sub", "Updated " + formatClockShort(System.currentTimeMillis()));
                } else {
                    MetricPoint spo2 = queryAddUpMetric(db, "bloodOxygen");
                    if (spo2 == null || spo2.primaryValue == null) {
                        spo2 = queryLatestMetricPoint(db, "Spo2ReportDbModelTable");
                    }
                    if (spo2 == null || spo2.primaryValue == null) {
                        spo2 = parseMetricFromFlutterCache("OXYGEN_SATURATION", false);
                    }
                    if (spo2 != null && spo2.primaryValue != null) {
                        out.put("spo2_val", spo2.primaryValue + " %");
                        out.put("spo2_badge", "SYNCED");
                        out.put("spo2_sub", spo2.epochMs > 0 ? ("Updated " + formatClockShort(spo2.epochMs)) : "Synced from Watch");
                    }
                }

                // 3. Steps
                if (sLiveStepVal != null && !"0".equals(sLiveStepVal)) {
                    out.put("step_val", sLiveStepVal);
                    out.put("step_badge", "TODAY");
                    out.put("step_sub", "Updated " + formatClockShort(System.currentTimeMillis()));
                } else {
                    MetricPoint step = queryLatestMetricPoint(db, "StepReportDbModelTable");
                    if (step == null || step.primaryValue == null || "0".equals(step.primaryValue)) {
                        MetricPoint addUpStep = queryLatestMetricPoint(db, "AddUpNetModelTable");
                        if (addUpStep != null && addUpStep.primaryValue != null && !"0".equals(addUpStep.primaryValue)) {
                            step = addUpStep;
                        }
                    }
                    if (step == null || step.primaryValue == null || "0".equals(step.primaryValue)) {
                        MetricPoint flStep = parseMetricFromFlutterCache("STEP", false);
                        if (flStep != null && flStep.primaryValue != null) {
                            step = flStep;
                        }
                    }
                    if (step != null && step.primaryValue != null) {
                        out.put("step_val", step.primaryValue);
                        out.put("step_badge", "TODAY");
                        out.put("step_sub", step.epochMs > 0 ? ("Updated " + formatClockShort(step.epochMs)) : "Watch pedometer");
                    }
                }

                // 4. Sleep
                MetricPoint sleep = queryLatestMetricPoint(db, "SleepReportDbModelTable");
                if (sleep == null || sleep.primaryValue == null) {
                    sleep = queryLatestMetricPoint(db, "AddUpDaySleepNetModelTable");
                }
                if (sleep == null || sleep.primaryValue == null) {
                    sleep = queryLatestMetricPoint(db, "AddUpSleepNetModelTable");
                }
                if (sleep == null || sleep.primaryValue == null) {
                    sleep = parseMetricFromFlutterCache("SLEEP", true);
                }
                if (sleep != null && sleep.primaryValue != null) {
                    out.put("sleep_val", formatSleepDisplayValue(sleep.primaryValue));
                    out.put("sleep_badge", "RECORDED");
                    out.put("sleep_sub", sleep.epochMs > 0 ? ("Updated " + formatClockShort(sleep.epochMs)) : "Watch sleep log");
                }

                // 5. Stress
                MetricPoint stress = queryAddUpMetric(db, "pressure");
                if (stress == null || stress.primaryValue == null) {
                    stress = queryLatestMetricPoint(db, "StressReportDbModelTable");
                }
                if (stress != null && stress.primaryValue != null) {
                    out.put("stress_val", stress.primaryValue);
                    out.put("stress_badge", "SYNCED");
                    out.put("stress_sub", stress.epochMs > 0 ? ("Updated " + formatClockShort(stress.epochMs)) : "Synced from Watch");
                }

                // 6. Sport / Workouts
                MetricPoint sport = queryLatestMetricPoint(db, "SportReportDbModelTable");
                if (sport != null && sport.primaryValue != null) {
                    out.put("sport_val", sport.primaryValue);
                    out.put("sport_badge", "WORKOUT");
                    out.put("sport_sub", sport.epochMs > 0 ? ("Updated " + formatClockShort(sport.epochMs)) : "Workout synced");
                } else {
                    int sportModes = countRowsSafe(db, "NtSportSortModelTable");
                    if (sportModes > 0) {
                        out.put("sport_val", sportModes + " Modes");
                        out.put("sport_badge", "ACTIVE");
                        out.put("sport_sub", watchName);
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                if (db != null) try { db.close(); } catch (Throwable ignored) {}
            }
        }
        return out;
    }

    private static MetricPoint queryAddUpMetric(SQLiteDatabase db, String typeKeyword) {
        if (db == null) return null;
        Cursor c = null;
        try {
            c = db.rawQuery("SELECT lastValue, timestamp FROM \"AddUpNetModelTable\" WHERE id LIKE '%" + typeKeyword + "%' ORDER BY timestamp DESC LIMIT 1", null);
            if (c != null && c.moveToFirst()) {
                int val = c.getInt(0);
                long ts = normalizeEpochMs(c.getLong(1));
                if (val > 0) {
                    MetricPoint mp = new MetricPoint();
                    mp.primaryValue = String.valueOf(val);
                    mp.epochMs = ts;
                    return mp;
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
        return null;
    }

    private static String formatSleepDisplayValue(String raw) {
        if (raw == null) return "--";
        if (raw.contains("h") || raw.contains("m")) return raw;
        try {
            long v = Long.parseLong(raw.trim());
            if (v <= 0) return "--";
            long mins = v;
            if (v > 1440L) {
                // Seconds -> minutes
                mins = Math.round(v / 60.0);
            }
            long hrs = mins / 60L;
            long remMins = mins % 60L;
            if (hrs > 0 && remMins > 0) return hrs + "h " + remMins + "m";
            if (hrs > 0) return hrs + "h";
            return remMins + "m";
        } catch (Throwable ignored) {
            return raw;
        }
    }

    private static MetricPoint parseMetricFromFlutterCache(String typeName, boolean isSleep) {
        try {
            String rawJson = sFlutterRawJsonCache.get(typeName);
            if (rawJson == null || rawJson.isEmpty()) return null;
            Long ts = sFlutterTimestampCache.get(typeName);
            String extracted = extractMetricFromRawString(rawJson, isSleep);
            if (extracted != null) {
                MetricPoint mp = new MetricPoint();
                mp.primaryValue = extracted;
                mp.epochMs = ts != null ? ts : sFlutterHealthCacheTimeMs;
                return mp;
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static String extractMetricFromRawString(String s, boolean isSleep) {
        if (s == null || s.isEmpty()) return null;
        try {
            // Search from the END of the string to get the most recent real-time readings!
            String[] keys = isSleep
                    ? new String[]{"totalSleepTime", "sleepTime", "duration", "total", "value"}
                    : new String[]{"currentHeartRate", "lastHeartRate", "latestHeartRate", "heartRate", "bpm", "totalStep", "totalSteps", "steps", "step", "value", "avg", "spo2", "stress"};
            for (String k : keys) {
                int idx = s.lastIndexOf("\"" + k + "\"");
                if (idx >= 0) {
                    int colon = s.indexOf(':', idx);
                    if (colon > idx && colon - idx < 30) {
                        StringBuilder num = new StringBuilder();
                        for (int j = colon + 1; j < s.length(); j++) {
                            char ch = s.charAt(j);
                            if (Character.isDigit(ch)) {
                                num.append(ch);
                            } else if (num.length() > 0) {
                                break;
                            } else if (ch != ' ' && ch != '"') {
                                break;
                            }
                        }
                        if (num.length() > 0) {
                            long val = Long.parseLong(num.toString());
                            if (val > 0 && val < 1000000L) {
                                return String.valueOf(val);
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static final class MetricPoint {
        String primaryValue;
        long epochMs;
    }

    private static MetricPoint queryLatestMetricPoint(SQLiteDatabase db, String table) {
        Cursor c = null;
        try {
            c = db.rawQuery("SELECT * FROM \"" + table + "\" ORDER BY rowid DESC LIMIT 1", null);
            if (c != null && c.moveToFirst()) {
                MetricPoint mp = new MetricPoint();
                String[] cols = c.getColumnNames();
                String fallbackJson = null;
                boolean isSleepTable = table.toLowerCase(Locale.US).contains("sleep");
                boolean isHrTable = table.toLowerCase(Locale.US).contains("heart");
                for (int i = 0; i < cols.length; i++) {
                    String col = cols[i].toLowerCase(Locale.US);
                    int type = c.getType(i);
                    if (type == Cursor.FIELD_TYPE_INTEGER) {
                        long v = c.getLong(i);
                        boolean isDurationCol = col.contains("sleep") || col.contains("duration")
                                || col.contains("sporttime") || col.contains("activetime");
                        boolean isTimestampCol = !isDurationCol && (col.equals("time") || col.equals("starttime")
                                || col.equals("endtime") || col.equals("createtime") || col.equals("updatetime")
                                || col.contains("date") || col.equals("daytime") || col.contains("timestamp")
                                || col.equals("start") || col.equals("end"));
                        if (isTimestampCol) {
                            long norm = normalizeEpochMs(v);
                            if (norm > 1577836800000L && norm <= System.currentTimeMillis() + 86400000L) {
                                mp.epochMs = Math.max(mp.epochMs, norm);
                            }
                        } else if (col.equals("value") || col.equals("step") || col.equals("steps")
                                || col.contains("totalstep") || col.contains("spo2") || col.contains("stress")
                                || col.contains("duration") || col.contains("sleep") || col.contains("avg")
                                || col.contains("total") || col.contains("heart") || col.contains("bpm")
                                || col.contains("cal") || col.contains("distance")) {
                            // If HR table, skip min/resting columns so we dont lock to 56 BPM
                            boolean isMinOrResting = isHrTable && (col.contains("min") || col.contains("resting") || col.contains("base"));
                            if (!isMinOrResting && mp.primaryValue == null && v > 0 && v < 10000000L) {
                                mp.primaryValue = String.valueOf(v);
                            }
                        }
                    } else if (type == Cursor.FIELD_TYPE_STRING) {
                        String sv = c.getString(i);
                        if (sv != null && !sv.isEmpty() && !"null".equalsIgnoreCase(sv)) {
                            if ((col.equals("value") || col.equals("step") || col.equals("steps")
                                    || col.contains("totalstep") || col.contains("spo2") || col.contains("stress")
                                    || col.contains("sleep") || col.contains("duration"))
                                    && mp.primaryValue == null && !sv.startsWith("{") && !sv.startsWith("[")) {
                                mp.primaryValue = sv;
                            } else if (sv.startsWith("{") || sv.startsWith("[") || col.contains("item") || col.contains("data") || col.contains("json")) {
                                fallbackJson = sv;
                            }
                        }
                    }
                }
                // For Heart Rate table, prefer parsing latest item from JSON array over static column
                if (fallbackJson != null) {
                    String fromJson = extractMetricFromRawString(fallbackJson, isSleepTable);
                    if (fromJson != null) {
                        mp.primaryValue = fromJson;
                    }
                }
                if (mp.primaryValue != null) {
                    return mp;
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
        return null;
    }

    public static int dp(Context context, float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()
        );
    }
}
