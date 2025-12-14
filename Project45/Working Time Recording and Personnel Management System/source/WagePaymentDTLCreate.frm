VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form WagePaymentDTLCreate 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Create New Wage Payment Detail"
   ClientHeight    =   5925
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9735
   Icon            =   "WagePaymentDTLCreate.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   9735
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Scope"
      Height          =   3855
      Left            =   240
      TabIndex        =   10
      Top             =   1560
      Width           =   9255
      Begin VB.CommandButton Command4 
         Caption         =   "Re&move"
         Height          =   375
         Left            =   6720
         TabIndex        =   4
         Top             =   240
         Width           =   1095
      End
      Begin VB.TextBox TextMSH1 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H00C00000&
         Height          =   275
         Left            =   -120
         MaxLength       =   20
         TabIndex        =   13
         Text            =   "Text1"
         Top             =   3720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "&Reload"
         Height          =   375
         Left            =   7920
         TabIndex        =   5
         Top             =   240
         Width           =   1215
      End
      Begin VB.ComboBox Combo2 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1320
         TabIndex        =   12
         Text            =   "99/99/9999"
         Top             =   300
         Width           =   1335
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3015
         Left            =   120
         TabIndex        =   3
         Top             =   720
         Width           =   9015
         _ExtentX        =   15901
         _ExtentY        =   5318
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   3840
         TabIndex        =   17
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Total :"
         Height          =   255
         Left            =   3000
         TabIndex        =   16
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Cal Date :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   11
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   8280
      TabIndex        =   8
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Generate"
      Height          =   375
      Left            =   8280
      TabIndex        =   6
      Top             =   360
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Payment Method"
      Height          =   1215
      Left            =   240
      TabIndex        =   7
      Top             =   240
      Width           =   7815
      Begin VB.ComboBox Combo1 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         ItemData        =   "WagePaymentDTLCreate.frx":0442
         Left            =   2880
         List            =   "WagePaymentDTLCreate.frx":0455
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   660
         Width           =   3255
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Force to use Payment Method :"
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   720
         Width           =   2655
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Depend on each employee Payment Method setting"
         Height          =   255
         Left            =   240
         TabIndex        =   0
         Top             =   360
         Value           =   -1  'True
         Width           =   4455
      End
      Begin VB.Label Label1 
         Caption         =   " Pay Date :"
         Height          =   255
         Index           =   0
         Left            =   5760
         TabIndex        =   15
         Top             =   0
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Label2"
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   0
         Left            =   6720
         TabIndex        =   14
         Top             =   0
         Width           =   975
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   9
      Top             =   5610
      Width           =   9735
      _ExtentX        =   17171
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
Attribute VB_Name = "WagePaymentDTLCreate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private numRec As Long
Private Sum As Currency

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 6
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

MSHFlexGrid1.TextMatrix(0, 2) = "NetPay"
MSHFlexGrid1.ColAlignment(2) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(2) = 1200

MSHFlexGrid1.TextMatrix(0, 3) = "Paid"
MSHFlexGrid1.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(3) = 1200

MSHFlexGrid1.TextMatrix(0, 4) = "PayAmount"
MSHFlexGrid1.ColAlignment(4) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(4) = 1200

MSHFlexGrid1.TextMatrix(0, 5) = "Balance"
MSHFlexGrid1.ColAlignment(5) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(5) = 1200

End Sub

Private Sub Combo2_Change()

Command3_Click

End Sub

Private Sub Combo2_Click()

Command3_Click

End Sub

Private Sub Command1_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(6) As New ADODB.Parameter
Dim i As Long
Dim j As Long

If numRec = 0 Then
    MsgBox "No record found...", vbExclamation + vbOKOnly
    Exit Sub
End If

If Sum = 0 Then
    MsgBox "Total must be greater than zero...", vbExclamation + vbOKOnly
    Exit Sub
End If

If Option2.Value = True Then

For i = 0 To Combo1.ListCount - 1
    If Combo1.List(i) = Combo1.Text Then GoTo Found
Next i

MsgBox "Invalid Payment Method...", vbCritical + vbOKOnly
Exit Sub
Found:

End If

Command1.Enabled = False

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

