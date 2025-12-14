VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.MDIForm mdiMain 
   BackColor       =   &H8000000C&
   Caption         =   "Buyer Application"
   ClientHeight    =   6270
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10560
   Icon            =   "mdiMain.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   1080
      Top             =   1320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.Toolbar ToolbarMain 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   10560
      _ExtentX        =   18627
      _ExtentY        =   1164
      ButtonWidth     =   1032
      ButtonHeight    =   1005
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Listen"
            Object.ToolTipText     =   "Begin wait for request from marketplace"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Stop"
            Object.ToolTipText     =   "Stop waiting for request"
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
            Object.ToolTipText     =   "Send file to marketplace"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "VerPR"
            Object.ToolTipText     =   "Accept or Reject P.R."
            ImageIndex      =   6
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "VerIV"
            Object.ToolTipText     =   "Accept or Reject Invoice"
            ImageIndex      =   7
         EndProperty
      EndProperty
      MousePointer    =   99
      MouseIcon       =   "mdiMain.frx":08CA
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   240
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":0BE4
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":1036
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":1488
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":18DA
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":1D2C
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":217E
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdiMain.frx":2412
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   0
      Top             =   5925
      Width           =   10560
      _ExtentX        =   18627
      _ExtentY        =   609
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSWinsockLib.Winsock winsockSend 
      Left            =   840
      Top             =   2160
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock winsockMain 
      Left            =   240
      Top             =   2160
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Menu mnuAppL 
      Caption         =   "&Application"
      Begin VB.Menu mnuAppListen 
         Caption         =   "Listen"
      End
      Begin VB.Menu mnuAppStop 
         Caption         =   "Stop Listen"
      End
      Begin VB.Menu mnuAppReset 
         Caption         =   "Reset Socket"
      End
      Begin VB.Menu mnuAppResume 
         Caption         =   "Resume"
      End
      Begin VB.Menu Separator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuApplExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuClear 
      Caption         =   "&Clear"
      Begin VB.Menu mnuClearEvent 
         Caption         =   "Event"
      End
      Begin VB.Menu mnuRecvFiles 
         Caption         =   "Receive Files"
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
   End
   Begin VB.Menu mnuOpr 
      Caption         =   "&Operation"
      Begin VB.Menu mnuOprSendfile 
         Caption         =   "Send File"
      End
      Begin VB.Menu mnuOprSendfileDlg 
         Caption         =   "Send File Dialog"
      End
      Begin VB.Menu mnuOprSignEnc 
         Caption         =   "Sign && Encrypt Dialog"
      End
      Begin VB.Menu seperator2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOprParseXML 
         Caption         =   "ParseXML"
      End
      Begin VB.Menu mnuOprGenKey 
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
   End
   Begin VB.Menu mnuPR 
      Caption         =   "P.R."
      Begin VB.Menu mnuPRGenPrNo 
         Caption         =   "Generate P.R. No."
      End
      Begin VB.Menu mnuPRVer 
         Caption         =   "Verify P.R."
      End
      Begin VB.Menu mnuPRAccept 
         Caption         =   "Accept P.R. & Generate P.O."
      End
      Begin VB.Menu mnuPRReject 
         Caption         =   "Reject P.R."
      End
   End
   Begin VB.Menu mnuIV 
      Caption         =   "Invoice"
      Begin VB.Menu mnuIVVer 
         Caption         =   "Verify Invoice"
      End
      Begin VB.Menu mnuIVRecv 
         Caption         =   "Receive Invoice"
      End
      Begin VB.Menu mnuIVAccept 
         Caption         =   "Accept Invoice"
      End
      Begin VB.Menu mnuIVReject 
         Caption         =   "Reject Invoice"
      End
   End
   Begin VB.Menu mnuSetting 
      Caption         =   "&Setting"
      Begin VB.Menu mnuAppSocket 
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
      Begin VB.Menu mnuLogBackUp 
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

