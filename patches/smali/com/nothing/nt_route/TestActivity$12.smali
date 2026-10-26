.class Lcom/nothing/nt_route/TestActivity$12;
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

    .line 546
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$12;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 549
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$12;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    .line 550
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$12;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$900(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/TextView;

    move-result-object p1

    const-string v0, "\u2713 Wake-up alarm silenced."

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 551
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$12;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V

    .line 552
    return-void
.end method
