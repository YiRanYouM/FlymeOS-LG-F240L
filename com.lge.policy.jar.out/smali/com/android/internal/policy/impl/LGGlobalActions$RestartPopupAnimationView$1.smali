.class Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView$1;
.super Ljava/lang/Object;
.source "LGGlobalActions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView;-><init>(Lcom/android/internal/policy/impl/LGGlobalActions;Landroid/content/Context;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView;

.field final synthetic val$this$0:Lcom/android/internal/policy/impl/LGGlobalActions;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView;Lcom/android/internal/policy/impl/LGGlobalActions;)V
    .locals 0

    .prologue
    .line 3169
    iput-object p1, p0, Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView$1;->this$1:Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView;

    iput-object p2, p0, Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView$1;->val$this$0:Lcom/android/internal/policy/impl/LGGlobalActions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 3173
    iget-object v0, p0, Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView$1;->this$1:Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView;

    iget-object v0, v0, Lcom/android/internal/policy/impl/LGGlobalActions$RestartPopupAnimationView;->this$0:Lcom/android/internal/policy/impl/LGGlobalActions;

    # getter for: Lcom/android/internal/policy/impl/LGGlobalActions;->mDialog:Landroid/app/Dialog;
    invoke-static {v0}, Lcom/android/internal/policy/impl/LGGlobalActions;->access$900(Lcom/android/internal/policy/impl/LGGlobalActions;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 3174
    return-void
.end method