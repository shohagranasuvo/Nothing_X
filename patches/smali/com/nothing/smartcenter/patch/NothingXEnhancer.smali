.class public final Lcom/nothing/smartcenter/patch/NothingXEnhancer;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;,
        Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;
    }
.end annotation


# static fields
.field public static final ACTION_WAKE_UP:Ljava/lang/String; = "com.nothing.smartcenter.ACTION_WAKE_UP"

.field public static final CHANNEL_ID:Ljava/lang/String; = "nothing_x_sleep_timer_channel"

.field public static final EXTRA_SLEEP_DETECTOR_POLL:Ljava/lang/String; = "nt_sleep_detector_poll"

.field public static final EXTRA_SLEEP_TIMER_ALARM:Ljava/lang/String; = "nt_sleep_timer_alarm"

.field public static final EXTRA_TIMER_ID:Ljava/lang/String; = "nt_timer_id"

.field public static final NOTIF_ID_SLEEP_TIMER:I = 0x9e35

.field public static final NOTIF_ID_WATCH_TEST:I = 0x9e36

.field public static final PREFS_NAME:Ljava/lang/String; = "nothing_x_sleep_timer"

.field public static final REQ_CODE_SLEEP_POLL:I = 0x9e37

.field public static final STATE_ARMED:Ljava/lang/String; = "ARMED"

.field public static final STATE_COMPLETED:Ljava/lang/String; = "COMPLETED"

.field public static final STATE_IDLE:Ljava/lang/String; = "IDLE"

.field public static final STATE_PAUSED:Ljava/lang/String; = "PAUSED"

.field public static final STATE_RUNNING:Ljava/lang/String; = "RUNNING"

.field public static final TAG:Ljava/lang/String; = "NothingXEnhancer"

.field private static volatile sActiveAlarmRingtone:Landroid/media/Ringtone;

.field private static final sBurstHandler:Landroid/os/Handler;

.field private static volatile sCachedDashboardMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sDbRefreshInFlight:Z

.field private static final sFlutterHealthCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sFlutterHealthCacheTimeMs:J

.field private static final sFlutterRawJsonCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sFlutterTimestampCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static volatile sIsHealthTabActive:Z

.field private static volatile sLastArmedPollMs:J

.field private static volatile sLastDbRefreshMs:J

.field private static volatile sLastLifecyclePulseMs:J

.field public static volatile sLiveHeartRateBpm:I

.field public static volatile sLiveSpo2Val:Ljava/lang/String;

.field public static volatile sLiveStepVal:Ljava/lang/String;

.field private static volatile sLoggedDbSchemaOnce:Z

.field private static volatile sWakeUpBurstActive:Z

.field private static volatile sWakeUpBurstCurrentWave:I

