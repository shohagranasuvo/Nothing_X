package com.nothing.nt_route;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.nothing.smartcenter.patch.NothingXEnhancer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Authentic Nothing X-styled Sleep Timer, 6-Wave Watch Wake-Up Alarm & Real-Time Health Dashboard
 * hosted inside com.nothing.nt_route.TestActivity of Nothing X (com.nothing.smartcenter).
 */
public class TestActivity extends Activity {

    private long mSelectedDurationMs = 2L * 60L * 60L * 1000L;
    private int mSleepHrThresholdBpm = 65;

    private TextView mWatchConnBadge;
    private TextView mStatusBadgeView;
    private TextView mRemainingTimeView;
    private TextView mSubtitleTimeView;
    private EditText mCustomMinutesInput;
    private EditText mHrThresholdInput;
    private TextView mAlertStatusView;
    private Button mStopWakeUpBtn;
    private TextView mLiveSyncSubView;

    // Metric Card Views (Heart Rate, SpO2, Steps, Sleep, Stress, Sport)
    private MetricTile mTileHr;
    private MetricTile mTileSpo2;
    private MetricTile mTileSteps;
    private MetricTile mTileSleep;
    private MetricTile mTileStress;
    private MetricTile mTileSport;

    private final List<PresetButtonHolder> mPresetButtons = new ArrayList<PresetButtonHolder>();
    private int mTickCounter = 0;

    private static final class PresetButtonHolder {
        final Button button;
        final long durationMs;

        PresetButtonHolder(Button b, long d) {
            this.button = b;
            this.durationMs = d;
        }
    }

    private static final class MetricTile {
        final LinearLayout container;
        final TextView iconView;
        final TextView titleView;
        final TextView badgeView;
        final TextView valueView;
        final TextView subView;

        MetricTile(LinearLayout container, TextView iconView, TextView titleView, TextView badgeView, TextView valueView, TextView subView) {
            this.container = container;
            this.iconView = iconView;
            this.titleView = titleView;
            this.badgeView = badgeView;
            this.valueView = valueView;
            this.subView = subView;
        }
    }

