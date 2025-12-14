VERSION 5.00
Object = "{DF6D6558-5B0C-11D3-9396-008029E9B3A6}#1.0#0"; "ezVidC60.ocx"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmCapTest 
   Caption         =   "Security Robot Control"
   ClientHeight    =   5700
   ClientLeft      =   240
   ClientTop       =   270
   ClientWidth     =   10425
   Icon            =   "testMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   380
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   695
   Begin MSCommLib.MSComm MSComm1 
      Left            =   360
      Top             =   4680
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.CheckBox chkAudio 
      Caption         =   "Capture Audio"
      Height          =   240
      Left            =   6600
      TabIndex        =   26
      Top             =   1440
      Width           =   1320
   End
   Begin VB.CheckBox chkAutoSize 
      Caption         =   "AutoSize"
      Height          =   240
      Left            =   6600
      TabIndex        =   25
      Top             =   240
      Value           =   1  'Checked
      Width           =   1635
   End
   Begin VB.CheckBox chkCenter 
      Caption         =   "AutoCenter"
      Height          =   240
      Left            =   6600
      TabIndex        =   24
      Top             =   600
      Value           =   1  'Checked
      Width           =   1635
   End
   Begin VB.CheckBox chkStretch 
      Caption         =   "StretchPreview"
      Height          =   240
      Left            =   6600
      TabIndex        =   23
      Top             =   960
      Width           =   1635
   End
   Begin VB.CheckBox chkPreRoll 
      Caption         =   "Use Precise Capture Controls (Preroll)"
      Height          =   240
      Left            =   6600
      TabIndex        =   22
      Top             =   2400
      Width           =   3060
   End
   Begin VB.CheckBox chkUserConfirm 
      Caption         =   "Show VFW defined user dialog to confirm capture"
      Height          =   240
      Left            =   6600
      TabIndex        =   21
      Top             =   1920
      Width           =   3840
   End
   Begin VB.CheckBox chkPreview 
      Caption         =   "Preview video"
      Height          =   240
      Left            =   6600
      TabIndex        =   20
      Top             =   2880
      Width           =   1365
   End
   Begin VB.CheckBox chkFrameCallback 
      Caption         =   "Enable FrameCallback Event"
      Height          =   240
      Left            =   6600
      TabIndex        =   19
      Top             =   3360
      Width           =   2370
   End
   Begin VB.Frame Frame1 
      Caption         =   " Control "
      Height          =   1335
      Left            =   6360
      TabIndex        =   17
      Top             =   3840
      Width           =   3975
      Begin VB.CommandButton Command1 
         Caption         =   "Start Control"
         Height          =   255
         Left            =   240
         TabIndex        =   18
         Top             =   960
         Width           =   1695
      End
      Begin VB.Shape Shape4 
         FillColor       =   &H80000000&
         FillStyle       =   0  'Solid
         Height          =   375
         Left            =   3120
         Shape           =   5  'Rounded Square
         Top             =   840
         Width           =   375
      End
      Begin VB.Shape Shape2 
         FillColor       =   &H80000000&
         FillStyle       =   0  'Solid
         Height          =   375
         Left            =   2160
         Shape           =   5  'Rounded Square
         Top             =   840
         Width           =   375
      End
      Begin VB.Shape Shape3 
         FillColor       =   &H80000000&
         FillStyle       =   0  'Solid
         Height          =   375
         Left            =   2640
         Shape           =   5  'Rounded Square
         Top             =   840
         Width           =   375
      End
      Begin VB.Shape Shape1 
         FillColor       =   &H80000000&
         FillStyle       =   0  'Solid
         Height          =   375
         Left            =   2640
         Shape           =   5  'Rounded Square
         Top             =   360
         Width           =   375
      End
   End
   Begin VB.CommandButton cmdDisplayDlg 
      Caption         =   "Display DLG"
      Height          =   465
      Left            =   120
      TabIndex        =   16
      Top             =   720
      Width           =   1230
   End
   Begin vbVidC60.ezVidCap ezVidCap1 
      Height          =   3600
      Left            =   1560
      TabIndex        =   15
      Top             =   120
      Width           =   4800
      _ExtentX        =   8467
      _ExtentY        =   6350
   End
   Begin VB.CommandButton cmdSaveDIB 
      Caption         =   "Save DIB..."
      Height          =   300
      Left            =   4800
      TabIndex        =   14
      Top             =   3840
      Width           =   1230
   End
   Begin VB.CommandButton cmdSaveAs 
      Caption         =   "Save AVI..."
      Height          =   300
      Left            =   3240
      TabIndex        =   13
      Top             =   3840
      Width           =   1230
   End
   Begin VB.ComboBox cbDriver 
      Height          =   315
      ItemData        =   "testMain.frx":0442
      Left            =   3000
      List            =   "testMain.frx":0444
      Style           =   2  'Dropdown List
      TabIndex        =   12
      Top             =   4245
      Width           =   3210
   End
   Begin VB.TextBox txtWidth 
      Height          =   285
      Left            =   1800
      TabIndex        =   11
      Text            =   "160"
      Top             =   3900
      Width           =   615
   End
   Begin VB.CommandButton cmdWidth 
      Caption         =   "Set Width"
      Height          =   300
      Left            =   360
      TabIndex        =   10
      Top             =   3900
      Width           =   945
   End
   Begin VB.TextBox txtHeight 
      Height          =   285
      Left            =   1800
      TabIndex        =   9
      Text            =   "120"
      Top             =   4260
      Width           =   615
   End
   Begin VB.CommandButton cmdHeight 
      Caption         =   "Set Height"
      Height          =   300
      Left            =   360
      TabIndex        =   8
      Top             =   4260
      Width           =   945
   End
   Begin VB.CommandButton cmdAudioDlg 
      Caption         =   "Audio DLG"
      Height          =   465
      Left            =   120
      TabIndex        =   7
      Top             =   3120
      Width           =   1230
   End
   Begin VB.CommandButton cmdCompDlg 
      Caption         =   "Comp DLG"
      Height          =   465
      Left            =   120
      TabIndex        =   6
      Top             =   2520
      Width           =   1230
   End
   Begin VB.CommandButton cmdSourceDlg 
      Caption         =   "Source DLG"
      Height          =   465
      Left            =   120
      TabIndex        =   5
      Top             =   1920
      Width           =   1230
   End
   Begin VB.CommandButton cmdFormatDlg 
      Caption         =   "Format DLG"
      Height          =   465
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   1230
   End
   Begin VB.PictureBox picStatus 
      Align           =   2  'Align Bottom
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000F&
      Height          =   345
      Left            =   0
      ScaleHeight     =   19
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   691
      TabIndex        =   1
      Top             =   5355
      Width           =   10425
      Begin VB.Label lblStatusString 
         Alignment       =   2  'Center
         Caption         =   "status label"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2880
         TabIndex        =   3
         Top             =   75
         Width           =   2220
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblStatusCode 
         Alignment       =   2  'Center
         Caption         =   "status label"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   105
         TabIndex        =   2
         Top             =   60
         Width           =   2220
      End
   End
   Begin VB.CommandButton cmdCapture 
      Caption         =   "Capture Video"
      Height          =   465
      Left            =   120
      TabIndex        =   0
      Top             =   105
      Width           =   1230
   End
