VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{C37EFBE6-BC76-11D2-B65D-0000F87C2780}#1.0#0"; "CACHEQUERY.OCX"
Begin VB.Form frmFaculty 
   Caption         =   "คณะ"
   ClientHeight    =   2850
   ClientLeft      =   2520
   ClientTop       =   2505
   ClientWidth     =   7890
   LinkTopic       =   "Form1"
   ScaleHeight     =   2959.424
   ScaleMode       =   0  'User
   ScaleWidth      =   7884.475
   Begin VB.Frame fra_Main 
      Height          =   2865
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   7860
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
         Left            =   6285
         TabIndex        =   14
         Top             =   2100
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
         Left            =   6285
         TabIndex        =   13
         Top             =   1620
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
         Left            =   6285
         TabIndex        =   12
         Top             =   1230
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
         Left            =   6285
         TabIndex        =   11
         Top             =   750
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
         Left            =   6285
         TabIndex        =   10
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox txtFcNameE 
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
         Left            =   2040
         TabIndex        =   9
         Text            =   "txtFcNameE"
         Top             =   1395
         Width           =   4003
      End
      Begin VB.TextBox txtFcName 
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
         Left            =   2040
         TabIndex        =   7
         Text            =   "txtFcName"
         Top             =   1050
         Width           =   4003
      End
      Begin VB.TextBox txtFcDean 
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
         Left            =   2040
         TabIndex        =   5
         Text            =   "txtFcDean"
         Top             =   705
         Width           =   4003
      End
      Begin VB.TextBox txtFcCode 
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
         Left            =   2040
         MaxLength       =   2
         TabIndex        =   3
         Text            =   "txtFcCode"
         Top             =   345
         Width           =   390
      End
      Begin VB.Label lblFcCode 
         Alignment       =   1  'Right Justify
         Caption         =   "รหัสคณะ"
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
         Top             =   360
         Width           =   1440
      End
      Begin VB.Label lblFcDean 
         Alignment       =   1  'Right Justify
         Caption         =   "คณะบดี"
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
         Top             =   720
         Width           =   1440
      End
      Begin VB.Label lblFcName 
         Alignment       =   1  'Right Justify
         Caption         =   "ชื่อคณะภาษาไทย"
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
         TabIndex        =   6
         Top             =   1080
         Width           =   1440
      End
      Begin VB.Label lblFcNameE 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "ชื่อคณะภาษาอังกฤษ"
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
         Left            =   270
         TabIndex        =   8
         Top             =   1440
         Width           =   1650
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
Attribute VB_Name = "frmFaculty"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const m_classname = "Faculty"

Private cache1 As Object
Private m_object As Object
Private m_modified As Boolean
Private m_WaitFlag As Integer
Private id As Variant
Private disableclick As Boolean

Private Sub cmd__Close_Click()
  Unload frmFaculty

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
    actionClose
    Dim sdir As String
    actionClose
    Set cache1 = CreateObject("CacheObject.Factory")
    sdir = cache1.Connect("Student")
    'If sdir <> "" Then
    '    m_factory.Connect sdir
    'Else
    
    End Sub



Private Sub txtFcCode_Change()
    m_modified = True

End Sub

Private Sub txtFcDean_Change()
    m_modified = True

End Sub

Private Sub txtFcName_Change()
    m_modified = True

End Sub

Private Sub txtFcNameE_Change()
    m_modified = True

End Sub



Private Sub actionNew()
    actionClose
    Set m_object = cache1.New(m_classname)
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
    Set CacheQuery1.Factory = cache1
    CacheQuery1.classname = m_classname
    CacheQuery1.QueryName = "Facultys"
    
    id = CacheQuery1.FindId
    If id = "" Then Exit Sub
    Set m_object = cache1.OpenId(m_classname, id)
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
    If MsgBox("ต้องการลบข้อมูล ใช่หรือไหม ?", vbYesNo) = vbNo Then Exit Sub
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
   ' EnableScreen False
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
    lblFcCode.Enabled = Enabled
    txtFcCode.Enabled = Enabled
    lblFcDean.Enabled = Enabled
    txtFcDean.Enabled = Enabled
    lblFcName.Enabled = Enabled
    txtFcName.Enabled = Enabled
    lblFcNameE.Enabled = Enabled
    txtFcNameE.Enabled = Enabled
    cmd__Save.Enabled = Enabled
    cmd__Close.Enabled = Enabled
    cmd__Delete.Enabled = Enabled
End Sub

Private Sub EraseScreen()
    txtFcCode.text = ""
    txtFcDean.text = ""
    txtFcName.text = ""
    txtFcNameE.text = ""
End Sub

Private Sub SyncObjectToScreen()
    Dim obj As Object
    Dim i As Integer
    Dim item As String
    Dim cnt As String
    txtFcCode.text = m_object.FcCode
    txtFcDean.text = m_object.FcDean
    txtFcName.text = m_object.FcName
    txtFcNameE.text = m_object.FcNameE
End Sub

Private Sub SyncScreenToObject()
    m_object.FcCode = txtFcCode.text
    m_object.FcDean = txtFcDean.text
    m_object.FcName = txtFcName.text
    m_object.FcNameE = txtFcNameE.text
End Sub

