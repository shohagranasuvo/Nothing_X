.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;
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

    .line 288
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$card:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$subTv:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$badgeTv:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$countTv:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$metricsTickerTv:Landroid/widget/TextView;

    iput-object p7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$btnAction1:Landroid/widget/Button;

    iput-object p8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$btnAction2:Landroid/widget/Button;

    iput-object p9, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$btnAction3:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 11

    .line 291
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 292
    const-string v0, "state"

    const-string v1, "IDLE"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 293
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->isWakeUpBurstActive()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 294
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    goto :goto_4f

    .line 295
    :cond_1a
    const-string v1, "RUNNING"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    const-string v1, "ARMED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4a

    const-string v1, "PAUSED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    goto :goto_4a

    .line 298
    :cond_33
    const-string v0, "duration_ms"

    const-wide/32 v1, 0x6ddd00

    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 299
    const-string v2, "armed_hr_threshold"

    const/16 v3, 0x41

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 300
    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$activity:Landroid/app/Activity;

    invoke-static {v2, v0, v1, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->armTimerForWatchSleep(Landroid/content/Context;JI)V

    goto :goto_4f

    .line 296
    :cond_4a
    :goto_4a
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->cancelTimer(Landroid/content/Context;)V

    .line 302
    :goto_4f
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$card:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$subTv:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$badgeTv:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$countTv:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$metricsTickerTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$btnAction1:Landroid/widget/Button;

    iget-object v7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$btnAction2:Landroid/widget/Button;

    iget-object v8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$2;->val$btnAction3:Landroid/widget/Button;

    # invokes: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->updateCardContent(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    invoke-static/range {v0 .. v8}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$000(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 303
    return-void
.end method
