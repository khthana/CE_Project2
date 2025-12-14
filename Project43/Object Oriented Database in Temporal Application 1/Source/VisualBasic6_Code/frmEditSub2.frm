VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmEditSub 
   Caption         =   "Temporal Subject"
   ClientHeight    =   7110
   ClientLeft      =   645
   ClientTop       =   765
   ClientWidth     =   10950
   LinkTopic       =   "Form1"
   ScaleHeight     =   7110
   ScaleWidth      =   10950
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
      Left            =   3720
      TabIndex        =   31
      Top             =   6360
      Width           =   2055
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
      Height          =   615
      Left            =   6120
      TabIndex        =   30
      Top             =   6360
      Width           =   1935
   End
   Begin VB.Frame Frame3 
      Height          =   1815
      Left            =   4680
      TabIndex        =   16
      Top             =   4320
      Width           =   6135
      Begin VB.TextBox txtSjNameETD 
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
         Left            =   4920
         TabIndex        =   37
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox txtSjNameEFD 
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
         Left            =   3480
         TabIndex        =   36
         Top             =   720
         Width           =   1215
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
         Height          =   375
         Left            =   240
         TabIndex        =   29
         Top             =   720
         Width           =   3015
      End
      Begin VB.CommandButton cmdSjNameEDelete 
         Caption         =   "ลบ"
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
         Left            =   3960
         TabIndex        =   27
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton cmdSjNameEUpdate 
         Caption         =   "แก้ไข"
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
         Left            =   2280
         TabIndex        =   26
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton cmdSjNameEAdd 
         Caption         =   "เพิ่ม"
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
         Left            =   720
         TabIndex        =   25
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "ถึงวันที่"
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
         TabIndex        =   20
         Top             =   360
         Width           =   555
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "จากวันที่"
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
         TabIndex        =   19
         Top             =   360
         Width           =   675
      End
      Begin VB.Label Label10 
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
         Left            =   720
         TabIndex        =   18
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame Frame2 
      Height          =   1815
      Left            =   4680
      TabIndex        =   7
      Top             =   2280
      Width           =   6135
      Begin VB.TextBox txtSjNameTD 
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
         Left            =   4800
         TabIndex        =   35
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtSjNameFD 
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
         Left            =   3480
         TabIndex        =   34
         Top             =   720
         Width           =   1215
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
         Height          =   375
         Left            =   240
         TabIndex        =   28
         Top             =   720
         Width           =   3015
      End
      Begin VB.CommandButton cmdSjNameDelete 
         Caption         =   "ลบ"
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
         Left            =   3840
         TabIndex        =   24
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton cmdSjNameUpdate 
         Caption         =   "แก้ไข"
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
         Left            =   2280
         TabIndex        =   23
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton cmdSjNameAdd 
         Caption         =   "เพิ่ม"
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
         Left            =   720
         TabIndex        =   22
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label Label9 
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
         Left            =   840
         TabIndex        =   17
         Top             =   360
         Width           =   1350
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "ถึงวันที่"
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
         TabIndex        =   12
         Top             =   360
         Width           =   555
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "จากวันที่"
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
         TabIndex        =   10
         Top             =   360
         Width           =   675
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1815
      Left            =   4680
      TabIndex        =   6
      Top             =   360
      Width           =   6135
      Begin VB.TextBox txtSjCodeTD 
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
         TabIndex        =   33
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox txtSjCodeFD 
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
         Left            =   3120
         TabIndex        =   32
         Top             =   720
         Width           =   1095
      End
      Begin VB.CommandButton cmdSjCodeUpdate 
         Caption         =   "แก้ไข"
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
         Left            =   2280
         TabIndex        =   21
         Top             =   1200
         Width           =   1095
      End
      Begin VB.CommandButton cmdSjCodeDelete 
         Caption         =   "ลบ"
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
         Left            =   3720
         TabIndex        =   15
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton cmdSjCodeAdd 
         Caption         =   "เพิ่ม"
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
         Left            =   720
         TabIndex        =   14
         Top             =   1200
         Width           =   1095
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
         Height          =   375
         Left            =   240
         MaxLength       =   8
         TabIndex        =   13
         Top             =   720
         Width           =   2655
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "ถึงวันที่"
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
         TabIndex        =   11
         Top             =   360
         Width           =   555
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "จากวันที่"
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
         TabIndex        =   9
         Top             =   360
         Width           =   675
      End
      Begin VB.Label Label4 
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
         TabIndex        =   8
         Top             =   360
         Width           =   630
      End
   End
   Begin MSComctlLib.ListView lvSjNameE 
      Height          =   1455
      Left            =   480
      TabIndex        =   2
      Top             =   4680
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   2566
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
   Begin MSComctlLib.ListView lvSjName 
      Height          =   1455
      Left            =   480
      TabIndex        =   1
      Top             =   2640
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   2566
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
   Begin MSComctlLib.ListView lvSjCode 
      Height          =   1455
      Left            =   480
      TabIndex        =   0
      Top             =   600
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   2566
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
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "ประวัติชื่อวิชาภาษาอังกฤษ"
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
      Left            =   1560
      TabIndex        =   5
      Top             =   4320
      Width           =   2085
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "ประวัติชื่อวิชาภาษาไทย"
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
      Left            =   1560
      TabIndex        =   4
      Top             =   2280
      Width           =   1860
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "ประวัติรหัสวิชา"
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
      Left            =   1920
      TabIndex        =   3
      Top             =   240
      Width           =   1140
   End
