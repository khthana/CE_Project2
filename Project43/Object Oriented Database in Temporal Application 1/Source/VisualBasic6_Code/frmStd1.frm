VERSION 5.00
Object = "{C37EFBE6-BC76-11D2-B65D-0000F87C2780}#1.0#0"; "CACHEQUERY.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmStudent 
   Caption         =   "ข้อมูลประวัตินักศึกษา"
   ClientHeight    =   7785
   ClientLeft      =   975
   ClientTop       =   510
   ClientWidth     =   10080
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   7785
   ScaleWidth      =   10080
   Begin CACHEQUERYLib.CacheQuery CacheQuery1 
      Left            =   4800
      Top             =   6000
      _Version        =   65536
      _ExtentX        =   847
      _ExtentY        =   847
      _StockProps     =   0
      ClassName       =   ""
      QueryName       =   ""
   End
   Begin VB.CommandButton cmdExit 
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
      Height          =   495
      Left            =   7680
      TabIndex        =   44
      Top             =   7080
      Width           =   1935
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "ลบข้อมูลนักศึกษา"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5400
      TabIndex        =   43
      Top             =   7080
      Width           =   2055
   End
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
      Height          =   495
      Left            =   2640
      TabIndex        =   42
      Top             =   7080
      Width           =   1815
   End
   Begin VB.CommandButton cmdAddUpdate 
      Caption         =   "เพิ่ม/แก้ไข ประวัติ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   360
      TabIndex        =   41
      Top             =   7080
      Width           =   1935
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   240
      TabIndex        =   33
      Top             =   4800
      Width           =   9495
      Begin VB.TextBox txtSdCourseYear 
         Height          =   375
         Left            =   3600
         TabIndex        =   54
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox txtSdBrn 
         Height          =   375
         Left            =   960
         TabIndex        =   53
         Top             =   960
         Width           =   2655
      End
      Begin VB.TextBox txtSdDpt 
         Height          =   375
         Left            =   960
         TabIndex        =   52
         Top             =   600
         Width           =   2655
      End
      Begin VB.TextBox txtSdFc 
         Height          =   375
         Left            =   960
         TabIndex        =   51
         Top             =   240
         Width           =   2655
      End
      Begin VB.CommandButton cmdCourse 
         Caption         =   "ค้นหาข้อมูล"
         Height          =   495
         Left            =   3720
         TabIndex        =   50
         Top             =   240
         Width           =   1335
      End
      Begin VB.TextBox txtSdCourse 
         Height          =   375
         Left            =   960
         TabIndex        =   49
         Top             =   1320
         Width           =   2655
      End
      Begin MSComCtl2.DTPicker dtpSdInDt 
         Height          =   375
         Left            =   7080
         TabIndex        =   47
         Top             =   600
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   24510464
         CurrentDate     =   36961
      End
      Begin MSComCtl2.DTPicker dtpSdOutDt 
         Height          =   375
         Left            =   7080
         TabIndex        =   45
         Top             =   960
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   24510464
         CurrentDate     =   2958465
      End
      Begin VB.ComboBox cmbSdSts 
         Height          =   360
         Left            =   7080
         TabIndex        =   40
         Top             =   240
         Width           =   2175
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         Caption         =   "ปี"
         Height          =   240
         Left            =   4080
         TabIndex        =   55
         Top             =   1440
         Width           =   120
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         Caption         =   "หลักสูตร"
         Height          =   240
         Left            =   120
         TabIndex        =   48
         Top             =   1320
         Width           =   690
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         Caption         =   "สถานะภาพ"
         Height          =   240
         Left            =   6120
         TabIndex        =   39
         Top             =   240
         Width           =   885
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         Caption         =   "วันที่สำเร็จการศึกษา"
         Height          =   240
         Left            =   5400
         TabIndex        =   38
         Top             =   960
         Width           =   1605
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         Caption         =   "วันที่เข้ารับการศึกษา"
         Height          =   240
         Left            =   5400
         TabIndex        =   37
         Top             =   600
         Width           =   1605
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         Caption         =   "สาขาวิชา"
         Height          =   240
         Left            =   120
         TabIndex        =   36
         Top             =   960
         Width           =   720
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         Caption         =   "ภาควิชา"
         Height          =   240
         Left            =   240
         TabIndex        =   35
         Top             =   600
         Width           =   630
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         Caption         =   "คณะ"
         Height          =   240
         Left            =   360
         TabIndex        =   34
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3015
      Left            =   240
      TabIndex        =   11
      Top             =   1800
      Width           =   9495
      Begin MSComCtl2.DTPicker dtpSdBirth 
         Height          =   375
         Left            =   3000
         TabIndex        =   46
         Top             =   240
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   24510464
         CurrentDate     =   36961
      End
      Begin VB.TextBox txtSdDegree 
         Height          =   375
         Left            =   6000
         TabIndex        =   30
         Top             =   2400
         Width           =   2415
      End
      Begin VB.TextBox txtSdOcllg 
         Height          =   375
         Left            =   1440
         TabIndex        =   29
         Top             =   2400
         Width           =   3255
      End
      Begin VB.TextBox txtSdMName 
         Height          =   315
         Left            =   6000
         TabIndex        =   26
         Top             =   720
         Width           =   3255
      End
      Begin VB.TextBox txtSdFName 
         Height          =   315
         Left            =   1440
         TabIndex        =   25
         Top             =   720
         Width           =   3255
      End
      Begin VB.TextBox txtSdTel 
         Height          =   315
         Left            =   7560
         TabIndex        =   24
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtSdAge 
         Height          =   315
         Left            =   5640
         TabIndex        =   22
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtSdOAddr 
         Height          =   1215
         Left            =   6000
         MaxLength       =   100
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         Top             =   1080
         Width           =   3255
      End
      Begin VB.TextBox txtSdAddr 
         Height          =   1215
         Left            =   1440
         MaxLength       =   100
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         Top             =   1080
         Width           =   3255
      End
      Begin VB.ComboBox cmbSdSex 
         Height          =   360
         Left            =   1440
         TabIndex        =   15
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         Caption         =   "วุฒิการศึกษา"
         Height          =   240
         Left            =   4800
         TabIndex        =   32
         Top             =   2400
         Width           =   1035
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         Caption         =   "สถานศึกษาเดิม"
         Height          =   240
         Left            =   120
         TabIndex        =   31
         Top             =   2400
         Width           =   1230
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อมารดา"
         Height          =   240
         Left            =   5040
         TabIndex        =   28
         Top             =   720
         Width           =   750
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อบิดา"
         Height          =   240
         Left            =   720
         TabIndex        =   27
         Top             =   720
         Width           =   570
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "เบอร์โทรศัพท์ "
         Height          =   240
         Left            =   6360
         TabIndex        =   23
         Top             =   240
         Width           =   1155
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "อายุ"
         Height          =   240
         Left            =   5280
         TabIndex        =   21
         Top             =   240
         Width           =   330
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "ที่อยู่เก่า"
         Height          =   240
         Left            =   5160
         TabIndex        =   20
         Top             =   1080
         Width           =   645
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "ที่อยู่ปัจจุบัน"
         Height          =   240
         Left            =   240
         TabIndex        =   17
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "วันเกิด"
         Height          =   240
         Left            =   2400
         TabIndex        =   16
         Top             =   240
         Width           =   510
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "เพศ"
         Height          =   240
         Left            =   840
         TabIndex        =   14
         Top             =   240
         Width           =   315
      End
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   8655
      Begin VB.ComboBox cmbSdPrefE 
         Height          =   360
         Left            =   2040
         TabIndex        =   13
         Top             =   1080
         Width           =   1095
      End
      Begin VB.ComboBox cmbSdPref 
         Height          =   360
         Left            =   2040
         TabIndex        =   12
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox txtSdSurnameE 
         Height          =   315
         Left            =   6240
         TabIndex        =   9
         Top             =   1080
         Width           =   2175
      End
      Begin VB.TextBox txtSdNameE 
         Height          =   315
         Left            =   3240
         TabIndex        =   8
         Top             =   1080
         Width           =   2415
      End
      Begin VB.TextBox txtSdSurname 
         Height          =   315
         Left            =   6240
         TabIndex        =   5
         Top             =   720
         Width           =   2175
      End
      Begin VB.TextBox txtSdName 
         Height          =   315
         Left            =   3240
         TabIndex        =   4
         Top             =   720
         Width           =   2415
      End
      Begin VB.TextBox txtSdId 
         Height          =   315
         Left            =   2040
         MaxLength       =   8
         TabIndex        =   1
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "สกุล"
         Height          =   240
         Left            =   5760
         TabIndex        =   10
         Top             =   1080
         Width           =   360
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "สุกล"
         Height          =   240
         Left            =   5760
         TabIndex        =   7
         Top             =   720
         Width           =   360
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อ-สกุล ภาษาอังกฤษ"
         Height          =   240
         Left            =   120
         TabIndex        =   6
         Top             =   1080
         Width           =   1770
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อ-สกุล ภาษาไทย"
         Height          =   240
         Left            =   360
         TabIndex        =   3
         Top             =   720
         Width           =   1545
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "รหัสนักศึกษา"
         Height          =   240
         Left            =   840
         TabIndex        =   2
         Top             =   240
         Width           =   1050
      End
   End
