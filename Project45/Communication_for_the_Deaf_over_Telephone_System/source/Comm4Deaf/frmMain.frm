VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form frmMain 
   BackColor       =   &H00FAE6BA&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Comm4Deaf"
   ClientHeight    =   6060
   ClientLeft      =   930
   ClientTop       =   2025
   ClientWidth     =   11565
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   404
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   771
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   5415
      Top             =   315
   End
   Begin Comm4Deaf.zCommand btnMakeCall 
      Height          =   300
      Left            =   150
      Top             =   780
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   15812608
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "โทรออก"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMain.frx":0E42
      PictureDown     =   "frmMain.frx":172B
      PictureDisabled =   "frmMain.frx":1B07
   End
   Begin VB.Timer Timer2 
      Interval        =   100
      Left            =   4890
      Top             =   315
   End
   Begin RichTextLib.RichTextBox txtTemp 
      Height          =   690
      Left            =   7725
      TabIndex        =   1
      Top             =   3885
      Visible         =   0   'False
      Width           =   3165
      _ExtentX        =   5583
      _ExtentY        =   1217
      _Version        =   393217
      Enabled         =   -1  'True
      MultiLine       =   0   'False
      TextRTF         =   $"frmMain.frx":210E
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   4365
      Top             =   315
   End
   Begin VB.Frame fraChat 
      BackColor       =   &H00EFF5F5&
      BorderStyle     =   0  'None
      Caption         =   "Frame2"
      Height          =   5505
      Left            =   4230
      TabIndex        =   0
      Top             =   120
      Width           =   7215
      Begin Comm4Deaf.zText txtChatLine 
         Height          =   330
         Left            =   630
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   5145
         Width           =   5370
         _ExtentX        =   9472
         _ExtentY        =   582
         c1Back          =   15726069
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Locked          =   -1  'True
         Text            =   ""
      End
      Begin Comm4Deaf.zCommand btnSend 
         Height          =   735
         Left            =   6090
         Top             =   4725
         Width           =   1125
         _ExtentX        =   1984
         _ExtentY        =   1296
         Style           =   0
         Caption         =   "ส่งข้อความ"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PictureUp       =   "frmMain.frx":21AE
         PictureDown     =   "frmMain.frx":2A0A
         PictureDisabled =   "frmMain.frx":300F
      End
      Begin Comm4Deaf.zCombo cmbChatLine 
         Height          =   360
         Left            =   630
         TabIndex        =   4
         Top             =   4725
         Width           =   5370
         _ExtentX        =   9472
         _ExtentY        =   635
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ListIndex       =   -1
      End
      Begin RichTextLib.RichTextBox txtChatBox 
         Height          =   4590
         Left            =   45
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   15
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   8096
         _Version        =   393217
         BackColor       =   16777215
         BorderStyle     =   0
         ReadOnly        =   -1  'True
         ScrollBars      =   3
         Appearance      =   0
         RightMargin     =   9.99999e5
         TextRTF         =   $"frmMain.frx":3616
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "ตัดคำ"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   0
         TabIndex        =   8
         Top             =   5145
         Width           =   750
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "ข้อความ"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   0
         TabIndex        =   7
         Top             =   4725
         Width           =   750
      End
      Begin VB.Shape shp_Feature 
         BackColor       =   &H00FFFFFF&
         BackStyle       =   1  'Opaque
         BorderColor     =   &H00E48269&
         Height          =   4620
         Left            =   0
         Top             =   0
         Width           =   7215
      End
   End
   Begin Comm4Deaf.zCommand btnSetting 
      Height          =   300
      Left            =   150
      Top             =   1200
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   6917386
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "ตั้งค่า"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMain.frx":36A8
      PictureDown     =   "frmMain.frx":3E27
   End
   Begin Comm4Deaf.zCommand btnAnswerCall 
      Height          =   300
      Left            =   1410
      Top             =   780
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   15812608
      cDisabledFore   =   0
      Style           =   0
      Enabled         =   0   'False
      Caption         =   "รับสาย"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMain.frx":423E
      PictureDown     =   "frmMain.frx":4B27
      PictureDisabled =   "frmMain.frx":4F03
   End
   Begin Comm4Deaf.zCommand btnDatabase 
      Height          =   300
      Left            =   1410
      Top             =   1200
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   6917386
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "ฐานข้อมูล"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMain.frx":550A
      PictureDown     =   "frmMain.frx":5C89
   End
   Begin Comm4Deaf.zCommand btnDropCall 
      Height          =   300
      Left            =   2670
      Top             =   780
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   15812608
      cDisabledFore   =   0
      Style           =   0
      Enabled         =   0   'False
      Caption         =   "วางสาย"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMain.frx":60A0
      PictureDown     =   "frmMain.frx":6989
      PictureDisabled =   "frmMain.frx":6D65
   End
   Begin Comm4Deaf.zCommand btnAbout 
      Height          =   300
      Left            =   2670
      Top             =   1200
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   6917386
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "เกี่ยวกับ"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMain.frx":736C
      PictureDown     =   "frmMain.frx":7AEB
   End
   Begin Comm4Deaf.zCommand btnExit 
      Height          =   300
      Left            =   2895
      Top             =   5640
      Width           =   1125
      _ExtentX        =   1984
      _ExtentY        =   529
      cDownFore       =   6917386
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "ปิดโปรแกรม"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMain.frx":7F02
      PictureDown     =   "frmMain.frx":8681
      PictureDisabled =   "frmMain.frx":8A98
   End
   Begin VB.Image imgPhone 
      Height          =   4050
      Index           =   0
      Left            =   105
      Picture         =   "frmMain.frx":909F
      Top             =   1890
      Width           =   3810
   End
   Begin VB.Image imgPhone 
      Height          =   4050
      Index           =   2
      Left            =   105
      Picture         =   "frmMain.frx":3B6AB
      Top             =   1890
      Width           =   3810
   End
   Begin VB.Image imgPhone 
      Height          =   4050
      Index           =   1
      Left            =   105
      Picture         =   "frmMain.frx":6DCB7
      Top             =   1890
      Width           =   3810
   End
   Begin VB.Shape Shape5 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      BorderWidth     =   2
      Height          =   4245
      Left            =   45
      Top             =   1785
      Width           =   4050
   End
   Begin VB.Label StatusBar 
      BackColor       =   &H00EAFECF&
      BackStyle       =   0  'Transparent
      Caption         =   "asdfDSDF"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   4230
      TabIndex        =   5
      Top             =   5775
      Width           =   7155
   End
   Begin VB.Label labStatus 
      Alignment       =   2  'Center
      BackColor       =   &H00EAFECF&
      BackStyle       =   0  'Transparent
      Caption         =   "สถานะ"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   150
      TabIndex        =   2
      Top             =   255
      Width           =   3795
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00D3E7FC&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H002D91FF&
      BorderWidth     =   2
      Height          =   480
      Left            =   150
      Top             =   150
      Width           =   3840
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      BorderWidth     =   2
      Height          =   1680
      Left            =   45
      Top             =   45
      Width           =   4050
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      BorderWidth     =   2
      Height          =   5655
      Left            =   4155
      Top             =   45
      Width           =   7380
   End
   Begin VB.Shape Shape4 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      Height          =   285
      Left            =   4140
      Top             =   5745
      Width           =   7395
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAbout_Click()
  CenterForm frmAbout
  frmAbout.Show vbModal
