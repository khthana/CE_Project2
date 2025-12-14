VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form ExportPRDataForTFB 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Export Payroll Data for Thai Farmers Bank PCL."
   ClientHeight    =   6075
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8280
   Icon            =   "ExportPRDataForTFB.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6075
   ScaleWidth      =   8280
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   3060
      TabIndex        =   14
      Top             =   5800
      Width           =   5205
      _ExtentX        =   9181
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   0
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   13
      Top             =   5760
      Width           =   8280
      _ExtentX        =   14605
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   9701
            MinWidth        =   9701
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame1 
      Caption         =   "Export Information"
      Height          =   3975
      Left            =   240
      TabIndex        =   7
      Top             =   1560
      Width           =   7815
      Begin VB.Frame Frame7 
         Caption         =   "Total Pay"
         Height          =   615
         Index           =   2
         Left            =   3600
         TabIndex        =   20
         Top             =   3120
         Width           =   1575
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Label1"
            ForeColor       =   &H00C00000&
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   21
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Bank Charge"
         Height          =   615
         Index           =   1
         Left            =   1920
         TabIndex        =   18
         Top             =   3120
         Width           =   1575
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Label1"
            ForeColor       =   &H00C00000&
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   19
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Pay Amount"
         Height          =   615
         Index           =   0
         Left            =   240
         TabIndex        =   16
         Top             =   3120
         Width           =   1575
         Begin VB.Label Label1 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Label1"
            ForeColor       =   &H00C00000&
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   17
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.CommandButton Command1 
         Height          =   615
         Left            =   6840
         Picture         =   "ExportPRDataForTFB.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   3120
         Width           =   735
      End
      Begin VB.Frame Frame6 
         Caption         =   "Pay in Date"
         Height          =   735
         Left            =   3600
         TabIndex        =   12
         Top             =   2280
         Width           =   1575
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   315
            Left            =   120
            TabIndex        =   5
            Top             =   300
            Width           =   1335
            _ExtentX        =   2355
            _ExtentY        =   556
            _Version        =   393216
            Format          =   60751873
            CurrentDate     =   37642
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Destination for Export File"
         Height          =   855
         Left            =   240
         TabIndex        =   11
         Top             =   1320
         Width           =   7335
         Begin VB.CommandButton Command2 
            Height          =   315
            Left            =   6720
            Picture         =   "ExportPRDataForTFB.frx":0884
            Style           =   1  'Graphical
            TabIndex        =   3
            Top             =   300
            Width           =   375
         End
         Begin VB.TextBox Text1 
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   240
            Locked          =   -1  'True
            TabIndex        =   2
            Top             =   300
            Width           =   6495
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Customer Code"
         Height          =   735
         Left            =   1920
         TabIndex        =   10
         Top             =   2280
         Width           =   1575
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            ForeColor       =   &H00C00000&
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   15
            Top             =   360
            Width           =   1335
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Payroll Pay Date"
         Height          =   735
         Left            =   240
         TabIndex        =   9
         Top             =   2280
         Width           =   1575
         Begin VB.ComboBox PayDateCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            TabIndex        =   4
            Text            =   "99/99/9999"
            Top             =   300
            Width           =   1335
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Bank Branch"
         Height          =   855
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   7335
         Begin VB.CommandButton Command3 
            Height          =   315
            Left            =   6720
            Picture         =   "ExportPRDataForTFB.frx":0986
            Style           =   1  'Graphical
            TabIndex        =   1
            Top             =   300
            Width           =   375
         End
         Begin VB.ComboBox BankBrPrCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   240
            TabIndex        =   0
            Top             =   300
            Width           =   6495
         End
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   5280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   "txt"
      DialogTitle     =   "Export File"
      FileName        =   "datafile.txt"
      Filter          =   "*.txt"
   End
   Begin VB.Image Image1 
      Height          =   1155
      Left            =   3960
      Picture         =   "ExportPRDataForTFB.frx":0CC8
      Top             =   120
      Width           =   4110
   End
   Begin VB.Shape Shape1 
      BorderStyle     =   0  'Transparent
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   1455
      Left            =   0
      Top             =   0
      Width           =   8295
   End
End
Attribute VB_Name = "ExportPRDataForTFB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub BankBrPrCb_Change()

BankBrPrCb_Click

End Sub

Private Sub BankBrPrCb_Click()

Label2(1).Caption = Trim(Right(BankBrPrCb.Text, 10))
PayCal

End Sub

Private Sub Command1_Click()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(2) As New ADODB.Parameter
Dim ATPKO As String * 130
Dim ATPKO2 As String * 130
Dim ATPKO3 As String * 1
Dim CTX As Integer
Dim XTL As Currency
Dim LR As Integer
Dim i As Long

For i = 0 To BankBrPrCb.ListCount - 1
    If BankBrPrCb.Text = BankBrPrCb.List(i) Then GoTo BankBrPrCbFound
Next i

MsgBox "Invalid PayRoll-Supported Bank Branch...", vbCritical + vbOKOnly
Exit Sub
BankBrPrCbFound:

For i = 0 To PayDateCb.ListCount - 1
    If PayDateCb.Text = PayDateCb.List(i) Then GoTo PayDateCbFound
Next i

MsgBox "Invalid Pay Date...", vbCritical + vbOKOnly
Exit Sub
PayDateCbFound:

If Text1.Text = "" Then
    MsgBox "Invalid FileName...", vbCritical + vbOKOnly
    Exit Sub
End If

If CFC(Label1(2).Caption) <= 0 Then
    MsgBox "Total Pay must be greater than zero to do this process...", vbCritical + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to perform this process?", vbQuestion + vbYesNo)
If Co = vbNo Then Exit Sub

