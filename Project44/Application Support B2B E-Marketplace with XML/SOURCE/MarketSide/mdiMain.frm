VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.MDIForm mdiMain 
   BackColor       =   &H8000000C&
   Caption         =   "Marketplace Application"
   ClientHeight    =   6885
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   13245
   Icon            =   "mdiMain.frx":0000
   LinkTopic       =   "MDIForm1"
   MouseIcon       =   "mdiMain.frx":164A
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer TimerCount 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   360
      Top             =   2160
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   3480
      Top             =   1440
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2520
      Top             =   1320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock winsockSend 
      Left            =   1800
      Top             =   1320
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   360
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   11
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":1954
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":1DA6
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":21F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":264A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":2A9C
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":2EEE
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":4548
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":5BA2
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":BA41
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":E052
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":E1AC
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   6510
      Width           =   13245
      _ExtentX        =   23363
      _ExtentY        =   661
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSWinsockLib.Winsock winsockMain 
      Left            =   1080
      Top             =   1320
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.Toolbar ToolbarMain 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   13245
      _ExtentX        =   23363
      _ExtentY        =   1164
      ButtonWidth     =   1032
      ButtonHeight    =   1005
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   16
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Listen"
            Object.ToolTipText     =   "Begin to wait for request from client"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Stop"
            Object.ToolTipText     =   "Stop to accept all request from client"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Reset"
            Object.ToolTipText     =   "Reset Socket"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Event"
            Object.ToolTipText     =   "Show Event"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "sendFile"
            Object.ToolTipText     =   "Send Selection File to Member"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EnableQ"
            Object.ToolTipText     =   "Enable Message Queue"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "DisableQ"
            Object.ToolTipText     =   "Disable Message Queue"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Monthly"
            Object.ToolTipText     =   "Monthly Payment"
            ImageIndex      =   8
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PartnerPayment"
            Object.ToolTipText     =   "Monthly Partner Payment"
            ImageIndex      =   9
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Query"
            Object.ToolTipText     =   "Query Function"
            ImageIndex      =   10
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "AdminQuery"
            Object.ToolTipText     =   "SQL Query Statement"
            ImageIndex      =   11
         EndProperty
      EndProperty
      MousePointer    =   99
      MouseIcon       =   "mdiMain.frx":E306
      Begin VB.PictureBox Picture1 
         Height          =   615
         Left            =   13560
         Picture         =   "mdiMain.frx":E620
         ScaleHeight     =   555
         ScaleWidth      =   1755
         TabIndex        =   2
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.Menu mnuAppl 
      Caption         =   "&Application"
      Begin VB.Menu mnuApplListen 
         Caption         =   "Listen"
      End
      Begin VB.Menu mnuApplStopListen 
         Caption         =   "Stop Request"
      End
      Begin VB.Menu mnuApplReset 
         Caption         =   "Reset Socket"
      End
      Begin VB.Menu mnuAppCloseConn 
         Caption         =   "Close Connection"
      End
      Begin VB.Menu mnuAppResume 
         Caption         =   "Resume"
      End
      Begin VB.Menu Seperator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAppENQ 
         Caption         =   "Enable Queue"
      End
      Begin VB.Menu mnuAppDSQ 
         Caption         =   "Disable Queue"
      End
      Begin VB.Menu Seperator4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuApplExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuClear 
      Caption         =   "&Clear"
      Begin VB.Menu mnuClearEvent 
         Caption         =   "Event"
      End
      Begin VB.Menu mnuClearRecvFiles 
         Caption         =   "Receive Fiels"
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "&View"
      Begin VB.Menu mnuViewEvent 
         Caption         =   "Event"
      End
      Begin VB.Menu mnuViewRecvFiles 
         Caption         =   "Display Receive Files"
      End
      Begin VB.Menu mnuViewStatus 
         Caption         =   "File Status"
      End
   End
   Begin VB.Menu mnuOpr 
      Caption         =   "&Operation"
      Begin VB.Menu mnuOprSend 
         Caption         =   "Send File"
      End
      Begin VB.Menu mnuOprSignDlg 
         Caption         =   "Sign Dialog"
      End
      Begin VB.Menu Seperator2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOprParseXML 
         Caption         =   "Parse XML"
      End
      Begin VB.Menu mnuOptGenKey 
         Caption         =   "Generate Key"
      End
      Begin VB.Menu mnuOprSign 
         Caption         =   "Sign File"
      End
      Begin VB.Menu mnuOprValid 
         Caption         =   "Validate File"
      End
      Begin VB.Menu mnuOprEnc 
         Caption         =   "Encrypt File"
      End
      Begin VB.Menu mnuOprDec 
         Caption         =   "Decrypt File"
      End
      Begin VB.Menu Seperator3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOprGetUserID 
         Caption         =   "Get Remote User ID"
      End
   End
   Begin VB.Menu mnuPR 
      Caption         =   "P.R."
      Begin VB.Menu mnuPRGen 
         Caption         =   "Generate P.R."
      End
      Begin VB.Menu mnuPRPRNO 
         Caption         =   "Receive P.R. No."
      End
      Begin VB.Menu mnuPRReject 
         Caption         =   "Receive Reject P.R."
      End
   End
   Begin VB.Menu mnuPO 
      Caption         =   "P.O."
      Begin VB.Menu mnuPORecvPO 
         Caption         =   "Receive P.O."
      End
      Begin VB.Menu mnuPORecvOrderNo 
         Caption         =   "Receive Order No."
      End
      Begin VB.Menu mnuPOAccept 
         Caption         =   "Receive Accept P.O."
      End
      Begin VB.Menu mnuPOReject 
         Caption         =   "Receive Reject P.O."
      End
   End
   Begin VB.Menu mnuIV 
      Caption         =   "Invoice"
      Begin VB.Menu mnuIVRecvIV 
         Caption         =   "Receive Invoice"
      End
      Begin VB.Menu mnuIVConfirm 
         Caption         =   "Receive Confirm Invoice"
      End
      Begin VB.Menu mnuIVAccept 
         Caption         =   "Receive Accept Invoice"
      End
      Begin VB.Menu mnuIVReject 
         Caption         =   "Receive Reject Invoice"
      End
   End
   Begin VB.Menu mnuMonthly 
      Caption         =   "Monthly Payment"
      Begin VB.Menu mnuMonthlyMarket 
         Caption         =   "Market Monthly Payment"
      End
      Begin VB.Menu mnuMonthlyPartner 
         Caption         =   "Partner Monthly Payment"
      End
   End
   Begin VB.Menu mnuQuery 
      Caption         =   "Query"
      Begin VB.Menu mnuQueryFunction 
         Caption         =   "Query Function"
      End
      Begin VB.Menu mnuQuerySQL 
         Caption         =   "SQL Query Statement"
      End
   End
   Begin VB.Menu mnuSetting 
      Caption         =   "&Setting"
      Begin VB.Menu mnuSetSocket 
         Caption         =   "Socket"
      End
      Begin VB.Menu mnuSetKeyRing 
         Caption         =   "Key Ring"
      End
   End
   Begin VB.Menu mnuLogFile 
      Caption         =   "&Log File"
      Begin VB.Menu mnuLogView 
         Caption         =   "View Log File"
      End
      Begin VB.Menu mnuLogClear 
         Caption         =   "Clear Log File"
      End
      Begin VB.Menu mnuLogBackup 
         Caption         =   "Backup Log File"
      End
   End