End
Attribute VB_Name = "frmCapTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Type stack
   state(30) As Integer
   top As Integer
End Type

Dim st As stack
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Run As Boolean
Private state As Integer

Private dir_lr As Integer
Private dir_ud As Integer

Private Sub clear_stack(st As stack)
    st.top = 0
End Sub

Private Function pop_stack(st As stack)
    If st.top > 0 Then
        pop_stack = st.state(st.top - 1)
        st.top = st.top - 1
    End If
End Function

Private Sub push_stack(st As stack, state As Integer)
     If st.top < 20 Then
         st.state(st.top) = state
         st.top = st.top + 1
    End If
End Sub
Private Sub cbDriver_Click()
    Dim oldDriver As Long
    oldDriver = ezVidCap1.DriverIndex
    
    On Error Resume Next
    ezVidCap1.DriverIndex = cbDriver.ListIndex
    If Err Then
        'restore old settings
        ezVidCap1.DriverIndex = oldDriver
        cbDriver.ListIndex = oldDriver
        lblStatusString = "Could not connect!"
    End If
    
End Sub

Private Sub chkAudio_Click()
    If chkAudio.Value = 1 Then
        ezVidCap1.CaptureAudio = True
    Else
        ezVidCap1.CaptureAudio = False
    End If
End Sub

Private Sub chkAutoSize_Click()
    If chkAutoSize.Value = 1 Then
        ezVidCap1.AutoSize = True
    Else
        ezVidCap1.AutoSize = False
    End If
End Sub

