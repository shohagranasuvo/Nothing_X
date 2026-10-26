.class Lcom/nothing/nt_route/TestActivity$14;
.super Ljava/lang/Object;
.source "TestActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/nt_route/TestActivity;->onResume()V
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

    .line 595
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$14;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 598
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$14;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-virtual {v0}, Lcom/nothing/nt_route/TestActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$14;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-virtual {v0}, Lcom/nothing/nt_route/TestActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_15

    .line 599
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$14;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshHealthCards()V
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$200(Lcom/nothing/nt_route/TestActivity;)V

    .line 601
    :cond_15
    return-void
.end method