End
Attribute VB_Name = "mdiMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Dim TCount As Integer

Dim mode As Integer     '0 for wait for request         1 for send file        2 for test connection
'Dim display As Boolean
Dim IntNextFreeFile As Integer
Dim FileTp
Dim SrcFile As String
Dim sendMode As Integer '0 for send file        1 for get remote user id        2 send file automatic           3 for double send
Dim que As Queue
Public decFile As String
Public valFile As String
Public tsFile As String

Public imgType As Integer


Private Sub MDIForm_Load()
        LocalPort = "9987"
        
        conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\KeyRing.mdb;Persist Security Info=False"
        
        'DBconString = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=Marketplace;Data Source=MARKET"
        DBconString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=Marketplace;Data Source=MARKET"
        LogFileName = App.Path & "\Log.txt"
        MarketID = "market"
        PrivateKeyFile = ""
        
        'display = False
        TCount = 0
        winsockMain.Protocol = sckTCPProtocol
        winsockSend.Protocol = sckTCPProtocol
        
        sendMode = 0
        mnuApplListen.Enabled = True
        ToolbarMain.Buttons("Listen").Enabled = True
        mnuApplStopListen.Enabled = False
        ToolbarMain.Buttons("Stop").Enabled = False
        mnuAppENQ.Enabled = True
        ToolbarMain.Buttons("EnableQ").Enabled = True
        mnuAppDSQ.Enabled = False
        ToolbarMain.Buttons("DisableQ").Enabled = False
        mode = 0
        frmKeyRing.Show
        Set que = New Queue
        que.SetConnectionString = DBconString
        
        StatusOpen = False
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
        If winsockMain.State <> sckClosed Then
                winsockSend.Close
        End If
        If winsockSend.State <> sckClosed Then
                winsockSend.Close
        End If
        Set que = Nothing
End Sub

Private Sub mnuAppCloseConn_Click()
    TimerCount.Enabled = False
    winsockSend.Close
End Sub

Private Sub mnuAppDSQ_Click()
        DisableQueue
        
         mnuAppENQ.Enabled = True
        ToolbarMain.Buttons("EnableQ").Enabled = True
        mnuAppDSQ.Enabled = False
        ToolbarMain.Buttons("DisableQ").Enabled = False
End Sub

Private Sub mnuAppENQ_Click()
        EnableQueue
        
        mnuAppENQ.Enabled = False
        ToolbarMain.Buttons("EnableQ").Enabled = False
        mnuAppDSQ.Enabled = True
        ToolbarMain.Buttons("DisableQ").Enabled = True
End Sub

Private Sub mnuApplExit_Click()
        Unload mdiMain
End Sub

Private Sub mnuApplListen_Click()
        winsockMain.LocalPort = LocalPort
        winsockMain.Listen
        mnuApplListen.Enabled = False
        ToolbarMain.Buttons("Listen").Enabled = False
        mnuApplStopListen.Enabled = True
        ToolbarMain.Buttons("Stop").Enabled = True
End Sub

Private Sub mnuApplReset_Click()
         If winsockMain.State <> sckClosed Then
                winsockMain.Close
        End If
        If winsockSend.State <> sckClosed Then
                MsgBox "It will reset send socket data in stream will be lost", vbInformation + vbOKOnly, "Warining"
                winsockSend.Close
        End If
         mnuApplListen.Enabled = True
        ToolbarMain.Buttons("Listen").Enabled = True
        mnuApplStopListen.Enabled = False
        ToolbarMain.Buttons("Stop").Enabled = False
End Sub

Private Sub mnuApplStopListen_Click()
        winsockMain.Close
        mnuApplListen.Enabled = True
        ToolbarMain.Buttons("Listen").Enabled = True
        mnuApplStopListen.Enabled = False
        ToolbarMain.Buttons("Stop").Enabled = False
End Sub

Private Sub mnuAppResume_Click()
    If winsockSend.State <> sckClosed Then winsockSend.Close
    WSSend 2
End Sub

Private Sub mnuClearEvent_Click()
        frmEvent.ClearEvent
End Sub

Private Sub mnuClearRecvFiles_Click()
        frmRecvFiles.Clear
End Sub

Private Sub mnuIVAccept_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
                 If RecvAcceptIV(CommonDialog1.FileName) Then
                        Message "Receive Accept Invoice Complete"
                Else
                        Message "Receive Accept Invoice Error !!!"
                End If
    End If
End Sub

Private Sub mnuIVConfirm_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
     If CommonDialog1.FileName <> "" Then
                 If RecvIVRecv(CommonDialog1.FileName) Then
                        Message "Update Invoice Receive's Status Complete"
                  Else
                        Message "Update Invoice Receive's Status Error !!!"
                  End If
        End If
End Sub

Private Sub mnuIVRecvIV_Click()
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = "(*.xml)|*.xml"
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                If mdlXML.RecvInvoice(CommonDialog1.FileName) Then
                        Message "Receive Invoice Complete"
                        If mdlXML.GenInvoiceToBuyer(CommonDialog1.FileName, "") Then
                                Message "Gen Invoice To Buyer Complete"
                        Else
                                Message "Gen Invoice To Buyer Error !!!"
                        End If
                Else
                        Message "Receive Invoice Error !!!"
                End If
        End If
