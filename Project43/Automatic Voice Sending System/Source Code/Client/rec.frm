VERSION 5.00
Object = "{EEE78583-FE22-11D0-8BEF-0060081841DE}#1.0#0"; "Xvoice.dll"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Rec 
   Caption         =   "Record Message"
   ClientHeight    =   6300
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9030
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "rec.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6300
   ScaleWidth      =   9030
   StartUpPosition =   3  'Windows Default
   Begin ACTIVEVOICEPROJECTLibCtl.DirectSS DirectSS1 
      Height          =   375
      Left            =   2640
      OleObjectBlob   =   "rec.frx":0442
      TabIndex        =   18
      Top             =   3240
      Width           =   615
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   3000
      Top             =   5640
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock wData 
      Left            =   3720
      Top             =   5760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   495
      Left            =   3600
      TabIndex        =   16
      Top             =   2040
      Width           =   735
   End
   Begin VB.Timer Timer2 
      Left            =   4320
      Top             =   5760
   End
   Begin VB.CommandButton cmdTTS 
      Caption         =   "Play"
      Height          =   375
      Left            =   1080
      TabIndex        =   14
      Top             =   4800
      Width           =   3255
   End
   Begin VB.TextBox txtTTS 
      Height          =   975
      Left            =   1080
      MultiLine       =   -1  'True
      TabIndex        =   13
      Text            =   "rec.frx":049A
      Top             =   3720
      Width           =   3255
   End
   Begin VB.OptionButton optVoice 
      Caption         =   "Text - to - Speech"
      Height          =   255
      Left            =   600
      TabIndex        =   12
      Top             =   3360
      Width           =   2655
   End
   Begin VB.TextBox txtTimer 
      BackColor       =   &H8000000A&
      Height          =   375
      Left            =   1800
      TabIndex        =   11
      Top             =   2640
      Width           =   2535
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      Enabled         =   0   'False
      Height          =   495
      Left            =   2760
      TabIndex        =   10
      Top             =   2040
      Width           =   615
   End
   Begin VB.CommandButton cmdPlay 
      Caption         =   "Play"
      Enabled         =   0   'False
      Height          =   495
      Left            =   1920
      TabIndex        =   9
      Top             =   2040
      Width           =   615
   End
   Begin VB.CommandButton cmdRecord 
      Caption         =   "Rec"
      Height          =   495
      Left            =   1080
      TabIndex        =   8
      Top             =   2040
      Width           =   615
   End
   Begin VB.OptionButton optRec 
      Caption         =   "Record your own voice"
      Height          =   255
      Left            =   600
      TabIndex        =   7
      Top             =   1680
      Value           =   -1  'True
      Width           =   2655
   End
   Begin VB.ListBox lstCall 
      BackColor       =   &H8000000B&
      Height          =   1980
      Left            =   5040
      TabIndex        =   5
      Top             =   2880
      Width           =   3375
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H8000000E&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "CordiaUPC"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      Picture         =   "rec.frx":04C6
      ScaleHeight     =   855
      ScaleWidth      =   8535
      TabIndex        =   4
      Top             =   120
      Width           =   8535
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "< &Back"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   5040
      TabIndex        =   3
      Top             =   5760
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   7680
      TabIndex        =   2
      Top             =   5760
      Width           =   1095
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "&Next >"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   6240
      TabIndex        =   1
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox Picture2 
      BeginProperty Font 
         Name            =   "CordiaUPC"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   60
      Left            =   240
      ScaleHeight     =   0
      ScaleWidth      =   8475
      TabIndex        =   0
      Top             =   5520
      Width           =   8535
   End
   Begin VB.Label Label1 
      Caption         =   "Status"
      Height          =   255
      Left            =   1080
      TabIndex        =   17
      Top             =   2760
      Width           =   735
   End
   Begin VB.Label Label12 
      Caption         =   "Choose the way to leave your messages."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   15
      Top             =   1200
      Width           =   4695
   End
   Begin VB.Label Label9 
      Caption         =   "Call List"
      Height          =   255
      Left            =   5040
      TabIndex        =   6
      Top             =   2640
      Width           =   2055
   End
