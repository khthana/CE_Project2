VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form DepartmentDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Department Information"
   ClientHeight    =   3900
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7845
   Icon            =   "DepartmentDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   7845
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6360
      TabIndex        =   4
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5040
      TabIndex        =   3
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Department Information"
      Height          =   2655
      Left            =   240
      TabIndex        =   6
      Top             =   240
      Width           =   7335
      Begin VB.ComboBox DeptbyLVCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         TabIndex        =   18
         Text            =   "Combo1"
         Top             =   660
         Width           =   4935
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Three"
         Height          =   255
         Left            =   6120
         TabIndex        =   17
         Top             =   360
         Width           =   735
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Two"
         Height          =   255
         Left            =   5400
         TabIndex        =   16
         Top             =   360
         Width           =   615
      End
      Begin VB.OptionButton Option1 
         Caption         =   "One"
         Height          =   255
         Left            =   4680
         TabIndex        =   15
         Top             =   360
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.TextBox Text3 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   50
         TabIndex        =   2
         Text            =   "Text3"
         Top             =   1380
         Width           =   4935
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   50
         TabIndex        =   1
         Text            =   "Text2"
         Top             =   1020
         Width           =   4935
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   6
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   300
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Parent Department :"
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   19
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
         Top             =   2160
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
         Top             =   1800
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   12
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   11
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Department Level :"
         Height          =   255
         Index           =   3
         Left            =   3120
         TabIndex        =   10
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Name :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   9
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Name :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   8
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Department Code :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   7
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   3585
      Width           =   7845
      _ExtentX        =   13838
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
Attribute VB_Name = "DepartmentDetail"
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

Text1.Text = ""
Text2.Text = ""
Text3.Text = ""

Option1.Value = True
DeptbyLVCb.Clear
DeptbyLVCb.Enabled = False

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(6) As Variant
Dim xPr(7) As Variant
Dim i As Long

If Option1.Value = False Then
    For i = 0 To DeptbyLVCb.ListCount - 1
        If DeptbyLVCb.Text = DeptbyLVCb.List(i) Then GoTo FoundDeptbyLVCb
    Next i

    MsgBox "Invalid Parent Department Code...", vbCritical + vbOKOnly
    Exit Sub
End If
FoundDeptbyLVCb:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_department_insert"

        tPr(0) = CurCmp
        tPr(1) = Text1.Text
        If Option1.Value = True Then tPr(2) = 1
        If Option2.Value = True Then tPr(2) = 2
        If Option3.Value = True Then tPr(2) = 3
        If Option1.Value = True Then
            tPr(3) = Null
        Else
            tPr(3) = Trim(Left(DeptbyLVCb.Text, 6))
        End If
        tPr(4) = Text2.Text
        tPr(5) = Text3.Text
        tPr(6) = CurUser

        Set tRs = tCmd.Execute(, tPr)
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_department_update"

        xPr(0) = CurCmp
        xPr(1) = OldCode
        xPr(2) = Text1.Text
        If Option1.Value = True Then xPr(3) = 1
        If Option2.Value = True Then xPr(3) = 2
        If Option3.Value = True Then xPr(3) = 3
        If Option1.Value = True Then
            xPr(4) = Null
        Else
            xPr(4) = Trim(Left(DeptbyLVCb.Text, 6))
        End If
        xPr(5) = Text2.Text
        xPr(6) = Text3.Text
        xPr(7) = CurUser

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
Dim tPr(1) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_department_select"

tPr(0) = CurCmp
tPr(1) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("DepartmentCode")
Text2.Text = tRs("TH_DepartmentName")
Text3.Text = tRs("EN_DepartmentName")

Select Case tRs("DeptLevel")
    Case Is = 1
        Option1.Value = True
        Option1_Click
    Case Is = 2
        Option2.Value = True
        Option2_Click
    Case Is = 3
        Option3.Value = True
        Option3_Click
End Select

If IsNull(tRs("ParentDeptCode")) = False Then
    DeptbyLVCbSelect tRs("ParentDeptCode"), tRs("DeptLevel") - 1
Else
    DeptbyLVCb.Clear
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

Sub LoadDeptbyLVCb(ByVal Level As Integer)

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_department_select_by_level"

tPr(0) = CurCmp
tPr(1) = Level

Set tRs = tCmd.Execute(, tPr)

DeptbyLVCb.Clear

Do While Not tRs.EOF

    DeptbyLVCb.AddItem FillSpace(tRs("DepartmentCode"), 6) + " - " + tRs("EN_DepartmentName")

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

Public Sub DeptbyLVCbSelect(ByVal Param As String, ByVal Level As Integer)
Dim i As Long

LoadDeptbyLVCb Level

For i = 0 To DeptbyLVCb.ListCount - 1
    If Trim(Left(DeptbyLVCb.List(i), 6)) = Trim(Param) Then
        DeptbyLVCb.Text = DeptbyLVCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Private Sub Option1_Click()

DeptbyLVCb.Clear
DeptbyLVCb.Enabled = False

End Sub

Private Sub Option2_Click()

LoadDeptbyLVCb 1
DeptbyLVCb.Enabled = True

End Sub

Private Sub Option3_Click()

LoadDeptbyLVCb 2
DeptbyLVCb.Enabled = True

End Sub
