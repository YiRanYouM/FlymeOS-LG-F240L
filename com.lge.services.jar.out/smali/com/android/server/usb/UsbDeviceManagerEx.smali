.class public Lcom/android/server/usb/UsbDeviceManagerEx;
.super Lcom/android/server/usb/UsbDeviceManager;
.source "UsbDeviceManagerEx.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbDeviceManagerEx$UsbHandlerEx;
    }
.end annotation


# static fields
.field private static final AUTORUN_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/misc/usb_autorun"

.field private static final DIAG_ENABLE_PATH:Ljava/lang/String; = "/sys/devices/platform/lg_diag_cmd/diag_enable"

.field private static final NCM_START_MATCH:Ljava/lang/String; = "DEVPATH=/devices/virtual/misc/usb_ncm"

.field private static final PROP_GUESTMODE:Ljava/lang/String; = "service.plushome.currenthome"

.field private static final mSPROperator:Z

.field private static final mVZWOperator:Z


# instance fields
.field private mAtsStarted:Z

.field private mAutorunEnabled:Z

.field private mAutorunManager:Lcom/lge/usb/autorun/AutorunManager;

.field private mGuestMode:Z

.field mMDMIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mNcmSwitch:Z

.field private mSoftSwitch:Z

.field private final mUEventObserverEx:Landroid/os/UEventObserver;

.field private mpreUsbDriveRestricted:Z

.field private mpreUsbPortRestriced:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 50
    const-string v0, "VZW"

    sget-object v1, Lcom/lge/os/Build$CA_TARGET;->OPERATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/server/usb/UsbDeviceManagerEx;->mVZWOperator:Z

    .line 52
    const-string v0, "SPR"

    sget-object v1, Lcom/lge/os/Build$CA_TARGET;->OPERATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "BM"

    sget-object v1, Lcom/lge/os/Build$CA_TARGET;->OPERATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/android/server/usb/UsbDeviceManagerEx;->mSPROperator:Z

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 91
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceManager;-><init>(Landroid/content/Context;)V

    .line 54
    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAutorunEnabled:Z

    .line 57
    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mNcmSwitch:Z

    .line 60
    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAtsStarted:Z

    .line 68
    const-string v2, "service.plushome.currenthome"

    const-string v3, "none"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "kids"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mGuestMode:Z

    .line 72
    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mpreUsbPortRestriced:Z

    .line 73
    iput-boolean v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mpreUsbDriveRestricted:Z

    .line 118
    new-instance v2, Lcom/android/server/usb/UsbDeviceManagerEx$1;

    invoke-direct {v2, p0}, Lcom/android/server/usb/UsbDeviceManagerEx$1;-><init>(Lcom/android/server/usb/UsbDeviceManagerEx;)V

    iput-object v2, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mMDMIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 135
    new-instance v2, Lcom/android/server/usb/UsbDeviceManagerEx$2;

    invoke-direct {v2, p0}, Lcom/android/server/usb/UsbDeviceManagerEx$2;-><init>(Lcom/android/server/usb/UsbDeviceManagerEx;)V

    iput-object v2, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mUEventObserverEx:Landroid/os/UEventObserver;

    .line 93
    new-instance v2, Lcom/android/server/usb/UsbDeviceManagerEx$UsbHandlerEx;

    invoke-static {}, Lcom/android/server/FgThread;->get()Lcom/android/server/FgThread;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/server/FgThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/android/server/usb/UsbDeviceManagerEx$UsbHandlerEx;-><init>(Lcom/android/server/usb/UsbDeviceManagerEx;Landroid/os/Looper;)V

    iput-object v2, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mHandler:Lcom/android/server/usb/UsbDeviceManager$UsbHandler;

    .line 94
    invoke-virtual {p0}, Lcom/android/server/usb/UsbDeviceManagerEx;->nativeIsStartRequested()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    sget-boolean v2, Lcom/android/server/usb/UsbDeviceManagerEx;->DEBUG:Z

    if-eqz v2, :cond_0

    sget-object v2, Lcom/android/server/usb/UsbDeviceManagerEx;->TAG:Ljava/lang/String;

    const-string v3, "accessory attached at boot"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :cond_0
    invoke-virtual {p0}, Lcom/android/server/usb/UsbDeviceManagerEx;->startAccessoryMode()V

    .line 100
    :cond_1
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "autorun_switch"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_5

    :goto_0
    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAutorunEnabled:Z

    .line 101
    sget-boolean v0, Lcom/android/server/usb/UsbDeviceManagerEx;->DEBUG:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/android/server/usb/UsbDeviceManagerEx;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AUTORUN] mAutorunEnabled value is set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAutorunEnabled:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :cond_2
    sget-boolean v0, Lcom/android/server/usb/UsbDeviceManagerEx;->mVZWOperator:Z

    if-eqz v0, :cond_3

    .line 106
    new-instance v0, Lcom/lge/usb/autorun/AutorunManager;

    invoke-direct {v0, p1, p0}, Lcom/lge/usb/autorun/AutorunManager;-><init>(Landroid/content/Context;Lcom/android/server/usb/UsbDeviceManager;)V

    iput-object v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAutorunManager:Lcom/lge/usb/autorun/AutorunManager;

    .line 110
    :cond_3
    const-string v0, "true"

    const-string v1, "persist.sys.ats_start"

    const-string v2, "none"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAtsStarted:Z

    .line 111
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAtsStarted:Z

    if-eqz v0, :cond_4

    .line 112
    sget-boolean v0, Lcom/android/server/usb/UsbDeviceManagerEx;->DEBUG:Z

    if-eqz v0, :cond_4

    sget-object v0, Lcom/android/server/usb/UsbDeviceManagerEx;->TAG:Ljava/lang/String;

    const-string v1, "This device will be tested by Auto Test Suite... so prevent switching usb mode"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    :cond_4
    return-void

    :cond_5
    move v0, v1

    .line 100
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/android/server/usb/UsbDeviceManagerEx;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceManagerEx;->sendAutorunIntent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100()Z
    .locals 1

    .prologue
    .line 46
    sget-boolean v0, Lcom/android/server/usb/UsbDeviceManagerEx;->mVZWOperator:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/android/server/usb/UsbDeviceManagerEx;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAtsStarted:Z

    return v0
