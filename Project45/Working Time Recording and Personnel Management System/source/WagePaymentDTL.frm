VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form WagePaymentDTL 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Wage Payment Detail"
   ClientHeight    =   6660
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8775
   Icon            =   "WagePaymentDTL.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6660
   ScaleWidth      =   8775
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "List of Wage Payment Detail"
      Height          =   4575
      Left            =   240
      TabIndex        =   8
      Top             =   1560
      Width           =   8295
      Begin VB.CommandButton Command1 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   2280
         TabIndex        =   3
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   3360
         TabIndex        =   4
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7200
         TabIndex        =   5
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
      Begin VB.CommandButton Command2 
         Caption         =   "&View"
         Height          =   375
         Left            =   1200
         TabIndex        =   2
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
         ScrollTrack     =   -1  'True
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Wage Payment Information"
      Height          =   1215
      Left            =   240
      TabIndex        =   7
      Top             =   240
      Width           =   8295
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   5
         Left            =   6600
         TabIndex        =   16
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   4
         Left            =   4080
         TabIndex        =   15
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   3
         Left            =   1440
         TabIndex        =   14
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1440
         TabIndex        =   13
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Net Pay :"
         Height          =   255
         Index           =   5
         Left            =   5640
         TabIndex        =   12
         Top             =   720
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Bank Charge :"
         Height          =   255
         Index           =   4
         Left            =   3000
         TabIndex        =   11
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Pay Amount :"
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   10
         Top             =   720
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Pay Date :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   1335
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   6
      Top             =   6345
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
Attribute VB_Name = "WagePaymentDTL"
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

MSHFlexGrid1.Cols = 10
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "EID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 1200

MSHFlexGrid1.TextMatrix(0, 1) = "Name"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 2500

MSHFlexGrid1.TextMatrix(0, 2) = "CalDate"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 1200

MSHFlexGrid1.TextMatrix(0, 3) = "PaymentType"
MSHFlexGrid1.ColAlignment(3) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(3) = 0

MSHFlexGrid1.TextMatrix(0, 4) = "Payment Method"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 1500

MSHFlexGrid1.TextMatrix(0, 5) = "BankBr"
MSHFlexGrid1.ColAlignment(5) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(5) = 1200

MSHFlexGrid1.TextMatrix(0, 6) = "Account No."
MSHFlexGrid1.ColAlignment(6) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(6) = 1500

MSHFlexGrid1.TextMatrix(0, 7) = "PayAmount"
MSHFlexGrid1.ColAlignment(7) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(7) = 1200

MSHFlexGrid1.TextMatrix(0, 8) = "BankCharge"
MSHFlexGrid1.ColAlignment(8) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(8) = 1200

MSHFlexGrid1.TextMatrix(0, 9) = "NetPay"
MSHFlexGrid1.ColAlignment(9) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(9) = 1200

MSHFlexGrid1.MergeCells = flexMergeRestrictRows
MSHFlexGrid1.MergeCol(0) = True
MSHFlexGrid1.MergeCol(1) = True
MSHFlexGrid1.MergeCol(2) = True
For j = 3 To 9
    MSHFlexGrid1.MergeCol(j) = False
Next j

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim aPr(1) As ADODB.Parameter
Dim i As Long

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_payment_detail_select_by_PayDate"

Set aPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set aPr(1) = tCmd.CreateParameter("PayDate", adDBTimeStamp, adParamInput, 8)

aPr(0).Value = CurCmp
aPr(1).Value = CDateX(Label2(0).Caption)

For i = 0 To 1
    tCmd.Parameters.Append aPr(i)
Next i
   
Set tRs = tCmd.Execute

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1
    
    If IsNull(tRs("BankBrID")) = True Then
        BR$ = ""
    Else
        BR$ = tRs("BankBrID")
    End If
    
    If IsNull(tRs("BankAccount")) = True Then
        BA$ = ""
    Else
        BA$ = tRs("BankAccount")
    End If
    
    MSHFlexGrid1.AddItem tRs("EID") + Chr(9) + tRs("EmpName") + Chr(9) + Format(tRs("CalDate"), "dd/MM/yyyy") + Chr(9) + tRs("PaymentType") + Chr(9) + tRs("PaymentTypeDSC") + Chr(9) + BR$ + Chr(9) + BA$ + Chr(9) + Format(tRs("PayAmount"), "#,##0.00") + Chr(9) + Format(tRs("BankCharge"), "#,##0.00") + Chr(9) + Format(tRs("NetPay"), "#,##0.00")

    tRs.MoveNext
Loop

If numRec > 0 Then MSHFlexGrid1.RemoveItem 1

StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_payment_select"

Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Label2(3).Caption = Format(tRs("PayAmount"), "#,##0.00")
    Label2(4).Caption = Format(tRs("BankCharge"), "#,##0.00")
    Label2(5).Caption = Format(tRs("NetPay"), "#,##0.00")
Else
    Label2(3).Caption = "N/A"
    Label2(4).Caption = "N/A"
    Label2(5).Caption = "N/A"
End If

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command1_Click()

Dim frmCalled As New WagePaymentDTLDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ModifyDetail Label2(0).Caption, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 2), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 1), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 3)
Me.Enabled = False

End Sub

Private Sub Command2_Click()

Dim frmCalled As New WagePaymentDTLDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ViewDetail Label2(0).Caption, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 2), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 1), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 3)
Me.Enabled = False

End Sub

Private Sub Command3_Click()

Dim frmCalled As New WagePaymentDTLCreate

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ParamTransfer Label2(0).Caption
Me.Enabled = False

End Sub

Private Sub Command4_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(5) As New ADODB.Parameter
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
tCmd.CommandText = "pr_wage_payment_detail_delete"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("PayDate", adDBTimeStamp, adParamInput, 8, CDateX(Label2(0).Caption))
Set tPr(2) = tCmd.CreateParameter("PaymentType", adChar, adParamInput, 1, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 3))
Set tPr(3) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 2)))
Set tPr(4) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0))
Set tPr(5) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)

For i = 0 To 5
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
frmCaller.Command5_Click

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

Public Sub DTLDisplay(ByVal PayDate As String)
Dim i As Long

Label2(0).Caption = PayDate

For i = 3 To 5
    Label2(i).Caption = "N/A"
Next i

Command5_Click

End Sub

Private Sub MSHFlexGrid1_DblClick()

Command2_Click

End Sub

