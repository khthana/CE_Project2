VERSION 5.00
Begin VB.Form f_save 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "บันทึก"
   ClientHeight    =   3495
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6750
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form8.frx":0000
   ScaleHeight     =   3495
   ScaleWidth      =   6750
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton back_menu 
      Caption         =   "ไปหน้าแรก"
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
      Left            =   4560
      TabIndex        =   4
      Top             =   2280
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   4320
      TabIndex        =   2
      Top             =   600
      Width           =   2055
   End
   Begin VB.CommandButton s_ave 
      Caption         =   "บันทึก"
      Enabled         =   0   'False
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
      Left            =   4560
      TabIndex        =   3
      Top             =   1440
      Width           =   1575
   End
   Begin VB.DriveListBox Drive1 
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
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   3615
   End
   Begin VB.DirListBox Dir1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2070
      Left            =   360
      TabIndex        =   1
      Top             =   1020
      Width           =   3615
   End
End
Attribute VB_Name = "f_save"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub back_menu_Click()
    Unload Me
End Sub

Private Sub s_ave_Click()
On Error GoTo s_er:
    Dim tmp As String
    Dim c As Integer
        tmp = Dir1.Path & "\" & Text1 & ".txt"
    If Dir(tmp) <> "" Then Kill tmp
    Open tmp For Output As #1
    For c = 0 To (f_l_data_year.l_book.ListCount - 1)
        f_l_data_year.l_book.ListIndex = c
        Print #1, f_l_data_year.l_book.Text
    Next
    Close #1
    f_l_data_year.l_book.ListIndex = -1
    Unload Me
Exit Sub
s_er:
    MsgBox "กรุณาอย่าใช้สัญลักษณ์พิเศษในการตั้งชื่อไฟล์", vbCritical, "การตั้งชื่อไฟล์"
    Text1.Text = ""
End Sub

Private Sub Drive1_Change()
    On Error GoTo d_er:
    Dir1.Path = Drive1.Drive
Exit Sub
d_er:
    MsgBox ("ไม่สามารถบันทึกลง " + UCase(Drive1.Drive) + " ได้"), vbCritical, "การบันทึก"
    Drive1.ListIndex = 1
    Dir1.Path = "C:\"
End Sub

Private Sub Form_Load()
    Dir1.Path = "C:\"
End Sub

Private Sub Text1_Change()
    If Text1 = "" Then
        s_ave.Enabled = False
    Else
        s_ave.Enabled = True
    End If
End Sub
