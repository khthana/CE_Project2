VERSION 5.00
Begin VB.Form frmNewEmpPos 
   BackColor       =   &H00C0C0FF&
   Caption         =   "การแต่งตั้งอัตราใหม่"
   ClientHeight    =   4680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7335
   Icon            =   "frmNewEmpPos.frx":0000
   LinkTopic       =   "Form2"
   Picture         =   "frmNewEmpPos.frx":030A
   ScaleHeight     =   4680
   ScaleWidth      =   7335
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cboPosName 
      Height          =   330
      ItemData        =   "frmNewEmpPos.frx":1611
      Left            =   3840
      List            =   "frmNewEmpPos.frx":162A
      TabIndex        =   2
      Top             =   720
      Width           =   3015
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   120
      TabIndex        =   33
      Top             =   4200
      Width           =   855
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "แต่งตั้ง"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   32
      Top             =   3840
      Width           =   855
   End
   Begin VB.ComboBox cboEmpType 
      Height          =   330
      Left            =   3840
      Style           =   2  'Dropdown List
      TabIndex        =   31
      Top             =   4200
      Width           =   3015
   End
   Begin VB.ComboBox cboEmpGroup 
      Height          =   330
      Left            =   3840
      Style           =   2  'Dropdown List
      TabIndex        =   29
      Top             =   3840
      Width           =   3015
   End
   Begin VB.ComboBox cboEducation 
      Height          =   330
      Left            =   3840
      Style           =   2  'Dropdown List
      TabIndex        =   27
      Top             =   3480
      Width           =   3015
   End
   Begin VB.TextBox txtPosSal 
      Height          =   315
      Left            =   3840
      TabIndex        =   25
      Top             =   3120
      Width           =   1335
   End
   Begin VB.ComboBox cboPosHighLevel 
      Height          =   330
      Left            =   6360
      Style           =   2  'Dropdown List
      TabIndex        =   23
      Top             =   2760
      Width           =   735
   End
   Begin VB.ComboBox cboPosLowLevel 
      Height          =   330
      Left            =   3840
      Style           =   2  'Dropdown List
      TabIndex        =   21
      Top             =   2760
      Width           =   735
   End
   Begin VB.TextBox txtPosQua 
      Height          =   555
      Left            =   3840
      MultiLine       =   -1  'True
      TabIndex        =   18
      Top             =   2040
      Width           =   3015
   End
   Begin VB.ComboBox cboYearSal 
      Height          =   330
      ItemData        =   "frmNewEmpPos.frx":1699
      Left            =   5280
      List            =   "frmNewEmpPos.frx":17DB
      TabIndex        =   14
      Text            =   "1980"
      Top             =   1560
      Width           =   735
   End
   Begin VB.ComboBox cboDateSal 
      Height          =   330
      ItemData        =   "frmNewEmpPos.frx":1A5B
      Left            =   4560
      List            =   "frmNewEmpPos.frx":1ABC
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   1560
      Width           =   615
   End
   Begin VB.ComboBox cboMonthSal 
      Height          =   330
      ItemData        =   "frmNewEmpPos.frx":1B33
      Left            =   3840
      List            =   "frmNewEmpPos.frx":1B5B
      Style           =   2  'Dropdown List
      TabIndex        =   12
      Top             =   1560
      Width           =   615
   End
   Begin VB.ComboBox cboMonthPos 
      Height          =   330
      ItemData        =   "frmNewEmpPos.frx":1B86
      Left            =   3840
      List            =   "frmNewEmpPos.frx":1BAE
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1200
      Width           =   615
   End
   Begin VB.ComboBox cboDatePos 
      Height          =   330
      ItemData        =   "frmNewEmpPos.frx":1BD9
      Left            =   4560
      List            =   "frmNewEmpPos.frx":1C3A
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   1200
      Width           =   615
   End
   Begin VB.ComboBox cboYearPos 
      Height          =   330
      ItemData        =   "frmNewEmpPos.frx":1CB1
      Left            =   5280
      List            =   "frmNewEmpPos.frx":1DF3
      TabIndex        =   7
      Text            =   "1980"
      Top             =   1200
      Width           =   735
   End
   Begin VB.TextBox txtPosNo 
      Height          =   315
      Left            =   3840
      MaxLength       =   3
      TabIndex        =   1
      Top             =   240
      Width           =   495
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   120
      Picture         =   "frmNewEmpPos.frx":2073
      ToolTipText     =   "Home"
      Top             =   3120
      Width           =   945
   End
   Begin VB.Label Label14 
      BackStyle       =   0  'Transparent
      Caption         =   "ประเภทข้าราชการ :"
      Height          =   255
      Left            =   2400
      TabIndex        =   30
      Top             =   4200
      Width           =   1455
   End
   Begin VB.Label Label13 
      BackStyle       =   0  'Transparent
      Caption         =   "สายงาน :"
      Height          =   255
      Left            =   3120
      TabIndex        =   28
      Top             =   3840
      Width           =   735
   End
   Begin VB.Label Label12 
      BackStyle       =   0  'Transparent
      Caption         =   " ระดับการศึกษาขั้นต่ำ :"
      Height          =   255
      Left            =   2160
      TabIndex        =   26
      Top             =   3480
      Width           =   1695
   End
   Begin VB.Label Label11 
      BackStyle       =   0  'Transparent
      Caption         =   " อัตราเงินเดือนประจำอัตรา :"
      Height          =   255
      Left            =   1800
      TabIndex        =   24
      Top             =   3120
      Width           =   2055
   End
   Begin VB.Label Label10 
      BackStyle       =   0  'Transparent
      Caption         =   "ระดับสูงสุดของอัตรา :"
      Height          =   255
      Left            =   4800
      TabIndex        =   22
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Label Label9 
      BackStyle       =   0  'Transparent
      Caption         =   "ระดับต่ำสุดของอัตรา :"
      Height          =   255
      Left            =   2280
      TabIndex        =   20
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "คุณสมบัติ :"
      Height          =   255
      Left            =   3000
      TabIndex        =   19
      Top             =   2160
      Width           =   735
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   5160
      TabIndex        =   17
      Top             =   1560
      Width           =   135
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   4440
      TabIndex        =   16
      Top             =   1560
      Width           =   135
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   " วันอนุมัติเงินเดือน :"
      Height          =   255
      Left            =   2280
      TabIndex        =   15
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "วันอนุมัติอัตรา :"
      Height          =   255
      Left            =   2640
      TabIndex        =   11
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label25 
      BackStyle       =   0  'Transparent
      Caption         =   " เดือน/วัน/ปี ค.ศ."
      Height          =   255
      Left            =   6000
      TabIndex        =   10
      Top             =   1320
      Width           =   1335
   End
   Begin VB.Label Label28 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   4440
      TabIndex        =   9
      Top             =   1200
      Width           =   135
   End
   Begin VB.Label Label29 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   5160
      TabIndex        =   8
      Top             =   1200
      Width           =   135
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   " ชื่ออัตรา :"
      Height          =   255
      Left            =   3000
      TabIndex        =   4
      Top             =   720
      Width           =   735
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "3 ตัวอักษรเท่านั้น"
      Height          =   255
      Left            =   4440
      TabIndex        =   3
      Top             =   240
      Width           =   1335
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "หมายเลขประจำอัตรา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2160
      TabIndex        =   0
      Top             =   240
      Width           =   1575
   End