Private Sub chkCenter_Click()
    If chkCenter.Value = 1 Then
        ezVidCap1.CenterVideo = True
    Else
        ezVidCap1.CenterVideo = False
    End If
End Sub

Private Sub chkFrameCallback_Click()
    If chkFrameCallback.Value = 1 Then
        ezVidCap1.FrameEventEnabled = True
    Else
        ezVidCap1.FrameEventEnabled = False
    End If
End Sub

Private Sub chkPreRoll_Click()
    If chkPreRoll.Value = 1 Then
        ezVidCap1.UsePreciseCaptureControls = True
    Else
        ezVidCap1.UsePreciseCaptureControls = False
    End If
End Sub

Private Sub chkPreview_Click()
    If chkPreview.Value = 1 Then
        ezVidCap1.Preview = True
    Else
        ezVidCap1.Preview = False
    End If
End Sub

Private Sub chkStretch_Click()
    If chkStretch.Value = 1 Then
        ezVidCap1.StretchPreview = True
    Else
        ezVidCap1.StretchPreview = False
    End If
End Sub

Private Sub chkUserConfirm_Click()
    If chkUserConfirm.Value = 1 Then
        ezVidCap1.MakeUserConfirmCapture = True
    Else
        ezVidCap1.MakeUserConfirmCapture = False
    End If
End Sub

Private Sub cmdAudioDlg_Click()
    'From Beta2 the syntax has changed here
    'ezVidCap1.ShowDlgAudioFormat = True
    ezVidCap1.ShowDlgAudioFormat
End Sub

Private Sub cmdCapture_Click()
    Call ezVidCap1.CaptureVideo
End Sub

Private Sub cmdCompDlg_Click()
    'From Beta2 the syntax has changed here
    'ezVidCap1.ShowDlgCompressionOptions = True
    ezVidCap1.ShowDlgCompressionOptions
End Sub

Private Sub cmdDisplayDlg_Click()
    'From Beta2 the syntax has changed here
    'ezVidCap1.ShowDlgVideoDisplay = True
    ezVidCap1.ShowDlgVideoDisplay
End Sub

Private Sub cmdFormatDlg_Click()
    'From Beta2 the syntax has changed here
    'ezVidCap1.ShowDlgVideoFormat = True
    ezVidCap1.ShowDlgVideoFormat
End Sub

Private Sub cmdHeight_Click()
    ezVidCap1.Height = txtHeight.Text
    'show actual size (in case auto size is turned on)
    txtHeight.Text = ezVidCap1.Height
End Sub

Private Sub cmdSaveAs_Click()
    Dim filename As String
    If mCmnDlg.VBGetSaveFileNamePreview(filename, _
                            FileMustExist:=False, _
                            filter:="AVI files (*.avi)|*.avi", _
                            InitDir:=App.Path, _
                            DlgTitle:="Save AVI File", _
                            DefaultExt:="avi", _
                            Owner:=Me.hWnd) _
                                                    Then
        On Error Resume Next
        Call ezVidCap1.SaveAs(filename)
        If Err Then
            MsgBox Err.Description, vbInformation, App.Title
        End If
    End If
                            
End Sub

Private Sub cmdSaveDIB_Click()
    Dim filename As String
    If mCmnDlg.VBGetSaveFileName(filename, _
                            filter:="Bitmap files (*.bmp)|*.bmp", _
                            InitDir:=App.Path, _
                            DlgTitle:="Save Frame As Bitmap File", _
                            DefaultExt:="bmp", _
                            Owner:=Me.hWnd) _
                                                    Then
        On Error Resume Next
        Call ezVidCap1.SaveDIB(filename)
        If Err Then
            MsgBox Err.Description, vbInformation, App.Title
        End If
    End If
End Sub

Private Sub cmdSourceDlg_Click()
    'From Beta2 the syntax has changed here
    'ezVidCap1.ShowDlgVideoSource = True
    ezVidCap1.ShowDlgVideoSource
End Sub

Private Sub cmdWidth_Click()
    ezVidCap1.Width = txtWidth.Text
    'show actual size (in case auto size is turned on)
    txtWidth.Text = ezVidCap1.Width
End Sub

Private Sub ezVidCap1_StatusClear()
    lblStatusCode.Caption = ""
    lblStatusString.Caption = ""
End Sub

Private Sub Command1_Click()
    Run = True
    Sending
End Sub
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    MSComm1.Output = Chr$(KeyCode)
End Sub

Private Sub Sending()
Dim Found As Boolean
Dim nextstate As Integer
state = 17
nextstate = 17
Found = False
        
