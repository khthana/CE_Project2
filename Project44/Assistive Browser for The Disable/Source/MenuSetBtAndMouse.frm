VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form MenuButtonMouse 
   Caption         =   "ตังปุ่มและเมาส์"
   ClientHeight    =   4515
   ClientLeft      =   4065
   ClientTop       =   345
   ClientWidth     =   7350
   ControlBox      =   0   'False
   Icon            =   "MenuSetBtAndMouse.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4515
   ScaleWidth      =   7350
   ShowInTaskbar   =   0   'False
   Begin VB.Timer TimerLoadSave 
      Interval        =   200
      Left            =   6480
      Top             =   4200
   End
   Begin VB.CommandButton B_save 
      Caption         =   "Save"
      Height          =   615
      Left            =   6600
      Picture         =   "MenuSetBtAndMouse.frx":1272
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   360
      Width           =   615
   End
   Begin VB.CommandButton B_open 
      Caption         =   "Load"
      Height          =   615
      Left            =   5880
      Picture         =   "MenuSetBtAndMouse.frx":1764
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   360
      Width           =   615
   End
   Begin VB.CommandButton B_test 
      Caption         =   "ทดสอบ"
      Height          =   495
      Left            =   5880
      TabIndex        =   29
      Top             =   2520
      Width           =   1335
   End
   Begin VB.CommandButton B_oldVal 
      Caption         =   "ตั้งค่าตามเดิม"
      Height          =   495
      Left            =   5880
      TabIndex        =   24
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton B_default 
      Caption         =   "ตั้งตามค่าแนะนำ"
      Height          =   495
      Left            =   5880
      TabIndex        =   23
      Top             =   1920
      Width           =   1335
   End
   Begin VB.CommandButton B_cancel 
      Caption         =   "ยกเลิก"
      Height          =   495
      Left            =   5880
      TabIndex        =   22
      Top             =   3720
      Width           =   1335
   End
   Begin VB.CommandButton B_ok 
      Caption         =   "ตกลง"
      Height          =   495
      Left            =   5880
      TabIndex        =   10
      Top             =   3120
      Width           =   1335
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   4215
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   7435
      _Version        =   393216
      Tabs            =   2
      Tab             =   1
      TabHeight       =   520
      TabCaption(0)   =   "ตั้งปุ่ม"
      TabPicture(0)   =   "MenuSetBtAndMouse.frx":1C56
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Label2"
      Tab(0).Control(1)=   "Label12"
      Tab(0).Control(2)=   "Label13"
      Tab(0).Control(3)=   "Label14"
      Tab(0).Control(4)=   "Frame1"
      Tab(0).Control(5)=   "SliderDouble"
      Tab(0).ControlCount=   6
      TabCaption(1)   =   "ตั้งเมาส์"
      TabPicture(1)   =   "MenuSetBtAndMouse.frx":1C72
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Label5"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Label6"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Label7"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "Label8"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "Label9"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "Label10"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "Label11"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "Image1"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "SliderClick"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "TxFastMouse"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "SliderFast"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).ControlCount=   11
      Begin MSComctlLib.Slider SliderDouble 
         Height          =   495
         Left            =   -74520
         TabIndex        =   25
         Top             =   3480
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   873
         _Version        =   393216
         Min             =   50
         Max             =   500
         SelStart        =   150
         TickFrequency   =   25
         Value           =   150
      End
      Begin MSComctlLib.Slider SliderFast 
         Height          =   495
         Left            =   480
         TabIndex        =   16
         Top             =   2520
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   873
         _Version        =   393216
         Min             =   1
         Max             =   100
         SelStart        =   5
         TickFrequency   =   5
         Value           =   5
      End
      Begin VB.TextBox TxFastMouse 
         Height          =   375
         Left            =   3960
         TabIndex        =   14
         Top             =   1200
         Width           =   615
      End
      Begin MSComctlLib.Slider SliderClick 
         Height          =   495
         Left            =   480
         TabIndex        =   12
         Top             =   1200
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   873
         _Version        =   393216
         LargeChange     =   1
         Min             =   1
         Max             =   50
         SelStart        =   6
         TickFrequency   =   2
         Value           =   6
      End
      Begin VB.Frame Frame1 
         Caption         =   "ปุ่มบังคับทิศทาง"
         Height          =   2415
         Left            =   -74760
         TabIndex        =   2
         Top             =   480
         Width           =   5055
         Begin VB.OptionButton Option1 
            Caption         =   "ควบคุมแบบ 2 ปุ่ม"
            Height          =   375
            Left            =   240
            TabIndex        =   11
            Top             =   360
            Value           =   -1  'True
            Width           =   1815
         End
         Begin VB.TextBox TxOneKey 
            Enabled         =   0   'False
            Height          =   285
            Left            =   3240
            TabIndex        =   9
            Text            =   "Insert"
            Top             =   1920
            Width           =   975
         End
         Begin VB.TextBox TxLeftRight 
            Height          =   285
            Left            =   3240
            TabIndex        =   8
            Text            =   "Insert"
            Top             =   1200
            Width           =   975
         End
         Begin VB.TextBox TxUpDown 
            Height          =   285
            Left            =   3240
            TabIndex        =   7
            Text            =   "Ctrl"
            Top             =   840
            Width           =   975
         End
         Begin VB.OptionButton Option2 
            Caption         =   "ควบคุมแบบ 1 ปุ่ม"
            Height          =   495
            Left            =   240
            TabIndex        =   3
            Top             =   1440
            Width           =   1815
         End
         Begin VB.Image Image2 
            Height          =   570
            Left            =   4200
            Picture         =   "MenuSetBtAndMouse.frx":1C8E
            Stretch         =   -1  'True
            Top             =   120
            Width           =   810
         End
         Begin VB.Label Label4 
            Caption         =   "เลือกปุ่มบังคับทิศทาง"
            Height          =   375
            Left            =   840
            TabIndex        =   6
            Top             =   1920
            Width           =   1455
         End
         Begin VB.Label Label3 
            Caption         =   "เลือกปุ่มบังคับทิศทาง ซ้าย-ขวา"
            Height          =   375
            Left            =   840
            TabIndex        =   5
            Top             =   1200
            Width           =   2175
         End
         Begin VB.Label Label1 
            Caption         =   "เลือกปุ่มบังคับทิศทาง ขึ้น-ลง"
            Height          =   255
            Left            =   840
            TabIndex        =   4
            Top             =   840
            Width           =   2055
         End
      End
      Begin VB.Image Image1 
         Height          =   1035
         Left            =   4200
         Picture         =   "MenuSetBtAndMouse.frx":3198
         Stretch         =   -1  'True
         Top             =   3120
         Width           =   1140
      End
      Begin VB.Label Label14 
         Caption         =   "มาก"
         Height          =   375
         Left            =   -70080
         TabIndex        =   28
         Top             =   3600
         Width           =   375
      End
      Begin VB.Label Label13 
         Caption         =   "น้อย"
         Height          =   375
         Left            =   -74880
         TabIndex        =   27
         Top             =   3600
         Width           =   375
      End
      Begin VB.Label Label12 
         Caption         =   "ช่วงหน่วงเวลาในการดับเบิลคลิกปุ่ม"
         Height          =   255
         Left            =   -74640
         TabIndex        =   26
         Top             =   3120
         Width           =   2775
      End
      Begin VB.Label Label11 
         Caption         =   "มาก"
         Height          =   375
         Left            =   4800
         TabIndex        =   21
         Top             =   2640
         Width           =   495
      End
      Begin VB.Label Label10 
         Caption         =   "น้อย"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   2640
         Width           =   375
      End
      Begin VB.Label Label9 
         Caption         =   "เร็ว"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label Label8 
         Caption         =   "ช้า"
         Height          =   255
         Left            =   3600
         TabIndex        =   18
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label Label7 
         Caption         =   "ความเร็วในการเลื่อนตำแหน่งเมาส์"
         Height          =   375
         Left            =   600
         TabIndex        =   17
         Top             =   2040
         Width           =   3015
      End
      Begin VB.Label Label6 
         Caption         =   "วินาที"
         Height          =   255
         Left            =   4680
         TabIndex        =   15
         Top             =   1320
         Width           =   495
      End
      Begin VB.Label Label5 
         Caption         =   "ความเร็วในการคลิกเมาส์"
         Height          =   255
         Left            =   600
         TabIndex        =   13
         Top             =   600
         Width           =   2055
      End
      Begin VB.Label Label2 
         Caption         =   "เลือกปุ่มบังคับ ซ้าย-ขวา"
         Height          =   495
         Left            =   -72360
         TabIndex        =   1
         Top             =   2040
         Width           =   2055
      End
   End
