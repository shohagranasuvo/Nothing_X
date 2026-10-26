.class Lcom/nothing/nt_route/TestActivity$6;
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

    .line 365
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 368
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    .line 369
    nop

    .line 371
    const/16 p1, 0x41

    :try_start_8
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mHrThresholdInput:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$600(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 372
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_25

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_24
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_24} :catch_28

    goto :goto_27

    :cond_25
    const/16 v0, 0x41

    .line 373
    :goto_27
    goto :goto_2b

    :catch_28
    move-exception v0

    const/16 v0, 0x41

    .line 374
    :goto_2b
    const/16 v1, 0x28

    if-lt v0, v1, :cond_36

    const/16 v1, 0x6e

    if-le v0, v1, :cond_34

    goto :goto_36

    :cond_34
    move p1, v0

    goto :goto_42

    .line 375
    :cond_36
    :goto_36
    nop

    .line 376
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mHrThresholdInput:Landroid/widget/EditText;
    invoke-static {v0}, Lcom/nothing/nt_route/TestActivity;->access$600(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/EditText;

    move-result-object v0

    const-string v1, "65"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 378
    :goto_42
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    # setter for: Lcom/nothing/nt_route/TestActivity;->mSleepHrThresholdBpm:I
    invoke-static {v0, p1}, Lcom/nothing/nt_route/TestActivity;->access$702(Lcom/nothing/nt_route/TestActivity;I)I

    .line 379
    iget-object v0, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    iget-object v1, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J
    invoke-static {v1}, Lcom/nothing/nt_route/TestActivity;->access$500(Lcom/nothing/nt_route/TestActivity;)J

    move-result-wide v1

    invoke-static {v0, v1, v2, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->armTimerForWatchSleep(Landroid/content/Context;JI)V

    .line 380
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$6;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V

    .line 381
    return-void
.end method
