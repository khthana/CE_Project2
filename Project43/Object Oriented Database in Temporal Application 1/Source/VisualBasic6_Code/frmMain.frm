VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H8000000B&
   Caption         =   "ระบบสารสนเทศทะเบียนนักศึกษา"
   ClientHeight    =   6150
   ClientLeft      =   1935
   ClientTop       =   1470
   ClientWidth     =   8505
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000D&
   LinkTopic       =   "Form1"
   ScaleHeight     =   6150
   ScaleWidth      =   8505
   Begin VB.Frame Frame2 
      BackColor       =   &H8000000B&
      Caption         =   "กิจกรรมทะเบียนนักศึกษา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3375
      Left            =   4560
      TabIndex        =   12
      Top             =   1080
      Width           =   3015
      Begin VB.CommandButton cmdCheck 
         BackColor       =   &H00FF80FF&
         Caption         =   "พิจารณาจบ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2520
         Width           =   2535
      End
      Begin VB.CommandButton cmdGrade 
         BackColor       =   &H00FF80FF&
         Caption         =   "ผลการเรียน"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   1800
         Width           =   2535
      End
      Begin VB.CommandButton cmdRegister 
         BackColor       =   &H00FF80FF&
         Caption         =   "ลงทะเบียน"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   1080
         Width           =   2535
      End
      Begin VB.CommandButton cmdCourse 
         BackColor       =   &H00FF80FF&
         Caption         =   "หลักสูตรการศึกษา"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   360
         Width           =   2535
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H8000000B&
      Caption         =   "ข้อมูลทะเบียนนักศึกษา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4095
      Left            =   600
      TabIndex        =   11
      Top             =   1080
      Width           =   3015
      Begin VB.CommandButton cmdSub 
         BackColor       =   &H00C0FFFF&
         Caption         =   "วิชา"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   3240
         Width           =   2535
      End
      Begin VB.CommandButton cmdBranch 
         BackColor       =   &H00C0FFFF&
         Caption         =   "สาขาวิชา"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   2520
         Width           =   2535
      End
      Begin VB.CommandButton cmdDepartment 
         BackColor       =   &H00C0FFFF&
         Caption         =   "ภาควิชา"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   1800
         Width           =   2535
      End
      Begin VB.CommandButton cmdFaculty 
         BackColor       =   &H00C0FFFF&
         Caption         =   "คณะ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   1080
         Width           =   2535
      End
      Begin VB.CommandButton cmdStd 
         BackColor       =   &H00C0FFFF&
         Caption         =   "นักศึกษา"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   240
         MaskColor       =   &H00C0FFFF&
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   360
         Width           =   2535
      End
   End
   Begin VB.CommandButton cmdExitMain 
      BackColor       =   &H008080FF&
      Caption         =   "ออกจากโปรแกรม"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4800
      MaskColor       =   &H8000000B&
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   4680
      Width           =   2535
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C000&
      Caption         =   "ระบบทะเบียนนักศึกษา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   20.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   480
      TabIndex        =   0
      Top             =   120
      Width           =   7455
   End
   Begin VB.Menu MnuMaster 
      Caption         =   "ข้อมูลทะเบียนนักศึกษา"
      Begin VB.Menu MnuStudent 
         Caption         =   "นักศึกษา"
         Shortcut        =   ^S
      End
      Begin VB.Menu MnuFc 
         Caption         =   "คณะ"
         Shortcut        =   ^F
      End
      Begin VB.Menu MnuDpt 
         Caption         =   "ภาควิชา"
         Shortcut        =   ^D
      End
      Begin VB.Menu MnuBrn 
         Caption         =   "สาขาวิชา"
         Shortcut        =   ^B
      End
      Begin VB.Menu MnuSubject 
         Caption         =   "วิชา"
         Shortcut        =   ^V
      End
      Begin VB.Menu Mnusup 
         Caption         =   "-"
      End
      Begin VB.Menu MnuExit 
         Caption         =   "ออกจากโปรแกรม"
         Shortcut        =   ^X
      End
   End
   Begin VB.Menu MnuAct 
      Caption         =   "กิจกรรมทะเบียนนักศึกษา"
      Begin VB.Menu MnuCourse 
         Caption         =   "หลักสูตรการศึกษา"
         Shortcut        =   ^C
      End
      Begin VB.Menu MnuRegister 
         Caption         =   "ลงทะเบียนเรียน"
         Shortcut        =   ^R
      End
      Begin VB.Menu MnuGrade 
         Caption         =   "ผลการเรียน"
         Shortcut        =   ^G
      End
      Begin VB.Menu MnuCheck 
         Caption         =   "พิจารณาจบ"
         Shortcut        =   ^T
      End
   End
   Begin VB.Menu MnuTemporal 
      Caption         =   "ข้อมูลทะเบียนนักศึกษาเชิงเวลา"
      Begin VB.Menu MnuEditStudent 
         Caption         =   "นักศึกษา"
         Shortcut        =   {F2}
      End
      Begin VB.Menu MnuEditSubject 
         Caption         =   "วิชา"
         Shortcut        =   {F3}
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 

Private Sub cmdBranch_Click()
frmBranch.Show vbModal
End Sub

Private Sub cmdCheck_Click()
frmCheck.Show vbModal
End Sub

Private Sub cmdCourse_Click()
 frmCourse.Show vbModal
End Sub

Private Sub cmdDepartment_Click()
frmDepartment.Show vbModal
End Sub

Private Sub cmdExitMain_Click()
       If MsgBox("ต้องการออกจากระบบทะเบียนนักศึกษา ใช่หรือไม่", vbYesNo, "ออกจากโปรแกรม") = vbYes Then
        End
    End If
End Sub

Private Sub cmdFaculty_Click()
frmFaculty.Show vbModal
End Sub

Private Sub cmdGrade_Click()
frmGrade.Show vbModal
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



Private Sub MnuBrn_Click()
frmBranch.Show vbModal
End Sub

Private Sub MnuCheck_Click()
frmCheck.Show vbModal
End Sub

Private Sub MnuCourse_Click()
frmCourse.Show vbModal
End Sub

Private Sub MnuDpt_Click()
frmDepartment.Show vbModal
End Sub

Private Sub MnuEditStudent_Click()
  frmEditSd.Show vbModal
End Sub

Private Sub MnuEditSubject_Click()
  frmEditSub.Show vbModal
    
End Sub

Private Sub MnuExit_Click()
    If MsgBox("Do you want exit program", vbYesNo, "Confirm Exit Program") = vbYes Then
        End
    End If
End Sub



Private Sub MnuFc_Click()
frmFaculty.Show vbModal
End Sub

Private Sub MnuGrade_Click()
frmGrade.Show vbModal
End Sub

Private Sub MnuRegister_Click()
frmRegister.Show vbModal
End Sub

Private Sub MnuStudent_Click()
frmStudent.Show vbModal
End Sub

Private Sub MnuSubject_Click()
    frmSub.Show vbModal
End Sub


