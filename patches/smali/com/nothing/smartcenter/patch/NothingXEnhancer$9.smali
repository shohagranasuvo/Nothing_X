.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startWakeUpAlarmBurst(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$appCtx:Landroid/content/Context;

.field final synthetic val$baseMessage:Ljava/lang/String;

.field final synthetic val$baseTitle:Ljava/lang/String;

.field final synthetic val$waveNum:I

.field final synthetic val$waves:I


# direct methods
.method constructor <init>(ILjava/lang/String;ILjava/lang/String;Landroid/content/Context;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1414
    iput p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waveNum:I

    iput-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$baseTitle:Ljava/lang/String;

    iput p3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waves:I

    iput-object p4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$baseMessage:Ljava/lang/String;

    iput-object p5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$appCtx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1417
    # getter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$200()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 1418
    :cond_7
    iget v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waveNum:I

    # setter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstCurrentWave:I
    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$402(I)I

    .line 1420
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$baseTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waveNum:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waves:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1421
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$baseMessage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (Alert "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waveNum:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waves:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u2022 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1422
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1423
    const v2, 0x9e3e

    iget v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waveNum:I

    add-int/2addr v3, v2

    .line 1425
    new-instance v2, Ljava/lang/Thread;

    new-instance v4, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;

    invoke-direct {v4, p0, v3, v0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;-><init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;ILjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1432
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1434
    iget v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waveNum:I

    iget v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$waves:I

    if-lt v0, v1, :cond_9f

    .line 1435
    # getter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sBurstHandler:Landroid/os/Handler;
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$600()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$2;

    invoke-direct {v1, p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$2;-><init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;)V

    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1442
    :cond_9f
    return-void
.end method
