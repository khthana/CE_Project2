VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form LoanPayBack 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Loan PayBack"
   ClientHeight    =   7020
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8775
   Icon            =   "LoanPayBack.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7020
   ScaleWidth      =   8775
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "List of Loan PayBacks"
      Height          =   4575
      Left            =   240
      TabIndex        =   8
      Top             =   1920
      Width           =   8295
      Begin VB.CommandButton Command2 
         Caption         =   "&View"
         Height          =   375
         Left            =   1200
         TabIndex        =   2
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "&Create"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7200
         TabIndex        =   4
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   2280
         TabIndex        =   3
         Top             =   4080
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3735
         Left            =   120
         TabIndex        =   0
         ToolTipText     =   "Double Click to view detail..."
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   6588
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Employee Information"
      Height          =   1575
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   8295
      Begin VB.ComboBox EmpCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1320
         TabIndex        =   6
         Text            =   "Combo1"
         Top             =   300
         Width           =   6735
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   6480
         TabIndex        =   17
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   3840
         TabIndex        =   16
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1320
         TabIndex        =   15
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Remaining :"
         Height          =   255
         Index           =   4
         Left            =   5520
         TabIndex        =   14
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "PaidBack :"
         Height          =   255
         Index           =   3
         Left            =   3000
         TabIndex        =   13
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Balance :"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   12
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   1320
         TabIndex        =   11
         Top             =   720
         Width           =   2055
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Loan No. :"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   10
         Top             =   720
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   7
         Top             =   360
         Width           =   975
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   9
      Top             =   6705
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
Attribute VB_Name = "LoanPayBack"
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

MSHFlexGrid1.Cols = 5
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "PayBackDate"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 1200

MSHFlexGrid1.TextMatrix(0, 1) = "Type"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 800

MSHFlexGrid1.TextMatrix(0, 2) = "CalDate"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 1200

MSHFlexGrid1.TextMatrix(0, 3) = "Amount"
MSHFlexGrid1.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(3) = 1200

MSHFlexGrid1.TextMatrix(0, 4) = "Interest"
MSHFlexGrid1.ColAlignment(4) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(4) = 1200

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
tCmd.CommandText = "pr_loan_payback_select_by_loan_no"

Set aPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set aPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
Set aPr(2) = tCmd.CreateParameter("LoanNo", adInteger, adParamInput, 4)

aPr(0).Value = CurCmp
aPr(1).Value = Trim(Left(EmpCb.Text, 10))
aPr(2).Value = CFC(Label2.Caption)

For i = 0 To 2
    tCmd.Parameters.Append aPr(i)
Next i
   
Set tRs = tCmd.Execute

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1
    
    If IsNull(tRs("CalDate")) = True Then
        MSHFlexGrid1.AddItem Format(tRs("PayBackDate"), "dd/MM/yyyy") + Chr(9) + "Cash" + Chr(9) + "N/A" + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Format(tRs("Interest"), "#,##0.00")
    Else
        MSHFlexGrid1.AddItem Format(tRs("PayBackDate"), "dd/MM/yyyy") + Chr(9) + "Payroll" + Chr(9) + Format(tRs("CalDate"), "dd/MM/yyyy") + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Format(tRs("Interest"), "#,##0.00")
    End If

    tRs.MoveNext
Loop

If numRec > 0 Then MSHFlexGrid1.RemoveItem 1

StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_loan_select"

Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Label3(0).Caption = Format(tRs("Balance"), "#,##0.00")
    Label3(1).Caption = Format(tRs("PaidBack"), "#,##0.00")
    Label3(2).Caption = Format(tRs("Balance") - tRs("PaidBack"), "#,##0.00")
Else
    Label3(0).Caption = "N/A"
    Label3(1).Caption = "N/A"
    Label3(2).Caption = "N/A"
End If

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command2_Click()

Dim frmCalled As New LoanPayBackDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ViewDetail Trim(Left(EmpCb.Text, 10)), Label2.Caption, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
Me.Enabled = False

End Sub

Private Sub Command3_Click()

Dim frmCalled As New LoanPayBackDetail

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.CreateDetail Trim(Left(EmpCb.Text, 10)), Label2.Caption
Me.Enabled = False

End Sub

Private Sub Command4_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(4) As New ADODB.Parameter
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
tCmd.CommandText = "pr_loan_payback_delete_cash"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
Set tPr(2) = tCmd.CreateParameter("LoanNo", adInteger, adParamInput, 4, CFC(Label2.Caption))
Set tPr(3) = tCmd.CreateParameter("PayBackDate", adDBTimeStamp, adParamInput, 8, CDateX(MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)))
Set tPr(4) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10, CurUser)

For i = 0 To 4
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Set tRs = Nothing
Set tCmd = Nothing

Command5_Click
frmCaller.Command5_Click

End If

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub Command5_Click()

LoadMSHFlexGrid1

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

End Sub

Public Sub LoanDisplay(ByVal EID As String, ByVal LoanNo As String)
Dim i As Long

EmpCbSelect EID
Label2.Caption = LoanNo

For i = 0 To 2
    Label3(i).Caption = "N/A"
Next i

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
        Exit Sub
    End If
Next i

End Sub

Private Sub MSHFlexGrid1_DblClick()

Command2_Click

End Sub

Public Sub RefreshParent()

frmCaller.Command5_Click

End Sub
