VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmSetting 
   BackColor       =   &H00FAE6BA&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ปรับแต่ง"
   ClientHeight    =   1890
   ClientLeft      =   4005
   ClientTop       =   2460
   ClientWidth     =   5640
   Icon            =   "frmSetting.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1890
   ScaleWidth      =   5640
   StartUpPosition =   2  'CenterScreen
   Begin Comm4Deaf.zText txtName1 
      Height          =   330
      Left            =   1095
      TabIndex        =   4
      Top             =   570
      Width           =   1710
      _ExtentX        =   3016
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   ""
   End
   Begin Comm4Deaf.zComboList cmbModem 
      Height          =   360
      Left            =   1095
      TabIndex        =   3
      Top             =   150
      Width           =   4395
      _ExtentX        =   7752
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
   Begin MSComDlg.CommonDialog Dialog 
      Left            =   4875
      Top             =   810
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      Flags           =   3
   End
   Begin Comm4Deaf.zText txtName2 
      Height          =   330
      Left            =   1095
      TabIndex        =   5
      Top             =   990
      Width           =   1710
      _ExtentX        =   3016
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   ""
   End
   Begin Comm4Deaf.zCommand btnOK 
      Height          =   300
      Left            =   1530
      Top             =   1515
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
      PictureUp       =   "frmSetting.frx":0E42
      PictureDown     =   "frmSetting.frx":15C1
   End
   Begin Comm4Deaf.zCommand btnCancel 
      Height          =   300
      Left            =   2895
      Top             =   1515
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   6917386
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "ยกเลิก"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmSetting.frx":19D8
      PictureDown     =   "frmSetting.frx":2157
   End
   Begin Comm4Deaf.zCommand btnChange1 
      Height          =   300
      Left            =   2895
      Top             =   585
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   15812608
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "เปลี่ยนสี"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmSetting.frx":256E
      PictureDown     =   "frmSetting.frx":2E57
   End
   Begin Comm4Deaf.zCommand btnChange2 
      Height          =   300
      Left            =   2895
      Top             =   990
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   15812608
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "เปลี่ยนสี"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmSetting.frx":3233
      PictureDown     =   "frmSetting.frx":3B1C
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ชื่อคู่สนทนา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   45
      TabIndex        =   2
      Top             =   1020
      Width           =   960
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ชื่อผู้ใช้"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   45
      TabIndex        =   1
      Top             =   600
      Width           =   960
   End
   Begin VB.Label labModem 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "โมเด็ม"
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
      Left            =   45
      TabIndex        =   0
      Top             =   180
      Width           =   960
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      BorderWidth     =   2
      Height          =   1395
      Left            =   45
      Top             =   45
      Width           =   5565
   End
End
Attribute VB_Name = "frmSetting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnCancel_Click()
  Hide
End Sub

Private Sub btnChange1_Click()
  On Error GoTo ErrH
  Dialog.Color = txtName1.c1Fore
  Dialog.ShowColor
  txtName1.c1Fore = Dialog.Color
ErrH:
End Sub

Private Sub btnChange2_Click()
  On Error GoTo ErrH
  Dialog.Color = txtName2.c1Fore
  Dialog.ShowColor
  txtName2.c1Fore = Dialog.Color
ErrH:
End Sub

Private Sub btnOK_Click()
  lDev = cmbModem.ListIndex
  mName1 = txtName1.Text
  mName2 = txtName2.Text
  mColor1 = txtName1.ForeColor
  mColor2 = txtName2.ForeColor
  frmMain.cmbChatLine.c1Fore = mColor1
  If ModemSettingEnabled Then
    ShutDownTAPI
    InitializeTAPI
  End If
  Hide
End Sub

Private Sub Form_Activate()
  On Error Resume Next
  labModem.Enabled = ModemSettingEnabled
  cmbModem.cMode = ModemSettingEnabled
  cmbModem.Enabled = ModemSettingEnabled
  cmbModem.ListIndex = lDev
  txtName1.Text = mName1
  txtName2.Text = mName2
  txtName1.c1Fore = mColor1
  txtName2.c1Fore = mColor2
End Sub

