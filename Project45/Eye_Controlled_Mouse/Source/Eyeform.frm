VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{DF6D6558-5B0C-11D3-9396-008029E9B3A6}#1.0#0"; "ezVidC60.ocx"
Begin VB.Form Eyeform 
   Caption         =   "Eye-Controlled Mouse"
   ClientHeight    =   6030
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8190
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   ScaleHeight     =   402
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   546
   Begin VB.Frame Frame2 
      Caption         =   "Speed Mouse"
      Height          =   855
      Left            =   120
      TabIndex        =   27
      Top             =   4560
      Width           =   4095
      Begin MSComctlLib.Slider SpeedMouse 
         Height          =   375
         Left            =   120
         TabIndex        =   28
         Top             =   240
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   661
         _Version        =   393216
         Min             =   10
         Max             =   50
         SelStart        =   20
         Value           =   20
      End
      Begin VB.Label Label17 
         BackStyle       =   0  'Transparent
         Caption         =   "Fast"
         Height          =   255
         Left            =   3360
         TabIndex        =   30
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Label16 
         BackStyle       =   0  'Transparent
         Caption         =   "Slow"
         Height          =   255
         Left            =   120
         TabIndex        =   29
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Stable Mouse"
      Height          =   855
      Left            =   4680
      TabIndex        =   25
      Top             =   4560
      Width           =   2895
      Begin MSComctlLib.Slider StableMouse 
         Height          =   375
         Left            =   120
         TabIndex        =   26
         Top             =   240
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   661
         _Version        =   393216
         Min             =   1
         Max             =   5
         SelStart        =   2
         Value           =   2
      End
      Begin VB.Label Label19 
         BackStyle       =   0  'Transparent
         Caption         =   "more"
         Height          =   255
         Left            =   2400
         TabIndex        =   32
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label18 
         BackStyle       =   0  'Transparent
         Caption         =   "less"
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Top             =   600
         Width           =   495
      End
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2280
      Top             =   5520
   End
   Begin VB.Frame OptionCapture 
      Caption         =   "Option Capture"
      Height          =   615
      Left            =   4320
      TabIndex        =   22
      Top             =   3840
      Width           =   3615
      Begin VB.OptionButton OldEngine 
         Caption         =   "Old Engine(Fast)"
         Height          =   255
         Left            =   1800
         TabIndex        =   24
         Top             =   240
         Width           =   1695
      End
      Begin VB.OptionButton NewEngine 
         Caption         =   "New Engine(Slow)"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Value           =   -1  'True
         Width           =   1695
      End
   End
   Begin VB.CommandButton ExitCtrl 
      Caption         =   "ExitCtrl"
      Height          =   375
      Left            =   4080
      TabIndex        =   21
      Top             =   120
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CommandButton ExitButton 
      Caption         =   "Exit"
      Height          =   375
      Left            =   6720
      TabIndex        =   20
      Top             =   5520
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   2910
      Left            =   4200
      ScaleHeight     =   192
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   256
      TabIndex        =   19
      Top             =   120
      Width           =   3870
   End
   Begin VB.Frame Mode 
      Caption         =   "Mode Capture"
      Height          =   615
      Left            =   240
      TabIndex        =   14
      Top             =   3840
      Width           =   3855
      Begin VB.OptionButton Paper 
         Caption         =   "Paper"
         Height          =   255
         Left            =   2760
         TabIndex        =   17
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton RightEye 
         Caption         =   "Right Eye"
         Height          =   255
         Left            =   1440
         TabIndex        =   16
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton LeftEye 
         Caption         =   "Left Eye"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   240
         Value           =   -1  'True
         Width           =   975
      End
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1320
      Top             =   5520
   End
   Begin VB.TextBox timeSec 
      Height          =   375
      Left            =   5520
      TabIndex        =   10
      Text            =   "3"
      Top             =   3240
      Width           =   495
   End
   Begin VB.TextBox Area 
      Height          =   375
      Left            =   6960
      TabIndex        =   9
      Text            =   "50"
      Top             =   3240
      Width           =   495
   End
   Begin VB.CommandButton StartButton 
      Caption         =   "Start"
      Height          =   375
      Left            =   5280
      TabIndex        =   8
      Top             =   5520
      Width           =   1215
   End
   Begin VB.TextBox XBlock 
      Height          =   375
      Left            =   1320
      TabIndex        =   1
      Text            =   "20"
      Top             =   3240
      Width           =   495
   End
   Begin VB.TextBox YBlock 
      Height          =   375
      Left            =   3000
      TabIndex        =   0
      Text            =   "20"
      Top             =   3240
      Width           =   495
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   360
      Top             =   5520
   End
   Begin vbVidC60.ezVidCap ezVidCap1 
      Height          =   2910
      Left            =   120
      TabIndex        =   18
      Top             =   120
      Width           =   3870
      _ExtentX        =   6826
      _ExtentY        =   5133
      AutoSize        =   0   'False
      StretchPreview  =   -1  'True
   End
   Begin VB.Label Label14 
      Caption         =   "Status"
      Height          =   255
      Left            =   4200
      TabIndex        =   13
      Top             =   2520
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label12 
      Caption         =   "Time sec."
      Height          =   255
      Left            =   4560
      TabIndex        =   12
      Top             =   3240
      Width           =   735
   End
   Begin VB.Label Label11 
      Caption         =   "Area"
      Height          =   255
      Left            =   6360
      TabIndex        =   11
      Top             =   3240
      Width           =   375
   End
   Begin VB.Label Label10 
      Caption         =   "X Block"
      Height          =   495
      Left            =   480
      TabIndex        =   7
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label Label9 
      Caption         =   "Y Block"
      Height          =   375
      Left            =   2160
      TabIndex        =   6
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label OutX 
      Caption         =   "OutX"
      Height          =   375
      Left            =   4200
      TabIndex        =   5
      Top             =   720
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label OutY 
      Caption         =   "OutY"
      Height          =   375
      Left            =   4200
      TabIndex        =   4
      Top             =   1080
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label Xmove 
      Caption         =   "Xmove"
      Height          =   255
      Left            =   4200
      TabIndex        =   3
      Top             =   1560
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label Ymove 
      Caption         =   "Ymove"
      Height          =   375
      Left            =   4200
      TabIndex        =   2
      Top             =   1920
      Visible         =   0   'False
      Width           =   855
   End
