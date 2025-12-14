VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form LoanPayBackDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Loan PayBack Information"
   ClientHeight    =   4245
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8430
   Icon            =   "LoanPayBackDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   8430
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6960
      TabIndex        =   4
      Top             =   3360
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5640
      TabIndex        =   3
      Top             =   3360
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Loan PayBack Information"
      Height          =   3015
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   7935
      Begin VB.OptionButton Option2 
         Caption         =   "Payroll"
         Enabled         =   0   'False
         Height          =   255
         Left            =   6720
         TabIndex        =   28
         Top             =   720
         Width           =   855
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Cash"
         Enabled         =   0   'False
         Height          =   255
         Left            =   5760
         TabIndex        =   27
         Top             =   720
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.ComboBox EmpCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1800
         TabIndex        =   7
         Text            =   "Combo1"
         Top             =   300
         Width           =   5775
      End
      Begin VB.TextBox Text4 
         Alignment       =   1  'Right Justify
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   285
         Index           =   0
         Left            =   1800
         MaxLength       =   20
         TabIndex        =   1
         Text            =   "Text4"
         Top             =   1380
         Width           =   1695
      End
      Begin VB.TextBox Text4 
         Alignment       =   1  'Right Justify
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   285
         Index           =   1
         Left            =   5880
         MaxLength       =   20
         TabIndex        =   2
         Text            =   "Text4"
         Top             =   1380
         Width           =   1695
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1800
         TabIndex        =   0
         Top             =   1020
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19726337
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   5880
         TabIndex        =   8
         Top             =   1020
         Visible         =   0   'False
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19726337
         CurrentDate     =   37642
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Type :"
         Height          =   255
         Index           =   5
         Left            =   4080
         TabIndex        =   26
         Top             =   720
         Width           =   855
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   25
         Top             =   360
         Width           =   975
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Loan No. :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   24
         Top             =   720
         Width           =   855
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   1800
         TabIndex        =   23
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "PayBack Date :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   22
         Top             =   1080
         Width           =   1335
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Amount :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   21
         Top             =   1440
         Width           =   855
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Interest :"
         Height          =   255
         Index           =   3
         Left            =   4080
         TabIndex        =   20
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Calc. Date :"
         Height          =   255
         Index           =   4
         Left            =   4080
         TabIndex        =   19
         Top             =   1080
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   7
         Left            =   1920
         TabIndex        =   18
         Top             =   2220
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   17
         Top             =   2460
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   16
         Top             =   2220
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   8
         Left            =   1920
         TabIndex        =   15
         Top             =   2460
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "BaseRemain :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   14
         Top             =   1860
         Width           =   1095
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Int.Remain :"
         Height          =   255
         Index           =   2
         Left            =   2760
         TabIndex        =   13
         Top             =   1860
         Width           =   855
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Total :"
         Height          =   255
         Index           =   3
         Left            =   5400
         TabIndex        =   12
         Top             =   1860
         Width           =   855
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1200
         TabIndex        =   11
         Top             =   1860
         Width           =   1215
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   3720
         TabIndex        =   10
         Top             =   1860
         Width           =   1335
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   6360
         TabIndex        =   9
         Top             =   1860
         Width           =   1215
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   6
      Top             =   3930
      Width           =   8430
      _ExtentX        =   14870
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
Attribute VB_Name = "LoanPayBackDetail"
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
Dim i  As Long

EmpCb.Clear

Label3.Caption = ""
Label2(7).Caption = "N/A"
Label2(8).Caption = "N/A"

Option1.Value = True

DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DateFilter(Now)

For i = 0 To 1
    Text4(i).Text = ""
Next i

For i = 0 To 2
    Label4(i).Caption = "0.00"
Next i

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(6) As New ADODB.Parameter
Dim i As Long

If CFC(Text4(0).Text) < 0 Or CFC(Text4(1).Text) < 0 Or (CFC(Text4(0).Text) + CFC(Text4(1).Text)) <= 0 Then
    MsgBox "Invalid Amount...", vbCritical + vbOKOnly
    Exit Sub
End If

If CFC(Text4(0).Text) > CFC(Label4(0).Caption) Then
    MsgBox "PaidBack Base Amount must not be greater than BaseRemain Amount", vbCritical + vbOKOnly
    Exit Sub