    private final Handler mUiHandler = new Handler(Looper.getMainLooper());
    private final Runnable mTickRunnable = new Runnable() {
        @Override
        public void run() {
            if (isFinishing() || isDestroyed()) return;
            NothingXEnhancer.checkAndCompleteIfExpired(TestActivity.this);
            refreshTimerUi();
            // Refresh health cards every 1 second (2 ticks of 500ms)
            if (mTickCounter % 2 == 0) {
                refreshHealthCards();
            }
            // Trigger live Flutter + BLE watch health sync every 3 seconds (6 ticks of 500ms)
            if (mTickCounter % 6 == 0) {
                NothingXEnhancer.requestFlutterHealthSync(TestActivity.this, new Runnable() {
                    @Override
                    public void run() {
                        if (!isFinishing() && !isDestroyed()) {
                            refreshHealthCards();
                        }
                    }
                });
            }
            mTickCounter++;
            mUiHandler.postDelayed(this, 500L);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        super.onCreate(savedInstanceState);

        requestNotificationPermissionIfNeeded();
        NothingXEnhancer.ensureTimerRestored(this);

        SharedPreferences prefs = NothingXEnhancer.getPrefs(this);
        long savedDur = prefs.getLong("duration_ms", 0L);
        if (savedDur > 0L) {
            mSelectedDurationMs = savedDur;
        }
        mSleepHrThresholdBpm = prefs.getInt("armed_hr_threshold", 65);

        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(Color.parseColor("#000000"));
        scroll.setFillViewport(true);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int padH = NothingXEnhancer.dp(this, 16);
        root.setPadding(padH, NothingXEnhancer.dp(this, 48), padH, NothingXEnhancer.dp(this, 28));
        scroll.addView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // ─────────────────────────────────────────────────────────────────────
        // 1. AUTHENTIC NOTHING X HEADER BAR (Serif Title + Watch Pill)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout topBar = new LinearLayout(this);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);

        Button backBtn = createNothingButton("←", "#1C1C1E", "#FFFFFF", 16f, 14, 8, 22);
        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        topBar.addView(backBtn);

        TextView headerTitle = new TextView(this);
        headerTitle.setText("Sleep & Health");
        headerTitle.setTextColor(Color.WHITE);
        headerTitle.setTypeface(Typeface.SERIF, Typeface.NORMAL);
        headerTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 25f);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titleLp.leftMargin = NothingXEnhancer.dp(this, 12);
        topBar.addView(headerTitle, titleLp);

        mWatchConnBadge = new TextView(this);
        mWatchConnBadge.setText("● Watch Pro 2");
        mWatchConnBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        mWatchConnBadge.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        int badgePadH = NothingXEnhancer.dp(this, 12);
        int badgePadV = NothingXEnhancer.dp(this, 6);
        mWatchConnBadge.setPadding(badgePadH, badgePadV, badgePadH, badgePadV);
        topBar.addView(mWatchConnBadge);

        root.addView(topBar);

        // ─────────────────────────────────────────────────────────────────────
        // 2. HERO CARD — SLEEP TIMER & 6x WATCH WAKE-UP ALARM
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout timerCard = createNothingCard();
        LinearLayout.LayoutParams timerCardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        timerCardLp.topMargin = NothingXEnhancer.dp(this, 16);
        root.addView(timerCard, timerCardLp);

        // Top row inside card: Circular icon + label + Live State Pill
        LinearLayout timerHeaderRow = new LinearLayout(this);
        timerHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        timerHeaderRow.setGravity(Gravity.CENTER_VERTICAL);

        TextView timerIcon = createCircleIcon("⏰");
        timerHeaderRow.addView(timerIcon);

        LinearLayout timerTitleCol = new LinearLayout(this);
        timerTitleCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams ttcLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        ttcLp.leftMargin = NothingXEnhancer.dp(this, 10);

        TextView timerLabel = new TextView(this);
        timerLabel.setText("Sleep Timer");
        timerLabel.setTextColor(Color.WHITE);
        timerLabel.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        timerLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        timerTitleCol.addView(timerLabel);

        TextView timerSubLabel = new TextView(this);
        timerSubLabel.setText("6x Watch Vibration + Phone Alarm on finish");
        timerSubLabel.setTextColor(Color.parseColor("#8E8E93"));
        timerSubLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        timerTitleCol.addView(timerSubLabel);

        timerHeaderRow.addView(timerTitleCol, ttcLp);

        mStatusBadgeView = new TextView(this);
        mStatusBadgeView.setText("READY");
        mStatusBadgeView.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        mStatusBadgeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f);
        timerHeaderRow.addView(mStatusBadgeView);

        timerCard.addView(timerHeaderRow);

