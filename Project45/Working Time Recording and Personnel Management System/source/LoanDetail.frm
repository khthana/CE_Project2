VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form LoanDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Loan Information"
   ClientHeight    =   6780
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8175
   Icon            =   "LoanDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6780
   ScaleWidth      =   8175
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5400
      TabIndex        =   9
      Top             =   5880
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6720
      TabIndex        =   10
      Top             =   5880
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Loan Information"
      Height          =   5535
      Left            =   240
      TabIndex        =   11
      Top             =   240
      Width           =   7695
      Begin VB.Frame Frame3 
         Caption         =   "Note"
         Height          =   1095
         Left            =   240
         TabIndex        =   28
         Top             =   3280
         Width           =   7215
         Begin VB.TextBox Text7 
            ForeColor       =   &H00C00000&
            Height          =   735
            Index           =   0
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   8
            Text            =   "LoanDetail.frx":0442
            Top             =   240
            Width           =   6975
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Purpose"
         Height          =   1095
         Left            =   240
         TabIndex        =   23
         Top             =   2160
         Width           =   7215
         Begin VB.TextBox Text7 
            ForeColor       =   &H00C00000&
            Height          =   735
            Index           =   2
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   7
            Text            =   "LoanDetail.frx":0448
            Top             =   240
            Width           =   6975
         End
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
         Index           =   3
         Left            =   5760
         MaxLength       =   20
         TabIndex        =   6
         Text            =   "Text4"
         Top             =   1740
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
         Index           =   2
         Left            =   1680
         MaxLength       =   20
         TabIndex        =   5
         Text            =   "1"
         Top             =   1740
         Width           =   1695
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Use Simple Interest Calculation Method"
         Height          =   255
         Left            =   3960
         TabIndex        =   4
         Top             =   1440
         Value           =   1  'Checked
         Width           =   3495
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
         Left            =   5760
         MaxLength       =   20
         TabIndex        =   2
         Text            =   "Text4"
         Top             =   1020
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
         Index           =   0
         Left            =   1680
         MaxLength       =   20
         TabIndex        =   1
         Text            =   "Text4"
         Top             =   1020
         Width           =   1695
      End
      Begin VB.ComboBox EmpCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1680
         TabIndex        =   13
         Text            =   "Combo1"
         Top             =   300
         Width           =   5775
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   5760
         TabIndex        =   0
         Top             =   660
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19726337
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   1680
         TabIndex        =   3
         Top             =   1380
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19726337
         CurrentDate     =   37642
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   6240
         TabIndex        =   34
         Top             =   4560
         Width           =   1215
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   3600
         TabIndex        =   33
         Top             =   4560
         Width           =   1335
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1080
         TabIndex        =   32
         Top             =   4560
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Remaining :"
         Height          =   255
         Index           =   3
         Left            =   5280
         TabIndex        =   31
         Top             =   4560
         Width           =   855
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Paidback :"
         Height          =   255
         Index           =   2
         Left            =   2640
         TabIndex        =   30
         Top             =   4560
         Width           =   855
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Balance :"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   29
         Top             =   4560
         Width           =   855
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   8
         Left            =   1800
         TabIndex        =   27
         Top             =   5160
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   240
         TabIndex        =   26
         Top             =   4920
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   240
         TabIndex        =   25
         Top             =   5160
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   7
         Left            =   1800
         TabIndex        =   24
         Top             =   4920
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Amount per Period :"
         Height          =   255
         Index           =   6
         Left            =   3960
         TabIndex        =   22
         Top             =   1800
         Width           =   1695
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Periods :"
         Height          =   255
         Index           =   5
         Left            =   240
         TabIndex        =   21
         Top             =   1800
         Width           =   855
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Start Payback :"
         Height          =   255
         Index           =   4
         Left            =   240
         TabIndex        =   20
         Top             =   1440
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Interest Rate/Year :"
         Height          =   255
         Index           =   3
         Left            =   3960
         TabIndex        =   19
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Amount :"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   18
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Loan Date :"
         Height          =   255
         Index           =   1
         Left            =   3960
         TabIndex        =   17
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   1680
         TabIndex        =   16
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Loan No. :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   15
         Top             =   720
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "Employee :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   14
         Top             =   360
         Width           =   975
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   12
      Top             =   6465
      Width           =   8175
      _ExtentX        =   14420
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
Attribute VB_Name = "LoanDetail"
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

DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DateFilter(Now)

For i = 0 To 1
    Text4(i).Text = ""
Next i

Text4(2).Text = "1"
Text4(3).Text = ""

Check1.Value = Checked

Text7(0).Text = ""
Text7(2).Text = ""

For i = 0 To 2
    Label4(i).Caption = "0.00"
Next i

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(11) As New ADODB.Parameter
Dim xPr(12) As New ADODB.Parameter
Dim i As Long

If CFC(Text4(0).Text) < 0 Or CFC(Text4(1).Text) < 0 Or CFC(Text4(2).Text) < 0 Or CFC(Text4(3).Text) < 0 Then
    MsgBox "All amount must not be less than zero...", vbCritical + vbOKOnly
    Exit Sub
End If

