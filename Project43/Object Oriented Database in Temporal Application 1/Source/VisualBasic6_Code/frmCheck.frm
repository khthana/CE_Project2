VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmCheck 
   BackColor       =   &H8000000B&
   Caption         =   "พิจารณาจบ"
   ClientHeight    =   7995
   ClientLeft      =   330
   ClientTop       =   360
   ClientWidth     =   11010
   FillColor       =   &H8000000B&
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
   ScaleHeight     =   7995
   ScaleWidth      =   11010
   Begin VB.OptionButton optunpass 
      Caption         =   "ไม่สมบูรณ์"
      Enabled         =   0   'False
      ForeColor       =   &H000000C0&
      Height          =   255
      Left            =   9480
      TabIndex        =   47
      Top             =   3600
      Width           =   1335
   End
   Begin VB.OptionButton optpass 
      Caption         =   "สมบูรณ์"
      Enabled         =   0   'False
      ForeColor       =   &H00008000&
      Height          =   255
      Left            =   9480
      TabIndex        =   46
      Top             =   3240
      Width           =   1095
   End
   Begin MSComctlLib.ProgressBar prgbar1 
      Height          =   375
      Left            =   3840
      TabIndex        =   42
      Top             =   7560
      Width           =   4575
      _ExtentX        =   8070
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ตัวอย่างผลการศึกษา"
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
      Left            =   8640
      TabIndex        =   2
      Top             =   360
      Width           =   2055
   End
   Begin VB.TextBox txtSjType2Pass 
      Height          =   315
      Left            =   5760
      TabIndex        =   40
      Top             =   2280
      Width           =   495
   End
   Begin VB.TextBox txtSjType1Pass 
      Height          =   345
      Left            =   5760
      TabIndex        =   36
      Top             =   1920
      Width           =   495
   End
   Begin VB.TextBox txtRemainSjType2 
      Height          =   330
      Left            =   9240
      TabIndex        =   34
      Top             =   2280
      Width           =   495
   End
   Begin VB.TextBox txtTotalSjType2 
      Height          =   330
      Left            =   2160
      TabIndex        =   33
      Top             =   2280
      Width           =   495
   End
   Begin VB.TextBox txtRemainSjType1 
      Height          =   330
      Left            =   9240
      TabIndex        =   32
      Top             =   1920
      Width           =   495
   End
   Begin VB.TextBox txtTotalSjType1 
      Height          =   330
      Left            =   2160
      TabIndex        =   31
      Top             =   1920
      Width           =   495
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
      Height          =   615
      Left            =   9240
      TabIndex        =   21
      Top             =   6120
      Width           =   1695
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
      Left            =   9240
      TabIndex        =   20
      Top             =   6840
      Width           =   1695
   End
   Begin MSComctlLib.ListView lvGrade 
      Height          =   2055
      Left            =   600
      TabIndex        =   18
      Top             =   2880
      Width           =   8535
      _ExtentX        =   15055
      _ExtentY        =   3625
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   240
      TabIndex        =   4
      Top             =   0
      Width           =   10575
      Begin VB.CommandButton cmdProcess 
         Caption         =   "ประมวลผล"
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
         Left            =   8400
         TabIndex        =   1
         Top             =   1080
         Width           =   2055
      End
      Begin VB.TextBox txtSdCourse 
         Height          =   360
         Left            =   4920
         TabIndex        =   15
         Top             =   1320
         Width           =   3375
      End
      Begin VB.TextBox txtSdBrn 
         Height          =   360
         Left            =   1320
         TabIndex        =   14
         Top             =   1320
         Width           =   2535
      End
      Begin VB.ComboBox cmbSdPref 
         Height          =   360
         Left            =   1320
         TabIndex        =   8
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox txtSdSurname 
         Height          =   360
         Left            =   5400
         TabIndex        =   7
         Top             =   600
         Width           =   2415
      End
      Begin VB.TextBox txtSdDpt 
         Height          =   360
         Left            =   4920
         TabIndex        =   6
         Top             =   960
         Width           =   3375
      End
      Begin VB.TextBox txtSdfc 
         Height          =   360
         Left            =   1320
         TabIndex        =   5
         Top             =   960
         Width           =   2535
      End
      Begin VB.TextBox txtSdId 
         Height          =   360
         Left            =   1320
         MaxLength       =   8
         TabIndex        =   0
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtSdName 
         Height          =   330
         Left            =   2400
         MaxLength       =   50
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   600
         Width           =   2295
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "หลักสูตร"
         Height          =   240
         Left            =   4080
         TabIndex        =   17
         Top             =   1320
         Width           =   690
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "สาขาวิชา"
         Height          =   240
         Left            =   480
         TabIndex        =   16
         Top             =   1320
         Width           =   720
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "สกุล"
         Height          =   240
         Left            =   4800
         TabIndex        =   13
         Top             =   600
         Width           =   360
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "คณะ"
         Height          =   240
         Left            =   840
         TabIndex        =   12
         Top             =   960
         Width           =   375
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "ภาควิชา"
         Height          =   240
         Left            =   4080
         TabIndex        =   11
         Top             =   960
         Width           =   630
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อ"
         Height          =   240
         Left            =   960
         TabIndex        =   10
         Top             =   600
         Width           =   240
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "รหัสนักศึกษา"
         Height          =   240
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1050
      End
   End
   Begin MSComctlLib.ListView lvSubject 
      Height          =   2175
      Left            =   600
      TabIndex        =   41
      Top             =   5280
      Width           =   8535
      _ExtentX        =   15055
      _ExtentY        =   3836
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label22 
      AutoSize        =   -1  'True
      Caption         =   "สถานะการศึกษา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   9240
      TabIndex        =   48
      Top             =   2880
      Width           =   1440
   End
   Begin VB.Label Label24 
      AutoSize        =   -1  'True
      Caption         =   "0%"
      ForeColor       =   &H000000FF&
      Height          =   240
      Left            =   3480
      TabIndex        =   45
      Top             =   7560
      Width           =   285
   End
   Begin VB.Label Label23 
      AutoSize        =   -1  'True
      Caption         =   "100%"
      ForeColor       =   &H00008000&
      Height          =   240
      Left            =   8520
      TabIndex        =   44
      Top             =   7560
      Width           =   495
   End
   Begin VB.Label labpro 
      AutoSize        =   -1  'True
      BackColor       =   &H8000000B&
      Caption         =   "เปอร์เซ็นต์การประมวลผล"
      ForeColor       =   &H80000001&
      Height          =   240
      Left            =   1320
      TabIndex        =   43
      Top             =   7560
      Width           =   1995
   End
   Begin VB.Label Label21 
      AutoSize        =   -1  'True
      Caption         =   "หน่วยกิต"
      Height          =   240
      Left            =   9840
      TabIndex        =   39
      Top             =   2280
      Width           =   690
   End
   Begin VB.Label Label20 
      AutoSize        =   -1  'True
      Caption         =   "วิชาเลือกเสรีที่ผ่าน"
      Height          =   240
      Left            =   4080
      TabIndex        =   38
      Top             =   2280
      Width           =   1455
   End
   Begin VB.Label Label19 
      AutoSize        =   -1  'True
      Caption         =   "หน่วยกิต"
      Height          =   240
      Left            =   6360
      TabIndex        =   37
      Top             =   1920
      Width           =   690
   End
   Begin VB.Label Label18 
      AutoSize        =   -1  'True
      Caption         =   "วิชาบังคับเลือกที่ผ่าน"
      Height          =   240
      Left            =   3960
      TabIndex        =   35
      Top             =   1920
      Width           =   1635
   End
   Begin VB.Label Label17 
      AutoSize        =   -1  'True
      Caption         =   "หน่วยกิต"
      Height          =   240
      Left            =   6360
      TabIndex        =   30
      Top             =   2280
      Width           =   690
   End
   Begin VB.Label Label16 
      AutoSize        =   -1  'True
      Caption         =   "หน่วยกิต"
      Height          =   240
      Left            =   9840
      TabIndex        =   29
      Top             =   1920
      Width           =   690
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      Caption         =   "หน่วยกิต"
      Height          =   240
      Left            =   2760
      TabIndex        =   28
      Top             =   2280
      Width           =   690
   End
   Begin VB.Label Label14 
      AutoSize        =   -1  'True
      Caption         =   "หน่วยกิต"
      Height          =   240
      Left            =   2760
      TabIndex        =   27
      Top             =   1920
      Width           =   690
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      Caption         =   "วิชาเลือกเสรีที่เหลือ"
      Height          =   240
      Left            =   7560
      TabIndex        =   26
      Top             =   2280
      Width           =   1545
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      Caption         =   "วิชาบังคับเลือกที่เหลือ"
      Height          =   240
      Left            =   7440
      TabIndex        =   25
      Top             =   1920
      Width           =   1725
   End
   Begin VB.Label Label11 
      AutoSize        =   -1  'True
      Caption         =   "วิชาเลือกเสรีที่เรียน"
      Height          =   240
      Left            =   360
      TabIndex        =   24
      Top             =   2280
      Width           =   1515
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      Caption         =   "วิชาบังคับเลือกที่เรียน"
      Height          =   240
      Left            =   240
      TabIndex        =   23
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "รายชื่อวิชาบังคับที่เรียนไม่ครบ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3840
      TabIndex        =   22
      Top             =   5040
      Width           =   2670
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "รายชื่อวิชาที่ไม่ผ่าน/เกรดไม่สมบูรณ์"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3600
      TabIndex        =   19
      Top             =   2640
      Width           =   3195
   End