End Sub

Private Sub mnuIVReject_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
                 If RecvRejectIV(CommonDialog1.FileName) Then
                        Message "Receive Reject Invoice Complete"
                Else
                        Message "Receive Reject Invoice Error !!!"
                End If
    End If
End Sub

Private Sub mnuLogBackup_Click()
        CommonDialog1.FileName = ""
        CommonDialog1.Flags = cdlOFNPathMustExist
        CommonDialog1.ShowSave
        If CommonDialog1.FileName <> "" Then
                LogFile.CopyLog CommonDialog1.FileName
        End If
End Sub

Private Sub mnuLogClear_Click()
        LogFile.ClearLog
End Sub

Private Sub mnuLogView_Click()
         Shell App.Path & "\notepad.exe " & LogFileName, vbNormalFocus
End Sub


Private Sub mnuMonthlyMarket_Click()
                 frmMPayment.Show
End Sub

Private Sub mnuMonthlyPartner_Click()
        frmPartnerPayment.Show
End Sub

Private Sub mnuOprDec_Click()
        'Decrypt function
         Dim fso As FileSystemObject
         Dim txt As TextStream
         Dim txt2 As TextStream
         Dim dest As String
         
         CommonDialog1.FileName = ""
         CommonDialog1.ShowOpen
         If CommonDialog1.FileName <> "" Then
                 SrcFile = CommonDialog1.FileName
                 
                 Set fso = New FileSystemObject
                 dest = Left$(SrcFile, Len(SrcFile) - 4) & "DEC" & Right$(SrcFile, 4)
                
                If fso.FileExists(SrcFile) Then
                                On Error GoTo msgerr
                                Set txt = fso.OpenTextFile(SrcFile, ForReading)
                                Set txt2 = fso.CreateTextFile(dest, True)
                               If PrivateKeyFile = "" Then
                                        Message "Please Setting Private Key File in Manage Key Ring Before Encrypt"
                                Else
                                                ImportKey PrivateKeyFile
                                                KeyID = ""
                                                txt2.Write dec(txt.ReadAll, UseKey, N)
                                                If flag Then
                                                        Message "Decrypt File Complete"
                                                Else
                                                        delFile dest
                                                End If
                                End If
                                txt.Close
                                txt2.Close
                End If
                Set fso = Nothing
        End If
Exit Sub
msgerr:
        Message Error$
End Sub

Private Sub mnuOprEnc_Click()
  '     Encrypt function
        CommonDialog1.FileName = ""
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                If Userid = "" Then
                        Message "Please Set UserID in KeyRing Before Encrypt"
                Else
                        SrcFile = CommonDialog1.FileName
                        Dim dest As String
                        Dim fso As FileSystemObject
                        Dim txt As TextStream
                        Dim txt2 As TextStream
                        Set fso = New FileSystemObject
                                       
                        dest = Left$(SrcFile, Len(SrcFile) - 4) & "ENC" & Right$(SrcFile, 4)
                        
                        If fso.FileExists(SrcFile) Then
                                        On Error GoTo msgerr
                                Set txt = fso.OpenTextFile(SrcFile, ForReading)
                                Set txt2 = fso.CreateTextFile(dest, True)
                                
                                KeyID = ""
                                SearchPublicKey Userid
                                txt2.Write enc(txt.ReadAll, UseKey, N)
                                Message "Encrypt File Complete"
                                txt.Close
                                txt2.Close
                        End If
                        Set fso = Nothing
                End If
        End If
Exit Sub
msgerr:
End Sub

Private Sub mnuOprGetUserID_Click()
        dlgRemote.Show vbModal
        If (remoteIP <> "") And (remotePort <> "") Then
                If winsockSend.State <> sckClosed Then winsockSend.Close
                        winsockSend.Connect remoteIP, remotePort
                        sendMode = 1
                        'display = True
        End If
End Sub

Private Sub mnuOprParseXML_Click()
        Dim dom As DOMDocument30
        
        CommonDialog1.Flags = cdlOFNFileMustExist
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = "(*.xml)|*.xml"
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                Set dom = New DOMDocument30
                dom.async = False
                dom.validateOnParse = True
                dom.Load CommonDialog1.FileName
                If dom.parseError.errorCode = 0 Then
                        MsgBox "Parse XML Complete" & vbCrLf & "No Error", vbInformation + vbOKOnly, "Parse XML"
                Else
                        MsgBox "Parse XML Error On Line " & dom.parseError.Line & vbCrLf & _
                                         "Source : " & dom.parseError.srcText & vbCrLf & _
                                         "Reason : " & dom.parseError.reason, vbExclamation + vbOKOnly, "Parse XML"
                End If
        End If
End Sub


Private Sub mnuOprSend_Click()
       Dim uid As String
        uid = InputBox("Enter User ID Which you want to send to", "Sent TO")
        If uid <> "" Then
            If searchIP_PortfromUID(uid) Then
                If winsockSend.State <> sckClosed Then winsockSend.Close
                sendMode = 0
                winsockSend.Connect remoteIP, remotePort
            Else
                MsgBox "Incorrect User ID"
            End If
        End If
End Sub

Private Sub mnuOprSign_Click()
         'Sign function
        Dim datestr As String
        Dim dest As String
        CommonDialog1.FileName = ""
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                SrcFile = CommonDialog1.FileName
                If PrivateKeyFile = "" Then
                                MsgBox "Please Select Private Key File in Setting Key Ring Beffore sign"
                ElseIf MarketID = "" Then
                                MsgBox "Please Enter Market ID in Setting Key Ring Before sign"
                Else
                                dest = Left$(SrcFile, Len(SrcFile) - 4) & "SIGN" & Right$(SrcFile, 4)
                                datestr = Format$(Now, "Short Date")
                                ImportKey PrivateKeyFile
                                KeyID = ""
                                'If optSha1.value Then
                                        Sha1SignFile "", MarketID, datestr, SrcFile, dest, UseKey, N
                                'ElseIf optMD5.value Then
                                '        MD5SignFile "", UserID, lblDateCreate.Caption, txtSource.Text, txtDest.Text, UseKey, N
                                'End If
                                MsgBox "Sign File Already"
                End If
        End If