End
Attribute VB_Name = "Eyeform"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Option Explicit
'Private Declare Function CopyIcon Lib "user32" (ByVal hIcon As Long) As Long
'Private Declare Function LoadCursorFromFile Lib "user32" Alias "LoadCursorFromFileA" (ByVal lpFileName As String) As Long
'Private Declare Function SetSystemCursor Lib "user32" (ByVal hcur As Long, ByVal id As Long) As Long
'Private Const OCR_NORMAL As Long = 32512


Dim hDCMaster As Long
Dim hDCEdit As Long
Dim hBMPMaster As Long
Dim hBMPEdit As Long

Dim ModeCap As Integer
Dim OptionCap As Integer

Dim aRed(), aGreen(), aBlue() As Variant

Dim px, py As Long
Dim CheckCtrlMouse As Boolean

Dim Center As Position

'----------------------------------------------mouse new--------------------------------------------
Dim CheckFirstCallMoveMouse As Boolean
Dim CheckFirstCallClickMouse As Boolean

Dim PreviousPos As Position
Dim MousePos As POINTAPI

Dim PreviousCur As PosTime

Dim StatusWaitInputMouse As Integer

Dim EyePicX As Integer
Dim EyePicY As Integer

Dim SpdMouse As Integer
Dim BWnd As Integer
Dim SWnd As Integer

'-------------------------------------------------Click-----------------------------------------------------------------
Dim StatusDrag As Boolean

'---------------------------------------------- Mouse API ----------------------------------------------------------------------
'Dim ValueX As Double
'Dim ValueY As Double

Dim ScrX As Long
Dim ScrY As Long

Dim SizeX As Integer
Dim SizeY As Integer

Dim ClickTime As Integer

