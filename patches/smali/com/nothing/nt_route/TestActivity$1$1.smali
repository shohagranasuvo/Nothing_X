.class Lcom/nothing/nt_route/TestActivity$1$1;
.super Ljava/lang/Object;
.source "TestActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/nt_route/TestActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nothing/nt_route/TestActivity$1;


# direct methods
.method constructor <init>(Lcom/nothing/nt_route/TestActivity$1;)V
    .registers 2

    .line 104
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$1$1;->this$1:Lcom/nothing/nt_route/TestActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 107
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1$1;->this$1:Lcom/nothing/nt_route/TestActivity$1;

    iget-object v0, v0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-virtual {v0}, Lcom/nothing/nt_route/TestActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1b

    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1$1;->this$1:Lcom/nothing/nt_route/TestActivity$1;

    iget-object v0, v0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-virtual {v0}, Lcom/nothing/nt_route/TestActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 108
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$1$1;->this$1:Lcom/nothing/nt_route/TestActivity$1;

    iget-object v0, v0, Lcom/nothing/nt_route/TestActivity$1;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshHealthCards()V
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$200(Lcom/nothing/nt_route/TestActivity;)V

    .line 110
    :cond_1b
    return-void
.end method