End
Attribute VB_Name = "frmEditSub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Subject As Object
Dim SjCodeHistory() As Object
Dim SjNameHistory() As Object
Dim SjNameEHistory() As Object
Dim pers As Object
Dim id As Long
Dim idhistkey As String, idhist As Object
Dim item As ListItem, idcount As Integer
Dim Status As Integer

'Status 0=Search 1=Edit,Add


Private Sub Form_Load()
    Status = 0
    ClearScreen
    LoadlvSj
End Sub

Private Sub LoadlvSj()
    

   lvSjCode.View = lvwReport
   lvSjCode.FullRowSelect = True
   lvSjCode.ColumnHeaders.Clear
   lvSjCode.ColumnHeaders.Add , , "รหัสวิชา", 1300, lvwColumnLeft
   lvSjCode.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSjCode.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSjCode.ListItems.Clear
    
   lvSjName.View = lvwReport
   lvSjName.FullRowSelect = True
   lvSjName.ColumnHeaders.Clear
   lvSjName.ColumnHeaders.Add , , "รหัสวิชา", 1300, lvwColumnLeft
   lvSjName.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSjName.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSjName.ListItems.Clear
   
   lvSjNameE.View = lvwReport
   lvSjNameE.FullRowSelect = True
   lvSjNameE.ColumnHeaders.Clear
   lvSjNameE.ColumnHeaders.Add , , "รหัสวิชา", 1300, lvwColumnLeft
   lvSjNameE.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSjNameE.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSjNameE.ListItems.Clear

   End Sub

Private Sub cmdClear_Click()
    ClearObjects
    ClearScreen
    txtSjCode.SetFocus
    Status = 0
End Sub

Private Sub ClearScreen()
    txtSjCode = ""
    txtSjName = ""
    txtSjNameE = ""
    cmdSjCodeAdd.Enabled = False
    cmdSjNameAdd.Enabled = False
    cmdSjNameEAdd.Enabled = False
    cmdSjCodeDelete.Enabled = False
    cmdSjNameDelete.Enabled = False
    cmdSjNameEDelete.Enabled = False
    cmdSjCodeUpdate.Enabled = False
    cmdSjNameUpdate.Enabled = False
    cmdSjNameEUpdate.Enabled = False
    txtSjCodeFD.text = ""
    txtSjCodeTD.text = ""
    txtSjNameFD.text = ""
    txtSjNameTD.text = ""
    txtSjNameEFD.text = ""
    txtSjNameETD.text = ""
    lvSjCode.ListItems.Clear
    lvSjName.ListItems.Clear
    lvSjNameE.ListItems.Clear
    
  
End Sub

Private Sub ClearObjects()
    If Not Subject Is Nothing Then
        Subject.sys_close
        Set Subject = Nothing
    End If
End Sub


Private Sub txtSjCode_LostFocus()
    ' user keys in SjCode
    If txtSjCode = "" Then
        If Not (Subject Is Nothing) Then Subject.sys_close
        ClearScreen
        Exit Sub
    End If
    
    If Status = 0 Then
        LoadSubject (txtSjCode.text)
    End If
        
End Sub



