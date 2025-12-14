VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{C37EFBE6-BC76-11D2-B65D-0000F87C2780}#1.0#0"; "CACHEQUERY.OCX"
Begin VB.Form frmCourse2 
   Caption         =   "หลักสูตร"
   ClientHeight    =   7935
   ClientLeft      =   1335
   ClientTop       =   480
   ClientWidth     =   9225
   LinkTopic       =   "Form1"
   ScaleHeight     =   7935
   ScaleWidth      =   9225
   Begin VB.CommandButton cmdSearchDpt 
      Caption         =   "ค้นหาข้อมูลคณะ/ภาควิชา/สาขาวิชา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   720
      TabIndex        =   27
      Top             =   2160
      Width           =   2175
   End
   Begin CACHEQUERYLib.CacheQuery CacheQuery1 
      Left            =   0
      Top             =   2400
      _Version        =   65536
      _ExtentX        =   847
      _ExtentY        =   847
      _StockProps     =   0
      ClassName       =   ""
      QueryName       =   ""
   End
   Begin VB.TextBox txtCourseStart 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7560
      TabIndex        =   26
      Top             =   240
      Width           =   1455
   End
   Begin VB.TextBox txtCourseBrn 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3720
      TabIndex        =   23
      Top             =   1800
      Width           =   2175
   End
   Begin VB.TextBox txtCourseDpt 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6840
      TabIndex        =   22
      Top             =   1800
      Width           =   2175
   End
   Begin VB.TextBox txtCourseFC 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   720
      TabIndex        =   21
      Top             =   1800
      Width           =   2175
   End
   Begin VB.CommandButton cmdSubInCourse 
      Caption         =   "รายละเอียดหลักสูตร"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   7200
      TabIndex        =   20
      Top             =   720
      Width           =   1815
   End
   Begin VB.CommandButton cmdExitCourse 
      Caption         =   "ออกจากหน้าจอ"
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
      Left            =   6960
      TabIndex        =   19
      Top             =   7080
      Width           =   1575
   End
   Begin VB.CommandButton cmdClearCourse 
      Caption         =   "ลบหน้าจอ"
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
      Left            =   5160
      TabIndex        =   18
      Top             =   7080
      Width           =   1575
   End
   Begin VB.CommandButton cmdDeleteCourse 
      Caption         =   "ลบหลักสูตร"
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
      Left            =   2640
      TabIndex        =   17
      Top             =   7080
      Width           =   1695
   End
   Begin VB.CommandButton cmdAddUpdateCourse 
      Caption         =   "เพิ่มหลักสูตร"
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
      Left            =   600
      TabIndex        =   16
      Top             =   7080
      Width           =   1815
   End
   Begin MSComctlLib.ListView lvCourse 
      Height          =   3735
      Left            =   1080
      TabIndex        =   15
      Top             =   3120
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   6588
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   0
   End
   Begin VB.TextBox txtCourseTotalYear 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5400
      TabIndex        =   14
      Top             =   1440
      Width           =   495
   End
   Begin VB.TextBox txtCourseTotalCrd 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3000
      TabIndex        =   13
      Top             =   1440
      Width           =   495
   End
   Begin VB.TextBox txtCourseNameE 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2280
      TabIndex        =   12
      Top             =   1080
      Width           =   3615
   End
   Begin VB.TextBox txtCourseName 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2280
      TabIndex        =   11
      Top             =   720
      Width           =   3615
   End
   Begin VB.TextBox txtCourseYear 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4320
      TabIndex        =   10
      Top             =   240
      Width           =   735
   End
   Begin VB.TextBox txtCourseCode 
      Height          =   315
      Left            =   1320
      TabIndex        =   9
      Top             =   240
      Width           =   1455
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "วันเริ่มใช้หลักสูตร"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   6000
      TabIndex        =   25
      Top             =   240
      Width           =   1380
   End
   Begin VB.Label Label11 
      AutoSize        =   -1  'True
      Caption         =   "รายชื่อหลักสูตร"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   3960
      TabIndex        =   24
      Top             =   2760
      Width           =   1380
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "สาขาวิชา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   6000
      TabIndex        =   8
      Top             =   1800
      Width           =   720
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "ภาควิชา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3000
      TabIndex        =   7
      Top             =   1800
      Width           =   630
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "คณะ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   6
      Top             =   1800
      Width           =   375
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "จำนวนปีในหลักสูตร"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3600
      TabIndex        =   5
      Top             =   1440
      Width           =   1560
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "หลักสูตรปี"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3240
      TabIndex        =   4
      Top             =   240
      Width           =   810
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "จำนวนหน่วยกิตทั้งหมดในหลักสูตร"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   120
      TabIndex        =   3
      Top             =   1440
      Width           =   2715
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "ชื่อหลักสูตรภาษาอังกฤษ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   2
      Top             =   1080
      Width           =   1965
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "ชื่อหลักสูตรภาษาไทย"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   360
      TabIndex        =   1
      Top             =   720
      Width           =   1740
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "รหัสหลักสูตร"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1020
   End