End
Attribute VB_Name = "frmStudent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Add As Boolean
Dim oldSdId As String
Private temp As Object

Private Sub Form_Load()
 'ConnectObjects "Student"
 'ClearScreen
 LoadCombo ' load the sex combobox
 dtpSdInDt.Value = "1/1/2540"
 Add = True
  
 End Sub
 
Private Sub LoadCombo()
    Dim stds As Object
    Dim displays As String, delimd As String, elems() As String
    Dim i As Integer
    
    Set stds = cache.Static("Student")
    displays = stds.sexDISPLAYLIST
    delimd = Left(displays, 1)
    elems = Split(displays, delimd)
    cmbSdSex.Clear
        For i = 1 To UBound(elems)
    cmbSdSex.AddItem elems(i)
    Next i
    
    displays = stds.PrefDISPLAYLIST
    delimd = Left(displays, 1)
    elems = Split(displays, delimd)
    cmbSdPref.Clear
    For i = 1 To UBound(elems)
        cmbSdPref.AddItem elems(i)
    Next i
    
    displays = stds.PrefEDISPLAYLIST
    delimd = Left(displays, 1)
    elems = Split(displays, delimd)
    cmbSdPrefE.Clear
    For i = 1 To UBound(elems)
        cmbSdPrefE.AddItem elems(i)
    Next i
    
    displays = stds.StsDISPLAYLIST
    delimd = Left(displays, 1)
    elems = Split(displays, delimd)
    cmbSdSts.Clear
    For i = 1 To UBound(elems)
        cmbSdSts.AddItem elems(i)
    Next i
   