End
Attribute VB_Name = "Rec"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Have to declare variables before using them.
Option Explicit
Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef lpdwFlags As Long, ByVal dwReserved As Long) As Long
Dim counter As Integer
's_time
    Dim pos1, pos2, pos3, pos4, pos5, pos6 As Integer
    Dim sday As String
    Dim smon As String
    Dim syear As String
    Dim shour As String
    Dim smin As String
'##############################################
Dim bActiveSession As Boolean
Dim hOpen As Long, hConnection As Long
Dim dwType As Long

Dim EnumItemNameBag As New Collection
Dim EnumItemAttributeBag As New Collection

Private Sub cmdBack_Click()
    wData.Close
    Me.Hide
    AddList.Show
End Sub

Private Sub cmdCancel_Click()
    wData.Close
    End
End Sub

Private Sub cmdFTP_Click()
    'save new rec.avi file
    cmdSave_Click
    'upload
    cmdConnect_Click
    'del old rec.avi
    On Error Resume Next
    Dim fso As New FileSystemObject, filrec
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set filrec = fso.GetFile("rec.avi")
    filrec.Delete
    
End Sub

Private Sub cmdNext_Click()
    counter = 0
    If optRec.Value = True Then
        'upload_Click
        cmdFTP_Click
    End If
    
    On Error Resume Next
    'Close the current connection for new connection:
    wData.Close
    'Connect to the remote computer
    wData.Connect serverip, serverport
    'Tell the user we are connecting:
    'lblStatus.Caption = "Connecting... "
    'If there was an error, inform the user:
    If Err Then
            MsgBox Err.Description, 0, "Winsock Error"
            wData.Close
            Exit Sub
    End If
End Sub

Private Sub cmdRecord_Click()
    Dim settings As String
    Dim Alignment As Integer
      
    Alignment = Channels * Resolution / 8
    
    settings = "set capture alignment " & CStr(Alignment) & " bitspersample " & CStr(Resolution) & " samplespersec " & CStr(Rate) & " channels " & CStr(Channels) & " bytespersec " & CStr(Alignment * Rate)
    WaveReset
    WaveSet
    WaveRecord
    WaveRecordingStartTime = Now
    cmdStop.Enabled = True   'Enable the STOP BUTTON
    cmdPlay.Enabled = False  'Disable the "PLAY" button
    'cmdSave.Enabled = False  'Disable the "SAVE AS" button
    cmdRecord.Enabled = False 'Disable the "RECORD" button
    txtTimer.Text = "Recording..."
    cmdNext.Enabled = True
End Sub

Private Sub cmdReset_Click()
    'Slider1.Max = 10
    'Slider1.Value = 0
    'Slider1.Refresh
    cmdRecord.Enabled = True
    cmdStop.Enabled = False
    cmdPlay.Enabled = False
    'cmdSave.Enabled = False
    
    WaveReset
    
    Rate = CLng(GetSetting("AudioRecorder", "StartUp", "Rate", "110025"))
    Channels = CInt(GetSetting("AudioRecorder", "StartUp", "Channels", "1"))
    Resolution = CInt(GetSetting("AudioRecorder", "StartUp", "Resolution", "16"))
    WaveFileName = GetSetting("AudioRecorder", "StartUp", "WaveFileName", "C:\Radio.wav")
    WaveAutomaticSave = GetSetting("AudioRecorder", "StartUp", "WaveAutomaticSave", "True")

    WaveRecordingImmediate = True
    WaveRecordingReady = False
    WaveRecording = False
    WavePlaying = False
    WaveMidiFileName = ""
    'Be sure to change the Value property of the appropriate button!!
    'if you change the default values!
    
    WaveSet
    If WaveRenameNecessary Then
        Name WaveShortFileName As WaveLongFileName
        WaveRenameNecessary = False
        WaveShortFileName = ""
    End If
    txtTimer.Text = "Reseted..."
