VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmGrade 
   Caption         =   "ผลการศึกษา"
   ClientHeight    =   7020
   ClientLeft      =   1080
   ClientTop       =   855
   ClientWidth     =   10155
   LinkTopic       =   "Form1"
   ScaleHeight     =   7020
   ScaleWidth      =   10155
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "ผลการศึกษา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6015
      Left            =   240
      TabIndex        =   13
      Top             =   120
      Width           =   9855
      Begin VB.TextBox txtYear 
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
         Left            =   7920
         MaxLength       =   8
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   1200
         Width           =   735
      End
      Begin VB.TextBox txtSdName 
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
         Left            =   2520
         TabIndex        =   9
         Top             =   720
         Width           =   2295
      End
      Begin VB.TextBox txtSdfc 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   390
         Left            =   1440
         TabIndex        =   8
         Top             =   1200
         Width           =   2175
      End
      Begin VB.TextBox txtSdDpt 
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
         Left            =   4440
         TabIndex        =   7
         Top             =   1200
         Width           =   2415
      End
      Begin VB.TextBox txtSdId 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1440
         MaxLength       =   8
         TabIndex        =   0
         Top             =   285
         Width           =   1215
      End
      Begin VB.TextBox txtTerm 
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
         MaxLength       =   1
         TabIndex        =   2
         Top             =   1200
         Width           =   375
      End
      Begin VB.TextBox txtSdSurname 
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
         Left            =   5400
         TabIndex        =   5
         Top             =   720
         Width           =   2175
      End
      Begin VB.ComboBox cmbSdPref 
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
         Left            =   1440
         TabIndex        =   4
         Top             =   720
         Width           =   975
      End
      Begin MSComctlLib.ListView lvReg 
         Height          =   3375
         Left            =   720
         TabIndex        =   6
         Top             =   2040
         Width           =   8535
         _ExtentX        =   15055
         _ExtentY        =   5953
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
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         Caption         =   "หน่วย"
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
         Left            =   7080
         TabIndex        =   30
         Top             =   5520
         Width           =   510
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         Caption         =   "หน่วย"
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
         Left            =   2160
         TabIndex        =   29
         Top             =   5520
         Width           =   510
      End
      Begin VB.Label labGpa 
         AutoSize        =   -1  'True
         Caption         =   "00.00"
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
         Left            =   8640
         TabIndex        =   28
         Top             =   5520
         Width           =   540
      End
      Begin VB.Label labCrdCum 
         AutoSize        =   -1  'True
         Caption         =   "00"
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
         Left            =   6600
         TabIndex        =   27
         Top             =   5520
         Width           =   240
      End
      Begin VB.Label labGps 
         AutoSize        =   -1  'True
         Caption         =   "00.00"
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
         Left            =   3720
         TabIndex        =   26
         Top             =   5520
         Width           =   540
      End
      Begin VB.Label labCrdPerTerm 
         AutoSize        =   -1  'True
         Caption         =   "00"
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
         Left            =   1680
         TabIndex        =   25
         Top             =   5520
         Width           =   240
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "หน่วยกิตสะสม"
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
         Left            =   5040
         TabIndex        =   24
         Top             =   5520
         Width           =   1245
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "GPS"
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
         Left            =   3120
         TabIndex        =   23
         Top             =   5520
         Width           =   360
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "GPA"
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
         Left            =   8040
         TabIndex        =   22
         Top             =   5520
         Width           =   390
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "หน่วยกิต"
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
         Left            =   720
         TabIndex        =   19
         Top             =   5520
         Width           =   780
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "รหัสนักศึกษา"
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
         TabIndex        =   18
         Top             =   360
         Width           =   1050
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "ปีการศึกษา"
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
         Left            =   6960
         TabIndex        =   17
         Top             =   1200
         Width           =   900
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อ"
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
         TabIndex        =   16
         Top             =   720
         Width           =   240
      End
      Begin VB.Label Label4 
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
         Left            =   3720
         TabIndex        =   15
         Top             =   1200
         Width           =   630
      End
      Begin VB.Label Label5 
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
         Left            =   960
         TabIndex        =   14
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "เทอม"
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
         Left            =   8760
         TabIndex        =   12
         Top             =   1200
         Width           =   435
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "ผลการศึกษา"
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
         Left            =   3840
         TabIndex        =   11
         Top             =   1680
         Width           =   2775
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "สกุล"
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
         Left            =   4920
         TabIndex        =   10
         Top             =   720
         Width           =   360
      End
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
      Left            =   3000
      TabIndex        =   3
      Top             =   6240
      Width           =   1815
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
      Left            =   5760
      TabIndex        =   20
      Top             =   6240
      Width           =   1695
   End
   Begin VB.Label Label10 
      Caption         =   "Label10"
      Height          =   495
      Left            =   4560
      TabIndex        =   21
      Top             =   3240
      Width           =   1215
   End