End
Attribute VB_Name = "frmCheck"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Add As Boolean
Dim oldSdId As String
Dim RegSjs() As Object
Dim Sd As Object
Dim TotalSjType1, TotalSjType2, TotalSjTypePass1 As Integer
Dim perst As Integer

Dim result As Integer
Dim pass As Boolean


Private Sub LoadlvGrade()
   lvGrade.View = lvwReport
   lvGrade.FullRowSelect = True
   lvGrade.ColumnHeaders.Clear
   lvGrade.ColumnHeaders.Add , , "ปีการศึกษา", 1100, lvwColumnLeft
   lvGrade.ColumnHeaders.Add , , "เทอม", 1000, lvwColumnCenter
   lvGrade.ColumnHeaders.Add , , "รหัสวิชา", 1400, lvwColumnLeft
   lvGrade.ColumnHeaders.Add , , "ชื่อวิชา", 2900, lvwColumnLeft
   lvGrade.ColumnHeaders.Add , , "หน่วยกิต", 1000, lvwColumnCenter
   lvGrade.ColumnHeaders.Add , , "เกรด", 1000, lvwColumnCenter
   lvGrade.ListItems.Clear

End Sub

Private Sub LoadlvSubject()
   lvSubject.View = lvwReport
   lvSubject.FullRowSelect = True
   lvSubject.ColumnHeaders.Clear
   lvSubject.ColumnHeaders.Add , , "รหัสวิชา", 1400, lvwColumnLeft
   lvSubject.ColumnHeaders.Add , , "ชื่อวิชา", 3300, lvwColumnLeft
   lvSubject.ColumnHeaders.Add , , "หน่วยกิต", 1200, lvwColumnCenter
   lvSubject.ColumnHeaders.Add , , "ชั้นปีที่", 1300, lvwColumnCenter
   lvSubject.ColumnHeaders.Add , , "เทอม", 1200, lvwColumnCenter
   lvSubject.ListItems.Clear