End If

If CFC(Text4(1).Text) > CFC(Label4(1).Caption) Then
    MsgBox "PaidBack Interest Amount must not be greater than InterestRemain Amount", vbCritical + vbOKOnly
    Exit Sub
End If

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_loan_payback_insert_cash"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
        Set tPr(2) = tCmd.CreateParameter("LoanNo", adInteger, adParamInput, 4, CFC(Label3.Caption))
        Set tPr(3) = tCmd.CreateParameter("PayBackDate", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        Set tPr(4) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8, CFC(Text4(0).Text))
        Set tPr(5) = tCmd.CreateParameter("Interest", adCurrency, adParamInput, 8, CFC(Text4(1).Text))
        Set tPr(6) = tCmd.CreateParameter("CreateUserID ", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 6
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Else
        MsgBox "Invalid Form Status...", vbCritical + vbOKOnly
End Select

Set tRs = Nothing
Set tCmd = Nothing

Unload Me
frmCaller.Command5_Click
frmCaller.RefreshParent
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

Public Sub CreateDetail(ByVal EID As String, ByVal LoanNo As String)
Dim i As Long

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create

EmpCbSelect EID
Label3.Caption = LoanNo

GetRemain

End Sub

Public Sub ViewDetail(ByVal EID As String, ByVal LoanNo As String, ByVal PayBackDate As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(3) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

EmpCbSelect EID
Label3.Caption = LoanNo

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_loan_payback_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
Set tPr(2) = tCmd.CreateParameter("LoanNo", adInteger, adParamInput, 4, CFC(Label3.Caption))
Set tPr(3) = tCmd.CreateParameter("PayBackDate", adDBTimeStamp, adParamInput, 8, CDateX(PayBackDate))

For i = 0 To 3
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

DTPicker1.Value = tRs("PayBackDate")
Text4(0).Text = Format(tRs("Amount"), "#,##0.00")
Text4(1).Text = Format(tRs("Interest"), "#,##0.00")

If IsNull(tRs("CalDate")) = False Then
    DTPicker2.Value = tRs("CalDate")
    Label2(4).Visible = True
    DTPicker2.Visible = True
    Option2.Value = True
Else
    Label2(4).Visible = False
    DTPicker2.Visible = False
    Option1.Value = True
End If

GetRemain

If IsNull(tRs("CreateUserID")) Or IsNull(tRs("CreateDateTime")) Then
    Label2(7).Caption = "N/A"
Else
    Label2(7).Caption = Trim(tRs("CreateUserID")) + " :: " + Format(tRs("CreateDateTime"), "Long Date") + " " + Format(tRs("CreateDateTime"), "Long Time")
End If
If IsNull(tRs("LastModifyUserID")) Or IsNull(tRs("LastModifyDateTime")) Then
    Label2(8).Caption = "N/A"
Else
    Label2(8).Caption = Trim(tRs("LastModifyUserID")) + " :: " + Format(tRs("LastModifyDateTime"), "Long Date") + " " + Format(tRs("LastModifyDateTime"), "Long Time")
End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub GetRemain()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As Variant

On Error GoTo ErrHandler

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_loan_payback_base_remain"

tPr(0) = CurCmp
tPr(1) = Trim(Left(EmpCb.Text, 10))
tPr(2) = CFC(Label3.Caption)

Set tRs = tCmd.Execute(, tPr)

If tRs.EOF = False Then
    Label4(0).Caption = Format(tRs("BaseRemain"), "#,##0.00")
Else
    Label4(0).Caption = "N/A"
End If

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_loan_payback_interest_remain"

tPr(0) = CurCmp
tPr(1) = Trim(Left(EmpCb.Text, 10))
tPr(2) = CFC(Label3.Caption)

Set tRs = tCmd.Execute(, tPr)

If tRs.EOF = False Then
    Label4(1).Caption = Format(tRs("InterestRemain"), "#,##0.00")
Else
    Label4(1).Caption = "N/A"
End If

Label4(2).Caption = Format(CFC(Label4(0).Caption) + CFC(Label4(1).Caption), "#,##0.00")

Set tRs = Nothing
Set tCmd = Nothing

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

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

