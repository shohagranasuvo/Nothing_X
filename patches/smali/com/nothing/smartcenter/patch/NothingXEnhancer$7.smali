.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$7;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;->checkAndCompleteIfExpired(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$appCtx:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1237
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$7;->val$appCtx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1241
    :try_start_0
    iget-object v0, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$7;->val$appCtx:Landroid/content/Context;

    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->checkWatchSleepAndAutoStart(Landroid/content/Context;)V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_6

    goto :goto_7

    .line 1242
    :catchall_6
    move-exception v0

    :goto_7
    nop

    .line 1243
    return-void
.end method
