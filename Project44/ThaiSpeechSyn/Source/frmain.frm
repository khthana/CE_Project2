VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmain 
   AutoRedraw      =   -1  'True
   BackColor       =   &H0080C0FF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Just Speak"
   ClientHeight    =   8595
   ClientLeft      =   3435
   ClientTop       =   2250
   ClientWidth     =   8670
   Icon            =   "frmain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8595
   ScaleWidth      =   8670
   Begin VB.Frame Frame1 
      BackColor       =   &H0080C0FF&
      Height          =   855
      Left            =   120
      TabIndex        =   6
      Top             =   7560
      Width           =   8415
      Begin VB.CommandButton cmdcutwd 
         Caption         =   "ตัดคำ"
         Height          =   495
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdexit 
         Caption         =   "ออก"
         Height          =   495
         Left            =   7200
         TabIndex        =   10
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdrepeat 
         Caption         =   "ฟังข้อความซ้ำ"
         Enabled         =   0   'False
         Height          =   495
         Left            =   2520
         TabIndex        =   9
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdreset 
         Caption         =   "เริ่มใหม่"
         Height          =   495
         Left            =   3720
         TabIndex        =   8
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdspk 
         Caption         =   "ฟังข้อความ"
         Enabled         =   0   'False
         Height          =   495
         Left            =   1320
         TabIndex        =   7
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.TextBox txtsym 
      Height          =   6855
      Left            =   6840
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   480
      Width           =   1695
   End
   Begin VB.TextBox txtwrd 
      Height          =   6855
      Left            =   4920
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   480
      Width           =   1695
   End
   Begin VB.TextBox txtspk 
      Height          =   6855
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   480
      Width           =   4575
   End
   Begin MSComDlg.CommonDialog cmndlg 
      Left            =   8160
      Top             =   8040
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DialogTitle     =   "Open Text File"
      Filter          =   "Text File (*.txt)|*.txt"
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackColor       =   &H0080C0FF&
      Caption         =   "สัญลักษณ์ :"
      ForeColor       =   &H00000000&
      Height          =   210
      Left            =   6840
      TabIndex        =   5
      Top             =   120
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackColor       =   &H0080C0FF&
      Caption         =   "คำ :"
      ForeColor       =   &H00000000&
      Height          =   210
      Left            =   4920
      TabIndex        =   4
      Top             =   120
      Width           =   270
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H0080C0FF&
      Caption         =   "ข้อความ :"
      ForeColor       =   &H00000000&
      Height          =   210
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   645
   End
   Begin VB.Menu mfile 
      Caption         =   "&File"
      NegotiatePosition=   1  'Left
      Begin VB.Menu mopentx 
         Caption         =   "O&pen Text File..."
         Shortcut        =   {F3}
      End
      Begin VB.Menu msep1 
         Caption         =   "-"
      End
      Begin VB.Menu mexit 
         Caption         =   "E&xit"
         Shortcut        =   ^X
      End
   End
   Begin VB.Menu moption 
      Caption         =   "&Option"
      Begin VB.Menu musesil 
         Caption         =   "&Use Silence"
      End
      Begin VB.Menu mnosil 
         Caption         =   "&No Silence"
         Checked         =   -1  'True
      End
   End
   Begin VB.Menu mdb 
      Caption         =   "&Database"
      NegotiatePosition=   1  'Left
      Begin VB.Menu madd 
         Caption         =   "&Add Word..."
         Shortcut        =   {F6}
      End
      Begin VB.Menu mphonedir 
         Caption         =   "Select &Phoneme Directory..."
         Shortcut        =   {F7}
      End
   End
   Begin VB.Menu mhelp1 
      Caption         =   "&Help"
      NegotiatePosition=   3  'Right
      Begin VB.Menu mabout 
         Caption         =   "A&bout..."
         Shortcut        =   {F12}
      End
   End
End
Attribute VB_Name = "frmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdcutwd_Click()
    If txtspk.Text = "" Then
        MsgBox "โปรดใส่ข้อความที่ต้องการตัดคำเสียก่อน", vbOKOnly, "มีข้อผิดพลาด!"
    Else
        txtwrd.Text = ""
        txtsym.Text = ""
        CutWord
        If txtwrd.Text <> "" Then cmdspk.Enabled = True
    End If
End Sub

Private Sub cmdexit_Click()
    mexit_Click
End Sub

Private Sub cmdrepeat_Click()
Dim mx As String
    
    mx = App.Path & "\mix.wav"
    PlayWave mx
End Sub

Private Sub cmdreset_Click()
    StopWave
    txtspk.Text = ""
    txtwrd.Text = ""
    txtsym.Text = ""
    txtspk.SetFocus
    cmdspk.Enabled = False
    cmdrepeat.Enabled = False
End Sub

Private Sub cmdspk_Click()
Dim f1 As String, f2 As String
Dim allSym As String
Dim Sym As String
Dim spPos As Long, i As Long

    f1 = App.Path & "\mix.wav"
    ClearMix
    allSym = txtsym.Text
    Do Until Len(allSym) <= 0
        f2 = ""
        spPos = InStr(1, allSym, vbCrLf, vbTextCompare)
        If spPos = 0 Then
            Sym = allSym
            allSym = ""
        ElseIf spPos > 0 Then
            Sym = Left(allSym, (spPos - 1))
            i = Len(allSym) - spPos - 1
            allSym = Right(allSym, i)
        End If
        f2 = PhonePath & Sym & ".wav"
        MergeWave f1, f2
    Loop
    
    PlayWave (f1)
    cmdrepeat.Enabled = True
End Sub



Private Sub Form_Load()
    If HasSoundCard = False Then
        MsgBox "คุณไม่มีการ์ดเสียง ไม่สามารถใช้โปรแกรมนี้ได้!", vbOKOnly, "No SoundCard"
        mexit_Click
    'Else
    '    MsgBox "ยินดีต้อนรับสู่โปรแกรม Just Speak", vbOKOnly, "Welcome to Just Speak"
    End If
End Sub

Private Sub mabout_Click()
    frabout.Show 1
End Sub

Private Sub madd_Click()
    frgendic.Show 1
End Sub

Private Sub mexit_Click()
Dim frm As Form
    For Each frm In Forms
        frm.Hide
        Unload frm
        Set frm = Nothing
    Next frm
    End
End Sub

Private Sub mnosil_Click()
    musesil.Checked = False
    mnosil.Checked = True
End Sub

Private Sub mopentx_Click()
    cmndlg.InitDir = App.Path
    cmndlg.ShowOpen
    If cmndlg.FileName <> "" Then
        Open cmndlg.FileName For Input As #1
        txtspk.Text = Input$(LOF(1), 1)
        Close #1
    End If
End Sub

Private Sub mphonedir_Click()
    frphone.Show 1
End Sub

Private Sub musesil_Click()
    musesil.Checked = True
    mnosil.Checked = False
End Sub
