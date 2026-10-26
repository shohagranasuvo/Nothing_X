.class Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;
.super Ljava/lang/Object;
.source "NothingXEnhancer.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


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

.field final synthetic val$badgeTv:Landroid/widget/TextView;

.field final synthetic val$btnAction1:Landroid/widget/Button;

.field final synthetic val$btnAction2:Landroid/widget/Button;

.field final synthetic val$btnAction3:Landroid/widget/Button;

.field final synthetic val$card:Landroid/widget/LinearLayout;

.field final synthetic val$countTv:Landroid/widget/TextView;

.field final synthetic val$metricsTickerTv:Landroid/widget/TextView;

.field final synthetic val$originalCallback:Landroid/view/Window$Callback;

.field final synthetic val$subTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;Landroid/view/Window$Callback;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 339
    iput-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$card:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$subTv:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$badgeTv:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$countTv:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$metricsTickerTv:Landroid/widget/TextView;

    iput-object p7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$btnAction1:Landroid/widget/Button;

    iput-object p8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$btnAction2:Landroid/widget/Button;

    iput-object p9, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$btnAction3:Landroid/widget/Button;

    iput-object p10, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$originalCallback:Landroid/view/Window$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 342
    const-string p1, "dispatchTouchEvent"

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_b5

    if-eqz p3, :cond_b5

    array-length p1, p3

    const/4 v1, 0x1

    if-ne p1, v1, :cond_b5

    .line 343
    aget-object p1, p3, v0

    check-cast p1, Landroid/view/MotionEvent;

    .line 344
    if-eqz p1, :cond_b5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-ne v2, v1, :cond_b5

    .line 345
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    .line 346
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    .line 348
    iget-object v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    const/high16 v4, 0x42340000    # 45.0f

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v3

    int-to-float v3, v3

    cmpl-float v3, p1, v3

    if-ltz v3, :cond_b5

    iget-object v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    const/high16 v4, 0x43020000    # 130.0f

    invoke-static {v3, v4}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result v3

    int-to-float v3, v3

    cmpg-float p1, p1, v3

    if-gtz p1, :cond_b5

    .line 349
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    const/high16 v3, 0x430c0000    # 140.0f

    invoke-static {p1, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    const-string v4, "is_health_tab_active"

    cmpg-float p1, v2, p1

    if-gez p1, :cond_6b

    .line 351
    sput-boolean v0, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    .line 352
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$card:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 353
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, v4, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_b5

    .line 354
    :cond_6b
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    invoke-static {p1, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    cmpl-float p1, v2, p1

    if-ltz p1, :cond_b5

    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    const/high16 v3, 0x43820000    # 260.0f

    invoke-static {p1, v3}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    cmpg-float p1, v2, p1

    if-gtz p1, :cond_b5

    .line 356
    sput-boolean v1, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->sIsHealthTabActive:Z

    .line 357
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$card:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 358
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$card:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->bringToFront()V

    .line 359
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, v4, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 360
    iget-object v1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$card:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$subTv:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$badgeTv:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$countTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$metricsTickerTv:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$btnAction1:Landroid/widget/Button;

    iget-object v8, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$btnAction2:Landroid/widget/Button;

    iget-object v9, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$btnAction3:Landroid/widget/Button;

    # invokes: Lcom/nothing/smartcenter/patch/NothingXEnhancer;->updateCardContent(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V
    invoke-static/range {v1 .. v9}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->access$000(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 365
    :cond_b5
    :goto_b5
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$originalCallback:Landroid/view/Window$Callback;

    if-eqz p1, :cond_c0

    .line 366
    iget-object p1, p0, Lcom/nothing/smartcenter/patch/NothingXEnhancer$5;->val$originalCallback:Landroid/view/Window$Callback;

    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 368
    :cond_c0
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object p1

    sget-object p2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d1

    .line 369
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 371
    :cond_d1
    const/4 p1, 0x0

    return-object p1
.end method
