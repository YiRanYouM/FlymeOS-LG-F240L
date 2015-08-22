.class Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "NotificationManagerServiceEx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/notification/NotificationManagerServiceEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/notification/NotificationManagerServiceEx;


# direct methods
.method public constructor <init>(Lcom/android/server/notification/NotificationManagerServiceEx;Landroid/os/Handler;)V
    .locals 0
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->this$0:Lcom/android/server/notification/NotificationManagerServiceEx;

    .line 112
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 113
    return-void
.end method

.method static synthetic access$700(Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->updateBackPulseEnabled()V

    return-void
.end method

.method private updateBackPulseEnabled()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 128
    iget-object v2, p0, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->this$0:Lcom/android/server/notification/NotificationManagerServiceEx;

    # getter for: Lcom/android/server/notification/NotificationManagerServiceEx;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/notification/NotificationManagerServiceEx;->access$200(Lcom/android/server/notification/NotificationManagerServiceEx;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 129
    .local v1, "resolver":Landroid/content/ContentResolver;
    const-string v2, "notification_light_pulse_back"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_1

    .line 130
    .local v0, "backPulseEnabled":Z
    :goto_0
    iget-object v2, p0, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->this$0:Lcom/android/server/notification/NotificationManagerServiceEx;

    # getter for: Lcom/android/server/notification/NotificationManagerServiceEx;->mBackPulseEnabled:Z
    invoke-static {v2}, Lcom/android/server/notification/NotificationManagerServiceEx;->access$300(Lcom/android/server/notification/NotificationManagerServiceEx;)Z

    move-result v2

    if-eq v2, v0, :cond_0

    .line 131
    iget-object v2, p0, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->this$0:Lcom/android/server/notification/NotificationManagerServiceEx;

    # setter for: Lcom/android/server/notification/NotificationManagerServiceEx;->mBackPulseEnabled:Z
    invoke-static {v2, v0}, Lcom/android/server/notification/NotificationManagerServiceEx;->access$302(Lcom/android/server/notification/NotificationManagerServiceEx;Z)Z

    .line 133
    :cond_0
    iget-object v2, p0, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->this$0:Lcom/android/server/notification/NotificationManagerServiceEx;

    invoke-virtual {v2}, Lcom/android/server/notification/NotificationManagerServiceEx;->updateLightsLocked()V

    .line 134
    return-void

    .line 129
    .end local v0    # "backPulseEnabled":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method observe()V
    .locals 4

    .prologue
    .line 116
    iget-object v1, p0, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->this$0:Lcom/android/server/notification/NotificationManagerServiceEx;

    # getter for: Lcom/android/server/notification/NotificationManagerServiceEx;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/notification/NotificationManagerServiceEx;->access$200(Lcom/android/server/notification/NotificationManagerServiceEx;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 117
    .local v0, "resolver":Landroid/content/ContentResolver;
    const-string v1, "notification_light_pulse_back"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v2, p0, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    .line 118
    invoke-direct {p0}, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->updateBackPulseEnabled()V

    .line 119
    return-void
.end method

.method public onChange(Z)V
    .locals 0
    .param p1, "selfChange"    # Z

    .prologue
    .line 123
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 124
    invoke-direct {p0}, Lcom/android/server/notification/NotificationManagerServiceEx$SettingsObserver;->updateBackPulseEnabled()V

    .line 125
    return-void
.end method