'Dim choice As Integer
'Dim CurX, CurY As Long
'Dim CheckTime, TimeLimit As Integer
'Dim CheckSwap As Boolean
'Dim RECTrang As Long
'Dim cx, cy As Long
'Dim PathIcon As String
'Dim a As Integer

'------------------------------------------------Mouse Position------------------------------------------------------


'-----------------------------------------------Cursor----------------------------------------------------
Dim oldhcurs As Long
Dim newhcurs As Long
Dim midhcurs As Long



Dim DirNewIcon As String
Dim DirGoldMouse As String
Dim DirArrow As String
'--------------------------------------------------Time---------------------------------------------------------------
Dim OldTime, NewTime As Integer
Dim StartAgin As Boolean

Private Sub Area_Change()
    SWnd = Val(Area.Text)
End Sub

'-------------------------------------------------Zoom-----------------------------------------------------------------



Private Sub ExitButton_Click()
    End
End Sub

Private Sub ExitCtrl_Click()
    Timer2.Enabled = False
    Timer3.Enabled = False
    CheckFirstCallMoveMouse = False
    StatusDrag = False
    
    Eyeform.Width = 8310
    Eyeform.Height = 6540
    
    ExitCtrl.Visible = False
   'ExitCtrl.Enabled = False
   OutX.Visible = False
   'OutX.Enabled = False
   OutY.Visible = False
   'OutY.Enabled = False
   Xmove.Visible = False
   'Xmove.Enabled = False
   Ymove.Visible = False
   'Ymove.Enabled = False
   Label14.Visible = False
   'Label14.Enabled = False
   
   
   
   Label10.Visible = True
   'Label10.Enabled = True
   XBlock.Visible = True
   'XBlock.Enabled =True
   Label9.Visible = True
   'Label9.Enabled = True
   YBlock.Visible = True
   'YBlock.Enabled = True
   Label12.Visible = True
   'Label12.Enabled = True
   timeSec.Visible = True
   'timeSec.Enabled = True
   Label11.Visible = True
   'Label11.Enabled = True
   Area.Visible = True
   'Area.Enabled = True
   
   
   Picture1.Visible = True
   'Picture1.Enable = True
   Mode.Visible = True
   'Mode.Enabled =True
   OptionCapture.Visible = True
   'OptionCapture.Enabled =true
   Frame1.Visible = True
   'Frame1.Enabled =True
   Frame2.Visible = True
   'Frame2.Enabled = True
   
   StartButton.Visible = True
   'StartButton.Enabled = True
   ExitButton.Visible = True
   'ExitButton.Enabled = True
    
    DirArrow = Space(255)
    DirArrow = "C:\Program Files\Project1\3dwarro.cur"
    oldhcurs = LoadCursorFromFile(DirArrow)
    Call SetSystemCursor(oldhcurs, OCR_NORMAL)
End Sub

Private Sub Form_Load()
'****************************Initialize***********************************
   Call MakeTopMost(hwnd)  'Away on top
   
   SizeX = Val(XBlock.Text)
   SizeY = Val(YBlock.Text)
   ClickTime = Val(timeSec.Text)
   
   
   CheckFirstCallMoveMouse = False
   CheckFirstCallClickMouse = False
   StatusWaitInputMouse = 0
   
   Timer1.Enabled = True
   Timer2.Enabled = False
   Timer3.Enabled = False
   
   ExitCtrl.Visible = False
   'ExitCtrl.Enabled = False
   OutX.Visible = False
   'OutX.Enabled = False
   OutY.Visible = False
   'OutY.Enabled = False
   Xmove.Visible = False
   'Xmove.Enabled = False
   Ymove.Visible = False
   'Ymove.Enabled = False
   Label14.Visible = False
   'Label14.Enabled = False
   
   
   
   Label10.Visible = True
   'Label10.Enabled = True
   XBlock.Visible = True
   'XBlock.Enabled =True
   Label9.Visible = True
   'Label9.Enabled = True
   YBlock.Visible = True
   'YBlock.Enabled = True
   Label12.Visible = True
   'Label12.Enabled = True
   timeSec.Visible = True
   'timeSec.Enabled = True
   Label11.Visible = True
   'Label11.Enabled = True
   Area.Visible = True
   'Area.Enabled = True
   
   
   Picture1.Visible = True
   'Picture1.Enable = True
   Mode.Visible = True
   'Mode.Enabled =True
   OptionCapture.Visible = True
   'OptionCapture.Enabled =true
   Frame1.Visible = True
   'Frame1.Enabled =True
   Frame2.Visible = True
   'Frame2.Enabled = True
   
   StartButton.Visible = True
   'StartButton.Enabled = True
   ExitButton.Visible = True
   'ExitButton.Enabled = True
   
   
   BWnd = 25
   SWnd = Val(Area.Text)
   SpdMouse = SpeedMouse.Value
   
   StatusDrag = False
