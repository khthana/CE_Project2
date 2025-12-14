VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{C37EFBE6-BC76-11D2-B65D-0000F87C2780}#1.0#0"; "CACHEQUERY.OCX"
Begin VB.Form frmDepartment 
   Caption         =   "ภาควิชา"
   ClientHeight    =   2880
   ClientLeft      =   1950
   ClientTop       =   1785
   ClientWidth     =   7410
   LinkTopic       =   "Form1"
   ScaleHeight     =   2990.576
   ScaleMode       =   0  'User
   ScaleWidth      =   7404.98
   Begin VB.ListBox lst__Hidden 
      Height          =   270
      Left            =   3090
      TabIndex        =   14
      Top             =   -433
      Visible         =   0   'False
      Width           =   1200
   End
   Begin VB.Frame fra_Main 
      Height          =   2865
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7380
      Begin VB.CommandButton cmd__Close 
         Caption         =   "&Close"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   385
         Left            =   6160
         TabIndex        =   13
         Top             =   1980
         Width           =   1095
      End
      Begin VB.CommandButton cmd__Delete 
         Caption         =   "&Delete"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   385
         Left            =   6160
         TabIndex        =   12
         Top             =   1500
         Width           =   1095
      End
      Begin VB.CommandButton cmd__Save 
         Caption         =   "&Save"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   385
         Left            =   6160
         TabIndex        =   11
         Top             =   1110
         Width           =   1095
      End
      Begin VB.CommandButton cmd__Find 
         Caption         =   "&Find..."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   385
         Left            =   6160
         TabIndex        =   10
         Top             =   630
         Width           =   1095
      End
      Begin VB.CommandButton cmd__New 
         Caption         =   "&New"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   385
         Left            =   6160
         TabIndex        =   9
         Top             =   240
         Width           =   1095
      End
      Begin VB.ComboBox cmbDptFcFcName 
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
         Left            =   1921
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   1271
         Width           =   4003
      End
      Begin VB.TextBox txtDptNameE 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   313
         Left            =   1921
         TabIndex        =   6
         Text            =   "txtDptNameE"
         Top             =   925
         Width           =   4003
      End
      Begin VB.TextBox txtDptName 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   313
         Left            =   1921
         TabIndex        =   4
         Text            =   "txtDptName"
         Top             =   578
         Width           =   4003
      End
      Begin VB.TextBox txtDptCode 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   313
         Left            =   1921
         MaxLength       =   2
         TabIndex        =   2
         Text            =   "txtDptCode"
         Top             =   231
         Width           =   390
      End
      Begin VB.Label lblDptCode 
         Alignment       =   1  'Right Justify
         Caption         =   "รหัสภาควิชา"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   325
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1680
      End
      Begin VB.Label lblDptName 
         Alignment       =   1  'Right Justify
         Caption         =   "ชื่อภาควิชาภาษาไทย"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   325
         Left            =   120
         TabIndex        =   3
         Top             =   600
         Width           =   1680
      End
      Begin VB.Label lblDptNameE 
         Alignment       =   1  'Right Justify
         Caption         =   "ชื่อภาควิชาภาษาอังกฤษ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   325
         Left            =   120
         TabIndex        =   5
         Top             =   960
         Width           =   1680
      End
      Begin VB.Label lblDptFcFcName 
         Alignment       =   1  'Right Justify
         Caption         =   "สังกัดคณะ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   325
         Left            =   120
         TabIndex        =   7
         Top             =   1320
         Width           =   1680
      End
   End
   Begin VB.PictureBox picPatch 
      BorderStyle     =   0  'None
      Height          =   246
      Left            =   0
      ScaleHeight     =   240
      ScaleWidth      =   255
      TabIndex        =   15
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin CACHEQUERYLib.CacheQuery CacheQuery1 
      Left            =   3090
      Top             =   1185
      _Version        =   65536
      _ExtentX        =   847
      _ExtentY        =   847
      _StockProps     =   0
      ClassName       =   ""
      QueryName       =   ""
   End
   Begin MSComDlg.CommonDialog dlgCommon 
      Left            =   3090
      Top             =   1185
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "frmDepartment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const m_classname = "Department"

Private m_factory As Object
Private m_object As Object
Private m_modified As Boolean
Private m_WaitFlag As Integer
Private id As Variant
Private disableclick As Boolean

Private Sub cmbDptFcFcName_Click()
    If disableclick Then Exit Sub
    Dim Index As Integer
    Dim obj As Object
    
    Index = cmbDptFcFcName.ListIndex
    m_object.DptFcSetObjectId lst__Hidden.List(Index)
    m_modified = True
    Set obj = m_object.DptFc
    cmbDptFcFcName.Clear
    If Not obj Is Nothing Then
        cmbDptFcFcName.AddItem obj.FcName
        disableclick = True
        cmbDptFcFcName.ListIndex = 0
        disableclick = False
    End If

End Sub

Private Sub cmbDptFcFcName_DropDown()
    Dim rs As Object
    Dim text As String
    Dim i As Integer
    
    Set rs = m_factory.resultset("Faculty", "Facultys")
    rs.Execute
    text = cmbDptFcFcName.text
    cmbDptFcFcName.Clear
    lst__Hidden.Clear
    cmbDptFcFcName.AddItem ""
    lst__Hidden.AddItem ""
    While rs.Next
        cmbDptFcFcName.AddItem rs.GetDataByName("FcName")
        lst__Hidden.AddItem rs.GetData(1)
    Wend
    rs.Close
    For i = 0 To cmbDptFcFcName.ListCount - 1
        If cmbDptFcFcName.List(i) = text Then
            disableclick = True
            cmbDptFcFcName.ListIndex = i
            disableclick = False
            Exit For
        End If
    Next