End Sub


Private Sub txtSdId_LostFocus()
 
  If txtSdId.text = "" Then
      If Not (Student Is Nothing) Then Student.sys_close
      Set Student = cache.New("Student")
      ClearScreen
      Exit Sub
  Else
  If Add Then
     LoadStudent (txtSdId.text)
  End If
 End If
' LoadStudent (txtSdId.Text)
 End Sub

Private Sub LoadStudent(StudentID As String)
    Dim Std As Object
    Dim id As Integer
    On Error GoTo objerr
    
    ClearObjects
     'Find Oid
    Set Std = cache.Static("Student")
    id = Std.FindOID(StudentID)
    If id <> 0 Then
        Set Student = cache.OpenId("Student", id)
        ClearScreen
        txtSdId = Student.SdId.GetAt(Student.SdId.count()).val
        oldSdId = txtSdId
        If (Student.SdName.count() > 0) Then
          txtSdName = Student.SdName.GetAt(Student.SdName.count()).val
        End If
   
        If (Student.Sdsurname.count() > 0) Then
          txtSdSurname = Student.Sdsurname.GetAt(Student.Sdsurname.count()).val
        End If
   
        If (Student.SdNameE.count() > 0) Then
          txtSdNameE = Student.SdNameE.GetAt(Student.SdNameE.count()).val
        End If
    
       If (Student.SdSurNameE.count() > 0) Then
          txtSdSurNameE = Student.SdSurNameE.GetAt(Student.SdSurNameE.count()).val
       End If
    
       
       
        cmbSdSex = Student.SdSexLogicalToDisplay(Student.SdSex)
        cmbSdPref = Student.SdPrefLogicalToDisplay(Student.SdPref)
        cmbSdPrefE = Student.SdPrefELogicalToDisplay(Student.SdPrefE)
        cmbSdSts = Student.SdStsLogicalToDisplay(Student.SdSts)
    
        txtSdAddr = Student.SdAddr
        txtSdTel = Student.SdTel
        txtSdOAddr = Student.SdOAddr
        txtSdMName = Student.SdMName
        txtSdFName = Student.SdFName
        txtSdOcllg = Student.SdOcllg
         txtSdDegree = Student.SdDegree
        dtpSdBirth = Student.SdBirth
        txtSdAge = Student.SdAge
        dtpSdInDt = Student.SdInDt
        dtpSdOutDt = Student.SdOutDt
        If Not (Student.course Is Nothing) Then
              txtSdfc.text = Student.course.CourseBrn.BrnDpt.DptFc.FcName
              txtSdDpt.text = Student.course.CourseBrn.BrnDpt.DptName
              txtSdBrn.text = Student.course.CourseBrn.BrnName
            'dim msg
              Dim msg As String
            msg = Student.course.CourseName
            Dim year As Integer
            year = Student.course.CourseYear
            msg = msg + " ปี " + CStr(year)
              txtSdCourse.text = msg
              txtSdCourseYear.text = Student.course.CourseTotalYear
              
      End If
       