End Sub

Private Sub cmdStop_Click()
    WaveStop
    'cmdSave.Enabled = True  'Enable the "SAVE AS" button
    cmdPlay.Enabled = True  'Enable the "PLAY" button
    cmdStop.Enabled = False 'Disable the "STOP" button
    'If WavePosition = 0 Then
    '    Slider1.Max = 10
    'Else
    '    If WaveRecordingImmediate And (Not WavePlaying) Then Slider1.Max = WavePosition
    '    If (Not WaveRecordingImmediate) And WaveRecording Then Slider1.Max = WavePosition
    'End If
    If WaveRecording Then WaveRecordingReady = True
    WaveRecordingStopTime = Now
    WaveRecording = False
    WavePlaying = False
    'frmSettings.optRecordProgrammed.Value = False
    'frmSettings.optRecordImmediate.Value = True
    'frmSettings.lblTimes.Visible = False
    txtTimer.Text = "Stopped..."
End Sub

Private Sub cmdPlay_Click()
    WavePlayFrom (0) 'Slider1.Value)
    WavePlaying = True
    cmdStop.Enabled = True
    cmdPlay.Enabled = False
    txtTimer.Text = "Playing..."
End Sub

Private Sub cmdTTS_Click()
    DirectSS1.Speak (txtTTS.Text)
End Sub

Private Sub Form_Load()
    cmdNext.Enabled = False
    WaveReset

    Rate = CLng(GetSetting("AudioRecorder", "StartUp", "Rate", "8000"))
    Channels = CInt(GetSetting("AudioRecorder", "StartUp", "Channels", "1"))
    Resolution = CInt(GetSetting("AudioRecorder", "StartUp", "Resolution", "16"))
    WaveFileName = GetSetting("AudioRecorder", "StartUp", "WaveFileName", "rec.avi")
    WaveAutomaticSave = GetSetting("AudioRecorder", "StartUp", "WaveAutomaticSave", "True")

    WaveRecordingImmediate = True
    WaveRecordingReady = False
    WaveRecording = False
    WavePlaying = False
    
    'Be sure to change the Value property of the appropriate button!!
    'if you change the default values!
    
    WaveSet
    WaveRecordingStartTime = Now + TimeSerial(0, 15, 0)
    WaveRecordingStopTime = WaveRecordingStartTime + TimeSerial(0, 15, 0)
    WaveMidiFileName = ""
    WaveRenameNecessary = False
    txtTimer.Text = "Ready to record..."
    
    If txtTTS.Text <> "" Then
        cmdTTS.Enabled = True
    Else
        cmdTTS.Enabled = False
    End If
    
End Sub



