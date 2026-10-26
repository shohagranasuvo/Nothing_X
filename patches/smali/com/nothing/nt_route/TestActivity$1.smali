.class Lcom/nothing/nt_route/TestActivity$1;
.super Ljava/lang/Object;
.source "TestActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nothing/nt_route/TestActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nothing/nt_route/TestActivity;


# direct methods
.method constructor <init>(Lcom/nothing/nt_route/TestActivity;)V
    .registers 2

    .line 92
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 95
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-virtual {v0}, Lcom/nothing/nt_route/TestActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4f

    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-virtual {v0}, Lcom/nothing/nt_route/TestActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_4f

    .line 96
    :cond_11
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-static {v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->checkAndCompleteIfExpired(Landroid/content/Context;)V

    .line 97
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V

    .line 99
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mTickCounter:I
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$100(Lcom/nothing/nt_route/TestActivity;)I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_2a

    .line 100
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshHealthCards()V
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$200(Lcom/nothing/nt_route/TestActivity;)V

    .line 103
    :cond_2a
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mTickCounter:I
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$100(Lcom/nothing/nt_route/TestActivity;)I

    move-result v0

    rem-int/lit8 v0, v0, 0x6

    if-nez v0, :cond_3e

    .line 104
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    new-instance v1, Lcom/nothing/nt_route/TestActivity$1$1;

    invoke-direct {v1, p0}, Lcom/nothing/nt_route/TestActivity$1$1;-><init>(Lcom/nothing/nt_route/TestActivity$1;)V

    invoke-static {v0, v1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->requestFlutterHealthSync(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 113
    :cond_3e
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    # operator++ for: Lcom/nothing/nt_route/TestActivity;->mTickCounter:I
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$108(Lcom/nothing/nt_route/TestActivity;)I

    .line 114
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mUiHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$300(Lcom/nothing/nt_route/TestActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 115
    return-void

    .line 95
    :cond_4f
    :goto_4f
    return-void
.end method