'        txtTest.Text = Student.Test
         cmdAddUpdate.Caption = "แก้ไขประวัติ"
         cmdDelete.Enabled = True
         Add = False
       Else
          If Not (Student Is Nothing) Then Student.sys_close
         Set Student = cache.New("Student")
       End If
    Exit Sub
objerr:
    VBErrorBox "โหลดข้อมูลนักศึกษา ล้มเหลว"
    ClearScreen
End Sub


Private Sub dtpSdBirth_LostFocus()
     If dtpSdBirth.Value = Now Then
        txtSdAge = ""
        Exit Sub
    End If
    On Error GoTo doberror
    Student.SdBirth = dtpSdBirth.Value
    txtSdAge = Student.SdAge
    Exit Sub
doberror:
    VBErrorBox "ใส่วันเกิดผิด"
    dtpSdBirth.SetFocus
End Sub

Private Sub txtSdAge_GotFocus()
    dtpSdBirth.SetFocus
End Sub


Private Sub ClearObjects()
    If Not Student Is Nothing Then
        Student.sys_close
        Set Student = Nothing
    End If
    If Not temp Is Nothing Then
        temp.sys_close
        Set temp = Nothing
    End If
   
   ' Erase SdIdHistory
End Sub

Private Sub ClearScreen()
    txtSdId = ""
    txtSdName = ""
    txtSdNameE = ""
    txtSdSurname = ""
    txtSdSurNameE = ""
    
    cmbSdSex.ListIndex = 0
    cmbSdPref.ListIndex = 0
    cmbSdPrefE.ListIndex = 0
    cmbSdSts.ListIndex = 0

        
    txtSdAddr = ""
    txtSdTel = ""
    txtSdOAddr = ""
    txtSdMName = ""
    txtSdFName = ""
    txtSdOcllg = ""
    txtSdDegree = ""
    txtSdAge = ""
    
    txtSdfc = ""
    txtSdDpt = ""
    txtSdBrn = ""
    txtSdCourse = ""
    txtSdCourseYear = ""
    
    
    dtpSdInDt.Value = "1/1/2540"
    dtpSdOutDt.Value = "12/31/10542"
    cmdAddUpdate.Caption = "เพิ่มประวัติ"
    cmdDelete.Enabled = False

End Sub

Private Sub InitObjects()
    Set Student = cache.New("Student")
   End Sub


Private Sub cmdClear_Click()
     ClearObjects
     InitObjects
     ClearScreen
     txtSdId.SetFocus
     Add = True
End Sub

