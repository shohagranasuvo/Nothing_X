.class Lcom/nothing/nt_route/TestActivity$11;
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

    .line 529
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$11;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 532
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$11;->this$0:Lcom/nothing/nt_route/TestActivity;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Watch Pro 2 Wake-Up Alarm ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 535
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->formatClockShort(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 532
    const-string v1, "\u23f0 WAKE UP \u2022 Nothing X"

    const/4 v2, 0x6

    invoke-static {p1, v1, v0, v2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->startWakeUpAlarmBurst(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 538
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$11;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$900(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/TextView;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 539
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$11;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mAlertStatusView:Landroid/widget/TextView;
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$900(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/TextView;

    move-result-object p1

    const-string v0, "\u25cf Sending 6 wake-up vibration waves to Watch Pro 2 + Phone Alarm..."

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 540
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$11;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V

    .line 541
    return-void
.end method
