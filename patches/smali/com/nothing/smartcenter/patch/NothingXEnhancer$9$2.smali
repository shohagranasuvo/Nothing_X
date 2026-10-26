.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$2;
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


# direct methods
.method constructor <init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;)V
    .registers 2

    .line 1435
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$2;->this$0:Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1438
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9$2;->this$0:Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;

    iget-object v0, v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$9;->val$appCtx:Landroid/content/Context;

    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    .line 1439
    return-void
.end method