End
Attribute VB_Name = "frmCourse2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Dim Course As Object
Dim Status As Integer
Dim BranchHistory() As Object
Dim temp As Object
Dim CourseHistory() As Object
Dim idhistkey As String, idhist As Object
Dim item As ListItem, idcount As Integer
Dim Add As Boolean

Private Sub cmdSearchDpt_Click()
 actionFind "Branch"
End Sub

Private Sub actionFind(classname As String)
Dim id As Variant
   ' actionClose
    Set CacheQuery1.Factory = cache
    CacheQuery1.classname = classname
    CacheQuery1.QueryName = "BranchInfo"
    id = CacheQuery1.FindId
    If id = "" Then Exit Sub
  '  txtId = id
    Set temp = cache.OpenId(classname, id)
    
    If temp Is Nothing Then
        MsgBox "ไม่สามารถเปิดหลักสูตรได้"
    '    actionClose
    Else
        Set Course.CourseBrn = temp
        'EnableScreen True
        SyncObjectToScreen
        'm_modified = False
    End If
End Sub

Private Sub SyncObjectToScreen()
  '  txtSdCourse = temp.CourseName
  '  txtSdCourseYear.Text = temp.CourseTotalYear
    txtCourseBrn = temp.BrnName
    '& " " & Temp.CourseYear & " ปี"
    txtCourseFC = temp.BrnDpt.DptFc.FcName
    txtCourseDpt = temp.BrnDpt.DptName
 End Sub

Private Sub cmdSubInCourse_Click()
'    frmCourseDetail.txtCourseCode = txtCourseCode
'    frmCourseDetail.txtCourseName = txtCourseName

    frmCourseDetail.Show vbModal
    
End Sub

'Status 0=Search 1=Edit
Private Sub Form_Load()
    Status = 0
    ClearScreen
    loadlvcourse
    cmdDeleteCourse.Enabled = False
 '   txtCourseFC.Enabled = False
 '   txtCourseDpt.Enabled = False
 '   txtCourseBrn.Enabled = False
 '   txtCourseTotalCrd.Enabled = False
    Add = True
    loadlvcourse
End Sub

Private Sub lvCourse_DblClick()

   Dim itemselected  As Integer
   itemselected = lvCourse.SelectedItem.Index
   txtCourseCode = lvCourse.ListItems(itemselected).text
   loadCourse (txtCourseCode.text)
   txtCourseCode.SetFocus
   
End Sub

Private Sub loadlvcourse()
       
   lvCourse.View = lvwReport
   lvCourse.FullRowSelect = True
   lvCourse.ColumnHeaders.Clear
   lvCourse.ColumnHeaders.Add , , "รหัสหลักสูตร", 1300, lvwColumnLeft
   lvCourse.ColumnHeaders.Add , , "ชื่อหลักสูตรภาษาไทย", 2900, lvwColumnCenter
   lvCourse.ColumnHeaders.Add , , "ชื่อหลักสูตรภาษาอังกฤษ", 2900, lvwColumnCenter
   lvCourse.ListItems.Clear
   
   lvCourse.ListItems.Clear
        Erase CourseHistory
        idcount = 0
       
      
      Dim rs As CacheObject.resultset
        Set rs = cache.resultset("Course", "ByCourse")
        rs.Execute
        While rs.Next
            Set item = lvCourse.ListItems.Add
            'Set CourseHistory(idcount) = rs.GetData(1)
            item.text = rs.GetData(1)
            item.SubItems(1) = rs.GetData(2)
            item.SubItems(2) = rs.GetData(3)
            'idcount = idcount + 1
            
            'ReDim Preserve CourseHistory(idcount)
            
        Wend
   
   
End Sub



Private Sub LoadlvBrn()

   lvBranch.View = lvwReport
   lvBranch.FullRowSelect = True
   lvBranch.ColumnHeaders.Clear
   lvBranch.ColumnHeaders.Add , , "คณะ", 1300, lvwColumnLeft
   lvBranch.ColumnHeaders.Add , , "ภาควิชา", 1900, lvwColumnCenter
   lvBranch.ColumnHeaders.Add , , "สาขาวิชา", 1900, lvwColumnCenter
   lvBranch.ListItems.Clear

    'load history and plan of lvCourseCode
        lvBranch.ListItems.Clear
        Erase BranchHistory
        idcount = 0
       
      
      Dim rs As CacheObject.resultset
        Set rs = cache.resultset("Branch", "ByBranch")
        rs.Execute
        While rs.Next
            Set item = lvBranch.ListItems.Add
            Set BranchHistory(idcount) = rs.GetData(1)
            item.text = rs.GetData(2)
            item.SubItems(1) = rs.GetData(3)
            item.SubItems(2) = rs.GetData(4)
            idcount = idcount + 1
            
            ReDim Preserve BranchHistory(idcount)
            
        Wend
        
End Sub

Private Sub txtCourseCode_LostFocus()
    ' user keys in CourseCode
    If txtCourseCode = "" Then
        If Not (Course Is Nothing) Then Course.sys_close
        Set Course = cache.New("Course")
        ClearScreen
        Exit Sub
    Else
    If Add Then
            loadCourse (txtCourseCode.text)
        End If
    End If
    