Private Sub Timer2_Timer()
    Dim RecordingTimes As String
    Dim msg As String
    
    RecordingTimes = "Start time:  " & WaveRecordingStartTime & vbCrLf _
                    & "Stop time:  " & WaveRecordingStopTime
    
    WaveStatistics
    If Not WaveRecordingImmediate Then
        WaveStatisticsMsg = WaveStatisticsMsg & "Programmed recording"
        If WaveAutomaticSave Then
            WaveStatisticsMsg = WaveStatisticsMsg & " (automatic save)"
        Else
            WaveStatisticsMsg = WaveStatisticsMsg & " (manual save)"
        End If
        WaveStatisticsMsg = WaveStatisticsMsg & vbCrLf & vbCrLf & RecordingTimes
    End If
    'StatisticsLabel.Caption = WaveStatisticsMsg
    
    WaveStatus
    'If WaveStatusMsg <> AudioRecorder.Caption Then AudioRecorder.Caption = WaveStatusMsg
    'If InStr(AudioRecorder.Caption, "stopped") > 0 Then
    '    cmdStop.Enabled = False
    '    cmdPlay.Enabled = True
    'End If
    
    'If RecordingTimes <> frmSettings.lblTimes.Caption Then frmSettings.lblTimes.Caption = RecordingTimes
    
    If (Now > WaveRecordingStartTime) _
            And (Not WaveRecordingReady) _
            And (Not WaveRecordingImmediate) _
            And (Not WaveRecording) Then
        WaveReset
        WaveSet
        WaveRecord
        WaveRecording = True
        cmdStop.Enabled = True   'Enable the STOP BUTTON
        cmdPlay.Enabled = False  'Disable the "PLAY" button
        'cmdSave.Enabled = False  'Disable the "SAVE AS" button
        cmdRecord.Enabled = False 'Disable the "RECORD" button
    End If
    
    If (Now > WaveRecordingStopTime) And (Not WaveRecordingReady) And (Not WaveRecordingImmediate) Then
        WaveStop
        'cmdSave.Enabled = True 'Enable the "SAVE AS" button
        cmdPlay.Enabled = True 'Enable the "PLAY" button
        cmdStop.Enabled = False 'Disable the "STOP" button
        If WavePosition > 0 Then
            'Slider1.Max = WavePosition
        Else
            'Slider1.Max = 10
        End If
        WaveRecording = False
        WaveRecordingReady = True
        If WaveAutomaticSave Then
            WaveFileName = "Radio_from_" & CStr(WaveRecordingStartTime) & "_to_" & CStr(WaveRecordingStopTime)
            WaveFileName = Replace(WaveFileName, ":", ".")
            WaveFileName = Replace(WaveFileName, " ", "_")
            WaveFileName = WaveFileName & ".wav"
            WaveSaveAs (WaveFileName)
            msg = "Recording has been saved" & vbCrLf
            msg = msg & "Filename: " & WaveFileName
            MsgBox (msg)
        Else
            msg = "Recording is ready" & vbCrLf
            msg = msg & "Don't forget to save recording..."
            MsgBox (msg)
        End If
        'frmSettings.optRecordProgrammed.Value = False
        'frmSettings.optRecordImmediate.Value = True
    End If

End Sub

Private Sub cmdSave_Click()
    Dim sName As String
    
    If WaveMidiFileName = "" Then
        sName = "Radio_from_" & CStr(WaveRecordingStartTime) & "_to_" & CStr(WaveRecordingStopTime)
        sName = Replace(sName, ":", "-")
        sName = Replace(sName, " ", "_")
        sName = Replace(sName, "/", "-")
    Else
        sName = WaveMidiFileName
        sName = Replace(sName, "MID", "wav")
    End If
  
    'CommonDialog1.FileName = sName
    'CommonDialog1.CancelError = True
    On Error GoTo ErrHandler1
    'CommonDialog1.Filter = "WAV file (*.wav*)|*.wav"
    'CommonDialog1.Flags = &H2 Or &H400
    'CommonDialog1.ShowSave
    'sName = CommonDialog1.FileName
    
    'WaveSaveAs (sName)
    WaveSaveAs ("rec.avi")
    'Exit Sub
ErrHandler1:
    WaveClose
End Sub

Private Sub txtTTS_Change()
    If txtTTS.Text <> "" Then
        cmdTTS.Enabled = True
        cmdNext.Enabled = True
    Else
        cmdTTS.Enabled = False
        cmdNext.Enabled = False
    End If
End Sub

Private Sub wData_Close()
    'Close the current connection for new connection:
    wData.Close
    'Inform the user that we have closed the connection:
    'lblStatus.Caption = "Connection Closed"
End Sub

Private Sub wData_Connect()
    Dim SendStr As String
    On Error Resume Next
    If optVoice.Value = True Then
        SendStr = "Text " & txtTTS.Text
        wData.SendData SendStr
    Else
        If counter <= lstCall.ListCount - 1 Then
            'Put what we are about so send into a variable:
            SendStr = "Call " & username & " " & lstCall.List(counter)
            'Send the message:
            wData.SendData SendStr
            counter = counter + 1
        End If
    End If
    
    'FTP========================================================
    'sendstr = "Ftpf "
    'wData.SendData sendstr
    'Set the text to the message we sent:
    'lblStatus.Caption = "Connecting to " & PhoneText.Text
    'If there was an error, inform the user:
    
    If Err Then
        MsgBox Err.Description, 0, "Winsock Error"
        wData.Close
        Exit Sub
    End If
