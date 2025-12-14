VERSION 5.00
Begin VB.Form frmNewTraining 
   BackColor       =   &H00FFFFC0&
   Caption         =   "เพิ่มกำหนดการ Training, Research, Seminar"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5535
   LinkTopic       =   "Form2"
   ScaleHeight     =   3135
   ScaleWidth      =   5535
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   2520
      TabIndex        =   13
      Top             =   2640
      Width           =   735
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      Height          =   375
      Left            =   1680
      TabIndex        =   12
      Top             =   2640
      Width           =   735
   End
   Begin VB.ComboBox cboYearBegin 
      Height          =   330
      ItemData        =   "frmNewTraining.frx":0000
      Left            =   3120
      List            =   "frmNewTraining.frx":0142
      TabIndex        =   8
      Text            =   "1980"
      Top             =   1680
      Width           =   735
   End
   Begin VB.ComboBox cboDateBegin 
      Height          =   330
      ItemData        =   "frmNewTraining.frx":03C2
      Left            =   2400
      List            =   "frmNewTraining.frx":0423
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   1680
      Width           =   615
   End
   Begin VB.ComboBox cboMonthBegin 
      Height          =   330
      ItemData        =   "frmNewTraining.frx":049A
      Left            =   1680
      List            =   "frmNewTraining.frx":04C2
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1680
      Width           =   615
   End
   Begin VB.ComboBox cboMonthFinish 
      Height          =   330
      ItemData        =   "frmNewTraining.frx":04ED
      Left            =   1680
      List            =   "frmNewTraining.frx":0515
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   2040
      Width           =   615
   End
   Begin VB.ComboBox cboDateFinish 
      Height          =   330
      ItemData        =   "frmNewTraining.frx":0540
      Left            =   2400
      List            =   "frmNewTraining.frx":05A1
      Style           =   2  'Dropdown List
      TabIndex        =   10
      Top             =   2040
      Width           =   615
   End
   Begin VB.ComboBox cboYearFinish 
      Height          =   330
      ItemData        =   "frmNewTraining.frx":0618
      Left            =   3120
      List            =   "frmNewTraining.frx":075A
      TabIndex        =   11
      Text            =   "1980"
      Top             =   2040
      Width           =   735
   End
   Begin VB.TextBox txtPlace 
      Height          =   315
      Left            =   1680
      TabIndex        =   5
      Top             =   1320
      Width           =   3735
   End
   Begin VB.TextBox txtTraining 
      Height          =   315
      Left            =   1680
      TabIndex        =   3
      Top             =   960
      Width           =   3735
   End
   Begin VB.ListBox lvTraining 
      Height          =   690
      ItemData        =   "frmNewTraining.frx":09DA
      Left            =   1680
      List            =   "frmNewTraining.frx":09E7
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
   Begin VB.Label Label29 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   3000
      TabIndex        =   20
      Top             =   1680
      Width           =   135
   End
   Begin VB.Label Label28 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   2280
      TabIndex        =   19
      Top             =   1680
      Width           =   135
   End
   Begin VB.Label Label25 
      BackStyle       =   0  'Transparent
      Caption         =   " เดือน/วัน/ปี ค.ศ."
      Height          =   255
      Left            =   3840
      TabIndex        =   18
      Top             =   1800
      Width           =   1335
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   " วันที่เริ่มต้น :"
      Height          =   255
      Left            =   600
      TabIndex        =   17
      Top             =   1680
      Width           =   975
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "วันที่สิ้นสุด :"
      Height          =   255
      Left            =   720
      TabIndex        =   16
      Top             =   2040
      Width           =   855
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   2280
      TabIndex        =   15
      Top             =   2040
      Width           =   135
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   3000
      TabIndex        =   14
      Top             =   2040
      Width           =   135
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "สถานที่ :"
      Height          =   255
      Left            =   960
      TabIndex        =   4
      Top             =   1320
      Width           =   615
   End
   Begin VB.Label Label 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ฝึกอบรม :"
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "กรุณาเลือก"
      Height          =   255
      Left            =   840
      TabIndex        =   1
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "frmNewTraining"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim BeginDate As String, FinishDate As String
Dim FromLessThanTo As Boolean

