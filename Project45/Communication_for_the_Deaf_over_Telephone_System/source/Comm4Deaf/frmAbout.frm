VERSION 5.00
Begin VB.Form frmAbout 
   BackColor       =   &H00FAE6BA&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "เกี่ยวกับ"
   ClientHeight    =   3975
   ClientLeft      =   3510
   ClientTop       =   2550
   ClientWidth     =   7860
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3975
   ScaleWidth      =   7860
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin Comm4Deaf.zCommand btnOK 
      Height          =   300
      Left            =   6300
      Top             =   3465
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   6917386
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "ตกลง"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmAbout.frx":0E42
      PictureDown     =   "frmAbout.frx":15C1
      PictureDisabled =   "frmAbout.frx":19D8
   End
   Begin VB.Image Image1 
      Height          =   1500
      Left            =   210
      Picture         =   "frmAbout.frx":1FDF
      Top             =   210
      Width           =   1710
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2145
      TabIndex        =   7
      Top             =   2880
      Width           =   3660
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "อาจารย์ทีปรึกษา อ. เกียรติกูล เจียระไนธนกิจ"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2145
      TabIndex        =   6
      Top             =   2565
      Width           =   2925
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "นาย เจริญรัตน์ ลัคนาวิพุธ  42010063"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2355
      TabIndex        =   5
      Top             =   2250
      Width           =   2625
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "นาย เกียรติศักดิ์ ศรีมาดี  42010031"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2355
      TabIndex        =   4
      Top             =   1935
      Width           =   2490
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ผู้จัดทำ"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2145
      TabIndex        =   3
      Top             =   1620
      Width           =   495
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Comm4Deaf 1.0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   240
      Left            =   2085
      TabIndex        =   2
      Top             =   420
      Width           =   1635
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "(Communication for the Deaf over Telephone System)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   240
      Left            =   2085
      TabIndex        =   1
      Top             =   1050
      Width           =   5535
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "การสื่อสารสำหรับผู้พิการทางหูผ่านระบบโทรศัพท์"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   240
      Left            =   2085
      TabIndex        =   0
      Top             =   735
      Width           =   3930
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      BorderWidth     =   2
      Height          =   3900
      Left            =   45
      Top             =   45
      Width           =   7785
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnOK_Click()
  Unload Me
End Sub
