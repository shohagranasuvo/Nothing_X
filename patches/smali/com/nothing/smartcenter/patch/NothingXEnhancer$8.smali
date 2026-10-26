.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;
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

.field final synthetic val$waves:I


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1375
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;->val$appCtx:Landroid/content/Context;

    iput p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;->val$waves:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1379
    :try_start_0
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;->val$appCtx:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 1380
    if-eqz v0, :cond_1f

    .line 1381
    const-string v1, "nothingx:wakeup_burst_wl"

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    .line 1382
    iget v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;->val$waves:I

    int-to-long v1, v1

    const-wide/16 v3, 0x1068

    mul-long v1, v1, v3

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V
    :try_end_1d
    .catchall {:try_start_0 .. :try_end_1d} :catchall_1e

    goto :goto_1f

    .line 1384
    :catchall_1e
    move-exception v0

    :cond_1f
    :goto_1f
    nop

    .line 1387
    const/4 v0, 0x4

    :try_start_21
    invoke-static {v0}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v1

    .line 1388
    if-nez v1, :cond_2c

    .line 1389
    const/4 v1, 0x2

    invoke-static {v1}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v1

    .line 1391
    :cond_2c
    if-eqz v1, :cond_62

    # getter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$200()Z

    move-result v2

    if-eqz v2, :cond_62

    .line 1392
    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$8;->val$appCtx:Landroid/content/Context;

    invoke-static {v2, v1}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v1

    .line 1393
    if-eqz v1, :cond_62

    # getter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$200()Z

    move-result v2

    if-eqz v2, :cond_62

    .line 1394
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_5c

    .line 1395
    new-instance v2, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 1396
    invoke-virtual {v2, v0}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v2

    .line 1397
    invoke-virtual {v2, v0}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    .line 1398
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    .line 1395
    invoke-virtual {v1, v0}, Landroid/media/Ringtone;->setAudioAttributes(Landroid/media/AudioAttributes;)V

    .line 1400
    :cond_5c
    invoke-virtual {v1}, Landroid/media/Ringtone;->play()V

    .line 1401
    # setter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sActiveAlarmRingtone:Landroid/media/Ringtone;
    invoke-static {v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$302(Landroid/media/Ringtone;)Landroid/media/Ringtone;
    :try_end_62
    .catchall {:try_start_21 .. :try_end_62} :catchall_63

    .line 1406
    :cond_62
    goto :goto_80

    .line 1404
    :catchall_63
    move-exception v0

    .line 1405
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ringtone play note: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NothingXEnhancer"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1407
    :goto_80
    return-void
.end method