'***************************Create MemDC**********************************
    hDCMaster = CreateCompatibleDC(Picture1.hDC)
    'hBMP = CreateCompatibleBitmap(Picture1.hdc, Picture1.ScaleWidth, Picture1.ScaleHeight)
    hBMPMaster = CreateCompatibleBitmap(Picture1.hDC, 256, 192)
    SelectObject hDCMaster, hBMPMaster
    hDCEdit = CreateCompatibleDC(Picture1.hDC)
    'hBMP = CreateCompatibleBitmap(Picture5.hdc, Picture5.ScaleWidth, Picture5.ScaleHeight)
    hBMPEdit = CreateCompatibleBitmap(Picture1.hDC, 256, 192)
    SelectObject hDCEdit, hBMPEdit
    
'set mode 0 is LeftEye,1 is RightEye,2 is Paper
    ModeCap = 0
    OptionCap = 0
    
'***************Picture Size*********************
'EyePicX = 200
EyePicX = 256
'EyePicY = 200
EyePicY = 192
'*****************Screen Size******************
ScrX = 1024
ScrY = 768
'***************Swap Mode Variable***********
CheckTime = 0
TimeLimit = timeSec.Text
RECTrang = Area.Text
'******************Set Icon When Swap Mode*****************************
DirNewIcon = Space(255)
DirNewIcon = "C:\Program Files\Project1\MOUSE2.ANI"
newhcurs = LoadCursorFromFile(DirNewIcon)

DirGoldMouse = Space(255)
DirGoldMouse = "C:\Program Files\Project1\DINOSAUR.ANI"
midhcurs = LoadCursorFromFile(DirGoldMouse)

DirArrow = Space(255)
DirArrow = "C:\Program Files\Project1\3dwarro.cur"
oldhcurs = LoadCursorFromFile(DirArrow)

Call SetSystemCursor(oldhcurs, OCR_NORMAL)

End Sub

Private Sub Label2_Click()

End Sub

Private Sub LeftEye_Click()
    ModeCap = 0
End Sub

Private Sub RightEye_Click()
    ModeCap = 1
End Sub

Private Sub Paper_Click()
    ModeCap = 2
End Sub

Private Sub NewEngine_Click()
    OptionCap = 0
End Sub

Private Sub OldEngine_Click()
    OptionCap = 1
End Sub

Private Sub StableMouse_Click()
    BWnd = StableMouse.Value * 10
End Sub



Private Sub StartButton_Click()

Eyeform.Top = 0
Eyeform.Left = 0
Timer2.Enabled = True
Timer3.Enabled = True
StatusWaitInputMouse = 0
CheckFirstCallMoveMouse = False

StatusDrag = False