Private Sub LoadSubject(SubCode As String)
    On Error GoTo objerr
    
    
    ClearObjects
    'Find Oid
    Set pers = cache.Static("Subject")
    'txtSjCodeFD.text = Now
    If txtSjCodeFD.text = "" Then txtSjCodeFD.text = Format(Now, "mm/dd/yyyy")
        id = pers.GiveOidFromSjCode(SubCode, txtSjCodeFD.text)
            
    If id <> 0 Then
        Set Subject = cache.OpenId("Subject", id)
        ClearScreen
        txtSjCode = SubCode
        txtSjCode.SelStart = Len(id) + 1
        txtSjName = Subject.ReturnSjName(id)
        txtSjNameE = Subject.ReturnSjNameE(id)
        
        LoadlvSjCode
        LoadlvSjName
        LoadlvSjNameE
        
        cmdSjCodeAdd.Enabled = True
        cmdSjCodeUpdate.Enabled = True
        cmdSjCodeDelete.Enabled = True
        
        cmdSjNameAdd.Enabled = True
        cmdSjNameUpdate.Enabled = True
        cmdSjNameDelete.Enabled = True
        
        cmdSjNameEAdd.Enabled = True
        cmdSjNameEUpdate.Enabled = True
        cmdSjNameEDelete.Enabled = True
        
        Status = 1
               
        Exit Sub
objerr:
    VBErrorBox "Loadsubject failed"
    ClearScreen
    'Else: txtSjCodeFD.SetFocus
    End If
End Sub


Private Sub LoadlvSjCode()
    'load history and plan of lvSjCode
        lvSjCode.ListItems.Clear
        Erase SjCodeHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Subject.SjCode.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSjCode.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             ReDim Preserve SjCodeHistory(idcount)
             Set SjCodeHistory(idcount) = idhist
             Set idhist = Subject.SjCode.GetNext(idhistkey)
        Loop
End Sub

Private Sub LoadlvSjName()
        'load history and plan of lvSjName
        lvSjName.ListItems.Clear
        Erase SjNameHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Subject.SjName.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSjName.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             ReDim Preserve SjNameHistory(idcount)
             Set SjNameHistory(idcount) = idhist
             Set idhist = Subject.SjName.GetNext(idhistkey)
        Loop
End Sub

Private Sub LoadlvSjNameE()
        'load history and plan of lvSjNameE
        lvSjNameE.ListItems.Clear
        Erase SjNameEHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Subject.SjNameE.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSjNameE.ListItems.Add
             item.text = idhist.val
             Dim a As String
             a = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             ReDim Preserve SjNameEHistory(idcount)
             Set SjNameEHistory(idcount) = idhist
             Set idhist = Subject.SjNameE.GetNext(idhistkey)
        Loop
End Sub