End Sub

Private Sub cmdClear_Click()
 ClearScreen
 ClearObjects
 txtSdId.SetFocus
End Sub

Private Sub cmdClose_Click()
'CheckForceSub
Unload frmCheck
End Sub



Private Sub cmdProcess_Click()
 FindSdReg
End Sub

Private Sub Command1_Click()
frmFinal.Show vbModal
End Sub

Private Sub Form_Load()
    LoadlvGrade
    LoadlvSubject
    Add = True
    pass = True
    LoadCombo
    perst = 0
End Sub

Private Sub LoadCombo()
    Dim stds As Object
    Dim displays As String, delimd As String, elems() As String
    Dim i As Integer
    
    Set stds = cache.Static("Student")
    displays = stds.PrefDISPLAYLIST
    delimd = Left(displays, 1)
    elems = Split(displays, delimd)
    cmbSdPref.Clear
    For i = 1 To UBound(elems)
        cmbSdPref.AddItem elems(i)
    Next i
End Sub


Private Sub txtSdId_LostFocus()
 
  If txtSdId.text = "" Then
      If Not (Reg Is Nothing) Then Reg.sys_close
     ' Set Reg = cache.New("RegTranH")
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
 
          Set Std = cache.Static("Student")
          id = Std.FindOID(StudentID)
          If id <> 0 Then
             Set Sd = cache.OpenId("Student", id)
             Set Student = Sd
             ClearScreen
             txtSdId = Sd.SdId.GetAt(Sd.SdId.count()).val
             If (Sd.SdName.count() > 0) Then
             txtSdName = Sd.SdName.GetAt(Sd.SdName.count()).val
             End If
   
              If (Sd.Sdsurname.count() > 0) Then
                txtSdSurname = Sd.Sdsurname.GetAt(Sd.Sdsurname.count()).val
              End If
   
        
              cmbSdPref = Sd.SdPrefLogicalToDisplay(Sd.SdPref)
    
             If Not (Sd.course Is Nothing) Then
                txtSdfc.text = Sd.course.CourseBrn.BrnDpt.DptFc.FcName
                txtSdDpt.text = Sd.course.CourseBrn.BrnDpt.DptName
                txtSdBrn.text = Sd.course.CourseBrn.BrnName
                Dim msg As String
                msg = Sd.course.CourseName
                Dim year As Integer
                year = Sd.course.CourseTotalYear
                
                msg = msg + " " + CStr(year) + " ปี"
                txtSdCourse.text = msg
              End If
              ' FindSdReg
               Add = False
               
        Else

            Add = False
            If Not (Sd Is Nothing) Then Sd.sys_close
             MsgBox "ไม่พบรหัสนักศึกษา " + txtSdId.text, vbInformation
             ClearObjects
             txtSdId.SetFocus
             Add = False
           End If
     '   End If
    Exit Sub