Eyeform.Width = 5500
Eyeform.Height = 3650

    ExitCtrl.Visible = True
    ExitCtrl.Enabled = True
   OutX.Visible = True
   'OutX.Enabled = True
   OutY.Visible = True
   'OutY.Enabled = True
   Xmove.Visible = True
   'Xmove.Enabled = True
   Ymove.Visible = True
   'Ymove.Enabled = True
   Label14.Visible = True
   'Label14.Enabled = True
   
   
   
   Label10.Visible = False
   'Label10.Enabled = False
   XBlock.Visible = False
   'XBlock.Enabled =False
   Label9.Visible = False
   'Label9.Enabled = False
   YBlock.Visible = False
   'YBlock.Enabled = False
   Label12.Visible = False
   'Label12.Enabled = False
   timeSec.Visible = False
   'timeSec.Enabled = False
   Label11.Visible = False
   'Label11.Enabled = False
   Area.Visible = False
   'Area.Enabled = False
   
   
   Picture1.Visible = False
   'Picture1.Enable = False
   Mode.Visible = False
   'Mode.Enabled =False
   OptionCapture.Visible = False
   'OptionCapture.Enabled = False
   Frame1.Visible = False
   'Frame1.Enabled =False
   Frame2.Visible = False
   'Frame2.Enabled = False
   
   StartButton.Visible = False
   'StartButton.Enabled = False
   ExitButton.Visible = False
   'ExitButton.Enabled =False


SetCursorPos Fix(ScrX / 2), Fix(ScrX / 2)
StartAgin = True
'Timer1.Enabled = True
Drop = False
End Sub



Private Sub Timer1_Timer()
Dim color As Long
    Picture1.Width = ezVidCap1.Width
    Picture1.Height = ezVidCap1.Height
    Picture1.ScaleWidth = 256
    Picture1.ScaleHeight = 192
    hDCMaster = GetDC(ezVidCap1.hwnd)
    px = Picture1.ScaleWidth - 1
    py = Picture1.ScaleHeight - 1
   
    'ReDim aRed(px, py), aBlue(px, py), aGreen(px, py)
    
'***********************Paint Part of Zoom****************************
    Call PaintBorder(hDCMaster, ModeCap)
   
'********************************************************************
'**************************Start Section 1***************************
'********************************************************************

'***********************Test Don't Zoom*******************************
'    BitBlt hDCEdit, 0, 0, Picture1.ScaleWidth, Picture1.ScaleHeight, hDCMaster, 0, 0, vbSrcCopy  'No Zoom
    
'    For x = 31 To 159
'        SetPixel hDCEdit, x, 72, RGB(255, 0, 0)  'use
'        SetPixel hDCEdit, x, 168, RGB(255, 0, 0) 'use
'    Next x
'    For y = 72 To 168
'        SetPixel hDCEdit, 31, y, RGB(0, 255, 0)  'use
'        SetPixel hDCEdit, 159, y, RGB(0, 255, 0) 'use
'    Next y

'****************************Zoom************************************
   'Dim ZoomS As Integer
   'ZoomS = Slider1.Value
    If ModeCap = 0 Then
        StretchBlt hDCEdit, 0, 0, Picture1.ScaleWidth, Picture1.ScaleHeight, hDCMaster, 31, 72, 128, 96, vbSrcCopy
    ElseIf ModeCap = 1 Then
        StretchBlt hDCEdit, 0, 0, Picture1.ScaleWidth, Picture1.ScaleHeight, hDCMaster, 95, 72, 128, 96, vbSrcCopy
    ElseIf ModeCap = 2 Then
        StretchBlt hDCEdit, 0, 0, Picture1.ScaleWidth, Picture1.ScaleHeight, hDCMaster, 63, 24, 128, 96, vbSrcCopy

    End If
    
'**********************************************************************
'**************************Start Section 2***************************
'**********************************************************************
    Center = SearchCenter(hDCEdit, px, py, ModeCap, OptionCap)
    
    
'**********************************************************************
'**************************Start Section 3***************************
'**********************************************************************
        


''**********************************************Mapping****************************************
'ValueX = Center.x
'For i = 1 To XBlock.Text
'    If ValueX < (i * (EyePicX / XBlock.Text)) Then
'        XPart = i
'       Exit For
'    End If
'Next
'    OutX.Caption = XPart
'
'ValueY = Center.y
'For i = 1 To YBlock.Text
'    If ValueY < (i * (EyePicY / YBlock.Text)) Then
'        YPart = i
'       Exit For
'    End If
'Next
'OutY.Caption = YPart
'
'MousePos.x = ScrX - Fix(XPart * (ScrX / XBlock))
'MousePos.y = ScrY - Fix(YPart * (ScrY / YBlock))

