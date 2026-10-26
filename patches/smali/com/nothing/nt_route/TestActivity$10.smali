.class Lcom/nothing/nt_route/TestActivity$10;
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

    .line 460
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$10;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 463
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$10;->this$0:Lcom/nothing/nt_route/TestActivity;

    # getter for: Lcom/nothing/nt_route/TestActivity;->mLiveSyncSubView:Landroid/widget/TextView;
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$800(Lcom/nothing/nt_route/TestActivity;)Landroid/widget/TextView;

    move-result-object p1

    const-string v0, "Syncing with Watch Pro 2..."

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 464
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$10;->this$0:Lcom/nothing/nt_route/TestActivity;

    new-instance v0, Lcom/nothing/nt_route/TestActivity$10$1;

    invoke-direct {v0, p0}, Lcom/nothing/nt_route/TestActivity$10$1;-><init>(Lcom/nothing/nt_route/TestActivity$10;)V

    invoke-static {p1, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->requestFlutterHealthSync(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 470
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$10;->this$0:Lcom/nothing/nt_route/TestActivity;

    # invokes: Lcom/nothing/nt_route/TestActivity;->refreshHealthCards()V
    invoke-static {p1}, Lcom/nothing/nt_route/TestActivity;->access$200(Lcom/nothing/nt_route/TestActivity;)V

    .line 471
    return-void
.end method
