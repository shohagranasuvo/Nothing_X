.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;

.field final synthetic val$notifId:I

.field final synthetic val$waveMsg:Ljava/lang/String;

.field final synthetic val$waveTitle:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;ILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1425
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->this$0:Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;

    iput p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->val$notifId:I

    iput-object p3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->val$waveTitle:Ljava/lang/String;

    iput-object p4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->val$waveMsg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 1428
    # getter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sWakeUpBurstActive:Z
    invoke-static {}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$200()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 1429
    :cond_7
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->this$0:Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;

    iget-object v0, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$appCtx:Landroid/content/Context;

    iget v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->val$notifId:I

    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->val$waveTitle:Ljava/lang/String;

    iget-object v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->val$waveMsg:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->postPhoneAndWatchNotification(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 1430
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$1;->this$0:Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;

    iget-object v0, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$appCtx:Landroid/content/Context;

    # invokes: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->vibratePhoneStrong(Landroid/content/Context;)V
    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$500(Landroid/content/Context;)V

    .line 1431
    return-void
.end method