'GetCursorPos MousePosCurrent
'PosX = MousePosCurrent.x
'PosY = MousePosCurrent.y
''**************************************************************************************************
''!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SWAP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
'If CheckSwap = True And CheckTime >= TimeLimit Then
'
'If (Center.X <= Fix(EyePicX / 2) + 10 And Center.Y <= Fix(EyePicY / 2) + 10) And (Center.X >= Fix(EyePicX / 2) - 10 And Center.Y >= Fix(EyePicY / 2) - 10) Then
''Don't do anyting
'    Label14.Caption = "noting1"
'Else
'    If (Center.Y + (EyePicY / EyePicX) * Center.X < EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X < 0) Then
'    'Down->Double Click
'        If Drop = True Then
'              Call mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
'              Drop = False
'        Else
'             Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
'            Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
'            Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
'            Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
'    End If
'    Label14.Caption = "Down"
'    ElseIf (Center.Y + (EyePicY / EyePicX) * Center.X <= EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X >= 0) Then
'    'Right->Click Right
'        If Drop = True Then
'            Call mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
'            Drop = False
'        Else
'            Call mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0)
'            Call mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
'        End If
'    Label14.Caption = "Right"
'    ElseIf (Center.Y + (EyePicY / EyePicX) * Center.X >= EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X <= 0) Then
'    'Left->Click Left
'        If Drop = True Then
'            Call mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
'            Drop = False
'        Else
'            Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
'            Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
'        End If
'    Label14.Caption = "Left"
'    ElseIf (Center.Y + (EyePicY / EyePicX) * Center.X > EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X > 0) Then
'    'Up->Drag
'        If Drop = True Then
'            Call mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
'            Drop = False
'        Else
'            Call mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0)
'            Drop = True
'        End If
'    Label14.Caption = "Drag"
'    Else
'    'Do noting
'    Label14.Caption = "noting2"
'    End If
'End If
'
'CheckSwap = False
'CheckTime = 0
'StartAgin = True
'Call SetSystemCursor(oldhcurs, OCR_NORMAL)
'End If
''///////////////////////////////////////////////////////MoveMouse////////////////////////////////////////////////////////////////////////////////
'For j = 0 To 1024
'If PosY < MousePos.y Then PosY = PosY + 1
'If PosX < MousePos.x Then PosX = PosX + 1
'If PosY > MousePos.y Then PosY = PosY - 1
'If PosX > MousePos.x Then PosX = PosX - 1
'For k = 0 To 24
'SetCursorPos PosX, PosY
'Xmove.Caption = PosX
'Ymove.Caption = PosY
'Next
'If PosX = MousePos.x And PosY = MousePos.y Then Exit For
'Next
''/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
''+++++++++++++++++++++++++++Swap Mode+++++++++++++++++++++++++
'GetCursorPos MousePosCurrent
'If ((CheckTime = 0) Or (CheckTime >= TimeLimit)) And (CheckSwap = False) Then
'    cx = MousePosCurrent.x
'    cy = MousePosCurrent.y
'End If
'
'If ((cx - RECTrang < MousePosCurrent.x) And (MousePosCurrent.x < cx + RECTrang)) And _
'   ((cy - RECTrang < MousePosCurrent.y) And (MousePosCurrent.y < cy + RECTrang)) Then
'    CheckSwap = True
'    CheckTime = CheckTime + 1
''    If StartAgin = True Then OldTime = Second(Now)
''    NewTime = Second(Now)
'' If OldTime > NewTime Then OldTime = 60 - OldTime
''CheckTime = Abs(NewTime - OldTime)
''    StartAgin = False
'Else
'    CheckSwap = False
'    CheckTime = 0
'    StartAgin = True
'End If
'If CheckSwap = True And CheckTime >= TimeLimit Then
''    GetCursorPos MousePosCurrent
''    a = a + 1
''    Label13.Caption = a
''                Dim oldS, newS As Integer
''                        oldS = Second(Now)
''                        newS = Second(Now)
''                        If oldS > newS Then oldS = 60 - oldS
'                            Call SetSystemCursor(newhcurs, OCR_NORMAL)
'                            Do While Abs(newS - oldS) < 3
'                                SetCursorPos MousePosCurrent.x, MousePosCurrent.y
'                                Label14.Caption = "Enter Sign"
'                                If oldS > newS Then oldS = 60 - oldS
'                                    Label15.Caption = Abs(newS - oldS)
'                                newS = Second(Now)
'                            Loop
'                    End If
''+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    BitBlt Picture1.hDC, 0, 0, Picture1.ScaleWidth, Picture1.ScaleHeight, hDCEdit, 0, 0, vbSrcCopy
    Picture1.Refresh