For j = 1 To numRec

        If CFC(MSHFlexGrid1.TextMatrix(1, 4)) > 0 And CFC(MSHFlexGrid1.TextMatrix(1, 5)) >= 0 Then

        For i = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next i

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_payment_detail_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("PayDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(2) = tCmd.CreateParameter("PaymentType", adChar, adParamInput, 1)
        Set tPr(3) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(4) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set tPr(5) = tCmd.CreateParameter("PayAmount", adCurrency, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = CDateX(Label2(0).Caption)
        
        If Option1.Value = True Then
            tPr(2).Value = Null
        Else
            tPr(2).Value = Left(Combo1.Text, 1)
        End If
        
        tPr(3).Value = CDateX(Combo2.Text)
        tPr(4).Value = MSHFlexGrid1.TextMatrix(1, 0)
        tPr(5).Value = CFC(MSHFlexGrid1.TextMatrix(1, 4))
        tPr(6).Value = CurUser
        
        For i = 0 To 6
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
        If MSHFlexGrid1.Rows > 2 Then
            MSHFlexGrid1.RemoveItem 1
        Else
            MSHFlexGrid1Clear
        End If
        
        End If
Next j

Set tRs = Nothing
Set tCmd = Nothing

Command1.Enabled = True

Unload Me
frmCaller.Command5_Click
MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault
Command1.Enabled = True

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command4_Click()

TextMSH1.Visible = False

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to remove this record?", vbQuestion + vbYesNo)
If Co = vbYes Then
    If numRec > 1 Then
        MSHFlexGrid1.RemoveItem MSHFlexGrid1.Rowsel
        numRec = numRec - 1
        StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."
    Else
        MSHFlexGrid1Clear
    End If
    
    Calculate
End If

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

ClrScr

End Sub

Sub ClrScr()

Combo1.Text = ""
Combo1.Enabled = False
Option1.Value = True

Label4.Caption = "0.00"

LoadCalDate
MSHFlexGrid1Clear

End Sub

Public Sub Command3_Click()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As ADODB.Parameter
Dim i As Long

For i = 0 To Combo2.ListCount - 1
    If Combo2.List(i) = Combo2.Text Then GoTo Found
Next i

MsgBox "Invalid CalDate/CalDate is not chosen...", vbCritical + vbOKOnly
MSHFlexGrid1Clear
Exit Sub
Found:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_payment_get_wage_cal"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Combo2.Text))

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

MSHFlexGrid1Clear
numRec = 0

Do While Not tRs.EOF

    MSHFlexGrid1.AddItem tRs("EID") + Chr(9) + tRs("EmpName") + Chr(9) + Format(tRs("NetPay"), "#,##0.00") + Chr(9) + Format(tRs("PaidAmount"), "#,##0.00") + Chr(9) + Format(tRs("NetPay") - tRs("PaidAmount"), "#,##0.00") + Chr(9) + "0.00"
    numRec = numRec + 1
    If numRec = 1 Then MSHFlexGrid1.RemoveItem 1
    
    tRs.MoveNext
Loop

Calculate

Set sCmd = Nothing
Set sRs = Nothing

StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub ParamTransfer(ByVal CalDate As String)

Label2(0).Caption = CalDate

End Sub

Private Sub List1_DblClick()

Command1_Click

End Sub

Private Sub Form_Unload(Cancel As Integer)

frmCaller.Enabled = True

End Sub

Private Sub MSHFlexGrid1_EnterCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String

Rowsel = MSHFlexGrid1.Rowsel
Colsel = MSHFlexGrid1.Colsel
Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel)

If Colsel = 4 Then
    TextMSH1.Width = MSHFlexGrid1.CellWidth - 20
    TextMSH1.Height = MSHFlexGrid1.CellHeight - 20
    TextMSH1.Left = MSHFlexGrid1.CellLeft + MSHFlexGrid1.Left
    TextMSH1.Top = MSHFlexGrid1.CellTop + MSHFlexGrid1.Top
    TextMSH1.Text = Value
    TextMSH1.Visible = True
    TextMSH1.SetFocus
Else
    TextMSH1.Visible = False
End If

End Sub

Private Sub MSHFlexGrid1_LeaveCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String


Rowsel = MSHFlexGrid1.Rowsel
Colsel = MSHFlexGrid1.Colsel
Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel)

If TextMSH1.Visible = True Then
    If MSHFlexGrid1.Colsel = 4 And CFC(TextMSH1.Text) > 0 Then
        MSHFlexGrid1.Text = Format(CFC(TextMSH1.Text), "#,##0.00")
        Calculate
    End If
    TextMSH1.Text = ""
End If

End Sub

Private Sub MShFlexGrid1_Scroll()

TextMSH1.Visible = False

End Sub

Private Sub Option1_Click()

Combo1.Enabled = False

End Sub

Private Sub Option2_Click()

Combo1.Enabled = True

End Sub

Public Sub LoadCalDate()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_payment_get_caldate"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)

For i = 0 To 0
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Combo2.Clear

Do While Not tRs.EOF

    Combo2.AddItem Format(tRs("CalDate"), "dd/MM/yyyy")
    
    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub Calculate()
Dim i As Long

Sum = 0
For i = 1 To numRec
    MSHFlexGrid1.TextMatrix(i, 5) = Format(CFC(MSHFlexGrid1.TextMatrix(i, 2)) - CFC(MSHFlexGrid1.TextMatrix(i, 3)) - CFC(MSHFlexGrid1.TextMatrix(i, 4)), "#,##0.00")
    Sum = Sum + CFC(MSHFlexGrid1.TextMatrix(i, 4))
Next i

Label4.Caption = Format(Sum, "#,##0.00")

End Sub

