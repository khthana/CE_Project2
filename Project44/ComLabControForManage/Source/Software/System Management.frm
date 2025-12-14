VERSION 5.00
Begin VB.Form SystemManagementForm 
   Caption         =   "ผู้บริหารระบบ"
   ClientHeight    =   5730
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6165
   LinkTopic       =   "Form2"
   ScaleHeight     =   5730
   ScaleWidth      =   6165
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "เมนูหลัก"
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
      Left            =   600
      TabIndex        =   4
      Top             =   4560
      Width           =   4815
   End
   Begin VB.CommandButton Command3 
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
      Left            =   600
      TabIndex        =   3
      Top             =   3600
      Width           =   4815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "ตรวจสอบการ Login/Logout ของผู้ใช้"
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
      Left            =   600
      TabIndex        =   2
      Top             =   2640
      Width           =   4815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ตรวจสอบผู้เข้าใช้ห้องปฏิบัติการไมโครคอมพิวเตอร์"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   15.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   600
      TabIndex        =   1
      Top             =   1680
      Width           =   4815
   End
   Begin VB.Label Label1 
      Caption         =   "    สำหรับผู้บริหารระบบ"
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
      Left            =   1320
      TabIndex        =   0
      Top             =   600
      Width           =   3615
   End
End
Attribute VB_Name = "SystemManagementForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    UserIn.Show
    Unload Me
End Sub

Private Sub Command2_Click()
    CheckLogForm.Show
    Unload Me
End Sub

Private Sub Command3_Click()
    UserManagementForm.Show
    Unload Me
End Sub

Private Sub Command4_Click()
    MainMenuForm.Show
    Unload SystemManagementForm
End Sub