On Error GoTo ErrHandler

If Text7(0).Text = "" Then Text7(0).Text = " "
If Text7(2).Text = "" Then Text7(2).Text = " "

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_loan_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
        Set tPr(2) = tCmd.CreateParameter("LoanDate", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        Set tPr(3) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8, CFC(Text4(0).Text))
        Set tPr(4) = tCmd.CreateParameter("InterestRate", adCurrency, adParamInput, 8, CFC(Text4(1).Text))
        
        If Check1.Value = Unchecked Then
            Set tPr(5) = tCmd.CreateParameter("SimpleInterestCal", adBoolean, adParamInput, 1, False)
        Else
            Set tPr(5) = tCmd.CreateParameter("SimpleInterestCal", adBoolean, adParamInput, 1, True)
        End If
        
        Set tPr(6) = tCmd.CreateParameter("Purpose", adLongVarChar, adParamInput, Len(Text7(2).Text), Text7(2).Text)
        Set tPr(7) = tCmd.CreateParameter("Note", adLongVarChar, adParamInput, Len(Text7(0).Text), Text7(0).Text)
        Set tPr(8) = tCmd.CreateParameter("StartPayBack", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        Set tPr(9) = tCmd.CreateParameter("Periods", adTinyInt, adParamInput, 1, CFC(Text4(2).Text))
        Set tPr(10) = tCmd.CreateParameter("AmountPerPeriod", adCurrency, adParamInput, 8, CFC(Text4(3).Text))
        Set tPr(11) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 11
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_loan_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set xPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
        Set xPr(2) = tCmd.CreateParameter("LoanNo", adInteger, adParamInput, 4, CFC(Label3.Caption))
        Set xPr(3) = tCmd.CreateParameter("LoanDate", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        Set xPr(4) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8, CFC(Text4(0).Text))
        Set xPr(5) = tCmd.CreateParameter("InterestRate", adCurrency, adParamInput, 8, CFC(Text4(1).Text))
        
        If Check1.Value = Unchecked Then
            Set xPr(6) = tCmd.CreateParameter("SimpleInterestCal", adBoolean, adParamInput, 1, False)
        Else
            Set xPr(6) = tCmd.CreateParameter("SimpleInterestCal", adBoolean, adParamInput, 1, True)
        End If
        
        Set xPr(7) = tCmd.CreateParameter("Purpose", adLongVarChar, adParamInput, Len(Text7(2).Text), Text7(2).Text)
        Set xPr(8) = tCmd.CreateParameter("Note", adLongVarChar, adParamInput, Len(Text7(0).Text), Text7(0).Text)
        Set xPr(9) = tCmd.CreateParameter("StartPayBack", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        Set xPr(10) = tCmd.CreateParameter("Periods", adTinyInt, adParamInput, 1, CFC(Text4(2).Text))
        Set xPr(11) = tCmd.CreateParameter("AmountPerPeriod", adCurrency, adParamInput, 8, CFC(Text4(3).Text))
        Set xPr(12) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 12
            tCmd.Parameters.Append xPr(i)
        Next i

        Set tRs = tCmd.Execute

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
Dim i As Long

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create

For i = 0 To 2
    Label4(i).Caption = "N/A"
Next i
Label3.Caption = "N/A"

End Sub

Public Sub ViewDetail(ByVal EmpID As String, ByVal CodeParam As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

EmpCbSelect EmpID

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_loan_select"

tPr(0) = CurCmp
tPr(1) = Trim(Left(EmpCb.Text, 10))
tPr(2) = CFC(CodeParam)

Set tRs = tCmd.Execute(, tPr)

Label3.Caption = CodeParam
DTPicker1.Value = tRs("LoanDate")
Text4(0).Text = Format(tRs("Amount"), "#,##0.00")
Text4(1).Text = Format(tRs("InterestRate"), "#,##0.0000")
Check1.Value = Abs(CInt(tRs("SimpleInterestCal")))
Text7(2).Text = tRs("Purpose")
Text7(0).Text = tRs("Note")

DTPicker2.Value = tRs("StartPayBack")
Text4(2).Text = Format(tRs("Periods"), "#,##0")
Text4(3).Text = Format(tRs("AmountPerPeriod"), "#,##0.00")

Label4(0).Caption = Format(tRs("Balance"), "#,##0.00")
Label4(1).Caption = Format(tRs("PaidBack"), "#,##0.00")
Label4(2).Caption = Format(tRs("Balance") - tRs("PaidBack"), "#,##0.00")

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

Public Sub ModifyDetail(ByVal EmpID As String, ByVal CodeParam As String)

OldCode = CodeParam

ViewDetail EmpID, CodeParam

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Frame1.Enabled = True
Command1.Enabled = True

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

Sub Calculate()

If CFC(Text4(2).Text) <> 0 Then
    Text4(3).Text = Format(CFC(Text4(0).Text) / CFC(Text4(2).Text), "#,##0.00")
Else
    Text4(3).Text = "0.00"
End If


End Sub

Private Sub Text4_Change(Index As Integer)

If CFC(Text4(2).Text) < 1 Then Text4(2).Text = "1"

Calculate

End Sub
