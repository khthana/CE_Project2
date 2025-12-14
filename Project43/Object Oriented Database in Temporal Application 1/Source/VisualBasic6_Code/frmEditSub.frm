VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmEditSub 
   Caption         =   "ประวัติวิชา"
   ClientHeight    =   5775
   ClientLeft      =   1950
   ClientTop       =   1410
   ClientWidth     =   8445
   LinkTopic       =   "Form1"
   ScaleHeight     =   5775
   ScaleWidth      =   8445
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
      Left            =   4440
      TabIndex        =   38
      Top             =   4920
      Width           =   1935
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
      Left            =   2040
      TabIndex        =   37
      Top             =   4920
      Width           =   2055
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   4695
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   8281
      _Version        =   393216
      Style           =   1
      TabHeight       =   520
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "รหัสวิชา"
      TabPicture(0)   =   "frmEditSub.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Frame1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "ชื่อวิชาภาษาไทย"
      TabPicture(1)   =   "frmEditSub.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame2"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "ชื่อวิชาภาษาอังกฤษ"
      TabPicture(2)   =   "frmEditSub.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Frame3"
      Tab(2).ControlCount=   1
      Begin VB.Frame Frame3 
         Height          =   3975
         Left            =   -74880
         TabIndex        =   25
         Top             =   480
         Width           =   7575
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
            Left            =   1440
            TabIndex        =   33
            Top             =   3240
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
            Left            =   3360
            TabIndex        =   32
            Top             =   3240
            Width           =   1215
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
            Left            =   5280
            TabIndex        =   31
            Top             =   3240
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
            TabIndex        =   30
            Top             =   2640
            Width           =   4095
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
            Left            =   4800
            TabIndex        =   29
            Top             =   2640
            Width           =   1215
         End
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
            Left            =   6120
            TabIndex        =   28
            Top             =   2640
            Width           =   1095
         End
         Begin MSComctlLib.ListView lvSjNameE 
            Height          =   1455
            Left            =   240
            TabIndex        =   26
            Top             =   600
            Width           =   7095
            _ExtentX        =   12515
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
            Left            =   1440
            TabIndex        =   36
            Top             =   2280
            Width           =   1575
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
            Left            =   5040
            TabIndex        =   35
            Top             =   2280
            Width           =   675
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
            Left            =   6480
            TabIndex        =   34
            Top             =   2280
            Width           =   555
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
            Left            =   2760
            TabIndex        =   27
            Top             =   240
            Width           =   2085
         End
      End
      Begin VB.Frame Frame2 
         Height          =   3975
         Left            =   -74880
         TabIndex        =   13
         Top             =   480
         Width           =   7575
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
            Left            =   1200
            TabIndex        =   21
            Top             =   3240
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
            Left            =   3240
            TabIndex        =   20
            Top             =   3240
            Width           =   1215
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
            Left            =   5280
            TabIndex        =   19
            Top             =   3240
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
            TabIndex        =   18
            Top             =   2640
            Width           =   3855
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
            Left            =   4440
            TabIndex        =   17
            Top             =   2640
            Width           =   1215
         End
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
            Left            =   5760
            TabIndex        =   16
            Top             =   2640
            Width           =   1215
         End
         Begin MSComctlLib.ListView lvSjName 
            Height          =   1455
            Left            =   240
            TabIndex        =   14
            Top             =   600
            Width           =   7095
            _ExtentX        =   12515
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
            Left            =   4680
            TabIndex        =   24
            Top             =   2280
            Width           =   675
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
            Left            =   6240
            TabIndex        =   23
            Top             =   2280
            Width           =   555
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
            Left            =   1440
            TabIndex        =   22
            Top             =   2280
            Width           =   1350
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
            Left            =   2880
            TabIndex        =   15
            Top             =   240
            Width           =   1860
         End
      End
      Begin VB.Frame Frame1 
         Height          =   3975
         Left            =   360
         TabIndex        =   1
         Top             =   360
         Width           =   7335
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
            Left            =   1680
            MaxLength       =   8
            TabIndex        =   9
            Top             =   2520
            Width           =   1695
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
            Left            =   1440
            TabIndex        =   8
            Top             =   3120
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
            Left            =   5040
            TabIndex        =   7
            Top             =   3120
            Width           =   1215
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
            Left            =   3360
            TabIndex        =   6
            Top             =   3120
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
            Left            =   3600
            TabIndex        =   5
            Top             =   2520
            Width           =   1335
         End
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
            Left            =   5040
            TabIndex        =   4
            Top             =   2520
            Width           =   1335
         End
         Begin MSComctlLib.ListView lvSjCode 
            Height          =   1455
            Left            =   1800
            TabIndex        =   2
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
            Left            =   2400
            TabIndex        =   12
            Top             =   2160
            Width           =   630
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
            Left            =   3960
            TabIndex        =   11
            Top             =   2160
            Width           =   675
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
            Left            =   5400
            TabIndex        =   10
            Top             =   2160
            Width           =   555
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
            Left            =   3240
            TabIndex        =   3
            Top             =   240
            Width           =   1140
         End
      End
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
   lvSjName.ColumnHeaders.Add , , "ชื่อวิชา", 4400, lvwColumnLeft
   lvSjName.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSjName.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSjName.ListItems.Clear
   
   lvSjNameE.View = lvwReport
   lvSjNameE.FullRowSelect = True
   lvSjNameE.ColumnHeaders.Clear
   lvSjNameE.ColumnHeaders.Add , , "ชื่อวิชา", 4400, lvwColumnLeft
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
    
    If txtSjCode = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjCode.SetFocus
       Exit Sub
    End If
    
    If txtSjCodeFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjCodeFD.SetFocus
       Exit Sub
    End If
     
     If txtSjCodeTD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjCodeTD.SetFocus
       Exit Sub
    End If
    
    Set pers = cache.Static("Subject")
    'MsgBox Subject.sys_Id
    id = Subject.sys_Id
    dup = pers.FindSubIdPeriod(txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
    If (dup = 0) Or (dup = id) Then
      message = pers.InsertSSjCode2(id, txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
      'MsgBox message, vbOKOnly
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
        If txtSjCode = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ"
      txtSjCode.SetFocus
      Exit Sub
    End If
    
    If txtSjCodeFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ"
      txtSjCodeFD.SetFocus
            Exit Sub
    End If
     
     If txtSjCodeTD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ"
      txtSjCodeTD.SetFocus
            Exit Sub
    End If
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    dup = pers.FindSubIdPeriod(txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
    If (dup = 0) Or (dup = id) Then
      message = pers.UpdateSSjCode2(id, txtSjCode.text, txtSjCodeFD.text, txtSjCodeTD.text)
      'MsgBox message, vbOKOnly
      LoadlvSjCode
    Else
    MsgBox "รหัสวิชา " + txtSjCode.text + " เกิดคความซ้ำซ้อนในช่วงเวลาเดียวกัน"
    End If
   
   
End Sub

Private Sub cmdSjCodeDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    
    If txtSjCode = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjCode.SetFocus
       Exit Sub
    End If
    
    If txtSjCodeFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjCodeFD.SetFocus
       Exit Sub
    End If
     
     If txtSjCodeTD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjCodeTD.SetFocus
       Exit Sub
    End If
    
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
    If txtSjName = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjName.SetFocus
       Exit Sub
    End If
    
    If txtSjNameFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameFD.SetFocus
       Exit Sub
    End If
     
     If txtSjNameTD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameTD.SetFocus
       Exit Sub
    End If
    
    FromDate = Format(txtSjNameFD.text, "mm/dd/yyyy")
    ToDate = Format(txtSjNameTD.text, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.InsertSSjName2(id, txtSjName.text, txtSjNameFD.text, txtSjNameTD.text)
    'MsgBox message, vbOKOnly
    LoadlvSjName
End Sub

Private Sub cmdSjNameUpdate_Click()
    If txtSjName = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjName.SetFocus
       Exit Sub
    End If
    
    If txtSjNameFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameFD.SetFocus
       Exit Sub
    End If
     
     If txtSjNameTD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameTD.SetFocus
       Exit Sub
    End If
    
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    FromDate = Format(txtSjNameFD.text, "mm/dd/yyyy")
    ToDate = Format(txtSjNameTD.text, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.UpdateSSjName2(id, txtSjName.text, txtSjNameFD.text, txtSjNameTD.text)
    'MsgBox message, vbOKOnly
    LoadlvSjName
End Sub

Private Sub cmdSjNameDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    If txtSjName = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjName.SetFocus
       Exit Sub
    End If
    
    If txtSjNameFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameFD.SetFocus
       Exit Sub
    End If
     
     If txtSjNameTD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameTD.SetFocus
       Exit Sub
    End If
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
    If txtSjNameE = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameE.SetFocus
       Exit Sub
    End If
    
    If txtSjNameEFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameEFD.SetFocus
       Exit Sub
    End If
     
     If txtSjNameETD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameETD.SetFocus
       Exit Sub
    End If
    
    FromDate = Format(txtSjNameEFD, "mm/dd/yyyy")
    ToDate = Format(txtSjNameETD, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.InsertSSjNameE2(id, txtSjNameE.text, txtSjNameEFD.text, txtSjNameETD.text)
    'MsgBox message, vbOKOnly
    LoadlvSjNameE
End Sub

Private Sub cmdSjNameEUpdate_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    If txtSjNameE = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameE.SetFocus
    End If
    
    If txtSjNameEFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameEFD.SetFocus
    End If
     
     If txtSjNameETD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameETD.SetFocus
    End If
    FromDate = Format(txtSjNameEFD, "mm/dd/yyyy")
    ToDate = Format(txtSjNameETD, "mm/dd/yyyy")
    Set pers = cache.Static("Subject")
    id = Subject.sys_Id
    message = pers.UpdateSSjNameE2(id, txtSjNameE.text, txtSjNameEFD.text, txtSjNameETD.text)
    'MsgBox message, vbOKOnly
    LoadlvSjNameE
End Sub

Private Sub cmdSjNameEDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    If txtSjNameE = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameE.SetFocus
    End If
    
    If txtSjNameEFD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameEFD.SetFocus
    End If
     
     If txtSjNameETD = "" Then
      MsgBox "ใส่ข้อมูลให้ครบ", vbInformation
      txtSjNameETD.SetFocus
    End If
    
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
   itemselected = lvSjCode.SelectedItem.Index
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
   itemselected = lvSjName.SelectedItem.Index
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
   itemselected = lvSjNameE.SelectedItem.Index
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

                

