VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmQuery2 
   BackColor       =   &H00C0FFC0&
   Caption         =   "สอบถามการเลื่อนขั้นเงินเดือน จำแนกตามเวลา"
   ClientHeight    =   4590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9375
   LinkTopic       =   "Form2"
   ScaleHeight     =   4590
   ScaleWidth      =   9375
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdQuery 
      Caption         =   "Query"
      Height          =   375
      Left            =   8160
      TabIndex        =   6
      Top             =   960
      Width           =   1095
   End
   Begin MSComctlLib.ListView lvEObj 
      Height          =   3495
      Left            =   120
      TabIndex        =   7
      Top             =   960
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   6165
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.ComboBox cboYearFinish 
      Height          =   330
      ItemData        =   "frmQuery2.frx":0000
      Left            =   5760
      List            =   "frmQuery2.frx":0142
      TabIndex        =   5
      Text            =   "1980"
      Top             =   480
      Width           =   735
   End
   Begin VB.ComboBox cboDateFinish 
      Height          =   330
      ItemData        =   "frmQuery2.frx":03C2
      Left            =   5040
      List            =   "frmQuery2.frx":0423
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   480
      Width           =   615
   End
   Begin VB.ComboBox cboMonthFinish 
      Height          =   330
      ItemData        =   "frmQuery2.frx":049A
      Left            =   4320
      List            =   "frmQuery2.frx":04C2
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   480
      Width           =   615
   End
   Begin VB.ComboBox cboMonthBegin 
      Height          =   330
      ItemData        =   "frmQuery2.frx":04ED
      Left            =   4320
      List            =   "frmQuery2.frx":0515
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   120
      Width           =   615
   End
   Begin VB.ComboBox cboDateBegin 
      Height          =   330
      ItemData        =   "frmQuery2.frx":0540
      Left            =   5040
      List            =   "frmQuery2.frx":05A1
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   120
      Width           =   615
   End
   Begin VB.ComboBox cboYearBegin 
      Height          =   330
      ItemData        =   "frmQuery2.frx":0618
      Left            =   5760
      List            =   "frmQuery2.frx":075A
      TabIndex        =   2
      Text            =   "1980"
      Top             =   120
      Width           =   735
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   8280
      Picture         =   "frmQuery2.frx":09DA
      ToolTipText     =   "Home"
      Top             =   240
      Width           =   945
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "ท่านใดได้เลื่อนขั้นเงินเดือนบ้าง ตามช่วงเวลา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   240
      TabIndex        =   15
      Top             =   120
      Width           =   3495
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   5640
      TabIndex        =   14
      Top             =   480
      Width           =   135
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   4920
      TabIndex        =   13
      Top             =   480
      Width           =   135
   End
   Begin VB.Label Label5 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ถึง :"
      Height          =   255
      Left            =   3600
      TabIndex        =   12
      Top             =   480
      Width           =   615
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "จาก :"
      Height          =   255
      Left            =   3600
      TabIndex        =   11
      Top             =   120
      Width           =   615
   End
   Begin VB.Label Label25 
      BackStyle       =   0  'Transparent
      Caption         =   " เดือน/วัน/ปี ค.ศ."
      Height          =   255
      Left            =   6480
      TabIndex        =   10
      Top             =   240
      Width           =   1335
   End
   Begin VB.Label Label28 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   4920
      TabIndex        =   9
      Top             =   120
      Width           =   135
   End
   Begin VB.Label Label29 
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      Height          =   255
      Left            =   5640
      TabIndex        =   8
      Top             =   120
      Width           =   135
   End
End
Attribute VB_Name = "frmQuery2"
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

Private Sub CheckDate()
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

Private Sub Form_Load()
    ConnectObjects "PROJECT"
    
        lvEObj.View = lvwReport
        lvEObj.FullRowSelect = True
        lvEObj.ColumnHeaders.Clear
        lvEObj.ColumnHeaders.Add , , "Person ID", 900, lvwColumnLeft
        lvEObj.ColumnHeaders.Add , , "ชื่อ", 1200, lvwColumnLeft
        lvEObj.ColumnHeaders.Add , , "ขั้นเงินเดือนเดิม", 1550, lvwColumnLeft
        lvEObj.ColumnHeaders.Add , , "ขั้นเงินเดือนใหม่", 1550, lvwColumnLeft
        lvEObj.ColumnHeaders.Add , , "อัตราเงินเดือนที่เปลี่ยนแปลง", 2200, lvwColumnLeft
        lvEObj.ListItems.Clear
        
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