End
Attribute VB_Name = "MenuButtonMouse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim KeyUpDown_t, KeyLeftRight_t, OneKey_t As Integer
Dim mouse_click_period_t, MaxSpeed_t As Integer '* mouse_click_period เป็น mili sec * 3 , default = 400 * 3 = 1.2 วินาที
Dim MaxTimeDb_t As Long
'ตัวแปรเก็บค่าเมื่อเริ่มเข้า menu
Dim KeyUpDown_tt, KeyLeftRight_tt, OneKey_tt As Integer
Dim mouse_click_period_tt, MaxSpeed_tt As Integer '* mouse_click_period เป็น mili sec * 3 , default = 400 * 3 = 1.2 วินาที
Dim MaxTimeDb_tt As Long
Dim flag_click As Boolean

Private Sub B_cancel_Click()
    OneKey = OneKey_tt
    KeyUpDown = KeyUpDown_tt
    KeyLeftRight = KeyLeftRight_tt
    mouse_click_period = mouse_click_period_tt
    MaxSpeed = MaxSpeed_tt
    MaxTimeDb = MaxTimeDb_tt
    MenuButtonMouse.Hide
    Unload Me
End Sub

Private Sub B_default_Click()
    Call SetDefault
    Change = True
End Sub

Private Sub B_oldVal_Click()
    OneKey_t = OneKey_tt
    KeyUpDown_t = KeyUpDown_tt
    KeyLeftRight_t = KeyLeftRight_tt
    mouse_click_period_t = mouse_click_period_tt
    MaxSpeed_t = MaxSpeed_tt
    MaxTimeDb_t = MaxTimeDb_tt