End
Attribute VB_Name = "frmNewEmpPos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Kong As Boolean
Dim PosDate As String, SalDate As String

Private Sub checkLevel()
    Dim st1 As String, st2 As String
    If (cboEmpType = "ข้าราชการ") And (cboEmpGroup.ListIndex = 0) Then
        st1 = 3
        st2 = 11
        Select Case cboPosName.ListIndex
            Case 0
                st1 = 3
                st2 = 7
            Case 1
                st1 = 6
                st2 = 8
            Case 2
                st1 = 7
                st2 = 9
            Case 3
                st1 = 9
                st2 = 11
        End Select
        findCombo cboPosLowLevel, st1
        Kong = False
        findCombo cboPosHighLevel, st2
        Kong = False
    End If
    If (cboEmpType = "ข้าราชการ") And ((cboEmpGroup.ListIndex = 1) Or (cboEmpGroup.ListIndex = 2)) Then
        st1 = 1
        st2 = 6
        Select Case cboEducation.ListIndex
            Case 3
                st1 = 1
                st2 = 2
            Case 5
                st1 = 2
                st2 = 3
            Case 7
                st1 = 3
                st2 = 4
            Case 8
                st1 = 4
                st2 = 5
            Case 9
                st1 = 5
                st2 = 6
        End Select
        findCombo cboPosLowLevel, st1
        Kong = False
        findCombo cboPosHighLevel, st2
        Kong = False
    End If
