VERSION 5.00
Begin VB.Form f_select_library 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "เลือกห้องสมุด"
   ClientHeight    =   2775
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4455
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form12.frx":0000
   ScaleHeight     =   2775
   ScaleWidth      =   4455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton ok_sel 
      Caption         =   "ยืนยัน"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1440
      TabIndex        =   1
      Top             =   1680
      Width           =   1575
   End
   Begin VB.ComboBox c_s_library 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      ItemData        =   "Form12.frx":30B0A
      Left            =   960
      List            =   "Form12.frx":30B17
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   720
      Width           =   2535
   End
End
Attribute VB_Name = "f_select_library"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    c_s_library.ListIndex = 0
End Sub

Private Sub ok_sel_Click()
    sel2 = c_s_library.ListIndex
    Unload Me
End Sub