End Sub

Private Sub cmdClearCourse_Click()
    ClearObjects
    InitObjects
    ClearScreen
    txtCourseCode.SetFocus
    Status = 0
End Sub

Private Sub ClearScreen()
    txtCourseCode = ""
    txtCourseName = ""
    txtCourseNameE = ""
    txtCourseTotalCrd = ""
    txtCourseYear = ""
    txtCourseTotalYear = ""
    txtCourseFC.text = ""
    txtCourseDpt.text = ""
    txtCourseBrn.text = ""
    Add = True
    cmdAddUpdateCourse.Caption = "เพิ่มหลักสูตร"
End Sub

Private Sub ClearObjects()
    If Not Course Is Nothing Then
        Course.sys_close
        Set Course = Nothing
    End If
    
      If Not temp Is Nothing Then
        temp.sys_close
        Set temp = Nothing
    End If
End Sub

Private Sub InitObjects()
    Set Course = cache.New("Course")
End Sub


Private Sub cmdExitCourse_Click()
    Unload frmCourse
End Sub

Private Sub loadCourse(SubCode As String)
    On Error GoTo objerr
    Dim pers As Object
    Dim id As Long
    ClearObjects
    'Find Oid
    Dim rs As CacheObject.resultset
      '  Set rs = cache.ResultSet("Course", "ReturnCourseCodeId")
     '   rs.Execute (SubCode)
     '   While rs.Next
     '        id = rs.GetData(1)
     '   Wend
   ' txtCourseCode = id
    Set pers = cache.Static("Course")
    id = pers.FindOID(SubCode)
    If id <> 0 Then
        Set Course = cache.OpenId("Course", id)
        ClearScreen
        txtCourseCode = SubCode
        txtCourseCode.SelStart = Len(id) + 1
        txtCourseName = Course.CourseName
        txtCourseNameE = Course.CourseNameE
        txtCourseTotalCrd = Course.CourseTotalCrd
        txtCourseTotalYear = Course.CourseTotalYear
        txtCourseYear = Course.CourseYear
        txtCourseStart = Format(Course.CourseStart, "mm/dd/yyyy")
        If Not (Course.CourseBrn Is Nothing) Then
        txtCourseBrn = Course.CourseBrn.BrnName
        txtCourseFC = Course.CourseBrn.BrnDpt.DptFc.FcName
        txtCourseDpt = Course.CourseBrn.BrnDpt.DptName
       End If
        
        'Check SjFac
        'If Not Course.SjFac Is Nothing Then
         '   cboSjFac = Course.SjFac.FcName
        'End If
        
        cmdAddUpdateCourse.Caption = "แก้ไขหลักสูตร"
        cmdDeleteCourse.Enabled = True
        Status = 1
        Add = False
     
     Else
          If Not (Course Is Nothing) Then Course.sys_close
         Set Course = cache.New("Course")
         
       End If

    Exit Sub
objerr:
    VBErrorBox "LoadCourse failed"
    ClearScreen
End Sub

Private Sub cmdDeleteCourse_Click()
    Dim sc As String
    On Error GoTo DeleteError
    Dim pers As Object
  '  Set pers = cache.Static("Course")
  '  id = pers.FindOId("CourseCore")
   ' loadCourse (txtCourseCode.Text)
    If MsgBox("Do you want to delete Course ?", vbYesNo, "Confirm Delete") = vbYes Then
        sc = Course.sys_Delete(Course.sys_Oid())
        On Error GoTo 0
        ClearObjects
        InitObjects
        ClearScreen
        loadlvcourse
    End If
    Exit Sub
DeleteError:
    MsgBox "Delete failed : " & Err.Description
End Sub



Private Sub cmdAddUpdateCourse_Click()
    Dim pers As Object
    Dim id As Long
    Dim temp As Object
    Dim message As String
     
    If txtCourseCode.text = "" Then
        MsgBox "CourseCode is a required field", , "Add New Record"
        txtCourseCode.SetFocus
        Exit Sub
    End If
  '  If Add Then
      '  Set Course = cache.New("Course")
   ' End If
    Course.CourseCode = txtCourseCode.text
    Course.CourseName = txtCourseName.text
    Course.CourseNameE = txtCourseNameE.text
    Course.CourseTotalYear = txtCourseTotalYear.text
    Course.CourseYear = txtCourseYear.text
    
    'check cboSjFac
    'id = cboSjFac.ListIndex
    'If id <> -1 Then
    '    id = cboSjFac.ItemData(id)
    '    Set Temp = cache.OpenId("Faculty", id)
    '    Course.SjFac = Temp
    'End If
   '  Else
     ' Update case
    ' End If
    ' Save (Add or Update)
    On Error GoTo SaveError
    Course.sys_save
    On Error GoTo 0
    
   
    Add = False
    Status = 0
    ClearScreen
    ClearObjects
    InitObjects
    txtCourseCode.SetFocus
    loadlvcourse
    
    Exit Sub
SaveError:
    MsgBox "Save failed : " & Err.Description

End Sub