End
Attribute VB_Name = "frmGrade"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Add As Boolean
Dim oldSdId As String
Dim RegSjs() As Object
Dim Sd As Object

Private Sub LoadlvReg()
   lvReg.View = lvwReport
   lvReg.FullRowSelect = True
   lvReg.ColumnHeaders.Clear
   lvReg.ColumnHeaders.Add , , "ลำดับที่", 900, lvwColumnLeft
   lvReg.ColumnHeaders.Add , , "รหัสวิชา", 2200, lvwColumnLeft
   lvReg.ColumnHeaders.Add , , "รายชื่อวิชา", 3800, lvwColumnLeft
   lvReg.ColumnHeaders.Add , , "หน่วยกิต", 900, lvwColumnLeft
   lvReg.ColumnHeaders.Add , , "เกรด", 600, lvwColumnLeft
   lvReg.ListItems.Clear

End Sub

Private Sub cmdClear_Click()
     ClearObjects
     InitObjects
     ClearScreen
     txtSdId.SetFocus
     Add = True
End Sub

Private Sub InitObjects()
    Set Reg = cache.New("RegTranH")
   End Sub


Private Sub cmdClose_Click()
 Unload frmGrade
End Sub


Private Sub Form_Load()
    LoadlvReg
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



Private Sub lvReg_DblClick()
  frmInputGrade.Show vbModal
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
              End If
              txtYear.SetFocus
         
        Else

            Add = False
            If Not (Sd Is Nothing) Then Sd.sys_close
             MsgBox "ไม่พบรหัสนักศึกษา " + txtSdId.text, vbInformation
             ClearObjects
             InitObjects
             txtSdId.SetFocus
             Add = True
           End If
     '   End If
    Exit Sub
objerr:
    VBErrorBox "โหลดข้อมูลนักศึกษา ล้มเหลว"
    ClearScreen
End Sub

Private Sub LoadReg()
    Dim resultset As CacheObject.resultset
    Dim columns As Integer

 '    MsgBox " in txtTerm lostfocus"
    Set resultset = cache.resultset("RegTranH", "FindRegSd")
    columns = resultset.GetColumnCount()
    Dim ok As Boolean
    ok = resultset.Execute(txtYear.text, txtTerm.text)
    Dim regid As String
    'Dim regtemp As Object
   While resultset.Next()
                regid = resultset.GetData(1)
                Set Reg = cache.OpenId("RegTranH", regid)
                 If Reg.ThSd = Sd Then
  '                 MsgBox " found sd and term and year"
                   LoadData
                   Exit Sub
                 End If
                 Reg.sys_close
    Wend
        MsgBox "ไม่พบข้อมูลการลงทะเบียนของนักศึกษารหัส " + txtSdId.text + " ปีการศึกษา " + txtYear.text + " ภาคการศึกษา " + txtTerm.text, vbInformation
       ' txtYear.text = ""
       ' txtTerm.text = ""
        'ClearObjects
End Sub


Private Sub ClearScreen()
   txtSdId = ""
   cmbSdPref.text = ""
   txtSdName = ""
   txtSdSurname = ""
   txtSdfc = ""
   txtSdDpt = ""
   txtYear = ""
   txtTerm = ""
   labCrdPerTerm.Caption = "00"
   labGps.Caption = "00.00"
   labCrdCum.Caption = "00"
   labGpa.Caption = "00.00"
   lvReg.ListItems.Clear
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

