VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmCourseDetail 
   Caption         =   "ฟอร์มรายละเอียดหลักสูตร"
   ClientHeight    =   7845
   ClientLeft      =   1245
   ClientTop       =   555
   ClientWidth     =   10185
   LinkTopic       =   "Form1"
   ScaleHeight     =   0
   ScaleWidth      =   0
   Begin VB.CommandButton cmdClear 
      Caption         =   "ล้างหน้าจอ"
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
      Left            =   5640
      TabIndex        =   25
      Top             =   6960
      Width           =   1815
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
      Height          =   375
      Left            =   9240
      MaxLength       =   4
      TabIndex        =   23
      Top             =   120
      Width           =   735
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "ปิดหน้าต่าง"
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
      Left            =   7560
      TabIndex        =   21
      Top             =   6960
      Width           =   1815
   End
   Begin VB.Frame Frame1 
      Height          =   1935
      Left            =   120
      TabIndex        =   7
      Top             =   480
      Width           =   9975
      Begin VB.CommandButton cmdSearchSj 
         Caption         =   "ค้นหาวิชา"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3480
         TabIndex        =   24
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtSjTerm 
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
         Left            =   9000
         TabIndex        =   20
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox txtSjYear 
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
         Left            =   7080
         MaxLength       =   4
         TabIndex        =   19
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox txtSjNameE 
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
         Left            =   1800
         TabIndex        =   16
         Top             =   1320
         Width           =   4215
      End
      Begin VB.ComboBox cboSjType 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   7560
         TabIndex        =   13
         Top             =   840
         Width           =   1815
      End
      Begin VB.TextBox txtSjName 
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
         Left            =   1800
         TabIndex        =   12
         Top             =   840
         Width           =   4215
      End
      Begin VB.TextBox txtSjCode 
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
         Left            =   1800
         TabIndex        =   11
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "วิชาของเทอม"
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
         Left            =   7800
         TabIndex        =   18
         Top             =   1320
         Width           =   1065
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "วิชาของปี"
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
         Left            =   6240
         TabIndex        =   17
         Top             =   1320
         Width           =   750
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อวิชาภาษาอังกฤษ"
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
         TabIndex        =   15
         Top             =   1320
         Width           =   1575
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "ชนิดของวิชา"
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
         Left            =   6240
         TabIndex        =   14
         Top             =   840
         Width           =   990
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อวิชาภาษาไทย"
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
         TabIndex        =   10
         Top             =   840
         Width           =   1350
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "รหัสวิชา"
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
         Left            =   1080
         TabIndex        =   9
         Top             =   360
         Width           =   630
      End
   End
   Begin VB.TextBox txtCourseCode 
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
      Left            =   1440
      TabIndex        =   3
      Top             =   120
      Width           =   1215
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
      Left            =   4680
      TabIndex        =   2
      Top             =   120
      Width           =   3495
   End
   Begin VB.CommandButton cmdDeleteSj 
      Caption         =   "ลบวิชา"
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
      Left            =   2760
      TabIndex        =   1
      Top             =   6960
      Width           =   1815
   End
   Begin VB.CommandButton cmdAddSj 
      Caption         =   "เพิ่มวิชา"
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
      Left            =   840
      TabIndex        =   0
      Top             =   6960
      Width           =   1815
   End
   Begin MSComctlLib.ListView lvCourse 
      Height          =   3735
      Left            =   960
      TabIndex        =   8
      Top             =   3000
      Width           =   8415
      _ExtentX        =   14843
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
   Begin VB.Label Label4 
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
      Left            =   8280
      TabIndex        =   22
      Top             =   120
      Width           =   810
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "วิชาในหลักสูตร"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   3960
      TabIndex        =   6
      Top             =   2640
      Width           =   2295
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
      Left            =   360
      TabIndex        =   5
      Top             =   120
      Width           =   1020
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
      Left            =   2760
      TabIndex        =   4
      Top             =   120
      Width           =   1740
   End
End
Attribute VB_Name = "frmCourseDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim item As ListItem
Dim Sj As Object
Dim SubInCourse As Object
Dim CourseHistory() As Object
Dim idcount As Integer
Dim pers As Object
Dim id As Long



