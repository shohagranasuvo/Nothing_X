.class Lcom/nothing/nt_route/TestActivity$15;
.super Ljava/lang/Object;
.source "TestActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/nt_route/TestActivity;->addPresetChip(Landroid/widget/LinearLayout;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nothing/nt_route/TestActivity;

.field final synthetic val$durationMs:J


# direct methods
.method constructor <init>(Lcom/nothing/nt_route/TestActivity;J)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 728
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$15;->this$0:Lcom/nothing/nt_route/TestActivity;

    iput-wide p2, p0, Lcom/nothing/nt_route/TestActivity$15;->val$durationMs:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 731
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$15;->this$0:Lcom/nothing/nt_route/TestActivity;

    iget-wide v0, p0, Lcom/nothing/nt_route/TestActivity$15;->val$durationMs:J

    # setter for: Lcom/nothing/nt_route/TestActivity;->mSelectedDurationMs:J
    invoke-static {p1, v0, v1}, Lcom/nothing/nt_route/TestActivity;->access$502(Lcom/nothing/nt_route/TestActivity;J)J

    .line 732
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$15;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V

    .line 733
    return-void
.end method