End Sub

Private Sub mnuOprSignDlg_Click()
        frmSign.Show
End Sub

Private Sub mnuOprValid_Click()
        'valid function
        Dim fso As FileSystemObject
        Dim dest As String
        CommonDialog1.FileName = ""
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                SrcFile = CommonDialog1.FileName
                Set fso = New FileSystemObject
                 dest = Left$(SrcFile, Len(SrcFile) - 4) & "Valid" & Right$(SrcFile, 4)
                If fso.FileExists(SrcFile) Then
                        'SearchPublicKey UserID
                        ValidateFile SrcFile, dest
                Else
                        MsgBox "Source File does not Exist"
                End If
        End If
End Sub

Private Sub mnuOptGenKey_Click()
        CommonDialog1.Flags = cdlOFNFileMustExist
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = ""
        CommonDialog1.ShowSave
        If CommonDialog1.FileName <> "" Then
                GenKey (CommonDialog1.FileName)
        End If
End Sub



Private Sub mnuPOAccept_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
                If RecvAcceptPO(CommonDialog1.FileName) Then
                        Message "Receive Accept PO Complete"
                Else
                        Message "Receive Accept PO Error !!!"
                End If
    End If
End Sub

Private Sub mnuPORecvOrderNo_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
               If mdlXML.RecvOrderNo(CommonDialog1.FileName) Then
                        Message "Receive OrderNo & Update Data Complete"
                Else
                        Message "Recv OrderNo and Update Data Error !!!"
                End If
    End If
End Sub

Private Sub mnuPORecvPO_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
        If mdlXML.ReceivePO(CommonDialog1.FileName) Then
                Message "Update P.O. complete"
                If genPOtoSeller(CommonDialog1.FileName, "") Then
                        Message "Prepare PO to Seller Complete"
                Else
                        Message "Prepare PO to Seller Error!!!"
                End If
        Else
            Message "Accept P.R. Error"
        End If
    End If
End Sub

Private Sub mnuPOReject_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
                 If RecvRejectPO(CommonDialog1.FileName) Then
                        Message "Receive Reject PO Complete"
                Else
                        Message "Receive Reject PO Error !!!"
                End If
    End If
End Sub

Private Sub mnuPRGen_Click()
        Dim prid As String
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim memberID As String
    
        prid = InputBox("Enter PRID")
        If prid <> "" Then
                    Set conn = New ADODB.Connection
                    Set rcs = New ADODB.Recordset
                    conn.ConnectionString = DBconString
                    conn.CursorLocation = adUseClient
                    conn.Open
                    rcs.Open "select buyerid from PR where prid = " & prid, conn, 1, 3
                    If rcs.RecordCount > 0 Then
                            memberID = rcs!buyerID
                            If mdlXML.GenPR(CLng(prid), "") Then
                                                Message "Generate P.R. Complete"
                                    
                                    'connect
                                     If winsockSend.State <> sckClosed Then winsockSend.Close
                                    mdlOperation.SetParameterByMemberID memberID
                                    sendMode = 2
                                    winsockSend.Connect remoteIP, remotePort
                            Else
                                                Message "Generate P.R. Error"
                            End If
                    Else
                                        Message "Cannot Find This PRID in database"
                    End If
                    rcs.Close
                    conn.Close
                    Set rcs = Nothing
                    Set conn = Nothing
        End If
End Sub

Private Sub mnuPRPRNO_Click()
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = "(*.xml)|*.xml"
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
            If mdlXML.ConfirmPR(CommonDialog1.FileName) Then
                                Message "Received & Update P.R. Confirm Complete"
            Else
                                Message "Received P.R. Comfirm error"
            End If
        End If
End Sub

Private Sub mnuPRReject_Click()
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
        If mdlXML.RecvRejectPR(CommonDialog1.FileName) Then
                        Message "Update Reject P.R. complete"
          Else
                        Message "Reject P.R. Error"
          End If
    End If
End Sub

Private Sub mnuQueryFunction_Click()
        frmQueryFunct.Show
End Sub

Private Sub mnuQuerySQL_Click()
        frmQueryAdmin.Show
End Sub

Private Sub mnuSetKeyRing_Click()
    frmKeyRing.Show
End Sub

Private Sub mnuSetSocket_Click()
     frmSetting.Show
End Sub

Private Sub mnuViewEvent_Click()
        frmEvent.Show
End Sub


Private Sub mnuViewRecvFiles_Click()
        frmRecvFiles.Show
End Sub

Private Sub mnuViewStatus_Click()
        frmStatus.Show
End Sub

Private Sub Timer1_Timer()
        If que.CheckMessage Then
                Timer1.Enabled = False
                Do While que.EndQueue
                        Dim prid As String
                        Dim conn As ADODB.Connection
                        Dim rcs As ADODB.Recordset
                        Dim memberID As String
                        
                        prid = que.GetMessage
                       
                        If prid <> "" Then
                                    Set conn = New ADODB.Connection
                                    Set rcs = New ADODB.Recordset
                                    conn.ConnectionString = DBconString
                                    conn.CursorLocation = adUseClient
                    
                                    conn.Open
                                    rcs.Open "select buyerid from PR where prid = " & prid, conn, 1, 3
                                    If rcs.RecordCount > 0 Then
                                            memberID = rcs!buyerID
                                            If mdlXML.GenPR(CLng(prid), "") Then
                                                                Message ""
                                                                Message "Generate P.R. Complete : P.R. ID : " & prid
                                                    
                                                    'connect
                                                     If winsockSend.State <> sckClosed Then winsockSend.Close
                                                    mdlOperation.SetParameterByMemberID memberID
                                                    
                                                    WSSend 2
                                            Else
                                                                Message "Generate P.R. Error"
                                            End If
                                    Else
                                                        Message "Cannot Find This PRID in database"
                                    End If
                                    rcs.Close
                                    conn.Close
                                    Set rcs = Nothing
                                    Set conn = Nothing
                                    
                                    que.RemoveQueue
                        Else
                                'Message "PRID Empty or Queue Empty"
                        End If
                Loop
                Timer1.Enabled = True
        End If
