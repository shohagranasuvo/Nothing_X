.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nothing/smartcenter/patch/NothingXEnhancer;->requestFlutterHealthSync(Landroid/content/Context;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$onUpdated:Ljava/lang/Runnable;

.field final synthetic val$typeName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1714
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;->val$typeName:Ljava/lang/String;

    iput-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;->val$onUpdated:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 1717
    if-eqz p3, :cond_24

    array-length p1, p3

    const/4 p2, 0x1

    if-ne p1, p2, :cond_24

    const/4 p1, 0x0

    aget-object p2, p3, p1

    if-eqz p2, :cond_24

    .line 1718
    iget-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;->val$typeName:Ljava/lang/String;

    aget-object p1, p3, p1

    # invokes: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->parseFlutterSyncResult(Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {p2, p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$700(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1719
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;->val$onUpdated:Ljava/lang/Runnable;

    if-eqz p1, :cond_24

    .line 1720
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iget-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$11;->val$onUpdated:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1723
    :cond_24
    const/4 p1, 0x0

    return-object p1
.end method