objerr:
    VBErrorBox "โหลดข้อมูลนักศึกษา ล้มเหลว"
    ClearScreen
End Sub

Private Sub FindSdReg()
    Dim resultset As CacheObject.resultset
    Dim columns As Integer

 '    MsgBox " in txtTerm lostfocus"
    Set resultset = cache.resultset("RegTranH", "FindSdResult")
    columns = resultset.GetColumnCount()
    Dim ok As Boolean
    ok = resultset.Execute(Sd.sys_Id, "", "")
    Dim regid As String
    'Dim regtemp As Object
   While resultset.Next()
                regid = resultset.GetData(1)
                Set Reg = cache.OpenId("RegTranH", regid)
                 If Reg.ThSd = Sd Then
  '                 MsgBox " found sd and term and year"
                 LoadGrade
                CheckType1Sub
                CheckType2Sub
                CheckForceSub
             
               If pass Then
                 optpass.Enabled = True
                  optpass.Value = True
              Else
                  optunpass.Enabled = True
                  optunpass.Value = True
              End If
              
                   Exit Sub
                 End If
                 Reg.sys_close
    Wend
        MsgBox "ไม่พบข้อมูลการลงทะเบียนของนักศึกษารหัส " + txtSdId.text, vbInformation
       ' txtYear.text = ""
       ' txtTerm.text = ""
        'ClearScreen
End Sub

