VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRegister 
   BackColor       =   &H00C0C0C0&
   Caption         =   "ลงทะเบียนนักศึกษา"
   ClientHeight    =   7050
   ClientLeft      =   900
   ClientTop       =   1095
   ClientWidth     =   10380
   LinkTopic       =   "Form1"
   ScaleHeight     =   7050
   ScaleWidth      =   10380
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
      TabIndex        =   8
      Top             =   6240
      Width           =   1695
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
      Left            =   6000
      TabIndex        =   7
      Top             =   6240
      Width           =   1815
   End
   Begin VB.CommandButton cmdDelSub 
      Caption         =   "ถอนวิชา"
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
      TabIndex        =   6
      Top             =   6240
      Width           =   1815
   End
   Begin VB.CommandButton cmdAddSub 
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
      Left            =   720
      TabIndex        =   5
      Top             =   6240
      Width           =   1695
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "ลงทะเบียนเรียน"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5775
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   9855
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
         Left            =   1320
         TabIndex        =   21
         Top             =   720
         Width           =   975
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
         Left            =   5280
         TabIndex        =   19
         Top             =   720
         Width           =   2175
      End
      Begin MSComctlLib.ListView lvReg 
         Height          =   3135
         Left            =   960
         TabIndex        =   17
         Top             =   2040
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   5530
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
         Height          =   360
         Left            =   9120
         MaxLength       =   1
         TabIndex        =   3
         Top             =   1200
         Width           =   375
      End
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
         Height          =   360
         Left            =   7800
         MaxLength       =   4
         TabIndex        =   2
         Top             =   1200
         Width           =   735
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
         Left            =   4320
         TabIndex        =   10
         Top             =   1200
         Width           =   2415
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
         Height          =   375
         Left            =   1320
         TabIndex        =   9
         Top             =   1200
         Width           =   2175
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
         Left            =   2400
         TabIndex        =   4
         Top             =   720
         Width           =   2295
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
         Height          =   315
         Left            =   1320
         MaxLength       =   8
         TabIndex        =   1
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label10 
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
         Height          =   255
         Left            =   9000
         TabIndex        =   24
         Top             =   5280
         Width           =   615
      End
      Begin VB.Label labCrdInTerm 
         AutoSize        =   -1  'True
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
         Left            =   8400
         TabIndex        =   23
         Top             =   5280
         Width           =   60
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
         Left            =   7320
         TabIndex        =   22
         Top             =   5280
         Width           =   780
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
         Left            =   4800
         TabIndex        =   20
         Top             =   720
         Width           =   360
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "รายการลงทะเบียน"
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
         Left            =   3480
         TabIndex        =   18
         Top             =   1680
         Width           =   3045
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
         Left            =   8640
         TabIndex        =   16
         Top             =   1200
         Width           =   435
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
         Left            =   840
         TabIndex        =   15
         Top             =   1200
         Width           =   375
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
         Left            =   3600
         TabIndex        =   14
         Top             =   1200
         Width           =   630
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
         Left            =   960
         TabIndex        =   13
         Top             =   720
         Width           =   240
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
         Left            =   6840
         TabIndex        =   12
         Top             =   1200
         Width           =   900
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
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   1050
      End
   End
End
Attribute VB_Name = "frmRegister"
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
   lvReg.ColumnHeaders.Add , , "รหัสวิชา", 2300, lvwColumnLeft
   lvReg.ColumnHeaders.Add , , "รายชื่อวิชา", 3900, lvwColumnLeft
   lvReg.ColumnHeaders.Add , , "หน่วยกิต", 900, lvwColumnCenter
   lvReg.ListItems.Clear

End Sub

Private Sub cmdAddSub_Click()
  frmInputSjCode.Show vbModal
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
 Unload frmRegister
End Sub

Private Sub cmdDelSub_Click()
  Dim pers As Object
  Dim a As Integer
  a = 0
  a = lvReg.SelectedItem.Index
  If a <> 0 Then
    Reg.ThSj.RemoveAt (a)
    Reg.ThGrade.RemoveAt (a)
    Reg.ThDate.RemoveAt (a)
     Reg.sys_Save
     cmdDelSub.SetFocus
     LoadData
    ' lvReg.ListItems.Remove (a)
    ' Position = Position - 1
     labCrdInTerm.Caption = Reg.GetCrd()
     cmdDelSub.Enabled = False
   Else: MsgBox "เลือกวิชาที่ต้องการถอนก่อน"
End If
End Sub

Private Sub Form_Load()
    LoadlvReg
    LoadCombo
   cmdDelSub.Enabled = False
    Add = True
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
cmdDelSub.Enabled = True
End Sub

Private Sub txtSdId_LostFocus()
 
  If txtSdId.text = "" Then
      If Not (Reg Is Nothing) Then Reg.sys_close
      Set Reg = cache.New("RegTranH")
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
           ' If Not (Reg Is Nothing) Then Reg.sys_close
           '   Set Reg = cache.New("RegTranH")
           '   Reg.sys_Save
           ' Exit Sub
           ' LoadReg
        Else
'        txtTest.Text = Student.Test
'         cmdAddUpdate.Caption = "แก้ไขประวัติ"
'         cmdDelete.Enabled = True
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
   lvReg.ListItems.Clear
   '  MsgBox " in txtTerm lostfocus"
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
    '               MsgBox " found sd and term and year"
                   LoadData
                   Exit Sub
                 End If
                 Reg.sys_close
    Wend
    If Not (Reg Is Nothing) Then Reg.sys_close
    Set Reg = cache.New("RegTranH")
    Set Reg.ThSd = Sd
    Reg.ThYear = txtYear.text
    Reg.ThTerm = txtTerm.text
    MsgBox "ลงทะเบียนครั้งแรกของนักศึกษารหัส " + txtSdId.text + " ปีการศึกษา" + txtYear.text + " ภาคการศึกษาที่" + txtTerm.text, vbInformation
    Reg.sys_Save
    Exit Sub
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
    Dim temp As Object
    Dim tempobj As Object
    Dim Index As Integer
    Dim idhistkey As String, idhist As Object
    Dim item As ListItem, idcount As Integer
    Dim i As Integer
    Dim oldsjcode As String
    
     Set temp = cache.Static("Subject")
     
        lvReg.ListItems.Clear
        For i = 1 To Reg.ThSj.count()
            Set item = lvReg.ListItems.Add
            Set tempobj = Reg.ThSj.GetAt(i)
             item.text = i
             oldsjcode = temp.ReturnSjCodeAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
              If (oldsjcode <> tempobj.SjCode.GetAt(tempobj.SjCode.count()).val) Then
                 item.SubItems(1) = oldsjcode + " * "
              Else
                 item.SubItems(1) = oldsjcode
              End If

             oldsjcode = temp.ReturnSjNameAt(Reg.ThSj.GetAt(i).sys_Id, Reg.sys_Id, i)
              If (oldsjcode <> tempobj.SjName.GetAt(tempobj.SjName.count()).val) Then
                 item.SubItems(2) = oldsjcode + " * "
              Else
                 item.SubItems(2) = oldsjcode
              End If

               
            '  item.SubItems(1) = tempobj.SjCode.GetAt(tempobj.SjCode.count()).val
            '  item.SubItems(2) = tempobj.SjName.GetAt(tempobj.SjName.count()).val
              item.SubItems(3) = tempobj.SjCrd
              Set tempobj = Nothing
        Next
       labCrdInTerm.Caption = Reg.GetCrd()
       cmdDelSub.Enabled = False
End Sub

Private Sub txtTerm_lostfocus()
    LoadReg
End Sub

