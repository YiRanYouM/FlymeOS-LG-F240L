.class Lcom/android/server/power/PowerManagerServiceEx$1;
.super Lcom/lge/systemservice/core/SmartCoverManager$CoverCallback;
.source "PowerManagerServiceEx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/power/PowerManagerServiceEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/power/PowerManagerServiceEx;


# direct methods
.method constructor <init>(Lcom/android/server/power/PowerManagerServiceEx;)V
    .locals 0

    .prologue
    .line 1100
    iput-object p1, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    invoke-direct {p0}, Lcom/lge/systemservice/core/SmartCoverManager$CoverCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onStateChanged(I)V
    .locals 3
    .param p1, "coverState"    # I

    .prologue
    .line 1103
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    iget-object v1, v0, Lcom/android/server/power/PowerManagerServiceEx;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1104
    packed-switch p1, :pswitch_data_0

    .line 1110
    :try_start_0
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    const/4 v2, 0x1

    # setter for: Lcom/android/server/power/PowerManagerServiceEx;->mCoverOpened:Z
    invoke-static {v0, v2}, Lcom/android/server/power/PowerManagerServiceEx;->access$1102(Lcom/android/server/power/PowerManagerServiceEx;Z)Z

    .line 1113
    :goto_0
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    # invokes: Lcom/android/server/power/PowerManagerServiceEx;->updateCoverStateLocked()V
    invoke-static {v0}, Lcom/android/server/power/PowerManagerServiceEx;->access$1200(Lcom/android/server/power/PowerManagerServiceEx;)V

    .line 1114
    monitor-exit v1

    .line 1115
    return-void

    .line 1106
    :pswitch_0
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    const/4 v2, 0x0

    # setter for: Lcom/android/server/power/PowerManagerServiceEx;->mCoverOpened:Z
    invoke-static {v0, v2}, Lcom/android/server/power/PowerManagerServiceEx;->access$1102(Lcom/android/server/power/PowerManagerServiceEx;Z)Z

    goto :goto_0

    .line 1114
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1104
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onTypeChanged(I)V
    .locals 2
    .param p1, "type"    # I

    .prologue
    .line 1119
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    iget-object v1, v0, Lcom/android/server/power/PowerManagerServiceEx;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1120
    :try_start_0
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    # getter for: Lcom/android/server/power/PowerManagerServiceEx;->mCoverType:I
    invoke-static {v0}, Lcom/android/server/power/PowerManagerServiceEx;->access$1300(Lcom/android/server/power/PowerManagerServiceEx;)I

    move-result v0

    if-eq p1, v0, :cond_0

    .line 1121
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    # setter for: Lcom/android/server/power/PowerManagerServiceEx;->mCoverType:I
    invoke-static {v0, p1}, Lcom/android/server/power/PowerManagerServiceEx;->access$1302(Lcom/android/server/power/PowerManagerServiceEx;I)I

    .line 1122
    iget-object v0, p0, Lcom/android/server/power/PowerManagerServiceEx$1;->this$0:Lcom/android/server/power/PowerManagerServiceEx;

    # invokes: Lcom/android/server/power/PowerManagerServiceEx;->updateCoverStateLocked()V
    invoke-static {v0}, Lcom/android/server/power/PowerManagerServiceEx;->access$1200(Lcom/android/server/power/PowerManagerServiceEx;)V

    .line 1124
    :cond_0
    monitor-exit v1

    .line 1125
    return-void

    .line 1124
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