End Sub

Private Sub TimerCount_Timer()
    If TCount > 5 Then
        If winsockSend.State <> sckClosed Then winsockSend.Close
        Sleep 3000
        WSSend 2
        TCount = 0
    End If
    TCount = TCount + 1
End Sub

Private Sub ToolbarMain_ButtonClick(ByVal Button As MSComctlLib.Button)
        Select Case Button.index
                Case 1
                        mnuApplListen_Click
                Case 2
                        mnuApplStopListen_Click
                Case 3
                        mnuApplReset_Click
                Case 5
                        mnuViewEvent_Click
                Case 7
                        mnuOprSend_Click
                Case 9
                        mnuAppENQ_Click
                Case 10
                        mnuAppDSQ_Click
                Case 12
                        mnuMonthlyMarket_Click
                Case 13
                        mnuMonthlyPartner_Click
                Case 15
                        mnuQueryFunction_Click
                Case 16
                        mnuQuerySQL_Click
        End Select
End Sub

Private Sub winsockMain_ConnectionRequest(ByVal requestID As Long)
        If winsockMain.State <> sckClosed Then winsockMain.Close
        winsockMain.Accept requestID
        mode = 0
End Sub

Private Sub winsockMain_DataArrival(ByVal bytesTotal As Long)
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim datestr As String
        Dim strNew As String
        Dim pos As Integer
        Dim pos1 As Integer
        
        Dim img As Integer
        Dim key As String
        
    If winsockMain.State = sckConnected Then
        winsockMain.GetData strNew, vbString
        If mode = 0 Then
                If Left$(strNew, Len(GetUserID)) = GetUserID Then
                        pos1 = InStr(Len(GetUserID), strNew, DestBegin)
                        If pos1 < 0 Then
                                Message "Remote User ID Error"
                        Else
                                Userid = Mid$(strNew, Len(GetUserID) + 1, pos1 - Len(GetUserID) - 1)
                                mode = 1
                                'winsockMain.GetData strNew, vbString
                                pos = InStr(pos1 + Len(DestBegin), strNew, vbCrLf)
                                If pos <= 0 Then
                                        Message "Destination file to save error"
                                Else
                                        FileName = Mid$(strNew, pos1 + Len(DestBegin), pos - pos1 - Len(DestBegin))
                                        pos1 = InStr(pos + Len(FileType) + 1, strNew, vbCrLf)
                                        If pos1 <= 0 Then
                                                Message "File Type Receive Error"
                                        Else
                                                FileTp = Mid$(strNew, pos + Len(FileType) + 2, pos1 - pos - Len(FileType) - 2)
                                                Select Case FileTp
                                                        Case ftPO
                                                                'FileName = App.Path & POdir & "\" & FileName
                                                                FileName = App.Path & TmpFileDir & "\" & FileName
                                                        Case ftPR
                                                                'FileName = App.Path & PRdir & "\" & FileName
                                                                FileName = App.Path & TmpFileDir & "\" & FileName
                                                        Case ftInvoice
                                                                'FileName = App.Path & IVdir & "\" & FileName
                                                                FileName = App.Path & TmpFileDir & "\" & FileName
                                                        Case ftTS
                                                                FileName = App.Path & TmpFileDir & "\" & FileName
                                                        Case Else
                                                                FileName = App.Path & Otherdir & "\" & FileName
                                                End Select
                                                
                                                SrcFile = FileName
                                                
                                                'Set fso = New FileSystemObject
                                                'If fso.FileExists(FileName) Then
                                                 '       fso.DeleteFile FileName
                                                'End If
                                                'Set fso = Nothing
                                                
                                                IntNextFreeFile = FreeFile
                                                Open FileName For Binary Access Write As #IntNextFreeFile
                                                Put #IntNextFreeFile, , Right$(strNew, Len(strNew) - pos1 - 1)
                                                
                                                '------------- add log ----------------
                                                Message ""
                                                Message "Connect From : " & Userid
                                                Message "File Receive : " & GetFileName(FileName)
                                                
                                                '------------------------------------------
                                        End If
                               End If
                        End If
                ElseIf strNew = strTestCon Then
                         mode = 2
                         winsockMain.SendData strTestCon
                Else
                          Message "data recieve error : Mode Not Define"
                End If
        ElseIf mode = 1 Then
                
                If EofFile = Right$(strNew, Len(EofFile)) Then
                        winsockMain.Close
                        winsockMain.LocalPort = LocalPort
                        winsockMain.Listen
                        mode = 0
                        Put #IntNextFreeFile, , Left$(strNew, Len(strNew) - Len(EofFile))
                        Close #IntNextFreeFile
                        
                        'Message "Receive File Complete"
                        If (FileTp = ftPO) Or (FileTp = ftPR) Or (FileTp = ftInvoice) Then
                                    Dim objxml As XML
                                    Dim dest As String
                                    Dim dest2 As String
                                    If mdlRecvXML.RecvXMLAll(SrcFile) Then
                                            Set objxml = New XML
                                            Set fso = New FileSystemObject
                                            objxml.getParameter valFile
                                            Select Case objxml.GetRootName
                                                Case "PO"
                                                    dest = App.Path & POdir
                                                     img = imgPO
                                                     
                                                     If objxml.getStatus = SReceive Then
                                                            TimerCount.Enabled = False
                                                     End If
                                                     
                                                     If StatusOpen Then
                                                                frmStatus.AddStatusRecvByUserID "PO", Userid
                                                     End If
                                                Case "PR"
                                                    dest = App.Path & PRdir
                                                    img = imgPR
                                                    
                                                    If objxml.getStatus = SConfirm Then
                                                            TimerCount.Enabled = False
                                                    End If
                                                     
                                                    If StatusOpen Then
                                                                frmStatus.AddStatusRecvByUserID "PR", Userid
                                                    End If
                                                Case "Invoice"
                                                    dest = App.Path & IVdir
                                                    img = imgIV
                                                    If StatusOpen Then
                                                                frmStatus.AddStatusRecvByUserID "IV", Userid
                                                     End If
                                             End Select
                                            Select Case objxml.getStatus
                                                Case SOpen
                                                    dest2 = dest & "\Open\" & GetFileName(valFile)
                                                    delFile dest2
                                                    fso.MoveFile valFile, dest2
                                                    valFile = dest2
                                                    
                                                    dest2 = dest & "\Open\" & GetFileName(decFile)
                                                    delFile dest2
                                                    fso.MoveFile decFile, dest2
                                                    decFile = dest2
                                                    
                                                    dest2 = dest & "\Open\" & GetFileName(SrcFile)
                                                    delFile dest2
                                                    fso.MoveFile SrcFile, dest2
                                                    SrcFile = dest2
                                                    
                                                    key = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree key, "", decFile, img
                                                    frmRecvFiles.AddChildTree key, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Open\" & GetFileName(valFile)
                                                
                                                 Case SConfirm
                                                    dest2 = dest & "\Confirm\" & GetFileName(valFile)
                                                    delFile dest2
                                                    fso.MoveFile valFile, dest2
                                                    valFile = dest2
                                                        
                                                    dest2 = dest & "\Confirm\" & GetFileName(decFile)
                                                    delFile dest2
                                                    fso.MoveFile decFile, dest2
                                                    decFile = dest2
                                                    
                                                    dest2 = dest & "\Confirm\" & GetFileName(SrcFile)
                                                    delFile dest2
                                                    fso.MoveFile SrcFile, dest2
                                                    SrcFile = dest2
                                                    
                                                    key = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree key, "", decFile, img
                                                    frmRecvFiles.AddChildTree key, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Confirm\" & GetFileName(valFile)
                                                Case SReject
                                                    dest2 = dest & "\Reject\" & GetFileName(valFile)
                                                    delFile dest2
                                                    fso.MoveFile valFile, dest2
                                                    valFile = dest2
                                                       
                                                    dest2 = dest & "\Reject\" & GetFileName(decFile)
                                                    delFile dest2
                                                    fso.MoveFile decFile, dest2
                                                    decFile = dest2
                                                    
                                                    dest2 = dest & "\Reject\" & GetFileName(SrcFile)
                                                    delFile dest2
                                                    fso.MoveFile SrcFile, dest2
                                                    SrcFile = dest2
                                                        
                                                    key = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree key, "", decFile, img
                                                    frmRecvFiles.AddChildTree key, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Reject\" & GetFileName(valFile)
                                                Case SSent
                                                    dest2 = dest & "\Open\" & GetFileName(valFile)
                                                    delFile dest2
                                                    fso.MoveFile valFile, dest2
                                                    valFile = dest2
                                                    
                                                    dest2 = dest & "\Open\" & GetFileName(decFile)
                                                    delFile dest2
                                                    fso.MoveFile decFile, dest2
                                                    decFile = dest2
                                                    
                                                    dest2 = dest & "\Open\" & GetFileName(SrcFile)
                                                    delFile dest2
                                                    fso.MoveFile SrcFile, dest2
                                                    SrcFile = dest2
                                                    
                                                    key = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree key, "", decFile, img
                                                    frmRecvFiles.AddChildTree key, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Open\" & GetFileName(valFile)
                                            
                                                Case SReceive
                                                    dest2 = dest & "\Receive\" & GetFileName(valFile)
                                                    delFile dest2
                                                    fso.MoveFile valFile, dest2
                                                    valFile = dest2
                                                         
                                                    dest2 = dest & "\Receive\" & GetFileName(decFile)
                                                    delFile dest2
                                                    fso.MoveFile decFile, dest2
                                                    decFile = dest2
                                                    
                                                    dest2 = dest & "\Receive\" & GetFileName(SrcFile)
                                                    delFile dest2
                                                    fso.MoveFile SrcFile, dest2
                                                    SrcFile = dest2
                                                    
                                                    key = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree key, "", decFile, img
                                                    frmRecvFiles.AddChildTree key, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Receive\" & GetFileName(valFile)
                                                    
                                                Case SAccept
                                                    dest2 = dest & "\Accept\" & GetFileName(valFile)
                                                    delFile dest2
                                                    fso.MoveFile valFile, dest2
                                                    valFile = dest2
                                                    
                                                    dest2 = dest & "\Accept\" & GetFileName(decFile)
                                                    delFile dest2
                                                    fso.MoveFile decFile, dest2
                                                    decFile = dest2
                                                    
                                                    dest2 = dest & "\Accept\" & GetFileName(SrcFile)
                                                    delFile dest2
                                                    fso.MoveFile SrcFile, dest2
                                                    SrcFile = dest2
                                                    
                                                    key = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree key, "", decFile, img
                                                    frmRecvFiles.AddChildTree key, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Accept\" & GetFileName(valFile)
                                            End Select
                                            Set objxml = Nothing
                                            Set fso = Nothing
                                                      
                                        '------------------ add log ----------------------
                                          Message "Receive File : " & GetFileName(SrcFile) & "  Complete"
                                         'Message ""
                                        '------------------------------------------------------
                                            
                                            Assign SrcFile
                                    
                                    End If
                                    
                        'Transaction File
                        ElseIf FileTp = ftTS Then
                                  If mdlRecvXML.DecryptFileOnly(SrcFile) Then
                                                Dim xmldoc As DOMDocument30
                                                Dim fs As FileSystemObject
                                                Dim dst As String
                                                Dim tsid As String
                                                Dim rcs As ADODB.Recordset
                                                Dim conn As ADODB.Connection
                                                Dim sql As String
                                                Dim TSstatus As String
                                                Dim buyerID As String
                                                Dim sellerID As String
                                                
                                                If StatusOpen Then
                                                                frmStatus.AddStatusRecvByUserID "TS", Userid
                                                End If
                                                
                                                Set fs = New FileSystemObject
                                                Set xmldoc = New DOMDocument30
                                                xmldoc.async = False
                                                xmldoc.validateOnParse = False
                                                xmldoc.Load decFile
                                                TSstatus = xmldoc.documentElement.firstChild.Attributes.getNamedItem("Status").Text
                                                
                                                If (xmldoc.documentElement.firstChild.nodeName = "TransactionPayment") _
                                                    And (TSstatus = SAccept) Then
                                                        dst = App.Path & TSdir & "\Buyer\" & GetFileName(SrcFile)
                                                        delFile dst
                                                        fs.MoveFile SrcFile, dst
                                                        SrcFile = dst
                                                                         
                                                        dst = App.Path & TSdir & "\Buyer\" & GetFileName(decFile)
                                                        delFile dst
                                                        fs.MoveFile decFile, dst
                                                        decFile = dst
                                                        
                                                        key = frmRecvFiles.AddRootTree_R("", decFile, imgTS)
                                                        frmRecvFiles.AddChildTree key, "", SrcFile, imgTS
                                                
                                                        SrcFile = dst
                                                        FileName = dst
                                                        
                                                        If mdlOperation.searchIP_PortfromUID("Bank") Then
                                                                'Message ""
                                                                WSSend 2
                                                        
                                                        Else
                                                                Message "Can not Find Bank Description in Key Ring"
                                                        End If
                                                ElseIf (xmldoc.documentElement.firstChild.nodeName = "TransactionPayment") _
                                                        And ((TSstatus = SPaid) Or (TSstatus = SReject)) Then
                                                                If TSstatus = SPaid Then
                                                                        dst = App.Path & TSdir & "\Paid\" & GetFileName(SrcFile)
                                                                        delFile dst
                                                                        fs.MoveFile SrcFile, dst
                                                                        SrcFile = dst
                                                                                        
                                                                        dst = App.Path & TSdir & "\Paid\" & GetFileName(decFile)
                                                                        delFile dst
                                                                        fs.MoveFile decFile, dst
                                                                        decFile = dst
                                                                        
                                                                        key = frmRecvFiles.AddRootTree_R("", decFile, imgTS)
                                                                        frmRecvFiles.AddChildTree key, "", SrcFile, imgTS
                                                                        
                                                                        SrcFile = dst
                                                                        FileName = dst
                                                                ElseIf TSstatus = SReject Then
                                                                        dst = App.Path & TSdir & "\Reject\" & GetFileName(SrcFile)
                                                                        delFile dst
                                                                        fs.MoveFile SrcFile, dst
                                                                        SrcFile = dst
                                                                        
                                                                        dst = App.Path & TSdir & "\Reject\" & GetFileName(decFile)
                                                                        delFile dst
                                                                        fs.MoveFile decFile, dst
                                                                        decFile = dst
                                                                        
                                                                        key = frmRecvFiles.AddRootTree_R("", decFile, img)
                                                                        frmRecvFiles.AddChildTree key, "", SrcFile, img
                                                
                                                                        SrcFile = dst
                                                                        FileName = dst
                                                                End If
                                                                
                                                                tsid = xmldoc.documentElement.getElementsByTagName("TransactionID").item(0).Text
                                                                If mdlXML.RecvPaid_RejectTS(tsid, TSstatus) Then
                                                                                Message "Update Database Complete"
                                                                                'Message ""
                                                                                Set conn = New ADODB.Connection
                                                                                Set rcs = New ADODB.Recordset
                                                                                conn.ConnectionString = DBconString
                                                                                conn.CursorLocation = adUseClient
                                                                                conn.Open
                                                                                sql = "SELECT    PR.BuyerID , PR.SellerID " & _
                                                                                          "FROM         Invoice INNER JOIN " & _
                                                                                                        "PO ON Invoice.POID = PO.POID INNER JOIN " & _
                                                                                                        "PR ON PO.PRID = PR.PRID " & _
                                                                                        "WHERE     (Invoice.InvoiceID = " & tsid & ")"
                                                                                rcs.Open sql, conn, 1, 3
                                                                                buyerID = rcs!buyerID
                                                                                sellerID = rcs!sellerID
                                                                                rcs.Close
                                                                                conn.Close
                                                                                Set rcs = Nothing
                                                                                Set conn = Nothing
                                                                                
                                                                                Userid = mdlOperation.getUserIDfromMemberID(sellerID)
                                                                                mdlSendQueue.AddQueue FileName, Userid
                                                                                Userid = mdlOperation.getUserIDfromMemberID(buyerID)
                                                                                mdlOperation.searchIP_PortfromUID Userid
                                                                                WSSend 2
                                                                 Else
                                                                                Message "Cannot Update Database"
                                                                 End If
                                                End If
                                                Set xmldoc = Nothing
                                                Set fs = Nothing
                                End If
                        End If
               Else
                         Put #IntNextFreeFile, , strNew
               End If
       End If
    End If
