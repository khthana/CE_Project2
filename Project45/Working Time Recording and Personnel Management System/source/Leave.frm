VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Leave 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Leave Management"
   ClientHeight    =   6615
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8775
   Icon            =   "Leave.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6615
   ScaleWidth      =   8775
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame3 
      Caption         =   "Balances"
      Height          =   1455
      Left            =   240
      TabIndex        =   13
      Top             =   4680
      Width           =   8295
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid3 
         Height          =   1095
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   1931
         _Version        =   393216
         Rows            =   4
         AllowBigSelection=   0   'False
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Employee Information"
      Height          =   855
      Left            =   240
      TabIndex        =   10
      Top             =   240
      Width           =   8295
      Begin VB.CommandButton Command1 
         Height          =   315
         Left            =   7680
         Picture         =   "Leave.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   300
         Width           =   375
      End
      Begin VB.ComboBox EmpCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1320
         TabIndex        =   0
         Text            =   "Combo1"
         Top             =   300
         Width           =   6375
      End
      Begin VB.Label Label1 
         Caption         =   "Employee :"
         Height          =   255
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "List of Leaves"
      Height          =   3375
      Left            =   240
      TabIndex        =   9
      Top             =   1200
      Width           =   8295
      Begin VB.CommandButton Command7 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   2280
         TabIndex        =   5
         Top             =   2760
         Width           =   975
      End
      Begin VB.CommandButton Command2 
         Caption         =   "&View"
         Height          =   375
         Left            =   1200
         TabIndex        =   4
         Top             =   2760
         Width           =   975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "&Create"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   2760
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7200
         TabIndex        =   7
         Top             =   2760
         Width           =   975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   3360
         TabIndex        =   6
         Top             =   2760
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   2415
         Left            =   120
         TabIndex        =   2
         ToolTipText     =   "Double Click to view detail..."
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   4260
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   12
      Top             =   6300
      Width           =   8775
      _ExtentX        =   15478
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
Attribute VB_Name = "Leave"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private numRec As Long
Private frmCaller As Object

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 7
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "ID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 0

MSHFlexGrid1.TextMatrix(0, 1) = "TransDate"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 1200

MSHFlexGrid1.TextMatrix(0, 2) = "LeaveType"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 1200

MSHFlexGrid1.TextMatrix(0, 3) = "TransType"
MSHFlexGrid1.ColAlignment(3) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(3) = 1200

MSHFlexGrid1.TextMatrix(0, 4) = "Amount"
MSHFlexGrid1.ColAlignment(4) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(4) = 1200

MSHFlexGrid1.TextMatrix(0, 5) = "StartDate"
MSHFlexGrid1.ColAlignment(5) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(5) = 1200

MSHFlexGrid1.TextMatrix(0, 6) = "EndDate"
MSHFlexGrid1.ColAlignment(6) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(6) = 1200

End Sub

Sub MSHFlexGrid3Clear()
Dim i As Long
Dim j As Long

MSHFlexGrid3.Cols = 5
MSHFlexGrid3.Clear
For j = 1 To MSHFlexGrid3.Rows - 2
 MSHFlexGrid3.RemoveItem 1
Next j

MSHFlexGrid3.TextMatrix(0, 0) = ""
MSHFlexGrid3.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid3.ColWidth(0) = 2000

MSHFlexGrid3.TextMatrix(0, 1) = "Begining"
MSHFlexGrid3.ColAlignment(1) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(1) = 1400

MSHFlexGrid3.TextMatrix(0, 2) = "Earned"
MSHFlexGrid3.ColAlignment(2) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(2) = 1400

MSHFlexGrid3.TextMatrix(0, 3) = "Used"
MSHFlexGrid3.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(3) = 1400

MSHFlexGrid3.TextMatrix(0, 4) = "Available"
MSHFlexGrid3.ColAlignment(4) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(4) = 1400

MSHFlexGrid3.TextMatrix(1, 0) = "Vacation"

MSHFlexGrid3.AddItem "Sick"
MSHFlexGrid3.AddItem "Personal"

For i = 1 To 3
    For j = 1 To 4
        MSHFlexGrid3.TextMatrix(i, j) = "0.00"
    Next j
Next i

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim aPr(2) As ADODB.Parameter
Dim i As Long

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_leave_history_select_by_EID"

Set aPr(0) = tCmd.CreateParameter("dYear", adInteger, adParamInput, 4)
Set aPr(1) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set aPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)

aPr(0).Value = CurDyr
aPr(1).Value = CurCmp
aPr(2).Value = Trim(Left(EmpCb.Text, 10))

For i = 0 To 2
    tCmd.Parameters.Append aPr(i)
Next i
   