Private Sub MakeDate()
    BeginDate = ""
    FinishDate = ""
    If (cboMonthBegin = "" Or cboDateBegin = "" Or cboYearBegin = "" _
        Or cboMonthFinish = "" Or cboDateFinish = "" Or cboYearFinish = "") _
        Then Exit Sub
    BeginDate = cboMonthBegin.Text + "/" + cboDateBegin.Text + "/" + cboYearBegin.Text
    FinishDate = cboMonthFinish.Text + "/" + cboDateFinish.Text + "/" + cboYearFinish.Text
End Sub

Private Sub CompareDate()
    FromLessThanTo = False
    If CInt(cboYearBegin) < 10 Then cboYearBegin.Text = "20" + cboYearBegin.Text
    If CInt(cboYearFinish) < 10 Then cboYearFinish.Text = "20" + cboYearFinish.Text
    If CInt(cboYearBegin) < CInt(cboYearFinish) Then FromLessThanTo = True
    If CInt(cboYearBegin) = CInt(cboYearFinish) Then
        If CInt(cboMonthBegin) < CInt(cboMonthFinish) Then
            FromLessThanTo = True
        ElseIf CInt(cboMonthBegin) = CInt(cboMonthFinish) Then
            If CInt(cboDateBegin) < CInt(cboDateFinish) Then
                FromLessThanTo = True
            End If
        End If
    End If
End Sub

Private Sub cmdAdd_Click()
    CompareDate
    MakeDate
    If Not FromLessThanTo Then
        MsgBox "เวลาเริ่มต้นต้องน้อยกว่าเวลาสิ้นสุด", , "การแต่งตั้งอัตราใหม่"
        Exit Sub
    End If
    If (txtTraining = "" Or txtPlace = "" Or BeginDate = "" Or FinishDate = "") Then
            MsgBox "กรุณากรอกข้อมูลให้ครบถ้วน", , "การแต่งตั้งอัตราใหม่"
            Exit Sub
    End If
    Dim obj As Object
    Select Case lvTraining.ListIndex
        Case 0
            Set obj = cache.Static("Person.Training")
            obj.NewTraining txtTraining.Text, txtPlace.Text, BeginDate, FinishDate
            frmTraining.LoadTraining
        Case 1
            Set obj = cache.Static("Person.Research")
            obj.NewResearch txtTraining.Text, txtPlace.Text, BeginDate, FinishDate
            frmResearch.LoadResearch
        Case 2
            Set obj = cache.Static("Person.Seminar")
            obj.NewSeminar txtTraining.Text, txtPlace.Text, BeginDate, FinishDate
            frmSeminar.LoadSeminar
    End Select
    MsgBox "ข้อมูลได้ถูกบันทึกลงฐานข้อมูลเรียบร้อยแล้ว", , "การแต่งตั้งอัตราใหม่"
    cmdClear_Click
End Sub

Private Sub cmdClear_Click()
    txtTraining = ""
    txtPlace = ""
    cboMonthBegin.ListIndex = 0
    cboDateBegin.ListIndex = 0
    cboYearBegin.Text = "1980"
    cboMonthFinish.ListIndex = 0
    cboDateFinish.ListIndex = 0
    cboYearFinish.Text = "1980"
End Sub

Private Sub lvTraining_Click()
    If lvTraining.ListIndex = 0 Then Label.Caption = "หัวข้อฝึกงาน/ดูงาน :"
    If lvTraining.ListIndex = 1 Then Label.Caption = "หัวข้องานวิจัย :"
    If lvTraining.ListIndex = 2 Then Label.Caption = "หัวข้อการอบรม :"
End Sub
