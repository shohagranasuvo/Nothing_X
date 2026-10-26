.class Lcom/nothing/nt_route/TestActivity$2;
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

    .line 154
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$2;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 157
    iget-object p1, p0, Lcom/nothing/nt_route/TestActivity$2;->this$0:Lcom/nothing/nt_route/TestActivity;

    invoke-virtual {p1}, Lcom/nothing/nt_route/TestActivity;->finish()V

    .line 158
    return-void
.end method
