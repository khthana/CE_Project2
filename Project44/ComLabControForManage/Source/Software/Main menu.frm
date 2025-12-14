VERSION 5.00
Begin VB.Form MainMenuForm 
   BackColor       =   &H8000000B&
   ClientHeight    =   6960
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9510
   FillColor       =   &H8000000F&
   ForeColor       =   &H8000000F&
   LinkTopic       =   "Form1"
   Picture         =   "Main menu.frx":0000
   ScaleHeight     =   6960
   ScaleWidth      =   9510
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0FFFF&
      Caption         =   "สำหรับผู้บริหารระบบ"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   15.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   2880
      MaskColor       =   &H8000000F&
      TabIndex        =   3
      Top             =   1800
      Width           =   3255
   End
   Begin VB.CommandButton Command2 
      Caption         =   "ตรวจสอบ/แก้ใข ผู้มีสิทธิ์เข้าใช้งาน"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   15.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   570
      Left            =   2880
      TabIndex        =   2
      Top             =   2640
      Width           =   3255
   End
   Begin VB.CommandButton Command3 
      Caption         =   "รายงานข้อมูลการใช้งาน"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   15.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   570
      Left            =   2880
      TabIndex        =   1
      Top             =   3480
      Width           =   3255
   End
   Begin VB.CommandButton Command4 
      Caption         =   "ออกจากโปรแกรม"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   15.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   2880
      TabIndex        =   0
      Top             =   4320
      Width           =   3255
   End
   Begin VB.Label Label1 
      Caption         =   " ระบบควบคุมการใช้งานห้องปฏิบัติการไมโครคอมพิวเตอร์เพื่อการบริหาร"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   21.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   9015
   End
   Begin VB.Label Label2 
      Caption         =   "The Microcomputer Laboratory Controlling System For Managing "
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   240
      TabIndex        =   4
      Top             =   840
      Width           =   9015
   End
End
Attribute VB_Name = "MainMenuForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    SystemManagementForm.Show
    Unload Me
End Sub

Private Sub Command2_Click()
    UserManagementForm.Show
    Unload Me
End Sub

Private Sub Command3_Click()
    ReportForm.Show
    Unload Me
End Sub


Private Sub Command4_Click()
    Unload Me
End Sub