End Sub

Private Sub B_open_Click()
    loadFlag = True
    saveFlag = False
    caller = Me.Name
    BrowseFile.File.Pattern = "*.sbm"
    BrowseFile.Show
    MenuButtonMouse.Enabled = False
End Sub

Private Sub B_save_Click()
    saveFlag = True
    loadFlag = False
    caller = Me.Name
    BrowseFile.File.Pattern = "*.sbm"
    BrowseFile.Show
    MenuButtonMouse.Enabled = False
End Sub

Private Sub B_test_Click()
    If Option1 = True Then
        KeyUpDown = KeyUpDown_t
        KeyLeftRight = KeyLeftRight_t
        OneKey = 0
        OnekeyFlag = False
    Else
        OneKey = OneKey_t
        KeyUpDown = 0
        KeyLeftRight = 0
        OnekeyFlag = True
    End If
    mouse_click_period = mouse_click_period_t
    MaxSpeed = MaxSpeed_t
    MaxTimeDb = MaxTimeDb_t
    Change = True
End Sub


'option เลือก 2 ปุ่ม หรือ 1 ปุ่ม
Private Sub Option1_Click()
    TxOneKey.Enabled = False
    TxLeftRight.Enabled = True
    TxUpDown.Enabled = True
End Sub

Private Sub Option2_Click()
    TxLeftRight.Enabled = False
    TxUpDown.Enabled = False
    TxOneKey.Enabled = True
End Sub

Private Sub SliderClick_Change()
    Dim v As Single
    v = SliderClick.Value
    v = v * 0.2
    TxFastMouse.text = v
End Sub

Private Sub SliderClick_Click()
    Call DragSlider
End Sub

Private Sub SliderDouble_Change()
    MaxTimeDb = SliderDouble.Value
End Sub

Private Sub SliderDouble_Click()
    Call DragSlider
End Sub

Private Sub SliderFast_Change()
    MaxSpeed_t = SliderFast.Value
End Sub

Private Sub SliderFast_Click()
    Call DragSlider
End Sub

'********************** Load and Save file *********************

'' ลำดับการเก็บค่าตัวแปรใน file
''OnekeyFlag = False,True
''UpDown = KeyCode
''LeftRight = KeyCode
''OneKey = KeyCode
''MaxTimeDb = Time (long)
''mouse_click_period = Time (integer)
''MaxSpeed = Time (integer)