'DATE FORMAT FOR TFB : 010515 YYMMDD
xDT$ = Format(DTPicker1.Value, "dd/MM/yyyy")
xDT$ = Right(xDT$, 2) + Mid(xDT$, 4, 2) + Left(xDT$, 2)

If FileExists(Text1.Text) Then DeleteFile Text1.Text

Open Text1.Text For Random As #15 Len = Len(ATPKO)

XTL = 0
i = 0

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_data_export_get_payment_by_paydate"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("PayDate", adDBTimeStamp, adParamInput, 8, CDateX(PayDateCb.Text))
Set tPr(2) = tCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8, Trim(Left(BankBrPrCb.Text, 8)))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

i = 0

Do While Not tRs.EOF
    
     i = i + 1
     NO$ = Format(i, "000000")
     VX$ = Format(tRs("PayAmount").Value, "0000000000000.00")
     VX$ = Left(VX$, 13) + Right(VX$, 2)
     BKIX$ = tRs("BankAccount").Value
     BKIX$ = Left(BKIX$, 3) + Mid(BKIX$, 5, 1) + Mid(BKIX$, 7, 5) + Mid(BKIX$, 13, 1)
     FNM$ = tRs("THFsName").Value
     FNM$ = FNM$ + Space(23 - Len(FNM$))
     NME$ = tRs("THName").Value
     NME$ = NME$ + Space(50 - Len(NME$))
     LBX$ = Label2(1).Caption
     LBX$ = Left(LBX$, 3) + Mid(LBX$, 5, 3) + Right(LBX$, 1)
    
     ATPKO = NO$ + " 7106 " + LBX$ + " " + BKIX$ + " " + VX$ + " " + xDT$ + " " + FNM$ + " " + NME$ + Chr$(13) + Chr$(10)
    
     StatusBar1.Panels(1).Text = "Processing...Transaction No. " + Format(i, "#,##0")
    
     Put #15, i, ATPKO
    
     XTL = XTL + tRs("PayAmount").Value

    tRs.MoveNext
Loop

VX$ = Format(XTL, "0000000000000.00")
VX$ = Left(VX$, 13) + Right(VX$, 2)

i = i + 1
Nx$ = Format(i, "000000")

ATPKO = Nx$ + " 9000 " + LBX$ + " 0000000000 " + VX$ + " 000000 " + Space(23) + " " + Space(50) + Chr$(13) + Chr$(10)
Put #15, i, ATPKO

i = i + 1
Nx$ = Format(i, "000000")

ATPKO = Nx$ + " 9100 " + LBX$ + " 0000000000 " + VX$ + " 000000 " + Space(23) + " " + Space(50) + Chr$(13) + Chr$(10)
Put #15, i, ATPKO

Close #15

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault
MsgBox "Process Completed...", vbInformation + vbOKOnly
Command1.Enabled = True
StatusBar1.Panels(1).Text = ""

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly
Command1.Enabled = True
Close #15
StatusBar1.Panels(1).Text = ""

End Sub

Private Sub Command2_Click()
    CommonDialog1.ShowSave
    Text1.Text = CommonDialog1.FileName
End Sub

Private Sub Command3_Click()

Dim frmCalled As New BankBranchPayRoll
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

Text1.Text = ""
LoadBankBrPrCb
DTPicker1.Value = DateFilter(Now)
LoadPayDateCb
PayCal

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub LoadBankBrPrCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_bankbranchpayroll_select_by_BankID"

tPr(0) = CurCmp
tPr(1) = "TFB"

Set tRs = tCmd.Execute(, tPr)

BankBrPrCb.Clear

Do While Not tRs.EOF

    BankBrPrCb.AddItem FillSpace(tRs("BankBrID"), 8) + " - " + tRs("EN_BankBrName") + " Customer ID : " + FillSpace(tRs("CustomerID"), 10)

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

Public Sub BankBrPrCbSelect(ByVal Param As String)
Dim i As Long

LoadBankBrPrCb

For i = 0 To BankBrPrCb.ListCount - 1
    If Trim(Left(BankBrPrCb.List(i), 8)) = Trim(Param) Then
        BankBrPrCb.Text = BankBrPrCb.List(i)
        BankBrPrCb_Click
        Exit Sub
    End If
Next i

End Sub

Public Sub LoadPayDateCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_data_export_get_paydate"

tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

PayDateCb.Clear

Do While Not tRs.EOF

    PayDateCb.AddItem Format(tRs("PayDate"), "dd/MM/yyyy")

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

Sub PayCal()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(2) As New ADODB.Parameter
Dim i As Long

Label1(0).Caption = "N/A"
Label1(1).Caption = "N/A"
Label1(2).Caption = "N/A"

For i = 0 To BankBrPrCb.ListCount - 1
    If BankBrPrCb.Text = BankBrPrCb.List(i) Then GoTo BankBrPrCbFound
Next i

Exit Sub
BankBrPrCbFound:

For i = 0 To PayDateCb.ListCount - 1
    If PayDateCb.Text = PayDateCb.List(i) Then GoTo PayDateCbFound
Next i

Exit Sub
PayDateCbFound:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_data_export_get_paydate_info"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("PayDate", adDBTimeStamp, adParamInput, 8, CDateX(PayDateCb.Text))
Set tPr(2) = tCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8, Trim(Left(BankBrPrCb.Text, 8)))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Label1(0).Caption = Format(tRs("PayAmount"), "#,##0.00")
    Label1(1).Caption = Format(tRs("BankCharge"), "#,##0.00")
    Label1(2).Caption = Format(tRs("NetPay"), "#,##0.00")
End If

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub PayDateCb_Change()

PayCal

End Sub

Private Sub PayDateCb_Click()

PayCal

End Sub
