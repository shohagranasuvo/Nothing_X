.class Lcom/nothing/nt_route/TestActivity$4;
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

    .line 306
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$4;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .line 309
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$4;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mCustomMinutesInput:Landroid/widget/EditText;
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$400(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 310
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_19

    return-void

    .line 312
    :cond_19
    :try_start_19
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 313
    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_3a

    const-wide/16 v2, 0x5a0

    cmp-long p1, v0, v2

    if-gtz p1, :cond_3a

    .line 314
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$4;->this$0:Lcom/nothing/nt_route/TestActivity;

    const-wide/32 v2, 0xea60

    mul-long v0, v0, v2

    # setter for: Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J
    invoke-static {p1, v0, v1}, Lcom/nothing/nt_route/TestActivity;->access$502(Lcom/nothing/nt_route/TestActivity;J)J

    .line 315
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$4;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V
    :try_end_38
    .catch Ljava/lang/NumberFormatException; {:try_start_19 .. :try_end_38} :catch_39

    goto :goto_3a

    .line 317
    :catch_39
    move-exception p1

    :cond_3a
    :goto_3a
    nop

    .line 318
    return-void
.end method