Private Sub cmdAddSj_Click()
    Dim id As Long
    Dim temp As Object
    If txtSjCode <> "" Then
        Set SubInCourse = cache.New("SubjectInCourse")
        SubInCourse.CourseCode = txtCourseCode.text
        Set pers = cache.Static("Subject")
        id = pers.ReturnSjCodeId(txtSjCode.text)
        Set temp = cache.OpenId("Subject", id)
        SubInCourse.SjCode = temp
        'Course.CourseTotalCrd = Course.CourseTotalCrd + temp.SjCrd
        If cboSjType.text <> "" Then
           SubInCourse.SjType = SubInCourse.SjTypeDisplayToLogical(cboSjType.text)
        End If
        SubInCourse.SjYear = txtSjYear.text
        SubInCourse.SjTerm = txtSjTerm.text
        SubInCourse.SjDateAdd = Format(Now, "mm/dd/yyyy")
        
       ' MsgBox SubInCourse.CourseCode
       ' MsgBox SubInCourse.SjCode.ReturnSjCode(Sj.sys_Id)
        
         On Error GoTo SaveError
         'Course.sys_save
         'frmCourse.txtCourseTotalCrd = Course.CourseTotalYear
        SubInCourse.sys_Save
        CountCredit
        On Error GoTo 0
    Else
        MsgBox "ยังไม่ได้ใส่รหัสวิชา", vbOKOnly
    End If
    ClearScreen
    ClearObjects
    loadlvcourse
    
    'Status = 0
    'ClearScreen
    'ClearObjects
    'InitObjects
    'txtSjCode.SetFocus
    
    Exit Sub
SaveError:
    MsgBox "Save failed : " & Err.Description
End Sub

Private Sub ClearScreen()
    txtSjCode = ""
    txtSjName = ""
    txtSjNameE = ""
    txtSjYear = ""
    txtSjTerm = ""
    cboSjType.text = ""
End Sub

Private Sub ClearObjects()
    If Not SubInCourse Is Nothing Then
        SubInCourse.sys_close
        Set SubInCourse = Nothing
    End If
    
      If Not Sj Is Nothing Then
        Sj.sys_close
        Set Sj = Nothing
    End If
End Sub

Private Sub cmdClear_Click()
    ClearObjects
    ClearScreen
    cmdAddSj.Enabled = True
   
End Sub

Private Sub cmdClose_Click()
  Unload frmCourseDetail
End Sub

Private Sub cmdDeleteSj_Click()
    Dim sc As String
    On Error GoTo DeleteError
    Dim pers As Object
  '  Set pers = cache.Static("Course")
  '  id = pers.FindOId("CourseCore")
   ' loadCourse (txtCourseCode.Text)
   'MsgBox SubInCourse.SjCode.ReturnSjCode(Sj.sys_Id)
    If MsgBox("Do you want to delete Course ?", vbYesNo, "Confirm Delete") = vbYes Then
        sc = SubInCourse.sys_Delete(SubInCourse.sys_Oid())
        CountCredit
        cmdAddSj.Enabled = True
        On Error GoTo 0
        ClearObjects
        ClearScreen
        loadlvcourse
    End If
    Exit Sub
DeleteError:
    MsgBox "Delete failed : " & Err.Description
End Sub



Private Sub lvCourse_DblClick()
   Dim tempSjCode As String
   Dim itemselected  As Integer
   itemselected = lvCourse.SelectedItem.Index
   tempSjCode = lvCourse.ListItems(itemselected).text
   Dim length As Integer
   length = Len(tempSjCode)
   Dim x As String
   x = Right(tempSjCode, 1)
   If x = "*" Then
        tempSjCode = Left(tempSjCode, length - 1)
   End If
      txtSjCode = tempSjCode

   'MsgBox tempSjCode
 '=====

  
 '===
  
   Dim rs As CacheObject.resultset
   Set rs = cache.resultset("SubjectInCourse", "CourseId")
   rs.Execute (txtCourseCode.text)
        
   While rs.Next
        
           Dim temp As String
           
           
             id = rs.GetData(1)
            Set SubInCourse = cache.OpenId("SubjectInCourse", id)
            Set Sj = SubInCourse.SjCode
            If Not Sj Is Nothing Then
            '===============
                temp = Sj.ReturnSjCodeAt2(SubInCourse.sys_Id, Sj.sys_Id)
             
               'a = Sj.ReturnSjCodeAt2(SubInCourse.sys_Id, Sj.sys_Id)
            '    If (temp <> tempSjCode) Then
                    If tempSjCode = temp Then
                       txtSjName = Sj.ReturnSjNameAt2(SubInCourse.sys_Id, Sj.sys_Id)
                       txtSjNameE = Sj.ReturnSjNameEAt2(SubInCourse.sys_Id, Sj.sys_Id)
                      cboSjType.text = SubInCourse.SjTypeLogicalToDisplay(SubInCourse.SjType)
                      txtSjYear = SubInCourse.SjYear
                      txtSjTerm = SubInCourse.SjTerm
                      cmdAddSj.Enabled = False
                      id = SubInCourse.sys_Id
                      Set SubInCourse = cache.OpenId("SubjectInCourse", id)
                   Exit Sub
                End If
             ' End If
                 
   '===== old code