Function CompareDate(DDate As String, Fobj As String, Tobj As String, id As Integer) As Boolean

    Dim Dd, FromArray, ToArray
    
    Dd = Split(DDate, "/", -1, 1)
    FromArray = Split(Fobj, "/", -1, 1)
    ToArray = Split(Tobj, "/", -1, 1)
    
    If Len(Dd(2)) = 2 Then
        If CInt(Dd(2) <= 29) Then
            DDate = Dd(0) + "/" + Dd(1) + "/20" + Dd(2)
        Else
            DDate = Dd(0) + "/" + Dd(1) + "/19" + Dd(2)
        End If
    End If
    If Len(FromArray(2)) = 2 Then
        If CInt(FromArray(2) <= 29) Then
            Fobj = FromArray(0) + "/" + FromArray(1) + "/20" + FromArray(2)
        Else
            Fobj = FromArray(0) + "/" + FromArray(1) + "/19" + FromArray(2)
        End If
    End If
    If Len(ToArray(2)) = 2 Then
        If CInt(ToArray(2) <= 29) Then
            Tobj = ToArray(0) + "/" + ToArray(1) + "/20" + ToArray(2)
        Else
            Tobj = ToArray(0) + "/" + ToArray(1) + "/19" + ToArray(2)
        End If
    End If

    Dim DDD As Long, FFF As Long, TTT As Long
    Dim obj As Object
    Set obj = cache.Static("Person.Per")
    DDD = obj.ConvertDate(DDate)
    FFF = obj.ConvertDate(Fobj)
    TTT = obj.ConvertDate(Tobj)
    
    CompareDate = False
    If id = 1 Then
        If (FFF <= DDD And DDD < TTT) Then CompareDate = True
    Else
        If (FFF < DDD And DDD < TTT) Then CompareDate = True
    End If
    
End Function

Private Sub cmdQuery_Click()
    lvEObj.ListItems.Clear
    MakeDate
    If (BeginDate = "") Or (FinishDate = "") Then
        MsgBox "กรุณาใส่ช่วงเวลาให้ครบถ้วน", , "เลื่อนขั้นเงินเดือน"
        Exit Sub
    End If
    CheckDate
    If Not FromLessThanTo Then
        MsgBox "เวลาเริ่มต้นต้องน้อยกว่าเวลาสิ้นสุด", , "เลื่อนขั้นเงินเดือน"
        Exit Sub
    End If
    
    Dim obj As Object, PerCount As Integer, i As Integer, j As Integer
    Dim GovCount As Integer, boo1 As Boolean, boo2 As Boolean
    Dim Gov1 As Integer, Gov2 As Integer
    Set obj = cache.Static("Person.Per")
    PerCount = obj.TotalAmount("Per")
    Gov1 = 1
    Gov2 = 1
    boo1 = False
    boo2 = False
    For i = 1 To PerCount
        Set Per = cache.OpenId("Person.Per", i)
        GovCount = Per.RGovLevels.Count
        For j = 1 To GovCount
            boo1 = CompareDate(BeginDate, Per.RGovLevels.GetAt(j).FromDate, Per.RGovLevels.GetAt(j).ToDate, 1)
            If boo1 Then
                Gov1 = j
                j = GovCount
            End If
        Next j
        For j = 1 To GovCount
            boo2 = CompareDate(FinishDate, Per.RGovLevels.GetAt(j).FromDate, Per.RGovLevels.GetAt(j).ToDate, 2)
            If boo2 Then
                Gov2 = j
                j = GovCount
            End If
       Next j
        
        If boo1 And boo2 Then
            If Per.RGovLevels.GetAt(Gov1).GovLevel.GovLevel <> Per.RGovLevels.GetAt(Gov2).GovLevel.GovLevel Then
                MakeList Gov1, Gov2
            Else
                If Per.RGovLevels.GetAt(Gov1).GovLevel.SalStep <> Per.RGovLevels.GetAt(Gov2).GovLevel.SalStep Then
                    MakeList Gov1, Gov2
                End If
            End If
        End If
    Next i
    If lvEObj.ListItems.Count = 0 Then MsgBox "ไม่พบข้อมูล", , "เลื่อนขั้นเงินเดือน"
End Sub

Private Sub MakeList(Gov1 As Integer, Gov2 As Integer)
    Dim ehist As Object, item As ListItem, aa As Integer, st As String
    Set item = lvEObj.ListItems.Add
    item.Text = Per.PerID
    aa = Per.TFirstName.Count
    item.SubItems(1) = Per.TFirstName.GetAt(aa).TFirstName
    st = "ระดับ" + Str(Per.RGovLevels.GetAt(Gov1).GovLevel.GovLevel) + " ขั้น " + Str(Per.RGovLevels.GetAt(Gov1).GovLevel.SalStep)
    item.SubItems(2) = st
    st = "ระดับ" + Str(Per.RGovLevels.GetAt(Gov2).GovLevel.GovLevel) + " ขั้น " + Str(Per.RGovLevels.GetAt(Gov2).GovLevel.SalStep)
    item.SubItems(3) = st
    item.SubItems(4) = CDbl(Per.RGovLevels.GetAt(Gov2).GovLevel.SalRate) - CDbl(Per.RGovLevels.GetAt(Gov1).GovLevel.SalRate)
End Sub

Private Sub Image1_Click()
    frmMain.Show 0
    Unload Me
End Sub

Private Sub lvEObj_DblClick()
    If lvEObj.ListItems.Count <> 0 Then
        frmPerson.Show 0
        frmPerson.txtPerID.Text = lvEObj.SelectedItem.Text
    End If
End Sub


