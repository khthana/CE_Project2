VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmCheck2 
   Caption         =   "พิจาณณาการขอจบ"
   ClientHeight    =   7905
   ClientLeft      =   540
   ClientTop       =   480
   ClientWidth     =   10320
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
   ScaleHeight     =   7905
   ScaleWidth      =   10320
   Begin MSComctlLib.ListView lvSubject 
      Height          =   2175
      Left            =   960
      TabIndex        =   21
      Top             =   5520
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
      Left            =   8040
      TabIndex        =   19
      Top             =   720
      Width           =   1935
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
      Left            =   8040
      TabIndex        =   18
      Top             =   1440
      Width           =   1935
   End
   Begin MSComctlLib.ListView lvGrade 
      Height          =   2295
      Left            =   960
      TabIndex        =   16
      Top             =   2760
      Width           =   8535
      _ExtentX        =   15055
      _ExtentY        =   4048
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
      Caption         =   "นักศึกษา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   240
      TabIndex        =   2
      Top             =   0
      Width           =   9855
      Begin VB.TextBox txtSdCourse 
         Height          =   375
         Left            =   4800
         TabIndex        =   13
         Top             =   1680
         Width           =   2655
      End
      Begin VB.TextBox txtSdBrn 
         Height          =   375
         Left            =   1320
         TabIndex        =   12
         Top             =   1680
         Width           =   2535
      End
      Begin VB.ComboBox cmbSdPref 
         Height          =   360
         Left            =   1320
         TabIndex        =   6
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox txtSdSurname 
         Height          =   375
         Left            =   5280
         TabIndex        =   5
         Top             =   720
         Width           =   2175
      End
      Begin VB.TextBox txtSdDpt 
         Height          =   375
         Left            =   4800
         TabIndex        =   4
         Top             =   1200
         Width           =   2655
      End
      Begin VB.TextBox txtSdfc 
         Height          =   390
         Left            =   1320
         TabIndex        =   3
         Top             =   1200
         Width           =   2535
      End
      Begin VB.TextBox txtSdName 
         Height          =   375
         Left            =   2400
         TabIndex        =   1
         Top             =   720
         Width           =   2295
      End
      Begin VB.TextBox txtSdId 
         Height          =   330
         Left            =   1320
         MaxLength       =   8
         TabIndex        =   0
         TabStop         =   0   'False
         Top             =   285
         Width           =   1215
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "หลักสูตร"
         Height          =   240
         Left            =   4080
         TabIndex        =   15
         Top             =   1680
         Width           =   690
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "สาขาวิชา"
         Height          =   240
         Left            =   480
         TabIndex        =   14
         Top             =   1680
         Width           =   720
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "สกุล"
         Height          =   240
         Left            =   4800
         TabIndex        =   11
         Top             =   720
         Width           =   360
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "คณะ"
         Height          =   240
         Left            =   840
         TabIndex        =   10
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "ภาควิชา"
         Height          =   240
         Left            =   4080
         TabIndex        =   9
         Top             =   1200
         Width           =   630
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อ"
         Height          =   240
         Left            =   960
         TabIndex        =   8
         Top             =   720
         Width           =   240
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "รหัสนักศึกษา"
         Height          =   240
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   1050
      End
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "รายชื่อวิชาที่เรียนไม่ครบ"
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
      Left            =   4320
      TabIndex        =   20
      Top             =   5160
      Width           =   2160
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
      Left            =   3840
      TabIndex        =   17
      Top             =   2400
      Width           =   3195
   End
End
Attribute VB_Name = "frmCheck2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Add As Boolean
Dim oldSdId As String
Dim RegSjs() As Object
Dim Sd As Object


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
   lvSubject.ColumnHeaders.Add , , "ชื่อวิชา", 2900, lvwColumnLeft
   lvSubject.ColumnHeaders.Add , , "หน่วยกิต", 1200, lvwColumnCenter
   lvSubject.ColumnHeaders.Add , , "ปีการศึกษา", 1300, lvwColumnCenter
   lvSubject.ColumnHeaders.Add , , "เทอม", 1200, lvwColumnCenter
   lvSubject.ListItems.Clear

End Sub

Private Sub cmdClear_Click()
ClearScreen
End Sub

Private Sub cmdClose_Click()
Unload frmCheck
End Sub

'Private Sub cmdFinal_Click()
' frmFinal.Show vbModal
'End Sub

Private Sub Form_Load()
    LoadlvGrade
    LoadlvSubject
    Add = True
    LoadCombo
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
  If Add = True Then
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
    
             If Not (Sd.Course Is Nothing) Then
                txtSdfc.text = Sd.Course.CourseBrn.BrnDpt.DptFc.FcName
                txtSdDpt.text = Sd.Course.CourseBrn.BrnDpt.DptName
                txtSdBrn.text = Sd.Course.CourseBrn.BrnName
                Dim msg As String
                msg = Sd.Course.CourseName
                Dim year As Integer
                year = Sd.Course.CourseTotalYear
                
                msg = msg + " " + CStr(year) + " ปี"
                txtSdCourse.text = msg
              End If
               FindSdReg
        Else

            Add = False
            If Not (Sd Is Nothing) Then Sd.sys_close
             MsgBox "ไม่พบรหัสนักศึกษา " + txtSdId.text
             ClearObjects
             txtSdId.SetFocus
             Add = True
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
                   CheckForceSub
                   Exit Sub
                 End If
                 Reg.sys_close
    Wend
        MsgBox "ไม่พบข้อมูลการลงทะเบียนของนักศึกษารหัส " + txtSdId.text
       ' txtYear.text = ""
       ' txtTerm.text = ""
        ClearScreen
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
    Dim CrdPass As Integer
    CrdPass = 0
    
   While resultset.Next()
                regid = resultset.GetData(1)
                Set Reg = cache.OpenId("RegTranH", regid)
                CrdPass = Reg.GetCrdPass() + CrdPass
                 
         For i = 1 To Reg.ThSj.count()
              
           Set tempobj = Reg.ThSj.GetAt(i)
           If (Reg.ThGrade.GetAt(i) = "F") Or (Reg.ThGrade.GetAt(i) = "U") Or (Reg.ThGrade.GetAt(i) = " ") Then
          '  MsgBox "เกรด U or F"
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
      '                 MsgBox oldsjcode + "   " + tempobj.SjName.GetAt(tempobj.SjName.count()).val
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
        Reg.sys_close
    Wend
     MsgBox "total cradit pass " + CStr(CrdPass)
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
   
   lvGrade.ListItems.Clear
   lvSubject.ListItems.Clear
   
End Sub

Private Sub ClearObjects()
 If Not Reg Is Nothing Then
        Reg.sys_close
        Set Reg = Nothing
    End If
    
    If Not Sd Is Nothing Then
        Sd.sys_close
        Set Sd = Nothing
    End If
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
    
    ok = resultset.Execute(Sd.Course.CourseCode, 1)
    While resultset.Next()
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
    
    Set resultset = Nothing
 End Sub