Sub SaveFile()
    Dim iFileNum As Integer
    Dim ch As String
    Call B_test_Click 'สั่งให้ทดสอบก่อน save
    ch = Right(filename, 4)
    If ch <> ".sbm" Then filename = filename & ".sbm"
    
    iFileNum = FreeFile
    Open filename For Output As #iFileNum
    Print #iFileNum, OnekeyFlag
    Print #iFileNum, KeyUpDown
    Print #iFileNum, KeyLeftRight
    Print #iFileNum, OneKey
    Print #iFileNum, MaxTimeDb
    Print #iFileNum, mouse_click_period
    Print #iFileNum, MaxSpeed
    Close #iFileNum
End Sub

Sub LoadFile()
    Dim iFileNum As Integer
    Dim s(7) As String
    Dim i As Integer
    
    Call B_test_Click 'สั่งให้ทดสอบก่อน save
    iFileNum = FreeFile
    Open filename For Input As #iFileNum
    Line Input #iFileNum, s(1) 'OnekeyFlag
    Line Input #iFileNum, s(2) 'KeyUpDown
    Line Input #iFileNum, s(3) 'KeyLeftRight
    Line Input #iFileNum, s(4) 'OneKey
    Line Input #iFileNum, s(5) 'MaxTimeDb
    Line Input #iFileNum, s(6) 'mouse_click_period
    Line Input #iFileNum, s(7) 'MaxSpeed
    Close #iFileNum
    
    If s(1) = "True" Then
        Option2.Value = True
    Else
        Option1.Value = True
    End If
    KeyUpDown_t = Int(s(2))
    KeyLeftRight_t = Int(s(3))
    OneKey_t = Int(s(4))
    MaxTimeDb_t = Val(s(5))
    mouse_click_period_t = Val(s(6))
    MaxSpeed_t = Val(s(7))
    
    i = KeyUpDown_t
    Call TxUpDown_KeyUp(i, 0)
    i = KeyLeftRight_t
    Call TxLeftRight_KeyUp(i, 0)
    i = OneKey
    Call TxOneKey_KeyUp(i, 0)
    Call B_test_Click
End Sub

Private Sub TimerLoadSave_Timer()
    If filename <> "" Then
        If saveFlag = True Then
            saveFlag = False
            Call SaveFile
        ElseIf loadFlag = True Then
            loadFlag = False
            Call LoadFile
        End If
        filename = ""
    End If
End Sub

Private Sub TxFastMouse_Change()
    Dim vtx As Double
    If TxFastMouse.text <> "" Then
        vtx = Val(TxFastMouse.text)
        If (vtx > 10) Or (vtx < 0.2) Then
            TxFastMouse.text = "1.2"
            vtx = 1.2
        End If
        mouse_click_period_t = vtx * 1000 / 3
    End If
End Sub

Private Sub TxUpDown_Click()
    Option1.Value = True
    Call Option1_Click
End Sub

Private Sub TxUpDown_KeyUp(KeyCode As Integer, Shift As Integer)
    Dim ch As String
    Dim temp_key As Integer
    temp_key = KeyUpDown_t
    KeyUpDown_t = KeyCode
    TxUpDown.text = ""
    ch = xKeyCode(KeyCode)
    If ch <> "" Then
        TxUpDown.text = ch
    Else: TxUpDown.text = Chr(KeyCode)
    End If
    If KeyUpDown_t = KeyLeftRight_t Then
        Call TxLeftRight_KeyUp(temp_key, 0)
        'KeyLeftRight_t = 0
        'TxLeftRight.text = ""
    End If
End Sub

Private Sub TxLeftRight_Click()
    Option1.Value = True
    Call Option1_Click
End Sub

Private Sub TxLeftRight_KeyUp(KeyCode As Integer, Shift As Integer)
    Dim ch As String
    Dim temp_key As Integer
    temp_key = KeyLeftRight_t
    KeyLeftRight_t = KeyCode
    TxLeftRight.text = ""
    ch = xKeyCode(KeyCode)
    If ch <> "" Then
        TxLeftRight.text = ch
    Else: TxLeftRight.text = Chr(KeyCode)
    End If
    
    If KeyUpDown_t = KeyLeftRight_t Then
        Call TxUpDown_KeyUp(temp_key, 0)
        'KeyUpDown_t = 0
        'TxUpDown.text = ""
    End If
End Sub

Private Sub TxOneKey_Click()
    Option2.Value = True
    Call Option2_Click
End Sub

