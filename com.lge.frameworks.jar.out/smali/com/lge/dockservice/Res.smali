.class Lcom/lge/dockservice/Res;
.super Ljava/lang/Object;
.source "Res.java"


# static fields
.field private static final RES_PACKAGE_NAME:Ljava/lang/String; = "com.lge.app.floating.res"

.field private static final TAG:Ljava/lang/String;

.field private static resPackageContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-class v0, Lcom/lge/dockservice/Res;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/dockservice/Res;->TAG:Ljava/lang/String;

    .line 11
    const/4 v0, 0x0

    sput-object v0, Lcom/lge/dockservice/Res;->resPackageContext:Landroid/content/Context;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getResPackageContext(Landroid/content/Context;)Landroid/content/Context;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 19
    sget-object v1, Lcom/lge/dockservice/Res;->resPackageContext:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 20
    sget-object v1, Lcom/lge/dockservice/Res;->resPackageContext:Landroid/content/Context;

    .line 27
    :goto_0
    return-object v1

    .line 23
    :cond_0
    :try_start_0
    const-string v1, "com.lge.app.floating.res"

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v1

    sput-object v1, Lcom/lge/dockservice/Res;->resPackageContext:Landroid/content/Context;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :goto_1
    sget-object v1, Lcom/lge/dockservice/Res;->resPackageContext:Landroid/content/Context;

    goto :goto_0

    .line 24
    :catch_0
    move-exception v0

    .line 25
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v1, Lcom/lge/dockservice/Res;->TAG:Ljava/lang/String;

    const-string v2, "Cannot find Resources object for package com.lge.app.floating.res"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method static getResources(Landroid/content/Context;)Landroid/content/res/Resources;
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-static {p0}, Lcom/lge/dockservice/Res;->getResPackageContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method static getVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 31
    if-eqz p0, :cond_0

    .line 34
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "com.lge.app.floating.res"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 35
    .local v0, "pi":Landroid/content/pm/PackageInfo;
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .end local v0    # "pi":Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v1

    .line 36
    :catch_0
    move-exception v1

    .line 39
    :cond_0
    const-string v1, "unknown"

    goto :goto_0
.end method