Private Sub checkSjType2()
                Dim i As Integer
                  Dim Code As String
               If Not Sd.course Is Nothing Then
                  Code = Sd.course.CourseCode
             
              Dim stdoid As Long
               Dim w As Boolean
               Dim Subid As Long
                Dim resultset As CacheObject.resultset
               TotalSjType1 = 0
               TotalSjTypePass1 = 0
               stdoid = Sd.sys_Id
               Dim rs As CacheObject.resultset
               Set rs = cache.resultset("SubjectInCourse", "ReturnSubIdAsSjType1")
               w = rs.Execute(Code, 3)
              
               Dim tempSub As Object
                While rs.Next
                    Subid = rs.GetData(1)
                    Set tempSub = cache.OpenId("Subject", Subid)
                    
                       MsgBox tempSub.sys_Id
         
                        Set resultset = cache.resultset("RegTranH", "FindSdResult")
                    
                        Dim ok As Boolean
                        ok = resultset.Execute(Sd.sys_Id, "", "")
                          
                        Dim regid As String
                     While resultset.Next()
                     'MsgBox "000002"
                             regid = resultset.GetData(1)
                             Dim tempreg As Object
                              
                            Set tempreg = cache.OpenId("RegTranH", regid)
                             If tempreg.ThSj.count() <> 0 Then
                                   For i = 1 To tempreg.ThSj.count()
                                            Dim tempobj As Object
                                           
                                             Set tempobj = tempreg.ThSj.GetAt(i)
                                             If tempobj.sys_Id = tempSub.sys_Id Then
                                                    MsgBox "Same same"
                                                    
                                                     If (tempreg.ThGrade.GetAt(i) = "F") Or (tempreg.ThGrade.GetAt(i) = "U") Or (tempreg.ThGrade.GetAt(i) = " ") Then
                              
                                                    Else
                         
                                                          TotalSjTypePass1 = TotalSjTypePass1 + tempSub.SjCrd
                                                                 
                                                    End If
                                            
                                                    TotalSjType1 = TotalSjType1 + tempSub.SjCrd
                                                    
                                            End If
  '                      '             MsgBox " found sd and term and year"
                                    Next i
                                            tempobj.sys_close
                                            Set tempobj = Nothing
                                
                                End If
                         txtTotalSjType2.text = TotalSjType1
                         
                       Dim remain As Integer
                                
                         remain = Sd.course.SjType2 - TotalSjType1
                        If remain > 0 Then
                         txtRemainSjType2.text = remain
                                      
                        Else
                                txtRemainSjType2.text = 0
                         End If
                          ' tempSub.sys_close
                          ' Set tempSub = Nothing
                       Wend
                             tempSub.sys_close
                           Set tempSub = Nothing
'                           perst = perst + 1
 '                          prgbar1.Value = perst
              Wend
                        txtSjType2Pass.text = TotalSjTypePass1
              End If


End Sub



'=============
Private Sub LoadGrade()
    Dim resultset As CacheObject.resultset
    Dim columns As Integer
     Dim tempobj As Object
    Dim Index As Integer
    Dim idhistkey As String, idhist As Object
    Dim item As ListItem, idcount As Integer
 '    MsgBox " in txtTerm lostfocus"
    Set resultset = cache.resultset("RegTranH", "FindSdResult")
    columns = resultset.GetColumnCount()
    Dim oldsjcode As String
    Dim pers As Object
    Dim ok As Boolean
    ok = resultset.Execute(Sd.sys_Id, "", "")
    Dim regid As String
    Dim i As Integer
    Set pers = cache.Static("Subject")
   
   While resultset.Next()
               perst = perst + 1
               prgbar1.Value = perst
    
                regid = resultset.GetData(1)
                Set Reg = cache.OpenId("RegTranH", regid)
                 '====
                 
         For i = 1 To Reg.ThSj.count()
              
           Set tempobj = Reg.ThSj.GetAt(i)
           If (Reg.ThGrade.GetAt(i) = "F") Or (Reg.ThGrade.GetAt(i) = "U") Or (Reg.ThGrade.GetAt(i) = " ") Then
          '  MsgBox "เกรด U or F"
                      pass = False
                      Set item = lvGrade.ListItems.Add
                       item.text = Reg.ThYear
                       item.SubItems(1) = Reg.ThTerm
                       oldsjcode = pers.ReturnSjCodeAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
                       If (oldsjcode <> tempobj.SjCode.GetAt(tempobj.SjCode.count()).val) Then
                            item.SubItems(2) = oldsjcode + " * "
                       Else
                            item.SubItems(2) = oldsjcode
                       End If
               
               
               '        item.SubItems(2) = tempobj.SjCode.GetAt(tempobj.SjCode.count()).val
                       oldsjcode = pers.ReturnSjNameAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
             'newsjcode = pers.ReturnSjCode(Reg.ThSj.GetAt(i).sys_Id)
                      'MsgBox oldsjcode + "   " + tempobj.SjName.GetAt(tempobj.SjName.count()).val
       '       item.SubItems(1) = TempObj.SjCode.GetAt(TempObj.SjCode.count()).val
                       If (oldsjcode <> tempobj.SjName.GetAt(tempobj.SjName.count()).val) Then
                          item.SubItems(3) = oldsjcode + " * "
                      Else
                          item.SubItems(3) = oldsjcode
                    End If
                       
                     '  item.SubItems(3) = tempobj.SjName.GetAt(tempobj.SjName.count()).val
                        item.SubItems(4) = tempobj.SjCrd
                        item.SubItems(5) = Reg.ThGrade.GetAt(i)
              End If
             Set tempobj = Nothing
          Next i
               perst = perst + 1
               prgbar1.Value = perst
        Reg.sys_close
    Wend
    