Set tRs = tCmd.Execute

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1
    
    If IsNull(tRs("StartDate")) = False Then
        MSHFlexGrid1.AddItem tRs("ID") + Chr(9) + Format(tRs("TransDate"), "dd/MM/yyyy") + Chr(9) + tRs("LeaveTypeDSC") + Chr(9) + tRs("LVTransTypeDSC") + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Format(tRs("StartDate"), "dd/MM/yyyy") + Chr(9) + Format(tRs("EndDate"), "dd/MM/yyyy")
    Else
        MSHFlexGrid1.AddItem tRs("ID") + Chr(9) + Format(tRs("TransDate"), "dd/MM/yyyy") + Chr(9) + tRs("LeaveTypeDSC") + Chr(9) + tRs("LVTransTypeDSC") + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + "" + Chr(9) + ""
    End If

    tRs.MoveNext
Loop

If numRec > 0 Then MSHFlexGrid1.RemoveItem 1

StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command1_Click()

Dim frmCalled As New Employee
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command2_Click()

Dim frmCalled As New LeaveDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ViewDetail MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
Me.Enabled = False

End Sub

Private Sub Command3_Click()

Dim frmCalled As New LeaveDetail
Dim i As Long

For i = 0 To EmpCb.ListCount - 1
    If EmpCb.Text = EmpCb.List(i) Then GoTo EmpCbFound
Next i

MsgBox "Please choose employee first...", vbExclamation + vbOKOnly
Exit Sub
EmpCbFound:

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.CreateDetail
frmCalled.EmpCbSelect Trim(Left(EmpCb.Text, 10))
Me.Enabled = False

End Sub

Private Sub Command4_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to delete this record?", vbQuestion + vbYesNo)
If Co = vbYes Then

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_leave_history_delete"

Set tPr(0) = tCmd.CreateParameter("ID", adGUID, adParamInput, , MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0))

For i = 0 To 0
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Set tRs = Nothing
Set tCmd = Nothing

Command5_Click

End If

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub Command5_Click()

LoadMSHFlexGrid1
GetHistory

End Sub

Private Sub Command7_Click()

Dim frmCalled As New LeaveDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ModifyDetail MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
Me.Enabled = False

End Sub

Private Sub EmpCb_Change()

Command5_Click

End Sub

Private Sub EmpCb_Click()

Command5_Click

End Sub

Private Sub Form_Load()
    Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
    Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
   
    MSHFlexGrid3Clear
    LoadEmpCb
    Command5_Click
   
End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub LoadEmpCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_employee_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

EmpCb.Clear

Do While Not tRs.EOF

    EmpCb.AddItem FillSpace(tRs("EID"), 10) + " - " + tRs("EN_Title") + tRs("EN_FirstName") + " " + tRs("EN_LastName")
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

Public Sub EmpCbSelect(ByVal Param As String)
Dim i As Long

LoadEmpCb

For i = 0 To EmpCb.ListCount - 1
    If Trim(Left(EmpCb.List(i), 10)) = Trim(Param) Then
        EmpCb.Text = EmpCb.List(i)
        Command5_Click
        Exit Sub
    End If
Next i

End Sub

Private Sub MSHFlexGrid1_DblClick()

Command2_Click

End Sub

Public Sub GetHistory()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As ADODB.Parameter
Dim i As Long
Dim j As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_leave_history_get_available"

Set tPr(0) = tCmd.CreateParameter("dYear", adInteger, adParamInput, 4)
Set tPr(1) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)

tPr(0).Value = CurDyr
tPr(1).Value = CurCmp
tPr(2).Value = Trim(Left(EmpCb.Text, 10))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

If tRs.EOF = False Then
    MSHFlexGrid3.TextMatrix(1, 1) = Format(tRs("LV1BB"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(2, 1) = Format(tRs("LV2BB"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(3, 1) = Format(tRs("LV3BB"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(1, 2) = Format(tRs("LV1earned"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(2, 2) = Format(tRs("LV2earned"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(3, 2) = Format(tRs("LV3earned"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(1, 3) = Format(tRs("LV1used"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(2, 3) = Format(tRs("LV2used"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(3, 3) = Format(tRs("LV3used"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(1, 4) = Format(tRs("LV1Available"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(2, 4) = Format(tRs("LV2Available"), "#,##0.00")
    MSHFlexGrid3.TextMatrix(3, 4) = Format(tRs("LV3Available"), "#,##0.00")
Else
    MSHFlexGrid3.TextMatrix(1, 1) = "0.00"
    MSHFlexGrid3.TextMatrix(2, 1) = "0.00"
    MSHFlexGrid3.TextMatrix(3, 1) = "0.00"
    MSHFlexGrid3.TextMatrix(1, 2) = "0.00"
    MSHFlexGrid3.TextMatrix(2, 2) = "0.00"
    MSHFlexGrid3.TextMatrix(3, 2) = "0.00"
    MSHFlexGrid3.TextMatrix(1, 3) = "0.00"
    MSHFlexGrid3.TextMatrix(2, 3) = "0.00"
    MSHFlexGrid3.TextMatrix(3, 3) = "0.00"
    MSHFlexGrid3.TextMatrix(1, 4) = "0.00"
    MSHFlexGrid3.TextMatrix(2, 4) = "0.00"
    MSHFlexGrid3.TextMatrix(3, 4) = "0.00"
End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

