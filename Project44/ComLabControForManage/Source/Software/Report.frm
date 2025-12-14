VERSION 5.00
Begin VB.Form ReportForm 
   Caption         =   "รายงานข้อมูลการใช้งาน"
   ClientHeight    =   6120
   ClientLeft      =   1935
   ClientTop       =   1110
   ClientWidth     =   7170
   LinkTopic       =   "Form3"
   ScaleHeight     =   6120
   ScaleWidth      =   7170
   Begin VB.CommandButton Command2 
      Caption         =   "อัตราการล็อกอินเข้าระบบในแต่ละวัน"
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
      Left            =   720
      TabIndex        =   4
      Top             =   2760
      Width           =   5535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "อัตราผู้ใช้งานห้องปฏิบัติงานไมโครคอมพิวเตอร์ในแต่ละวัน"
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
      Left            =   720
      TabIndex        =   3
      Top             =   1920
      Width           =   5535
   End
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
      Left            =   720
      TabIndex        =   2
      Top             =   4440
      Width           =   5535
   End
   Begin VB.CommandButton Command3 
      Caption         =   "อัตราการใช้งานของเครื่องในแต่ละวัน"
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
      Index           =   2
      Left            =   720
      TabIndex        =   1
      Top             =   3600
      Width           =   5535
   End
   Begin VB.Label Label1 
      Caption         =   "    รายงานข้อมูลการใช้งาน"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1560
      TabIndex        =   0
      Top             =   600
      Width           =   3975
   End
End
Attribute VB_Name = "ReportForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Graph1.Show
    Unload Me
End Sub

Private Sub Command2_Click()
    Graph2.Show
    Unload Me
End Sub

Private Sub Command4_Click()
    MainMenuForm.Show
    Unload Me
End Sub
