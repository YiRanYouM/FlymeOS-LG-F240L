.class Lcom/android/internal/policy/impl/LGGlobalActions$AirplanePopupAnimationView$3;
.super Ljava/lang/Object;
.source "LGGlobalActions.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/LGGlobalActions$AirplanePopupAnimationView;->setValue()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/LGGlobalActions$AirplanePopupAnimationView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/LGGlobalActions$AirplanePopupAnimationView;)V
    .locals 0

    .prologue
    .line 3457
    iput-object p1, p0, Lcom/android/internal/policy/impl/LGGlobalActions$AirplanePopupAnimationView$3;->this$1:Lcom/android/internal/policy/impl/LGGlobalActions$AirplanePopupAnimationView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 3460
    const/4 v0, 0x1

    return v0
.end method
