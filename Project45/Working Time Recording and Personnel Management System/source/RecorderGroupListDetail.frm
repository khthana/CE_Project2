VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form RecorderGroupListDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Recorder Information"
   ClientHeight    =   3540
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7695
   Icon            =   "RecorderGroupListDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3540
   ScaleWidth      =   7695
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6240
      TabIndex        =   6
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4920
      TabIndex        =   5
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Recorder Information"
      Height          =   2295
      Left            =   240
      TabIndex        =   8
      Top             =   240
      Width           =   7215
      Begin VB.CommandButton Command3 
         Height          =   315
         Left            =   6480
         Picture         =   "RecorderGroupListDetail.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   660
         Width           =   375
      End
      Begin VB.ComboBox RCGCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   660
         Width           =   4575
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Enabled"
         Height          =   255
         Left            =   5880
         TabIndex        =   1
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   50
         TabIndex        =   4
         Text            =   "Text2"
         Top             =   1020
         Width           =   4935
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   5
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   300
         Width           =   735
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "RCG ID :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   15
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1920
         TabIndex        =   14
         Top             =   1800
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   13
         Top             =   1440
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   12
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   11
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Location :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   10
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Recorder ID :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   9
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   3225
      Width           =   7695
      _ExtentX        =   13573
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   14993
            MinWidth        =   14993
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "RecorderGroupListDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub ClrScr()
Dim i As Long

Text1.Text = ""
Text2.Text = ""

LoadRCGCb

Check1.Value = Checked

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(4) As Variant
Dim xPr(5) As Variant
Dim i As Long

For i = 0 To RCGCb.ListCount - 1
    If RCGCb.Text = RCGCb.List(i) Then GoTo FoundRCGCb
Next i

MsgBox "Invalid RCG ID...", vbCritical + vbOKOnly
Exit Sub
FoundRCGCb:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_recordergrouplist_insert"

        tPr(0) = Trim(Left(RCGCb.Text, 3))
        tPr(1) = Text1.Text
        tPr(2) = Text2.Text
        If Check1.Value = Checked Then
            tPr(3) = True
        Else
            tPr(3) = False
        End If
        tPr(4) = CurUser

        Set tRs = tCmd.Execute(, tPr)
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_recordergrouplist_update"

        xPr(0) = OldCode
        xPr(1) = Trim(Left(RCGCb.Text, 3))
        xPr(2) = Text1.Text
        xPr(3) = Text2.Text
        If Check1.Value = Checked Then
            xPr(4) = True
        Else
            xPr(4) = False
        End If
        xPr(5) = CurUser

        Set tRs = tCmd.Execute(, xPr)

    Case Else
        MsgBox "Invalid Form Status...", vbCritical + vbOKOnly
End Select

Set tRs = Nothing
Set tCmd = Nothing

Unload Me
frmCaller.Command5_Click
MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command3_Click()

Dim frmCalled As New RecorderGroup
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub CreateDetail()

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create
Label2(0).Caption = "N/A"
Label2(1).Caption = "N/A"

End Sub

Public Sub ViewDetail(ByVal CodeParam As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_recordergrouplist_select"

tPr(0) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("RecorderID")

RCGCbSelect tRs("RecorderGroupCode")

Text2.Text = tRs("Location")

If tRs("Enabled") = True Then
    Check1.Value = Checked
Else
    Check1.Value = Unchecked
End If

If IsNull(tRs("CreateUserID")) Or IsNull(tRs("CreateDateTime")) Then
    Label2(0).Caption = "N/A"
Else
    Label2(0).Caption = Trim(tRs("CreateUserID")) + " :: " + Format(tRs("CreateDateTime"), "Long Date") + " " + Format(tRs("CreateDateTime"), "Long Time")
End If
If IsNull(tRs("LastModifyUserID")) Or IsNull(tRs("LastModifyDateTime")) Then
    Label2(1).Caption = "N/A"
Else
    Label2(1).Caption = Trim(tRs("LastModifyUserID")) + " :: " + Format(tRs("LastModifyDateTime"), "Long Date") + " " + Format(tRs("LastModifyDateTime"), "Long Time")
End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Public Sub ModifyDetail(ByVal CodeParam As String)

ViewDetail CodeParam

OldCode = CodeParam

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Frame1.Enabled = True
Command1.Enabled = True

End Sub

Public Sub LoadRCGCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_recordergroup_select_all"

Set tRs = tCmd.Execute

RCGCb.Clear

Do While Not tRs.EOF

    RCGCb.AddItem FillSpace(tRs("RecorderGroupCode"), 3) + " - " + tRs("Description")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub RCGCbSelect(ByVal Param As String)
Dim i As Long

LoadRCGCb

For i = 0 To RCGCb.ListCount - 1
    If Trim(Left(RCGCb.List(i), 3)) = Trim(Param) Then
        RCGCb.Text = RCGCb.List(i)
        Exit Sub
    End If
Next i

End Sub