Private Sub TxOneKey_KeyUp(KeyCode As Integer, Shift As Integer)
    Dim ch As String
    OneKey_t = KeyCode
    TxOneKey.text = ""
    ch = xKeyCode(KeyCode)
    If ch <> "" Then
        TxOneKey.text = ch
    Else: TxOneKey.text = Chr(KeyCode)
    End If
End Sub

Sub SetDefault()
    OneKey_t = vbKeyInsert
    KeyUpDown_t = vbKeyControl ' KeyUpDown = vbKeyControl
    KeyLeftRight_t = vbKeyInsert 'KeyLeftRight = vbKeyMenu
    mouse_click_period_t = 400
    MaxSpeed_t = 5
    MaxTimeDb_t = 150
End Sub

Sub SaveOldValue()
    OneKey_tt = OneKey
    KeyUpDown_tt = KeyUpDown
    KeyLeftRight_tt = KeyLeftRight
    mouse_click_period_tt = mouse_click_period
    MaxSpeed_tt = MaxSpeed
    MaxTimeDb_tt = MaxTimeDb
End Sub

Sub DragSlider()
    If flag_click = False Then
        mouse_press_left
        flag_click = True
    Else
        mouse_release_left
        flag_click = False
    End If
End Sub

Function xKeyCode(key As Integer) As String
    Dim ch As String
    Select Case key
        Case &H8: ch = "Back space"
        Case &H9: ch = "Tab"
        Case &HD: ch = "Return"
        Case &H10: ch = "Shift"
        Case &H11: ch = "Ctrl"
        Case &H12: ch = "Alt"
        Case &H13: ch = "Pause"
        Case &H14: ch = "Caps Lock"
        Case &H1B: ch = "Esc"
        Case &H20: ch = "Spacebar"
        Case &H21: ch = "Page Up"
        Case &H22: ch = "Page Down"
        Case &H23: ch = "End"
        Case &H24: ch = "Home"
        Case &H25: ch = "Left Arr"
        Case &H26: ch = "Up Arr"
        Case &H27: ch = "Right Arr"
        Case &H28: ch = "Down Arr"
        Case &H2D: ch = "Insert"
        Case &H2E: ch = "Delete"
        Case &H60: ch = "Num_0"
        Case &H61: ch = "Num_1"
        Case &H62: ch = "Num_2"
        Case &H63: ch = "Num_3"
        Case &H64: ch = "Num_4"
        Case &H65: ch = "Num_5"
        Case &H66: ch = "Num_6"
        Case &H67: ch = "Num_7"
        Case &H68: ch = "Num_8"
        Case &H69: ch = "Num_9"
        Case &H6A: ch = "*"
        Case &H6B: ch = "+"
        Case &H6C: ch = "/"
        Case &H6D: ch = "-"
        Case &H6E: ch = "."
        Case &H70: ch = "F1"
        Case &H71: ch = "F2"
        Case &H72: ch = "F3"
        Case &H73: ch = "F4"
        Case &H74: ch = "F5"
        Case &H75: ch = "F6"
        Case &H76: ch = "F7"
        Case &H77: ch = "F8"
        Case &H78: ch = "F9"
        Case &H79: ch = "F10"
        Case &H7A: ch = "F11"
        Case &H7B: ch = "F12"
        Case &H90: ch = "Num Lock"
        Case &H91: ch = "Scroll Lock"
        Case &HA0: ch = "Shift"
        Case &HA1: ch = "Shift"
        Case &HA2: ch = "Ctrl"
        Case &HA3: ch = "Ctrl"
    End Select
    xKeyCode = ch
End Function

Private Sub Form_Load()
    Call UpdataSlider
    flag_click = False 'ใช้ตรวจการสั่งคลิกในการเลือ่น slider
    filename = "" '* ลบชื่อไฟล์ไว้ก่อน
    Call SaveOldValue
    Call SetDefault
    Call StayOnTop(Me.hwnd, 0)
End Sub

Private Sub B_ok_Click()
    filename = CurDir & "\start"
    Call SaveFile
    MenuButtonMouse.Hide
    Unload Me
End Sub

Sub UpdataSlider()
    SliderClick.Value = mouse_click_period * 3 / 1000 / 0.2
    TxFastMouse.text = SliderClick.Value * 0.2
    Call TxFastMouse_Change
End Sub