End Sub

Private Sub cboPosName_click()
    If Kong Then Exit Sub
    checkLevel
End Sub

Private Sub cboEducation_click()
    If Kong Then Exit Sub
    checkLevel
End Sub

Private Sub cboEmpGroup_Click()
    If Kong Then Exit Sub
    checkLevel
    If cboEmpGroup.ListIndex = 2 Then cboPosName.ListIndex = 4
    If cboEmpGroup.ListIndex = 6 Then cboPosName.ListIndex = 6
End Sub

Private Sub cboEmpType_Click()
    If Kong Then Exit Sub
    If cboEmpType = "ลูกจ้างประจำ" Then
        findCombo cboPosLowLevel, "1"
        Kong = False
        findCombo cboPosHighLevel, "4"
        Kong = False
        findCombo cboEmpGroup, "หมวดกึ่งฝีมือ"
        Kong = False
    End If
    checkLevel
End Sub

Private Sub cmdClear_Click()
    Kong = True
    txtPosNo = ""
    txtPosQua = ""
    txtPosSal = ""
    cboPosName.ListIndex = 0
    cboMonthPos.ListIndex = 0
    cboDatePos.ListIndex = 0
    cboYearPos.Text = "1980"
    cboMonthSal.ListIndex = 0
    cboDateSal.ListIndex = 0
    cboYearSal.Text = "1980"
    cboPosHighLevel.ListIndex = 0
    cboPosLowLevel.ListIndex = 0
    cboEducation.ListIndex = 7
    cboEmpGroup.ListIndex = 0
    cboEmpType.ListIndex = 1
End Sub

Private Sub MakeDate()
    PosDate = ""
    SalDate = ""
    PosDate = cboMonthPos.Text + "/" + cboDatePos.Text + "/" + cboYearPos.Text
    SalDate = cboMonthSal.Text + "/" + cboDateSal.Text + "/" + cboYearSal.Text
End Sub

Private Sub cmdCreate_Click()
    If (txtPosNo = "" Or cboPosName = "" Or cboMonthPos = "" Or cboDatePos = "" _
        Or cboYearPos = "" Or cboMonthSal = "" Or cboDateSal = "" _
        Or cboYearSal = "" Or cboPosHighLevel = "" Or cboPosLowLevel = "" _
        Or txtPosSal = "" Or cboEducation = "" Or cboEmpGroup = "" _
        Or cboEmpType = "" Or Len(txtPosNo.Text) <> 3) Then
            MsgBox "กรุณากรอกข้อมูลให้ครบถ้วน ยกเว้นคุณสมบัติจะกรอกหรือไม่ก็ได้", , "การแต่งตั้งอัตราใหม่"
            Exit Sub
    End If
    Dim obj As Object, obj2 As Object
    Dim total1 As Integer, total2 As Integer
    Set obj = cache.Static("Person.Per")
    total1 = obj.TotalAmount("EmpPos")
    MakeDate
    Set obj2 = cache.Static("Person.EmpPos")
    obj2.NewEmpPos txtPosNo.Text, cboPosName.Text, PosDate, SalDate, txtPosQua.Text, _
                    cboPosHighLevel.Text, cboPosLowLevel.Text, txtPosSal.Text, _
                    cboEducation.Text, cboEmpGroup.Text, cboEmpType.Text
    total2 = obj.TotalAmount("EmpPos")
    If tatal1 = total2 Then
        MsgBox "หมายเลขอัตราซ้ำ กรุณาเปลี่ยนใหม่", , "การแต่งตั้งอัตราใหม่"
    Else
        MsgBox "อัตราใหม่ได้ถูกบันทึกในฐานข้อมูลเรียบร้อยแล้ว", , "การแต่งตั้งอัตราใหม่"
    End If
    cmdClear_Click