.field private static volatile sWakeUpBurstTotalWaves:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 88
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 89
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 90
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 91
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterRawJsonCache:Ljava/util/Map;

    .line 92
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 93
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterTimestampCache:Ljava/util/Map;

    .line 94
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCacheTimeMs:J

    .line 95
    sput-wide v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastArmedPollMs:J

    .line 96
    sput-wide v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastLifecyclePulseMs:J

    .line 97
    sput-wide v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastDbRefreshMs:J

    .line 98
    const/4 v0, 0x0

    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sCachedDashboardMap:Ljava/util/Map;

    .line 99
    const/4 v1, 0x0

    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sDbRefreshInFlight:Z

    .line 102
    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z

    .line 103
    sput v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstCurrentWave:I

    .line 104
    const/4 v2, 0x6

    sput v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstTotalWaves:I

    .line 105
    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sActiveAlarmRingtone:Landroid/media/Ringtone;

    .line 106
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sBurstHandler:Landroid/os/Handler;

    .line 107
    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLoggedDbSchemaOnce:Z

    .line 110
    sput v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    .line 111
    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    .line 112
    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;

    .line 113
    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .registers 9

    .line 69
    invoke-static/range {p0 .. p8}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->updateCardContent(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$1002(Z)Z
    .registers 1

    .line 69
    sput-boolean p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sDbRefreshInFlight:Z

    return p0
.end method

.method static synthetic access$200()Z
    .registers 1

    .line 69
    sget-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z

    return v0
.end method

.method static synthetic access$302(Landroid/media/Ringtone;)Landroid/media/Ringtone;
    .registers 1

    .line 69
    sput-object p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sActiveAlarmRingtone:Landroid/media/Ringtone;

    return-object p0
.end method

.method static synthetic access$402(I)I
    .registers 1

    .line 69
    sput p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstCurrentWave:I

    return p0
.end method

.method static synthetic access$500(Landroid/content/Context;)V
    .registers 1

    .line 69
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->vibratePhoneStrong(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$600()Landroid/os/Handler;
    .registers 1

    .line 69
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sBurstHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$700(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 2

    .line 69
    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->parseFlutterSyncResult(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$802(Ljava/util/Map;)Ljava/util/Map;
    .registers 1

    .line 69
    sput-object p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sCachedDashboardMap:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$900(Landroid/content/Context;)Ljava/util/Map;
    .registers 1

    .line 69
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->computeDashboardDataInternal(Landroid/content/Context;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method private static appendMetricLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 1957
    const-string v0, "\u25b8 "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1958
    const-string p1, "  Source: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1959
    nop

    .line 1960
    const/4 p1, 0x1

    if-eqz p2, :cond_35

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_35

    .line 1961
    const-string p4, "  SQLite: "

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1962
    const/4 p2, 0x1

    goto :goto_36

    .line 1964
    :cond_35
    const/4 p2, 0x0

    :goto_36
    if-eqz p3, :cond_54

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_54

    const-string p4, "0 records"

    invoke-virtual {p3, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_54

    .line 1965
    const-string p2, "  HealthSync: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1966
    goto :goto_55

    .line 1968
    :cond_54
    move p1, p2

    :goto_55
    if-nez p1, :cond_5c

    .line 1969
    const-string p1, "  Status: [UNAVAILABLE] \u2014 No synced watch measurements found yet. Connect Nothing Watch Pro 2 and sync in Nothing X.\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1971
    :cond_5c
    return-void
.end method

.method public static declared-synchronized armTimerForWatchSleep(Landroid/content/Context;JI)V
    .registers 13

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 781
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 782
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelAlarm(Landroid/content/Context;)V

    .line 783
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelSleepDetectorPoll(Landroid/content/Context;)V

    .line 785
    const/16 v1, 0x28

    if-lt p3, v1, :cond_15

    const/16 v1, 0x6e

    if-le p3, v1, :cond_17

    .line 786
    :cond_15
    const/16 p3, 0x41

    .line 789
    :cond_17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 790
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->readWatchHealthSnapshot(Landroid/content/Context;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;

    move-result-object v3

    .line 792
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-lez v5, :cond_44

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Watch HR "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " BPM \u2022 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_46

    :cond_44
    const-string v5, ""

    :goto_46
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Starts when HR \u2264 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " BPM & 0 steps"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 795
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 796
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "state"

    const-string v7, "ARMED"

    .line 797
    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "duration_ms"

    .line 798
    invoke-interface {v5, v6, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "target_epoch_ms"

    .line 799
    const-wide/16 v7, 0x0

    invoke-interface {v5, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "remaining_ms"

    .line 800
    invoke-interface {v5, v6, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "armed_at_ms"

    .line 801
    invoke-interface {v5, v6, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "armed_hr_threshold"

    .line 802
    invoke-interface {v5, v6, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "armed_baseline_hr_rows"

    iget v7, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->hrRows:I

    .line 803
    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "armed_baseline_hr_time_ms"

    iget-wide v7, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J

    .line 804
    invoke-interface {v5, v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "armed_baseline_step_rows"

    iget v7, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->stepRows:I

    .line 805
    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "armed_baseline_sleep_rows"

    iget v3, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->sleepRows:I

    .line 806
    invoke-interface {v5, v6, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v5, "armed_last_check_ms"

    .line 807
    invoke-interface {v3, v5, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v5, "armed_status_detail"

    .line 808
    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 809
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 811
    const-wide/32 v3, 0xea60

    add-long/2addr v1, v3

    invoke-static {p0, v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scheduleSleepDetectorPoll(Landroid/content/Context;J)V

    .line 812
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->requestFlutterHealthSync(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 813
    const-string p0, "NothingXEnhancer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sleep Timer ARMED for Watch Sleep detection: durationMs="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " hrThreshold="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_ea
    .catchall {:try_start_3 .. :try_end_ea} :catchall_ec

    .line 814
    monitor-exit v0

    return-void

    .line 780
    :catchall_ec
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static attachToMainActivity(Landroid/app/Activity;)V
    .registers 30

    .line 123
    move-object/from16 v12, p0

    const-string v0, "nt_health_custom_card"

    const-string v13, "NothingXEnhancer"

    const-string v1, "#FFFFFF"

    const-string v2, "#8E8E93"

    const-string v3, "#2C2C2E"

    if-nez v12, :cond_f

    return-void

    .line 125
    :cond_f
    :try_start_f
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->ensureTimerRestored(Landroid/content/Context;)V

    .line 126
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    if-eqz v4, :cond_26

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    goto :goto_27

    :cond_26
    const/4 v14, 0x0

    .line 127
    :goto_27
    if-nez v14, :cond_2a

    return-void

    .line 128
    :cond_2a
    const v4, 0x1020002

    invoke-virtual {v14, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Landroid/view/ViewGroup;

    .line 129
    if-nez v15, :cond_37

    return-void

    .line 132
    :cond_37
    const-string v4, "nt_sleep_health_fab"

    invoke-virtual {v15, v4}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    .line 133
    if-eqz v4, :cond_42

    .line 134
    invoke-virtual {v15, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 137
    :cond_42
    invoke-virtual {v15, v0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    .line 138
    if-eqz v4, :cond_4c

    .line 139
    invoke-virtual {v4}, Landroid/view/View;->bringToFront()V

    .line 140
    return-void

    .line 144
    :cond_4c
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 145
    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 146
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 147
    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v12, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v5

    .line 148
    const/high16 v6, 0x41500000    # 13.0f

    invoke-static {v12, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v6

    .line 149
    invoke-virtual {v10, v5, v6, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 151
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 152
    const-string v6, "#F21C1C1E"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 153
    const/high16 v6, 0x41b00000    # 22.0f

    invoke-static {v12, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 154
    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v12, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v8

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v5, v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 155
    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 156
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    const/high16 v9, 0x41000000    # 8.0f

    if-lt v5, v8, :cond_9f

    .line 157
    invoke-static {v12, v9}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 160
    :cond_9f
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x51

    const/4 v11, -0x2

    const/4 v6, -0x1

    invoke-direct {v8, v6, v11, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 165
    invoke-static {v12, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v5

    iput v5, v8, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 166
    invoke-static {v12, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v4

    iput v4, v8, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 167
    const/high16 v4, 0x41c00000    # 24.0f

    invoke-static {v12, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v4

    iput v4, v8, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 170
    const/16 v5, 0x8

    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 173
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 174
    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 175
    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 177
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v12}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 178
    const-string v6, "\u23f0"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    const/high16 v6, 0x41600000    # 14.0f

    const/4 v7, 0x2

    invoke-virtual {v5, v7, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 180
    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 181
    const/high16 v6, 0x41f00000    # 30.0f

    invoke-static {v12, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v6

    .line 182
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 183
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 184
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 185
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v7, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 186
    int-to-float v6, v6

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v6, v9

    invoke-virtual {v7, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 187
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 188
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 190
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 191
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 192
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    invoke-direct {v6, v9, v11, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 193
    const/high16 v7, 0x41200000    # 10.0f

    invoke-static {v12, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v9

    iput v9, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 195
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v12}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 196
    const-string v11, "Sleep Timer & Smart Alarm"

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    const/4 v11, -0x1

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    sget-object v11, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    const/4 v7, 0x0

    invoke-virtual {v9, v11, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 199
    const/high16 v7, 0x41680000    # 14.5f

    const/4 v11, 0x2

    invoke-virtual {v9, v11, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 200
    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 202
    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, v12}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 203
    const-string v7, "Auto-stops when awake \u2022 6x Watch Vibration"

    invoke-virtual {v11, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v11, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 205
    const/high16 v7, 0x41280000    # 10.5f

    const/4 v9, 0x2

    invoke-virtual {v11, v9, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 206
    invoke-virtual {v5, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 208
    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v12}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 211
    const-string v5, "READY"

    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v9, v5, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 214
    const/high16 v5, 0x41180000    # 9.5f

    const/4 v6, 0x2

    invoke-virtual {v9, v6, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 215
    const/high16 v5, 0x41000000    # 8.0f

    invoke-static {v12, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v5

    .line 216
    const/high16 v6, 0x40800000    # 4.0f

    invoke-static {v12, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v6

    .line 217
    invoke-virtual {v9, v5, v6, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 218
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 219
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 220
    const/high16 v6, 0x41200000    # 10.0f

    invoke-static {v12, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 221
    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 222
    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 224
    invoke-virtual {v10, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 227
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 228
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 229
    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 230
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x1

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 234
    const/high16 v6, 0x40c00000    # 6.0f

    invoke-static {v12, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v7

    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 235
    invoke-static {v12, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 237
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v12}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 238
    const-string v6, "02:00:00"

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    const/4 v6, -0x1

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 240
    sget-object v6, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v7, v6, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 241
    const/4 v0, 0x2

    const/high16 v6, 0x41b00000    # 22.0f

    invoke-virtual {v7, v0, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 242
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    move-object/from16 v18, v8

    move-object/from16 v20, v14

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v8, -0x2

    const/4 v14, 0x0

    invoke-direct {v0, v14, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    new-instance v14, Landroid/widget/TextView;

    invoke-direct {v14, v12}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 245
    const-string v0, "\u2665 -- BPM \u2022 \ud83d\udca7 -- % \u2022 \ud83d\udc63 --"

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 247
    const/high16 v0, 0x41300000    # 11.0f

    const/4 v2, 0x2

    invoke-virtual {v14, v2, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 248
    const v0, 0x800005

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 249
    invoke-virtual {v4, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 251
    invoke-virtual {v10, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 254
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 255
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 256
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/4 v4, -0x1

    invoke-direct {v8, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 261
    const-string v2, "\u25b6 Start"

    const-string v4, "#D71921"

    invoke-static {v12, v2, v4, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createCustomCardButton(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    .line 262
    const-string v2, "\u25c9 Auto-Sleep"

    invoke-static {v12, v2, v3, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createCustomCardButton(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 263
    const-string v2, "\u2699 Full"

    invoke-static {v12, v2, v3, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createCustomCardButton(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    .line 265
    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-static {v12, v2, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->weightedParams(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v0, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 266
    invoke-static {v12, v1, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->weightedParams(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 267
    const/4 v3, 0x0

    invoke-static {v12, v1, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->weightedParams(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 269
    new-instance v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;
    :try_end_254
    .catchall {:try_start_f .. :try_end_254} :catchall_386

    move-object v1, v2

    move-object/from16 v21, v13

    move-object v13, v2

    move-object/from16 v2, p0

    const/16 v22, 0x0

    move-object v3, v10

    move-object/from16 v23, v4

    move-object v4, v11

    move-object/from16 v24, v5

    const/16 v19, 0x8

    move-object v5, v9

    move-object/from16 v25, v6

    move-object v6, v7

    move-object/from16 v26, v7

    move-object v7, v14

    move-object/from16 v27, v18

    move-object/from16 v18, v15

    move-object v15, v8

    move-object/from16 v8, v25

    move-object/from16 v22, v9

    move-object/from16 v9, v24

    move-object/from16 v28, v10

    move-object/from16 v10, v23

    :try_start_27a
    invoke-direct/range {v1 .. v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    move-object/from16 v10, v25

    invoke-virtual {v10, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    new-instance v13, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;

    move-object v1, v13

    move-object/from16 v2, p0

    move-object/from16 v3, v28

    move-object v4, v11

    move-object/from16 v5, v22

    move-object/from16 v6, v26

    move-object v7, v14

    move-object v8, v10

    move-object/from16 v9, v24

    move-object/from16 v25, v10

    move-object/from16 v10, v23

    invoke-direct/range {v1 .. v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    move-object/from16 v10, v24

    invoke-virtual {v10, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 306
    new-instance v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$3;

    invoke-direct {v1, v12}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$3;-><init>(Landroid/app/Activity;)V

    move-object/from16 v13, v23

    invoke-virtual {v13, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 315
    new-instance v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$4;

    invoke-direct {v1, v12}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$4;-><init>(Landroid/app/Activity;)V

    move-object/from16 v9, v28

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 324
    invoke-virtual {v9, v0, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 325
    move-object/from16 v4, v18

    move-object/from16 v0, v27

    invoke-virtual {v4, v9, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 328
    invoke-static/range {p0 .. p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "is_health_tab_active"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    .line 329
    sget-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    if-eqz v0, :cond_2cf

    const/4 v5, 0x0

    goto :goto_2d1

    :cond_2cf
    const/16 v5, 0x8

    :goto_2d1
    invoke-virtual {v9, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V
    :try_end_2d4
    .catchall {:try_start_27a .. :try_end_2d4} :catchall_382

    .line 333
    :try_start_2d4
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 334
    if-eqz v0, :cond_2e1

    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    move-object/from16 v16, v1

    goto :goto_2e3

    :cond_2e1
    const/16 v16, 0x0

    .line 335
    :goto_2e3
    if-eqz v0, :cond_329

    if-eqz v16, :cond_329

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/reflect/Proxy;->isProxyClass(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_329

    .line 336
    const-class v1, Landroid/view/Window$Callback;

    .line 337
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v15

    const/4 v1, 0x1

    new-array v8, v1, [Ljava/lang/Class;

    const-class v1, Landroid/view/Window$Callback;

    aput-object v1, v8, v2

    new-instance v7, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;
    :try_end_300
    .catchall {:try_start_2d4 .. :try_end_300} :catchall_334

    move-object v1, v7

    move-object/from16 v2, p0

    move-object v3, v9

    move-object v4, v11

    move-object/from16 v5, v22

    move-object/from16 v6, v26

    move-object v12, v7

    move-object v7, v14

    move-object/from16 v17, v14

    move-object v14, v8

    move-object/from16 v8, v25

    move-object/from16 v18, v9

    move-object v9, v10

    move-object/from16 v19, v10

    move-object v10, v13

    move-object/from16 v23, v11

    move-object/from16 v11, v16

    :try_start_31a
    invoke-direct/range {v1 .. v11}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;Landroid/view/Window$Callback;)V

    .line 336
    invoke-static {v15, v14, v12}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/Window$Callback;

    .line 375
    invoke-virtual {v0, v1}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V
    :try_end_326
    .catchall {:try_start_31a .. :try_end_326} :catchall_327

    goto :goto_331

    .line 377
    :catchall_327
    move-exception v0

    goto :goto_33d

    .line 335
    :cond_329
    move-object/from16 v18, v9

    move-object/from16 v19, v10

    move-object/from16 v23, v11

    move-object/from16 v17, v14

    .line 379
    :goto_331
    move-object/from16 v14, v21

    goto :goto_359

    .line 377
    :catchall_334
    move-exception v0

    move-object/from16 v18, v9

    move-object/from16 v19, v10

    move-object/from16 v23, v11

    move-object/from16 v17, v14

    .line 378
    :goto_33d
    :try_start_33d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Window callback proxy note: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_354
    .catchall {:try_start_33d .. :try_end_354} :catchall_382

    move-object/from16 v14, v21

    :try_start_356
    invoke-static {v14, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    :goto_359
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 383
    new-instance v15, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;

    move-object v1, v15

    move-object/from16 v2, p0

    move-object/from16 v3, v20

    move-object/from16 v4, v18

    move-object/from16 v5, v23

    move-object/from16 v6, v22

    move-object/from16 v7, v26

    move-object/from16 v8, v17

    move-object/from16 v9, v25

    move-object/from16 v10, v19

    move-object v11, v13

    move-object v12, v0

    invoke-direct/range {v1 .. v12}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;-><init>(Landroid/app/Activity;Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;Landroid/os/Handler;)V

    .line 399
    invoke-virtual {v0, v15}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_37f
    .catchall {:try_start_356 .. :try_end_37f} :catchall_380

    .line 403
    goto :goto_38d

    .line 401
    :catchall_380
    move-exception v0

    goto :goto_388

    :catchall_382
    move-exception v0

    move-object/from16 v14, v21

    goto :goto_388

    :catchall_386
    move-exception v0

    move-object v14, v13

    .line 402
    :goto_388
    const-string v1, "attachToMainActivity error"

    invoke-static {v14, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 404
    :goto_38d
    return-void
.end method

.method private static buildAlarmPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;
    .registers 6

    .line 1079
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1080
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.nothing.nt_lifecycle.receiver.KeepAliveReceiver"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1081
    const-string v1, "com.nothing.smartcenter.ACTION_WAKE_UP"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1082
    const-string v1, "nt_sleep_timer_alarm"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1083
    const-string v1, "nt_timer_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1084
    nop

    .line 1085
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x17

    if-lt p1, p2, :cond_28

    .line 1086
    const/high16 p1, 0xc000000

    goto :goto_2a

    .line 1085
    :cond_28
    const/high16 p1, 0x8000000

    .line 1088
    :goto_2a
    const p2, 0x9e35

    invoke-static {p0, p2, v0, p1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public static buildHealthMonitoringReport(Landroid/content/Context;)Ljava/lang/String;
    .registers 18

    .line 1786
    const-string v1, ")\n"

    const-string v2, "\n"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1787
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    .line 1790
    const-string v0, "\u2501\u2501 WATCH & BLE CONNECTION STATUS \u2501\u2501\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1791
    nop

    .line 1793
    const/4 v5, 0x1

    :try_start_14
    const-string v0, "bluetooth"

    invoke-virtual {v4, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothManager;

    .line 1794
    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v7

    goto :goto_27

    :cond_23
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v7

    .line 1795
    :goto_27
    if-eqz v7, :cond_11e

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v8

    if-nez v8, :cond_31

    goto/16 :goto_11e

    .line 1798
    :cond_31
    const-string v8, "\u2022 Bluetooth Adapter: Enabled\n"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_36
    .catchall {:try_start_14 .. :try_end_36} :catchall_125

    .line 1800
    const-string v8, "]\n"

    const-string v9, " ["

    if-eqz v0, :cond_8a

    .line 1801
    const/4 v10, 0x7

    :try_start_3d
    invoke-virtual {v0, v10}, Landroid/bluetooth/BluetoothManager;->getConnectedDevices(I)Ljava/util/List;

    move-result-object v0

    .line 1802
    if-eqz v0, :cond_80

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_80

    .line 1803
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0
    :try_end_4d
    .catch Ljava/lang/SecurityException; {:try_start_3d .. :try_end_4d} :catch_86
    .catchall {:try_start_3d .. :try_end_4d} :catchall_125

    const/4 v10, 0x0

    :goto_4e
    :try_start_4e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/bluetooth/BluetoothDevice;

    .line 1804
    invoke-virtual {v11}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v12

    .line 1805
    const-string v13, "\u2022 Connected BLE GATT Device: "

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 1806
    if-eqz v12, :cond_67

    goto :goto_69

    :cond_67
    const-string v12, "Unknown"

    :goto_69
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 1807
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v11}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7c
    .catch Ljava/lang/SecurityException; {:try_start_4e .. :try_end_7c} :catch_10b
    .catchall {:try_start_4e .. :try_end_7c} :catchall_109

    .line 1808
    nop

    .line 1809
    const/4 v10, 0x1

    goto :goto_4e

    :cond_7f
    goto :goto_8b

    .line 1811
    :cond_80
    :try_start_80
    const-string v0, "\u2022 Connected BLE GATT Devices: 0\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_85
    .catch Ljava/lang/SecurityException; {:try_start_80 .. :try_end_85} :catch_86
    .catchall {:try_start_80 .. :try_end_85} :catchall_125

    goto :goto_8a

    .line 1831
    :catch_86
    move-exception v0

    const/4 v10, 0x0

    goto/16 :goto_10c

    .line 1814
    :cond_8a
    :goto_8a
    const/4 v10, 0x0

    :goto_8b
    :try_start_8b
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v0

    .line 1815
    if-eqz v0, :cond_108

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_108

    .line 1816
    nop

    .line 1817
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const/4 v11, 0x0

    :goto_9d
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_f5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/bluetooth/BluetoothDevice;

    .line 1818
    invoke-virtual {v12}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v13

    .line 1819
    if-eqz v13, :cond_f4

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v13, v14}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "watch"

    invoke-virtual {v14, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_d9

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 1820
    invoke-virtual {v13, v14}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "cmf"

    invoke-virtual {v14, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_d9

    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 1821
    invoke-virtual {v13, v14}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "nothing"

    invoke-virtual {v14, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    if-eqz v14, :cond_f4

    .line 1822
    :cond_d9
    const-string v14, "\u2022 Paired Nothing/CMF Wearable: "

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 1823
    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v12}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1824
    add-int/lit8 v11, v11, 0x1

    .line 1826
    :cond_f4
    goto :goto_9d

    .line 1827
    :cond_f5
    if-nez v11, :cond_108

    .line 1828
    const-string v7, "\u2022 Paired Nothing/CMF Wearables: 0 (Total bonded BT devices: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_108
    .catch Ljava/lang/SecurityException; {:try_start_8b .. :try_end_108} :catch_10b
    .catchall {:try_start_8b .. :try_end_108} :catchall_109

    .line 1833
    :cond_108
    goto :goto_124

    .line 1835
    :catchall_109
    move-exception v0

    goto :goto_127

    .line 1831
    :catch_10b
    move-exception v0

    .line 1832
    :goto_10c
    :try_start_10c
    const-string v7, "\u2022 Bluetooth query requires BLUETOOTH_CONNECT permission ("

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_11d
    .catchall {:try_start_10c .. :try_end_11d} :catchall_109

    goto :goto_124

    .line 1796
    :cond_11e
    :goto_11e
    :try_start_11e
    const-string v0, "\u2022 Bluetooth Adapter: Disabled or unavailable\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_123
    .catchall {:try_start_11e .. :try_end_123} :catchall_125

    const/4 v10, 0x0

    .line 1837
    :goto_124
    goto :goto_138

    .line 1835
    :catchall_125
    move-exception v0

    const/4 v10, 0x0

    .line 1836
    :goto_127
    const-string v7, "\u2022 Bluetooth status check error: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1839
    :goto_138
    const-string v0, "\u2022 Real-Time Streaming Note: Nothing Watch Pro 2 (model D398 / ID 34F72851) "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1840
    if-eqz v10, :cond_143

    .line 1841
    const-string v7, "is connected over BLE; live readings update when watch measurement/sync runs.\n\n"

    goto :goto_145

    .line 1842
    :cond_143
    const-string v7, "is not currently streaming over BLE. Real-time live sensor stream is [UNAVAILABLE] until the watch is connected.\n\n"

    .line 1840
    :goto_145
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1845
    const-string v0, "\u2501\u2501 HEALTH METRICS (ACTUAL READINGS & TIMESTAMPS) \u2501\u2501\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1846
    invoke-static {v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->findSqliteDatabases(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 1847
    nop

    .line 1848
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_156
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_172

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/File;

    .line 1849
    const-string v9, "nothing_x.db"

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_171

    .line 1850
    nop

    .line 1851
    goto :goto_173

    .line 1853
    :cond_171
    goto :goto_156

    .line 1848
    :cond_172
    move-object v7, v8

    .line 1855
    :goto_173
    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1856
    const-string v10, "Heart Rate (BPM)"

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1857
    const-string v11, "SpO2 / Blood Oxygen (%)"

    invoke-interface {v9, v11, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1858
    const-string v12, "Steps & Activity"

    invoke-interface {v9, v12, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1859
    const-string v13, "Sleep"

    invoke-interface {v9, v13, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1860
    const-string v14, "Stress"

    invoke-interface {v9, v14, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1861
    const-string v15, "Vitality (VII) & Sport"

    invoke-interface {v9, v15, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1863
    if-eqz v7, :cond_28f

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_28f

    .line 1864
    nop

    .line 1866
    :try_start_19f
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v8, v5}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7
    :try_end_1a7
    .catchall {:try_start_19f .. :try_end_1a7} :catchall_26c

    .line 1867
    :try_start_1a7
    invoke-static {v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->listTables(Landroid/database/sqlite/SQLiteDatabase;)Ljava/util/List;

    move-result-object v0

    .line 1868
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1af
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_262

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v5, v16

    check-cast v5, Ljava/lang/String;

    .line 1869
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    .line 1870
    const-string v8, "heart_rate"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_257

    const-string v8, "heartrate"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1d5

    goto/16 :goto_257

    .line 1872
    :cond_1d5
    const-string v8, "spo2"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_24f

    const-string v8, "oxygen"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1e6

    goto :goto_24f

    .line 1874
    :cond_1e6
    const-string v8, "step"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1f6

    .line 1875
    invoke-static {v7, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v9, v12, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25e

    .line 1876
    :cond_1f6
    const-string v8, "sleep"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_206

    .line 1877
    invoke-static {v7, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v9, v13, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25e

    .line 1878
    :cond_206
    const-string v8, "stress"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_216

    .line 1879
    invoke-static {v7, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v9, v14, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25e

    .line 1880
    :cond_216
    const-string v8, "vii"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_226

    const-string v8, "sport"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_25e

    .line 1881
    :cond_226
    invoke-interface {v9, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 1882
    invoke-static {v7, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1883
    if-nez v6, :cond_233

    :goto_232
    goto :goto_24b

    :cond_233
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " | "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_232

    :goto_24b
    invoke-interface {v9, v15, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25e

    .line 1873
    :cond_24f
    :goto_24f
    invoke-static {v7, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v9, v11, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25e

    .line 1871
    :cond_257
    :goto_257
    invoke-static {v7, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v9, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_25e
    .catchall {:try_start_1a7 .. :try_end_25e} :catchall_26a

    .line 1885
    :cond_25e
    :goto_25e
    const/4 v5, 0x1

    const/4 v8, 0x0

    goto/16 :goto_1af

    .line 1889
    :cond_262
    if-eqz v7, :cond_28f

    .line 1890
    :try_start_264
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_267
    .catchall {:try_start_264 .. :try_end_267} :catchall_268

    goto :goto_28f

    :catchall_268
    move-exception v0

    goto :goto_28f

    .line 1886
    :catchall_26a
    move-exception v0

    goto :goto_26e

    :catchall_26c
    move-exception v0

    const/4 v7, 0x0

    .line 1887
    :goto_26e
    :try_start_26e
    const-string v5, "\u2022 SQLite read error on nothing_x.db: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_27f
    .catchall {:try_start_26e .. :try_end_27f} :catchall_285

    .line 1889
    if-eqz v7, :cond_28f

    .line 1890
    :try_start_281
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_284
    .catchall {:try_start_281 .. :try_end_284} :catchall_268

    goto :goto_28f

    .line 1889
    :catchall_285
    move-exception v0

    move-object v1, v0

    if-eqz v7, :cond_28e

    .line 1890
    :try_start_289
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_28c
    .catchall {:try_start_289 .. :try_end_28c} :catchall_28d

    goto :goto_28e

    :catchall_28d
    move-exception v0

    .line 1892
    :cond_28e
    :goto_28e
    throw v1

    .line 1896
    :cond_28f
    :goto_28f
    nop

    .line 1897
    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1898
    const-string v6, "HEART_RATE"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1896
    const-string v6, "1. Heart Rate"

    const-string v7, "HeartRateReportDbModelTable / SyncType.HEART_RATE"

    invoke-static {v3, v6, v0, v5, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->appendMetricLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1901
    nop

    .line 1902
    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1903
    const-string v6, "OXYGEN_SATURATION"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1901
    const-string v6, "2. SpO2 (Blood Oxygen)"

    const-string v7, "Spo2ReportDbModelTable / SyncType.OXYGEN_SATURATION"

    invoke-static {v3, v6, v0, v5, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->appendMetricLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1906
    nop

    .line 1907
    invoke-interface {v9, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1908
    const-string v6, "STEP"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1906
    const-string v6, "3. Steps & Activity"

    const-string v7, "StepReportDbModelTable / SyncType.STEP"

    invoke-static {v3, v6, v0, v5, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->appendMetricLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1911
    nop

    .line 1912
    invoke-interface {v9, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1913
    const-string v6, "SLEEP"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1911
    const-string v6, "4. Sleep"

    const-string v7, "SleepReportDbModelTable / SyncType.SLEEP"

    invoke-static {v3, v6, v0, v5, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->appendMetricLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1916
    nop

    .line 1917
    invoke-interface {v9, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1916
    const-string v5, "5. Stress"

    const-string v6, "StressReportDbModelTable (Watch BLE -> nothing_x.db)"

    const/4 v7, 0x0

    invoke-static {v3, v5, v0, v7, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->appendMetricLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1921
    nop

    .line 1922
    invoke-interface {v9, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1924
    const-string v6, "EXERCISE"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1925
    const-string v7, "RESTING_HEART"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v7, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1926
    const-string v8, "RESPIRATORY_RATE"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    sget-object v8, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    .line 1927
    const-string v9, "BODY_TEMPERATURE"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v5, 0x1

    aput-object v6, v9, v5

    const/4 v5, 0x2

    aput-object v7, v9, v5

    const/4 v5, 0x3

    aput-object v8, v9, v5

    .line 1923
    invoke-static {v9}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->firstNonNull([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1921
    const-string v6, "6. Exercise / Other (Resting HR, Resp. Rate, Temp)"

    const-string v7, "SportReportDbModelTable / SyncType.EXERCISE"

    invoke-static {v3, v6, v0, v5, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->appendMetricLine(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1931
    const-string v0, "\n\u2501\u2501 STORAGE & INTERFACE DIAGNOSTICS \u2501\u2501\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1932
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_358

    .line 1933
    const-string v0, "\u2022 Local SQLite files found: 0 (nothing_x.db is created once a Nothing/CMF Watch syncs).\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_39d

    .line 1935
    :cond_358
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_35c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_39d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 1936
    const-string v5, "\u2022 DB File: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1937
    const-string v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v8, 0x400

    div-long/2addr v6, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " KB, updated "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1938
    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1939
    goto :goto_35c

    .line 1941
    :cond_39d
    :goto_39d
    sget-wide v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCacheTimeMs:J

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-lez v6, :cond_3b9

    .line 1942
    const-string v0, "\u2022 NtSyncHealthFlutterApi last queried: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-wide v4, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCacheTimeMs:J

    invoke-static {v4, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatTime(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3be

    .line 1944
    :cond_3b9
    const-string v0, "\u2022 NtSyncHealthFlutterApi: Ready (tap Refresh while Flutter engine is active)\n"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1947
    :goto_3be
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static buildSleepPollPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .registers 4

    .line 990
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 991
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.nothing.nt_lifecycle.receiver.KeepAliveReceiver"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 992
    const-string v1, "com.nothing.smartcenter.ACTION_WAKE_UP"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 993
    const-string v1, "nt_sleep_detector_poll"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 994
    nop

    .line 995
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_23

    .line 996
    const/high16 v1, 0xc000000

    goto :goto_25

    .line 995
    :cond_23
    const/high16 v1, 0x8000000

    .line 998
    :goto_25
    const v2, 0x9e37

    invoke-static {p0, v2, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method private static cancelAlarm(Landroid/content/Context;)V
    .registers 4

    .line 1128
    :try_start_0
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1129
    if-eqz v0, :cond_13

    .line 1130
    const-wide/16 v1, 0x0

    invoke-static {p0, v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->buildAlarmPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;

    move-result-object p0

    .line 1131
    invoke-virtual {v0, p0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V
    :try_end_13
    .catchall {:try_start_0 .. :try_end_13} :catchall_14

    .line 1135
    :cond_13
    goto :goto_1c

    .line 1133
    :catchall_14
    move-exception p0

    .line 1134
    const-string v0, "NothingXEnhancer"

    const-string v1, "cancelAlarm error"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1136
    :goto_1c
    return-void
.end method

.method private static cancelSleepDetectorPoll(Landroid/content/Context;)V
    .registers 2

    .line 1018
    :try_start_0
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1019
    if-eqz v0, :cond_13

    .line 1020
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->buildSleepPollPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V
    :try_end_11
    .catchall {:try_start_0 .. :try_end_11} :catchall_12

    goto :goto_13

    .line 1022
    :catchall_12
    move-exception p0

    :cond_13
    :goto_13
    nop

    .line 1023
    return-void
.end method

.method public static declared-synchronized cancelTimer(Landroid/content/Context;)V
    .registers 5

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1065
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 1066
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    .line 1067
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelAlarm(Landroid/content/Context;)V

    .line 1068
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelSleepDetectorPoll(Landroid/content/Context;)V

    .line 1069
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 1070
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "state"

    const-string v2, "IDLE"

    .line 1071
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "target_epoch_ms"

    .line 1072
    const-wide/16 v2, 0x0

    invoke-interface {p0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "remaining_ms"

    .line 1073
    invoke-interface {p0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 1074
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1075
    const-string p0, "NothingXEnhancer"

    const-string v1, "Sleep Timer cancelled"

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_38
    .catchall {:try_start_3 .. :try_end_38} :catchall_3a

    .line 1076
    monitor-exit v0

    return-void

    .line 1064
    :catchall_3a
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized checkAndCompleteIfExpired(Landroid/content/Context;)V
    .registers 9

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1230
    :try_start_3
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1231
    const-string v2, "state"

    const-string v3, "IDLE"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1232
    const-string v3, "ARMED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 1233
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 1234
    sget-wide v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastArmedPollMs:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x2710

    cmp-long v7, v3, v5

    if-ltz v7, :cond_38

    .line 1235
    sput-wide v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastArmedPollMs:J

    .line 1236
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 1237
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer$7;

    invoke-direct {v2, p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$7;-><init>(Landroid/content/Context;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1244
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_38
    .catchall {:try_start_3 .. :try_end_38} :catchall_64

    .line 1246
    :cond_38
    monitor-exit v0

    return-void

    .line 1248
    :cond_3a
    :try_start_3a
    const-string v3, "RUNNING"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_62

    .line 1249
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->checkAwakeAndAutoStopIfNeeded(Landroid/content/Context;)V

    .line 1250
    const-string v2, "target_epoch_ms"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1251
    const-string v2, "timer_id"

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 1252
    cmp-long v7, v5, v3

    if-lez v7, :cond_62

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long v7, v3, v5

    if-ltz v7, :cond_62

    .line 1253
    invoke-static {p0, v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->completeTimerAndNotifyOnce(Landroid/content/Context;J)V
    :try_end_62
    .catchall {:try_start_3a .. :try_end_62} :catchall_64

    .line 1256
    :cond_62
    monitor-exit v0

    return-void

    .line 1229
    :catchall_64
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized checkAwakeAndAutoStopIfNeeded(Landroid/content/Context;)V
    .registers 16

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1263
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 1264
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1265
    const-string v2, "state"

    const-string v3, "IDLE"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1266
    const-string v3, "RUNNING"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_f5

    if-nez v2, :cond_1d

    monitor-exit v0

    return-void

    .line 1268
    :cond_1d
    :try_start_1d
    const-string v2, "started_at_ms"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1269
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7
    :try_end_29
    .catchall {:try_start_1d .. :try_end_29} :catchall_f5

    .line 1271
    cmp-long v2, v5, v3

    if-lez v2, :cond_38

    sub-long v5, v7, v5

    const-wide/32 v9, 0x15f90

    cmp-long v2, v5, v9

    if-gez v2, :cond_38

    .line 1272
    monitor-exit v0

    return-void

    .line 1275
    :cond_38
    :try_start_38
    const-string v2, "armed_hr_threshold"

    const/16 v5, 0x41

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 1276
    const-string v5, "sleep_baseline_steps"

    const/4 v6, -0x1

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 1278
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->readWatchHealthSnapshot(Landroid/content/Context;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;

    move-result-object v6

    .line 1279
    iget v9, v6, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-lez v9, :cond_52

    iget v9, v6, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    goto :goto_54

    :cond_52
    sget v9, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    .line 1280
    :goto_54
    iget v6, v6, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->stepRows:I

    .line 1282
    nop

    .line 1283
    const-string v10, ""

    .line 1286
    const/4 v11, 0x1

    const/4 v12, 0x0

    if-ltz v5, :cond_65

    add-int/lit8 v5, v5, 0x3

    if-le v6, v5, :cond_65

    .line 1287
    nop

    .line 1288
    const-string v10, "Movement / walking detected on watch"

    goto :goto_8d

    .line 1291
    :cond_65
    if-lez v9, :cond_8c

    add-int/lit8 v2, v2, 0xc

    const/16 v5, 0x4e

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-lt v9, v2, :cond_8c

    .line 1292
    nop

    .line 1293
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Awake heart rate ("

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " BPM)"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_8d

    .line 1296
    :cond_8c
    const/4 v11, 0x0

    :goto_8d
    if-eqz v11, :cond_f3

    .line 1297
    const-string v2, "target_epoch_ms"

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1298
    const-wide/16 v13, 0x3e8

    sub-long/2addr v5, v7

    invoke-static {v13, v14, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    .line 1299
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelAlarm(Landroid/content/Context;)V

    .line 1301
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "state"

    const-string v7, "PAUSED"

    .line 1302
    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "remaining_ms"

    .line 1303
    invoke-interface {v1, v2, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "target_epoch_ms"

    .line 1304
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "paused_reason"

    .line 1305
    invoke-interface {v1, v2, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1306
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1308
    const-string v1, "NothingXEnhancer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sleep timer auto-paused because user is awake: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1309
    const-string v1, "Sleep Timer Paused \u2022 Awake Detected"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u2014 Timer paused. Tap Resume when sleeping."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const v3, 0x9e35

    invoke-static {p0, v3, v1, v2, v12}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->postPhoneAndWatchNotification(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    :try_end_f3
    .catchall {:try_start_38 .. :try_end_f3} :catchall_f5

    .line 1317
    :cond_f3
    monitor-exit v0

    return-void

    .line 1262
    :catchall_f5
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized checkWatchSleepAndAutoStart(Landroid/content/Context;)V
    .registers 17

    const-class v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v1

    .line 817
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 818
    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 819
    const-string v3, "state"

    const-string v4, "IDLE"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 820
    const-string v4, "ARMED"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1fc

    if-nez v3, :cond_1d

    monitor-exit v1

    return-void

    .line 822
    :cond_1d
    :try_start_1d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 823
    const-string v5, "armed_last_check_ms"

    const-wide/16 v6, 0x0

    invoke-interface {v2, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8
    :try_end_29
    .catchall {:try_start_1d .. :try_end_29} :catchall_1fc

    .line 824
    sub-long v8, v3, v8

    const-wide/16 v10, 0xbb8

    cmp-long v5, v8, v10

    if-gez v5, :cond_33

    .line 825
    monitor-exit v1

    return-void

    .line 827
    :cond_33
    :try_start_33
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v8, "armed_last_check_ms"

    invoke-interface {v5, v8, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 830
    sget-wide v8, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCacheTimeMs:J

    sub-long v8, v3, v8

    const-wide/16 v10, 0x61a8

    cmp-long v5, v8, v10

    if-lez v5, :cond_4e

    .line 831
    const/4 v5, 0x0

    invoke-static {v0, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->requestFlutterHealthSync(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 834
    :cond_4e
    const-string v5, "duration_ms"

    const-wide/32 v8, 0x6ddd00

    invoke-interface {v2, v5, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 835
    const-string v5, "armed_at_ms"

    invoke-interface {v2, v5, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 836
    const-string v5, "armed_hr_threshold"

    const/16 v12, 0x41

    invoke-interface {v2, v5, v12}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 837
    const-string v12, "armed_baseline_sleep_rows"

    const/4 v13, 0x0

    invoke-interface {v2, v12, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    .line 838
    const-string v14, "armed_baseline_step_rows"

    invoke-interface {v2, v14, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v13

    .line 839
    const-string v14, "armed_baseline_hr_time_ms"

    invoke-interface {v2, v14, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 841
    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->readWatchHealthSnapshot(Landroid/content/Context;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;

    move-result-object v14

    .line 844
    iget v15, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->sleepRows:I

    if-le v15, v12, :cond_9c

    .line 845
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Watch Sleep detected at "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 846
    invoke-static {v0, v8, v9, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startTimerInternal(Landroid/content/Context;JLjava/lang/String;)V
    :try_end_9a
    .catchall {:try_start_33 .. :try_end_9a} :catchall_1fc

    .line 847
    monitor-exit v1

    return-void

    .line 851
    :cond_9c
    :try_start_9c
    iget v12, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->stepRows:I

    if-le v12, v13, :cond_dc

    .line 852
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "armed_baseline_step_rows"

    iget v5, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->stepRows:I

    .line 853
    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "armed_baseline_hr_time_ms"

    iget-wide v5, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J

    .line 854
    invoke-interface {v0, v2, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "armed_status_detail"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Movement detected at "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 856
    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u2022 Waiting for stillness"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 855
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 857
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_da
    .catchall {:try_start_9c .. :try_end_da} :catchall_1fc

    .line 858
    monitor-exit v1

    return-void

    .line 862
    :cond_dc
    :try_start_dc
    iget v12, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    const/16 v13, 0x1e

    if-le v12, v13, :cond_15c

    iget-wide v12, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J

    cmp-long v15, v12, v6

    if-lez v15, :cond_15c

    iget-wide v6, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J

    const-wide/16 v12, 0x7530

    sub-long v12, v10, v12

    cmp-long v15, v6, v12

    if-ltz v15, :cond_15c

    .line 863
    iget v3, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-gt v3, v5, :cond_120

    .line 864
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sleep HR "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " BPM detected at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 865
    invoke-static {v0, v8, v9, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startTimerInternal(Landroid/content/Context;JLjava/lang/String;)V
    :try_end_11e
    .catchall {:try_start_dc .. :try_end_11e} :catchall_1fc

    .line 866
    monitor-exit v1

    return-void

    .line 868
    :cond_120
    :try_start_120
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "armed_baseline_hr_time_ms"

    iget-wide v3, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J

    .line 869
    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "armed_status_detail"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Watch HR "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " BPM \u2022 Waiting for \u2264 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " BPM"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 870
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 872
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_15a
    .catchall {:try_start_120 .. :try_end_15a} :catchall_1fc

    .line 873
    monitor-exit v1

    return-void

    .line 878
    :cond_15c
    sub-long v6, v3, v10

    .line 879
    :try_start_15e
    iget-boolean v10, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->watchBleConnected:Z

    if-eqz v10, :cond_1a6

    iget v10, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    const/16 v11, 0x1e

    if-le v10, v11, :cond_1a6

    iget v10, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-gt v10, v5, :cond_1a6

    iget-wide v10, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J

    sub-long v10, v3, v10

    const-wide/32 v12, 0xdbba0

    cmp-long v15, v10, v12

    if-gtz v15, :cond_1a6

    const-wide/32 v10, 0x1d4c0

    cmp-long v12, v6, v10

    if-ltz v12, :cond_1a6

    .line 884
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Resting HR "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v5, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " BPM \u2022 Auto-started at "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 885
    invoke-static {v0, v8, v9, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startTimerInternal(Landroid/content/Context;JLjava/lang/String;)V
    :try_end_1a4
    .catchall {:try_start_15e .. :try_end_1a4} :catchall_1fc

    .line 886
    monitor-exit v1

    return-void

    .line 890
    :cond_1a6
    :try_start_1a6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Watch HR "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v3, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-lez v3, :cond_1cb

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, v14, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " BPM"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1cd

    :cond_1cb
    const-string v3, "--"

    :goto_1cd
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " \u2022 Target \u2264 "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " BPM \u2022 Armed "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 891
    invoke-static {v6, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 892
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "armed_status_detail"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1fa
    .catchall {:try_start_1a6 .. :try_end_1fa} :catchall_1fc

    .line 893
    monitor-exit v1

    return-void

    .line 816
    :catchall_1fc
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static declared-synchronized completeTimerAndNotifyOnce(Landroid/content/Context;J)V
    .registers 14

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1320
    :try_start_3
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1321
    const-string v2, "timer_id"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1322
    const-string v2, "notified_for_id"

    const-wide/16 v7, -0x1

    invoke-interface {v1, v2, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 1323
    const-string v2, "duration_ms"

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    .line 1325
    cmp-long v2, v5, v3

    if-eqz v2, :cond_22

    move-wide p1, v5

    .line 1326
    :cond_22
    cmp-long v2, p1, v3

    if-eqz v2, :cond_44

    cmp-long v2, p1, v7

    if-nez v2, :cond_44

    .line 1327
    const-string p0, "NothingXEnhancer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate notification prevented for timerId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_42
    .catchall {:try_start_3 .. :try_end_42} :catchall_94

    .line 1328
    monitor-exit v0

    return-void

    .line 1331
    :cond_44
    :try_start_44
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "state"

    const-string v5, "COMPLETED"

    .line 1332
    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "remaining_ms"

    .line 1333
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "target_epoch_ms"

    .line 1334
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "notified_for_id"

    .line 1335
    invoke-interface {v1, v2, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "last_completed_at_ms"

    .line 1336
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p1, p2, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 1337
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1339
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Sleep Timer ("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v9, v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatDurationShort(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ") finished! Wake up!"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1340
    const-string p2, "\u23f0 WAKE UP \u2022 Nothing X"

    const/4 v1, 0x6

    invoke-static {p0, p2, p1, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startWakeUpAlarmBurst(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_92
    .catchall {:try_start_44 .. :try_end_92} :catchall_94

    .line 1341
    monitor-exit v0

    return-void

    .line 1319
    :catchall_94
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static computeDashboardDataInternal(Landroid/content/Context;)Ljava/util/Map;
    .registers 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2164
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 2166
    nop

    .line 2167
    const-string v2, "Watch Pro 2"

    .line 2169
    const/4 v4, 0x0

    :try_start_9
    const-string v0, "bluetooth"
    :try_end_b
    .catchall {:try_start_9 .. :try_end_b} :catchall_3d

    move-object/from16 v5, p0

    :try_start_d
    invoke-virtual {v5, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothManager;

    .line 2170
    if-eqz v0, :cond_40

    .line 2171
    const/4 v6, 0x7

    invoke-virtual {v0, v6}, Landroid/bluetooth/BluetoothManager;->getConnectedDevices(I)Ljava/util/List;

    move-result-object v0

    .line 2172
    if-eqz v0, :cond_40

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v6
    :try_end_20
    .catchall {:try_start_d .. :try_end_20} :catchall_3b

    if-nez v6, :cond_40

    .line 2173
    nop

    .line 2174
    :try_start_23
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    .line 2175
    if-eqz v0, :cond_39

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v6
    :try_end_33
    .catchall {:try_start_23 .. :try_end_33} :catchall_38

    if-nez v6, :cond_39

    move-object v2, v0

    const/4 v0, 0x1

    goto :goto_41

    .line 2178
    :catchall_38
    move-exception v0

    :cond_39
    const/4 v0, 0x1

    goto :goto_41

    :catchall_3b
    move-exception v0

    goto :goto_40

    :catchall_3d
    move-exception v0

    move-object/from16 v5, p0

    :cond_40
    :goto_40
    const/4 v0, 0x0

    :goto_41
    nop

    .line 2180
    const-string v6, "0"

    if-eqz v0, :cond_49

    const-string v7, "1"

    goto :goto_4a

    :cond_49
    move-object v7, v6

    :goto_4a
    const-string v8, "watch_connected"

    invoke-interface {v1, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2181
    const-string v7, "watch_name"

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2184
    const-string v7, "-- BPM"

    const-string v8, "hr_val"

    invoke-interface {v1, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2185
    const-string v7, "hr_badge"

    const-string v9, "NO DATA"

    invoke-interface {v1, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2186
    const-string v10, "Waiting for watch"

    const-string v11, "hr_sub"

    invoke-interface {v1, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2188
    const-string v10, "-- %"

    const-string v12, "spo2_val"

    invoke-interface {v1, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2189
    const-string v10, "spo2_badge"

    invoke-interface {v1, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2190
    const-string v13, "Measure on watch"

    const-string v14, "spo2_sub"

    invoke-interface {v1, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2192
    const-string v13, "step_val"

    invoke-interface {v1, v13, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2193
    const-string v15, "step_badge"

    const-string v4, "SYNCED"

    invoke-interface {v1, v15, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2194
    const-string v3, "No steps recorded yet"

    const-string v5, "step_sub"

    invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2196
    const-string v3, "sleep_val"

    move-object/from16 v16, v5

    const-string v5, "--"

    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2197
    const-string v3, "sleep_badge"

    invoke-interface {v1, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2198
    const-string v3, "sleep_sub"

    const-string v5, "Syncs after sleep"

    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2200
    const-string v3, "stress_val"

    const-string v5, "--"

    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2201
    const-string v3, "stress_badge"

    invoke-interface {v1, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2202
    const-string v3, "stress_sub"

    const-string v5, "Measure on watch"

    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2204
    const-string v3, "Ready"

    const-string v5, "sport_val"

    invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2205
    if-eqz v0, :cond_c3

    const-string v0, "CONNECTED"

    goto :goto_c5

    :cond_c3
    const-string v0, "STANDBY"

    :goto_c5
    const-string v3, "sport_badge"

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2206
    const-string v9, "sport_sub"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2208
    invoke-static/range {p0 .. p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->findSqliteDatabases(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 2209
    nop

    .line 2210
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    move-object/from16 v18, v2

    if-eqz v17, :cond_fb

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/io/File;

    .line 2211
    const-string v2, "nothing_x.db"

    move-object/from16 v19, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f6

    .line 2212
    nop

    .line 2213
    goto :goto_fd

    .line 2215
    :cond_f6
    move-object/from16 v2, v18

    move-object/from16 v0, v19

    goto :goto_d8

    .line 2210
    :cond_fb
    const/16 v17, 0x0

    .line 2217
    :goto_fd
    if-eqz v17, :cond_511

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_511

    .line 2218
    nop

    .line 2220
    :try_start_106
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0
    :try_end_10a
    .catchall {:try_start_106 .. :try_end_10a} :catchall_50a

    move-object/from16 v17, v9

    const/4 v2, 0x0

    const/4 v9, 0x1

    :try_start_10e
    invoke-static {v0, v2, v9}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 2222
    sget-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLoggedDbSchemaOnce:Z

    if-nez v0, :cond_18d

    .line 2223
    sput-boolean v9, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLoggedDbSchemaOnce:Z
    :try_end_118
    .catchall {:try_start_10e .. :try_end_118} :catchall_508

    .line 2225
    :try_start_118
    invoke-static {v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->listTables(Landroid/database/sqlite/SQLiteDatabase;)Ljava/util/List;

    move-result-object v0

    .line 2226
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_120
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_180

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 2227
    move-object/from16 p0, v0

    invoke-static {v2, v9}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->countRowsSafe(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I

    move-result v0
    :try_end_132
    .catchall {:try_start_118 .. :try_end_132} :catchall_187

    .line 2228
    if-lez v0, :cond_171

    .line 2229
    move-object/from16 v19, v3

    :try_start_136
    const-string v3, "NothingXEnhancer"
    :try_end_138
    .catchall {:try_start_136 .. :try_end_138} :catchall_16f

    move-object/from16 v20, v5

    :try_start_13a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_13f
    .catchall {:try_start_13a .. :try_end_13f} :catchall_16d

    move-object/from16 v21, v15

    :try_start_141
    const-string v15, "DB_DUMP ["

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v15, "] rows="

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " -> "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v2, v9}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_16a
    .catchall {:try_start_141 .. :try_end_16a} :catchall_16b

    goto :goto_177

    .line 2232
    :catchall_16b
    move-exception v0

    goto :goto_193

    :catchall_16d
    move-exception v0

    goto :goto_184

    :catchall_16f
    move-exception v0

    goto :goto_18a

    .line 2228
    :cond_171
    move-object/from16 v19, v3

    move-object/from16 v20, v5

    move-object/from16 v21, v15

    .line 2231
    :goto_177
    move-object/from16 v0, p0

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    move-object/from16 v15, v21

    goto :goto_120

    .line 2232
    :cond_180
    move-object/from16 v19, v3

    move-object/from16 v20, v5

    :goto_184
    move-object/from16 v21, v15

    goto :goto_193

    :catchall_187
    move-exception v0

    move-object/from16 v19, v3

    :goto_18a
    move-object/from16 v20, v5

    goto :goto_184

    .line 2222
    :cond_18d
    move-object/from16 v19, v3

    move-object/from16 v20, v5

    move-object/from16 v21, v15

    .line 2236
    :goto_193
    :try_start_193
    sget v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I
    :try_end_195
    .catchall {:try_start_193 .. :try_end_195} :catchall_508

    const-string v3, "Synced from Watch"

    const-string v5, "LIVE SYNC"

    const-wide/16 v22, 0x0

    const-string v9, "Updated "

    if-lez v0, :cond_1de

    .line 2237
    :try_start_19f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v15, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v15, " BPM"

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2238
    invoke-interface {v1, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 p0, v3

    move-object v8, v4

    move-object/from16 v24, v13

    move-object v15, v14

    goto/16 :goto_293

    .line 2241
    :cond_1de
    const-string v0, "heartRate"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryAddUpMetric(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2242
    if-eqz v0, :cond_1fa

    iget-object v15, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v15, :cond_1fa

    const-string v15, "56"

    move-object/from16 p0, v3

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f7

    goto :goto_1fc

    :cond_1f7
    move-object/from16 v24, v0

    goto :goto_218

    :cond_1fa
    move-object/from16 p0, v3

    .line 2243
    :goto_1fc
    const-string v3, "HeartRateReportDbModelTable"

    invoke-static {v2, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v3

    .line 2244
    if-eqz v3, :cond_216

    iget-object v15, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v15, :cond_216

    const-string v15, "56"

    move-object/from16 v24, v0

    iget-object v0, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_218

    .line 2245
    move-object v0, v3

    goto :goto_21a

    .line 2244
    :cond_216
    move-object/from16 v24, v0

    .line 2248
    :cond_218
    :goto_218
    move-object/from16 v0, v24

    :goto_21a
    if-eqz v0, :cond_220

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v3, :cond_227

    .line 2249
    :cond_220
    const-string v0, "HEART_RATE"

    const/4 v3, 0x0

    invoke-static {v0, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->parseMetricFromFlutterCache(Ljava/lang/String;Z)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2251
    :cond_227
    if-eqz v0, :cond_28f

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v3, :cond_28f

    .line 2252
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v15, " BPM"

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2253
    move-object v8, v4

    iget-wide v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    cmp-long v15, v3, v22

    if-lez v15, :cond_25f

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    move-object/from16 v24, v13

    move-object v15, v14

    iget-wide v13, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    sub-long/2addr v3, v13

    const-wide/32 v13, 0xdbba0

    cmp-long v25, v3, v13

    if-gez v25, :cond_262

    const/4 v3, 0x1

    goto :goto_263

    :cond_25f
    move-object/from16 v24, v13

    move-object v15, v14

    :cond_262
    const/4 v3, 0x0

    .line 2254
    :goto_263
    if-eqz v3, :cond_267

    move-object v3, v5

    goto :goto_268

    :cond_267
    move-object v3, v8

    :goto_268
    invoke-interface {v1, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2255
    iget-wide v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    cmp-long v7, v3, v22

    if-lez v7, :cond_289

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v13, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    invoke-static {v13, v14}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_28b

    :cond_289
    move-object/from16 v0, p0

    :goto_28b
    invoke-interface {v1, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_293

    .line 2251
    :cond_28f
    move-object v8, v4

    move-object/from16 v24, v13

    move-object v15, v14

    .line 2260
    :goto_293
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    if-eqz v0, :cond_2c5

    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c5

    .line 2261
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    invoke-interface {v1, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2262
    invoke-interface {v1, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v3, v15

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_329

    .line 2260
    :cond_2c5
    move-object v3, v15

    .line 2265
    const-string v0, "bloodOxygen"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryAddUpMetric(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2266
    if-eqz v0, :cond_2d2

    iget-object v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v4, :cond_2d8

    .line 2267
    :cond_2d2
    const-string v0, "Spo2ReportDbModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2269
    :cond_2d8
    if-eqz v0, :cond_2de

    iget-object v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v4, :cond_2e5

    .line 2270
    :cond_2de
    const-string v0, "OXYGEN_SATURATION"

    const/4 v4, 0x0

    invoke-static {v0, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->parseMetricFromFlutterCache(Ljava/lang/String;Z)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2272
    :cond_2e5
    if-eqz v0, :cond_329

    iget-object v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v4, :cond_329

    .line 2273
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " %"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v12, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2274
    invoke-interface {v1, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2275
    iget-wide v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    cmp-long v7, v4, v22

    if-lez v7, :cond_324

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v10, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    invoke-static {v10, v11}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_326

    :cond_324
    move-object/from16 v0, p0

    :goto_326
    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2280
    :cond_329
    :goto_329
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;

    if-eqz v0, :cond_363

    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_363

    .line 2281
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;

    move-object/from16 v3, v24

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2282
    const-string v0, "TODAY"

    move-object/from16 v4, v21

    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2283
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v5, v16

    invoke-interface {v1, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_3e1

    .line 2280
    :cond_363
    move-object/from16 v5, v16

    move-object/from16 v4, v21

    move-object/from16 v3, v24

    .line 2285
    const-string v0, "StepReportDbModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2286
    if-eqz v0, :cond_37d

    iget-object v7, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v7, :cond_37d

    iget-object v7, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_392

    .line 2287
    :cond_37d
    const-string v7, "AddUpNetModelTable"

    invoke-static {v2, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v7

    .line 2288
    if-eqz v7, :cond_392

    iget-object v10, v7, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v10, :cond_392

    iget-object v10, v7, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_392

    .line 2289
    move-object v0, v7

    .line 2292
    :cond_392
    if-eqz v0, :cond_3a0

    iget-object v7, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v7, :cond_3a0

    iget-object v7, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3ae

    .line 2293
    :cond_3a0
    const-string v6, "STEP"

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->parseMetricFromFlutterCache(Ljava/lang/String;Z)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v6

    .line 2294
    if-eqz v6, :cond_3ae

    iget-object v7, v6, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v7, :cond_3ae

    .line 2295
    move-object v0, v6

    .line 2298
    :cond_3ae
    if-eqz v0, :cond_3e1

    iget-object v6, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v6, :cond_3e1

    .line 2299
    iget-object v6, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-interface {v1, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2300
    const-string v3, "TODAY"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2301
    iget-wide v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    cmp-long v6, v3, v22

    if-lez v6, :cond_3dc

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v6, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    invoke-static {v6, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3de

    :cond_3dc
    const-string v0, "Watch pedometer"

    :goto_3de
    invoke-interface {v1, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2306
    :cond_3e1
    :goto_3e1
    const-string v0, "SleepReportDbModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2307
    if-eqz v0, :cond_3ed

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v3, :cond_3f3

    .line 2308
    :cond_3ed
    const-string v0, "AddUpDaySleepNetModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2310
    :cond_3f3
    if-eqz v0, :cond_3f9

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v3, :cond_3ff

    .line 2311
    :cond_3f9
    const-string v0, "AddUpSleepNetModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2313
    :cond_3ff
    if-eqz v0, :cond_405

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v3, :cond_40c

    .line 2314
    :cond_405
    const-string v0, "SLEEP"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->parseMetricFromFlutterCache(Ljava/lang/String;Z)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2316
    :cond_40c
    if-eqz v0, :cond_449

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v3, :cond_449

    .line 2317
    const-string v3, "sleep_val"

    iget-object v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-static {v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatSleepDisplayValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2318
    const-string v3, "sleep_badge"

    const-string v4, "RECORDED"

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2319
    const-string v3, "sleep_sub"

    iget-wide v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    cmp-long v6, v4, v22

    if-lez v6, :cond_444

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    invoke-static {v5, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_446

    :cond_444
    const-string v0, "Watch sleep log"

    :goto_446
    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2323
    :cond_449
    const-string v0, "pressure"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryAddUpMetric(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2324
    if-eqz v0, :cond_455

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v3, :cond_45b

    .line 2325
    :cond_455
    const-string v0, "StressReportDbModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2327
    :cond_45b
    if-eqz v0, :cond_492

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v3, :cond_492

    .line 2328
    const-string v3, "stress_val"

    iget-object v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2329
    const-string v3, "stress_badge"

    invoke-interface {v1, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2330
    const-string v3, "stress_sub"

    iget-wide v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    cmp-long v6, v4, v22

    if-lez v6, :cond_48d

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    invoke-static {v5, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_48f

    :cond_48d
    move-object/from16 v0, p0

    :goto_48f
    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2334
    :cond_492
    const-string v0, "SportReportDbModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 2335
    if-eqz v0, :cond_4d2

    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-eqz v3, :cond_4d2

    .line 2336
    iget-object v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    move-object/from16 v4, v20

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2337
    const-string v3, "WORKOUT"

    move-object/from16 v5, v19

    invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2338
    iget-wide v3, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    cmp-long v5, v3, v22

    if-lez v5, :cond_4ca

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    invoke-static {v4, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4cc

    :cond_4ca
    const-string v0, "Workout synced"

    :goto_4cc
    move-object/from16 v3, v17

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_500

    .line 2335
    :cond_4d2
    move-object/from16 v3, v17

    move-object/from16 v5, v19

    move-object/from16 v4, v20

    .line 2340
    const-string v0, "NtSportSortModelTable"

    invoke-static {v2, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->countRowsSafe(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I

    move-result v0

    .line 2341
    if-lez v0, :cond_500

    .line 2342
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " Modes"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2343
    const-string v0, "ACTIVE"

    invoke-interface {v1, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2344
    move-object/from16 v4, v18

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_500
    .catchall {:try_start_19f .. :try_end_500} :catchall_508

    .line 2349
    :cond_500
    :goto_500
    if-eqz v2, :cond_511

    :try_start_502
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_511

    :catchall_506
    move-exception v0

    goto :goto_511

    .line 2347
    :catchall_508
    move-exception v0

    goto :goto_50c

    :catchall_50a
    move-exception v0

    const/4 v2, 0x0

    .line 2349
    :goto_50c
    if-eqz v2, :cond_511

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_511
    .catchall {:try_start_502 .. :try_end_511} :catchall_506

    .line 2352
    :cond_511
    :goto_511
    return-object v1
.end method

.method private static countRowsSafe(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I
    .registers 6

    .line 976
    nop

    .line 978
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SELECT COUNT(*) FROM \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "\""

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 979
    if-eqz v1, :cond_34

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p0

    if-eqz p0, :cond_34

    .line 980
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_3c

    .line 984
    if-eqz v1, :cond_33

    :try_start_2e
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_32

    goto :goto_33

    :catchall_32
    move-exception p1

    .line 980
    :cond_33
    :goto_33
    return p0

    .line 984
    :cond_34
    if-eqz v1, :cond_42

    :try_start_36
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_42

    :catchall_3a
    move-exception p0

    goto :goto_42

    .line 982
    :catchall_3c
    move-exception p0

    .line 984
    if-eqz v1, :cond_42

    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_42
    .catchall {:try_start_36 .. :try_end_42} :catchall_3a

    .line 986
    :cond_42
    :goto_42
    return v0
.end method

.method private static createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 425
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 426
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 427
    int-to-float p0, p1

    const/high16 p1, 0x40200000    # 2.5f

    mul-float p0, p0, p1

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 428
    return-object v0
.end method

.method private static createCustomCardButton(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/Button;
    .registers 6

    .line 407
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 408
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 409
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 410
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 411
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    const/4 p3, 0x1

    invoke-virtual {v0, p1, p3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 412
    const/4 p1, 0x2

    const/high16 p3, 0x41380000    # 11.5f

    invoke-virtual {v0, p1, p3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 413
    const/high16 p1, 0x41200000    # 10.0f

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    .line 414
    const/high16 p3, 0x40e00000    # 7.0f

    invoke-static {p0, p3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p0

    .line 415
    invoke-virtual {v0, p1, p0, p1, p0}, Landroid/widget/Button;->setPadding(IIII)V

    .line 416
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 417
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 418
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 419
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 420
    const/16 p0, 0xe

    invoke-static {p2, p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 421
    return-object v0
.end method

.method public static dp(Landroid/content/Context;F)I
    .registers 3

    .line 2525
    nop

    .line 2528
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 2525
    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method private static ensureFlutterAccessibilityEnabled(Landroid/view/View;)V
    .registers 5

    .line 570
    :try_start_0
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->findFlutterView(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    .line 571
    if-nez p0, :cond_7

    return-void

    .line 572
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getAttachedFlutterEngine"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 573
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 574
    if-eqz p0, :cond_43

    .line 575
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getAccessibilityChannel"

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 576
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 577
    if-eqz p0, :cond_43

    .line 578
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "onAndroidAccessibilityEnabled"

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 579
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_41
    .catchall {:try_start_0 .. :try_end_41} :catchall_42

    goto :goto_43

    .line 582
    :catchall_42
    move-exception p0

    :cond_43
    :goto_43
    nop

    .line 583
    return-void
.end method

.method public static declared-synchronized ensureTimerRestored(Landroid/content/Context;)V
    .registers 9

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1205
    :try_start_3
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1206
    const-string v2, "state"

    const-string v3, "IDLE"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1207
    const-string v3, "ARMED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 1208
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->checkWatchSleepAndAutoStart(Landroid/content/Context;)V

    .line 1209
    const-string v2, "ARMED"

    const-string v3, "state"

    const-string v4, "IDLE"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 1210
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/32 v3, 0xea60

    add-long/2addr v1, v3

    invoke-static {p0, v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scheduleSleepDetectorPoll(Landroid/content/Context;J)V
    :try_end_35
    .catchall {:try_start_3 .. :try_end_35} :catchall_5f

    .line 1212
    :cond_35
    monitor-exit v0

    return-void

    .line 1214
    :cond_37
    :try_start_37
    const-string v3, "RUNNING"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_3d
    .catchall {:try_start_37 .. :try_end_3d} :catchall_5f

    if-nez v2, :cond_41

    monitor-exit v0

    return-void

    .line 1216
    :cond_41
    :try_start_41
    const-string v2, "target_epoch_ms"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1217
    const-string v2, "timer_id"

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 1218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 1219
    cmp-long v7, v5, v3

    if-gtz v7, :cond_5b

    .line 1220
    invoke-static {p0, v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->completeTimerAndNotifyOnce(Landroid/content/Context;J)V

    goto :goto_5e

    .line 1222
    :cond_5b
    invoke-static {p0, v5, v6, v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scheduleAlarm(Landroid/content/Context;JJ)V
    :try_end_5e
    .catchall {:try_start_41 .. :try_end_5e} :catchall_5f

    .line 1226
    :goto_5e
    goto :goto_67

    .line 1224
    :catchall_5f
    move-exception p0

    .line 1225
    :try_start_60
    const-string v1, "NothingXEnhancer"

    const-string v2, "ensureTimerRestored error"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_67
    .catchall {:try_start_60 .. :try_end_67} :catchall_69

    .line 1227
    :goto_67
    monitor-exit v0

    return-void

    .line 1204
    :catchall_69
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static extractMetricFromRawString(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 12

    .line 2415
    const-string v0, "\""

    const/4 v1, 0x0

    if-eqz p0, :cond_f0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_d

    goto/16 :goto_f0

    .line 2418
    :cond_d
    const/4 v2, 0x4

    const-string v3, "value"

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x5

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz p1, :cond_2c

    .line 2419
    :try_start_17
    new-array p1, v6, [Ljava/lang/String;

    const-string v6, "totalSleepTime"

    aput-object v6, p1, v7

    const-string v6, "sleepTime"

    aput-object v6, p1, v8

    const-string v6, "duration"

    aput-object v6, p1, v5

    const-string v5, "total"

    aput-object v5, p1, v4

    aput-object v3, p1, v2

    goto :goto_6e

    .line 2420
    :cond_2c
    const/16 p1, 0xd

    new-array p1, p1, [Ljava/lang/String;

    const-string v9, "currentHeartRate"

    aput-object v9, p1, v7

    const-string v9, "lastHeartRate"

    aput-object v9, p1, v8

    const-string v8, "latestHeartRate"

    aput-object v8, p1, v5

    const-string v5, "heartRate"

    aput-object v5, p1, v4

    const-string v4, "bpm"

    aput-object v4, p1, v2

    const-string v2, "totalStep"

    aput-object v2, p1, v6

    const-string v2, "totalSteps"

    const/4 v4, 0x6

    aput-object v2, p1, v4

    const-string v2, "steps"

    const/4 v4, 0x7

    aput-object v2, p1, v4

    const-string v2, "step"

    const/16 v4, 0x8

    aput-object v2, p1, v4

    const/16 v2, 0x9

    aput-object v3, p1, v2

    const-string v2, "avg"

    const/16 v3, 0xa

    aput-object v2, p1, v3

    const-string v2, "spo2"

    const/16 v3, 0xb

    aput-object v2, p1, v3

    const-string v2, "stress"

    const/16 v3, 0xc

    aput-object v2, p1, v3

    .line 2421
    :goto_6e
    array-length v2, p1

    :goto_6f
    if-ge v7, v2, :cond_ee

    aget-object v3, p1, v7

    .line 2422
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    .line 2423
    if-ltz v3, :cond_ea

    .line 2424
    const/16 v4, 0x3a

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 2425
    if-le v4, v3, :cond_ea

    sub-int v3, v4, v3

    const/16 v5, 0x1e

    if-ge v3, v5, :cond_ea

    .line 2426
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 2427
    add-int/lit8 v4, v4, 0x1

    :goto_a3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_ca

    .line 2428
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 2429
    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_b7

    .line 2430
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c7

    .line 2431
    :cond_b7
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_be

    .line 2432
    goto :goto_ca

    .line 2433
    :cond_be
    const/16 v6, 0x20

    if-eq v5, v6, :cond_c7

    const/16 v6, 0x22

    if-eq v5, v6, :cond_c7

    .line 2434
    goto :goto_ca

    .line 2427
    :cond_c7
    :goto_c7
    add-int/lit8 v4, v4, 0x1

    goto :goto_a3

    .line 2437
    :cond_ca
    :goto_ca
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_ea

    .line 2438
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 2439
    const-wide/16 v5, 0x0

    cmp-long v8, v3, v5

    if-lez v8, :cond_ea

    const-wide/32 v5, 0xf4240

    cmp-long v8, v3, v5

    if-gez v8, :cond_ea

    .line 2440
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0
    :try_end_e9
    .catchall {:try_start_17 .. :try_end_e9} :catchall_ed

    return-object p0

    .line 2421
    :cond_ea
    add-int/lit8 v7, v7, 0x1

    goto :goto_6f

    .line 2446
    :catchall_ed
    move-exception p0

    :cond_ee
    nop

    .line 2447
    return-object v1

    .line 2415
    :cond_f0
    :goto_f0
    return-object v1
.end method

.method private static findFlutterView(Landroid/view/View;)Landroid/view/View;
    .registers 4

    .line 556
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 557
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "FlutterView"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    return-object p0

    .line 558
    :cond_15
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_30

    .line 559
    check-cast p0, Landroid/view/ViewGroup;

    .line 560
    const/4 v1, 0x0

    :goto_1c
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_30

    .line 561
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->findFlutterView(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    .line 562
    if-eqz v2, :cond_2d

    return-object v2

    .line 560
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 565
    :cond_30
    return-object v0
.end method

.method private static findSqliteDatabases(Landroid/content/Context;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1982
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1984
    :try_start_5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_10

    invoke-virtual {p0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object p0

    goto :goto_18

    :cond_10
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    .line 1985
    :goto_18
    if-eqz p0, :cond_26

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 1986
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scanForDbFiles(Ljava/io/File;Ljava/util/List;I)V
    :try_end_24
    .catchall {:try_start_5 .. :try_end_24} :catchall_25

    goto :goto_26

    .line 1988
    :catchall_25
    move-exception p0

    :cond_26
    :goto_26
    nop

    .line 1989
    return-object v0
.end method

.method private static varargs firstNonNull([Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 1974
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 1975
    :cond_4
    array-length v1, p0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_1e

    aget-object v3, p0, v2

    .line 1976
    if-eqz v3, :cond_1b

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1b

    const-string v4, "0 records"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1b

    return-object v3

    .line 1975
    :cond_1b
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 1978
    :cond_1e
    return-object v0
.end method

.method public static formatClockShort(J)Ljava/lang/String;
    .registers 5

    .line 2125
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gtz v2, :cond_9

    const-string p0, "--:--"

    return-object p0

    .line 2126
    :cond_9
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "hh:mm a"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 2127
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatDurationShort(J)Ljava/lang/String;
    .registers 8

    .line 2109
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gtz v2, :cond_9

    const-string p0, "0m"

    return-object p0

    .line 2110
    :cond_9
    long-to-double p0, p0

    const-wide v2, 0x40ed4c0000000000L    # 60000.0

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p0, v2

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    .line 2111
    const-wide/16 v2, 0x3c

    div-long v4, p0, v2

    .line 2112
    rem-long/2addr p0, v2

    .line 2113
    cmp-long v2, v4, v0

    if-lez v2, :cond_42

    cmp-long v2, p0, v0

    if-lez v2, :cond_42

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "h "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "m"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 2114
    :cond_42
    cmp-long v2, v4, v0

    if-lez v2, :cond_63

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-wide/16 v0, 0x1

    cmp-long p1, v4, v0

    if-nez p1, :cond_58

    const-string p1, " hour"

    goto :goto_5a

    :cond_58
    const-string p1, " hours"

    :goto_5a
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 2115
    :cond_63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " min"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatHhMmSs(J)Ljava/lang/String;
    .registers 8

    .line 2100
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gez v2, :cond_7

    move-wide p0, v0

    .line 2101
    :cond_7
    const-wide/16 v0, 0x3e7

    add-long/2addr p0, v0

    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    .line 2102
    const-wide/16 v0, 0xe10

    div-long v2, p0, v0

    .line 2103
    rem-long v0, p0, v0

    const-wide/16 v4, 0x3c

    div-long/2addr v0, v4

    .line 2104
    rem-long/2addr p0, v4

    .line 2105
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object v2, p1, v1

    const/4 v1, 0x1

    aput-object v0, p1, v1

    const/4 v0, 0x2

    aput-object p0, p1, v0

    const-string p0, "%02d:%02d:%02d"

    invoke-static {v4, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static formatSleepDisplayValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 12

    .line 2378
    const-string v0, "--"

    if-nez p0, :cond_5

    return-object v0

    .line 2379
    :cond_5
    const-string v1, "h"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8a

    const-string v2, "m"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_16

    goto :goto_8a

    .line 2381
    :cond_16
    :try_start_16
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3
    :try_end_1e
    .catchall {:try_start_16 .. :try_end_1e} :catchall_88

    .line 2382
    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-gtz v7, :cond_25

    return-object v0

    .line 2383
    :cond_25
    nop

    .line 2384
    const-wide/16 v7, 0x5a0

    cmp-long v0, v3, v7

    if-lez v0, :cond_37

    .line 2386
    long-to-double v3, v3

    const-wide/high16 v7, 0x404e000000000000L    # 60.0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v3, v7

    :try_start_33
    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    .line 2388
    :cond_37
    const-wide/16 v7, 0x3c

    div-long v9, v3, v7

    .line 2389
    rem-long/2addr v3, v7

    .line 2390
    cmp-long v0, v9, v5

    if-lez v0, :cond_60

    cmp-long v0, v3, v5

    if-lez v0, :cond_60

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "h "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 2391
    :cond_60
    cmp-long v0, v9, v5

    if-lez v0, :cond_76

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 2392
    :cond_76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_87
    .catchall {:try_start_33 .. :try_end_87} :catchall_88

    return-object p0

    .line 2393
    :catchall_88
    move-exception v0

    .line 2394
    return-object p0

    .line 2379
    :cond_8a
    :goto_8a
    return-object p0
.end method

.method public static formatTime(J)Ljava/lang/String;
    .registers 5

    .line 2119
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gtz v2, :cond_9

    const-string p0, "N/A"

    return-object p0

    .line 2120
    :cond_9
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd hh:mm:ss a"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 2121
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static forwardToWatchBridgeDirectly(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 24

    .line 1583
    move/from16 v0, p1

    move-object/from16 v1, p2

    :try_start_4
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 1584
    const-string v3, "com.nothing.nt_system_runtime.notify.NothingNotificationManager"

    const/4 v4, 0x0

    invoke-static {v3, v4, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    .line 1585
    const-string v5, "INSTANCE"

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 1586
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1587
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 1589
    const-string v7, "getListeners"

    new-array v8, v4, [Ljava/lang/Class;

    invoke-virtual {v3, v7, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1590
    invoke-virtual {v3, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 1591
    new-array v7, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v5, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 1593
    if-eqz v3, :cond_136

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3b

    goto/16 :goto_136

    .line 1597
    :cond_3b
    const-string v5, "NtNotificationInfo"

    invoke-static {v5, v4, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v5

    .line 1598
    const/16 v7, 0xa

    new-array v8, v7, [Ljava/lang/Class;

    const-class v9, Ljava/lang/Long;

    aput-object v9, v8, v4

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v6

    const/4 v11, 0x2

    aput-object v9, v8, v11

    const/4 v12, 0x3

    aput-object v10, v8, v12

    const/4 v13, 0x4

    aput-object v10, v8, v13

    const-class v14, Ljava/lang/Boolean;

    const/4 v15, 0x5

    aput-object v14, v8, v15

    const/4 v14, 0x6

    aput-object v10, v8, v14

    const/16 v16, 0x7

    aput-object v10, v8, v16

    const/16 v10, 0x8

    aput-object v9, v8, v10

    const-class v9, Ljava/util/List;

    const/16 v17, 0x9

    aput-object v9, v8, v17

    invoke-virtual {v5, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    .line 1610
    invoke-virtual {v8, v6}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 1612
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 1613
    if-eqz p4, :cond_82

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_82

    .line 1614
    move-object/from16 v9, p4

    goto :goto_88

    .line 1615
    :cond_82
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v9, v18

    .line 1616
    :goto_88
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1618
    int-to-long v12, v0

    .line 1619
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 1621
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    .line 1627
    const-wide/16 v14, 0x0

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    .line 1628
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v15

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v12, v7, v4

    aput-object v9, v7, v6

    aput-object v13, v7, v11

    const/4 v11, 0x3

    aput-object v1, v7, v11

    const/4 v1, 0x4

    aput-object p3, v7, v1

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const/4 v11, 0x5

    aput-object v1, v7, v11

    const/4 v1, 0x6

    aput-object v10, v7, v1

    const-string v1, "nothing_x_sleep_timer_channel"

    aput-object v1, v7, v16

    const/16 v1, 0x8

    aput-object v14, v7, v1

    aput-object v15, v7, v17

    .line 1618
    invoke-virtual {v8, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 1631
    const-string v7, "com.nothing.nt_system_runtime.notify.StatusBarNotificationListener"

    invoke-static {v7, v4, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    .line 1632
    const-string v7, "onReceive"

    new-array v8, v6, [Ljava/lang/Class;

    aput-object v5, v8, v4

    invoke-virtual {v2, v7, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 1633
    invoke-virtual {v2, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 1635
    nop

    .line 1636
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v5, 0x0

    :goto_f2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_108

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 1637
    if-eqz v7, :cond_107

    .line 1638
    new-array v8, v6, [Ljava/lang/Object;

    aput-object v1, v8, v4

    invoke-virtual {v2, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1639
    add-int/lit8 v5, v5, 0x1

    .line 1641
    :cond_107
    goto :goto_f2

    .line 1642
    :cond_108
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Watch Bridge: Dispatched NtNotificationInfo (pkg="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " active listener(s) -> NtSystemRuntimeFlutterApi.onNotificationReceive."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1594
    :cond_136
    :goto_136
    const-string v0, "Watch Bridge: 0 active StatusBarNotificationListeners registered (Flutter engine or Watch BLE idle). Notification will be picked up by NothingNotificationService if Notification Access is enabled."
    :try_end_138
    .catchall {:try_start_4 .. :try_end_138} :catchall_139

    return-object v0

    .line 1643
    :catchall_139
    move-exception v0

    .line 1644
    const-string v1, "NothingXEnhancer"

    const-string v2, "forwardToWatchBridgeDirectly error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1645
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Watch Bridge note: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCleanDashboardData(Landroid/content/Context;)Ljava/util/Map;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2135
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 2136
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sCachedDashboardMap:Ljava/util/Map;

    .line 2137
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 2138
    if-nez v0, :cond_15

    .line 2140
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->computeDashboardDataInternal(Landroid/content/Context;)Ljava/util/Map;

    move-result-object p0

    .line 2141
    sput-object p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sCachedDashboardMap:Ljava/util/Map;

    .line 2142
    sput-wide v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastDbRefreshMs:J

    .line 2143
    return-object p0

    .line 2145
    :cond_15
    sget-boolean v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sDbRefreshInFlight:Z

    if-nez v3, :cond_35

    sget-wide v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastDbRefreshMs:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x7d0

    cmp-long v7, v3, v5

    if-ltz v7, :cond_35

    .line 2146
    const/4 v3, 0x1

    sput-boolean v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sDbRefreshInFlight:Z

    .line 2147
    sput-wide v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastDbRefreshMs:J

    .line 2148
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer$12;

    invoke-direct {v2, p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$12;-><init>(Landroid/content/Context;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 2158
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 2160
    :cond_35
    return-object v0
.end method

.method private static getDeclaredFieldRecursive(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 660
    nop

    .line 661
    :goto_1
    if-eqz p0, :cond_16

    const-class v0, Ljava/lang/Object;

    if-eq p0, v0, :cond_16

    .line 663
    :try_start_7
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 664
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_f
    .catch Ljava/lang/NoSuchFieldException; {:try_start_7 .. :try_end_f} :catch_10

    .line 665
    return-object v0

    .line 666
    :catch_10
    move-exception v0

    .line 667
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 668
    goto :goto_1

    .line 670
    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 735
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "nothing_x_sleep_timer"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static getWakeUpBurstCurrentWave()I
    .registers 1

    .line 1348
    sget v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstCurrentWave:I

    return v0
.end method

.method public static getWakeUpBurstTotalWaves()I
    .registers 1

    .line 1352
    sget v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstTotalWaves:I

    return v0
.end method

.method public static handleBroadcast(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 11

    .line 1143
    const/4 v0, 0x0

    if-eqz p0, :cond_af

    if-nez p1, :cond_7

    goto/16 :goto_af

    .line 1145
    :cond_7
    :try_start_7
    const-string v1, "nt_sleep_detector_poll"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_a6

    const/4 v2, 0x0

    const-string v3, "power"

    const/4 v4, 0x1

    if-eqz v1, :cond_62

    .line 1146
    :try_start_13
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    .line 1147
    nop

    .line 1148
    if-eqz p1, :cond_27

    .line 1149
    const-string v1, "nothingx:sleep_poll_wl"

    invoke-virtual {p1, v4, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    .line 1150
    const-wide/16 v5, 0x1f40

    invoke-virtual {v2, v5, v6}, Landroid/os/PowerManager$WakeLock;->acquire(J)V
    :try_end_27
    .catchall {:try_start_13 .. :try_end_27} :catchall_a6

    .line 1153
    :cond_27
    :try_start_27
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->checkWatchSleepAndAutoStart(Landroid/content/Context;)V

    .line 1154
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 1155
    const-string v1, "ARMED"

    const-string v3, "state"

    const-string v5, "IDLE"

    invoke-interface {p1, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_49

    .line 1156
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/32 v7, 0xea60

    add-long/2addr v5, v7

    invoke-static {p0, v5, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scheduleSleepDetectorPoll(Landroid/content/Context;J)V
    :try_end_49
    .catchall {:try_start_27 .. :try_end_49} :catchall_55

    .line 1159
    :cond_49
    if-eqz v2, :cond_54

    :try_start_4b
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p0

    if-eqz p0, :cond_54

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1161
    :cond_54
    return v4

    .line 1159
    :catchall_55
    move-exception p0

    if-eqz v2, :cond_61

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p1

    if-eqz p1, :cond_61

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1160
    :cond_61
    throw p0

    .line 1164
    :cond_62
    const-string v1, "nt_sleep_timer_alarm"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_6e

    .line 1166
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->ensureTimerRestored(Landroid/content/Context;)V

    .line 1167
    return v0

    .line 1170
    :cond_6e
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 1171
    nop

    .line 1172
    if-eqz v1, :cond_82

    .line 1173
    const-string v2, "nothingx:sleeptimer_wl"

    invoke-virtual {v1, v4, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    .line 1174
    const-wide/16 v5, 0x2710

    invoke-virtual {v2, v5, v6}, Landroid/os/PowerManager$WakeLock;->acquire(J)V
    :try_end_82
    .catchall {:try_start_4b .. :try_end_82} :catchall_a6

    .line 1177
    :cond_82
    :try_start_82
    const-string v1, "nt_timer_id"

    const-wide/16 v5, -0x1

    invoke-virtual {p1, v1, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    invoke-static {p0, v5, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->completeTimerAndNotifyOnce(Landroid/content/Context;J)V
    :try_end_8d
    .catchall {:try_start_82 .. :try_end_8d} :catchall_99

    .line 1179
    if-eqz v2, :cond_98

    :try_start_8f
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p0

    if-eqz p0, :cond_98

    .line 1180
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1183
    :cond_98
    return v4

    .line 1179
    :catchall_99
    move-exception p0

    if-eqz v2, :cond_a5

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result p1

    if-eqz p1, :cond_a5

    .line 1180
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1182
    :cond_a5
    throw p0
    :try_end_a6
    .catchall {:try_start_8f .. :try_end_a6} :catchall_a6

    .line 1184
    :catchall_a6
    move-exception p0

    .line 1185
    const-string p1, "NothingXEnhancer"

    const-string v1, "handleBroadcast error"

    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1186
    return v0

    .line 1143
    :cond_af
    :goto_af
    return v0
.end method

.method public static handleRebootBroadcast(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    .line 1194
    const-string v0, "NothingXEnhancer"

    if-nez p0, :cond_5

    return-void

    .line 1196
    :cond_5
    :try_start_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleRebootBroadcast action="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p1, :cond_17

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    goto :goto_19

    :cond_17
    const-string p1, "null"

    :goto_19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1197
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->ensureTimerRestored(Landroid/content/Context;)V
    :try_end_2b
    .catchall {:try_start_5 .. :try_end_2b} :catchall_2c

    .line 1200
    goto :goto_32

    .line 1198
    :catchall_2c
    move-exception p0

    .line 1199
    const-string p1, "handleRebootBroadcast error"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1201
    :goto_32
    return-void
.end method

.method public static isWakeUpBurstActive()Z
    .registers 1

    .line 1344
    sget-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z

    return v0
.end method

.method private static listTables(Landroid/database/sqlite/SQLiteDatabase;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2009
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2010
    nop

    .line 2012
    const/4 v1, 0x0

    :try_start_7
    const-string v2, "SELECT name FROM sqlite_master WHERE type=\'table\' AND name NOT LIKE \'android_%\' AND name NOT LIKE \'sqlite_%\'"

    invoke-virtual {p0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 2013
    :goto_d
    if-eqz v1, :cond_1e

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p0

    if-eqz p0, :cond_1e

    .line 2014
    const/4 p0, 0x0

    invoke-interface {v1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1d
    .catchall {:try_start_7 .. :try_end_1d} :catchall_26

    goto :goto_d

    .line 2018
    :cond_1e
    if-eqz v1, :cond_2c

    :try_start_20
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_2c

    :catchall_24
    move-exception p0

    goto :goto_2c

    .line 2016
    :catchall_26
    move-exception p0

    .line 2018
    if-eqz v1, :cond_2c

    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2c
    .catchall {:try_start_20 .. :try_end_2c} :catchall_24

    .line 2020
    :cond_2c
    :goto_2c
    return-object v0
.end method

.method public static normalizeEpochMs(J)J
    .registers 5

    .line 2092
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gtz v2, :cond_7

    return-wide v0

    .line 2093
    :cond_7
    const-wide v0, 0x2540be400L

    cmp-long v2, p0, v0

    if-gez v2, :cond_15

    .line 2094
    const-wide/16 v0, 0x3e8

    mul-long p0, p0, v0

    return-wide p0

    .line 2096
    :cond_15
    return-wide p0
.end method

.method private static parseFlutterSyncResult(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 11

    .line 1739
    nop

    .line 1741
    const/4 v0, 0x1

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "value"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 1742
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 1743
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_13
    .catchall {:try_start_2 .. :try_end_13} :catchall_14

    goto :goto_15

    .line 1744
    :catchall_14
    move-exception v1

    :goto_15
    nop

    .line 1746
    :try_start_16
    instance-of v1, p1, Ljava/util/List;

    if-eqz v1, :cond_117

    .line 1747
    check-cast p1, Ljava/util/List;

    .line 1748
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 1749
    sget-object p1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    const-string v0, "0 records returned by NtSyncHealthFlutterApi"

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_111

    .line 1751
    :cond_2b
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 1752
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getJsonData"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1753
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "getStart"

    new-array v5, v3, [Ljava/lang/Class;

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 1754
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getEnd"

    new-array v6, v3, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1755
    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1756
    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 1757
    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v4, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 1758
    const-wide/16 v4, 0x0

    if-eqz v0, :cond_84

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v8, v6, v4

    if-lez v8, :cond_84

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    goto :goto_8c

    :cond_84
    if-eqz v2, :cond_8b

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    goto :goto_8c

    :cond_8b
    move-wide v6, v4

    .line 1759
    :goto_8c
    invoke-static {v6, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->normalizeEpochMs(J)J

    move-result-wide v6

    .line 1760
    if-eqz v1, :cond_b2

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b2

    const-string v0, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b2

    .line 1761
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterRawJsonCache:Ljava/util/Map;

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1762
    cmp-long v0, v6, v4

    if-lez v0, :cond_b2

    .line 1763
    sget-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterTimestampCache:Ljava/util/Map;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1766
    :cond_b2
    cmp-long v0, v6, v4

    if-lez v0, :cond_bb

    invoke-static {v6, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatTime(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_bd

    :cond_bb
    const-string v0, "no-timestamp"

    .line 1767
    :goto_bd
    if-eqz v1, :cond_c0

    goto :goto_c2

    :cond_c0
    const-string v1, ""

    .line 1768
    :goto_c2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v4, 0xa0

    if-le v2, v4, :cond_e1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1769
    :cond_e1
    sget-object v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCache:Ljava/util/Map;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[PERIODICALLY UPDATED] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 1771
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v3, " synced record(s) | Latest ("

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "): "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1769
    invoke-interface {v2, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1774
    :goto_111
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    sput-wide p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCacheTimeMs:J
    :try_end_117
    .catchall {:try_start_16 .. :try_end_117} :catchall_118

    .line 1778
    :cond_117
    goto :goto_120

    .line 1776
    :catchall_118
    move-exception p0

    .line 1777
    const-string p1, "NothingXEnhancer"

    const-string v0, "parseFlutterSyncResult error"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1779
    :goto_120
    return-void
.end method

.method private static parseMetricFromFlutterCache(Ljava/lang/String;Z)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;
    .registers 5

    .line 2400
    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterRawJsonCache:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2401
    if-eqz v1, :cond_33

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_12

    goto :goto_33

    .line 2402
    :cond_12
    sget-object v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterTimestampCache:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    .line 2403
    invoke-static {v1, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->extractMetricFromRawString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 2404
    if-eqz p1, :cond_35

    .line 2405
    new-instance v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    invoke-direct {v1, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;-><init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;)V

    .line 2406
    iput-object p1, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    .line 2407
    if-eqz p0, :cond_2e

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    goto :goto_30

    :cond_2e
    sget-wide p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sFlutterHealthCacheTimeMs:J

    :goto_30
    iput-wide p0, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J
    :try_end_32
    .catchall {:try_start_1 .. :try_end_32} :catchall_34

    .line 2408
    return-object v1

    .line 2401
    :cond_33
    :goto_33
    return-object v0

    .line 2410
    :catchall_34
    move-exception p0

    :cond_35
    nop

    .line 2411
    return-object v0
.end method

.method public static declared-synchronized pauseTimer(Landroid/content/Context;)V
    .registers 10

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1026
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 1027
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1028
    const-string v2, "state"

    const-string v3, "IDLE"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1029
    const-string v3, "RUNNING"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_68

    if-nez v2, :cond_1d

    monitor-exit v0

    return-void

    .line 1031
    :cond_1d
    :try_start_1d
    const-string v2, "target_epoch_ms"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1032
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x3e8

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    .line 1033
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelAlarm(Landroid/content/Context;)V

    .line 1035
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "state"

    const-string v2, "PAUSED"

    .line 1036
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "remaining_ms"

    .line 1037
    invoke-interface {p0, v1, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "target_epoch_ms"

    .line 1038
    invoke-interface {p0, v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 1039
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1040
    const-string p0, "NothingXEnhancer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sleep Timer paused: remainingMs="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_66
    .catchall {:try_start_1d .. :try_end_66} :catchall_68

    .line 1041
    monitor-exit v0

    return-void

    .line 1025
    :catchall_68
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static postPhoneAndWatchNotification(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 13

    .line 1495
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1496
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 1498
    :try_start_9
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 1499
    if-nez v1, :cond_16

    .line 1500
    const-string p0, "ERROR: NotificationManager unavailable"

    return-object p0

    .line 1503
    :cond_16
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_18
    .catchall {:try_start_9 .. :try_end_18} :catchall_f8

    const/16 v3, 0x1a

    const-string v4, "nothing_x_sleep_timer_channel"

    const/4 v5, 0x1

    if-lt v2, v3, :cond_3d

    .line 1504
    :try_start_1f
    new-instance v2, Landroid/app/NotificationChannel;

    const-string v6, "Nothing X Sleep Timer & Watch Alerts"

    const/4 v7, 0x4

    invoke-direct {v2, v4, v6, v7}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 1509
    const-string v6, "Notifications for Nothing X Sleep Timer and Watch Pro 2 alerts"

    invoke-virtual {v2, v6}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 1510
    invoke-virtual {v2, v5}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 1511
    new-array v6, v7, [J

    fill-array-data v6, :array_112

    invoke-virtual {v2, v6}, Landroid/app/NotificationChannel;->setVibrationPattern([J)V

    .line 1512
    invoke-virtual {v2, v5}, Landroid/app/NotificationChannel;->setLockscreenVisibility(I)V

    .line 1513
    invoke-virtual {v1, v2}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 1516
    :cond_3d
    new-instance v2, Landroid/content/Intent;

    const-class v6, Lcom/nothing/nt_route/TestActivity;

    invoke-direct {v2, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1517
    const/high16 v6, 0x14000000

    invoke-virtual {v2, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1518
    nop

    .line 1519
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x17

    if-lt v6, v7, :cond_53

    const/high16 v6, 0xc000000

    goto :goto_55

    :cond_53
    const/high16 v6, 0x8000000

    .line 1520
    :goto_55
    invoke-static {p0, p1, v2, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 1523
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v3, :cond_63

    .line 1524
    new-instance v3, Landroid/app/Notification$Builder;

    invoke-direct {v3, p0, v4}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_6b

    .line 1526
    :cond_63
    new-instance v3, Landroid/app/Notification$Builder;

    invoke-direct {v3, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 1527
    invoke-virtual {v3, v5}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 1530
    :goto_6b
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->icon:I

    .line 1531
    if-nez v6, :cond_76

    const v6, 0x108002e

    .line 1533
    :cond_76
    invoke-virtual {v3, v6}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v6

    .line 1534
    invoke-virtual {v6, p2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    .line 1535
    invoke-virtual {v6, p3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    new-instance v7, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v7}, Landroid/app/Notification$BigTextStyle;-><init>()V

    .line 1536
    invoke-virtual {v7, p3}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    move-result-object v6

    .line 1537
    invoke-virtual {v6, v2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1538
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1539
    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1540
    invoke-virtual {v2, v5}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1541
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 1542
    const/4 v6, -0x1

    invoke-virtual {v2, v6}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 1544
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v2, v6, :cond_ba

    .line 1545
    const-string v2, "reminder"

    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 1546
    invoke-virtual {v3, v5}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    .line 1549
    :cond_ba
    invoke-virtual {v3}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    .line 1552
    iget v3, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v3, v3, 0x10

    iput v3, v2, Landroid/app/Notification;->flags:I

    .line 1553
    iget v3, v2, Landroid/app/Notification;->flags:I

    and-int/lit8 v3, v3, -0x3

    iput v3, v2, Landroid/app/Notification;->flags:I

    .line 1554
    iget v3, v2, Landroid/app/Notification;->flags:I

    and-int/lit8 v3, v3, -0x21

    iput v3, v2, Landroid/app/Notification;->flags:I

    .line 1556
    invoke-virtual {v1, p1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 1557
    const-string v1, "Phone Notification posted (ID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", channel="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ").\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1559
    if-eqz p4, :cond_f7

    .line 1560
    const-string p4, "com.nothing.smartcenter"

    invoke-static {p0, p1, p2, p3, p4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->forwardToWatchBridgeDirectly(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1561
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_f7
    .catchall {:try_start_1f .. :try_end_f7} :catchall_f8

    .line 1566
    :cond_f7
    goto :goto_10d

    .line 1563
    :catchall_f8
    move-exception p0

    .line 1564
    const-string p1, "NothingXEnhancer"

    const-string p2, "postPhoneAndWatchNotification error"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1565
    const-string p1, "Error posting notification: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1567
    :goto_10d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :array_112
    .array-data 8
        0x0
        0x12c
        0x96
        0x12c
    .end array-data
.end method

.method private static queryAddUpMetric(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;
    .registers 6

    .line 2356
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 2357
    :cond_4
    nop

    .line 2359
    :try_start_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT lastValue, timestamp FROM \"AddUpNetModelTable\" WHERE id LIKE \'%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "%\' ORDER BY timestamp DESC LIMIT 1"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_22
    .catchall {:try_start_5 .. :try_end_22} :catchall_5a

    .line 2360
    if-eqz p0, :cond_52

    :try_start_24
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_52

    .line 2361
    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    .line 2362
    const/4 v1, 0x1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->normalizeEpochMs(J)J

    move-result-wide v1

    .line 2363
    if-lez p1, :cond_52

    .line 2364
    new-instance v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    invoke-direct {v3, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;-><init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;)V

    .line 2365
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    .line 2366
    iput-wide v1, v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J
    :try_end_47
    .catchall {:try_start_24 .. :try_end_47} :catchall_50

    .line 2367
    nop

    .line 2372
    if-eqz p0, :cond_4f

    :try_start_4a
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_4d
    .catchall {:try_start_4a .. :try_end_4d} :catchall_4e

    goto :goto_4f

    :catchall_4e
    move-exception p0

    .line 2367
    :cond_4f
    :goto_4f
    return-object v3

    .line 2370
    :catchall_50
    move-exception p1

    goto :goto_5c

    .line 2372
    :cond_52
    if-eqz p0, :cond_61

    :try_start_54
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_61

    :catchall_58
    move-exception p0

    goto :goto_61

    .line 2370
    :catchall_5a
    move-exception p0

    move-object p0, v0

    .line 2372
    :goto_5c
    if-eqz p0, :cond_61

    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_61
    .catchall {:try_start_54 .. :try_end_61} :catchall_58

    .line 2374
    :cond_61
    :goto_61
    return-object v0
.end method

.method private static queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;
    .registers 22

    .line 2456
    move-object/from16 v0, p1

    const-string v1, "heart"

    const-string v2, "sleep"

    .line 2458
    const/4 v3, 0x0

    :try_start_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SELECT * FROM \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\" ORDER BY rowid DESC LIMIT 1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v5, p0

    invoke-virtual {v5, v4, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_26
    .catchall {:try_start_7 .. :try_end_26} :catchall_269

    .line 2459
    if-eqz v4, :cond_261

    :try_start_28
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_261

    .line 2460
    new-instance v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    invoke-direct {v5, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;-><init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;)V

    .line 2461
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v6

    .line 2462
    nop

    .line 2463
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    .line 2464
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 2465
    move-object v10, v3

    const/4 v9, 0x0

    :goto_4e
    array-length v11, v6

    if-ge v9, v11, :cond_240

    .line 2466
    aget-object v11, v6, v9

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v11, v12}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    .line 2467
    invoke-interface {v4, v9}, Landroid/database/Cursor;->getType(I)I

    move-result v12
    :try_end_5d
    .catchall {:try_start_28 .. :try_end_5d} :catchall_25f

    .line 2468
    const-string v13, "stress"

    const-string v14, "spo2"

    const-string v15, "totalstep"

    const-string v8, "steps"

    const-string v3, "step"

    move-object/from16 v16, v6

    const-string v6, "value"

    move/from16 v17, v7

    const-string v7, "duration"

    move-object/from16 p1, v10

    const/4 v10, 0x1

    if-ne v12, v10, :cond_1a9

    .line 2469
    :try_start_74
    invoke-interface {v4, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    .line 2470
    invoke-virtual {v11, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_97

    invoke-virtual {v11, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_97

    const-string v12, "sporttime"

    .line 2471
    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_97

    const-string v12, "activetime"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_95

    goto :goto_97

    :cond_95
    const/4 v12, 0x0

    goto :goto_98

    :cond_97
    :goto_97
    const/4 v12, 0x1

    .line 2472
    :goto_98
    if-nez v12, :cond_ec

    const-string v12, "time"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "starttime"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "endtime"

    .line 2473
    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "createtime"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "updatetime"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "date"

    .line 2474
    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "daytime"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "timestamp"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "start"

    .line 2475
    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_ea

    const-string v12, "end"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_ec

    :cond_ea
    const/4 v12, 0x1

    goto :goto_ed

    :cond_ec
    const/4 v12, 0x0

    .line 2476
    :goto_ed
    if-eqz v12, :cond_112

    .line 2477
    invoke-static/range {v18 .. v19}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->normalizeEpochMs(J)J

    move-result-wide v6

    .line 2478
    const-wide v10, 0x16f5e66e800L

    cmp-long v3, v6, v10

    if-lez v3, :cond_110

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    const-wide/32 v12, 0x5265c00

    add-long/2addr v10, v12

    cmp-long v3, v6, v10

    if-gtz v3, :cond_110

    .line 2479
    iget-wide v10, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    invoke-static {v10, v11, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    iput-wide v6, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    .line 2481
    :cond_110
    goto/16 :goto_1a5

    :cond_112
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_170

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_170

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_170

    .line 2482
    invoke-virtual {v11, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    invoke-virtual {v11, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    invoke-virtual {v11, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    .line 2483
    invoke-virtual {v11, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    invoke-virtual {v11, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    const-string v3, "avg"

    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    const-string v3, "total"

    .line 2484
    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    invoke-virtual {v11, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    const-string v3, "bpm"

    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    const-string v3, "cal"

    .line 2485
    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_170

    const-string v3, "distance"

    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1a5

    .line 2487
    :cond_170
    if-eqz v0, :cond_18b

    const-string v3, "min"

    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_18a

    const-string v3, "resting"

    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_18a

    const-string v3, "base"

    invoke-virtual {v11, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_18b

    :cond_18a
    goto :goto_18c

    :cond_18b
    const/4 v10, 0x0

    .line 2488
    :goto_18c
    if-nez v10, :cond_1a5

    iget-object v3, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v3, :cond_1a5

    const-wide/16 v6, 0x0

    cmp-long v3, v18, v6

    if-lez v3, :cond_1a5

    const-wide/32 v6, 0x989680

    cmp-long v3, v18, v6

    if-gez v3, :cond_1a5

    .line 2489
    invoke-static/range {v18 .. v19}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    .line 2492
    :cond_1a5
    :goto_1a5
    move/from16 v18, v0

    goto/16 :goto_233

    :cond_1a9
    const/4 v10, 0x3

    if-ne v12, v10, :cond_231

    .line 2493
    invoke-interface {v4, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 2494
    if-eqz v10, :cond_22e

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_22e

    const-string v12, "null"

    invoke-virtual {v12, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_22e

    .line 2495
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_1c4
    .catchall {:try_start_74 .. :try_end_1c4} :catchall_25f

    const-string v12, "["

    move/from16 v18, v0

    const-string v0, "{"

    if-nez v6, :cond_1f6

    :try_start_1cc
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f6

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f6

    .line 2496
    invoke-virtual {v11, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1f6

    invoke-virtual {v11, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1f6

    invoke-virtual {v11, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1f6

    .line 2497
    invoke-virtual {v11, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1f6

    invoke-virtual {v11, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_209

    :cond_1f6
    iget-object v3, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    if-nez v3, :cond_209

    .line 2498
    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_209

    invoke-virtual {v10, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_209

    .line 2499
    iput-object v10, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    goto :goto_233

    .line 2500
    :cond_209
    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22d

    invoke-virtual {v10, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22d

    const-string v0, "item"

    invoke-virtual {v11, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_22d

    const-string v0, "data"

    invoke-virtual {v11, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_22d

    const-string v0, "json"

    invoke-virtual {v11, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_233

    .line 2501
    :cond_22d
    goto :goto_235

    .line 2494
    :cond_22e
    move/from16 v18, v0

    goto :goto_233

    .line 2492
    :cond_231
    move/from16 v18, v0

    .line 2465
    :cond_233
    :goto_233
    move-object/from16 v10, p1

    :goto_235
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v6, v16

    move/from16 v7, v17

    move/from16 v0, v18

    const/4 v3, 0x0

    goto/16 :goto_4e

    .line 2507
    :cond_240
    move/from16 v17, v7

    move-object/from16 p1, v10

    if-eqz p1, :cond_252

    .line 2508
    move-object/from16 v3, p1

    move/from16 v0, v17

    invoke-static {v3, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->extractMetricFromRawString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2509
    if-eqz v0, :cond_252

    .line 2510
    iput-object v0, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    .line 2513
    :cond_252
    iget-object v0, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;
    :try_end_254
    .catchall {:try_start_1cc .. :try_end_254} :catchall_25f

    if-eqz v0, :cond_261

    .line 2514
    nop

    .line 2519
    if-eqz v4, :cond_25e

    :try_start_259
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_25c
    .catchall {:try_start_259 .. :try_end_25c} :catchall_25d

    goto :goto_25e

    :catchall_25d
    move-exception v0

    .line 2514
    :cond_25e
    :goto_25e
    return-object v5

    .line 2517
    :catchall_25f
    move-exception v0

    goto :goto_26b

    .line 2519
    :cond_261
    if-eqz v4, :cond_270

    :try_start_263
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    goto :goto_270

    :catchall_267
    move-exception v0

    goto :goto_270

    .line 2517
    :catchall_269
    move-exception v0

    const/4 v4, 0x0

    .line 2519
    :goto_26b
    if-eqz v4, :cond_270

    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_270
    .catchall {:try_start_263 .. :try_end_270} :catchall_267

    .line 2521
    :cond_270
    :goto_270
    const/4 v1, 0x0

    return-object v1
.end method

.method private static queryLatestTableRowSummary(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;
    .registers 22

    .line 2024
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 2025
    nop

    .line 2027
    nop

    .line 2028
    const/4 v2, 0x0

    :try_start_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SELECT COUNT(*) FROM \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_24
    .catchall {:try_start_7 .. :try_end_24} :catchall_201

    .line 2029
    const/4 v4, 0x0

    if-eqz v3, :cond_37

    :try_start_27
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_37

    .line 2030
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    goto :goto_38

    .line 2082
    :catchall_32
    move-exception v0

    move-object v6, v2

    :goto_34
    move-object v2, v3

    goto/16 :goto_203

    .line 2032
    :cond_37
    const/4 v5, 0x0

    :goto_38
    if-nez v5, :cond_5c

    .line 2033
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[UNAVAILABLE] Table \""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\" has 0 stored records."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_53
    .catchall {:try_start_27 .. :try_end_53} :catchall_32

    .line 2085
    if-eqz v3, :cond_5a

    :try_start_55
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_58
    .catchall {:try_start_55 .. :try_end_58} :catchall_59

    goto :goto_5a

    :catchall_59
    move-exception v0

    .line 2086
    :cond_5a
    :goto_5a
    nop

    .line 2033
    return-object v1

    .line 2036
    :cond_5c
    :try_start_5c
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SELECT * FROM \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\" ORDER BY rowid DESC LIMIT 1"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6
    :try_end_79
    .catchall {:try_start_5c .. :try_end_79} :catchall_32

    .line 2037
    if-eqz v6, :cond_1f1

    :try_start_7b
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1f1

    .line 2038
    invoke-interface {v6}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v7

    .line 2039
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 2040
    nop

    .line 2041
    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    :goto_8e
    array-length v0, v7

    if-ge v11, v0, :cond_169

    .line 2042
    aget-object v14, v7, v11
    :try_end_93
    .catchall {:try_start_7b .. :try_end_93} :catchall_1ee

    .line 2043
    nop

    .line 2045
    :try_start_94
    invoke-interface {v6, v11}, Landroid/database/Cursor;->getType(I)I

    move-result v0

    .line 2046
    const/4 v15, 0x1

    if-ne v0, v15, :cond_fb

    .line 2047
    invoke-interface {v6, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    .line 2048
    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v17
    :try_end_a3
    .catchall {:try_start_94 .. :try_end_a3} :catchall_137

    .line 2049
    :try_start_a3
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v14, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 2050
    const-string v2, "time"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d9

    const-string v2, "date"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d9

    const-string v2, "ts"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d9

    const-string v2, "start"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d9

    const-string v2, "end"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d9

    const-string v2, "create"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_f8

    .line 2051
    :cond_d9
    invoke-static/range {v15 .. v16}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->normalizeEpochMs(J)J

    move-result-wide v9

    .line 2052
    const-wide v15, 0x16f5e66e800L

    cmp-long v0, v9, v15

    if-lez v0, :cond_f8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    const-wide/32 v18, 0x5265c00

    add-long v15, v15, v18

    cmp-long v0, v9, v15

    if-gtz v0, :cond_f8

    .line 2053
    invoke-static {v12, v13, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9
    :try_end_f7
    .catchall {:try_start_a3 .. :try_end_f7} :catchall_f9

    move-wide v12, v9

    .line 2056
    :cond_f8
    goto :goto_13a

    .line 2064
    :catchall_f9
    move-exception v0

    goto :goto_13a

    .line 2056
    :cond_fb
    const/4 v2, 0x2

    if-ne v0, v2, :cond_107

    .line 2057
    :try_start_fe
    invoke-interface {v6, v11}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v17

    goto :goto_13a

    .line 2058
    :cond_107
    const/4 v2, 0x3

    if-ne v0, v2, :cond_134

    .line 2059
    invoke-interface {v6, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_10e
    .catchall {:try_start_fe .. :try_end_10e} :catchall_137

    .line 2060
    if-eqz v2, :cond_131

    :try_start_110
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v9, 0x78

    if-le v0, v9, :cond_131

    .line 2061
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v9, "..."

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17
    :try_end_12f
    .catchall {:try_start_110 .. :try_end_12f} :catchall_130

    goto :goto_13a

    .line 2064
    :catchall_130
    move-exception v0

    :cond_131
    move-object/from16 v17, v2

    goto :goto_13a

    .line 2058
    :cond_134
    const/16 v17, 0x0

    goto :goto_13a

    .line 2064
    :catchall_137
    move-exception v0

    const/16 v17, 0x0

    :goto_13a
    move-object/from16 v0, v17

    .line 2066
    if-eqz v0, :cond_164

    :try_start_13e
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_164

    const-string v2, "null"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_164

    .line 2067
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_157

    const-string v2, ", "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2068
    :cond_157
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v9, "="

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2041
    :cond_164
    add-int/lit8 v11, v11, 0x1

    const/4 v2, 0x0

    goto/16 :goto_8e

    .line 2072
    :cond_169
    const-wide/16 v9, 0x0

    cmp-long v0, v12, v9

    if-lez v0, :cond_175

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v9, v12

    goto :goto_17a

    :cond_175
    const-wide v9, 0x7fffffffffffffffL

    .line 2074
    :goto_17a
    const-wide/16 v14, 0x0

    cmp-long v0, v12, v14

    if-lez v0, :cond_18a

    const-wide/32 v14, 0x36ee80

    cmp-long v0, v9, v14

    if-gez v0, :cond_18a

    .line 2075
    const-string v0, "[PERIODICALLY UPDATED]"

    goto :goto_18c

    .line 2077
    :cond_18a
    const-string v0, "[HISTORICAL]"

    .line 2079
    :goto_18c
    const-wide/16 v9, 0x0

    cmp-long v2, v12, v9

    if-lez v2, :cond_1aa

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " | Timestamp: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v12, v13}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatTime(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1ac

    :cond_1aa
    const-string v2, ""

    .line 2080
    :goto_1ac
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " ("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " rows in "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ") -> "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_1df
    .catchall {:try_start_13e .. :try_end_1df} :catchall_1ee

    .line 2085
    if-eqz v3, :cond_1e6

    :try_start_1e1
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_1e4
    .catchall {:try_start_1e1 .. :try_end_1e4} :catchall_1e5

    goto :goto_1e6

    :catchall_1e5
    move-exception v0

    .line 2086
    :cond_1e6
    :goto_1e6
    if-eqz v6, :cond_1ed

    :try_start_1e8
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_1eb
    .catchall {:try_start_1e8 .. :try_end_1eb} :catchall_1ec

    goto :goto_1ed

    :catchall_1ec
    move-exception v0

    .line 2080
    :cond_1ed
    :goto_1ed
    return-object v1

    .line 2082
    :catchall_1ee
    move-exception v0

    goto/16 :goto_34

    .line 2085
    :cond_1f1
    if-eqz v3, :cond_1f8

    :try_start_1f3
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_1f6
    .catchall {:try_start_1f3 .. :try_end_1f6} :catchall_1f7

    goto :goto_1f8

    :catchall_1f7
    move-exception v0

    .line 2086
    :cond_1f8
    :goto_1f8
    if-eqz v6, :cond_1ff

    :try_start_1fa
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_1fd
    .catchall {:try_start_1fa .. :try_end_1fd} :catchall_1fe

    goto :goto_1ff

    :catchall_1fe
    move-exception v0

    .line 2088
    :cond_1ff
    :goto_1ff
    const/4 v2, 0x0

    return-object v2

    .line 2082
    :catchall_201
    move-exception v0

    move-object v6, v2

    .line 2083
    :goto_203
    :try_start_203
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Query error on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ": "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_224
    .catchall {:try_start_203 .. :try_end_224} :catchall_233

    .line 2085
    if-eqz v2, :cond_22b

    :try_start_226
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_229
    .catchall {:try_start_226 .. :try_end_229} :catchall_22a

    goto :goto_22b

    :catchall_22a
    move-exception v0

    .line 2086
    :cond_22b
    :goto_22b
    if-eqz v6, :cond_232

    :try_start_22d
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_230
    .catchall {:try_start_22d .. :try_end_230} :catchall_231

    goto :goto_232

    :catchall_231
    move-exception v0

    .line 2083
    :cond_232
    :goto_232
    return-object v1

    .line 2085
    :catchall_233
    move-exception v0

    move-object v1, v0

    if-eqz v2, :cond_23c

    :try_start_237
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_23a
    .catchall {:try_start_237 .. :try_end_23a} :catchall_23b

    goto :goto_23c

    :catchall_23b
    move-exception v0

    .line 2086
    :cond_23c
    :goto_23c
    if-eqz v6, :cond_243

    :try_start_23e
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_241
    .catchall {:try_start_23e .. :try_end_241} :catchall_242

    goto :goto_243

    :catchall_242
    move-exception v0

    .line 2087
    :cond_243
    :goto_243
    goto :goto_245

    :goto_244
    throw v1

    :goto_245
    goto :goto_244
.end method

.method private static readWatchHealthSnapshot(Landroid/content/Context;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;
    .registers 8

    .line 905
    const-string v0, "HeartRateReportDbModelTable"

    new-instance v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;-><init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;)V

    .line 907
    const/4 v3, 0x1

    :try_start_9
    const-string v4, "bluetooth"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothManager;

    .line 908
    if-eqz v4, :cond_24

    .line 909
    const/4 v5, 0x7

    invoke-virtual {v4, v5}, Landroid/bluetooth/BluetoothManager;->getConnectedDevices(I)Ljava/util/List;

    move-result-object v4

    .line 910
    if-eqz v4, :cond_24

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_24

    .line 911
    iput-boolean v3, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->watchBleConnected:Z
    :try_end_22
    .catchall {:try_start_9 .. :try_end_22} :catchall_23

    goto :goto_24

    .line 914
    :catchall_23
    move-exception v4

    :cond_24
    :goto_24
    nop

    .line 916
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->findSqliteDatabases(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 917
    nop

    .line 918
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 919
    const-string v5, "nothing_x.db"

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 920
    nop

    .line 921
    goto :goto_4a

    .line 923
    :cond_48
    goto :goto_2e

    .line 918
    :cond_49
    move-object v4, v2

    .line 924
    :goto_4a
    if-eqz v4, :cond_fd

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_54

    goto/16 :goto_fd

    .line 928
    :cond_54
    nop

    .line 930
    :try_start_55
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0
    :try_end_5d
    .catchall {:try_start_55 .. :try_end_5d} :catchall_f6

    .line 931
    :try_start_5d
    invoke-static {p0, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->countRowsSafe(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I

    move-result v4

    iput v4, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->hrRows:I

    .line 932
    const-string v4, "StepReportDbModelTable"

    invoke-static {p0, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->countRowsSafe(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I

    move-result v4

    iput v4, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->stepRows:I

    .line 933
    const-string v4, "SleepReportDbModelTable"

    invoke-static {p0, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->countRowsSafe(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I

    move-result v4

    iput v4, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->sleepRows:I
    :try_end_73
    .catchall {:try_start_5d .. :try_end_73} :catchall_f3

    .line 935
    nop

    .line 937
    :try_start_74
    const-string v4, "heartRate"

    invoke-static {p0, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryAddUpMetric(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v4

    .line 938
    if-eqz v4, :cond_8f

    iget-object v5, v4, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;
    :try_end_7e
    .catchall {:try_start_74 .. :try_end_7e} :catchall_d7

    if-eqz v5, :cond_8f

    .line 940
    :try_start_80
    iget-object v5, v4, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    .line 941
    iget-wide v4, v4, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    iput-wide v4, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J
    :try_end_8c
    .catchall {:try_start_80 .. :try_end_8c} :catchall_8d

    goto :goto_8e

    .line 942
    :catchall_8d
    move-exception v4

    :goto_8e
    nop

    .line 944
    :cond_8f
    :try_start_8f
    iget v4, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-gtz v4, :cond_ac

    .line 945
    invoke-static {p0, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->queryLatestMetricPoint(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;

    move-result-object v0

    .line 946
    if-eqz v0, :cond_ac

    iget-object v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;
    :try_end_9b
    .catchall {:try_start_8f .. :try_end_9b} :catchall_d7

    if-eqz v4, :cond_ac

    .line 948
    :try_start_9d
    iget-object v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->primaryValue:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    .line 949
    iget-wide v4, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;->epochMs:J

    iput-wide v4, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J
    :try_end_a9
    .catchall {:try_start_9d .. :try_end_a9} :catchall_aa

    goto :goto_ab

    .line 950
    :catchall_aa
    move-exception v0

    :goto_ab
    nop

    .line 953
    :cond_ac
    :try_start_ac
    iget v0, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-gtz v0, :cond_cf

    .line 954
    const-string v0, "SELECT value, time FROM \"HeartRateReportDbModelTable\" ORDER BY time DESC LIMIT 1"

    invoke-virtual {p0, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 955
    if-eqz v2, :cond_cf

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_cf

    .line 956
    const/4 v0, 0x0

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    .line 957
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->normalizeEpochMs(J)J

    move-result-wide v3

    iput-wide v3, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J
    :try_end_cf
    .catchall {:try_start_ac .. :try_end_cf} :catchall_d7

    .line 962
    :cond_cf
    if-eqz v2, :cond_dd

    :try_start_d1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_dd

    :catchall_d5
    move-exception v0

    goto :goto_dd

    .line 960
    :catchall_d7
    move-exception v0

    .line 962
    if-eqz v2, :cond_dd

    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_dd
    .catchall {:try_start_d1 .. :try_end_dd} :catchall_d5

    .line 964
    :cond_dd
    :goto_dd
    :try_start_dd
    sget v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    if-lez v0, :cond_eb

    .line 965
    sget v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    iput v0, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    .line 966
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrTimeMs:J
    :try_end_eb
    .catchall {:try_start_dd .. :try_end_eb} :catchall_f3

    .line 970
    :cond_eb
    if-eqz p0, :cond_fc

    :try_start_ed
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_fc

    :catchall_f1
    move-exception p0

    goto :goto_fc

    .line 968
    :catchall_f3
    move-exception v0

    move-object v2, p0

    goto :goto_f7

    :catchall_f6
    move-exception p0

    .line 970
    :goto_f7
    if-eqz v2, :cond_fc

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_fc
    .catchall {:try_start_ed .. :try_end_fc} :catchall_f1

    .line 972
    :cond_fc
    :goto_fc
    return-object v1

    .line 925
    :cond_fd
    :goto_fd
    return-object v1
.end method

.method public static requestFlutterHealthSync(Landroid/content/Context;Ljava/lang/Runnable;)V
    .registers 18

    .line 1655
    const-string v1, "NothingXEnhancer"

    :try_start_2
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 1656
    const-string v0, "io.flutter.embedding.engine.FlutterEngineCache"

    const/4 v3, 0x0

    invoke-static {v0, v3, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 1657
    const-string v4, "getInstance"

    new-array v5, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1658
    const-string v5, "get"

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Class;

    const-class v8, Ljava/lang/String;

    aput-object v8, v7, v3

    invoke-virtual {v0, v5, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v5, v6, [Ljava/lang/Object;

    const-string v7, "main"

    aput-object v7, v5, v3

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1659
    if-nez v4, :cond_36

    .line 1660
    return-void

    .line 1665
    :cond_36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 1666
    sget-wide v9, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastLifecyclePulseMs:J

    sub-long v9, v7, v9

    const-wide/16 v11, 0x3a98

    cmp-long v0, v9, v11

    if-ltz v0, :cond_81

    .line 1667
    sput-wide v7, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLastLifecyclePulseMs:J
    :try_end_46
    .catchall {:try_start_2 .. :try_end_46} :catchall_15c

    .line 1669
    :try_start_46
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v5, "getLifecycleChannel"

    new-array v7, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v5, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1670
    if-eqz v0, :cond_80

    .line 1671
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v7, "appIsInactive"

    new-array v8, v3, [Ljava/lang/Class;

    invoke-virtual {v5, v7, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v7, v3, [Ljava/lang/Object;

    invoke-virtual {v5, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1672
    new-instance v5, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-direct {v5, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v7, Lcom/nothing/smartcenter/patch/NothingXEnhancer$10;

    invoke-direct {v7, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$10;-><init>(Ljava/lang/Object;)V

    const-wide/16 v8, 0x78

    invoke-virtual {v5, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_7e
    .catchall {:try_start_46 .. :try_end_7e} :catchall_7f

    goto :goto_80

    .line 1682
    :catchall_7f
    move-exception v0

    :cond_80
    :goto_80
    nop

    .line 1685
    :cond_81
    :try_start_81
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v5, "getDartExecutor"

    new-array v7, v3, [Ljava/lang/Class;

    invoke-virtual {v0, v5, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1686
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getBinaryMessenger"

    new-array v7, v3, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v4, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1688
    const-string v4, "io.flutter.plugin.common.BinaryMessenger"

    invoke-static {v4, v3, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4

    .line 1689
    const-string v5, "com.nothing.generate.NtSyncHealthFlutterApi"

    invoke-static {v5, v3, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v5

    .line 1690
    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Class;

    aput-object v4, v8, v3

    const-class v4, Ljava/lang/String;

    aput-object v4, v8, v6

    invoke-virtual {v5, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 1691
    new-array v8, v7, [Ljava/lang/Object;

    aput-object v0, v8, v3

    const-string v0, ""

    aput-object v0, v8, v6

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1693
    const-string v0, "com.nothing.generate.SyncType"

    invoke-static {v0, v3, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v8

    .line 1694
    const-string v0, "kotlin.jvm.functions.Function1"

    invoke-static {v0, v3, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v9

    .line 1695
    const-string v0, "getSyncData"

    new-array v10, v7, [Ljava/lang/Class;

    aput-object v8, v10, v3

    aput-object v9, v10, v6

    invoke-virtual {v5, v0, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 1697
    const/16 v10, 0x8

    new-array v11, v10, [Ljava/lang/String;

    const-string v0, "HEART_RATE"

    aput-object v0, v11, v3

    const-string v0, "OXYGEN_SATURATION"

    aput-object v0, v11, v6

    const-string v0, "STEP"

    aput-object v0, v11, v7

    const-string v0, "SLEEP"

    const/4 v12, 0x3

    aput-object v0, v11, v12

    const-string v0, "EXERCISE"

    const/4 v12, 0x4

    aput-object v0, v11, v12

    const-string v0, "RESTING_HEART"

    const/4 v12, 0x5

    aput-object v0, v11, v12

    const-string v0, "RESPIRATORY_RATE"

    const/4 v12, 0x6

    aput-object v0, v11, v12

    const-string v0, "BODY_TEMPERATURE"

    const/4 v12, 0x7

    aput-object v0, v11, v12

    .line 1708
    const/4 v12, 0x0

    :goto_10c
    if-ge v12, v10, :cond_15b

    aget-object v13, v11, v12
    :try_end_110
    .catchall {:try_start_81 .. :try_end_110} :catchall_15c

    .line 1710
    :try_start_110
    invoke-static {v8, v13}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 1711
    new-array v14, v6, [Ljava/lang/Class;

    aput-object v9, v14, v3

    new-instance v15, Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;
    :try_end_11a
    .catchall {:try_start_110 .. :try_end_11a} :catchall_12f

    move-object/from16 v10, p1

    :try_start_11c
    invoke-direct {v15, v13, v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;-><init>(Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {v2, v14, v15}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v14

    .line 1727
    new-array v15, v7, [Ljava/lang/Object;

    aput-object v0, v15, v3

    aput-object v14, v15, v6

    invoke-virtual {v5, v4, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12c
    .catchall {:try_start_11c .. :try_end_12c} :catchall_12d

    .line 1730
    goto :goto_156

    .line 1728
    :catchall_12d
    move-exception v0

    goto :goto_132

    :catchall_12f
    move-exception v0

    move-object/from16 v10, p1

    .line 1729
    :goto_132
    :try_start_132
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SyncType query skipped for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ": "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_156
    .catchall {:try_start_132 .. :try_end_156} :catchall_15c

    .line 1708
    :goto_156
    add-int/lit8 v12, v12, 0x1

    const/16 v10, 0x8

    goto :goto_10c

    .line 1734
    :cond_15b
    goto :goto_177

    .line 1732
    :catchall_15c
    move-exception v0

    .line 1733
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestFlutterHealthSync error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1735
    :goto_177
    return-void
.end method

.method public static declared-synchronized resumeTimer(Landroid/content/Context;)V
    .registers 11

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1044
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 1045
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1046
    const-string v2, "state"

    const-string v3, "IDLE"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1047
    const-string v3, "PAUSED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_74

    if-nez v2, :cond_1d

    monitor-exit v0

    return-void

    .line 1049
    :cond_1d
    :try_start_1d
    const-string v2, "remaining_ms"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1050
    cmp-long v2, v5, v3

    if-gtz v2, :cond_2c

    const-wide/32 v5, 0xea60

    .line 1051
    :cond_2c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1052
    add-long v7, v2, v5

    .line 1053
    const-string v4, "timer_id"

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 1055
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v4, "state"

    const-string v9, "RUNNING"

    .line 1056
    invoke-interface {v1, v4, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v4, "target_epoch_ms"

    .line 1057
    invoke-interface {v1, v4, v7, v8}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1058
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1060
    invoke-static {p0, v7, v8, v2, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scheduleAlarm(Landroid/content/Context;JJ)V

    .line 1061
    const-string p0, "NothingXEnhancer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sleep Timer resumed: remainingMs="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " target="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_72
    .catchall {:try_start_1d .. :try_end_72} :catchall_74

    .line 1062
    monitor-exit v0

    return-void

    .line 1043
    :catchall_74
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static scanForDbFiles(Ljava/io/File;Ljava/util/List;I)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;I)V"
        }
    .end annotation

    .line 1993
    if-eqz p0, :cond_50

    const/4 v0, 0x3

    if-le p2, v0, :cond_6

    goto :goto_50

    .line 1994
    :cond_6
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 1995
    if-nez p0, :cond_d

    return-void

    .line 1996
    :cond_d
    array-length v0, p0

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_4f

    aget-object v2, p0, v1

    .line 1997
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 1998
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1999
    const-string v4, "lib"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4b

    const-string v4, "code_cache"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4b

    const-string v4, "cache"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4b

    .line 2000
    add-int/lit8 v3, p2, 0x1

    invoke-static {v2, p1, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scanForDbFiles(Ljava/io/File;Ljava/util/List;I)V

    goto :goto_4b

    .line 2002
    :cond_3b
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".db"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 2003
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4c

    .line 2002
    :cond_4b
    :goto_4b
    nop

    .line 1996
    :goto_4c
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 2006
    :cond_4f
    return-void

    .line 1993
    :cond_50
    :goto_50
    return-void
.end method

.method private static scheduleAlarm(Landroid/content/Context;JJ)V
    .registers 11

    .line 1092
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1093
    if-nez v0, :cond_b

    return-void

    .line 1094
    :cond_b
    invoke-static {p0, p3, p4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->buildAlarmPendingIntent(Landroid/content/Context;J)Landroid/app/PendingIntent;

    move-result-object p3

    .line 1097
    const/16 p4, 0x17

    const/4 v1, 0x0

    :try_start_12
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_14
    .catchall {:try_start_12 .. :try_end_14} :catchall_71

    const/16 v3, 0x1f

    const-string v4, "NothingXEnhancer"

    if-lt v2, v3, :cond_3a

    :try_start_1a
    invoke-virtual {v0}, Landroid/app/AlarmManager;->canScheduleExactAlarms()Z

    move-result v2

    if-nez v2, :cond_3a

    .line 1098
    invoke-virtual {v0, v1, p1, p2, p3}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    .line 1099
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Scheduled via setAndAllowWhileIdle for "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1100
    return-void

    .line 1102
    :cond_3a
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/nothing/nt_route/TestActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1103
    nop

    .line 1104
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, p4, :cond_49

    const/high16 v3, 0xc000000

    goto :goto_4b

    :cond_49
    const/high16 v3, 0x8000000

    .line 1105
    :goto_4b
    const v5, 0x9e3f

    invoke-static {p0, v5, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 1106
    new-instance v2, Landroid/app/AlarmManager$AlarmClockInfo;

    invoke-direct {v2, p1, p2, p0}, Landroid/app/AlarmManager$AlarmClockInfo;-><init>(JLandroid/app/PendingIntent;)V

    .line 1107
    invoke-virtual {v0, v2, p3}, Landroid/app/AlarmManager;->setAlarmClock(Landroid/app/AlarmManager$AlarmClockInfo;Landroid/app/PendingIntent;)V

    .line 1108
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Scheduled exact AlarmClock for "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_70
    .catchall {:try_start_1a .. :try_end_70} :catchall_71

    .line 1123
    goto :goto_8a

    .line 1109
    :catchall_71
    move-exception p0

    .line 1111
    :try_start_72
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p0, p4, :cond_7a

    .line 1112
    invoke-virtual {v0, v1, p1, p2, p3}, Landroid/app/AlarmManager;->setExactAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto :goto_7d

    .line 1114
    :cond_7a
    invoke-virtual {v0, v1, p1, p2, p3}, Landroid/app/AlarmManager;->setExact(IJLandroid/app/PendingIntent;)V
    :try_end_7d
    .catchall {:try_start_72 .. :try_end_7d} :catchall_7e

    .line 1122
    :goto_7d
    goto :goto_8a

    .line 1116
    :catchall_7e
    move-exception p0

    .line 1117
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p0, p4, :cond_87

    .line 1118
    invoke-virtual {v0, v1, p1, p2, p3}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto :goto_8a

    .line 1120
    :cond_87
    invoke-virtual {v0, v1, p1, p2, p3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 1124
    :goto_8a
    return-void
.end method

.method private static scheduleSleepDetectorPoll(Landroid/content/Context;J)V
    .registers 7

    .line 1003
    :try_start_0
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1004
    if-nez v0, :cond_b

    return-void

    .line 1005
    :cond_b
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->buildSleepPollPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object p0

    .line 1006
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    const/4 v3, 0x0

    if-lt v1, v2, :cond_1a

    .line 1007
    invoke-virtual {v0, v3, p1, p2, p0}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    goto :goto_1d

    .line 1009
    :cond_1a
    invoke-virtual {v0, v3, p1, p2, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_1d
    .catchall {:try_start_0 .. :try_end_1d} :catchall_1e

    .line 1013
    :goto_1d
    goto :goto_3b

    .line 1011
    :catchall_1e
    move-exception p0

    .line 1012
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "scheduleSleepDetectorPoll error: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "NothingXEnhancer"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1014
    :goto_3b
    return-void
.end method

.method private static scrapeFromFlutterSemanticsTree(Landroid/view/View;)V
    .registers 11

    .line 587
    :try_start_0
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->findFlutterView(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    .line 588
    if-nez p0, :cond_7

    return-void

    .line 589
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "accessibilityBridge"

    invoke-static {v0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getDeclaredFieldRecursive(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 590
    if-nez v0, :cond_14

    return-void

    .line 591
    :cond_14
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 592
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 593
    if-nez p0, :cond_1f

    return-void

    .line 595
    :cond_1f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "flutterSemanticsTree"

    invoke-static {v0, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getDeclaredFieldRecursive(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 596
    if-nez v0, :cond_2c

    return-void

    .line 597
    :cond_2c
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 598
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    .line 599
    if-eqz p0, :cond_1a6

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3f

    goto/16 :goto_1a6

    .line 601
    :cond_3f
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_47
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a8

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 602
    if-nez v0, :cond_54

    goto :goto_47

    .line 603
    :cond_54
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "label"

    invoke-static {v2, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getDeclaredFieldRecursive(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 604
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "value"

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getDeclaredFieldRecursive(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 605
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "flags"

    invoke-static {v4, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getDeclaredFieldRecursive(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 607
    const/4 v5, 0x0

    if-eqz v2, :cond_7c

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_7d

    :cond_7c
    move-object v2, v5

    .line 608
    :goto_7d
    if-eqz v3, :cond_86

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Ljava/lang/String;

    .line 609
    :cond_86
    const-wide/16 v6, 0x0

    if-eqz v4, :cond_8f

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v3

    goto :goto_90

    :cond_8f
    move-wide v3, v6

    .line 610
    :goto_90
    const-wide/16 v8, 0x4

    and-long/2addr v3, v8

    const/4 v0, 0x0

    cmp-long v8, v3, v6

    if-eqz v8, :cond_9a

    const/4 v3, 0x1

    goto :goto_9b

    :cond_9a
    const/4 v3, 0x0

    .line 612
    :goto_9b
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_a0
    .catchall {:try_start_0 .. :try_end_a0} :catchall_1a7

    const-string v6, ""

    if-eqz v2, :cond_a5

    goto :goto_a6

    :cond_a5
    move-object v2, v6

    :goto_a6
    :try_start_a6
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v5, :cond_b3

    goto :goto_b4

    :cond_b3
    move-object v5, v6

    :goto_b4
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 613
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_c7

    goto :goto_47

    .line 616
    :cond_c7
    const-string v4, "Health"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_dc

    const-string v4, "Tab 2 of 2"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_dc

    .line 617
    if-eqz v3, :cond_f0

    .line 618
    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    goto :goto_f0

    .line 620
    :cond_dc
    const-string v4, "My devices"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_f0

    const-string v4, "Tab 1 of 2"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_f0

    .line 621
    if-eqz v3, :cond_f0

    .line 622
    sput-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    .line 627
    :cond_f0
    :goto_f0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "heart rate"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v3, 0x2

    if-eqz v0, :cond_121

    .line 628
    const-string v0, "(\\d{2,3})\\s*bpm"

    invoke-static {v0, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 629
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_121

    .line 630
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 631
    const/16 v4, 0x23

    if-lt v0, v4, :cond_121

    const/16 v4, 0xe6

    if-gt v0, v4, :cond_121

    .line 632
    sput v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    .line 638
    :cond_121
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "blood oxygen"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_13d

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "spo2"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_172

    .line 639
    :cond_13d
    const-string v0, "(\\d{2,3})\\s*%"

    invoke-static {v0, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 640
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_172

    .line 641
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 642
    const/16 v4, 0x46

    if-lt v0, v4, :cond_172

    const/16 v4, 0x64

    if-gt v0, v4, :cond_172

    .line 643
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " %"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    .line 649
    :cond_172
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "steps"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18e

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "step"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1a4

    .line 650
    :cond_18e
    const-string v0, "(\\d+)\\s*/\\s*\\d+"

    invoke-static {v0, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 651
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1a4

    .line 652
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;
    :try_end_1a4
    .catchall {:try_start_a6 .. :try_end_1a4} :catchall_1a7

    .line 655
    :cond_1a4
    goto/16 :goto_47

    .line 599
    :cond_1a6
    :goto_1a6
    return-void

    .line 656
    :catchall_1a7
    move-exception p0

    :cond_1a8
    nop

    .line 657
    return-void
.end method

.method public static scrapeMetricsFromDecorView(Landroid/view/View;)V
    .registers 1

    .line 543
    if-nez p0, :cond_3

    return-void

    .line 545
    :cond_3
    :try_start_3
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->ensureFlutterAccessibilityEnabled(Landroid/view/View;)V

    .line 546
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scrapeFromFlutterSemanticsTree(Landroid/view/View;)V

    .line 547
    invoke-virtual {p0}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p0

    .line 548
    if-eqz p0, :cond_17

    .line 549
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scrapeNodeRecursively(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 550
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_16

    goto :goto_17

    .line 552
    :catchall_16
    move-exception p0

    :cond_17
    :goto_17
    nop

    .line 553
    return-void
.end method

.method private static scrapeNodeRecursively(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 7

    .line 674
    if-nez p0, :cond_3

    return-void

    .line 676
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 677
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 678
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_135

    const-string v3, ""

    if-eqz v0, :cond_19

    :try_start_14
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1a

    :cond_19
    move-object v0, v3

    :goto_1a
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz v1, :cond_2a

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_2a
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 680
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_11f

    .line 682
    const-string v1, "Health"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_53

    const-string v1, "Tab 2 of 2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_53

    .line 683
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_6b

    .line 684
    sput-boolean v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    goto :goto_6b

    .line 686
    :cond_53
    const-string v1, "My devices"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6b

    const-string v1, "Tab 1 of 2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6b

    .line 687
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_6b

    .line 688
    sput-boolean v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    .line 693
    :cond_6b
    :goto_6b
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "heart rate"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v4, 0x2

    if-eqz v1, :cond_9c

    .line 694
    const-string v1, "(\\d{2,3})\\s*bpm"

    invoke-static {v1, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 695
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_9c

    .line 696
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 697
    const/16 v5, 0x23

    if-lt v1, v5, :cond_9c

    const/16 v5, 0xe6

    if-gt v1, v5, :cond_9c

    .line 698
    sput v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    .line 704
    :cond_9c
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "blood oxygen"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b8

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "spo2"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_ed

    .line 705
    :cond_b8
    const-string v1, "(\\d{2,3})\\s*%"

    invoke-static {v1, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 706
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_ed

    .line 707
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 708
    const/16 v5, 0x46

    if-lt v1, v5, :cond_ed

    const/16 v5, 0x64

    if-gt v1, v5, :cond_ed

    .line 709
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " %"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    .line 715
    :cond_ed
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "steps"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_109

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "step"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_11f

    .line 716
    :cond_109
    const-string v1, "(\\d+)\\s*/\\s*\\d+"

    invoke-static {v1, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 717
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_11f

    .line 718
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;

    .line 723
    :cond_11f
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    .line 724
    nop

    :goto_124
    if-ge v2, v0, :cond_136

    .line 725
    invoke-virtual {p0, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    .line 726
    if-eqz v1, :cond_132

    .line 727
    invoke-static {v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scrapeNodeRecursively(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 728
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V
    :try_end_132
    .catchall {:try_start_14 .. :try_end_132} :catchall_135

    .line 724
    :cond_132
    add-int/lit8 v2, v2, 0x1

    goto :goto_124

    .line 731
    :catchall_135
    move-exception p0

    :cond_136
    nop

    .line 732
    return-void
.end method

.method public static declared-synchronized startTimer(Landroid/content/Context;J)V
    .registers 5

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 743
    :try_start_3
    const-string v1, "Manual Start"

    invoke-static {p0, p1, p2, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startTimerInternal(Landroid/content/Context;JLjava/lang/String;)V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_a

    .line 744
    monitor-exit v0

    return-void

    .line 742
    :catchall_a
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static declared-synchronized startTimerInternal(Landroid/content/Context;JLjava/lang/String;)V
    .registers 14

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 747
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 748
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelSleepDetectorPoll(Landroid/content/Context;)V

    .line 749
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 750
    add-long v3, v1, p1

    .line 751
    nop

    .line 753
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->readWatchHealthSnapshot(Landroid/content/Context;)Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;

    move-result-object v5

    .line 754
    iget v6, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->stepRows:I

    .line 755
    iget v7, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    if-lez v7, :cond_1e

    iget v5, v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;->latestHrBpm:I

    goto :goto_20

    :cond_1e
    sget v5, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    .line 757
    :goto_20
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 758
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "state"

    const-string v9, "RUNNING"

    .line 759
    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "duration_ms"

    .line 760
    invoke-interface {v7, v8, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "target_epoch_ms"

    .line 761
    invoke-interface {v7, v8, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "remaining_ms"

    .line 762
    invoke-interface {v7, v8, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "timer_id"

    .line 763
    invoke-interface {v7, v8, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "started_at_ms"

    .line 764
    invoke-interface {v7, v8, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "sleep_baseline_steps"

    .line 765
    invoke-interface {v7, v8, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string v7, "sleep_start_hr"

    .line 766
    invoke-interface {v6, v7, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "paused_reason"

    .line 767
    invoke-interface {v5, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "start_trigger_reason"

    .line 768
    if-eqz p3, :cond_66

    move-object v7, p3

    goto :goto_68

    :cond_66
    const-string v7, "Manual Start"

    :goto_68
    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 769
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 771
    invoke-static {p0, v3, v4, v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scheduleAlarm(Landroid/content/Context;JJ)V

    .line 772
    const-string p0, "NothingXEnhancer"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Sleep Timer started ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v5, "): durationMs="

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " target="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " timerId="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a8
    .catchall {:try_start_3 .. :try_end_a8} :catchall_aa

    .line 773
    monitor-exit v0

    return-void

    .line 746
    :catchall_aa
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized startWakeUpAlarmBurst(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 16

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1366
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 1367
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    .line 1369
    const/4 v1, 0x4

    if-lt p3, v1, :cond_12

    const/16 v1, 0xa

    if-gt p3, v1, :cond_12

    goto :goto_13

    :cond_12
    const/4 p3, 0x6

    .line 1370
    :goto_13
    const/4 v1, 0x1

    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z

    .line 1371
    sput v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstCurrentWave:I

    .line 1372
    sput p3, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstTotalWaves:I

    .line 1375
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;

    invoke-direct {v3, p0, p3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;-><init>(Landroid/content/Context;I)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1408
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1411
    const/4 v7, 0x1

    :goto_28
    if-gt v7, p3, :cond_45

    .line 1412
    nop

    .line 1413
    add-int/lit8 v1, v7, -0x1

    int-to-long v1, v1

    const-wide/16 v3, 0xdac

    mul-long v8, v1, v3

    .line 1414
    sget-object v10, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sBurstHandler:Landroid/os/Handler;

    new-instance v11, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;

    move-object v1, v11

    move v2, v7

    move-object v3, p1

    move v4, p3

    move-object v5, p2

    move-object v6, p0

    invoke-direct/range {v1 .. v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;-><init>(ILjava/lang/String;ILjava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v10, v11, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_42
    .catchall {:try_start_3 .. :try_end_42} :catchall_47

    .line 1411
    add-int/lit8 v7, v7, 0x1

    goto :goto_28

    .line 1445
    :cond_45
    monitor-exit v0

    return-void

    .line 1365
    :catchall_47
    move-exception p0

    monitor-exit v0

    goto :goto_4b

    :goto_4a
    throw p0

    :goto_4b
    goto :goto_4a
.end method

.method public static declared-synchronized stopWakeUpAlarmBurst(Landroid/content/Context;)V
    .registers 4

    const-class v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;

    monitor-enter v0

    .line 1448
    const/4 v1, 0x0

    :try_start_4
    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z

    .line 1449
    sput v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstCurrentWave:I

    .line 1450
    sget-object v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sBurstHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_3c

    .line 1452
    :try_start_e
    sget-object v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sActiveAlarmRingtone:Landroid/media/Ringtone;

    if-eqz v1, :cond_23

    .line 1453
    sget-object v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sActiveAlarmRingtone:Landroid/media/Ringtone;

    invoke-virtual {v1}, Landroid/media/Ringtone;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 1454
    sget-object v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sActiveAlarmRingtone:Landroid/media/Ringtone;

    invoke-virtual {v1}, Landroid/media/Ringtone;->stop()V

    .line 1456
    :cond_1f
    sput-object v2, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sActiveAlarmRingtone:Landroid/media/Ringtone;
    :try_end_21
    .catchall {:try_start_e .. :try_end_21} :catchall_22

    goto :goto_23

    .line 1458
    :catchall_22
    move-exception v1

    :cond_23
    :goto_23
    nop

    .line 1460
    if-eqz p0, :cond_39

    .line 1461
    :try_start_26
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v1, "vibrator"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Vibrator;

    .line 1462
    if-eqz p0, :cond_39

    invoke-virtual {p0}, Landroid/os/Vibrator;->cancel()V
    :try_end_37
    .catchall {:try_start_26 .. :try_end_37} :catchall_38

    goto :goto_39

    .line 1464
    :catchall_38
    move-exception p0

    :cond_39
    :goto_39
    nop

    .line 1465
    monitor-exit v0

    return-void

    .line 1447
    :catchall_3c
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static stylePill(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 529
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 530
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 531
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 532
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 533
    const/high16 p2, 0x41a00000    # 20.0f

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 534
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 535
    return-void
.end method

.method private static updateCardContent(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .registers 32

    .line 450
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    move-object/from16 v4, p7

    move-object/from16 v5, p8

    const-string v6, "step_val"

    const-string v7, "spo2_val"

    const-string v8, "hr_val"

    :try_start_12
    invoke-static/range {p0 .. p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v9

    .line 451
    const-string v10, "state"

    const-string v11, "IDLE"

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 452
    const-string v11, "duration_ms"

    const-wide/32 v12, 0x6ddd00

    invoke-interface {v9, v11, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v11

    .line 453
    const-string v13, "target_epoch_ms"

    const-wide/16 v14, 0x0

    invoke-interface {v9, v13, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    .line 454
    const-string v13, "remaining_ms"

    invoke-interface {v9, v13, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v18

    .line 456
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->isWakeUpBurstActive()Z

    move-result v13
    :try_end_39
    .catchall {:try_start_12 .. :try_end_39} :catchall_2bb

    .line 457
    const-string v14, "00:00:00"

    const-string v15, "#FF453A"

    move-wide/from16 v20, v11

    const-string v11, "#3A1518"

    const-string v12, "\u2699 Full"

    move-object/from16 p1, v9

    const-string v9, "#D71921"

    move-object/from16 v22, v10

    const/16 v10, 0x10

    if-eqz v13, :cond_8e

    .line 458
    :try_start_4d
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getWakeUpBurstCurrentWave()I

    move-result v6

    .line 459
    const-string v7, "\ud83d\udd14 WAKING UP"

    invoke-static {v1, v7, v11, v15}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stylePill(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    invoke-virtual {v2, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 461
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Wave "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/6 vibrating Watch Pro 2!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    const-string v0, "\u23f9 STOP ALARM"

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 463
    invoke-static {v9, v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 464
    invoke-virtual {v4, v12}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 465
    const/4 v0, 0x0

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 466
    const/16 v0, 0x8

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 467
    return-void

    .line 470
    :cond_8e
    const/4 v13, 0x0

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    .line 471
    invoke-virtual {v5, v12}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 474
    invoke-static/range {p0 .. p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getCleanDashboardData(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v5

    .line 475
    sget v12, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I
    :try_end_9b
    .catchall {:try_start_4d .. :try_end_9b} :catchall_2bb

    const-string v13, " BPM"

    if-lez v12, :cond_b3

    :try_start_9f
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget v12, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveHeartRateBpm:I

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_c4

    :cond_b3
    if-eqz v5, :cond_c2

    invoke-interface {v5, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c2

    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_c4

    :cond_c2
    const-string v8, "-- BPM"

    .line 476
    :goto_c4
    sget-object v12, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    if-eqz v12, :cond_cb

    sget-object v7, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveSpo2Val:Ljava/lang/String;

    goto :goto_dc

    :cond_cb
    if-eqz v5, :cond_da

    invoke-interface {v5, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_da

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    goto :goto_dc

    :cond_da
    const-string v7, "-- %"

    .line 477
    :goto_dc
    sget-object v12, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;
    :try_end_de
    .catchall {:try_start_9f .. :try_end_de} :catchall_2bb

    const-string v10, " steps"

    if-eqz v12, :cond_f6

    :try_start_e2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sLiveStepVal:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    :goto_f1
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_114

    :cond_f6
    if-eqz v5, :cond_112

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_112

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    goto :goto_f1

    :cond_112
    const-string v5, "--"

    .line 478
    :goto_114
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u2665 "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " \u2022 \ud83d\udca7 "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u2022 \ud83d\udc63 "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v6, p5

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 480
    const-string v5, "RUNNING"

    move-object/from16 v6, v22

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_148
    .catchall {:try_start_e2 .. :try_end_148} :catchall_2bb

    const-string v7, "#30D158"

    const-string v8, "#3A181B"

    const-string v10, "#2C2C2E"

    if-eqz v5, :cond_1a8

    .line 481
    :try_start_150
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long v5, v16, v5

    const-wide/16 v11, 0x0

    invoke-static {v11, v12, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    .line 482
    const-string v9, "\u25cf RUNNING"

    const-string v11, "#143822"

    invoke-static {v1, v9, v11, v7}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stylePill(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    invoke-static {v5, v6}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 484
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Wake-up at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {v16 .. v17}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u2022 Stops if awake"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 485
    const-string v0, "\u23f8 Pause"

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 486
    const/16 v0, 0x10

    invoke-static {v10, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 487
    const-string v0, "\u23f9 Stop"

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 488
    const/16 v0, 0x10

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 489
    goto/16 :goto_2bc

    :cond_1a8
    const-string v5, "ARMED"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_208

    .line 490
    const-string v5, "armed_hr_threshold"

    const/16 v6, 0x41

    move-object/from16 v12, p1

    invoke-interface {v12, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 491
    const-string v6, "\u25c9 ARMED"

    const-string v7, "#0D3B47"

    const-string v10, "#64D2FF"

    invoke-static {v1, v6, v7, v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stylePill(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    invoke-static/range {v20 .. v21}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 493
    const-string v1, "armed_status_detail"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Waiting for Watch HR \u2264 "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v12, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 494
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 495
    const-string v0, "\u25b6 Start Now"

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 496
    const/16 v0, 0x10

    invoke-static {v9, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 497
    const-string v0, "\u23f9 Cancel"

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 498
    const/16 v0, 0x10

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 499
    goto/16 :goto_2bc

    :cond_208
    move-object/from16 v12, p1

    const-string v5, "PAUSED"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_25d

    .line 500
    const-string v5, "paused_reason"

    const-string v6, "Paused"

    invoke-interface {v12, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 501
    const-string v6, "\u23f8 PAUSED"

    const-string v9, "#3A2E0D"

    const-string v10, "#FFD60A"

    invoke-static {v1, v6, v9, v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stylePill(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 502
    invoke-static/range {v18 .. v19}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 503
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u2022 Tap Resume"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 504
    const-string v0, "\u25b6 Resume"

    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 505
    const/16 v0, 0x10

    invoke-static {v7, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 506
    const-string v0, "\u23f9 Reset"

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 507
    const/16 v0, 0x10

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 508
    goto :goto_2bc

    :cond_25d
    const-string v5, "COMPLETED"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_263
    .catchall {:try_start_150 .. :try_end_263} :catchall_2bb

    const-string v6, "\u25c9 Auto-Sleep"

    const-string v7, "\u25b6 Start"

    if-eqz v5, :cond_28f

    .line 509
    :try_start_269
    const-string v5, "\u2713 DONE"

    invoke-static {v1, v5, v11, v15}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stylePill(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    invoke-virtual {v2, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 511
    const-string v1, "Alarm finished \u2022 Tap Start for new timer"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 512
    invoke-virtual {v3, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 513
    const/16 v0, 0x10

    invoke-static {v9, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 514
    invoke-virtual {v4, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 515
    const/16 v0, 0x10

    invoke-static {v10, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2bc

    .line 517
    :cond_28f
    const-string v5, "READY"

    const-string v8, "#8E8E93"

    invoke-static {v1, v5, v10, v8}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stylePill(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    invoke-static/range {v20 .. v21}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 519
    const-string v1, "Auto-stops when awake \u2022 6x Watch Vibration"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 520
    invoke-virtual {v3, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 521
    const/16 v0, 0x10

    invoke-static {v9, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 522
    invoke-virtual {v4, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 523
    const/16 v0, 0x10

    invoke-static {v10, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->createButtonBg(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_2ba
    .catchall {:try_start_269 .. :try_end_2ba} :catchall_2bb

    goto :goto_2bc

    .line 525
    :catchall_2bb
    move-exception v0

    :goto_2bc
    nop

    .line 526
    return-void
.end method

.method private static vibratePhoneStrong(Landroid/content/Context;)V
    .registers 5

    .line 1469
    :try_start_0
    const-string v0, "vibrator"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Vibrator;

    .line 1470
    if-eqz p0, :cond_3c

    invoke-virtual {p0}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v0

    if-nez v0, :cond_11

    goto :goto_3c

    .line 1471
    :cond_11
    const/4 v0, 0x6

    new-array v0, v0, [J

    fill-array-data v0, :array_40

    .line 1472
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    const/4 v3, -0x1

    if-lt v1, v2, :cond_38

    .line 1473
    new-instance v1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 1474
    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    .line 1475
    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v1

    .line 1476
    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v1

    .line 1477
    invoke-static {v0, v3}, Landroid/os/VibrationEffect;->createWaveform([JI)Landroid/os/VibrationEffect;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;Landroid/media/AudioAttributes;)V

    .line 1478
    goto :goto_3e

    .line 1479
    :cond_38
    invoke-virtual {p0, v0, v3}, Landroid/os/Vibrator;->vibrate([JI)V
    :try_end_3b
    .catchall {:try_start_0 .. :try_end_3b} :catchall_3d

    goto :goto_3e

    .line 1470
    :cond_3c
    :goto_3c
    return-void

    .line 1481
    :catchall_3d
    move-exception p0

    :goto_3e
    nop

    .line 1482
    return-void

    :array_40
    .array-data 8
        0x0
        0x1f4
        0xc8
        0x1f4
        0xc8
        0x258
    .end array-data
.end method

.method private static weightedParams(Landroid/content/Context;II)Landroid/widget/LinearLayout$LayoutParams;
    .registers 7

    .line 432
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 433
    int-to-float p1, p1

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 434
    int-to-float p1, p2

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p0

    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 435
    return-object v0
.end method