.end method

.method static synthetic access$1100(Lcom/android/server/usb/UsbDeviceManagerEx;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mpreUsbPortRestriced:Z

    return v0
.end method

.method static synthetic access$1102(Lcom/android/server/usb/UsbDeviceManagerEx;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mpreUsbPortRestriced:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/android/server/usb/UsbDeviceManagerEx;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mpreUsbDriveRestricted:Z

    return v0
.end method

.method static synthetic access$1202(Lcom/android/server/usb/UsbDeviceManagerEx;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mpreUsbDriveRestricted:Z

    return p1
.end method

.method static synthetic access$200(Lcom/android/server/usb/UsbDeviceManagerEx;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbDeviceManagerEx;->sendUsbDriverInstalledIntent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/server/usb/UsbDeviceManagerEx;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mNcmSwitch:Z

    return v0
.end method

.method static synthetic access$302(Lcom/android/server/usb/UsbDeviceManagerEx;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mNcmSwitch:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/server/usb/UsbDeviceManagerEx;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/android/server/usb/UsbDeviceManagerEx;->startNcmMode()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/usb/UsbDeviceManagerEx;)Landroid/os/UEventObserver;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mUEventObserverEx:Landroid/os/UEventObserver;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/server/usb/UsbDeviceManagerEx;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAutorunEnabled:Z

    return v0
.end method

.method static synthetic access$602(Lcom/android/server/usb/UsbDeviceManagerEx;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mAutorunEnabled:Z

    return p1
.end method

.method static synthetic access$700(Lcom/android/server/usb/UsbDeviceManagerEx;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mGuestMode:Z

    return v0
.end method

.method static synthetic access$702(Lcom/android/server/usb/UsbDeviceManagerEx;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mGuestMode:Z

    return p1
.end method

.method static synthetic access$800(Lcom/android/server/usb/UsbDeviceManagerEx;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mSoftSwitch:Z

    return v0
.end method

.method static synthetic access$802(Lcom/android/server/usb/UsbDeviceManagerEx;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/android/server/usb/UsbDeviceManagerEx;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mSoftSwitch:Z

    return p1
.end method

.method static synthetic access$900()Z
    .locals 1

    .prologue
    .line 46
    sget-boolean v0, Lcom/android/server/usb/UsbDeviceManagerEx;->mSPROperator:Z

    return v0
.end method

.method private sendAutorunIntent(Ljava/lang/String;)V
    .locals 2
    .param p1, "autorun"    # Ljava/lang/String;

    .prologue
    .line 194
    const-string v1, "ACK"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 195
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.lge.android.intent.action.AUTORUN_ACK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 196
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 206
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 197
    :cond_1
    sget-boolean v1, Lcom/android/server/usb/UsbDeviceManagerEx;->mVZWOperator:Z

    if-nez v1, :cond_2

    const-string v1, "change_mode"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 198
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.lge.android.intent.action.AUTORUN_CHANGE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 199
    .restart local v0    # "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 200
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2
    sget-boolean v1, Lcom/android/server/usb/UsbDeviceManagerEx;->mVZWOperator:Z

    if-eqz v1, :cond_0

    .line 201
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.lge.android.intent.action.AUTORUN_CHANGE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 202
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string v1, "com.lge.intent.extra.EXTRA_AUTORUN_CHANGE_MODE_NAME"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private sendUsbDriverInstalledIntent(Ljava/lang/String;)V
    .locals 5
    .param p1, "usb_drv"    # Ljava/lang/String;

    .prologue
    .line 209
    if-eqz p1, :cond_0

    .line 210
    sget-object v2, Lcom/android/server/usb/UsbDeviceManagerEx;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "USB driver is not "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    const/4 v0, 0x0

    .line 213
    .local v0, "installed":Z
    const-string v2, "uninstalled"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 214
    const/4 v0, 0x0

    .line 220
    :goto_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.lge.intent.action.USB_DRIVER_INSTALLED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 221
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v2, 0x60000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 222
    const-string v2, "installed"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 223
    iget-object v2, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 225
    .end local v0    # "installed":Z
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    return-void

    .line 215
    .restart local v0    # "installed":Z
    :cond_1
    const-string v2, "installed"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 216
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private startNcmMode()V
    .locals 3

    .prologue
    .line 79
    sget-boolean v1, Lcom/android/server/usb/UsbDeviceManagerEx;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 80
    sget-object v1, Lcom/android/server/usb/UsbDeviceManagerEx;->TAG:Ljava/lang/String;

    const-string v2, "startNcmMode"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.lge.hardware.usb.ncm.NCM_STATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 84
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x20000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 85
    const-string v1, "ncm_connected"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 86
    iget-object v1, p0, Lcom/android/server/usb/UsbDeviceManagerEx;->mContext:Landroid/content/Context;

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 87
    return-void
.end method