Private Sub cmdAddUpdate_Click()
    Dim pers As Object
    Dim id As Long
    Dim temp As Object
    Dim message As String
   
   Rem If txtDOB = "" Then
   Rem     MsgBox "Date of Birth is a required field", , "Add New Record"
   Rem     txtDOB.SetFocus
   Rem    Exit Sub
   Rem End If
   
       
    If txtSdId.text = "" Then
        MsgBox "ต้องการรหัสนักศึกษา โปรดใส่ให้ข้อมูลให้ครบ", vbInformation
        txtSdId.SetFocus
        Exit Sub
    End If
       
    If txtSdName.text = "" Then
        MsgBox "ต้องการชื่อนักศึกษา  โปรดใส่ให้ข้อมูลให้ครบ", vbInformation
        txtSdName.SetFocus
        Exit Sub
    End If
    If txtSdSurname.text = "" Then
        MsgBox "ต้องการชื่อนักศึกษา โปรดใส่ให้ข้อมูลให้ครบ", vbInformation
        txtSdSurname.SetFocus
        Exit Sub
    End If

    If txtSdNameE.text = "" Then
        MsgBox "ต้องการชื่อนักศึกษา โปรดใส่ให้ข้อมูลให้ครบ", vbInformation
        txtSdNameE.SetFocus
        Exit Sub
    End If
    If txtSdSurNameE.text = "" Then
        MsgBox "ต้องการชื่อนักศึกษา โปรดใส่ให้ข้อมูลให้ครบ", vbInformation
        txtSdSurNameE.SetFocus
        Exit Sub
    End If
       
       
    Student.SdBirth = dtpSdBirth.Value
    Student.SdAddr = txtSdAddr.text
    Student.SdOAddr = txtSdOAddr.text
    Student.SdOcllg = txtSdOcllg.text
    Student.SdDegree = txtSdDegree.text
    Student.SdTel = txtSdTel.text
    Student.SdInDt = dtpSdInDt.Value
    Student.SdOutDt = dtpSdOutDt.Value
    Student.SdFName = txtSdFName.text
    Student.SdMName = txtSdMName.text
    
    Student.SdSex = Student.SdSexDisplayToLogical(cmbSdSex.text)
    Student.SdPref = Student.SdPrefDisplayToLogical(cmbSdPref.text)
    Student.SdPrefE = Student.SdPrefEDisplayToLogical(cmbSdPrefE.text)
    Student.SdSts = Student.SdStsDisplayToLogical(cmbSdSts.text)
       
  ' Dim count As Integer
  ' Dim SdIdObj As Object
  ' count = 1
  ' Student.SdId.Clear
  ' Do While (count <= frmEditSdId.lvSdId.ListItems.count)
  '      Set SdIdObj = cache.New("TempString")
  '      SdIdObj.Val = frmEditSdId.lvSdId.ListItems(count).Text
       ' frmEditSdId.dtpSdIdFromDate.Value = frmEditSdId.lvSdId.ListItems(count).SubItems(1)
       ' frmEditSdId.dtpSdIdToDate.Value = frmEditSdId.lvSdId.ListItems(count).SubItems(2)
 '       SdIdObj.FromDate = Student.SdInDtOdbcToLogical(frmEditSdId.lvSdId.ListItems(count).SubItems(1))
        'frmEditSdId.dtpSdIdFromDate.Value
        'SdIdObj.ToDate = frmEditSdId.dtpSdIdToDate.Value
 '       Student.SdId.Insert SdIdObj
 '       Set SdIdObj = Nothing
 '       count = count + 1
 '   Loo
        
    ' Save (Add or Update)
    On Error GoTo SaveError
    Student.sys_Save
    On Error GoTo 0
    
    If Add Then
     'กรณีเพิ่มข้อมมูลใหม่
         Set temp = cache.Static("Student")
         id = temp.FindSdIdNow(txtSdId.text)
         If id = 0 Then
            id = Student.sys_Id
            message = Student.InsertNewSd(id, txtSdId.text, txtSdName.text, txtSdSurname.text, txtSdNameE.text, txtSdSurNameE.text)
            MsgBox "ทำการเพิ่มข้อมูล รหัส " & txtSdId.text, vbOKOnly, "บันทึกข้อมูลสำเร็จ"
         End If
    Else
        ' กรณีเป็นการแก้ไช ข้อมูลที่มีอยู่แล้ว
         'Check Oid is not duplicate
         Set temp = cache.Static("Student")
         id = temp.FindSdIdNow(txtSdId.text)
         If id = 0 Then
          ' กรณี รหัสที่แก้ไขไม่ซ้ำกับที่มีอยู่ในเวลาเดียวกัน
            id = Student.sys_Id
            message = Student.UpdateNewSd(id, txtSdId.text, txtSdName.text, txtSdSurname.text, txtSdNameE.text, txtSdSurNameE.text)
            MsgBox "ทำการบันทึกข้อมูล รหัส " & txtSdId.text, vbOKOnly, "บันทึกข้อมูลสำเร็จ"
          Else
            ' กรณี รหัสเกิดความซ้ำกับที่มีอยู่แล้ว
            If txtSdId.text <> oldSdId Then
                 MsgBox "รหัสนักศึกษา " & txtSdId.text & " มีอยู่แล้วในขณะนี้  ไม่สามารถเปลี่ยนให้ได้" & vbCrLf & message, vbInformation, "รหัสนักศึกษาซ้ำซ้อน"
                 Exit Sub
            End If
            'If Student.SdName.Count() <> 0 Then
            message = Student.UpdateNewSd(id, txtSdId.text, txtSdName.text, txtSdSurname.text, txtSdNameE.text, txtSdSurNameE.text)
            'Else
             '  message = Student.InsertNewSd(id, txtSdId.Text, txtSdName.Text)
           ' End If
         End If
    End If
    
    Add = True
    ClearScreen
    ClearObjects
    InitObjects
    txtSdId.SetFocus
        
    Exit Sub
   
