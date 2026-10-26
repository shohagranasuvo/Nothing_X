.class final Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MetricPoint"
.end annotation


# instance fields
.field epochMs:J

.field primaryValue:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 2450
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;)V
    .registers 2

    .line 2450
    invoke-direct {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$MetricPoint;-><init>()V

    return-void
.end method