        // Giant Digital Countdown
        mRemainingTimeView = new TextView(this);
        mRemainingTimeView.setText("02:00:00");
        mRemainingTimeView.setTextColor(Color.WHITE);
        mRemainingTimeView.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        mRemainingTimeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 44f);
        mRemainingTimeView.setGravity(Gravity.CENTER);
        mRemainingTimeView.setPadding(0, NothingXEnhancer.dp(this, 12), 0, NothingXEnhancer.dp(this, 2));
        timerCard.addView(mRemainingTimeView);

        // Clean 1-line subtitle
        mSubtitleTimeView = new TextView(this);
        mSubtitleTimeView.setText("Wake-up alarm at --:--");
        mSubtitleTimeView.setTextColor(Color.parseColor("#98989F"));
        mSubtitleTimeView.setTypeface(Typeface.SANS_SERIF, Typeface.NORMAL);
        mSubtitleTimeView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        mSubtitleTimeView.setGravity(Gravity.CENTER);
        mSubtitleTimeView.setPadding(0, 0, 0, NothingXEnhancer.dp(this, 12));
        timerCard.addView(mSubtitleTimeView);

        // Prominent Stop Wake-Up Alarm button (shown when 6-wave burst is active)
        mStopWakeUpBtn = createNothingButton("⏹ STOP WAKE-UP ALARM (WAVE 1/6)", "#D71921", "#FFFFFF", 13.5f, 16, 12, 20);
        LinearLayout.LayoutParams stopLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        stopLp.bottomMargin = NothingXEnhancer.dp(this, 12);
        mStopWakeUpBtn.setVisibility(View.GONE);
        mStopWakeUpBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.stopWakeUpAlarmBurst(TestActivity.this);
                refreshTimerUi();
                Toast.makeText(TestActivity.this, "Wake-up alarm stopped", Toast.LENGTH_SHORT).show();
            }
        });
        timerCard.addView(mStopWakeUpBtn, stopLp);

        // Duration Presets Row 1: 30m, 1h, 2h, 3h
        LinearLayout row1 = new LinearLayout(this);
        row1.setOrientation(LinearLayout.HORIZONTAL);
        addPresetChip(row1, "30m", 30L * 60_000L);
        addPresetChip(row1, "1h", 60L * 60_000L);
        addPresetChip(row1, "2h", 120L * 60_000L);
        addPresetChip(row1, "3h", 180L * 60_000L);
        timerCard.addView(row1);

        // Duration Presets Row 2: 4h, 6h, 8h
        LinearLayout row2 = new LinearLayout(this);
        row2.setOrientation(LinearLayout.HORIZONTAL);
        row2.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams row2Lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        row2Lp.topMargin = NothingXEnhancer.dp(this, 6);
        addPresetChip(row2, "4h", 240L * 60_000L);
        addPresetChip(row2, "6h", 360L * 60_000L);
        addPresetChip(row2, "8h", 480L * 60_000L);
        timerCard.addView(row2, row2Lp);

        // Compact Custom Duration + Sleep HR Threshold Row
        LinearLayout configRow = new LinearLayout(this);
        configRow.setOrientation(LinearLayout.HORIZONTAL);
        configRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams configLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        configLp.topMargin = NothingXEnhancer.dp(this, 10);

        mCustomMinutesInput = createCompactInput("Custom min");
        LinearLayout.LayoutParams customInLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        customInLp.rightMargin = NothingXEnhancer.dp(this, 6);
        configRow.addView(mCustomMinutesInput, customInLp);

        Button applyCustomBtn = createNothingButton("Set Min", "#2C2C2E", "#FFFFFF", 11.5f, 12, 9, 16);
        applyCustomBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String txt = mCustomMinutesInput.getText().toString().trim();
                if (txt.isEmpty()) return;
                try {
                    long mins = Long.parseLong(txt);
                    if (mins > 0L && mins <= 1440L) {
                        mSelectedDurationMs = mins * 60_000L;
                        refreshTimerUi();
                    }
                } catch (NumberFormatException ignored) {}
            }
        });
        LinearLayout.LayoutParams setMinLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        setMinLp.rightMargin = NothingXEnhancer.dp(this, 10);
        configRow.addView(applyCustomBtn, setMinLp);

        TextView hrLabel = new TextView(this);
        hrLabel.setText("Sleep HR ≤");
        hrLabel.setTextColor(Color.parseColor("#8E8E93"));
        hrLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        hrLabel.setPadding(0, 0, NothingXEnhancer.dp(this, 6), 0);
        configRow.addView(hrLabel);

        mHrThresholdInput = createCompactInput("65");
        mHrThresholdInput.setText(String.valueOf(mSleepHrThresholdBpm));
        LinearLayout.LayoutParams hrInLp = new LinearLayout.LayoutParams(
                NothingXEnhancer.dp(this, 54),
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        configRow.addView(mHrThresholdInput, hrInLp);

        timerCard.addView(configRow, configLp);

        // Primary Action Row: [▶ Start Now]  [◉ Auto-Sleep (Watch)]
        LinearLayout primaryRow = new LinearLayout(this);
        primaryRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams primaryLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        primaryLp.topMargin = NothingXEnhancer.dp(this, 12);

        Button startNowBtn = createNothingButton("▶ Start Now", "#D71921", "#FFFFFF", 13f, 12, 11, 20);
        startNowBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.stopWakeUpAlarmBurst(TestActivity.this);
                NothingXEnhancer.startTimer(TestActivity.this, mSelectedDurationMs);
                refreshTimerUi();
            }
        });
        primaryRow.addView(startNowBtn, weightedParams(0, 4));

        Button autoSleepBtn = createNothingButton("◉ Auto-Sleep (Watch)", "#2C2C2E", "#FFFFFF", 13f, 12, 11, 20);
        autoSleepBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.stopWakeUpAlarmBurst(TestActivity.this);
                int hrThreshold = 65;
                try {
                    String txt = mHrThresholdInput.getText().toString().trim();
                    if (!txt.isEmpty()) hrThreshold = Integer.parseInt(txt);
                } catch (NumberFormatException ignored) {}
                if (hrThreshold < 40 || hrThreshold > 110) {
                    hrThreshold = 65;
                    mHrThresholdInput.setText("65");
                }
                mSleepHrThresholdBpm = hrThreshold;
                NothingXEnhancer.armTimerForWatchSleep(TestActivity.this, mSelectedDurationMs, hrThreshold);
                refreshTimerUi();
            }
        });
        primaryRow.addView(autoSleepBtn, weightedParams(4, 0));

        timerCard.addView(primaryRow, primaryLp);

        // Secondary Controls Row: Pause | Resume | Cancel
        LinearLayout secRow = new LinearLayout(this);
        secRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams secLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        secLp.topMargin = NothingXEnhancer.dp(this, 8);

        Button pauseBtn = createNothingButton("Pause", "#2C2C2E", "#E5E5EA", 12f, 10, 9, 16);
        pauseBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.pauseTimer(TestActivity.this);
                refreshTimerUi();
            }
        });
        secRow.addView(pauseBtn, weightedParams(0, 3));

        Button resumeBtn = createNothingButton("Resume", "#2C2C2E", "#E5E5EA", 12f, 10, 9, 16);
        resumeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.resumeTimer(TestActivity.this);
                refreshTimerUi();
            }
        });
        secRow.addView(resumeBtn, weightedParams(3, 3));

        Button cancelBtn = createNothingButton("Reset / Stop", "#3A181B", "#FF6B6B", 12f, 10, 9, 16);
        cancelBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.cancelTimer(TestActivity.this);
                refreshTimerUi();
            }
        });
        secRow.addView(cancelBtn, weightedParams(3, 0));

        timerCard.addView(secRow, secLp);

        // ─────────────────────────────────────────────────────────────────────
        // 3. LIVE WATCH HEALTH METRICS (AUTHENTIC NOTHING X 2x3 CARDS)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout healthHeaderRow = new LinearLayout(this);
        healthHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        healthHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams hhLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        hhLp.topMargin = NothingXEnhancer.dp(this, 20);
        hhLp.bottomMargin = NothingXEnhancer.dp(this, 10);

        LinearLayout healthTitleCol = new LinearLayout(this);
        healthTitleCol.setOrientation(LinearLayout.VERTICAL);

        TextView healthTitle = new TextView(this);
        healthTitle.setText("Health Monitor");
        healthTitle.setTextColor(Color.WHITE);
        healthTitle.setTypeface(Typeface.SERIF, Typeface.NORMAL);
        healthTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        healthTitleCol.addView(healthTitle);

        mLiveSyncSubView = new TextView(this);
        mLiveSyncSubView.setText("Real-time auto-sync every 3s");
        mLiveSyncSubView.setTextColor(Color.parseColor("#8E8E93"));
        mLiveSyncSubView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        healthTitleCol.addView(mLiveSyncSubView);

        healthHeaderRow.addView(healthTitleCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button syncBtn = createNothingButton("↻ Sync Now", "#1C1C1E", "#FFFFFF", 12f, 14, 7, 18);
        syncBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mLiveSyncSubView.setText("Syncing with Watch Pro 2...");
                NothingXEnhancer.requestFlutterHealthSync(TestActivity.this, new Runnable() {
                    @Override
                    public void run() {
                        refreshHealthCards();
                    }
                });
                refreshHealthCards();
            }
        });
        healthHeaderRow.addView(syncBtn);
        root.addView(healthHeaderRow, hhLp);

        // Grid Row 1: Heart Rate & Blood Oxygen
        LinearLayout gridRow1 = new LinearLayout(this);
        gridRow1.setOrientation(LinearLayout.HORIZONTAL);
        mTileHr = createMetricTile("♥", "Heart rate", "#FF453A");
        mTileSpo2 = createMetricTile("O₂", "Blood oxygen", "#0A84FF");
        gridRow1.addView(mTileHr.container, weightedParams(0, 5));
        gridRow1.addView(mTileSpo2.container, weightedParams(5, 0));
        root.addView(gridRow1);

        // Grid Row 2: Steps & Sleep
        LinearLayout gridRow2 = new LinearLayout(this);
        gridRow2.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams gr2Lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        gr2Lp.topMargin = NothingXEnhancer.dp(this, 10);
        mTileSteps = createMetricTile("👣", "Steps", "#FF9F0A");
        mTileSleep = createMetricTile("☾", "Sleep", "#BF5AF2");
        gridRow2.addView(mTileSteps.container, weightedParams(0, 5));
        gridRow2.addView(mTileSleep.container, weightedParams(5, 0));
        root.addView(gridRow2, gr2Lp);

        // Grid Row 3: Stress & Workouts
        LinearLayout gridRow3 = new LinearLayout(this);
        gridRow3.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams gr3Lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        gr3Lp.topMargin = NothingXEnhancer.dp(this, 10);
        mTileStress = createMetricTile("⚡", "Stress", "#30D158");
        mTileSport = createMetricTile("🏃", "Workouts", "#64D2FF");
        gridRow3.addView(mTileStress.container, weightedParams(0, 5));
        gridRow3.addView(mTileSport.container, weightedParams(5, 0));
        root.addView(gridRow3, gr3Lp);

        // ─────────────────────────────────────────────────────────────────────
        // 4. 6-WAVE WATCH PRO 2 WAKE-UP ALARM TEST CARD
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout alertCard = createNothingCard();
        LinearLayout.LayoutParams alertLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        alertLp.topMargin = NothingXEnhancer.dp(this, 14);
        root.addView(alertCard, alertLp);

        LinearLayout alertRow = new LinearLayout(this);
        alertRow.setOrientation(LinearLayout.HORIZONTAL);
        alertRow.setGravity(Gravity.CENTER_VERTICAL);

        Button testAlertBtn = createNothingButton("🔔 Test 6x Watch Wake-Up", "#D71921", "#FFFFFF", 12.5f, 14, 10, 20);
        testAlertBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.startWakeUpAlarmBurst(
                        TestActivity.this,
                        "⏰ WAKE UP • Nothing X",
                        "Watch Pro 2 Wake-Up Alarm (" + NothingXEnhancer.formatClockShort(System.currentTimeMillis()) + ")",
                        6
                );
                mAlertStatusView.setVisibility(View.VISIBLE);
                mAlertStatusView.setText("● Sending 6 wake-up vibration waves to Watch Pro 2 + Phone Alarm...");
                refreshTimerUi();
            }
        });
        alertRow.addView(testAlertBtn, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button stopTestBtn = createNothingButton("⏹ Silence", "#2C2C2E", "#FFFFFF", 12f, 12, 10, 20);
        stopTestBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NothingXEnhancer.stopWakeUpAlarmBurst(TestActivity.this);
                mAlertStatusView.setText("✓ Wake-up alarm silenced.");
                refreshTimerUi();
            }
        });
        LinearLayout.LayoutParams stopTestLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        stopTestLp.leftMargin = NothingXEnhancer.dp(this, 8);
        alertRow.addView(stopTestBtn, stopTestLp);

        Button permBtn = createNothingButton("⚙", "#2C2C2E", "#C8C8D2", 12f, 12, 10, 20);
        permBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    startActivity(new Intent("android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS"));
                } catch (Throwable ignored) {}
            }
        });
        LinearLayout.LayoutParams permLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        permLp.leftMargin = NothingXEnhancer.dp(this, 6);
        alertRow.addView(permBtn, permLp);

        alertCard.addView(alertRow);

        mAlertStatusView = new TextView(this);
        mAlertStatusView.setTextColor(Color.parseColor("#30D158"));
        mAlertStatusView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        mAlertStatusView.setPadding(0, NothingXEnhancer.dp(this, 8), 0, 0);
        mAlertStatusView.setVisibility(View.GONE);
        alertCard.addView(mAlertStatusView);

        setContentView(scroll);

        refreshTimerUi();
        refreshHealthCards();
    }

    @Override
    protected void onResume() {
        super.onResume();
        NothingXEnhancer.requestFlutterHealthSync(this, new Runnable() {
            @Override
            public void run() {
                if (!isFinishing() && !isDestroyed()) {
                    refreshHealthCards();
                }
            }
        });
        mUiHandler.removeCallbacks(mTickRunnable);
        mUiHandler.post(mTickRunnable);
    }

    @Override
    protected void onPause() {
        super.onPause();
        mUiHandler.removeCallbacks(mTickRunnable);
    }

    private void refreshTimerUi() {
        SharedPreferences prefs = NothingXEnhancer.getPrefs(this);
        String state = prefs.getString("state", NothingXEnhancer.STATE_IDLE);
        long durationMs = prefs.getLong("duration_ms", mSelectedDurationMs);
        long targetEpochMs = prefs.getLong("target_epoch_ms", 0L);
        long remainingPausedMs = prefs.getLong("remaining_ms", 0L);
        long lastCompletedAtMs = prefs.getLong("last_completed_at_ms", 0L);
        String triggerReason = prefs.getString("start_trigger_reason", "Manual Start");

        boolean burstActive = NothingXEnhancer.isWakeUpBurstActive();
        if (burstActive) {
            int curW = NothingXEnhancer.getWakeUpBurstCurrentWave();
            int totW = NothingXEnhancer.getWakeUpBurstTotalWaves();
            mStopWakeUpBtn.setVisibility(View.VISIBLE);
            mStopWakeUpBtn.setText("⏹ STOP WAKE-UP ALARM • WAVE " + curW + "/" + totW + " VIBRATING WATCH");
            if (mAlertStatusView != null) {
                mAlertStatusView.setVisibility(View.VISIBLE);
                mAlertStatusView.setText("🔔 Wave " + curW + "/" + totW + " sent to Watch Pro 2 & Phone Alarm");
            }
        } else {
            mStopWakeUpBtn.setVisibility(View.GONE);
        }

        // Highlight active preset pill
        for (PresetButtonHolder h : mPresetButtons) {
            boolean selected = (h.durationMs == mSelectedDurationMs);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(Color.parseColor(selected ? "#D71921" : "#2C2C2E"));
            bg.setCornerRadius(NothingXEnhancer.dp(this, 18));
            h.button.setBackground(bg);
            h.button.setTextColor(Color.WHITE);
        }

        if (NothingXEnhancer.STATE_RUNNING.equals(state)) {
            long rem = Math.max(0L, targetEpochMs - System.currentTimeMillis());
            styleStatusPill("● RUNNING", "#143822", "#30D158");
            mRemainingTimeView.setText(NothingXEnhancer.formatHhMmSs(rem));
            mSubtitleTimeView.setText("Wake-up at " + NothingXEnhancer.formatClockShort(targetEpochMs)
                    + " • " + triggerReason);
        } else if (NothingXEnhancer.STATE_ARMED.equals(state)) {
            int hrThr = prefs.getInt("armed_hr_threshold", 65);
            String detail = prefs.getString("armed_status_detail",
                    "Waiting for Watch HR ≤ " + hrThr + " BPM");
            styleStatusPill("◉ WATCH ARMED", "#0D3B47", "#64D2FF");
            mRemainingTimeView.setText(NothingXEnhancer.formatHhMmSs(durationMs));
            mSubtitleTimeView.setText(detail);
        } else if (NothingXEnhancer.STATE_PAUSED.equals(state)) {
            String pauseReason = prefs.getString("paused_reason", "Paused");
            styleStatusPill("⏸ PAUSED", "#3A2E0D", "#FFD60A");
            mRemainingTimeView.setText(NothingXEnhancer.formatHhMmSs(remainingPausedMs));
            mSubtitleTimeView.setText(pauseReason + " • Tap Resume to continue");
        } else if (NothingXEnhancer.STATE_COMPLETED.equals(state)) {
            styleStatusPill(burstActive ? "🔔 WAKING UP" : "✓ COMPLETED", "#3A1518", "#FF453A");
            mRemainingTimeView.setText("00:00:00");
            mSubtitleTimeView.setText("6x Watch Wake-Up triggered at "
                    + NothingXEnhancer.formatClockShort(lastCompletedAtMs));
        } else {
            styleStatusPill("● READY", "#2C2C2E", "#98989F");
            mRemainingTimeView.setText(NothingXEnhancer.formatHhMmSs(mSelectedDurationMs));
            mSubtitleTimeView.setText("If started now • 6x Watch Wake-Up at "
                    + NothingXEnhancer.formatClockShort(System.currentTimeMillis() + mSelectedDurationMs));
        }
    }

    private void refreshHealthCards() {
        Map<String, String> data = NothingXEnhancer.getCleanDashboardData(this);
        boolean connected = "1".equals(data.get("watch_connected"));
        String watchName = data.get("watch_name");

        GradientDrawable connBg = new GradientDrawable();
        connBg.setColor(Color.parseColor("#1C1C1E"));
        connBg.setCornerRadius(NothingXEnhancer.dp(this, 18));
        mWatchConnBadge.setBackground(connBg);
        mWatchConnBadge.setTextColor(Color.parseColor(connected ? "#30D158" : "#8E8E93"));
        mWatchConnBadge.setText((connected ? "● " : "○ ") + (watchName != null ? watchName : "Watch Pro 2"));

        if (mLiveSyncSubView != null) {
            mLiveSyncSubView.setText((connected ? "● Live BLE Connected • Checked " : "○ Cached • Checked ")
                    + NothingXEnhancer.formatClockShort(System.currentTimeMillis()));
        }

        bindTile(mTileHr, data.get("hr_val"), data.get("hr_badge"), data.get("hr_sub"));
        bindTile(mTileSpo2, data.get("spo2_val"), data.get("spo2_badge"), data.get("spo2_sub"));
        bindTile(mTileSteps, data.get("step_val"), data.get("step_badge"), data.get("step_sub"));
        bindTile(mTileSleep, data.get("sleep_val"), data.get("sleep_badge"), data.get("sleep_sub"));
        bindTile(mTileStress, data.get("stress_val"), data.get("stress_badge"), data.get("stress_sub"));
        bindTile(mTileSport, data.get("sport_val"), data.get("sport_badge"), data.get("sport_sub"));
    }

    private void bindTile(MetricTile tile, String val, String badge, String sub) {
        if (tile == null) return;
        tile.valueView.setText(val != null ? val : "--");
        tile.subView.setText(sub != null ? sub : "");
        String b = badge != null ? badge : "NO DATA";
        tile.badgeView.setText(b);

        boolean active = !b.equals("NO DATA") && !b.equals("STANDBY");
        tile.badgeView.setTextColor(Color.parseColor(active ? "#30D158" : "#636366"));
        tile.valueView.setTextColor(Color.parseColor(active ? "#FFFFFF" : "#8E8E93"));
    }

    private void styleStatusPill(String text, String bgHex, String fgHex) {
        mStatusBadgeView.setText(text);
        mStatusBadgeView.setTextColor(Color.parseColor(fgHex));
        int pH = NothingXEnhancer.dp(this, 10);
        int pV = NothingXEnhancer.dp(this, 5);
        mStatusBadgeView.setPadding(pH, pV, pH, pV);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor(bgHex));
        bg.setCornerRadius(NothingXEnhancer.dp(this, 14));
        mStatusBadgeView.setBackground(bg);
    }

    private void addPresetChip(LinearLayout row, String label, final long durationMs) {
        Button b = createNothingButton(label, "#2C2C2E", "#FFFFFF", 12.5f, 10, 8, 18);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mSelectedDurationMs = durationMs;
                refreshTimerUi();
            }
        });
        mPresetButtons.add(new PresetButtonHolder(b, durationMs));
        row.addView(b, weightedParams(3, 3));
    }

    private TextView createCircleIcon(String symbol) {
        TextView tv = new TextView(this);
        tv.setText(symbol);
        tv.setTextColor(Color.WHITE);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        tv.setGravity(Gravity.CENTER);
        int size = NothingXEnhancer.dp(this, 34);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(size, size);
        tv.setLayoutParams(lp);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor("#2C2C2E"));
        bg.setCornerRadius(size / 2f);
        tv.setBackground(bg);
        return tv;
    }

    private MetricTile createMetricTile(String iconSymbol, String title, String iconColorHex) {
        LinearLayout card = createNothingCard();

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView iconTv = createCircleIcon(iconSymbol);
        iconTv.setTextColor(Color.parseColor(iconColorHex));
        top.addView(iconTv);

        LinearLayout titleCol = new LinearLayout(this);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams tcLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tcLp.leftMargin = NothingXEnhancer.dp(this, 8);

        TextView titleTv = new TextView(this);
        titleTv.setText(title);
        titleTv.setTextColor(Color.WHITE);
        titleTv.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        titleCol.addView(titleTv);

        TextView badgeTv = new TextView(this);
        badgeTv.setText("SYNCED");
        badgeTv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        badgeTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 9f);
        titleCol.addView(badgeTv);

        top.addView(titleCol, tcLp);
        card.addView(top);

        TextView valTv = new TextView(this);
        valTv.setText("--");
        valTv.setTextColor(Color.WHITE);
        valTv.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        valTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 23f);
        valTv.setPadding(0, NothingXEnhancer.dp(this, 10), 0, NothingXEnhancer.dp(this, 2));
        card.addView(valTv);

        TextView subTv = new TextView(this);
        subTv.setText("Waiting for watch");
        subTv.setTextColor(Color.parseColor("#8E8E93"));
        subTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        card.addView(subTv);

        return new MetricTile(card, iconTv, titleTv, badgeTv, valTv, subTv);
    }

    /**
     * Authentic Nothing X borderless dark surface card (#1C1C1E, 24dp radius).
     */
    private LinearLayout createNothingCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        int pad = NothingXEnhancer.dp(this, 16);
        card.setPadding(pad, pad, pad, pad);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor("#1C1C1E"));
        bg.setCornerRadius(NothingXEnhancer.dp(this, 24));
        card.setBackground(bg);
        return card;
    }

    private EditText createCompactInput(String hint) {
        EditText et = new EditText(this);
        et.setHint(hint);
        et.setHintTextColor(Color.parseColor("#636366"));
        et.setTextColor(Color.WHITE);
        et.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        et.setInputType(InputType.TYPE_CLASS_NUMBER);
        et.setGravity(Gravity.CENTER);
        int pH = NothingXEnhancer.dp(this, 10);
        int pV = NothingXEnhancer.dp(this, 8);
        et.setPadding(pH, pV, pH, pV);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor("#2C2C2E"));
        bg.setCornerRadius(NothingXEnhancer.dp(this, 14));
        et.setBackground(bg);
        return et;
    }

    private Button createNothingButton(String text, String bgHex, String fgHex, float spSize, int padHDp, int padVDp, int radiusDp) {
        Button b = new Button(this);
        b.setAllCaps(false);
        b.setText(text);
        b.setTextColor(Color.parseColor(fgHex));
        b.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        b.setTextSize(TypedValue.COMPLEX_UNIT_SP, spSize);
        int pH = NothingXEnhancer.dp(this, padHDp);
        int pV = NothingXEnhancer.dp(this, padVDp);
        b.setPadding(pH, pV, pH, pV);
        b.setMinHeight(0);
        b.setMinimumHeight(0);
        b.setMinWidth(0);
        b.setMinimumWidth(0);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor(bgHex));
        bg.setCornerRadius(NothingXEnhancer.dp(this, radiusDp));
        b.setBackground(bg);
        return b;
    }

    private LinearLayout.LayoutParams weightedParams(int leftDp, int rightDp) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        lp.leftMargin = NothingXEnhancer.dp(this, leftDp);
        lp.rightMargin = NothingXEnhancer.dp(this, rightDp);
        return lp;
    }

    private void requestNotificationPermissionIfNeeded() {
        try {
            if (Build.VERSION.SDK_INT >= 33) {
                if (checkSelfPermission("android.permission.POST_NOTIFICATIONS") != PackageManager.PERMISSION_GRANTED) {
                    requestPermissions(new String[]{"android.permission.POST_NOTIFICATIONS"}, 4050);
                }
            }
        } catch (Throwable ignored) {}
    }
}