End Sub

Private Sub Timer2_Timer()

''**********************************************Mapping****************************************
Dim LenX As Long
Dim LenY As Long
Dim BPosX As Long
Dim BPosY As Long

Dim MousePosCurrent As POINTAPI
Dim PosX As Long
Dim PosY As Long

LenX = 256 / SizeX
LenY = 192 / SizeY

If StatusWaitInputMouse = 0 Then
    '-------------First
    If Not CheckFirstCallMoveMouse Then
        PreviousPos.X = Center.X
        PreviousPos.Y = Center.Y
        CheckFirstCallMoveMouse = True
    Else
        '----------move mouse if not in Rec window
        If Not (((Center.X < PreviousPos.X + BWnd) And (Center.X > PreviousPos.X - BWnd)) And _
            ((Center.Y < PreviousPos.Y + BWnd) And (Center.Y > PreviousPos.Y - BWnd))) Then
            PreviousPos.X = Center.X
            PreviousPos.Y = Center.Y
        End If
    End If
    
    BPosX = PreviousPos.X
    BPosY = PreviousPos.Y

    BPosX = BPosX / LenX
    BPosY = BPosY / LenY

    XPart = Round(BPosX, 0)
    YPart = Round(BPosY, 0)



    'ValueX = Center.x
    'For i = 1 To XBlock.Text
    '    If ValueX < (i * (EyePicX / XBlock.Text)) Then
    '        XPart = i
    '       Exit For
    '    End If
    'Next
    '
    'ValueY = Center.y
    'For i = 1 To YBlock.Text
    '    If ValueY < (i * (EyePicY / YBlock.Text)) Then
    '        YPart = i
    '       Exit For
    '    End If
    'Next

    OutX.Caption = XPart
    OutY.Caption = YPart

    MousePos.X = ScrX - Fix((XPart) * (ScrX / SizeX))
    MousePos.Y = ScrY - Fix(YPart * (ScrY / SizeY))

    Xmove.Caption = MousePos.X
    Ymove.Caption = MousePos.Y

    GetCursorPos MousePosCurrent
    PosX = MousePosCurrent.X
    PosY = MousePosCurrent.Y

    For i = 1 To SpdMouse Step 1
        If PosX <> MousePos.X Or PosY <> MousePos.Y Then
            If PosY < MousePos.Y Then PosY = PosY + 1
            If PosX < MousePos.X Then PosX = PosX + 1
            If PosY > MousePos.Y Then PosY = PosY - 1
            If PosX > MousePos.X Then PosX = PosX - 1
            SetCursorPos PosX, PosY
        Else
            Exit For
        End If
    Next
ElseIf StatusWaitInputMouse = 1 Then
    SetCursorPos MousePos.X, MousePos.Y
    If (((Center.X < 170) And (Center.X > 84)) And _
            ((Center.Y < 128) And (Center.Y > 64))) Then
        DirGoldMouse = Space(255)
        DirGoldMouse = "C:\Program Files\Project1\DINOSAUR.ANI"
        midhcurs = LoadCursorFromFile(DirGoldMouse)
        Call SetSystemCursor(midhcurs, OCR_NORMAL)
        StatusWaitInputMouse = 2
    End If
