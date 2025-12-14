VERSION 5.00
Begin VB.Form frmMain3 
   BackColor       =   &H00C0C0C0&
   Caption         =   "ระบบสารสนเทศทะเบียนนักศึกษา"
   ClientHeight    =   6150
   ClientLeft      =   1320
   ClientTop       =   1560
   ClientWidth     =   8505
   ForeColor       =   &H00C0C0C0&
   LinkTopic       =   "Form1"
   ScaleHeight     =   6150
   ScaleWidth      =   8505
   Begin VB.CommandButton cmdCourse 
      Caption         =   "หลักสูตรการศึกษา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5160
      TabIndex        =   6
      Top             =   1560
      Width           =   2295
   End
   Begin VB.CommandButton cmdFacDepBranch 
      Caption         =   "คณะ/ภาควิชา/สาขาวิชา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2280
      TabIndex        =   5
      Top             =   4080
      Width           =   2295
   End
   Begin VB.CommandButton cmdRegister 
      Caption         =   "ลงทะเบียนนักศึกษา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2280
      TabIndex        =   3
      Top             =   3240
      Width           =   2295
   End
   Begin VB.CommandButton cmdSub 
      Caption         =   "เพิ่ม/ลบ/แก้ไขวิชา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2280
      TabIndex        =   2
      Top             =   2400
      Width           =   2295
   End
   Begin VB.CommandButton cmdExitMain 
      Caption         =   "ออกจากโปรแกรม"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5520
      TabIndex        =   4
      Top             =   5160
      Width           =   2295
   End
   Begin VB.CommandButton cmdStd 
      BackColor       =   &H00000000&
      Caption         =   "เพิ่ม/ลบ/แก้ไข นักศึกษา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2280
      MaskColor       =   &H00FFFFC0&
      TabIndex        =   1
      Top             =   1560
      Width           =   2295
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "ระบบสารสนเทศทะเบียนนักศึกษา"
      BeginProperty Font 
         Name            =   "AngsanaUPC"
         Size            =   26.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   840
      TabIndex        =   0
      Top             =   360
      Width           =   7455
   End
   Begin VB.Menu MnuMaster 
      Caption         =   "Master"
      Begin VB.Menu MnuStudent 
         Caption         =   "Student"
      End
      Begin VB.Menu MnuSubject 
         Caption         =   "Subject"
      End
      Begin VB.Menu MnuUniversity 
         Caption         =   "University"
      End
      Begin VB.Menu ln1 
         Caption         =   "-"
      End
      Begin VB.Menu MnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu MnuTemporal 
      Caption         =   "Temporal"
      Begin VB.Menu MnuEditSubject 
         Caption         =   "Subject"
      End
   End
End
Attribute VB_Name = "frmMain3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 

Private Sub cmdCourse_Click()
    frmCourse.Show vbModal
End Sub

Private Sub cmdExitMain_Click()
   End
End Sub

Private Sub cmdFacDepBranch_Click()
    frmFcDeptBrn.Show vbModal
End Sub

Private Sub cmdRegister_Click()
    frmRegister.Show vbModal
End Sub

Private Sub cmdStd_Click()
  frmStudent.Show vbModal
End Sub


Private Sub cmdSub_Click()
  frmSub.Show vbModal
End Sub

Private Sub Form_Load()
    ConnectObjects "Student"
End Sub

Private Sub MnuEditSubject_Click()
    frmEditSub.Show vbModal
End Sub

Private Sub MnuExit_Click()
    If MsgBox("Do you want exit program", vbYesNo, "Confirm Exit Program") = vbYes Then
        End
    End If
End Sub



Private Sub MnuSubject_Click()
    frmSub.Show vbModal
End Sub


Private Sub MnuUniversity_Click()
    frmFcDeptBrn.Show vbModal
End Sub