Dim countL As Integer, countR As Integer, countU As Integer, countD As Integer
countL = 0
countR = 0
countU = 0
countD = 0
Dim step As Integer, step2 As Integer

Dim pressL As Boolean
Dim pressR As Boolean
Dim pressU As Boolean
Dim pressD As Boolean
Dim OverPop As Boolean

                    
Dim i As Integer
OverPop = False
pressL = False
pressR = False
pressU = False
pressD = False


Dim delayT As Single, delayT2 As Single

step = 4
step2 = 2
delayT = 0.6
delayT2 = 0.3


While Run
 dir_lr = 0
 dir_ud = 0

  If (GetAsyncKeyState(vbKeyRight) < 0) Then ' if Right arrow is pressed
        If countL < step Then
                    Shape4.FillColor = &HFF8080
                    OverPop = False
                    pressL = True
                    dir_lr = 1
                    'Text1.Text = Text1.Text & nextstate & "       "
                         MSComm1.Output = Chr$(nextstate)
                    Select Case state
                        Case 17, 33, 65, 129: nextstate = state + 1
                        Case 18, 34, 66, 130: nextstate = state + 2
                        Case 20, 36, 68, 132: nextstate = state + 4
                        Case 24, 40, 72, 136: nextstate = state - 7
                    End Select
                 countL = countL + 1
                MSComm1.Output = Chr$(nextstate)
                 DelayTime (delayT)
                 push_stack st, state
        End If
    Else
       If pressL Then
                    Shape4.FillColor = &H80000000
                    pressL = False
                    
'                    If Not (OverPop) Then
'                        pop_stack st
'                        OverPop = True
'                        countL = countL - 1
'                    End If
                    
                    For i = 1 To countL
                         state = pop_stack(st)
                         nextstate = state
                         '*******************************************
                         DelayTime (delayT)
                         '******************************************

                         'Text1.Text = Text1.Text & CStr(state) & "       "
                        ' MSComm1.Output = Chr$(state)
                         MSComm1.Output = Chr$(state)
                    Next i
                   ' Text1.Text = Text1.Text & Chr(13) & Chr(10)
                    countL = 0
         End If
    End If
        
    If (GetAsyncKeyState(vbKeyLeft) < 0) Then ' if Left arrow is pressed
        If countR < step Then
                    Shape2.FillColor = &HFF8080
                    OverPop = False
                    pressR = True
                    dir_lr = 2
                    'Text1.Text = Text1.Text & nextstate & "       "
                         MSComm1.Output = Chr$(nextstate)
                    Select Case state
                        Case 17, 33, 65, 129: nextstate = state + 7
                        Case 18, 34, 66, 130: nextstate = state - 1
                        Case 20, 36, 68, 132: nextstate = state - 2
                        Case 24, 40, 72, 136: nextstate = state - 4
                    End Select
                 countR = countR + 1
                MSComm1.Output = Chr$(nextstate)
                 DelayTime (delayT)
                 push_stack st, state
        End If
    Else
       If pressR Then

                    pressR = False
                    Shape2.FillColor = &H80000000
'                    If Not (OverPop) Then
'                        pop_stack st
'                        OverPop = True
'                        countR = countR - 1
'                    End If

                    

                    For i = 1 To countR
                         state = pop_stack(st)
                         nextstate = state
                         '*******************************************
                         DelayTime (delayT)
                         '******************************************

                        ' Text1.Text = Text1.Text & CStr(state) & "       "
                         MSComm1.Output = Chr$(state)
                         MSComm1.Output = Chr$(state)
                    Next i
                    'Text1.Text = Text1.Text & Chr(13) & Chr(10)
                    countR = 0
         End If
    End If
    
    
     If (GetAsyncKeyState(vbKeyUp) < 0) Then ' if up arrow is pressed
        If countU < step2 Then
                    Shape1.FillColor = &HFF8080
                    OverPop = False
                    pressU = True
                    dir_ud = 1
                    'Text1.Text = Text1.Text & nextstate & "       "
                         MSComm1.Output = Chr$(nextstate)
                    Select Case state
                        Case 17, 18, 20, 24: nextstate = state + 16
                        Case 33, 34, 36, 40: nextstate = state + 32
                        Case 65, 66, 68, 72: nextstate = state + 64
                        Case 129, 130, 132, 136: nextstate = state - 112
                    End Select
                 countU = countU + 1
                 MSComm1.Output = Chr$(nextstate)
                 DelayTime (delayT2)
                 push_stack st, state
        End If
    Else
       If pressU Then
                    Shape1.FillColor = &H80000000
                    pressU = False
                    'pop_stack st
                    'countU = countU - 1
                     