Dim mode As Integer     '0 for wait for request         1 for send file   2 for test connection  3 for market get user id
Public sendMode As Integer '0 for send manual              1 for send automatic         2 for at least once
Dim IntNextFreeFile As Integer

Dim fileTp As String
Public imgType As Integer

Dim SrcFile As String
Public decFile As String
Public valFile As String
Public tsFile As String


Private Sub MDIForm_Load()
        RemoteIP = "192.168.100.3"
        RemotePort = "9987"
        LocalPort = "9999"
        conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\KeyRing.mdb;Persist Security Info=False"
        DBconString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\Buyer.mdb;Persist Security Info=False"
        
        LogFileName = App.Path & "\Log.txt"
        PrivateKeyFile = ""
        UserID = "buyer1"
        MarketID = "market"
        'PublicKeyFile = ""
        
        winsockSend.Protocol = sckTCPProtocol
        winsockMain.Protocol = sckTCPProtocol
         
        mnuAppListen.Enabled = True
        ToolbarMain.Buttons("Listen").Enabled = True
        mnuAppStop.Enabled = False
        
        ToolbarMain.Buttons("Stop").Enabled = False
        frmKeyRing.Show
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
        If winsockMain.State <> sckClosed Then
                winsockSend.Close
        End If
        If winsockSend.State <> sckClosed Then
                winsockSend.Close
        End If
End Sub

Private Sub mnuApplExit_Click()
        Unload mdiMain
End Sub

Private Sub mnuAppListen_Click()
        winsockMain.LocalPort = LocalPort
        winsockMain.Listen
        mnuAppListen.Enabled = False
        ToolbarMain.Buttons("Listen").Enabled = False
        mnuAppStop.Enabled = True
        ToolbarMain.Buttons("Stop").Enabled = True
End Sub

Private Sub mnuAppReset_Click()
        If winsockMain.State <> sckClosed Then
                winsockMain.Close
        End If
        If winsockSend.State <> sckClosed Then
                MsgBox "It will reset send socket data in stream will be lost", vbInformation + vbOKOnly, "Warining"
                winsockSend.Close
        End If
         mnuAppListen.Enabled = True
        ToolbarMain.Buttons("Listen").Enabled = True
        mnuAppStop.Enabled = False
        ToolbarMain.Buttons("Stop").Enabled = False
End Sub

Private Sub mnuAppResume_Click()
        If winsockSend.State <> sckClosed Then winsockSend.Close
        WSSend 1
End Sub

Private Sub mnuAppSocket_Click()
        frmSetting.Show
End Sub

Private Sub mnuAppStop_Click()
        winsockMain.Close
        mnuAppListen.Enabled = True
        ToolbarMain.Buttons("Listen").Enabled = True
        mnuAppStop.Enabled = False
        ToolbarMain.Buttons("Stop").Enabled = False
End Sub


Private Sub mnuClearEvent_Click()
        frmEvent.ClearEvent
End Sub

Private Sub mnuIVAccept_Click()
        Dim IVid As String
        IVid = InputBox("Enter Invoice ID which you want to Accept")
        If IVid <> "" Then
                If mdlXML.GenAcceptInvoice(IVid, "") Then
                        MsgBox "Gen Accept Invoice Complete"
                        
                        mdiMain.WSSend 1
                Else
                        MsgBox "Gen Accept Invoice Error !!!"
                End If
        End If
End Sub

Private Sub mnuIVRecv_Click()
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = "(*.xml)|*.xml"
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                If mdlXML.recvInvoice(CommonDialog1.FileName, "") Then
                        MsgBox "Receive Invoice Complete"
                Else
                        MsgBox "Receive Invoice Error !!!"
                End If
        End If
End Sub

Private Sub mnuIVReject_Click()
        frmReject.mode = "IV"
        frmReject.Show vbModal
End Sub

Private Sub mnuIVVer_Click()
        frmVerifyInvoice.Show