SaveError:
    MsgBox "เกิดข้อผิดหลาด ไม่สามารถบันทึกข้อมูลได้ ! : " & Err.Description, vbInformation, "เกิดข้อผิดพลาดขึ้น"

End Sub

Private Sub cmdDelete_Click()
    Dim sc As String
    On Error GoTo DeleteError
    If MsgBox("ต้องการลบ ประวัตินักศึกษา รหัส " & txtSdId.text & " ใช่ หรือ ไม่ ?", vbYesNo, "ยืนยันการลบประวัติ") = vbYes Then
        sc = Student.sys_Delete(Student.sys_Oid())
    On Error GoTo 0
    ClearObjects
    InitObjects
    ClearScreen
    End If
    Exit Sub
DeleteError:
    MsgBox "เกิดข้อผิดหลาด ไม่สามารถลบข้อมูลได้ ! : " & Err.Description
End Sub


Private Sub cmdExit_Click()
  Unload frmStudent
End Sub


Private Sub cmdCourse_Click()
   'IsEmployee = True
    actionFind "Course"
End Sub

Private Sub actionFind(classname As String)
Dim id As Variant
   ' actionClose
    Set CacheQuery1.Factory = cache
    CacheQuery1.classname = classname
    CacheQuery1.QueryName = "CourseInfo"
    id = CacheQuery1.FindId
    If id = "" Then Exit Sub
  '  txtId = id
    Set temp = cache.OpenId(classname, id)
    
    If temp Is Nothing Then
        MsgBox "ไม่สามารถเปิดหลักสูตรได้", vbInformation
    '    actionClose
    Else
         Set Student.course = temp
        'EnableScreen True
        SyncObjectToScreen
        'm_modified = False
    End If
End Sub

Private Sub SyncObjectToScreen()
    txtSdCourseYear.text = temp.CourseTotalYear
    txtSdBrn = temp.CourseBrn.BrnName
    Dim msg As String
    msg = temp.CourseName
    Dim year As Integer
    year = temp.CourseYear
    msg = msg + " ปี " + CStr(year)
    txtSdCourse = msg
    txtSdfc = temp.CourseBrn.BrnDpt.DptFc.FcName
    txtSdDpt = temp.CourseBrn.BrnDpt.DptName
 End Sub