End Sub

Private Sub btnAnswerCall_Click()
  AnswerCall
End Sub

Private Sub btnDatabase_Click()
  CenterForm frmDatabase
  frmDatabase.Show
End Sub

Private Sub btnDropCall_Click()
  If MsgBox("ต้องการวางสายหรือไม่", vbQuestion & vbYesNo, "Comm4Deaf") = vbYes Then DropCall
End Sub

Private Sub btnExit_Click()
  Unload Me
End Sub

Private Sub btnMakeCall_Click()
  Dim Addr As String
  Addr = InputBox("หมายเลขโทรออก")
  MakeCall Addr
End Sub

Private Sub btnSend_Click()
  Dim Words As String
  Words = FilterWords(cmbChatLine.Text)
  If Words <> "" Then
    btnSend.Enabled = False
    btnSend.Caption = "กำลังส่ง..."
    Words = MakeWave(cmbChatLine.Text, MixWaveFilename)
    cmbChatLine.AddItem cmbChatLine.Text, 0
    AddTxtChatBox mName1 & " : " & Words, mColor1
    cmbChatLine.SetFocus
    cmbChatLine.Text = ""
    PlayWave MixWaveFilename
  Else
    Timer1.Enabled = True
    StatusBar.Caption = "ข้อความไม่ถูกต้อง"
  End If
End Sub

Private Sub btnSetting_Click()
  CenterForm frmSetting
  frmSetting.Show vbModal, Me
End Sub

Private Sub cmbChatLine_Change()
  txtChatLine.Text = FilterWords(cmbChatLine.Text)
End Sub

Private Sub cmbChatLine_KeyPress(KeyAscii As Integer)
  If (KeyAscii = 13) And (btnSend.Enabled) Then btnSend_Click
End Sub

Private Sub Form_Load()
  ModemSettingEnabled = True
  onCall = False
  donePlaying = False
  isPlaying = False
  frmMain.Width = 4230
  fraChat.Enabled = False
  WavePath = App.Path & "\wave\"
  MixWaveFilename = App.Path & "\mix.wav"
  CenterForm frmMain
  LoadValues
  ConnectDB
  InitializeTAPI
  EnumerateModems
  LoadCodec
  frmDatabase.Adodc1.ConnectionString = Cnn.ConnectionString
  frmDatabase.Adodc1.Refresh
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If MsgBox("ต้องการปิดโปรแกรมหรือไม่", vbQuestion & vbYesNo, "Comm4Deaf") = vbNo Then Cancel = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  SaveValues
  ShutDownTAPI
  Unload frmSetting
  Unload frmDatabase
End Sub

Private Sub Image1_Click()

End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
  MonitorDigit (chr(KeyAscii))
End Sub

Private Sub Timer1_Timer()
  If Not isPlaying Then
    btnSend.Enabled = True
    btnSend.Caption = "ส่งข้อความ"
  End If
  StatusBar.Caption = ""
  Timer1.Enabled = False
End Sub

Private Sub Timer2_Timer()
  If donePlaying Then
    CloseWaveOut
    donePlaying = False
    btnSend.Enabled = True
    btnSend.Caption = "ส่งข้อความ"
  End If
End Sub

Public Sub Timer3_Timer()
  AnimateFrame = (AnimateFrame + 1) Mod 3
  imgPhone(AnimateFrame).ZOrder
End Sub