End Sub

Private Sub mnuLogBackUp_Click()
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
                                        MsgBox "Please Setting Private Key File in Manage Key Ring Before Encrypt"
                                Else
                                                ImportKey PrivateKeyFile
                                                KeyID = ""
                                                txt2.Write dec(txt.ReadAll, UseKey, N)
                                                MsgBox "Decrypt File Complete", vbInformation + vbOKOnly
                                End If
                                txt.Close
                                txt2.Close
                End If
                Set fso = Nothing
        End If
Exit Sub
msgerr:
        MsgBox Error$, vbExclamation + vbOKOnly, "Error !!!"
End Sub

Private Sub mnuOprEnc_Click()
        'Encrypt function
        CommonDialog1.FileName = ""
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                If MarketID = "" Then
                        MsgBox "Please Set Market ID in KeyRing Before Encrypt", vbExclamation + vbOKOnly
                'ElseIf UserID = "" Then
                '       MsgBox "Please Set User ID in KeyRing Before Encrypt", vbExclamation + vbOKOnly
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
                                SearchPublicKey MarketID
                                txt2.Write enc(txt.ReadAll, UseKey, N)
                                MsgBox "Encrypt File Complete", vbInformation + vbOKOnly
                                txt.Close
                                txt2.Close
                        End If
                        Set fso = Nothing
                End If
        End If
Exit Sub
msgerr:
        MsgBox Error$, vbExclamation + vbOKOnly, "Error !!!"
End Sub

Private Sub mnuOprGenKey_Click()
        CommonDialog1.Flags = cdlOFNFileMustExist
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = ""
        CommonDialog1.ShowSave
        If CommonDialog1.FileName <> "" Then
                GenKey (CommonDialog1.FileName)
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

Private Sub mnuOprSendfile_Click()
        sendMode = 0
        If winsockSend.State <> sckClosed Then winsockSend.Close
                winsockSend.Connect RemoteIP, RemotePort
End Sub

Private Sub mnuOprSendfileDlg_Click()
        frmSendFile.Show
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
                ElseIf UserID = "" Then
                                MsgBox "Please Set User ID in KeyRing Before Encrypt", vbExclamation + vbOKOnly
                Else
                                dest = Left$(SrcFile, Len(SrcFile) - 4) & "SIGN" & Right$(SrcFile, 4)
                                datestr = Format$(Now, "Short Date")
                                ImportKey PrivateKeyFile
                                KeyID = ""
                                'If optSha1.value Then
                                        Sha1SignFile "", UserID, datestr, SrcFile, dest, UseKey, N
                                'ElseIf optMD5.value Then
                                '        MD5SignFile "", UserID, lblDateCreate.Caption, txtSource.Text, txtDest.Text, UseKey, N
                                'End If
                                MsgBox "Sign File Already"
                End If
        End If
End Sub

Private Sub mnuOprSignEnc_Click()
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
                        'SearchPublicKey MarketID
                        ValidateFile SrcFile, dest
                Else
                        MsgBox "Source File does not Exist"
                End If
        End If
End Sub

