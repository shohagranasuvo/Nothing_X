.class final Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WatchHealthSnapshot"
.end annotation


# instance fields
.field hrRows:I

.field latestHrBpm:I

.field latestHrTimeMs:J

.field sleepRows:I

.field stepRows:I

.field watchBleConnected:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 895
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/nothing/smartcenter/patch/NothingXEnhancer$1;)V
    .registers 2

    .line 895
    invoke-direct {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer$WatchHealthSnapshot;-><init>()V

    return-void
.end method