Public Sub LoadData()
    'load history and plan of lvSjCode
    Dim id As Long
    'Dim temp As Object
    Dim tempobj As Object
    Dim Index As Integer
    Dim idhistkey As String, idhist As Object
    Dim item As ListItem, idcount As Integer
     Dim i As Integer
     Dim oldsjcode As String
     Dim newsjcode
     Dim b As Object
 '       index = 0
        lvReg.ListItems.Clear
    Dim pers As Object
    Dim dt As String
    Set pers = cache.Static("Subject")

        For i = 1 To Reg.ThSj.count()
            Set item = lvReg.ListItems.Add
            Set tempobj = Reg.ThSj.GetAt(i)
             item.text = i
 
    
             oldsjcode = pers.ReturnSjCodeAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
   
              If (oldsjcode <> tempobj.SjCode.GetAt(tempobj.SjCode.count()).val) Then
                item.SubItems(1) = oldsjcode + " * "
              Else
                item.SubItems(1) = oldsjcode
               End If
       '=====
             oldsjcode = pers.ReturnSjNameAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)

              If (oldsjcode <> tempobj.SjName.GetAt(tempobj.SjName.count()).val) Then
                item.SubItems(2) = oldsjcode + " * "
              Else
                item.SubItems(2) = oldsjcode
               End If

              
              item.SubItems(3) = tempobj.SjCrd
              item.SubItems(4) = Reg.ThGradeLogicalToDisplay(Reg.ThGrade.GetAt(i))
              
              Set tempobj = Nothing
        Next i
    '    labCrdPerTerm.Caption = Reg.GetCrdInTerm()
     '   labGps.Caption = Reg.GetGPS()
        CalGPAandCrdCum
        'Temp.sys_close
End Sub

Private Sub txtTerm_lostfocus()
    If (txtYear.text <> "") And (txtTerm.text <> "") Then LoadReg
End Sub

Public Sub CalGPAandCrdCum()
    Dim resultset As CacheObject.resultset
    Dim columns As Integer
   
    Set resultset = cache.resultset("RegTranH", "FindSdResult")
    columns = resultset.GetColumnCount()
    Dim ok As Boolean
    ok = resultset.Execute(Sd.sys_Id, txtYear.text, "")
    Dim regid As String
    Dim CrdAcc As Integer
   Dim Score As Double
    Dim crdcal As Integer
    Dim term As String
     Dim qterm As Integer
     Dim qyear As String
     Dim year As String
     
    term = txtTerm.text
    year = txtYear.text
    Score = 0#
    crdcal = 0
    CrdAcc = 0
    Dim regtemp As Object
    Dim i As Integer
    i = txtTerm.text
   While resultset.Next()
              qterm = resultset.GetData(4)
               qyear = resultset.GetData(3)
               If year = qyear Then
                 If term >= qterm Then
                'MsgBox qterm
                   regid = resultset.GetData(1)
                  Set regtemp = cache.OpenId("RegTranH", regid)
                  CrdAcc = CrdAcc + regtemp.GetCrdInTerm()
                   crdcal = crdcal + regtemp.GetCrdInTermCal()
                   Score = Score + regtemp.GetScoreInTerm()
                   regtemp.sys_close
                 End If
              Else
                regid = resultset.GetData(1)
                Set regtemp = cache.OpenId("RegTranH", regid)
                CrdAcc = CrdAcc + regtemp.GetCrdInTerm()
                crdcal = crdcal + regtemp.GetCrdInTermCal()
                Score = Score + regtemp.GetScoreInTerm()
                regtemp.sys_close
               End If
                
    Wend
    Dim gps As Double
    Dim tempstr  As String
    
    labCrdPerTerm.Caption = Reg.GetCrdInTerm()
    Reg.ThGPS = Reg.GetGPS()
    gps = Reg.GetGPS()
    tempstr = CStr(gps)
    
    labGps.Caption = Left(tempstr, 4)
    
    labCrdCum.Caption = CrdAcc
    
    If crdcal > 0 Then
      Dim keep As Object
      Set keep = cache.Static("RegTranH")
       Reg.ThGPA = keep.FindGPA(Score, crdcal)
       gps = Reg.ThGPA
       tempstr = CStr(gps)
       labGpa.Caption = Left(tempstr, 4)
       Reg.sys_Save
    Else
       labGpa.Caption = "0.00"
       Reg.sys_Save
   End If
   
End Sub
