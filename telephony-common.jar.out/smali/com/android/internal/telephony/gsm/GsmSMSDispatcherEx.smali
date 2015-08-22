.class public Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;
.super Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;
.source "GsmSMSDispatcherEx.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "GsmSMSDispatcherEx"


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsUsageMonitor;Lcom/android/internal/telephony/ImsSMSDispatcher;Lcom/android/internal/telephony/gsm/GsmInboundSmsHandler;)V
    .locals 2
    .param p1, "phone"    # Lcom/android/internal/telephony/PhoneBase;
    .param p2, "usageMonitor"    # Lcom/android/internal/telephony/SmsUsageMonitor;
    .param p3, "imsSMSDispatcher"    # Lcom/android/internal/telephony/ImsSMSDispatcher;
    .param p4, "gsmInboundSmsHandler"    # Lcom/android/internal/telephony/gsm/GsmInboundSmsHandler;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;-><init>(Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/SmsUsageMonitor;Lcom/android/internal/telephony/ImsSMSDispatcher;Lcom/android/internal/telephony/gsm/GsmInboundSmsHandler;)V

    .line 65
    const-string v0, "GsmSMSDispatcherEx"

    const-string v1, "GsmSMSDispatcherEx created"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    return-void
.end method

.method private handleStatusReportForKDDI(IILjava/lang/String;)V
    .locals 7
    .param p1, "tpStatus"    # I
    .param p2, "messageRef"    # I
    .param p3, "pduString"    # Ljava/lang/String;

    .prologue
    .line 69
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleStatusReport(), [KDDI], handleStatusReport(), messageRef: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    .line 70
    const/4 v2, 0x0

    .local v2, "i":I
    sget-object v5, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->DELIVERYPENDINGLISTFORKDDI:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "count":I
    :goto_0
    if-ge v2, v0, :cond_2

    .line 71
    sget-object v5, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->DELIVERYPENDINGLISTFORKDDI:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    .line 72
    .local v4, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    iget v5, v4, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    if-ne v5, p2, :cond_3

    .line 74
    const/16 v5, 0x40

    if-ge p1, v5, :cond_0

    const/16 v5, 0x20

    if-ge p1, v5, :cond_1

    .line 75
    :cond_0
    sget-object v5, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->DELIVERYPENDINGLISTFORKDDI:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 77
    :cond_1
    iget-object v3, v4, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mDeliveryIntent:Landroid/app/PendingIntent;

    .line 78
    .local v3, "intent":Landroid/app/PendingIntent;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 79
    .local v1, "fillIn":Landroid/content/Intent;
    const-string v5, "pdu"

    invoke-static {p3}, Lcom/android/internal/telephony/uicc/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 80
    const-string v5, "format"

    const-string v6, "3gpp"

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    :try_start_0
    const-string v5, "handleStatusReport(), UI <-- GsmSMSDispatcher(kddi)"

    invoke-static {v5}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->f(Ljava/lang/String;)I

    .line 83
    iget-object v5, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const/4 v6, -0x1

    invoke-virtual {v3, v5, v6, v1}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .end local v1    # "fillIn":Landroid/content/Intent;
    .end local v3    # "intent":Landroid/app/PendingIntent;
    .end local v4    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_2
    :goto_1
    return-void

    .line 70
    .restart local v4    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 84
    .restart local v1    # "fillIn":Landroid/content/Intent;
    .restart local v3    # "intent":Landroid/app/PendingIntent;
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method private readSmsConfirmRead(Lcom/android/internal/telephony/SmsHeader;I)V
    .locals 4
    .param p1, "smsHeader"    # Lcom/android/internal/telephony/SmsHeader;
    .param p2, "confirmRead"    # I

    .prologue
    const/4 v3, 0x1

    .line 222
    iget-object v1, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v2, "confirmRead"

    invoke-static {v1, v2}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-ne v1, v3, :cond_0

    .line 223
    const/4 v1, -0x1

    if-le p2, v1, :cond_0

    .line 224
    new-instance v0, Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;

    invoke-direct {v0}, Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;-><init>()V

    .line 225
    .local v0, "smsConfirmRead":Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;
    iput v3, v0, Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;->length:I

    .line 226
    new-array v1, v3, [B

    iput-object v1, v0, Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;->confirmRead:[B

    .line 227
    iget-object v1, v0, Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;->confirmRead:[B

    const/4 v2, 0x0

    int-to-byte v3, p2

    aput-byte v3, v1, v2

    .line 228
    iput-object v0, p1, Lcom/android/internal/telephony/SmsHeader;->smsConfirmRead:Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;

    .line 231
    .end local v0    # "smsConfirmRead":Lcom/android/internal/telephony/SmsHeader$SmsConfirmRead;
    :cond_0
    return-void
.end method

.method private replyOptionDestnationNumber(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "replyOption"    # I

    .prologue
    .line 122
    iget-object v1, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v2, "confirmRead"

    invoke-static {v1, v2}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->isReleaseOperator()Z

    move-result v1

    if-nez v1, :cond_1

    .line 142
    .end local p1    # "number":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 127
    .restart local p1    # "number":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .local v0, "replyOptionDest":Ljava/lang/StringBuilder;
    packed-switch p2, :pswitch_data_0

    .line 141
    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 130
    :pswitch_0
    const-string v1, "##4323"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 133
    :pswitch_1
    const-string v1, "##4325"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 136
    :pswitch_2
    const-string v1, "##4324"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 128
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private sendTextForKREncoding(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/net/Uri;Ljava/lang/String;ZI)V
    .locals 12
    .param p1, "destAddr"    # Ljava/lang/String;
    .param p2, "scAddr"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "messageUri"    # Landroid/net/Uri;
    .param p7, "callingPkg"    # Ljava/lang/String;
    .param p8, "isExpectMore"    # Z
    .param p9, "validityPeriod"    # I

    .prologue
    .line 410
    if-eqz p5, :cond_1

    const/4 v5, 0x1

    :goto_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getLine1Number()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    const/4 v6, 0x0

    :goto_1
    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, p2

    move-object v3, p1

    move-object v4, p3

    invoke-static/range {v2 .. v8}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v10

    .line 415
    .local v10, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz v10, :cond_5

    .line 416
    if-nez p6, :cond_4

    .line 417
    iget-object v2, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    move-object/from16 v0, p7

    invoke-static {v0, v2}, Lcom/android/internal/telephony/SmsApplication;->shouldWriteMessageForPackage(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 418
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSubId()J

    move-result-wide v4

    if-eqz p5, :cond_3

    const/4 v8, 0x1

    :goto_2
    move-object v3, p0

    move-object v6, p1

    move-object v7, p3

    move-object/from16 v9, p7

    invoke-virtual/range {v3 .. v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->writeOutboxMessage(JLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/net/Uri;

    move-result-object p6

    .line 428
    :cond_0
    :goto_3
    invoke-virtual {p0, p1, p2, p3, v10}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v3

    .line 429
    .local v3, "map":Ljava/util/HashMap;
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getFormat()Ljava/lang/String;

    move-result-object v6

    move-object v2, p0

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v7, p6

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-virtual/range {v2 .. v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTracker(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Landroid/net/Uri;ZI)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v11

    .line 431
    .local v11, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 438
    .end local v3    # "map":Ljava/util/HashMap;
    .end local v11    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :goto_4
    return-void

    .line 410
    .end local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    :cond_2
    const/4 v2, -0x1

    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getLine1Number()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->makeSmsHeader(ILjava/lang/String;)[B

    move-result-object v6

    goto :goto_1

    .line 418
    .restart local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_3
    const/4 v8, 0x0

    goto :goto_2

    .line 426
    :cond_4
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSubId()J

    move-result-wide v4

    move-object/from16 v0, p6

    move-object/from16 v1, p7

    invoke-virtual {p0, v4, v5, v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->moveToOutbox(JLandroid/net/Uri;Ljava/lang/String;)V

    goto :goto_3

    .line 433
    :cond_5
    const-string v2, "sendTextForKREncoding(), sendText failed : pdu is null"

    invoke-static {v2}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    .line 435
    const/4 v2, 0x3

    move-object/from16 v0, p4

    invoke-static {v0, v2}, Landroid/telephony/SmsManager;->sendExceptionbySentIntent(Landroid/app/PendingIntent;I)V

    goto :goto_4
.end method


# virtual methods
.method protected getEncoding()I
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x1

    return v0
.end method

.method protected handleStatusReport(Landroid/os/AsyncResult;)V
    .locals 7
    .param p1, "ar"    # Landroid/os/AsyncResult;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 102
    const-string v4, "kddi_receive_status_report_iwk"

    invoke-static {v6, v4}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-ne v4, v5, :cond_1

    .line 103
    iget-object v1, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 104
    .local v1, "pduString":Ljava/lang/String;
    invoke-static {v1}, Lcom/android/internal/telephony/gsm/SmsMessage;->newFromCDS(Ljava/lang/String;)Lcom/android/internal/telephony/gsm/SmsMessage;

    move-result-object v2

    .line 106
    .local v2, "sms":Lcom/android/internal/telephony/gsm/SmsMessage;
    if-eqz v2, :cond_0

    .line 107
    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/SmsMessage;->getStatus()I

    move-result v3

    .line 108
    .local v3, "tpStatus":I
    iget v0, v2, Lcom/android/internal/telephony/gsm/SmsMessage;->mMessageRef:I

    .line 110
    .local v0, "messageRef":I
    invoke-direct {p0, v3, v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->handleStatusReportForKDDI(IILjava/lang/String;)V

    .line 112
    .end local v0    # "messageRef":I
    .end local v3    # "tpStatus":I
    :cond_0
    iget-object v4, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v4, v5, v5, v6}, Lcom/android/internal/telephony/CommandsInterface;->acknowledgeLastIncomingGsmSms(ZILandroid/os/Message;)V

    .line 118
    .end local v1    # "pduString":Ljava/lang/String;
    .end local v2    # "sms":Lcom/android/internal/telephony/gsm/SmsMessage;
    :goto_0
    return-void

    .line 117
    :cond_1
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->handleStatusReport(Landroid/os/AsyncResult;)V

    goto :goto_0
.end method

.method protected sendEmailoverText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;)V
    .locals 12
    .param p1, "destAddr"    # Ljava/lang/String;
    .param p2, "scAddr"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "callingPkg"    # Ljava/lang/String;

    .prologue
    .line 152
    const-string v2, "sendEmailoverText()"

    invoke-static {v2}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    .line 154
    if-eqz p5, :cond_1

    const/4 v5, 0x1

    :goto_0
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p2

    move-object v3, p1

    move-object v4, p3

    invoke-static/range {v2 .. v7}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->getSubmitPduforEmailoverSms(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BI)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v10

    .line 157
    .local v10, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz v10, :cond_3

    .line 158
    const/4 v7, 0x0

    .line 159
    .local v7, "messageUri":Landroid/net/Uri;
    iget-object v2, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    move-object/from16 v0, p6

    invoke-static {v0, v2}, Lcom/android/internal/telephony/SmsApplication;->shouldWriteMessageForPackage(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 160
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSubId()J

    move-result-wide v4

    if-eqz p5, :cond_2

    const/4 v8, 0x1

    :goto_1
    move-object v3, p0

    move-object v6, p1

    move-object v7, p3

    move-object/from16 v9, p6

    invoke-virtual/range {v3 .. v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->writeOutboxMessage(JLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/net/Uri;

    .end local v7    # "messageUri":Landroid/net/Uri;
    move-result-object v7

    .line 167
    .restart local v7    # "messageUri":Landroid/net/Uri;
    :cond_0
    invoke-virtual {p0, p1, p2, p3, v10}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v3

    .line 168
    .local v3, "map":Ljava/util/HashMap;
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getFormat()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    move-object v2, p0

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    invoke-virtual/range {v2 .. v8}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTracker(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Landroid/net/Uri;Z)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v11

    .line 169
    .local v11, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 173
    .end local v3    # "map":Ljava/util/HashMap;
    .end local v7    # "messageUri":Landroid/net/Uri;
    .end local v11    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :goto_2
    return-void

    .line 154
    .end local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 160
    .restart local v7    # "messageUri":Landroid/net/Uri;
    .restart local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_2
    const/4 v8, 0x0

    goto :goto_1

    .line 171
    .end local v7    # "messageUri":Landroid/net/Uri;
    :cond_3
    const-string v2, "sendEmailoverText(), returned null"

    invoke-static {v2}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->e(Ljava/lang/String;)I

    goto :goto_2
.end method

.method protected sendMultipartTextLge(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;IIIZ)V
    .locals 28
    .param p1, "destAddr"    # Ljava/lang/String;
    .param p2, "scAddr"    # Ljava/lang/String;
    .param p6, "callingPkg"    # Ljava/lang/String;
    .param p7, "replyAddr"    # Ljava/lang/String;
    .param p8, "confirmRead"    # I
    .param p9, "replyOption"    # I
    .param p10, "protocolId"    # I
    .param p11, "isExpectMore"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIIZ)V"
        }
    .end annotation

    .prologue
    .line 241
    .local p3, "parts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, "sentIntents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, "deliveryIntents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const-string v4, "sendMultipartTextLge()"

    invoke-static {v4}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->v(Ljava/lang/String;)I

    .line 243
    const/16 v18, 0x0

    .line 244
    .local v18, "messageUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    move-object/from16 v0, p6

    invoke-static {v0, v4}, Lcom/android/internal/telephony/SmsApplication;->shouldWriteMessageForPackage(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 245
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSubId()J

    move-result-wide v6

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getMultipartMessageText(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v9

    if-eqz p5, :cond_3

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3

    const/4 v10, 0x1

    :goto_0
    move-object/from16 v5, p0

    move-object/from16 v8, p1

    move-object/from16 v11, p6

    invoke-virtual/range {v5 .. v11}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->writeOutboxMessage(JLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/net/Uri;

    move-result-object v18

    .line 253
    :cond_0
    invoke-static {}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getNextConcatenatedRef()I

    move-result v4

    and-int/lit16 v0, v4, 0xff

    move/from16 v25, v0

    .line 254
    .local v25, "refNumber":I
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v23

    .line 255
    .local v23, "msgCount":I
    const/4 v9, 0x0

    .line 257
    .local v9, "encoding":I
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_1
    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_4

    .line 258
    move-object/from16 v0, p3

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->calculateLength(Ljava/lang/CharSequence;ZZ)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v21

    .line 260
    .local v21, "details":Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    move-object/from16 v0, v21

    iget v4, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    if-eq v9, v4, :cond_2

    if-eqz v9, :cond_1

    const/4 v4, 0x1

    if-ne v9, v4, :cond_2

    .line 263
    :cond_1
    move-object/from16 v0, v21

    iget v9, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    .line 257
    :cond_2
    add-int/lit8 v22, v22, 0x1

    goto :goto_1

    .line 245
    .end local v9    # "encoding":I
    .end local v21    # "details":Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .end local v22    # "i":I
    .end local v23    # "msgCount":I
    .end local v25    # "refNumber":I
    :cond_3
    const/4 v10, 0x0

    goto :goto_0

    .line 268
    .restart local v9    # "encoding":I
    .restart local v22    # "i":I
    .restart local v23    # "msgCount":I
    .restart local v25    # "refNumber":I
    :cond_4
    new-instance v16, Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v0, v16

    move/from16 v1, v23

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 269
    .local v16, "unsentPartCount":Ljava/util/concurrent/atomic/AtomicInteger;
    new-instance v17, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x0

    move-object/from16 v0, v17

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 271
    .local v17, "anyPartFailed":Ljava/util/concurrent/atomic/AtomicBoolean;
    const/16 v22, 0x0

    :goto_2
    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_8

    .line 272
    new-instance v19, Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-direct/range {v19 .. v19}, Lcom/android/internal/telephony/SmsHeader$ConcatRef;-><init>()V

    .line 273
    .local v19, "concatRef":Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    move/from16 v0, v25

    move-object/from16 v1, v19

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 274
    add-int/lit8 v4, v22, 0x1

    move-object/from16 v0, v19

    iput v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    .line 275
    move/from16 v0, v23

    move-object/from16 v1, v19

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    .line 282
    const/4 v4, 0x1

    move-object/from16 v0, v19

    iput-boolean v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->isEightBits:Z

    .line 283
    new-instance v27, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct/range {v27 .. v27}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 284
    .local v27, "smsHeader":Lcom/android/internal/telephony/SmsHeader;
    move-object/from16 v0, v19

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    .line 286
    if-nez v22, :cond_5

    .line 288
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->setReplyAddress(Lcom/android/internal/telephony/SmsHeader;)V

    .line 292
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, p8

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->readSmsConfirmRead(Lcom/android/internal/telephony/SmsHeader;I)V

    .line 296
    :cond_5
    const/16 v26, 0x0

    .line 298
    .local v26, "sentIntent":Landroid/app/PendingIntent;
    if-eqz p4, :cond_6

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v22

    if-le v4, v0, :cond_6

    .line 299
    move-object/from16 v0, p4

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v26

    .end local v26    # "sentIntent":Landroid/app/PendingIntent;
    check-cast v26, Landroid/app/PendingIntent;

    .line 302
    .restart local v26    # "sentIntent":Landroid/app/PendingIntent;
    :cond_6
    const/16 v20, 0x0

    .line 304
    .local v20, "deliveryIntent":Landroid/app/PendingIntent;
    if-eqz p5, :cond_7

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v22

    if-le v4, v0, :cond_7

    .line 305
    move-object/from16 v0, p5

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    .end local v20    # "deliveryIntent":Landroid/app/PendingIntent;
    check-cast v20, Landroid/app/PendingIntent;

    .line 308
    .restart local v20    # "deliveryIntent":Landroid/app/PendingIntent;
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p9

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->replyOptionDestnationNumber(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p3

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    if-eqz v20, :cond_9

    const/4 v7, 0x1

    :goto_3
    invoke-static/range {v27 .. v27}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v8

    move-object/from16 v0, v27

    iget v10, v0, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    move-object/from16 v0, v27

    iget v11, v0, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    move-object/from16 v4, p2

    invoke-static/range {v4 .. v11}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v24

    .line 312
    .local v24, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-nez v24, :cond_a

    .line 313
    const-string v4, "sendMultipartTextLge(), failed : pdu is null"

    invoke-static {v4}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    .line 315
    const/4 v4, 0x3

    move-object/from16 v0, p4

    invoke-static {v0, v4}, Landroid/telephony/SmsManager;->sendExceptionbySentIntent(Ljava/util/ArrayList;I)V

    .line 324
    .end local v19    # "concatRef":Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .end local v20    # "deliveryIntent":Landroid/app/PendingIntent;
    .end local v24    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v26    # "sentIntent":Landroid/app/PendingIntent;
    .end local v27    # "smsHeader":Lcom/android/internal/telephony/SmsHeader;
    :cond_8
    return-void

    .line 308
    .restart local v19    # "concatRef":Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    .restart local v20    # "deliveryIntent":Landroid/app/PendingIntent;
    .restart local v26    # "sentIntent":Landroid/app/PendingIntent;
    .restart local v27    # "smsHeader":Lcom/android/internal/telephony/SmsHeader;
    :cond_9
    const/4 v7, 0x0

    goto :goto_3

    .line 320
    .restart local v24    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_a
    move-object/from16 v0, p3

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    add-int/lit8 v4, v23, -0x1

    move/from16 v0, v22

    if-ne v0, v4, :cond_b

    const/4 v12, 0x1

    :goto_4
    const/4 v13, -0x1

    const/4 v15, -0x1

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, v27

    move-object/from16 v10, v26

    move-object/from16 v11, v20

    move/from16 v14, p11

    invoke-virtual/range {v4 .. v18}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendNewSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsHeader;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;ZIZILjava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/net/Uri;)V

    .line 271
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_2

    .line 320
    :cond_b
    const/4 v12, 0x0

    goto :goto_4
.end method

.method protected sendNewSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsHeader;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;ZIZILjava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/net/Uri;)V
    .locals 21
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "smsHeader"    # Lcom/android/internal/telephony/SmsHeader;
    .param p5, "encoding"    # I
    .param p6, "sentIntent"    # Landroid/app/PendingIntent;
    .param p7, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p8, "lastPart"    # Z
    .param p9, "priority"    # I
    .param p10, "isExpectMore"    # Z
    .param p11, "validityPeriod"    # I
    .param p12, "unsentPartCount"    # Ljava/util/concurrent/atomic/AtomicInteger;
    .param p13, "anyPartFailed"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p14, "messageUri"    # Landroid/net/Uri;

    .prologue
    .line 335
    if-eqz p7, :cond_2

    const/4 v7, 0x1

    :goto_0
    invoke-static/range {p4 .. p4}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v8

    move-object/from16 v0, p4

    iget v10, v0, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    move-object/from16 v0, p4

    iget v11, v0, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    move-object/from16 v4, p2

    move-object/from16 v5, p1

    move-object/from16 v6, p3

    move/from16 v9, p5

    move/from16 v12, p11

    invoke-static/range {v4 .. v12}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v8

    .line 338
    .local v8, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz v8, :cond_5

    .line 341
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v5, "modify_check_confirm_popup_concat_message_mo"

    invoke-static {v4, v5}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v9, p4

    .line 342
    invoke-virtual/range {v4 .. v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;Lcom/android/internal/telephony/SmsHeader;)Ljava/util/HashMap;

    move-result-object v10

    .line 349
    .local v10, "map":Ljava/util/HashMap;
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v5, "link_mode_for_all_segs"

    invoke-static {v4, v5}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 350
    const/16 p10, 0x1

    .line 353
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getFormat()Ljava/lang/String;

    move-result-object v13

    if-eqz p8, :cond_1

    if-eqz p10, :cond_4

    :cond_1
    const/16 v18, 0x1

    :goto_2
    move-object/from16 v9, p0

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    move-object/from16 v14, p12

    move-object/from16 v15, p13

    move-object/from16 v16, p14

    move-object/from16 v17, p4

    move/from16 v19, p11

    invoke-virtual/range {v9 .. v19}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTracker(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/net/Uri;Lcom/android/internal/telephony/SmsHeader;ZI)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v20

    .line 356
    .local v20, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 360
    .end local v10    # "map":Ljava/util/HashMap;
    .end local v20    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :goto_3
    return-void

    .line 335
    .end local v8    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_2
    const/4 v7, 0x0

    goto :goto_0

    .line 345
    .restart local v8    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3, v8}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v10

    .restart local v10    # "map":Ljava/util/HashMap;
    goto :goto_1

    .line 353
    :cond_4
    const/16 v18, 0x0

    goto :goto_2

    .line 358
    .end local v10    # "map":Ljava/util/HashMap;
    :cond_5
    const-string v4, "GsmSMSDispatcherEx"

    const-string v5, "GsmSMSDispatcher.sendNewSubmitPdu(): getSubmitPdu() returned null"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method

.method protected sendNewSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsHeader;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;ZZLjava/lang/String;ZLjava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/net/Uri;)V
    .locals 19
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "smsHeader"    # Lcom/android/internal/telephony/SmsHeader;
    .param p5, "encoding"    # I
    .param p6, "sentIntent"    # Landroid/app/PendingIntent;
    .param p7, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p8, "lastPart"    # Z
    .param p9, "isExpectMore"    # Z
    .param p10, "cbAddress"    # Ljava/lang/String;
    .param p11, "isMultiPart"    # Z
    .param p12, "unsentPartCount"    # Ljava/util/concurrent/atomic/AtomicInteger;
    .param p13, "anyPartFailed"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p14, "messageUri"    # Landroid/net/Uri;

    .prologue
    .line 369
    if-eqz p7, :cond_1

    const/4 v5, 0x1

    :goto_0
    invoke-static/range {p4 .. p4}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v6

    move-object/from16 v0, p4

    iget v8, v0, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    move-object/from16 v0, p4

    iget v9, v0, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    move-object/from16 v4, p3

    move/from16 v7, p5

    invoke-static/range {v2 .. v9}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v6

    .line 372
    .local v6, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz v6, :cond_3

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v7, p11

    .line 373
    invoke-virtual/range {v2 .. v7}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;Z)Ljava/util/HashMap;

    move-result-object v8

    .line 374
    .local v8, "map":Ljava/util/HashMap;
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getFormat()Ljava/lang/String;

    move-result-object v11

    if-eqz p8, :cond_0

    if-eqz p9, :cond_2

    :cond_0
    const/16 v16, 0x1

    :goto_1
    const/16 v17, -0x1

    move-object/from16 v7, p0

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    move-object/from16 v14, p14

    move-object/from16 v15, p4

    invoke-virtual/range {v7 .. v17}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTracker(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/net/Uri;Lcom/android/internal/telephony/SmsHeader;ZI)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v18

    .line 376
    .local v18, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 380
    .end local v8    # "map":Ljava/util/HashMap;
    .end local v18    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :goto_2
    return-void

    .line 369
    .end local v6    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 374
    .restart local v6    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .restart local v8    # "map":Ljava/util/HashMap;
    :cond_2
    const/16 v16, 0x0

    goto :goto_1

    .line 378
    .end local v8    # "map":Ljava/util/HashMap;
    :cond_3
    const-string v2, "sendNewSubmitPdu(), getSubmitPdu() returned null"

    invoke-static {v2}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->e(Ljava/lang/String;)I

    goto :goto_2
.end method

.method protected sendNewSubmitPduforEmailoverSms(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsHeader;ILandroid/app/PendingIntent;Landroid/app/PendingIntent;ZLjava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/net/Uri;)V
    .locals 17
    .param p1, "destinationAddress"    # Ljava/lang/String;
    .param p2, "scAddress"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "smsHeader"    # Lcom/android/internal/telephony/SmsHeader;
    .param p5, "encoding"    # I
    .param p6, "sentIntent"    # Landroid/app/PendingIntent;
    .param p7, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p8, "lastPart"    # Z
    .param p9, "unsentPartCount"    # Ljava/util/concurrent/atomic/AtomicInteger;
    .param p10, "anyPartFailed"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p11, "messageUri"    # Landroid/net/Uri;

    .prologue
    .line 390
    if-eqz p7, :cond_0

    const/4 v7, 0x1

    :goto_0
    invoke-static/range {p4 .. p4}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v8

    move-object/from16 v4, p2

    move-object/from16 v5, p1

    move-object/from16 v6, p3

    move/from16 v9, p5

    invoke-static/range {v4 .. v9}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->getSubmitPduforEmailoverSms(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BI)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v15

    .line 393
    .local v15, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz v15, :cond_2

    .line 394
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3, v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v5

    .line 395
    .local v5, "map":Ljava/util/HashMap;
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getFormat()Ljava/lang/String;

    move-result-object v8

    if-nez p8, :cond_1

    const/4 v13, 0x1

    :goto_1
    const/4 v14, -0x1

    move-object/from16 v4, p0

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p4

    invoke-virtual/range {v4 .. v14}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTracker(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/net/Uri;Lcom/android/internal/telephony/SmsHeader;ZI)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v16

    .line 398
    .local v16, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 402
    .end local v5    # "map":Ljava/util/HashMap;
    .end local v16    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :goto_2
    return-void

    .line 390
    .end local v15    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_0
    const/4 v7, 0x0

    goto :goto_0

    .line 395
    .restart local v5    # "map":Ljava/util/HashMap;
    .restart local v15    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    const/4 v13, 0x0

    goto :goto_1

    .line 400
    .end local v5    # "map":Ljava/util/HashMap;
    :cond_2
    const-string v4, "GsmSMSDispatcherEx"

    const-string v6, "GsmSMSDispatcher.sendNewSubmitPdu(): getSubmitPdu() returned null"

    invoke-static {v4, v6}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method protected sendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V
    .locals 2
    .param p1, "tracker"    # Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    .prologue
    .line 538
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v1, "setSMSMoDomain_Intel"

    invoke-static {v0, v1}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 539
    const-string v0, "sendSms - lgeSetSMSMoDomain"

    invoke-static {v0}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->v(Ljava/lang/String;)I

    .line 540
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-static {v0}, Lcom/android/internal/telephony/LGSmsMoDomain;->getDefault(Lcom/android/internal/telephony/PhoneBase;)Lcom/android/internal/telephony/LGSmsMoDomain;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/LGSmsMoDomain;->lgeSetSMSMoDomain(I)V

    .line 543
    :cond_0
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcher;->sendSms(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 544
    return-void
.end method

.method protected sendSmsByPstn(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V
    .locals 10
    .param p1, "tracker"    # Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 549
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getState()I

    move-result v9

    .line 554
    .local v9, "ss":I
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->checkNotInService()Z

    move-result v0

    if-ne v1, v0, :cond_1

    .line 558
    iget-boolean v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mSyncronousSending:Z

    if-eqz v0, :cond_0

    .line 559
    const-string v0, "sendSmsByPstn()_Ex, due to Not In Service, send failed intent and dequeueFailedPendingMessage"

    invoke-static {v0}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    .line 560
    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->dequeueFailedPendingMessage(I)V

    .line 603
    :goto_0
    return-void

    .line 562
    :cond_0
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getNotInServiceError(I)I

    move-result v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->onFailed(Landroid/content/Context;II)V

    goto :goto_0

    .line 568
    :cond_1
    iget-object v6, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mData:Ljava/util/HashMap;

    .line 570
    .local v6, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "smsc"

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    move-object v8, v0

    check-cast v8, [B

    .line 571
    .local v8, "smsc":[B
    const-string v0, "pdu"

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    move-object v7, v0

    check-cast v7, [B

    .line 572
    .local v7, "pdu":[B
    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 578
    .local v5, "reply":Landroid/os/Message;
    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->isIms()Z

    move-result v0

    if-nez v0, :cond_4

    .line 579
    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    if-lez v0, :cond_2

    .line 583
    aget-byte v0, v7, v2

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v1, :cond_2

    .line 584
    aget-byte v0, v7, v2

    or-int/lit8 v0, v0, 0x4

    int-to-byte v0, v0

    aput-byte v0, v7, v2

    .line 585
    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    int-to-byte v0, v0

    aput-byte v0, v7, v1

    .line 588
    :cond_2
    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mRetryCount:I

    if-nez v0, :cond_3

    iget-boolean v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mExpectMore:Z

    if-eqz v0, :cond_3

    .line 589
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {v8}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {v7}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, v5}, Lcom/android/internal/telephony/CommandsInterface;->sendSMSExpectMore(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0

    .line 592
    :cond_3
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {v8}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {v7}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, v5}, Lcom/android/internal/telephony/CommandsInterface;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0

    .line 596
    :cond_4
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {v8}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {v7}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    iget v3, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    iget v4, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mMessageRef:I

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->sendImsGsmSms(Ljava/lang/String;Ljava/lang/String;IILandroid/os/Message;)V

    .line 601
    iget v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;->mImsRetry:I

    goto/16 :goto_0
.end method

.method protected sendText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/net/Uri;Ljava/lang/String;IZI)V
    .locals 28
    .param p1, "destAddr"    # Ljava/lang/String;
    .param p2, "scAddr"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "messageUri"    # Landroid/net/Uri;
    .param p7, "callingPkg"    # Ljava/lang/String;
    .param p8, "priority"    # I
    .param p9, "isExpectMore"    # Z
    .param p10, "validityPeriod"    # I

    .prologue
    .line 447
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v7, "KREncodingScheme"

    invoke-static {v6, v7}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move-object/from16 v12, p6

    move-object/from16 v13, p7

    move/from16 v14, p9

    move/from16 v15, p10

    .line 448
    invoke-direct/range {v6 .. v15}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendTextForKREncoding(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/net/Uri;Ljava/lang/String;ZI)V

    .line 532
    :goto_0
    return-void

    .line 454
    :cond_0
    const/4 v11, 0x0

    .line 455
    .local v11, "encoding":I
    const-string v6, "persist.gsm.sms.forcegsm7"

    const-string v7, "1"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 456
    .local v23, "encodingType":Ljava/lang/String;
    const-string v6, "0"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    .line 458
    .local v24, "force7bit":Z
    new-instance v22, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    invoke-direct/range {v22 .. v22}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 459
    .local v22, "encodingForParts":Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    move-object/from16 v0, p3

    move/from16 v1, v24

    invoke-static {v0, v1}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->calculateLGLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v20

    .line 461
    .local v20, "details":Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    move-object/from16 v0, v20

    iget v6, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    if-eq v11, v6, :cond_2

    if-eqz v11, :cond_1

    const/4 v6, 0x1

    if-ne v11, v6, :cond_2

    .line 464
    :cond_1
    move-object/from16 v0, v20

    iget v11, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    .line 467
    :cond_2
    move-object/from16 v22, v20

    .line 474
    sget v6, Lcom/android/internal/telephony/SMSDispatcherEx;->vp:I

    if-lez v6, :cond_3

    .line 475
    sget v6, Lcom/android/internal/telephony/SMSDispatcherEx;->vp:I

    invoke-static {v6}, Lcom/android/internal/telephony/gsm/SmsMessage;->setValidityPeriod(I)V

    .line 479
    :cond_3
    new-instance v26, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct/range {v26 .. v26}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 481
    .local v26, "smsHeader":Lcom/android/internal/telephony/SmsHeader;
    const/4 v6, 0x1

    if-ne v11, v6, :cond_4

    move-object/from16 v0, v22

    iget v6, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_4

    .line 482
    move-object/from16 v0, v22

    iget v6, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    move-object/from16 v0, v26

    iput v6, v0, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 483
    move-object/from16 v0, v22

    iget v6, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    move-object/from16 v0, v26

    iput v6, v0, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 489
    :cond_4
    new-instance v25, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct/range {v25 .. v25}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 491
    .local v25, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    move-object/from16 v0, v22

    iget v6, v0, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_8

    .line 492
    if-eqz p5, :cond_7

    const/4 v9, 0x1

    :goto_1
    invoke-static/range {v26 .. v26}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v10

    move-object/from16 v0, v26

    iget v12, v0, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    move-object/from16 v0, v26

    iget v13, v0, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    move-object/from16 v6, p2

    move-object/from16 v7, p1

    move-object/from16 v8, p3

    invoke-static/range {v6 .. v13}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v25

    .line 501
    :goto_2
    const/16 v21, 0x0

    .line 504
    .local v21, "doNotWriteMessage":Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v7, "allow_sending_MBP_directed_sms"

    invoke-static {v6, v7}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 505
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->isDTAGsMobileBoxProApp()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->isDTAGsMobileBoxProServer(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 506
    const-string v6, "MobilBoxPro message should not be saved"

    invoke-static {v6}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    .line 507
    const/16 v21, 0x1

    .line 512
    :cond_5
    if-eqz v25, :cond_c

    .line 513
    if-nez p6, :cond_b

    .line 514
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    move-object/from16 v0, p7

    invoke-static {v0, v6}, Lcom/android/internal/telephony/SmsApplication;->shouldWriteMessageForPackage(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_6

    if-nez v21, :cond_6

    .line 515
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSubId()J

    move-result-wide v14

    if-eqz p5, :cond_a

    const/16 v18, 0x1

    :goto_3
    move-object/from16 v13, p0

    move-object/from16 v16, p1

    move-object/from16 v17, p3

    move-object/from16 v19, p7

    invoke-virtual/range {v13 .. v19}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->writeOutboxMessage(JLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/net/Uri;

    move-result-object p6

    .line 525
    :cond_6
    :goto_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v13

    .line 526
    .local v13, "map":Ljava/util/HashMap;
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getFormat()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v12, p0

    move-object/from16 v14, p4

    move-object/from16 v15, p5

    move-object/from16 v17, p6

    move/from16 v18, p9

    move/from16 v19, p10

    invoke-virtual/range {v12 .. v19}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTracker(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Landroid/net/Uri;ZI)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v27

    .line 528
    .local v27, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    goto/16 :goto_0

    .line 492
    .end local v13    # "map":Ljava/util/HashMap;
    .end local v21    # "doNotWriteMessage":Z
    .end local v27    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :cond_7
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 496
    :cond_8
    if-eqz p5, :cond_9

    const/4 v6, 0x1

    :goto_5
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move/from16 v3, p10

    invoke-static {v0, v1, v2, v6, v3}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v25

    goto/16 :goto_2

    :cond_9
    const/4 v6, 0x0

    goto :goto_5

    .line 515
    .restart local v21    # "doNotWriteMessage":Z
    :cond_a
    const/16 v18, 0x0

    goto :goto_3

    .line 523
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSubId()J

    move-result-wide v6

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    move-object/from16 v2, p7

    invoke-virtual {v0, v6, v7, v1, v2}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->moveToOutbox(JLandroid/net/Uri;Ljava/lang/String;)V

    goto :goto_4

    .line 530
    :cond_c
    const-string v6, "sendText(), sendText failed : pdu is null"

    invoke-static {v6}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method protected sendTextLge(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/String;IIIZ)V
    .locals 12
    .param p1, "destAddr"    # Ljava/lang/String;
    .param p2, "scAddr"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "sentIntent"    # Landroid/app/PendingIntent;
    .param p5, "deliveryIntent"    # Landroid/app/PendingIntent;
    .param p6, "callingPkg"    # Ljava/lang/String;
    .param p7, "replyAddr"    # Ljava/lang/String;
    .param p8, "confirmRead"    # I
    .param p9, "replyOption"    # I
    .param p10, "protocolId"    # I
    .param p11, "isExpectMore"    # Z

    .prologue
    .line 182
    const-string v2, "sendTextLge(), GsmSMSDispatcher > sendTextLge"

    invoke-static {v2}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->v(Ljava/lang/String;)I

    .line 186
    iget-object v2, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    const-string v4, "KREncodingScheme"

    invoke-static {v2, v4}, Lcom/android/internal/telephony/lgeautoprofiling/LgeAutoProfiling;->isSupportedFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x1

    if-ne v2, v4, :cond_3

    .line 188
    const-string v2, "sendTextLge(), GsmSMSDispatcher > sendTextLge > ModelConfig.COUNTRY_KR"

    invoke-static {v2}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->v(Ljava/lang/String;)I

    .line 190
    move/from16 v0, p9

    invoke-direct {p0, p1, v0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->replyOptionDestnationNumber(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    if-eqz p5, :cond_1

    const/4 v5, 0x1

    :goto_0
    move/from16 v0, p8

    move-object/from16 v1, p7

    invoke-static {v0, v1}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->makeSmsHeader(ILjava/lang/String;)[B

    move-result-object v6

    const/16 v2, 0x4f

    move/from16 v0, p10

    if-ne v0, v2, :cond_2

    const/4 v7, 0x2

    :goto_1
    move-object v2, p2

    move-object v4, p3

    move/from16 v8, p10

    invoke-static/range {v2 .. v8}, Lcom/android/internal/telephony/gsm/LGGsmSmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v10

    .line 198
    .local v10, "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :goto_2
    if-eqz v10, :cond_6

    .line 199
    const/4 v7, 0x0

    .line 200
    .local v7, "messageUri":Landroid/net/Uri;
    iget-object v2, p0, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->mContext:Landroid/content/Context;

    move-object/from16 v0, p6

    invoke-static {v0, v2}, Lcom/android/internal/telephony/SmsApplication;->shouldWriteMessageForPackage(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 201
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSubId()J

    move-result-wide v4

    if-eqz p5, :cond_5

    const/4 v8, 0x1

    :goto_3
    move-object v3, p0

    move-object v6, p1

    move-object v7, p3

    move-object/from16 v9, p6

    invoke-virtual/range {v3 .. v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->writeOutboxMessage(JLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/net/Uri;

    .end local v7    # "messageUri":Landroid/net/Uri;
    move-result-object v7

    .line 208
    .restart local v7    # "messageUri":Landroid/net/Uri;
    :cond_0
    invoke-virtual {p0, p1, p2, p3, v10}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTrackerMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;)Ljava/util/HashMap;

    move-result-object v3

    .line 209
    .local v3, "map":Ljava/util/HashMap;
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getFormat()Ljava/lang/String;

    move-result-object v6

    const/4 v9, -0x1

    move-object v2, p0

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v8, p11

    invoke-virtual/range {v2 .. v9}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->getSmsTracker(Ljava/util/HashMap;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;Landroid/net/Uri;ZI)Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;

    move-result-object v11

    .line 211
    .local v11, "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/gsm/GsmSMSDispatcherEx;->sendRawPdu(Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;)V

    .line 218
    .end local v3    # "map":Ljava/util/HashMap;
    .end local v7    # "messageUri":Landroid/net/Uri;
    .end local v11    # "tracker":Lcom/android/internal/telephony/SMSDispatcher$SmsTracker;
    :goto_4
    return-void

    .line 190
    .end local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    :cond_2
    const/4 v7, 0x0

    goto :goto_1

    .line 195
    :cond_3
    if-eqz p5, :cond_4

    const/4 v2, 0x1

    :goto_5
    invoke-static {p2, p1, p3, v2}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v10

    .restart local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    goto :goto_2

    .end local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_4
    const/4 v2, 0x0

    goto :goto_5

    .line 201
    .restart local v7    # "messageUri":Landroid/net/Uri;
    .restart local v10    # "pdu":Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_5
    const/4 v8, 0x0

    goto :goto_3

    .line 213
    .end local v7    # "messageUri":Landroid/net/Uri;
    :cond_6
    const-string v2, "sendTextLge(), sendTextLge failed : pdu is null"

    invoke-static {v2}, Lcom/android/internal/telephony/lgeautoprofiling/LGSmsLog;->d(Ljava/lang/String;)I

    .line 215
    const/4 v2, 0x3

    move-object/from16 v0, p4

    invoke-static {v0, v2}, Landroid/telephony/SmsManager;->sendExceptionbySentIntent(Landroid/app/PendingIntent;I)V

    goto :goto_4
.end method