End Sub

Private Sub cmd__Close_Click()
   Unload frmDepartment
End Sub

Private Sub cmd__Delete_Click()
    actionDelete

End Sub



Private Sub cmd__Find_Click()
    actionFind

End Sub

Private Sub cmd__New_Click()
    actionNew

End Sub

Private Sub cmd__Save_Click()
    actionSave
    actionClose
End Sub

Private Sub Form_Load()
    Dim sdir As String
    actionClose
    Set m_factory = CreateObject("CacheObject.Factory")
    sdir = m_factory.Connect("Student")
End Sub




Private Sub txtDptCode_Change()
    m_modified = True

End Sub

Private Sub txtDptName_Change()
    m_modified = True

End Sub

Private Sub txtDptNameE_Change()
    m_modified = True

End Sub


Private Sub actionNew()
    actionClose
    Set m_object = m_factory.New(m_classname)
    If m_object Is Nothing Then
         MsgBox "Cannot create new object."
         actionClose
    Else
         EnableScreen True
         SyncObjectToScreen
         m_modified = True
         cmd__Delete.Enabled = False
    End If
End Sub

Private Sub actionFind()
    actionClose
    Set CacheQuery1.Factory = m_factory
    CacheQuery1.classname = m_classname
    CacheQuery1.QueryName = "DptInfo"
    
    id = CacheQuery1.FindId
    If id = "" Then Exit Sub
    Set m_object = m_factory.OpenId(m_classname, id)
    If m_object Is Nothing Then
        MsgBox "Can not open object."
        actionClose
    Else
        EnableScreen True
        SyncObjectToScreen
        m_modified = False
    End If
End Sub

Private Sub actionSave()
    SyncScreenToObject
    On Error GoTo actionSaveError
    BeginWait
    m_object.sys_Save
    EndWait
    m_modified = False
    Exit Sub
actionSaveError:
    EndWait
    MsgBox Err.Description
End Sub

Private Sub actionDelete()
    If id = "" Then
        MsgBox "Unable to delete record (ID unknown).", vbInformation
        Exit Sub
    End If
    If MsgBox("Are you sure that you want to delete this record?", vbYesNo) = vbNo Then Exit Sub
    SyncScreenToObject
    On Error GoTo actionDeleteError
    BeginWait
    m_object.sys_DeleteId (id)
    actionClose
    EndWait
    m_modified = False
    Exit Sub
actionDeleteError:
    EndWait
    MsgBox Err.Description
End Sub

Private Sub actionClose()
    If Not m_object Is Nothing And m_modified Then
      If MsgBox("Do you want to save?", vbYesNo) = vbYes Then actionSave
    End If
    Set m_object = Nothing
    'EnableScreen False
    EraseScreen
    id = ""
    m_modified = False
End Sub

Private Sub actionExit()
    actionClose
    End
End Sub

Private Sub BeginWait()
    'turn on the hourglass cursor;
    'you can nest calls to BeginWait-the cursor is restored
    'after the same number of calls to EndWait

    m_WaitFlag = m_WaitFlag + 1

    Screen.MousePointer = vbHourglass
End Sub

Private Sub EndWait()
    'turn off the hourglass cursor

    If m_WaitFlag <= 0 Then Exit Sub

    m_WaitFlag = m_WaitFlag - 1

    If m_WaitFlag = 0 Then
        Screen.MousePointer = vbDefault
    End If
End Sub

Private Function minmax(val As Long, min As Long, max As Long)
    minmax = val
    If min <> -1 And val < min Then minmax = min
    If max <> -1 And val > max Then minmax = max
End Function

Private Sub EnableScreen(Enabled As Boolean)
    lblDptCode.Enabled = Enabled
    txtDptCode.Enabled = Enabled
    lblDptName.Enabled = Enabled
    txtDptName.Enabled = Enabled
    lblDptNameE.Enabled = Enabled
    txtDptNameE.Enabled = Enabled
    lblDptFcFcName.Enabled = Enabled
    cmbDptFcFcName.Enabled = Enabled
    cmd__Save.Enabled = Enabled
    cmd__Close.Enabled = Enabled
    cmd__Delete.Enabled = Enabled
End Sub

Private Sub EraseScreen()
    txtDptCode.text = ""
    txtDptName.text = ""
    txtDptNameE.text = ""
    cmbDptFcFcName.Clear
End Sub

Private Sub SyncObjectToScreen()
    Dim obj As Object
    Dim i As Integer
    Dim item As String
    Dim cnt As String
    txtDptCode.text = m_object.DptCode
    txtDptName.text = m_object.DptName
    txtDptNameE.text = m_object.DptNameE
    Set obj = m_object.DptFc
    cmbDptFcFcName.Clear
    If Not obj Is Nothing Then
        cmbDptFcFcName.AddItem obj.FcName
        disableclick = True
        cmbDptFcFcName.ListIndex = 0
        disableclick = False
    End If
End Sub

Private Sub SyncScreenToObject()
    m_object.DptCode = txtDptCode.text
    m_object.DptName = txtDptName.text
    m_object.DptNameE = txtDptNameE.text
End Sub

