VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form ExportPRDataForBAY 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Export Payroll Data for Bank of Ayudhya PCL."
   ClientHeight    =   6075
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8280
   Icon            =   "ExportPRDataForBAY.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6075
   ScaleWidth      =   8280
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Caption         =   "Export Information"
      Height          =   3975
      Left            =   240
      TabIndex        =   10
      Top             =   1560
      Width           =   7815
      Begin VB.Frame Frame8 
         Caption         =   "Batch No."
         Height          =   735
         Left            =   5280
         TabIndex        =   23
         Top             =   2280
         Width           =   1335
         Begin VB.TextBox Text2 
            Alignment       =   2  'Center
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   240
            MaxLength       =   3
            TabIndex        =   6
            Text            =   "Tx2"
            Top             =   300
            Width           =   855
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Bank Branch"
         Height          =   855
         Left            =   240
         TabIndex        =   22
         Top             =   360
         Width           =   7335
         Begin VB.ComboBox BankBrPrCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   240
            TabIndex        =   0
            Top             =   300
            Width           =   6495
         End
         Begin VB.CommandButton Command3 
            Height          =   315
            Left            =   6720
            Picture         =   "ExportPRDataForBAY.frx":0442
            Style           =   1  'Graphical
            TabIndex        =   1
            Top             =   300
            Width           =   375
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Payroll Pay Date"
         Height          =   735
         Left            =   240
         TabIndex        =   21
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
      Begin VB.Frame Frame4 
         Caption         =   "Customer Code"
         Height          =   735
         Left            =   1920
         TabIndex        =   19
         Top             =   2280
         Width           =   1575
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            ForeColor       =   &H00C00000&
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   20
            Top             =   360
            Width           =   1335
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Destination for Export File"
         Height          =   855
         Left            =   240
         TabIndex        =   18
         Top             =   1320
         Width           =   7335
         Begin VB.TextBox Text1 
            ForeColor       =   &H00C00000&
            Height          =   285
            Left            =   240
            Locked          =   -1  'True
            TabIndex        =   2
            Top             =   300
            Width           =   6495
         End
         Begin VB.CommandButton Command2 
            Height          =   315
            Left            =   6720
            Picture         =   "ExportPRDataForBAY.frx":0784
            Style           =   1  'Graphical
            TabIndex        =   3
            Top             =   300
            Width           =   375
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Pay in Date"
         Height          =   735
         Left            =   3600
         TabIndex        =   17
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
            Format          =   19726337
            CurrentDate     =   37642
         End
      End
      Begin VB.CommandButton Command1 
         Height          =   615
         Left            =   6840
         Picture         =   "ExportPRDataForBAY.frx":0886
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   3120
         Width           =   735
      End
      Begin VB.Frame Frame7 
         Caption         =   "Pay Amount"
         Height          =   615
         Index           =   0
         Left            =   240
         TabIndex        =   15
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
            TabIndex        =   16
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Bank Charge"
         Height          =   615
         Index           =   1
         Left            =   1920
         TabIndex        =   13
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
            TabIndex        =   14
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Total Pay"
         Height          =   615
         Index           =   2
         Left            =   3600
         TabIndex        =   11
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
            TabIndex        =   12
            Top             =   240
            Width           =   1335
         End
      End
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   3060
      TabIndex        =   8
      Top             =   5805
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
      TabIndex        =   9
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   5280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   "dat"
      DialogTitle     =   "Export File"
      FileName        =   "ATPKO12.DAT"
      Filter          =   "*.dat"
   End
   Begin VB.Image Image1 
      Height          =   1200
      Left            =   120
      Picture         =   "ExportPRDataForBAY.frx":0CC8
      Top             =   50
      Width           =   6900
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00FFFFFF&
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      Height          =   1335
      Left            =   0
      Top             =   0
      Width           =   8295
   End
End
Attribute VB_Name = "ExportPRDataForBAY"
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
Dim xRs As New ADODB.Recordset
Dim xCmd As New ADODB.Command
Dim xPr(0) As Variant
Dim ATPKO As String * 130
Dim ATPKO2 As String * 130
Dim ATPKO3 As String * 1
Dim CTX As Integer
Dim XTL As Currency
Dim LR As Integer
Dim i As Long
Dim PID As String * 10

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

On Error GoTo ErrHandler

Set xCmd.ActiveConnection = sConn
xCmd.CommandType = adCmdStoredProc
xCmd.CommandText = "app_company_select"

xPr(0) = CurCmp

Set xRs = xCmd.Execute(, xPr)

If xRs.EOF = False Then
    CmpName$ = UCase(Left(xRs("EN_CompanyName").Value, 30))
Else
    CmpName$ = ""
End If
CmpName$ = CmpName$ + Space(30 - Len(CmpName$))

Co = MsgBox("Do you want to perform this process?", vbQuestion + vbYesNo)
If Co = vbNo Then Exit Sub

'DATE FORMAT FOR TFB : 150501 DDMMYY
xDT$ = Format(DTPicker1.Value, "dd/MM/yyyy")
Mon$ = Mid(xDT$, 4, 2)
Yer$ = Right(xDT$, 2)
xDT$ = Left(xDT$, 2) + Mon$ + Yer$

JH$ = Format(CFC(Text2.Text), "000")

CXQ$ = JH$ + Mon$ + Yer$

If FileExists(Text1.Text) Then DeleteFile Text1.Text

Open Text1.Text For Random As #15 Len = Len(ATPKO)

XTL = 0
i = 0

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

i = 1

Do While Not tRs.EOF
    
     i = i + 1
    
    VX$ = Format(tRs("PayAmount").Value, "0.00")
    VX$ = Left(VX$, Len(VX$) - 3) + Right(VX$, 2)
    VX$ = String(11 - Len(VX$), "0") + VX$
    BKIX$ = tRs("BankAccount").Value
    BKIX$ = Left(BKIX$, 3) + Mid(BKIX$, 5, 1) + Mid(BKIX$, 7, 5) + Mid(BKIX$, 13, 1)
    ENM$ = Left(UCase(tRs("ENName").Value), 20)
    ENM$ = ENM$ + Space(20 - Len(ENM$))
    ATPKO = Mid(BankBrPrCb.Text, 4, 3) + Label2(1).Caption + BKIX$ + ENM$ + VX$ + Space(26) + CXQ$ + Space(48) + Chr$(13) + Chr$(10)
    
    StatusBar1.Panels(1).Text = "Processing...Transaction No. " + Format(i, "#,##0")
    
    Put #15, i, ATPKO
    
    XTL = XTL + tRs("PayAmount").Value

    tRs.MoveNext
Loop

VX$ = Format(XTL, "##0.00")
VX$ = Left(VX$, Len(VX$) - 3) + Right(VX$, 2)
VX$ = String(15 - Len(VX$), "0") + VX$
Nx$ = Format(i - 1, "##0")
Nx$ = String(7 - Len(Nx$), "0") + Nx$

ATPKO = Mid(BankBrPrCb.Text, 4, 3) + Left(Label2(1).Caption, 3) + xDT$ + CmpName$ + "712                           A" + CXQ$ + Nx$ + VX$ + Space(26) + Chr$(13) + Chr$(10)

Put #15, 1, ATPKO

i = i + 1

ATPKO3 = Chr$(26)
Put #15, i, ATPKO3
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
Text2.Text = "001"
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
tPr(1) = "BAY"

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


