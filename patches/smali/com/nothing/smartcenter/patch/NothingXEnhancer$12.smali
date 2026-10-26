.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$12;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getCleanDashboardData(Landroid/content/Context;)Ljava/util/Map;
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

    .line 2148
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$12;->val$appCtx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 2152
    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$12;->val$appCtx:Landroid/content/Context;

    # invokes: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->computeDashboardDataInternal(Landroid/content/Context;)Ljava/util/Map;
    invoke-static {v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$900(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    # setter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sCachedDashboardMap:Ljava/util/Map;
    invoke-static {v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$802(Ljava/util/Map;)Ljava/util/Map;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_b

    goto :goto_c

    .line 2153
    :catchall_b
    move-exception v1

    .line 2155
    :goto_c
    # setter for: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sDbRefreshInFlight:Z
    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$1002(Z)Z

    .line 2156
    nop

    .line 2157
    return-void
.end method
