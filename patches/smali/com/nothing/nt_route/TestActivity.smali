.class public Lcom/nothing/nt_route/TestActivity;
.super Landroid/app/Activity;
.source "TestActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nothing/nt_route/TestActivity$MetricTile;,
        Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;
    }
.end annotation


# instance fields
.field private mAlertStatusView:Landroid/widget/TextView;

.field private mCustomMinutesInput:Landroid/widget/EditText;

.field private mHrThresholdInput:Landroid/widget/EditText;

.field private mLiveSyncSubView:Landroid/widget/TextView;

.field private final mPresetButtons:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mRemainingTimeView:Landroid/widget/TextView;

.field private mSelectedDurationMs:J

.field private mSleepHrThresholdBpm:I

.field private mStatusBadgeView:Landroid/widget/TextView;

.field private mStopWakeUpBtn:Landroid/widget/Button;

.field private mSubtitleTimeView:Landroid/widget/TextView;

.field private mTickCounter:I

.field private final mTickRunnable:Ljava/lang/Runnable;

.field private mTileHr:Lcom/nothing/nt_route/TestActivity$MetricTile;

.field private mTileSleep:Lcom/nothing/nt_route/TestActivity$MetricTile;

.field private mTileSpo2:Lcom/nothing/nt_route/TestActivity$MetricTile;

.field private mTileSport:Lcom/nothing/nt_route/TestActivity$MetricTile;

.field private mTileSteps:Lcom/nothing/nt_route/TestActivity$MetricTile;

.field private mTileStress:Lcom/nothing/nt_route/TestActivity$MetricTile;

.field private final mUiHandler:Landroid/os/Handler;

.field private mWatchConnBadge:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 37
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 39
    const-wide/32 v0, 0x6ddd00

    iput-wide v0, p0, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    .line 40
    const/16 v0, 0x41

    iput v0, p0, Lcom/nothing/nt_route/TestActivity;->mSleepHrThresholdBpm:I

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mPresetButtons:Ljava/util/List;

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lcom/nothing/nt_route/TestActivity;->mTickCounter:I

    .line 91
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mUiHandler:Landroid/os/Handler;

    .line 92
    new-instance v0, Lcom/nothing/nt_route/TestActivity$1;

    invoke-direct {v0, p0}, Lcom/nothing/nt_route/TestActivity$1;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    iput-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mTickRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/nothing/nt_route/TestActivity;)V
    .registers 1

    .line 37
    invoke-direct {p0}, Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V

    return-void
.end method

.method static synthetic access$100(Lcom/nothing/nt_route/TestActivity;)I
    .registers 1

    .line 37
    iget p0, p0, Lcom/nothing/nt_route/TestActivity;->mTickCounter:I

    return p0
.end method

.method static synthetic access$108(Lcom/nothing/nt_route/TestActivity;)I
    .registers 3

    .line 37
    iget v0, p0, Lcom/nothing/nt_route/TestActivity;->mTickCounter:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/nothing/nt_route/TestActivity;->mTickCounter:I

    return v0
.end method

.method static synthetic access$200(Lcom/nothing/nt_route/TestActivity;)V
    .registers 1

    .line 37
    invoke-direct {p0}, Lcom/nothing/nt_route/TestActivity;->refreshHealthCards()V

    return-void
.end method

.method static synthetic access$300(Lcom/nothing/nt_route/TestActivity;)Landroid/os/Handler;
    .registers 1

    .line 37
    iget-object p0, p0, Lcom/nothing/nt_route/TestActivity;->mUiHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/EditText;
    .registers 1

    .line 37
    iget-object p0, p0, Lcom/nothing/nt_route/TestActivity;->mCustomMinutesInput:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$500(Lcom/nothing/nt_route/TestActivity;)J
    .registers 3

    .line 37
    iget-wide v0, p0, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    return-wide v0
.end method

.method static synthetic access$502(Lcom/nothing/nt_route/TestActivity;J)J
    .registers 3

    .line 37
    iput-wide p1, p0, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    return-wide p1
.end method