End Sub
'=============



Private Sub ClearScreen()
  
   txtSdId = ""
   cmbSdPref.text = ""
   txtSdName = ""
   txtSdSurname = ""
   txtSdfc = ""
   txtSdDpt = ""
  txtSdBrn = ""
  txtSdCourse = ""
  txtTotalSjType1 = ""
  txtTotalSjType2 = ""
  txtRemainSjType1 = ""
   txtRemainSjType2 = ""
   txtSjType1Pass = ""
   txtSjType2Pass = ""
   prgbar1.Value = 0
   Add = True
   lvSubject.ListItems.Clear
   lvGrade.ListItems.Clear
   pass = True
   perst = 0
    optpass.Value = False
    optunpass.Value = False
    optpass.Enabled = False
    optunpass.Enabled = False
End Sub

Private Sub ClearObjects()
 If Not Reg Is Nothing Then
        Reg.sys_close
        Set Reg = Nothing
    End If
    
    If Not Sd Is Nothing Then
        Student.sys_close
        Sd.sys_close
        Set Student = Nothing
        Set Sd = Nothing
    End If
End Sub


Private Sub CheckType1Sub()
    Dim item As ListItem, idcount As Integer
    Dim resultset As CacheObject.resultset
    Dim ressub As CacheObject.resultset
    
    'Dim columns As Integer
    'Dim columns2 As Integer
    Dim regid As String
    Dim Reg2 As Object
    Dim i As Integer
    Dim oldsjcode As String
    Dim pers As Object
    Dim ok As Boolean
  '  Dim ok2 As Boolean
    Dim sjoid As Integer
    Dim tempSub As Object
    Dim tempobj As Object
    Dim found As Boolean
    Dim Sj As Object
    
    Set resultset = cache.resultset("SubjectInCourse", "GetForceSj")
    'columns = resultset.GetColumnCount()
      TotalSjType1 = 0
      TotalSjTypePass1 = 0
    Set pers = cache.Static("Subject")
  
    ok = resultset.Execute(Sd.course.CourseCode, 2)
    While resultset.Next()
 
                found = False
                sjoid = resultset.GetData(1)
                Set tempSub = cache.OpenId("Subject", sjoid)
                'MsgBox sjoid
                Set ressub = cache.resultset("RegTranH", "FindSdResult")
                'columns2 = ressub.GetColumnCount()
                ok = ressub.Execute(Sd.sys_Id, "", "")
                While ressub.Next()
                'And (Not found)
                     regid = ressub.GetData(1)
                     Set Reg2 = cache.OpenId("RegTranH", regid)
                    '=========For Loop
                     For i = 1 To Reg2.ThSj.count()
                          Set tempobj = Reg2.ThSj.GetAt(i)
                          Dim sjoid2 As Integer
                          sjoid2 = tempobj.sys_Id
                          If sjoid = sjoid2 Then
                          
                          
                              ' พบวิชาเหมือนในหลักสูตแล้ว ออกจากลูป for  ดีกว่า
                               If (Reg2.ThGrade.GetAt(i) = "F") Or (Reg2.ThGrade.GetAt(i) = "U") Or (Reg2.ThGrade.GetAt(i) = " ") Then
                              
                                                    Else
                         
                                                          TotalSjTypePass1 = TotalSjTypePass1 + tempSub.SjCrd
                                                                 
                                                    End If
                                            
                                                    TotalSjType1 = TotalSjType1 + tempSub.SjCrd
                             'Exit For
                             
                             
                           End If
                   '       Set tempobj = Nothing
                     Next i
                     
                           
                     
                     
                    '=========End For loop
                   '  MsgBox regid + " 2"
                     Reg2.sys_close
                     Set Reg2 = Nothing
                 Wend
                 
                 
                 
               '  If Not found Then
                 '========= add lvSubject