End Sub

Private Sub winsockMain_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
        Message Description & vbCrLf & Source
End Sub

Private Sub winsockMain_SendComplete()
        If mode = 2 Then
                 winsockMain.Close
                winsockMain.LocalPort = LocalPort
                winsockMain.Listen
                mode = 0
        End If
        
End Sub


Private Sub winsockSend_Connect()
        Dim objxml As XML
        Dim fType As String
        Dim dest As String
        
        Sleep 100
        If sendMode = 0 Then
                CommonDialog1.FileName = ""
                CommonDialog1.Filter = "XML File(*.xml)|*.xml"
                CommonDialog1.Flags = cdlOFNFileMustExist
                CommonDialog1.ShowOpen
                If CommonDialog1.FileName <> "" Then
                    Set objxml = New XML
                    objxml.getParameter CommonDialog1.FileName
                    Select Case objxml.GetRootName
                    Case "PO"
                        fType = ftPO
                        imgType = imgPO
                    Case "PR"
                        fType = ftPR
                        imgType = imgPR
                    Case "Invoice"
                        fType = ftInvoice
                        imgType = imgIV
                     Case "Document"
                         fType = ftTS
                         imgType = imgTS
                     Case "TransactionPayment"
                         fType = ftMS
                         imgType = imgTS
                     Case "MonthlyPayment"
                        fType = ftMP
                        imgType = imgMP
                     Case "Partner"
                        fType = ftPN
                        imgType = imgPN
                    Case Else
                        fType = ftOther
                    End Select
                    Set objxml = Nothing
                    SendFile CommonDialog1.FileName, CommonDialog1.FileTitle, fType
                Else
                    winsockSend.Close
                End If
        ElseIf sendMode = 1 Then
                winsockSend.SendData GetUserID
        ElseIf (sendMode = 2) Or (sendMode = 3) Then
                    Set objxml = New XML
                    objxml.getParameter FileName
                    Select Case objxml.GetRootName
                    Case "PO"
                        fType = ftPO
                        imgType = imgPO
                        TimerCount.Enabled = True
                    Case "PR"
                        fType = ftPR
                        imgType = imgPR
                        TimerCount.Enabled = True
                    Case "Invoice"
                        fType = ftInvoice
                        imgType = imgIV
                    Case "Document"
                         fType = ftTS
                         imgType = imgTS
                     Case "TransactionPayment"
                         fType = ftMS
                         imgType = imgTS
                    Case "MonthlyPayment"
                        fType = ftMP
                        imgType = imgMP
                     Case "Partner"
                        fType = ftPN
                        imgType = imgPN
                    Case Else
                        fType = ftOther
                    End Select
                    Set objxml = Nothing
                    dest = GetFileName(FileName)
                    SendFile FileName, dest, fType
        End If
        
