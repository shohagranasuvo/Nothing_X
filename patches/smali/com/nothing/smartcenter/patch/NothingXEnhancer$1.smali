.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;->attachToMainActivity(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$badgeTv:Landroid/widget/TextView;

.field final synthetic val$btnAction1:Landroid/widget/Button;

.field final synthetic val$btnAction2:Landroid/widget/Button;

.field final synthetic val$btnAction3:Landroid/widget/Button;

.field final synthetic val$card:Landroid/widget/LinearLayout;

.field final synthetic val$countTv:Landroid/widget/TextView;

.field final synthetic val$metricsTickerTv:Landroid/widget/TextView;

.field final synthetic val$subTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 269
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$card:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$subTv:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$badgeTv:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$countTv:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$metricsTickerTv:Landroid/widget/TextView;

    iput-object p7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$btnAction1:Landroid/widget/Button;

    iput-object p8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$btnAction2:Landroid/widget/Button;

    iput-object p9, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$btnAction3:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 13

    .line 272
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 273
    const-string v0, "state"

    const-string v1, "IDLE"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 274
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->isWakeUpBurstActive()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 275
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    goto :goto_44

    .line 276
    :cond_1a
    const-string v1, "RUNNING"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 277
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->pauseTimer(Landroid/content/Context;)V

    goto :goto_44

    .line 278
    :cond_28
    const-string v1, "PAUSED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 279
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->resumeTimer(Landroid/content/Context;)V

    goto :goto_44

    .line 281
    :cond_36
    const-string v0, "duration_ms"

    const-wide/32 v1, 0x6ddd00

    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 282
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$activity:Landroid/app/Activity;

    invoke-static {p1, v0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startTimer(Landroid/content/Context;J)V

    .line 284
    :goto_44
    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$card:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$subTv:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$badgeTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$countTv:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$metricsTickerTv:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$btnAction1:Landroid/widget/Button;

    iget-object v9, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$btnAction2:Landroid/widget/Button;

    iget-object v10, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;->val$btnAction3:Landroid/widget/Button;

    # invokes: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->updateCardContent(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    invoke-static/range {v2 .. v10}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$000(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 285
    return-void
.end method