.method static synthetic access$600(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/EditText;
    .registers 1

    .line 37
    iget-object p0, p0, Lcom/nothing/nt_route/TestActivity;->mHrThresholdInput:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$702(Lcom/nothing/nt_route/TestActivity;I)I
    .registers 2

    .line 37
    iput p1, p0, Lcom/nothing/nt_route/TestActivity;->mSleepHrThresholdBpm:I

    return p1
.end method

.method static synthetic access$800(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/TextView;
    .registers 1

    .line 37
    iget-object p0, p0, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$900(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/TextView;
    .registers 1

    .line 37
    iget-object p0, p0, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    return-object p0
.end method

.method private addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V
    .registers 13

    .line 727
    const/16 v6, 0x8

    const/16 v7, 0x12

    const-string v2, "#2C2C2E"

    const-string v3, "#FFFFFF"

    const/high16 v4, 0x41480000    # 12.5f

    const/16 v5, 0xa

    move-object v0, p0

    move-object v1, p2

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object p2

    .line 728
    new-instance v0, Lcom/nothing/nt_route/TestActivity$15;

    invoke-direct {v0, p0, p3, p4}, Lcom/nothing/nt_route/TestActivity$15;-><init>(Lcom/nothing/nt_route/TestActivity;J)V

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 735
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mPresetButtons:Ljava/util/List;

    new-instance v1, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;

    invoke-direct {v1, p2, p3, p4}, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;-><init>(Landroid/widget/Button;J)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 736
    const/4 p3, 0x3

    invoke-direct {p0, p3, p3}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 737
    return-void
.end method

.method private bindTile(Lcom/nothing/nt_route/TestActivity$MetricTile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 703
    if-nez p1, :cond_3

    return-void

    .line 704
    :cond_3
    iget-object v0, p1, Lcom/nothing/nt_route/TestActivity$MetricTile;->valueView:Landroid/widget/TextView;

    if-eqz p2, :cond_8

    goto :goto_a

    :cond_8
    const-string p2, "--"

    :goto_a
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    iget-object p2, p1, Lcom/nothing/nt_route/TestActivity$MetricTile;->subView:Landroid/widget/TextView;

    if-eqz p4, :cond_12

    goto :goto_14

    :cond_12
    const-string p4, ""

    :goto_14
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 706
    const-string p2, "NO DATA"

    if-eqz p3, :cond_1c

    goto :goto_1d

    :cond_1c
    move-object p3, p2

    .line 707
    :goto_1d
    iget-object p4, p1, Lcom/nothing/nt_route/TestActivity$MetricTile;->badgeView:Landroid/widget/TextView;

    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 709
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_32

    const-string p2, "STANDBY"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_32

    const/4 p2, 0x1

    goto :goto_33

    :cond_32
    const/4 p2, 0x0

    .line 710
    :goto_33
    iget-object p3, p1, Lcom/nothing/nt_route/TestActivity$MetricTile;->badgeView:Landroid/widget/TextView;

    if-eqz p2, :cond_3a

    const-string p4, "#30D158"

    goto :goto_3c

    :cond_3a
    const-string p4, "#636366"

    :goto_3c
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p4

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 711
    iget-object p1, p1, Lcom/nothing/nt_route/TestActivity$MetricTile;->valueView:Landroid/widget/TextView;

    if-eqz p2, :cond_4a

    const-string p2, "#FFFFFF"

    goto :goto_4c

    :cond_4a
    const-string p2, "#8E8E93"

    :goto_4c
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 712
    return-void
.end method

.method private createCircleIcon(Ljava/lang/String;)Landroid/widget/TextView;
    .registers 5

    .line 740
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 741
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 742
    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 743
    const/4 p1, 0x2

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 744
    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 745
    const/high16 p1, 0x42080000    # 34.0f

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    .line 746
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, p1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 747
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 748
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 749
    const-string v2, "#2C2C2E"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 750
    int-to-float p1, p1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr p1, v2

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 751
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 752
    return-object v0
.end method

.method private createCompactInput(Ljava/lang/String;)Landroid/widget/EditText;
    .registers 4

    .line 820
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 821
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 822
    const-string p1, "#636366"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 823
    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 824
    const/high16 p1, 0x41400000    # 12.0f

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 825
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 826
    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setGravity(I)V

    .line 827
    const/high16 p1, 0x41200000    # 10.0f

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    .line 828
    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    .line 829
    invoke-virtual {v0, p1, v1, p1, v1}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 830
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 831
    const-string v1, "#2C2C2E"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 832
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {p0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 833
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 834
    return-object v0
.end method

.method private createMetricTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/nothing/nt_route/TestActivity$MetricTile;
    .registers 13

    .line 756
    invoke-direct {p0}, Lcom/nothing/nt_route/TestActivity;->createNothingCard()Landroid/widget/LinearLayout;

    move-result-object v1

    .line 758
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 759
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 760
    const/16 v3, 0x10

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 762
    invoke-direct {p0, p1}, Lcom/nothing/nt_route/TestActivity;->createCircleIcon(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p1

    .line 763
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 764
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 766
    new-instance p3, Landroid/widget/LinearLayout;

    invoke-direct {p3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 767
    const/4 v3, 0x1

    invoke-virtual {p3, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 768
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 769
    const/high16 v5, 0x41000000    # 8.0f

    invoke-static {p0, v5}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 771
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 772
    invoke-virtual {v5, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 773
    const/4 p2, -0x1

    invoke-virtual {v5, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 774
    sget-object v6, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 775
    const/high16 v6, 0x41480000    # 12.5f

    const/4 v7, 0x2

    invoke-virtual {v5, v7, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 776
    invoke-virtual {p3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 778
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 779
    const-string v8, "SYNCED"

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 780
    sget-object v8, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v6, v8, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 781
    const/high16 v8, 0x41100000    # 9.0f

    invoke-virtual {v6, v7, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 782
    invoke-virtual {p3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 784
    invoke-virtual {v0, p3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 785
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 787
    new-instance p3, Landroid/widget/TextView;

    invoke-direct {p3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 788
    const-string v0, "--"

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 789
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 790
    sget-object p2, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-virtual {p3, p2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 791
    const/high16 p2, 0x41b80000    # 23.0f

    invoke-virtual {p3, v7, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 792
    const/high16 p2, 0x41200000    # 10.0f

    invoke-static {p0, p2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p2

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p0, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p3, v2, p2, v2, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 793
    invoke-virtual {v1, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 795
    new-instance p2, Landroid/widget/TextView;

    invoke-direct {p2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 796
    const-string v0, "Waiting for watch"

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 797
    const-string v0, "#8E8E93"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 798
    const/high16 v0, 0x41300000    # 11.0f

    invoke-virtual {p2, v7, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 799
    invoke-virtual {v1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 801
    new-instance v7, Lcom/nothing/nt_route/TestActivity$MetricTile;

    move-object v0, v7

    move-object v2, p1

    move-object v3, v5

    move-object v4, v6

    move-object v5, p3

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/nothing/nt_route/TestActivity$MetricTile;-><init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-object v7
.end method

.method private createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;
    .registers 10

    .line 838
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 839
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 840
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 841
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    .line 842
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    const/4 p3, 0x1

    invoke-virtual {v0, p1, p3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 843
    const/4 p1, 0x2

    invoke-virtual {v0, p1, p4}, Landroid/widget/Button;->setTextSize(IF)V

    .line 844
    int-to-float p1, p5

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    .line 845
    int-to-float p3, p6

    invoke-static {p0, p3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p3

    .line 846
    invoke-virtual {v0, p1, p3, p1, p3}, Landroid/widget/Button;->setPadding(IIII)V

    .line 847
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 848
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 849
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 850
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 851
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 852
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 853
    int-to-float p2, p7

    invoke-static {p0, p2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 854
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 855
    return-object v0
.end method

.method private createNothingCard()Landroid/widget/LinearLayout;
    .registers 4

    .line 808
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 809
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 810
    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {p0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    .line 811
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 812
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 813
    const-string v2, "#1C1C1E"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 814
    const/high16 v2, 0x41c00000    # 24.0f

    invoke-static {p0, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 815
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 816
    return-object v0
.end method

.method private refreshHealthCards()V
    .registers 7

    .line 678
    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getCleanDashboardData(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 679
    const-string v1, "watch_connected"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 680
    const-string v2, "watch_name"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 682
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 683
    const-string v4, "#1C1C1E"

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 684
    const/high16 v4, 0x41900000    # 18.0f

    invoke-static {p0, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 685
    iget-object v4, p0, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 686
    iget-object v3, p0, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    if-eqz v1, :cond_3c

    const-string v4, "#30D158"

    goto :goto_3e

    :cond_3c
    const-string v4, "#8E8E93"

    :goto_3e
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 687
    iget-object v3, p0, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v1, :cond_51

    const-string v5, "\u25cf "

    goto :goto_53

    :cond_51
    const-string v5, "\u25cb "

    :goto_53
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v2, :cond_5a

    goto :goto_5c

    :cond_5a
    const-string v2, "Watch Pro 2"

    :goto_5c
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 689
    iget-object v2, p0, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    if-eqz v2, :cond_90

    .line 690
    iget-object v2, p0, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v1, :cond_77

    const-string v1, "\u25cf Live BLE Connected \u2022 Checked "

    goto :goto_79

    :cond_77
    const-string v1, "\u25cb Cached \u2022 Checked "

    :goto_79
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 691
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 690
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 694
    :cond_90
    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTileHr:Lcom/nothing/nt_route/TestActivity$MetricTile;

    const-string v2, "hr_val"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "hr_badge"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "hr_sub"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->bindTile(Lcom/nothing/nt_route/TestActivity$MetricTile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTileSpo2:Lcom/nothing/nt_route/TestActivity$MetricTile;

    const-string v2, "spo2_val"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "spo2_badge"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "spo2_sub"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->bindTile(Lcom/nothing/nt_route/TestActivity$MetricTile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTileSteps:Lcom/nothing/nt_route/TestActivity$MetricTile;

    const-string v2, "step_val"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "step_badge"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "step_sub"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->bindTile(Lcom/nothing/nt_route/TestActivity$MetricTile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 697
    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTileSleep:Lcom/nothing/nt_route/TestActivity$MetricTile;

    const-string v2, "sleep_val"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "sleep_badge"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "sleep_sub"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->bindTile(Lcom/nothing/nt_route/TestActivity$MetricTile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTileStress:Lcom/nothing/nt_route/TestActivity$MetricTile;

    const-string v2, "stress_val"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "stress_badge"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "stress_sub"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->bindTile(Lcom/nothing/nt_route/TestActivity$MetricTile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTileSport:Lcom/nothing/nt_route/TestActivity$MetricTile;

    const-string v2, "sport_val"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "sport_badge"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "sport_sub"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v0}, Lcom/nothing/nt_route/TestActivity;->bindTile(Lcom/nothing/nt_route/TestActivity$MetricTile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    return-void
.end method

.method private refreshTimerUi()V
    .registers 22

    .line 614
    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 615
    const-string v2, "state"

    const-string v3, "IDLE"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 616
    const-string v3, "duration_ms"

    iget-wide v4, v0, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    invoke-interface {v1, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 617
    const-string v5, "target_epoch_ms"

    const-wide/16 v6, 0x0

    invoke-interface {v1, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 618
    const-string v5, "remaining_ms"

    invoke-interface {v1, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 619
    const-string v5, "last_completed_at_ms"

    invoke-interface {v1, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 620
    const-string v5, "start_trigger_reason"

    const-string v14, "Manual Start"

    invoke-interface {v1, v5, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 622
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->isWakeUpBurstActive()Z

    move-result v14

    .line 623
    const/4 v15, 0x0

    if-eqz v14, :cond_a3

    .line 624
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getWakeUpBurstCurrentWave()I

    move-result v6

    .line 625
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getWakeUpBurstTotalWaves()I

    move-result v7

    .line 626
    move-wide/from16 v16, v12

    iget-object v12, v0, Lcom/nothing/nt_route/TestActivity;->mStopWakeUpBtn:Landroid/widget/Button;

    invoke-virtual {v12, v15}, Landroid/widget/Button;->setVisibility(I)V

    .line 627
    iget-object v12, v0, Lcom/nothing/nt_route/TestActivity;->mStopWakeUpBtn:Landroid/widget/Button;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\u23f9 STOP WAKE-UP ALARM \u2022 WAVE "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v15, "/"

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v18, v14

    const-string v14, " VIBRATING WATCH"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 628
    iget-object v12, v0, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    if-eqz v12, :cond_a2

    .line 629
    iget-object v12, v0, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 630
    iget-object v12, v0, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\ud83d\udd14 Wave "

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " sent to Watch Pro 2 & Phone Alarm"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v12, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 632
    :cond_a2
    goto :goto_ae

    .line 633
    :cond_a3
    move-wide/from16 v16, v12

    move/from16 v18, v14

    iget-object v6, v0, Lcom/nothing/nt_route/TestActivity;->mStopWakeUpBtn:Landroid/widget/Button;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 637
    :goto_ae
    iget-object v6, v0, Lcom/nothing/nt_route/TestActivity;->mPresetButtons:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_b4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const-string v12, "#2C2C2E"

    if-eqz v7, :cond_f7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;

    .line 638
    iget-wide v13, v7, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;->durationMs:J

    move-wide/from16 v19, v10

    iget-wide v10, v0, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    cmp-long v15, v13, v10

    if-nez v15, :cond_ce

    const/4 v10, 0x1

    goto :goto_cf

    :cond_ce
    const/4 v10, 0x0

    .line 639
    :goto_cf
    new-instance v11, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v11}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 640
    if-eqz v10, :cond_d8

    const-string v12, "#D71921"

    :cond_d8
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v11, v10}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 641
    const/high16 v10, 0x41900000    # 18.0f

    invoke-static {v0, v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v11, v10}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 642
    iget-object v10, v7, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;->button:Landroid/widget/Button;

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 643
    iget-object v7, v7, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;->button:Landroid/widget/Button;

    const/4 v10, -0x1

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setTextColor(I)V

    .line 644
    move-wide/from16 v10, v19

    goto :goto_b4

    .line 646
    :cond_f7
    move-wide/from16 v19, v10

    const-string v6, "RUNNING"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_147

    .line 647
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sub-long v1, v8, v1

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 648
    const-string v3, "#143822"

    const-string v4, "#30D158"

    const-string v6, "\u25cf RUNNING"

    invoke-direct {v0, v6, v3, v4}, Lcom/nothing/nt_route/TestActivity;->styleStatusPill(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 649
    iget-object v3, v0, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    invoke-static {v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 650
    iget-object v1, v0, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Wake-up at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v8, v9}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u2022 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 652
    goto/16 :goto_239

    :cond_147
    const-string v5, "ARMED"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18f

    .line 653
    const-string v2, "armed_hr_threshold"

    const/16 v5, 0x41

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 654
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Waiting for Watch HR \u2264 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " BPM"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v5, "armed_status_detail"

    invoke-interface {v1, v5, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 656
    const-string v2, "#0D3B47"

    const-string v5, "#64D2FF"

    const-string v6, "\u25c9 WATCH ARMED"

    invoke-direct {v0, v6, v2, v5}, Lcom/nothing/nt_route/TestActivity;->styleStatusPill(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    iget-object v2, v0, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 658
    iget-object v2, v0, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 659
    goto/16 :goto_239

    :cond_18f
    const-string v3, "PAUSED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1ca

    .line 660
    const-string v2, "paused_reason"

    const-string v3, "Paused"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 661
    const-string v2, "#3A2E0D"

    const-string v3, "#FFD60A"

    const-string v4, "\u23f8 PAUSED"

    invoke-direct {v0, v4, v2, v3}, Lcom/nothing/nt_route/TestActivity;->styleStatusPill(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    iget-object v2, v0, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    invoke-static/range {v19 .. v20}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 663
    iget-object v2, v0, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " \u2022 Tap Resume to continue"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 664
    goto :goto_239

    :cond_1ca
    const-string v1, "COMPLETED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_204

    .line 665
    if-eqz v18, :cond_1d7

    const-string v1, "\ud83d\udd14 WAKING UP"

    goto :goto_1d9

    :cond_1d7
    const-string v1, "\u2713 COMPLETED"

    :goto_1d9
    const-string v2, "#3A1518"

    const-string v3, "#FF453A"

    invoke-direct {v0, v1, v2, v3}, Lcom/nothing/nt_route/TestActivity;->styleStatusPill(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    iget-object v1, v0, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    const-string v2, "00:00:00"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 667
    iget-object v1, v0, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "6x Watch Wake-Up triggered at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 668
    invoke-static/range {v16 .. v17}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 667
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_239

    .line 670
    :cond_204
    const-string v1, "\u25cf READY"

    const-string v2, "#98989F"

    invoke-direct {v0, v1, v12, v2}, Lcom/nothing/nt_route/TestActivity;->styleStatusPill(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 671
    iget-object v1, v0, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    iget-wide v2, v0, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    invoke-static {v2, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatHhMmSs(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 672
    iget-object v1, v0, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "If started now \u2022 6x Watch Wake-Up at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 673
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, v0, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    add-long/2addr v3, v5

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 672
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 675
    :goto_239
    return-void
.end method

.method private requestNotificationPermissionIfNeeded()V
    .registers 4

    .line 867
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    :try_start_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_1b

    .line 868
    invoke-virtual {p0, v0}, Lcom/nothing/nt_route/TestActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1b

    .line 869
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/16 v0, 0xfd2

    invoke-virtual {p0, v1, v0}, Lcom/nothing/nt_route/TestActivity;->requestPermissions([Ljava/lang/String;I)V
    :try_end_19
    .catchall {:try_start_2 .. :try_end_19} :catchall_1a

    goto :goto_1b

    .line 872
    :catchall_1a
    move-exception v0

    :cond_1b
    :goto_1b
    nop

    .line 873
    return-void
.end method

.method private styleStatusPill(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 715
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 716
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 717
    const/high16 p1, 0x41200000    # 10.0f

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    .line 718
    const/high16 p3, 0x40a00000    # 5.0f

    invoke-static {p0, p3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p3

    .line 719
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p3, p1, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 720
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 721
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 722
    const/high16 p2, 0x41600000    # 14.0f

    invoke-static {p0, p2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 723
    iget-object p2, p0, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 724
    return-void
.end method

.method private weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;
    .registers 7

    .line 859
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 860
    int-to-float p1, p1

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 861
    int-to-float p1, p2

    invoke-static {p0, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 862
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 18

    .line 120
    move-object/from16 v8, p0

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/nothing/nt_route/TestActivity;->requestWindowFeature(I)Z

    .line 121
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 123
    invoke-direct/range {p0 .. p0}, Lcom/nothing/nt_route/TestActivity;->requestNotificationPermissionIfNeeded()V

    .line 124
    invoke-static/range {p0 .. p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->ensureTimerRestored(Landroid/content/Context;)V

    .line 126
    invoke-static/range {p0 .. p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 127
    const-string v1, "duration_ms"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 128
    cmp-long v1, v4, v2

    if-lez v1, :cond_21

    .line 129
    iput-wide v4, v8, Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J

    .line 131
    :cond_21
    const-string v1, "armed_hr_threshold"

    const/16 v2, 0x41

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, v8, Lcom/nothing/nt_route/TestActivity;->mSleepHrThresholdBpm:I

    .line 133
    new-instance v10, Landroid/widget/ScrollView;

    invoke-direct {v10, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 134
    const-string v0, "#000000"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v10, v0}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 135
    invoke-virtual {v10, v9}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 137
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 138
    invoke-virtual {v11, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 139
    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    .line 140
    const/high16 v1, 0x42400000    # 48.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v2, 0x41e00000    # 28.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {v11, v0, v1, v0, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 141
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v11, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 150
    const/4 v0, 0x0

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 151
    const/16 v0, 0x10

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 153
    const/16 v6, 0x8

    const/16 v7, 0x16

    const/high16 v4, 0x41800000    # 16.0f

    const/16 v5, 0xe

    const-string v1, "\u2190"

    const-string v2, "#1C1C1E"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 154
    new-instance v1, Lcom/nothing/nt_route/TestActivity$2;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$2;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 162
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 163
    const-string v1, "Sleep & Health"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 165
    sget-object v1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 166
    const/high16 v1, 0x41c80000    # 25.0f

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 167
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, -0x2

    const/4 v4, 0x0

    invoke-direct {v1, v4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 168
    const/high16 v2, 0x41400000    # 12.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 169
    invoke-virtual {v12, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    .line 172
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    const-string v1, "\u25cf Watch Pro 2"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    const/high16 v1, 0x41300000    # 11.0f

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 174
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 175
    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    .line 176
    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    .line 177
    iget-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    invoke-virtual {v2, v0, v1, v0, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 178
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mWatchConnBadge:Landroid/widget/TextView;

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 180
    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 185
    invoke-direct/range {p0 .. p0}, Lcom/nothing/nt_route/TestActivity;->createNothingCard()Landroid/widget/LinearLayout;

    move-result-object v12

    .line 186
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 190
    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 191
    invoke-virtual {v11, v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 195
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 196
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 198
    const-string v1, "\u23f0"

    invoke-direct {v8, v1}, Lcom/nothing/nt_route/TestActivity;->createCircleIcon(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 201
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 202
    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 203
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, -0x2

    const/4 v5, 0x0

    invoke-direct {v2, v5, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 204
    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v8, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 206
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 207
    const-string v4, "Sleep Timer"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 209
    sget-object v4, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 210
    const/high16 v4, 0x41700000    # 15.0f

    const/4 v5, 0x2

    invoke-virtual {v3, v5, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 211
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 213
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 214
    const-string v4, "6x Watch Vibration + Phone Alarm on finish"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    const-string v13, "#8E8E93"

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 216
    const/high16 v4, 0x41300000    # 11.0f

    invoke-virtual {v3, v5, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 217
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 219
    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 221
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    .line 222
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    const-string v2, "READY"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 224
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    const/high16 v2, 0x41280000    # 10.5f

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 225
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStatusBadgeView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 227
    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 230
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    .line 231
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    const-string v1, "02:00:00"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 233
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 234
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    const/high16 v1, 0x42300000    # 44.0f

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 235
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 236
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 237
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mRemainingTimeView:Landroid/widget/TextView;

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 240
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    .line 241
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    const-string v1, "Wake-up alarm at --:--"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    const-string v1, "#98989F"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 243
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 244
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    const/high16 v1, 0x41480000    # 12.5f

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 245
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 246
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v2, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 247
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mSubtitleTimeView:Landroid/widget/TextView;

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 250
    const/16 v6, 0xc

    const/16 v7, 0x14

    const/high16 v4, 0x41580000    # 13.5f

    const/16 v5, 0x10

    const-string v1, "\u23f9 STOP WAKE-UP ALARM (WAVE 1/6)"

    const-string v2, "#D71921"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mStopWakeUpBtn:Landroid/widget/Button;

    .line 251
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 255
    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 256
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStopWakeUpBtn:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 257
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStopWakeUpBtn:Landroid/widget/Button;

    new-instance v2, Lcom/nothing/nt_route/TestActivity$3;

    invoke-direct {v2, v8}, Lcom/nothing/nt_route/TestActivity$3;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 265
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mStopWakeUpBtn:Landroid/widget/Button;

    invoke-virtual {v12, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 268
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 269
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 270
    const-string v1, "30m"

    const-wide/32 v2, 0x1b7740

    invoke-direct {v8, v0, v1, v2, v3}, Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V

    .line 271
    const-string v1, "1h"

    const-wide/32 v2, 0x36ee80

    invoke-direct {v8, v0, v1, v2, v3}, Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V

    .line 272
    const-string v1, "2h"

    const-wide/32 v2, 0x6ddd00

    invoke-direct {v8, v0, v1, v2, v3}, Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V

    .line 273
    const-string v1, "3h"

    const-wide/32 v2, 0xa4cb80

    invoke-direct {v8, v0, v1, v2, v3}, Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V

    .line 274
    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 277
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 278
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 279
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 280
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 284
    const/high16 v2, 0x40c00000    # 6.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 285
    const-string v2, "4h"

    const-wide/32 v3, 0xdbba00

    invoke-direct {v8, v0, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V

    .line 286
    const-string v2, "6h"

    const-wide/32 v3, 0x1499700

    invoke-direct {v8, v0, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V

    .line 287
    const-string v2, "8h"

    const-wide/32 v3, 0x1b77400

    invoke-direct {v8, v0, v2, v3, v4}, Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V

    .line 288
    invoke-virtual {v12, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 292
    const/4 v0, 0x0

    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 293
    const/16 v0, 0x10

    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 294
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {v15, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 298
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v15, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 300
    const-string v0, "Custom min"

    invoke-direct {v8, v0}, Lcom/nothing/nt_route/TestActivity;->createCompactInput(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v0

    iput-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mCustomMinutesInput:Landroid/widget/EditText;

    .line 301
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, -0x2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 302
    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 303
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mCustomMinutesInput:Landroid/widget/EditText;

    invoke-virtual {v14, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 305
    const/16 v6, 0x9

    const/16 v7, 0x10

    const/high16 v4, 0x41380000    # 11.5f

    const/16 v5, 0xc

    const-string v1, "Set Min"

    const-string v2, "#2C2C2E"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 306
    new-instance v1, Lcom/nothing/nt_route/TestActivity$4;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$4;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 320
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 324
    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 325
    invoke-virtual {v14, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 328
    const-string v1, "Sleep HR \u2264"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 329
    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 330
    const/high16 v1, 0x41380000    # 11.5f

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 331
    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 332
    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 334
    const-string v0, "65"

    invoke-direct {v8, v0}, Lcom/nothing/nt_route/TestActivity;->createCompactInput(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v0

    iput-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mHrThresholdInput:Landroid/widget/EditText;

    .line 335
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mHrThresholdInput:Landroid/widget/EditText;

    iget v1, v8, Lcom/nothing/nt_route/TestActivity;->mSleepHrThresholdBpm:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 336
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 337
    const/high16 v1, 0x42580000    # 54.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 340
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mHrThresholdInput:Landroid/widget/EditText;

    invoke-virtual {v14, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 342
    invoke-virtual {v12, v14, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 345
    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 346
    const/4 v0, 0x0

    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 347
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {v15, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 351
    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v15, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 353
    const/16 v6, 0xb

    const/16 v7, 0x14

    const/high16 v4, 0x41500000    # 13.0f

    const-string v1, "\u25b6 Start Now"

    const-string v2, "#D71921"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 354
    new-instance v1, Lcom/nothing/nt_route/TestActivity$5;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$5;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 362
    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-direct {v8, v2, v1}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v14, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 364
    const-string v1, "\u25c9 Auto-Sleep (Watch)"

    const-string v2, "#2C2C2E"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 365
    new-instance v1, Lcom/nothing/nt_route/TestActivity$6;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$6;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 383
    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-direct {v8, v1, v2}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v14, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 385
    invoke-virtual {v12, v14, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 388
    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 389
    const/4 v0, 0x0

    invoke-virtual {v14, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 390
    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {v15, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 394
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v15, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 396
    const/16 v6, 0x9

    const/16 v7, 0x10

    const/high16 v4, 0x41400000    # 12.0f

    const/16 v5, 0xa

    const-string v1, "Pause"

    const-string v2, "#2C2C2E"

    const-string v3, "#E5E5EA"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 397
    new-instance v1, Lcom/nothing/nt_route/TestActivity$7;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$7;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 404
    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v8, v2, v1}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v14, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 406
    const-string v1, "Resume"

    const-string v2, "#2C2C2E"

    const-string v3, "#E5E5EA"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 407
    new-instance v1, Lcom/nothing/nt_route/TestActivity$8;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$8;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 414
    const/4 v1, 0x3

    invoke-direct {v8, v1, v1}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v14, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 416
    const-string v1, "Reset / Stop"

    const-string v2, "#3A181B"

    const-string v3, "#FF6B6B"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 417
    new-instance v1, Lcom/nothing/nt_route/TestActivity$9;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$9;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 424
    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v8, v1, v2}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v14, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 426
    invoke-virtual {v12, v14, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 431
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 432
    const/4 v0, 0x0

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 433
    const/16 v0, 0x10

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 434
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {v14, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 438
    const/high16 v0, 0x41a00000    # 20.0f

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v14, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 439
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v8, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v14, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 441
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 442
    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 444
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 445
    const-string v2, "Health Monitor"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 446
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 447
    sget-object v2, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 448
    const/high16 v2, 0x41a00000    # 20.0f

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 449
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 451
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    .line 452
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    const-string v2, "Real-time auto-sync every 3s"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 453
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 454
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    const/high16 v2, 0x41300000    # 11.0f

    invoke-virtual {v1, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 455
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 457
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, -0x2

    const/4 v4, 0x0

    invoke-direct {v1, v4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 459
    const/4 v6, 0x7

    const/16 v7, 0x12

    const/high16 v4, 0x41400000    # 12.0f

    const/16 v5, 0xe

    const-string v1, "\u21bb Sync Now"

    const-string v2, "#1C1C1E"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 460
    new-instance v1, Lcom/nothing/nt_route/TestActivity$10;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$10;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 473
    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 474
    invoke-virtual {v11, v12, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 477
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 478
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 479
    const-string v1, "Heart rate"

    const-string v2, "#FF453A"

    const-string v3, "\u2665"

    invoke-direct {v8, v3, v1, v2}, Lcom/nothing/nt_route/TestActivity;->createMetricTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/nothing/nt_route/TestActivity$MetricTile;

    move-result-object v1

    iput-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mTileHr:Lcom/nothing/nt_route/TestActivity$MetricTile;

    .line 480
    const-string v1, "Blood oxygen"

    const-string v2, "#0A84FF"

    const-string v3, "O\u2082"

    invoke-direct {v8, v3, v1, v2}, Lcom/nothing/nt_route/TestActivity;->createMetricTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/nothing/nt_route/TestActivity$MetricTile;

    move-result-object v1

    iput-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mTileSpo2:Lcom/nothing/nt_route/TestActivity$MetricTile;

    .line 481
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mTileHr:Lcom/nothing/nt_route/TestActivity$MetricTile;

    iget-object v1, v1, Lcom/nothing/nt_route/TestActivity$MetricTile;->container:Landroid/widget/LinearLayout;

    const/4 v2, 0x5

    const/4 v3, 0x0

    invoke-direct {v8, v3, v2}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 482
    iget-object v1, v8, Lcom/nothing/nt_route/TestActivity;->mTileSpo2:Lcom/nothing/nt_route/TestActivity$MetricTile;

    iget-object v1, v1, Lcom/nothing/nt_route/TestActivity$MetricTile;->container:Landroid/widget/LinearLayout;

    const/4 v2, 0x5

    invoke-direct {v8, v2, v3}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 483
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 486
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 487
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 488
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 492
    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 493
    const-string v2, "Steps"

    const-string v3, "#FF9F0A"

    const-string v4, "\ud83d\udc63"

    invoke-direct {v8, v4, v2, v3}, Lcom/nothing/nt_route/TestActivity;->createMetricTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/nothing/nt_route/TestActivity$MetricTile;

    move-result-object v2

    iput-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileSteps:Lcom/nothing/nt_route/TestActivity$MetricTile;

    .line 494
    const-string v2, "Sleep"

    const-string v3, "#BF5AF2"

    const-string v4, "\u263e"

    invoke-direct {v8, v4, v2, v3}, Lcom/nothing/nt_route/TestActivity;->createMetricTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/nothing/nt_route/TestActivity$MetricTile;

    move-result-object v2

    iput-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileSleep:Lcom/nothing/nt_route/TestActivity$MetricTile;

    .line 495
    iget-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileSteps:Lcom/nothing/nt_route/TestActivity$MetricTile;

    iget-object v2, v2, Lcom/nothing/nt_route/TestActivity$MetricTile;->container:Landroid/widget/LinearLayout;

    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-direct {v8, v4, v3}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 496
    iget-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileSleep:Lcom/nothing/nt_route/TestActivity$MetricTile;

    iget-object v2, v2, Lcom/nothing/nt_route/TestActivity$MetricTile;->container:Landroid/widget/LinearLayout;

    const/4 v3, 0x5

    invoke-direct {v8, v3, v4}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 497
    invoke-virtual {v11, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 500
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 501
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 502
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 506
    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 507
    const-string v2, "Stress"

    const-string v3, "#30D158"

    const-string v4, "\u26a1"

    invoke-direct {v8, v4, v2, v3}, Lcom/nothing/nt_route/TestActivity;->createMetricTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/nothing/nt_route/TestActivity$MetricTile;

    move-result-object v2

    iput-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileStress:Lcom/nothing/nt_route/TestActivity$MetricTile;

    .line 508
    const-string v2, "Workouts"

    const-string v3, "#64D2FF"

    const-string v4, "\ud83c\udfc3"

    invoke-direct {v8, v4, v2, v3}, Lcom/nothing/nt_route/TestActivity;->createMetricTile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/nothing/nt_route/TestActivity$MetricTile;

    move-result-object v2

    iput-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileSport:Lcom/nothing/nt_route/TestActivity$MetricTile;

    .line 509
    iget-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileStress:Lcom/nothing/nt_route/TestActivity$MetricTile;

    iget-object v2, v2, Lcom/nothing/nt_route/TestActivity$MetricTile;->container:Landroid/widget/LinearLayout;

    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-direct {v8, v4, v3}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 510
    iget-object v2, v8, Lcom/nothing/nt_route/TestActivity;->mTileSport:Lcom/nothing/nt_route/TestActivity$MetricTile;

    iget-object v2, v2, Lcom/nothing/nt_route/TestActivity$MetricTile;->container:Landroid/widget/LinearLayout;

    const/4 v3, 0x5

    invoke-direct {v8, v3, v4}, Lcom/nothing/nt_route/TestActivity;->weightedParams(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 511
    invoke-virtual {v11, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 516
    invoke-direct/range {p0 .. p0}, Lcom/nothing/nt_route/TestActivity;->createNothingCard()Landroid/widget/LinearLayout;

    move-result-object v9

    .line 517
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 521
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 522
    invoke-virtual {v11, v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 524
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 525
    const/4 v0, 0x0

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 526
    const/16 v0, 0x10

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 528
    const/16 v6, 0xa

    const/16 v7, 0x14

    const/high16 v4, 0x41480000    # 12.5f

    const-string v1, "\ud83d\udd14 Test 6x Watch Wake-Up"

    const-string v2, "#D71921"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 529
    new-instance v1, Lcom/nothing/nt_route/TestActivity$11;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$11;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 543
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, -0x2

    const/4 v4, 0x0

    invoke-direct {v1, v4, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 545
    const/high16 v4, 0x41400000    # 12.0f

    const/16 v5, 0xc

    const-string v1, "\u23f9 Silence"

    const-string v2, "#2C2C2E"

    const-string v3, "#FFFFFF"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 546
    new-instance v1, Lcom/nothing/nt_route/TestActivity$12;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$12;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 554
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 558
    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 559
    invoke-virtual {v11, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 561
    const-string v1, "\u2699"

    const-string v2, "#2C2C2E"

    const-string v3, "#C8C8D2"

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/nothing/nt_route/TestActivity;->createNothingButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FIII)Landroid/widget/Button;

    move-result-object v0

    .line 562
    new-instance v1, Lcom/nothing/nt_route/TestActivity$13;

    invoke-direct {v1, v8}, Lcom/nothing/nt_route/TestActivity$13;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 570
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 574
    const/high16 v2, 0x40c00000    # 6.0f

    invoke-static {v8, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 575
    invoke-virtual {v11, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 577
    invoke-virtual {v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 579
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    .line 580
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    const-string v1, "#30D158"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 581
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    const/high16 v1, 0x41380000    # 11.5f

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 582
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v8, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 583
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 584
    iget-object v0, v8, Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 586
    invoke-virtual {v8, v10}, Lcom/nothing/nt_route/TestActivity;->setContentView(Landroid/view/View;)V

    .line 588
    invoke-direct/range {p0 .. p0}, Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V

    .line 589
    invoke-direct/range {p0 .. p0}, Lcom/nothing/nt_route/TestActivity;->refreshHealthCards()V

    .line 590
    return-void
.end method

.method protected onPause()V
    .registers 3

    .line 609
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 610
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mUiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTickRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 611
    return-void
.end method

.method protected onResume()V
    .registers 3

    .line 594
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 595
    new-instance v0, Lcom/nothing/nt_route/TestActivity$14;

    invoke-direct {v0, p0}, Lcom/nothing/nt_route/TestActivity$14;-><init>(Lcom/nothing/nt_route/TestActivity;)V

    invoke-static {p0, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->requestFlutterHealthSync(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 603
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mUiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTickRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 604
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity;->mUiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity;->mTickRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 605
    return-void
.end method
