.class final Lcom/nothing/nt_route/TestActivity$MetricTile;
.super Ljava/lang/Object;
.source "TestActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nothing/nt_route/TestActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MetricTile"
.end annotation


# instance fields
.field final badgeView:Landroid/widget/TextView;

.field final container:Landroid/widget/LinearLayout;

.field final iconView:Landroid/widget/TextView;

.field final subView:Landroid/widget/TextView;

.field final titleView:Landroid/widget/TextView;

.field final valueView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 7

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lcom/nothing/nt_route/TestActivity$MetricTile;->container:Landroid/widget/LinearLayout;

    .line 83
    iput-object p2, p0, Lcom/nothing/nt_route/TestActivity$MetricTile;->iconView:Landroid/widget/TextView;

    .line 84
    iput-object p3, p0, Lcom/nothing/nt_route/TestActivity$MetricTile;->titleView:Landroid/widget/TextView;

    .line 85
    iput-object p4, p0, Lcom/nothing/nt_route/TestActivity$MetricTile;->badgeView:Landroid/widget/TextView;

    .line 86
    iput-object p5, p0, Lcom/nothing/nt_route/TestActivity$MetricTile;->valueView:Landroid/widget/TextView;

    .line 87
    iput-object p6, p0, Lcom/nothing/nt_route/TestActivity$MetricTile;->subView:Landroid/widget/TextView;

    .line 88
    return-void
.end method
