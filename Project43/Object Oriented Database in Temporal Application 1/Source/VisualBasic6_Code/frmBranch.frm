VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{C37EFBE6-BC76-11D2-B65D-0000F87C2780}#1.0#0"; "CACHEQUERY.OCX"
Begin VB.Form frmBranch 
   Caption         =   "สาขาวิชา"
   ClientHeight    =   2580
   ClientLeft      =   1650
   ClientTop       =   1845
   ClientWidth     =   7650
   LinkTopic       =   "Form1"
   ScaleHeight     =   2679.058
   ScaleMode       =   0  'User
   ScaleWidth      =   7644.654
   Begin VB.ListBox lst__Hidden 
      Height          =   270
      Left            =   2970
      TabIndex        =   15
      Top             =   -433
      Visible         =   0   'False
      Width           =   1200
   End
   Begin VB.Frame fra_Main 
      Height          =   2505
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   7575
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
         Left            =   6300
         TabIndex        =   14
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
         Left            =   6300
         TabIndex        =   13
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
         Left            =   6300
         TabIndex        =   12
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
         Left            =   6300
         TabIndex        =   11
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
         Left            =   6300
         TabIndex        =   10
         Top             =   240
         Width           =   1095
      End
      Begin VB.ComboBox cmbBrnDptDptName 
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
         Left            =   2055
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   1275
         Width           =   4003
      End
      Begin VB.TextBox txtBrnNameE 
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
         Left            =   2055
         TabIndex        =   7
         Text            =   "txtBrnNameE"
         Top             =   930
         Width           =   4003
      End
      Begin VB.TextBox txtBrnName 
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
         Left            =   2055
         TabIndex        =   5
         Text            =   "txtBrnName"
         Top             =   585
         Width           =   4003
      End
      Begin VB.TextBox txtBrnCode 
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
         Left            =   2055
         MaxLength       =   2
         TabIndex        =   3
         Text            =   "txtBrnCode"
         Top             =   225
         Width           =   390
      End
      Begin VB.Label lblBrnCode 
         Alignment       =   1  'Right Justify
         Caption         =   "รหัสสาขาวิชา"
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
         Left            =   480
         TabIndex        =   2
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label lblBrnName 
         Alignment       =   1  'Right Justify
         Caption         =   "ชื่อสาขาภาษาไทย"
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
         Left            =   480
         TabIndex        =   4
         Top             =   600
         Width           =   1455
      End
      Begin VB.Label lblBrnNameE 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "ชื่อสาขาภาษาอังกฤษ"
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
         TabIndex        =   6
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label lblBrnDptDptName 
         Alignment       =   1  'Right Justify
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
         Left            =   1305
         TabIndex        =   8
         Top             =   1320
         Width           =   630
      End
   End
   Begin VB.PictureBox picPatch 
      BorderStyle     =   0  'None
      Height          =   246
      Left            =   0
      ScaleHeight     =   240
      ScaleWidth      =   255
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin CACHEQUERYLib.CacheQuery CacheQuery1 
      Left            =   2970
      Top             =   1185
      _Version        =   65536
      _ExtentX        =   847
      _ExtentY        =   847
      _StockProps     =   0
      ClassName       =   ""
      QueryName       =   ""
   End
   Begin MSComDlg.CommonDialog dlgCommon 
      Left            =   2970
      Top             =   1185
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "frmBranch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const m_classname = "Branch"

Private m_factory As Object
Private m_object As Object
Private m_modified As Boolean
Private m_WaitFlag As Integer
Private id As Variant
Private disableclick As Boolean

Private Sub cmbBrnDptDptName_Click()
    If disableclick Then Exit Sub
    Dim Index As Integer
    Dim obj As Object
    
    Index = cmbBrnDptDptName.ListIndex
    m_object.BrnDptSetObjectId lst__Hidden.List(Index)
    m_modified = True
    Set obj = m_object.BrnDpt
    cmbBrnDptDptName.Clear
    If Not obj Is Nothing Then
        cmbBrnDptDptName.AddItem obj.DptName
        disableclick = True
        cmbBrnDptDptName.ListIndex = 0
        disableclick = False
    End If

End Sub

Private Sub cmbBrnDptDptName_DropDown()
    Dim rs As Object
    Dim text As String
    Dim i As Integer
    
    Set rs = m_factory.resultset("Department", "Departments")
    rs.Execute
    text = cmbBrnDptDptName.text
    cmbBrnDptDptName.Clear
    lst__Hidden.Clear
    cmbBrnDptDptName.AddItem ""
    lst__Hidden.AddItem ""
    While rs.Next
        cmbBrnDptDptName.AddItem rs.GetDataByName("FcName")
        lst__Hidden.AddItem rs.GetData(1)
    Wend
    rs.Close
    For i = 0 To cmbBrnDptDptName.ListCount - 1
        If cmbBrnDptDptName.List(i) = text Then
            disableclick = True
            cmbBrnDptDptName.ListIndex = i
            disableclick = False
            Exit For
        End If
    Next

End Sub

Private Sub cmd__Close_Click()
   Unload frmBranch
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


Private Sub txtBrnCode_Change()
    m_modified = True

End Sub

Private Sub txtBrnName_Change()
    m_modified = True

End Sub

Private Sub txtBrnNameE_Change()
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
    m_object.sys_save
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
    lblBrnCode.Enabled = Enabled
    txtBrnCode.Enabled = Enabled
    lblBrnName.Enabled = Enabled
    txtBrnName.Enabled = Enabled
    lblBrnNameE.Enabled = Enabled
    txtBrnNameE.Enabled = Enabled
    lblBrnDptDptName.Enabled = Enabled
    cmbBrnDptDptName.Enabled = Enabled
    cmd__Save.Enabled = Enabled
    cmd__Close.Enabled = Enabled
    cmd__Delete.Enabled = Enabled
End Sub

Private Sub EraseScreen()
    txtBrnCode.text = ""
    txtBrnName.text = ""
    txtBrnNameE.text = ""
    cmbBrnDptDptName.Clear
End Sub

Private Sub SyncObjectToScreen()
    Dim obj As Object
    Dim i As Integer
    Dim item As String
    Dim cnt As String
    txtBrnCode.text = m_object.BrnCode
    txtBrnName.text = m_object.BrnName
    txtBrnNameE.text = m_object.BrnNameE
    Set obj = m_object.BrnDpt
    cmbBrnDptDptName.Clear
    If Not obj Is Nothing Then
        cmbBrnDptDptName.AddItem obj.DptName
        disableclick = True
        cmbBrnDptDptName.ListIndex = 0
        disableclick = False
    End If
End Sub

Private Sub SyncScreenToObject()
    m_object.BrnCode = txtBrnCode.text
    m_object.BrnName = txtBrnName.text
    m_object.BrnNameE = txtBrnNameE.text
End Sub