End Sub

Private Sub Form_Load()
    ConnectObjects "PROJECT"
    LoadGovLevelCombo
    LoadEducationCombo
    LoadEmpGroupCombo
    LoadEmpTypeCombo
    Kong = False
End Sub

Private Sub ConnectObjects(Address As String)
    ' Connects Cacheobject to the Cacheserver specified in Address
    Dim ok As Boolean
    Set cache = CreateObject("CacheObject.Factory")
    If Address = "" Then
        Address = cache.ConnectDlg
        If Address = "" Then End
    End If
    ok = cache.Connect(Address)
    If Not ok Then
        MsgBox "Failed to Connect to Cache Object Server", , "Cache Connection"
        End
    End If
End Sub

Private Sub findCombo(obj As Object, st As String)
    Dim i As Integer, j As Integer
    j = obj.ListCount - 1
    For i = 0 To j
        If (obj.List(i) = st) Then
            Kong = True
            obj.Text = obj.List(i)
            i = j + 1
        End If
    Next i
End Sub

Private Sub Image1_Click()
    frmMain.Show 0
    Unload Me
End Sub

Private Sub LoadGovLevelCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.GovLevel")
    displays = obj.GovLevelDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboPosHighLevel.Clear
    cboPosLowLevel.Clear
    For i = 1 To UBound(objs)
        cboPosHighLevel.AddItem objs(i)
        cboPosLowLevel.AddItem objs(i)
    Next i
End Sub

Private Sub LoadEducationCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, educations() As String
    Set obj = cache.Static("Person.Education")
    displays = obj.EducationDISPLAYLIST
    delimd = Left(displays, 1)
    educations = Split(displays, delimd)
    cboEducation.Clear
    For i = 1 To UBound(educations)
        cboEducation.AddItem educations(i)
    Next i
End Sub

Private Sub LoadEmpGroupCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, EmpGroups() As String
    Set obj = cache.Static("Person.EmpGroup")
    displays = obj.EmpGroupDISPLAYLIST
    delimd = Left(displays, 1)
    EmpGroups = Split(displays, delimd)
    cboEmpGroup.Clear
    For i = 1 To UBound(EmpGroups)
        cboEmpGroup.AddItem EmpGroups(i)
    Next i
End Sub

Private Sub LoadEmpTypeCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, EmpTypes() As String
    Set obj = cache.Static("Person.EmpType")
    displays = obj.EmpTypeDISPLAYLIST
    delimd = Left(displays, 1)
    EmpTypes = Split(displays, delimd)
    cboEmpType.Clear
    For i = 1 To UBound(EmpTypes)
        cboEmpType.AddItem EmpTypes(i)
    Next i
End Sub

Private Sub txtPosNo_Change()
    cmdCreate.Enabled = True
    Dim obj As Object, EmpPos As Object
    Dim i As Integer, aa As Integer
    Set obj = cache.Static("Person.Per")
    i = obj.TotalAmount("EmpPos")
    For aa = 1 To i
        Set EmpPos = cache.OpenId("Person.EmpPos", aa)
        If txtPosNo.Text = EmpPos.PosNo Then
            aa = i
            cmdCreate.Enabled = False
            MsgBox "หมายเลขอัตราซ้ำ กรุณาเปลี่ยนใหม่", , "การแต่งตั้งอัตราใหม่"
        Else
            cmdCreate.Enabled = True
        End If
    Next aa
End Sub
