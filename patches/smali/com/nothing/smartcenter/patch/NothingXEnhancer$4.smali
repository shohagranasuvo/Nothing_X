.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$4;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;->attachToMainActivity(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 315
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$4;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 319
    :try_start_0
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$4;->val$activity:Landroid/app/Activity;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$4;->val$activity:Landroid/app/Activity;

    const-class v2, Lcom/nothing/nt_route/TestActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catchall {:try_start_0 .. :try_end_e} :catchall_f

    goto :goto_10

    .line 320
    :catchall_f
    move-exception p1

    :goto_10
    nop

    .line 321
    return-void
.end method