'                 If tempSjCode = temp Then
'                    txtSjName = Sj.ReturnSjName(Sj.sys_Id)
'                    txtSjNameE = Sj.ReturnSjNameE(Sj.sys_Id)
'                    cboSjType.text = SubInCourse.SjTypeLogicalToDisplay(SubInCourse.SjType)
'                    txtSjYear = SubInCourse.SjYear
'                    txtSjTerm = SubInCourse.SjTerm
'                    cmdAddSj.Enabled = False
'                    id = SubInCourse.sys_Id
'                    Set SubInCourse = cache.OpenId("SubjectInCourse", id)
'                    Exit Sub
'                End If
        '======= end oldcode
           End If
            
        Wend
    
   
End Sub

Private Sub CountCredit()
        Dim count As Integer
        Dim rs As CacheObject.resultset
        Set rs = cache.resultset("SubjectInCourse", "CourseId")
        rs.Execute (txtCourseCode.text)
        count = 0
        Dim temp As Object
        While rs.Next
             id = rs.GetData(1)
            Set temp = cache.OpenId("SubjectInCourse", id)
            count = count + temp.SjCode.SjCrd
    
        Wend
        
        course.CourseTotalCrd = count
        course.sys_Save
        frmCourse.txtCourseTotalCrd = count
End Sub

Private Sub cmdSearchSj_Click()
   frmInputCourseSubject.Show vbModal
End Sub

Private Sub Form_Load()
    
    txtCourseCode.text = course.CourseCode
    txtCourseName.text = course.CourseName
    txtCourseYear.text = course.CourseYear
  '  txtSjCode.Enabled = False
  '  txtSjName.Enabled = False
  '  txtSjNameE.Enabled = False
   ' txtCourseYear.Enabled = False
'  txtCourseCode.text = frmCourse.txtCourseCode.text
  ' txtCourseCode.text = Course.CourseName
    
   
    
    LoadCombo
    loadlvcourse
    
    
    
End Sub

Private Sub loadlvcourse()
    lvCourse.View = lvwReport
   lvCourse.FullRowSelect = True
   lvCourse.ColumnHeaders.Clear
   lvCourse.ColumnHeaders.Add , , "รหัสวิชา", 1500, lvwColumnLeft
   lvCourse.ColumnHeaders.Add , , "ชื่อวิชาภาษาไทย", 2500, lvwColumnLeft
   lvCourse.ColumnHeaders.Add , , "ประเภทวิชา", 1800, lvwColumnLeft
   lvCourse.ColumnHeaders.Add , , "ปี", 800, lvwColumnLeft
   lvCourse.ColumnHeaders.Add , , "เทอม", 800, lvwColumnLeft
   lvCourse.ColumnHeaders.Add , , "หน่วยกิต", 900, lvwColumnCenter
   
    lvCourse.ListItems.Clear
   
        Erase CourseHistory
        idcount = 0
      Dim a As String
            
      Dim rs As CacheObject.resultset
       
        Set rs = cache.resultset("SubjectInCourse", "CourseId")
        rs.Execute (txtCourseCode.text)
        
        While rs.Next
        
            Set item = lvCourse.ListItems.Add
           
           
             id = rs.GetData(1)
            Set SubInCourse = cache.OpenId("SubjectInCourse", id)
            Set Sj = SubInCourse.SjCode
            If Not Sj Is Nothing Then
                'item.text = Sj.ReturnSjCode(Sj.sys_Id)
                a = Sj.ReturnSjCodeAt2(SubInCourse.sys_Id, Sj.sys_Id)
                If (a <> Sj.SjCode.GetAt(Sj.SjCode.count()).val) Then
                item.text = a + "*"
              Else
                item.text = a
               End If
                
                'oldsjcode = pers.ReturnSjCodeAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
                
                
                a = Sj.ReturnSjNameAt2(SubInCourse.sys_Id, Sj.sys_Id)
                If (a <> Sj.SjName.GetAt(Sj.SjName.count()).val) Then
                item.SubItems(1) = a + "*"
              Else
                item.SubItems(1) = a
               End If
                'item.SubItems(1) = a
                
                item.SubItems(2) = SubInCourse.SjTypeLogicalToDisplay(SubInCourse.SjType)
                item.SubItems(3) = SubInCourse.SjYear
                item.SubItems(4) = SubInCourse.SjTerm
                item.SubItems(5) = Sj.SjCrd
           End If
            
        Wend
   
   
End Sub



Private Sub LoadCombo()
    Dim sjs, fcs As Object
    Dim displays As String, delimd As String, elems() As String
    Dim i As Integer
    Dim GiveId As Long
    Set sjs = cache.Static("SubjectInCourse")
    
    displays = sjs.SjTypeDISPLAYLIST
    delimd = Left(displays, 1)
    elems = Split(displays, delimd)
    cboSjType.Clear
    For i = 1 To UBound(elems)
        cboSjType.AddItem elems(i)
    Next i
End Sub





