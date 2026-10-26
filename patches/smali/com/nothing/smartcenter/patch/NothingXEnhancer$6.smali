.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$decor:Landroid/view/View;

.field final synthetic val$metricsTickerTv:Landroid/widget/TextView;

.field final synthetic val$subTv:Landroid/widget/TextView;

.field final synthetic val$tickerHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;Landroid/os/Handler;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 383
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$decor:Landroid/view/View;

    iput-object p3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$card:Landroid/widget/LinearLayout;

    iput-object p4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$subTv:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$badgeTv:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$countTv:Landroid/widget/TextView;

    iput-object p7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$metricsTickerTv:Landroid/widget/TextView;

    iput-object p8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$btnAction1:Landroid/widget/Button;

    iput-object p9, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$btnAction2:Landroid/widget/Button;

    iput-object p10, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$btnAction3:Landroid/widget/Button;

    iput-object p11, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$tickerHandler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .line 386
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_51

    .line 388
    :cond_11
    :try_start_11
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$decor:Landroid/view/View;

    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->scrapeMetricsFromDecorView(Landroid/view/View;)V

    .line 389
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$card:Landroid/widget/LinearLayout;

    sget-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    if-eqz v1, :cond_1e

    const/4 v1, 0x0

    goto :goto_20

    :cond_1e
    const/16 v1, 0x8

    :goto_20
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 390
    sget-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    if-eqz v0, :cond_41

    .line 391
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$card:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 392
    iget-object v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$card:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$subTv:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$badgeTv:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$countTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$metricsTickerTv:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$btnAction1:Landroid/widget/Button;

    iget-object v8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$btnAction2:Landroid/widget/Button;

    iget-object v9, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$btnAction3:Landroid/widget/Button;

    # invokes: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->updateCardContent(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    invoke-static/range {v1 .. v9}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$000(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 394
    :cond_41
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->checkAndCompleteIfExpired(Landroid/content/Context;)V
    :try_end_46
    .catchall {:try_start_11 .. :try_end_46} :catchall_47

    goto :goto_48

    .line 395
    :catchall_47
    move-exception v0

    :goto_48
    nop

    .line 396
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$6;->val$tickerHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x320

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 397
    return-void

    .line 386
    :cond_51
    :goto_51
    return-void
.end method