'                    If Not (OverPop) Then
'                        pop_stack st
'                        OverPop = True
'                        countU = countU - 1
'                    End If
                    
                    For i = 1 To countU
                         state = pop_stack(st)
                         nextstate = state
                         '*******************************************
                         DelayTime (delayT)
                         '******************************************
 
                         'Text1.Text = Text1.Text & CStr(state) & "       "
                         MSComm1.Output = Chr$(state)
                         MSComm1.Output = Chr$(state)
                    Next i
                    'Text1.Text = Text1.Text & Chr(13) & Chr(10)
                    countU = 0
         End If
    End If


    If (GetAsyncKeyState(vbKeyDown) < 0) Then ' if down arrow is pressed
        If countD < step2 Then
                    Shape3.FillColor = &HFF8080
                    OverPop = False
                    pressD = True
                    dir_ud = 2
                    'Text1.Text = Text1.Text & nextstate & "       "
                    MSComm1.Output = Chr$(nextstate)
                    Select Case state
                        Case 17, 18, 20, 24: nextstate = state + 112
                        Case 33, 34, 36, 40: nextstate = state - 16
                        Case 65, 66, 68, 72: nextstate = state - 32
                        Case 129, 130, 132, 136: nextstate = state - 64
                    End Select
                 countD = countD + 1
                 MSComm1.Output = Chr$(nextstate)
                 DelayTime (delayT2)
                 push_stack st, state
        End If
    Else
       If pressD Then
                    Shape3.FillColor = &H80000000
                    pressD = False
'                    pop_stack st
'                    countD = countD - 1
                     
'                    If Not (OverPop) Then
'                        pop_stack st
'                        OverPop = True
'                        countD = countD - 1
'                    End If
                    
                    For i = 1 To countD
                         state = pop_stack(st)
                         nextstate = state
                         '*******************************************
                         DelayTime (delayT)
                         '******************************************
 
                         'Text1.Text = Text1.Text & CStr(state) & "       "
                         MSComm1.Output = Chr$(state)
                         'MSComm1.Output = Chr$(state)
                    Next i
                    'Text1.Text = Text1.Text & Chr(13) & Chr(10)
                    countD = 0
         End If
    End If


    
    

        state = nextstate
        
        DoEvents

                
                
    Wend
End Sub
Private Sub ezVidCap1_CaptureYield()
    'Setting Yield = True will allow this event to be generated
    'but will slow down performance
    Debug.Print "yield"
    DoEvents
End Sub

Private Sub ezVidCap1_ErrorMessage(ByVal ErrCode As Long, ByVal ErrString As String)
    If ErrCode <> 0 Then
        'Debug.Print ErrString
        lblStatusString = "Error " & ErrString
        lblStatusString.Refresh
    End If
End Sub

Private Sub ezVidCap1_FrameCallback(ByVal lpVHdr As Long)
Debug.Print "Video frame: " & lpVHdr

Call MessWithVidBits(lpVHdr)

End Sub

Private Sub ezVidCap1_PreRollComplete()
    Dim userRet As Long
    
    userRet = MsgBox("Using precise capture controls." & vbCrLf & _
                                    "PreRoll complete - Click OK to start capture immediately." _
                                    , vbOKCancel, App.Title)
    If userRet = vbOK Then
        ezVidCap1.PreciseCaptureStart
    Else
        ezVidCap1.PreciseCaptureCancel
    End If
End Sub

Private Sub ezVidCap1_StatusMessage(ByVal StatCode As Long, ByVal StatString As String)
lblStatusCode.Caption = "StatusCode: " & StatCode
lblStatusCode.Refresh
If StatCode <> 0 Then
    'Debug.Print StatString
    lblStatusString.Caption = StatString
    lblStatusString.Refresh
End If
End Sub
Private Sub EnableButtons()
    cmdAudioDlg.Enabled = False
    cmdFormatDlg.Enabled = False
    cmdDisplayDlg.Enabled = False
    cmdSourceDlg.Enabled = False
    cmdCapture.Enabled = False
    cmdCompDlg.Enabled = False
    
    With ezVidCap1
        If .NumCapDevs > 0 Then
            cmdCapture.Enabled = True
            cmdCompDlg.Enabled = True
        End If
        If .HasAudio Then cmdAudioDlg.Enabled = True
        If .HasDlgFormat Then cmdFormatDlg.Enabled = True
        If .HasDlgDisplay Then cmdDisplayDlg.Enabled = True
        If .HasDlgSource Then cmdSourceDlg.Enabled = True
    End With