Private Sub mnuPRAccept_Click()
    Dim prid As String
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    prid = InputBox("Enter PRID to accept and generate PO")
    If prid <> "" Then
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.Open
        rcs.Open "select count(*) as rcsCount from PROpen where prid = """ & prid & """", conn, 1, 3
        If rcs!rcsCount > 0 Then
                If mdlXML.genPO(prid, "") Then
                            MsgBox "Generate PO Complete"
                             WSSend 1
                Else
                    MsgBox "Generate PO Error !!!"
                End If
        Else
                MsgBox "Cannot Find this PRID in database"
        End If
    End If
End Sub

Private Sub mnuPRGenPrNo_Click()
    CommonDialog1.Flags = cdlOFNPathMustExist
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "(*.xml)|*.xml"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
        If mdlXML.GenPRno(CommonDialog1.FileName, "") Then
           MsgBox "Update Data & Generate P.R. No. Complete"
        Else
           MsgBox "Update Data & Generate P.R. No. Error"
        End If
    End If
End Sub


Private Sub mnuPRReject_Click()
        frmReject.mode = "PR"
        frmReject.Show vbModal
End Sub

Private Sub mnuPRVer_Click()
        frmVerifyPR.Show
End Sub

Private Sub mnuRecvFiles_Click()
        frmRecvFiles.clear
End Sub

Private Sub mnuSetKeyRing_Click()
        frmKeyRing.Show
End Sub

Private Sub mnuViewEvent_Click()
        frmEvent.Show
End Sub

Private Sub mnuViewRecvFiles_Click()
        frmRecvFiles.Show
End Sub

Private Sub Toolbarmain_ButtonClick(ByVal Button As MSComctlLib.Button)
           Select Case Button.Index
                Case 1
                        mnuAppListen_Click
                Case 2
                        mnuAppStop_Click
                Case 7
                        mnuOprSendfile_Click
                Case 3
                        mnuAppReset_Click
                Case 5
                        mnuViewEvent_Click
                Case 9
                        mnuPRVer_Click
                Case 10
                        mnuIVVer_Click
        End Select
End Sub



Private Sub winsockMain_ConnectionRequest(ByVal requestID As Long)
        If winsockMain.State <> sckClosed Then winsockMain.Close
        winsockMain.Accept requestID
End Sub


Private Sub winsockMain_DataArrival(ByVal bytesTotal As Long)
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim datestr As String
        Dim strNew As String
        'Dim fileName As String
        'Dim FileTp As String
        Dim pos As Integer
        Dim pos1 As Integer
        
If winsockMain.State = sckConnected Then
        
        winsockMain.GetData strNew, vbString
        If mode = 0 Then
                If Left$(strNew, Len(DestBegin)) = DestBegin Then
                        mode = 1
                        'winsockMain.GetData strNew, vbString
                        pos = InStr(Len(DestBegin), strNew, vbCrLf)
                        If pos <= 0 Then
                                Message "Destination file to save error"
                        Else
                                FileName = Mid$(strNew, Len(DestBegin) + 1, pos - Len(DestBegin) - 1)
                                pos1 = InStr(pos + Len(fileType) + 1, strNew, vbCrLf)
                                If pos1 <= 0 Then
                                        Message "File Type Receive Error"
                                Else
                                        fileTp = Mid$(strNew, pos + Len(fileType) + 2, pos1 - pos - Len(fileType) - 2)
                                        Select Case fileTp
                                                Case ftPO
                                                        'FileName = App.Path & POdir & "\" & FileName
                                                        FileName = App.Path & TmpFileDir & "\" & FileName
                                                Case ftPR
                                                        FileName = App.Path & TmpFileDir & "\" & FileName
                                                        'FileName = App.Path & PRdir & "\" & FileName
                                                Case ftInvoice
                                                        FileName = App.Path & TmpFileDir & "\" & FileName
                                                        'FileName = App.Path & IVdir & "\" & FileName
                                                Case ftTS
                                                        FileName = App.Path & TmpFileDir & "\" & FileName
                                                Case Else
                                                        FileName = App.Path & Otherdir & "\" & FileName
                                        End Select
                                        
                                        SrcFile = FileName
                                        
                                        Set fso = New FileSystemObject
                                        If fso.FileExists(FileName) Then
                                                fso.DeleteFile FileName
                                        End If
                                        Set fso = Nothing
                                        
                                        IntNextFreeFile = FreeFile
                                        Open FileName For Binary Access Write As #IntNextFreeFile
                                        Put #IntNextFreeFile, , Right$(strNew, Len(strNew) - pos1 - 1)
                                        
                                        '------------- add log ----------------
                                        Message ""
                                        datestr = Format$(Now, "dd/mm/yy  hh:nn:ss")
                                        frmEvent.AddEvent datestr & vbTab & "Connect From : " & MarketID
                                        LogFile.AddLog datestr & vbTab & "Connect From : " & MarketID
                                        frmEvent.AddEvent datestr & vbTab & "File Receive : " & GetFileName(FileName)
                                        LogFile.AddLog datestr & vbTab & "File Receive : " & GetFileName(FileName)
                                        '------------------------------------------
                                End If
                       End If
                
                ' ------------ test connection ------------------
                ElseIf strNew = strTestCon Then
                        winsockMain.SendData strTestCon
                        mode = 2
                ' ---------------- get user id -------------------
                ElseIf strNew = GetUserID Then
                        winsockMain.SendData UserID
                        mode = 3
                Else
                        Message "Error in recveive file mode not defile"
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
                        If (fileTp = ftPO) Or (fileTp = ftPR) Or (fileTp = ftInvoice) Then
                                Dim objxml As XML
                                Dim dest As String
                                Dim dest2 As String
                                Dim KEY As String
                                Dim img As Integer
                                
                                If mdlRecvXML.RecvXMLAll(SrcFile) Then
                                            Set objxml = New XML
                                            Set fso = New FileSystemObject
                                            objxml.getParameter valFile
                                            Select Case objxml.GetRootName
                                                Case "PO"
                                                    dest = App.Path & POdir
                                                    img = imgPO
                                                Case "PR"
                                                    dest = App.Path & PRdir
                                                    img = imgPR
                                                Case "Invoice"
                                                    dest = App.Path & IVdir
                                                    img = imgIV
                                            End Select
                                            Select Case objxml.GetStatus
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
                                                    
                                                    KEY = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree KEY, "", decFile, img
                                                    frmRecvFiles.AddChildTree KEY, "", SrcFile, img
                                                    
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
                                                    
                                                    KEY = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree KEY, "", decFile, img
                                                    frmRecvFiles.AddChildTree KEY, "", SrcFile, img
                                                
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
                                                    
                                                    KEY = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree KEY, "", decFile, img
                                                    frmRecvFiles.AddChildTree KEY, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Reject\" & GetFileName(valFile)
                                                    
                                                Case SSent
                                                    dest2 = dest & "\Sent\" & GetFileName(valFile)
                                                    delFile dest2
                                                    fso.MoveFile valFile, dest2
                                                    valFile = dest2
                                                    
                                                    dest2 = dest & "\Sent\" & GetFileName(decFile)
                                                    delFile dest2
                                                    fso.MoveFile decFile, dest2
                                                    decFile = dest2
                                                    
                                                    dest2 = dest & "\Sent\" & GetFileName(SrcFile)
                                                    delFile dest2
                                                    fso.MoveFile SrcFile, dest2
                                                    SrcFile = dest2
                                                    
                                                    KEY = frmRecvFiles.AddRootTree_R("", valFile, img)
                                                    frmRecvFiles.AddChildTree KEY, "", decFile, img
                                                    frmRecvFiles.AddChildTree KEY, "", SrcFile, img
                                                    
                                                    SrcFile = dest & "\Sent\" & GetFileName(valFile)
                                                    
                                            End Select
                                            
                                            Set objxml = Nothing
                                            Set fso = Nothing
                                            
                                            'next step
                                            
                                            
                                            '------------------ add log ----------------------
                                            datestr = Format$(Now, "dd/mm/yy  hh:nn:ss")
                                            frmEvent.AddEvent datestr & vbTab & "Receive File Complete at " & SrcFile
                                            LogFile.AddLog datestr & vbTab & "Receive File Complete at " & SrcFile
                                            '------------------------------------------------------
                                            'mdlXML.ChkStatus SrcFile
                                            Assign SrcFile
                                End If
                        ElseIf fileTp = ftTS Then
                                           If mdlRecvXML.DecryptFileOnly(SrcFile) Then
                                                        Dim xmldoc As DOMDocument30
                                                        Dim fs As FileSystemObject
                                                        Dim dst2 As String
                                                        Dim tsStatus As String
                                                        
                                                        Set fs = New FileSystemObject
                                                        Set xmldoc = New DOMDocument30
                                                        xmldoc.async = False
                                                        xmldoc.validateOnParse = False
                                                        xmldoc.Load decFile
                                                        tsStatus = xmldoc.documentElement.firstChild.Attributes.getNamedItem("Status").Text
                                                        
                                                        If (xmldoc.documentElement.firstChild.nodeName = "TransactionPayment") And _
                                                                ((tsStatus = SPaid) Or (tsStatus = SReject)) Then
                                                                 
                                                                 Message "Starting Verify Bank's Key Process >>>>>"
                                                                 valFile = Left$(SrcFile, Len(SrcFile) - 4) & "Valid" & Right$(decFile, 4)
                                                                        If ValidateFile(decFile, valFile) Then
                                                                                If tsStatus = SPaid Then
                                                                                        dst2 = App.Path & TSdir & "\Paid\" & GetFileName(SrcFile)
                                                                                        delFile dst2
                                                                                        fs.MoveFile SrcFile, dst2
                                                                                        SrcFile = dst2
                                                                                        
                                                                                        dst2 = App.Path & TSdir & "\Paid\" & GetFileName(decFile)
                                                                                        delFile dst2
                                                                                        fs.MoveFile decFile, dst2
                                                                                        decFile = dst2
                                                                                
                                                                                        dst2 = App.Path & TSdir & "\Paid\" & GetFileName(valFile)
                                                                                        delFile dst2
                                                                                        fs.MoveFile valFile, dst2
                                                                                        valFile = dst2
                                                                                        
                                                                                        KEY = frmRecvFiles.AddRootTree_R("", valFile, imgTS)
                                                                                        frmRecvFiles.AddChildTree KEY, "", decFile, imgTS
                                                                                        frmRecvFiles.AddChildTree KEY, "", SrcFile, imgTS
                                                                                ElseIf tsStatus = SReject Then
                                                                                        dst2 = App.Path & TSdir & "\Reject\" & GetFileName(SrcFile)
                                                                                        delFile dst2
                                                                                        fs.MoveFile SrcFile, dst2
                                                                                        SrcFile = dst2
                                                                                        
                                                                                        dst2 = App.Path & TSdir & "\Reject\" & GetFileName(decFile)
                                                                                        delFile dst2
                                                                                        fs.MoveFile decFile, dst2
                                                                                        decFile = dst2
                                                                                
                                                                                        dst2 = App.Path & TSdir & "\Reject\" & GetFileName(valFile)
                                                                                        delFile dst2
                                                                                        fs.MoveFile valFile, dst2
                                                                                        valFile = dst2
                                                                                      
                                                                                        KEY = frmRecvFiles.AddRootTree_R("", valFile, imgTS)
                                                                                        frmRecvFiles.AddChildTree KEY, "", decFile, imgTS
                                                                                        frmRecvFiles.AddChildTree KEY, "", SrcFile, imgTS
                                                                                End If
                                                                                SrcFile = dst2
                                                                                'Message "Validate File Complete"
                                                                                If mdlXML.RecvTSPaid_Reject(valFile) Then
                                                                                        Message "Update  Transaction Complete"
                                                                                Else
                                                                                        Message "Update  Transaction Error !!!"
                                                                                End If
                                                                                 Message ":  )  Verify Bank's Process Complete (  :"
                                                                                 'Message ""
                                                                      End If
                                                        End If
                                                        Set xmldoc = Nothing
                                                        Set fs = Nothing
                                        End If          'end if recv dec onlyl
                        End If  ' end if fileTP
                        
               Else
                         Put #IntNextFreeFile, , strNew
               End If   'end if eof file
       End If
End If
End Sub

Private Sub winsockMain_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
        Message Description & vbCrLf & Source
        winsockMain.Close
        winsockMain.Listen
End Sub

Private Sub winsockMain_SendComplete()
        If (mode = 2) Or (mode = 3) Then
                 winsockMain.Close
                winsockMain.LocalPort = LocalPort
                winsockMain.Listen
                mode = 0
        End If
End Sub

Private Sub winsockSend_Connect()
    If sendMode = 0 Then
       CommonDialog1.FileName = ""
       CommonDialog1.Filter = "XML Files(*.xml)|*.xml"
       CommonDialog1.Flags = cdlOFNFileMustExist
       CommonDialog1.ShowOpen
       If CommonDialog1.FileName <> "" Then
          Dim objxml As XML
          Dim fType As String
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
            Case "TransactionPayment"
               fType = ftTS
               imgType = imgTS
            Case Else
                fType = ftOther
          End Select
          Set objxml = Nothing
          SendFile CommonDialog1.FileName, CommonDialog1.FileTitle, fType
       Else
          winsockSend.Close
       End If
    ElseIf (sendMode = 1) Or (sendMode = 2) Then
          Set objxml = New XML
          objxml.getParameter FileName
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
           Case "TransactionPayment"
                fType = ftTS
                imgType = imgTS
          Case Else
                fType = ftOther
          End Select
          Set objxml = Nothing
        
           SendFile FileName, GetFileName(FileName), fType
    Else
        Message "Send mode error"
    End If
End Sub

Private Sub winsocksend_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
        If sendMode <> 2 Then
                MsgBox Description, vbCritical + vbOKOnly, "Winsock Error"
                winsockSend.Close
                sendMode = 0
        End If
End Sub

Private Sub winsockSend_SendComplete()
        'If mode = 0 Then
                Message "Send File : " & GetFileName(FileName) & " Complete"
                'Message ""
                winsockSend.Close
        Do While sendMode = 2
                Sleep 2000
                FileName = tsFile
                WSSend 1
        Loop
End Sub

Private Sub SendFile(ByVal SourceFile As String, ByVal destFile As String, ByVal ft As String)
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim TmpFile As String
        'On Error GoTo msgerr
        Select Case ft
                Case ftPO
                          TmpFile = mdlSendXML.SendXMLAll(SourceFile)
                Case ftPR
                          TmpFile = mdlSendXML.SendXMLAll(SourceFile)
                Case ftInvoice
                          TmpFile = mdlSendXML.SendXMLAll(SourceFile)
                Case ftTS
                          TmpFile = mdlSendXML.SendTSXMLAll(SourceFile)
                Case Else
                        TmpFile = SourceFile
                        ft = ""
        End Select
        
        'If (Flag) Then
        
                Set fso = New FileSystemObject
                If fso.FileExists(TmpFile) Then
                        winsockSend.SendData GetUserID & UserID
                        winsockSend.SendData DestBegin & destFile & vbCrLf
                        winsockSend.SendData fileType & ft & vbCrLf
                         
                        Dim arrByteArray() As Byte
                        Dim IntNextFreeFile As Integer
                        'Open the source file and read the content
                        'into a arrByteArray to pass onto encryption
                        IntNextFreeFile = FreeFile
                        Open TmpFile For Binary As #IntNextFreeFile
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

Public Sub WSSend(ByVal SMode As Integer)
     If (RemoteIP = "") Then
                Message "Cannot send file becouse Remote IP or Remote Port Error"
        ElseIf (MarketID = "") Then
                Message "Cannot send file becouse Remote User ID Error"
        Else
                Message ""
                sendMode = SMode
                Message "Connect to " & MarketID & "  At  " & RemoteIP & " Port No. " & RemotePort
                Message "Begin Sending Process"
                If winsockSend.State <> sckClosed Then winsockSend.Close
                winsockSend.Connect RemoteIP, RemotePort
        End If
End Sub

