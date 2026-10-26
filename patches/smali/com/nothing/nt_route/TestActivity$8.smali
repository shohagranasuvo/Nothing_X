.class Lcom/nothing/nt_route/TestActivity$8;
.super Ljava/lang/Object;
.source "TestActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/nt_route/TestActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 407
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$8;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 410
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$8;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->resumeTimer(Landroid/content/Context;)V

    .line 411
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$8;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V

    .line 412
    return-void
.end method