End Sub

Private Sub wData_DataArrival(ByVal bytesTotal As Long)
    Dim nData As String
    On Error Resume Next
    'Get the data being sent to us:
    wData.GetData nData
    'Set the text to the message we received:
    Dim cmd As String
    cmd = Left$(nData, 4)
    If cmd = "errr" Then
        Dim desc As String
        desc = Mid$(nData, 6, Len(nData))
        wData.Close
        MsgBox desc, 0, "Error"
        End
        Exit Sub
    End If
    If cmd = "pass" Then
        s_time = Mid$(nData, 6, Len(nData))
        'init s_time
        AddList.txtServerTime.Text = s_time
        AddList.txtCredit.Text = credit
        If AddList.lstCall.ListCount > 0 Then
            AddList.cmdRemove.Enabled = True
            AddList.cmdNext.Enabled = True
        Else
            AddList.cmdRemove.Enabled = False
            AddList.cmdNext.Enabled = False
        End If
        On Error Resume Next
        pos1 = InStr(s_time, "/")
        pos2 = InStr(pos1 + 1, s_time, "/")
        pos3 = InStr(pos2 + 1, s_time, " ")
        pos4 = InStr(pos3 + 1, s_time, ":")
        pos5 = InStr(pos4 + 1, s_time, ":")
        sday = Left$(s_time, pos1 - 1)
        AddList.cmbDay.Text = sday
        smon = Mid$(s_time, pos1 + 1, pos2 - pos1 - 1)
        AddList.cmbMon.Text = smon
        syear = Mid$(s_time, pos2 + 1, pos3 - pos2 - 1)
        AddList.cmbYear.Text = syear
        shour = Mid$(s_time, pos3 + 1, pos4 - pos3 - 1)
        AddList.cmbHour.Text = shour
        smin = Mid$(s_time, pos4 + 1, pos5 - pos4 - 1)
        AddList.cmbMin.Text = smin
        If Err Then
            MsgBox "Protocal Error", 0, "Error"
            End
        End If
        wData.Close
        Me.Hide
        Thanks.Show
    End If
    If cmd = "getl" Then
        Dim SendStr As String
        If counter <= lstCall.ListCount - 1 Then
            SendStr = "Call " & username & " " & lstCall.List(counter)
            wData.SendData (SendStr)
            counter = counter + 1
        Else
            wData.SendData ("Done")
            AddList.lstCall.Clear
        End If
    End If
    'If there was an error, inform the user:
    If Err Then
        MsgBox Err.Description, 0, "Winsock Error"
        wData.Close
        Exit Sub
    End If
End Sub

Private Sub wData_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    'Inform the user of an error:
        MsgBox Description, 0, "Winsock Error"
        wData.Close
        End
End Sub

Private Sub Send(ByVal SendStr As String)
    On Error Resume Next
    'Send the message:
    wData.SendData SendStr
    If Err Then
        MsgBox Err.Description, 0, "Winsock error"
        Exit Sub
    End If
End Sub

Private Sub upload_Click()
    'cmdSave_Click
    On Error Resume Next
    Dim strurl As String
    strurl = "ftp://161.246.5.219"
    Inet1.Cancel
    Inet1.Execute , "CLOSE"
    Inet1.AccessType = icUseDefault
    Inet1.URL = LTrim(Trim(strurl))
    Inet1.username = LTrim(Trim("anonymous"))
    Inet1.Password = LTrim(Trim("a@a.com"))
    Inet1.RequestTimeout = 40
    If (Not IsNetConnected()) Then
        txtTimer.Text = "unable to connect."
    Else
        txtTimer.Text = "connected."
        Inet1.Execute strurl, "PUT rec.avi \record\rec.avi"
        Do While (Inet1.StillExecuting)
            DoEvents
        Loop
        Inet1.Cancel
        Inet1.Execute , "QUIT"
        Inet1.Execute , "CLOSE"
        txtTimer.Text = "send completed."
    End If