End Sub

Private Sub winsockSend_DataArrival(ByVal bytesTotal As Long)
        Dim strNew As String
        If sendMode = 1 Then
                winsockSend.GetData strNew
                Userid = strNew
                'If display Then
                 MsgBox "Remote UserID = " & strNew
                ' display = False
                'End If
                sendMode = 0
                winsockSend.Close
        End If
End Sub

Private Sub winsocksend_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
        'MsgBox Description, vbCritical + vbOKOnly, "Winsock Error"
        Message Description
        winsockSend.Close
End Sub

Private Sub winsockSend_SendComplete()
        If sendMode = 0 Or sendMode = 2 Then
                Message "Send File : " & GetFileName(FileName) & " Complete"
                'Message ""
                winsockSend.Close
                If Not (mdlSendQueue.IsEndOfQueue) Then
                        Sleep 2000
                        FileName = mdlSendQueue.GetFilePath(Userid)
                        If mdlOperation.searchIP_PortfromUID(Userid) Then
                                WSSend 2
                        Else
                                Message "Cannot find Remote IP and Port from UserID : " & Userid
                        End If
                End If
        ElseIf sendMode = 3 Then
                winsockSend.Close
                Message "Send File : " & GetFileName(FileName) & " Complete"
                'Message ""
                Sleep 2000
                FileName = tsFile
                WSSend 2
        End If
