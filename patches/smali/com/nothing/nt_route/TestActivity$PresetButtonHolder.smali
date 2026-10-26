.class final Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;
.super Ljava/lang/Object;
.source "TestActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nothing/nt_route/TestActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PresetButtonHolder"
.end annotation


# instance fields
.field final button:Landroid/widget/Button;

.field final durationMs:J


# direct methods
.method constructor <init>(Landroid/widget/Button;J)V
    .registers 4

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;->button:Landroid/widget/Button;

    .line 69
    iput-wide p2, p0, Lcom/nothing/nt_route/TestActivity$PresetButtonHolder;->durationMs:J

    .line 70
    return-void
.end method