End Sub

Function IsNetConnected() As Boolean
    IsNetConnected = InternetGetConnectedState(0, 0)
End Function

'#########################################################################################3
Private Sub cmdConnect_Click()
    'form load
    bActiveSession = False
    hOpen = 0
    hConnection = 0
    dwType = FTP_TRANSFER_TYPE_BINARY
    '
    hOpen = InternetOpen(scUserAgent, INTERNET_OPEN_TYPE_DIRECT, vbNullString, vbNullString, 0)
    '
    If hOpen = 0 Then ErrorOut Err.LastDllError, "InternetOpen"
    '
    If Not bActiveSession And hOpen <> 0 Then
        hConnection = InternetConnect(hOpen, "161.246.5.219", INTERNET_INVALID_PORT_NUMBER, _
        "anonymous", "a@a.com", INTERNET_SERVICE_FTP, INTERNET_FLAG_PASSIVE, 0)
        If hConnection = 0 Then
            bActiveSession = False
            ErrorOut Err.LastDllError, "InternetConnect"
        Else
            bActiveSession = True
            FtpEnumDirectory ("")
            If EnumItemNameBag.Count = 0 Then Exit Sub
       End If
    End If
    'put
    Dim bRet As Boolean
    Dim szFileRemote As String, szDirRemote As String, szFileLocal As String
    Dim szTempString As String
    Dim nPos As Long, nTemp As Long
    'Dim nodX As Node
    'Set nodX = TreeView1.SelectedItem
  
    If bActiveSession Then
        'If nodX Is Nothing Then
        '    MsgBox "Please select a remote directory to PUT to!"
        '    Exit Sub
        'End If
        'If nodX.Image = "leaf" Then
        '    MsgBox "Please select a remote directory to PUT to!"
        '    Exit Sub
        'End If
        'If File1.filename = "" Then
        '    MsgBox "Please select a local file to put"
        '    Exit Sub
        'End If
        'szTempString = nodX.Text
        'szDirRemote = Right(szTempString, Len(szTempString) - Len(txtServer.Text))
        'szFileRemote = File1.filename
        'szFileLocal = File1.Path & "\" & File1.filename
        szDirRemote = "/record" '
        If (szDirRemote = "") Then szDirRemote = "\"
        rcd szDirRemote
        szFileLocal = "rec.avi" 'D:\pon\Temp\ClientVB\
        szFileRemote = "rec.avi" '
        
        bRet = FtpPutFile(hConnection, szFileLocal, szFileRemote, _
         dwType, 0)
        If bRet = False Then
            ErrorOut Err.LastDllError, "FtpPutFile"
            Exit Sub
        End If
        
        'Dim nodChild As Node, nodNextChild As Node
        'Set nodChild = nodX.Child
        'Do
        '  If nodChild Is Nothing Then Exit Do
        '  Set nodNextChild = nodChild.Next
        '    TreeView1.Nodes.Remove nodChild.Index
        '    If nodNextChild Is Nothing Then Exit Do
        '    Set nodChild = nodNextChild
        'Loop
        'If nodX.Image = "closed" Then
        '    nodX.Image = "open"
        'End If
        'FtpEnumDirectory (nodX.Text)
        'FillTreeViewControl (nodX.Text)
   End If
    'disconnect
    'bDirEmpty = True
    If hConnection <> 0 Then InternetCloseHandle hConnection
    hConnection = 0
    ClearBag
    'TreeView1.Nodes.Remove txtServer.Text
    bActiveSession = False
    'EnableUI (True)
    'form unload
    If hConnection <> 0 Then InternetCloseHandle (hConnection)
    If hOpen <> 0 Then InternetCloseHandle (hOpen)
    hConnection = 0
    hOpen = 0
    'If bActiveSession Then TreeView1.Nodes.Remove txtServer.Text
    bActiveSession = False
    'ClearTextBoxAndBag
    'EnableUI (False)
