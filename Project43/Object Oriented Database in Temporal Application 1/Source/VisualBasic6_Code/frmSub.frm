VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmSub 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "เพิ่ม/ลบ/แก้ไขวิชา"
   ClientHeight    =   5385
   ClientLeft      =   2070
   ClientTop       =   1830
   ClientWidth     =   7215
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
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5385
   ScaleWidth      =   7215
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdExitSj 
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
      Left            =   5400
      TabIndex        =   10
      Top             =   4440
      Width           =   1455
   End
   Begin VB.CommandButton cmdClearSj 
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
      Left            =   2040
      TabIndex        =   8
      Top             =   4440
      Width           =   1455
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
      Left            =   3720
      TabIndex        =   9
      Top             =   4440
      Width           =   1455
   End
   Begin VB.CommandButton cmdAddUpdateSj 
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
      Left            =   240
      TabIndex        =   7
      Top             =   4440
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Caption         =   "รายวิชา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3615
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   6615
      Begin MSComCtl2.DTPicker dtpSjXTend 
         Height          =   375
         Left            =   2400
         TabIndex        =   20
         Top             =   2400
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   24444930
         CurrentDate     =   36964
      End
      Begin MSComCtl2.DTPicker dtpSjXTbeg 
         Height          =   375
         Left            =   2400
         TabIndex        =   19
         Top             =   1920
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Format          =   24444930
         CurrentDate     =   36964
      End
      Begin VB.ComboBox cboSjFac 
         Height          =   360
         Left            =   2400
         Sorted          =   -1  'True
         TabIndex        =   5
         Top             =   2880
         Width           =   2415
      End
      Begin VB.TextBox txtSjNameE 
         Height          =   315
         Left            =   2400
         TabIndex        =   4
         Top             =   1200
         Width           =   3855
      End
      Begin VB.TextBox txtSjXday 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "d/M/yyyy"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   3
         EndProperty
         Height          =   315
         Left            =   2400
         TabIndex        =   6
         Top             =   1560
         Width           =   1335
      End
      Begin VB.TextBox txtSjCrd 
         Height          =   315
         Left            =   4800
         TabIndex        =   2
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txtSjName 
         Height          =   315
         Left            =   2400
         TabIndex        =   3
         Top             =   840
         Width           =   3855
      End
      Begin VB.TextBox txtSjCode 
         Height          =   315
         Left            =   2400
         MaxLength       =   8
         TabIndex        =   1
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "ตัวอย่าง: (mm/dd/yyyy)"
         Height          =   240
         Left            =   3840
         TabIndex        =   21
         Top             =   1680
         Width           =   1965
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "คณะ"
         Height          =   240
         Left            =   1920
         TabIndex        =   18
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "เวลาสิ้นสุดการสอบ"
         Height          =   240
         Left            =   840
         TabIndex        =   17
         Top             =   2520
         Width           =   1500
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "เวลาเริ่มสอบ"
         Height          =   240
         Left            =   1320
         TabIndex        =   16
         Top             =   2040
         Width           =   990
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "วันสอบ"
         Height          =   240
         Left            =   1680
         TabIndex        =   15
         Top             =   1680
         Width           =   570
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "หน่วยกิต"
         Height          =   240
         Left            =   3840
         TabIndex        =   14
         Top             =   480
         Width           =   690
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อวิชาภาษาอังกฤษ"
         Height          =   240
         Left            =   720
         TabIndex        =   13
         Top             =   1200
         Width           =   1575
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "ชื่อวิชาภาษาไทย"
         Height          =   240
         Left            =   960
         TabIndex        =   12
         Top             =   840
         Width           =   1350
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "รหัสวิชา"
         Height          =   240
         Left            =   1560
         TabIndex        =   11
         Top             =   480
         Width           =   630
      End
   End
End
Attribute VB_Name = "frmSub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Subject As Object
Dim Status As Integer
Dim SjCodeOld As String

'Status 0=Search 1=Edit

Private Sub Form_Load()
    Status = 0
    cmdDeleteSj.Enabled = False
    ClearScreen
    LoadCombo ' load the SjFac combobox
End Sub

Private Sub LoadCombo()
    Dim sjs, fcs As Object
    Dim displays As String, delimd As String, elems() As String
    Dim i As Integer
    Dim GiveId As Long
    Set sjs = cache.Static("Subject")
    Set fcs = cache.Static("Faculty")
    displays = sjs.ReturnNameOfFac
    delimd = Left(displays, 1)
    elems = Split(displays, delimd)
    cboSjFac.Clear
    For i = 1 To UBound(elems)
        cboSjFac.AddItem elems(i)
        GiveId = fcs.GiveOidFromFcName(elems(i))
        cboSjFac.ItemData(cboSjFac.NewIndex) = GiveId
    Next i
End Sub

Private Sub cmdClearSj_Click()
    ClearObjects
    InitObjects
    ClearScreen
    txtSjCode.SetFocus
    Status = 0
End Sub

Private Sub ClearScreen()
    txtSjCode = ""
    txtSjName = ""
    txtSjNameE = ""
    txtSjCrd = ""
    txtSjXday = ""
    dtpSjXTbeg.Value = "00:00:00"
    dtpSjXTend.Value = "00:00:00"
    cboSjFac.text = ""
    cmdAddUpdateSj.Caption = "เพิ่มวิชา"