Private Sub cmdSjCodeAdd_Click()
    Dim message As String
    
    Dim dup As Integer
    dup = 0
    
    Set pers = cache.Static("Subject")
    'MsgBox Subject.sys_Id
    id = Subject.sys_Id
    dup = pers.FindSubIdPeriod(txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
    If (dup = 0) Or (dup = id) Then
      message = pers.InsertSSjCode2(id, txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
      MsgBox message, vbOKOnly
      LoadlvSjCode
    Else
    MsgBox "รหัสวิชา " + txtSjCode.text + " เกิดคความซ้ำซ้อนในช่วงเวลาเดียวกัน"
    End If
        
    'Set pers = cache.Static("Subject")
    'id = Subject.sys_Id
   ' message = pers.InsertSSjCode2(id, txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
   ' MsgBox message, vbOKOnly
    'LoadlvSjCode
End Sub

Private Sub cmdSjCodeUpdate_Click()
    'Dim message As String
   ' Dim FromDate As String
    'Dim ToDate As String
    'FromDate = Format(txtSjCodeFD.text, "mm/dd/yyyy")
   ' ToDate = Format(txtSjCodeTD.text, "mm/dd/yyyy")
    'Set pers = cache.Static("Subject")
    'id = Subject.sys_Id
   ' message = pers.UpdateSSjCode2(id, txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
   ' MsgBox message, vbOKOnly
   ' LoadlvSjCode
      Dim message As String
    
    
    Dim dup As Integer
    dup = 0
    
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    dup = pers.FindSubIdPeriod(txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
    If (dup = 0) Or (dup = id) Then
      message = pers.UpdateSSjCode2(id, txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
      MsgBox message, vbOKOnly
      LoadlvSjCode
    Else
    MsgBox "รหัสวิชา " + txtSjCode.text + " เกิดคความซ้ำซ้อนในช่วงเวลาเดียวกัน"
    End If
   
   
End Sub

Private Sub cmdSjCodeDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjCodeFD.text, "mm/dd/yyyy")
    ToDate = Format(txtSjCodeTD.text, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.DeleteSSjCode2(id, txtSjCodeFD.text, txtSjCodeTD.text)
    MsgBox message, vbOKOnly
    LoadlvSjCode
End Sub

Private Sub cmdSjNameAdd_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjNameFD.text, "mm/dd/yyyy")
    ToDate = Format(txtSjNameTD.text, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.InsertSSjName2(id, txtSjName.text, txtSjNameFD.text, txtSjNameTD.text)
    MsgBox message, vbOKOnly
    LoadlvSjName
End Sub

Private Sub cmdSjNameUpdate_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjNameFD.text, "mm/dd/yyyy")
    ToDate = Format(txtSjNameTD.text, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.UpdateSSjName2(id, txtSjName.text, txtSjNameFD.text, txtSjNameTD.text)
    MsgBox message, vbOKOnly
    LoadlvSjName
End Sub

Private Sub cmdSjNameDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjNameFD.text, "mm/dd/yyyy")
    ToDate = Format(txtSjNameTD.text, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.DeleteSSjName2(id, txtSjNameFD.text, txtSjNameTD.text)
    MsgBox message, vbOKOnly
    LoadlvSjName
End Sub

Private Sub cmdSjNameEAdd_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjNameEFD, "mm/dd/yyyy")
    ToDate = Format(txtSjNameETD, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.InsertSSjNameE2(id, txtSjNameE.text, txtSjNameEFD.text, txtSjNameETD.text)
    MsgBox message, vbOKOnly
    LoadlvSjNameE
End Sub

Private Sub cmdSjNameEUpdate_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjNameEFD, "mm/dd/yyyy")
    ToDate = Format(txtSjNameETD, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.UpdateSSjNameE2(id, txtSjNameE.text, txtSjNameEFD.text, txtSjNameETD.text)
    MsgBox message, vbOKOnly
    LoadlvSjNameE
End Sub

Private Sub cmdSjNameEDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjNameEFD, "mm/dd/yyyy")
    ToDate = Format(txtSjNameETD, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.DeleteSSjNameE2(id, txtSjNameEFD.text, txtSjNameETD.text)
    MsgBox message, vbOKOnly
    LoadlvSjNameE
End Sub


Private Sub lvSjCode_DblClick()
   Dim itemselected  As Integer
   itemselected = lvSjCode.SelectedItem.index
   txtSjCode.text = lvSjCode.ListItems(itemselected).text
   txtSjCodeFD.text = lvSjCode.ListItems(itemselected).SubItems(1)
   txtSjCodeTD.text = lvSjCode.ListItems(itemselected).SubItems(2)
   cmdSjCodeAdd.Enabled = True
   cmdSjCodeUpdate.Enabled = True
   cmdSjCodeDelete.Enabled = True
   txtSjCode.SetFocus
   
End Sub



Private Sub lvSjName_DblClick()
   Dim itemselected  As Integer
   itemselected = lvSjName.SelectedItem.index
   txtSjName.text = lvSjName.ListItems(itemselected).text
   txtSjNameFD.text = lvSjName.ListItems(itemselected).SubItems(1)
   txtSjNameTD.text = lvSjName.ListItems(itemselected).SubItems(2)
   cmdSjNameAdd.Enabled = True
   cmdSjNameUpdate.Enabled = True
   cmdSjNameDelete.Enabled = True
   txtSjName.SetFocus
   
End Sub

Private Sub lvSjNameE_DblClick()
   Dim itemselected  As Integer
   itemselected = lvSjNameE.SelectedItem.index
   txtSjNameE.text = lvSjNameE.ListItems(itemselected).text
   txtSjNameEFD.text = lvSjNameE.ListItems(itemselected).SubItems(1)
   txtSjNameETD.text = lvSjNameE.ListItems(itemselected).SubItems(2)
   cmdSjNameEAdd.Enabled = True
   cmdSjNameEUpdate.Enabled = True
   cmdSjNameEDelete.Enabled = True
   txtSjNameE.SetFocus
   
End Sub

Private Sub cmdExit_Click()
  Unload frmEditSub
End Sub

                
