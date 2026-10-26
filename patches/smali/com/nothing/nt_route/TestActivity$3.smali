.class Lcom/nothing/nt_route/TestActivity$3;
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

    .line 257
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$3;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 260
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$3;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->stopWakeUpAlarmBurst(Landroid/content/Context;)V

    .line 261
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$3;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshTimerUi()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$000(Lcom/nothing/nt_route/TestActivity;)V

    .line 262
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$3;->this$0:Lcom/nothing/nt_route/TestActivity;

    const-string v0, "Wake-up alarm stopped"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 263
    return-void
.end method