ElseIf StatusWaitInputMouse = 2 Then

    SetCursorPos MousePos.X, MousePos.Y
    
    If Not (((Center.X < 170) And (Center.X > 84)) And ((Center.Y < 128) And (Center.Y > 64))) Then
        If (Center.Y + (EyePicY / EyePicX) * Center.X < EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X < 0) Then
        'Down->Double Click
            If StatusDrag = True Then
                Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
                StatusDrag = False
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            Else
                Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
                Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
                Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
                Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            End If
            Label14.Caption = "Down"
        ElseIf (Center.Y + (EyePicY / EyePicX) * Center.X <= EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X >= 0) Then
        'Right->Click Right
            If StatusDrag = True Then
                Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
                StatusDrag = False
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            Else
                Call mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0)
                Call mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0)
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            End If
            Label14.Caption = "Right"
        ElseIf (Center.Y + (EyePicY / EyePicX) * Center.X >= EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X <= 0) Then
        'Left->Click Left
            If StatusDrag = True Then
                Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
                StatusDrag = False
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            Else
                Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
                Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            End If
            Label14.Caption = "Left"
        ElseIf (Center.Y + (EyePicY / EyePicX) * Center.X > EyePicY) And (Center.Y - (EyePicY / EyePicX) * Center.X > 0) Then
        'Up->Drag
            If StatusDrag = True Then
                Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
                StatusDrag = False
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            Else
                Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
                StatusDrag = True
                DirArrow = Space(255)
                DirArrow = "C:\Program Files\Project1\3dwarro.cur"
                oldhcurs = LoadCursorFromFile(DirArrow)
                Call SetSystemCursor(oldhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 0
            End If
            Label14.Caption = "Drag"
        Else
            'Do noting
            Label14.Caption = "noting2"
        End If
    End If
End If

End Sub
    

Private Sub Timer3_Timer()

Dim CurPosCurrent As POINTAPI
Dim CurX As Long
Dim CurY As Long

Dim CurrentMin As Integer
Dim CurrentSecond As Integer
Dim CurrentTime As Integer

GetCursorPos CurPosCurrent
CurX = CurPosCurrent.X
CurY = CurPosCurrent.Y

CurrentMin = Minute(Now)
CurrentSecond = Second(Now)
CurrentTime = (CurrentMin * 60) + CurrentSecond

If StatusWaitInputMouse = 0 Then
    Call SetSystemCursor(oldhcurs, OCR_NORMAL)
    '-----First
    If Not CheckFirstCallClickMouse Then
        PreviousCur.X = CurX
        PreviousCur.Y = CurY
        PreviousCur.Time = CurrentTime
        CheckFirstCallClickMouse = True
    Else
        If (((CurX < PreviousCur.X + SWnd) And (CurX > PreviousCur.X - SWnd)) And _
            ((CurY < PreviousCur.Y + SWnd) And (CurY > PreviousCur.Y - SWnd))) Then
            If (Abs(CurrentTime - PreviousCur.Time) >= ClickTime) Then
                
                DirNewIcon = Space(255)
                DirNewIcon = "C:\Program Files\Project1\MOUSE2.ANI"
                newhcurs = LoadCursorFromFile(DirNewIcon)
                Call SetSystemCursor(newhcurs, OCR_NORMAL)
                StatusWaitInputMouse = 1
                PreviousCur.Time = CurrentTime
            End If
        Else
            PreviousCur.X = CurX
            PreviousCur.Y = CurY
            PreviousCur.Time = CurrentTime
        End If
    End If
ElseIf StatusWaitInputMouse = 1 Then
'    If (Abs(CurrentTime - PreviousCur.Time) >= 5) Then
'            Call SetSystemCursor(oldhcurs, OCR_NORMAL)
'            StatusWaitInputMouse = 0
'            CheckFirstCallClickMouse = False
'    End If
ElseIf StatusWaitInputMouse = 2 Then
'    If (Abs(CurrentTime - PreviousCur.Time) >= 5) Then
'            Call SetSystemCursor(oldhcurs, OCR_NORMAL)
'            StatusWaitInputMouse = 0
'            CheckFirstCallClickMouse = False
'    End If
End If



End Sub


Private Sub timeSec_Change()
    ClickTime = Val(timeSec.Text)
End Sub

Private Sub XBlock_Change()
    SizeX = Val(XBlock.Text)
End Sub

Private Sub YBlock_Change()
    SizeY = Val(YBlock.Text)
End Sub