End Sub

Private Sub FtpEnumDirectory(strDirectory As String)
    
    ClearBag
    Dim hFind As Long
    Dim nLastError As Long
    Dim dError As Long
    Dim ptr As Long
    Dim pData As WIN32_FIND_DATA
    
    If Len(strDirectory) > 0 Then rcd (strDirectory)
    pData.cFileName = String(MAX_PATH, 0)
    hFind = FtpFindFirstFile(hConnection, "*.*", pData, 0, 0)
    nLastError = Err.LastDllError
    
    If hFind = 0 Then
        If (nLastError = ERROR_NO_MORE_FILES) Then
            MsgBox "This directory is empty!"
        Else
            ErrorOut nLastError, "FtpFindFirstFile"
        End If
        Exit Sub
    End If
    
    dError = NO_ERROR
    Dim bRet As Boolean
    Dim strItemName As String
    
    EnumItemAttributeBag.Add pData.dwFileAttributes
    strItemName = Left(pData.cFileName, InStr(1, pData.cFileName, String(1, 0), vbBinaryCompare) - 1)
    EnumItemNameBag.Add strItemName
    Do
        pData.cFileName = String(MAX_PATH, 0)
        bRet = InternetFindNextFile(hFind, pData)
        If Not bRet Then
            dError = Err.LastDllError
            If dError = ERROR_NO_MORE_FILES Then
                Exit Do
            Else
                ErrorOut dError, "InternetFindNextFile"
                InternetCloseHandle (hFind)
               Exit Sub
            End If
        Else
            EnumItemAttributeBag.Add pData.dwFileAttributes
            strItemName = Left(pData.cFileName, InStr(1, pData.cFileName, String(1, 0), vbBinaryCompare) - 1)
            EnumItemNameBag.Add strItemName
       End If
    Loop
    
    InternetCloseHandle (hFind)
End Sub

Function ErrorOut(dError As Long, szCallFunction As String)
    Dim dwIntError As Long, dwLength As Long
    Dim strBuffer As String
    If dError = ERROR_INTERNET_EXTENDED_ERROR Then
        InternetGetLastResponseInfo dwIntError, vbNullString, dwLength
        strBuffer = String(dwLength + 1, 0)
        InternetGetLastResponseInfo dwIntError, strBuffer, dwLength
        
        MsgBox szCallFunction & " Extd Err: " & dwIntError & " " & strBuffer
       
        
    End If
    If MsgBox(szCallFunction & " Err: " & dError & _
        vbCrLf & "Close Connection and Session?", vbYesNo) = vbYes Then
        If hConnection Then InternetCloseHandle hConnection
        If hOpen Then InternetCloseHandle hOpen
        hConnection = 0
        hOpen = 0
        'If bActiveSession Then TreeView1.Nodes.Remove txtServer.Text
        bActiveSession = False
        'ClearTextBoxAndBag
        ClearBag
        'EnableUI (False)
    End If
End Function

Private Sub ClearBag()
    Dim Num As Integer
    For Num = 1 To EnumItemNameBag.Count
        EnumItemNameBag.Remove 1
    Next Num
    For Num = 1 To EnumItemAttributeBag.Count
        EnumItemAttributeBag.Remove 1
    Next Num
End Sub

Private Sub rcd(pszDir As String)
    If pszDir = "" Then
        MsgBox "Please enter the directory to CD"
        Exit Sub
    Else
        Dim sPathFromRoot As String
        Dim bRet As Boolean
        If InStr(1, pszDir, "161.246.5.219") Then
        sPathFromRoot = Mid(pszDir, Len("161.246.5.219") + 1, Len(pszDir) - Len("161.246.5.219"))
        Else
        sPathFromRoot = pszDir
        End If
        If sPathFromRoot = "" Then sPathFromRoot = "/"
        bRet = FtpSetCurrentDirectory(hConnection, sPathFromRoot)
        If bRet = False Then ErrorOut Err.LastDllError, "rcd"
    End If
End Sub