End Sub

Private Sub ezVidCap1_VideoStreamCallback(ByVal lpVHdr As Long)
Debug.Print "Video stream: " & lpVHdr
End Sub

Private Sub ezVidCap1_WaveStreamCallback(ByVal lpWHdr As Long)
Debug.Print "Wave stream: " & lpWHdr
End Sub



Private Sub Form_Load()

'THE FOLLOWING 2 LINES ARE UNNECESSARY AFTER BETA2
'Me.Show 'control will not connect to capdevice until it is shown
'        'it must be initialized by being shown before you can read some of the properties
'DoEvents 'allows driver to connect

Dim i As Long

Call EnableButtons 'check device caps and enable appropriate btns
Me.Show 'show form
Me.Refresh
If 0 < ezVidCap1.NumCapDevs Then
    For i = 0 To ezVidCap1.NumCapDevs - 1
        cbDriver.AddItem (ezVidCap1.GetDriverName(i))
    Next
    cbDriver.ListIndex = ezVidCap1.DriverIndex
Else
    cbDriver.AddItem ("<none>")
    cbDriver.ListIndex = 0
    MsgBox "No Video Capture Device!", vbInformation, App.Title
End If

'init form with current properties
lblStatusCode = "Status Panel"
lblStatusString = ezVidCap1.GetDriverVersion()
txtWidth = ezVidCap1.Width
txtHeight = ezVidCap1.Height
chkAutoSize.Value = -(ezVidCap1.AutoSize)
chkCenter.Value = -(ezVidCap1.CenterVideo)
chkStretch.Value = -(ezVidCap1.StretchPreview)
chkAudio.Value = -(ezVidCap1.CaptureAudio)
chkPreRoll.Value = -(ezVidCap1.UsePreciseCaptureControls)
chkUserConfirm.Value = -(ezVidCap1.MakeUserConfirmCapture)
chkPreview.Value = -(ezVidCap1.Preview)
chkFrameCallback.Value = -(ezVidCap1.FrameEventEnabled)

        MSComm1.Settings = "9600,N,8,1"
          MSComm1.CommPort = 1
          MSComm1.InputLen = 1
          MSComm1.PortOpen = True
          MSComm1.RThreshold = 1
        clear_stack st
End Sub

Private Sub Form_Resize()
'this is just to provide a nice status bar with no control
With picStatus
    lblStatusCode.Move 0, 0, .Width * 0.25, .Height
    lblStatusString.Move .Width * 0.25, 0, .Width * 0.75, .Height
End With

End Sub

Private Sub Form_Unload(Cancel As Integer)
    Run = False
    MSComm1.PortOpen = False
End Sub

Public Sub DelayTime(DelayTime) ' รูทีนการหน่วงเวลาหน่วยวินาที
Dim LoopTime As Long  'กำหนดจำนวนรอบเวลา
Const SecInDay = 86400  ' จำนวนวินาทีใน1วัน
LoopTime = Timer + DelayTime 'กำหนดจำนวนรอบเวลาบวกกับค่าที่เราต้องการตั้ง
If LoopTime > SecInDay Then  ' เมื่อไรที่ค่าจำนวนรอบเวลายังน้อยกว่าจำนวนวินาทีใน1วัน
    LoopTime = LoopTime - SecInDay 'ให้นำจำนวนวินาทีใน1วันลบค่าจำนวนรอบเวลา
    Do While Timer > LoopTime ' เมื่อไรที่ค่าเวลาของเครื่องยังมากกว่าค่าจำนวนรอบเวลา
     DoEvents  ' ปล่อยให้ CPU ไปประมวลผลอย่างอื่นบ้าง
    Loop  ' กลับไปตรวจสอบเงื่อนไขใหม่
End If
Do While Timer < LoopTime ' เมื่อไรที่ค่าเวลาของเครื่องยังน้อยกว่าค่าจำนวนรอบเวลา
        DoEvents  ' ปล่อยให้ CPU ไปประมวลผลอย่างอื่นบ้าง
Loop
' กลับไปตรวจสอบเงื่อนไขใหม่ ถ้าตรงเงื่นไอขก็เป็นอันว่าจบการตั้งเวลาออกจากรูทีน
End Sub