'                       Set Sj = cache.OpenId("Subject", sjoid)
'                       Set item = lvSubject.ListItems.Add
'                       item.text = Sj.SjCode.GetAt(Sj.SjCode.count()).val
'                       item.SubItems(1) = Sj.SjName.GetAt(Sj.SjName.count()).val
'                       item.SubItems(2) = Sj.SjCrd
'                       item.SubItems(3) = resultset.GetData(4)
'                       item.SubItems(4) = resultset.GetData(5)

                 '========== add lvSubject
                ' Sj.sys_close
                ' Set Sj = Nothing
               '  End If
                'perst = perst + 1
                'prgbar1.Value = perst
                 Set ressub = Nothing
                 
    Wend
    
                      txtTotalSjType1.text = TotalSjType1
                         
                       Dim remain As Integer
                                
                         remain = Sd.course.SjType1 - TotalSjType1
                        If remain > 0 Then
                         txtRemainSjType1.text = remain
                                      
                        Else
                                txtRemainSjType1.text = 0
                         End If
                        txtSjType1Pass.text = TotalSjTypePass1
    
    If txtRemainSjType1.text <> "0" Then pass = False
    
    Set resultset = Nothing
 End Sub

Private Sub CheckType2Sub()
    Dim item As ListItem, idcount As Integer
    Dim resultset As CacheObject.resultset
    Dim ressub As CacheObject.resultset
    
    'Dim columns As Integer
    'Dim columns2 As Integer
    Dim regid As String
    Dim Reg2 As Object
    Dim i As Integer
    Dim oldsjcode As String
    Dim pers As Object
    Dim ok As Boolean
  '  Dim ok2 As Boolean
    Dim sjoid As Integer
    Dim tempSub As Object
    Dim tempobj As Object
    Dim found As Boolean
    Dim Sj As Object
    
    Set resultset = cache.resultset("SubjectInCourse", "GetForceSj")
    'columns = resultset.GetColumnCount()
      TotalSjType1 = 0
      TotalSjTypePass1 = 0
    Set pers = cache.Static("Subject")
    
    ok = resultset.Execute(Sd.course.CourseCode, 3)
    While resultset.Next()
                found = False
                sjoid = resultset.GetData(1)
                Set tempSub = cache.OpenId("Subject", sjoid)
                'MsgBox sjoid
                Set ressub = cache.resultset("RegTranH", "FindSdResult")
                'columns2 = ressub.GetColumnCount()
                ok = ressub.Execute(Sd.sys_Id, "", "")
                While ressub.Next()
                'And (Not found)
                     regid = ressub.GetData(1)
                     Set Reg2 = cache.OpenId("RegTranH", regid)
                    '=========For Loop
                     For i = 1 To Reg2.ThSj.count()
                          Set tempobj = Reg2.ThSj.GetAt(i)
                          Dim sjoid2 As Integer
                          sjoid2 = tempobj.sys_Id
                          If sjoid = sjoid2 Then
                          
                          
                              ' พบวิชาเหมือนในหลักสูตแล้ว ออกจากลูป for  ดีกว่า
                               If (Reg2.ThGrade.GetAt(i) = "F") Or (Reg2.ThGrade.GetAt(i) = "U") Or (Reg2.ThGrade.GetAt(i) = " ") Then
                              
                                                    Else
                         
                                                          TotalSjTypePass1 = TotalSjTypePass1 + tempSub.SjCrd
                                                                 
                                                    End If
                                            
                                                    TotalSjType1 = TotalSjType1 + tempSub.SjCrd
                             'Exit For
                             
                             
                           End If
                   '       Set tempobj = Nothing
                     Next i
                     
                           
                     
                     
                    '=========End For loop
                   '  MsgBox regid + " 2"
                     Reg2.sys_close
                     Set Reg2 = Nothing
                 Wend
                 
                 
                 
               '  If Not found Then
                 '========= add lvSubject