End Sub

Private Sub ClearObjects()
    If Not Subject Is Nothing Then
        Subject.sys_close
        Set Subject = Nothing
    End If
End Sub

Private Sub InitObjects()
    Set Subject = cache.New("Subject")
End Sub

Private Sub cmdExitSj_Click()
    Unload frmSub
End Sub

Private Sub txtSjCode_LostFocus()
    ' user keys in SjCode
    If txtSjCode = "" Then
        If Not (Subject Is Nothing) Then Subject.sys_close
        Set Subject = cache.New("Subject")
        ClearScreen
        Exit Sub
    Else
        If Status = 0 Then
            LoadSubject (txtSjCode.text)
        End If
    End If
    
End Sub

Private Sub LoadSubject(SubCode As String)
    On Error GoTo objerr
    Dim pers As Object
    Dim id As Long
    ClearObjects
    'Find Oid
    Set pers = cache.Static("Subject")
    id = pers.ReturnSjCodeId(SubCode)
    If id <> 0 Then
        Set Subject = cache.OpenId("Subject", id)
        ClearScreen
        txtSjCode = SubCode
        SjCodeOld = SubCode
        txtSjCode.SelStart = Len(id) + 1
        txtSjName = Subject.ReturnSjName(id)
        txtSjNameE = Subject.ReturnSjNameE(id)
        txtSjCrd = Subject.SjCrd
        
        If Subject.SjXday <> 0 Then
            txtSjXday = Subject.SjXday
        End If
        If Subject.SjXTbeg <> 0 Then
            dtpSjXTbeg.Value = Subject.SjXTbeg
        End If
        If Subject.SjXTend <> 0 Then
            dtpSjXTend.Value = Subject.SjXTend
        End If
        
        'Check SjFac
        If Not Subject.SjFac Is Nothing Then
            cboSjFac = Subject.SjFac.FcName
        End If
        
        cmdAddUpdateSj.Caption = "แก้ไขวิชา"
        cmdDeleteSj.Enabled = True
        Status = 1
        
    End If

    Exit Sub
objerr:
    VBErrorBox "Loadsubject failed"
    ClearScreen
End Sub



Private Sub cmdDeleteSj_Click()
    Dim sc As String
    On Error GoTo DeleteError
    If MsgBox("Do you want to delete subject ?", vbYesNo, "Confirm Delete") = vbYes Then
        sc = Subject.sys_Delete(Subject.sys_Oid())
        On Error GoTo 0
        ClearObjects
        InitObjects
        ClearScreen
    End If
    Exit Sub
DeleteError:
    MsgBox "Delete failed : " & Err.Description
End Sub

Private Sub cmdAddUpdateSj_Click()
    Dim pers As Object
    Dim id As Long
    Dim temp As Object
    Dim message As String
     
    If txtSjCode.text = "" Then
        MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
        txtSjCode.SetFocus
        Exit Sub
    End If
    If cmdAddUpdateSj.Caption = "เพิ่มวิชา" Then
        Set Subject = cache.New("Subject")
    End If
    
    Subject.SjCrd = txtSjCrd.text
    
    Subject.SjXday = txtSjXday.text
    Subject.SjXTbeg = dtpSjXTbeg.Value
    Subject.SjXTend = dtpSjXTend.Value
    
    'check cboSjFac
    id = cboSjFac.ListIndex
    If id <> -1 Then
        id = cboSjFac.ItemData(id)
        Set temp = cache.OpenId("Faculty", id)
        Subject.SjFac = temp
    End If
       
    ' Save (Add or Update)
    On Error GoTo SaveError
    Subject.sys_Save
    On Error GoTo 0
    
    If cmdAddUpdateSj.Caption = "เพิ่มวิชา" Then
         'Set SjCode,SjName,SjNameE
         Set temp = cache.Static("Subject")
         id = temp.ReturnSjCodeId(txtSjCode.text)
         If id = 0 Then
            id = Subject.sys_Id
            message = Subject.InsertNewSj(id, txtSjCode.text, txtSjName.text, txtSjNameE.text)
           ' MsgBox message, vbOKOnly
         End If
    Else
        'Check Oid is not duplicate
         Set temp = cache.Static("Subject")
         id = temp.ReturnSjCodeId(txtSjCode.text)
         If id = 0 Then
            id = Subject.sys_Id
            message = Subject.UpdateNewSj(id, txtSjCode.text, txtSjName.text, txtSjNameE.text)
          '  MsgBox message, vbOKOnly
         Else
            If txtSjCode.text <> SjCodeOld Then
                MsgBox "รหัสวิชาเกิดความซ้ำซ้อน", vbInformation
                Exit Sub
            End If
            message = Subject.UpdateNewSj2(id, txtSjName.text, txtSjNameE.text)
            
            
         End If
    End If
    
    Status = 0
    ClearScreen
    ClearObjects
    InitObjects
    txtSjCode.SetFocus
    
    Exit Sub
SaveError:
    MsgBox "Save failed : " & Err.Description

End Sub