End Sub

Private Sub SendFile(ByVal SourceFile As String, ByVal destFile As String, ByVal ft As String)
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim tmpFile As String
        Select Case ft
                Case ftPO
                          tmpFile = mdlSendXML.SendXMLAll(SourceFile)
                          If StatusOpen Then
                                frmStatus.addStatus 2, imgPO
                        End If
                Case ftPR
                          tmpFile = mdlSendXML.SendXMLAll(SourceFile)
                          If StatusOpen Then
                                frmStatus.addStatus 0, imgPR
                        End If
                Case ftInvoice
                          tmpFile = mdlSendXML.SendXMLAll(SourceFile)
                          If StatusOpen Then
                                frmStatus.addStatus 0, imgIV
                        End If
                Case ftTS
                        tmpFile = mdlSendXML.EncryptFileOnly(SourceFile)
                        FileName = tmpFile
                        destFile = GetFileName(FileName)
                          If StatusOpen Then
                                If Userid = "Bank" Then
                                        frmStatus.addStatus 6, imgTS
                                Else
                                        frmStatus.AddStatusSendByUserID "TS", Userid
                                End If
                        End If
                Case ftMS
                          tmpFile = mdlSendXML.SendXMLAll(SourceFile)
                          If StatusOpen Then
                                frmStatus.addStatus 6, imgTS
                        End If
                Case ftPN
                          tmpFile = mdlSendXML.SendXMLAll(SourceFile)
                          If StatusOpen Then
                                If Userid = "CAT" Then
                                        frmStatus.addStatus 8, imgPN
                                ElseIf Userid = "FedEx" Then
                                        frmStatus.addStatus 4, imgPN
                                End If
                        End If
                Case ftMP
                          tmpFile = mdlSendXML.SendXMLAll(SourceFile)
                          If StatusOpen Then
                                If Userid = "Bank" Then
                                        frmStatus.addStatus 6, imgMP
                                Else
                                        frmStatus.addStatus 2, imgMP
                                End If
                        End If
                Case Else
                        tmpFile = SourceFile
                        ft = ""
        End Select
        
        'If (flag) Then
        
                Set fso = New FileSystemObject
                If fso.FileExists(tmpFile) Then
                        winsockSend.SendData DestBegin & destFile & vbCrLf
                        winsockSend.SendData FileType & ft & vbCrLf
                         
                        Dim arrByteArray() As Byte
                        Dim IntNextFreeFile As Integer
                        'Open the source file and read the content
                        'into a arrByteArray to pass onto encryption
                        IntNextFreeFile = FreeFile
                        Open tmpFile For Binary As #IntNextFreeFile
                        ReDim arrByteArray(0 To LOF(IntNextFreeFile) - 1)
                        Get #IntNextFreeFile, , arrByteArray()
                        Close #IntNextFreeFile
                         
                        winsockSend.SendData arrByteArray()
                        winsockSend.SendData EofFile
                        Set txt = Nothing
                        
                Else
                        Message "File " & SourceFile & " Not Found"
                End If
                Set fso = Nothing
        'End If

End Sub

Public Function isExist(ByVal PathFileName As String) As Boolean
        Dim fso As FileSystemObject
        Set fso = New FileSystemObject
        If fso.FileExists(PathFileName) Then
                isExist = True
        Else
                isExist = False
        End If
        Set fso = Nothing
End Function

Public Sub WSSend(ByVal SMode As Integer)
        If (remoteIP = "") Or (remotePort = "") Then
                Message "Cannot send file becouse Remote IP or Remote Port Error"
        ElseIf (Userid = "") Then
                Message "Cannot send file becouse Remote User ID Error"
        Else
                sendMode = SMode
                Message ""
                Message "Connect to  " & Trim$(Userid) & "   At  " & Trim$(remoteIP) & "  Port No. " & remotePort
                Message "Begin Sending Process"
                If winsockSend.State <> sckClosed Then winsockSend.Close
                winsockSend.Connect remoteIP, remotePort
        End If
End Sub

Public Sub EnableQueue()
        Timer1.Enabled = True
End Sub

Public Sub DisableQueue()
        Timer1.Enabled = False
End Sub