'                       Set Sj = cache.OpenId("Subject", sjoid)
'                       Set item = lvSubject.ListItems.Add
'                       item.text = Sj.SjCode.GetAt(Sj.SjCode.count()).val
'                       item.SubItems(1) = Sj.SjName.GetAt(Sj.SjName.count()).val
'                       item.SubItems(2) = Sj.SjCrd
'                       item.SubItems(3) = resultset.GetData(4)
'                       item.SubItems(4) = resultset.GetData(5)

                 '========== add lvSubject
                ' Sj.sys_close
                ' Set Sj = Nothing
               '  End If
                 
                 Set ressub = Nothing
                 'perst = perst + 1
                'prgbar1.Value = perst
    Wend
    
                      txtTotalSjType2.text = TotalSjType1
                         
                       Dim remain As Integer
                                
                         remain = Sd.course.SjType2 - TotalSjType1
                        If remain > 0 Then
                         txtRemainSjType2.text = remain
                                      
                        Else
                                txtRemainSjType2.text = 0
                         End If
                        txtSjType2Pass.text = TotalSjTypePass1
                        If txtRemainSjType2.text <> "0" Then pass = False

    Set resultset = Nothing
 End Sub

Private Sub CheckForceSub()
    Dim item As ListItem, idcount As Integer
    Dim resultset As CacheObject.resultset
    Dim ressub As CacheObject.resultset
    
    'Dim columns As Integer
    'Dim columns2 As Integer
    Dim regid As String
    Dim Reg2 As Object
    Dim i As Integer
    Dim oldsjcode As String
    Dim pers As Object
    Dim ok As Boolean
  '  Dim ok2 As Boolean
    Dim sjoid As Integer
    Dim tempobj As Object
    Dim found As Boolean
    Dim Sj As Object
    
    Set resultset = cache.resultset("SubjectInCourse", "GetForceSj")
    'columns = resultset.GetColumnCount()
    
    Set pers = cache.Static("Subject")
    ok = resultset.Execute(Sd.course.CourseCode, 1)
    
    While resultset.Next()
               perst = perst + 1
                prgbar1.Value = perst
                found = False
                sjoid = resultset.GetData(1)
                'MsgBox sjoid
                Set ressub = cache.resultset("RegTranH", "FindSdResult")
                'columns2 = ressub.GetColumnCount()
                ok = ressub.Execute(Sd.sys_Id, "", "")
                While ressub.Next() And (Not found)
                                     regid = ressub.GetData(1)
                     Set Reg2 = cache.OpenId("RegTranH", regid)
                    '=========For Loop
                     For i = 1 To Reg2.ThSj.count()
                          Set tempobj = Reg2.ThSj.GetAt(i)
                          Dim sjoid2 As Integer
                          sjoid2 = tempobj.sys_Id
                          If sjoid = sjoid2 Then
                              ' พบวิชาเหมือนในหลักสูตแล้ว ออกจากลูป for  ดีกว่า
                              found = True
                             'MsgBox "Same same"
                             Exit For
                           End If
                   '       Set tempobj = Nothing
                     Next i
                    '=========End For loop
                   '  MsgBox regid + " 2"
                     Reg2.sys_close
                    Set Reg2 = Nothing
                 Wend
                 
                 If Not found Then
                 '========= add lvSubject
                       pass = False
                       Set Sj = cache.OpenId("Subject", sjoid)
                       Set item = lvSubject.ListItems.Add
                       item.text = Sj.SjCode.GetAt(Sj.SjCode.count()).val
                       item.SubItems(1) = Sj.SjName.GetAt(Sj.SjName.count()).val
                       item.SubItems(2) = Sj.SjCrd
                       item.SubItems(3) = resultset.GetData(4)
                       item.SubItems(4) = resultset.GetData(5)

                 '========== add lvSubject
                Sj.sys_close
               Set Sj = Nothing
                 End If
               Set ressub = Nothing
                 
    Wend
    prgbar1.Value = 100
    Set resultset = Nothing
 End Sub

