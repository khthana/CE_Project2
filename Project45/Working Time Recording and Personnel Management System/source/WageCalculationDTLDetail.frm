VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form WageCalculationDTLDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Wage Calculation Detail Information"
   ClientHeight    =   7725
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11025
   Icon            =   "WageCalculationDTLDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7725
   ScaleWidth      =   11025
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command6 
      Caption         =   "&Leave"
      Height          =   375
      Left            =   6720
      TabIndex        =   7
      Top             =   6840
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "Wage Calculation Detail Information"
      Height          =   5280
      Left            =   240
      TabIndex        =   22
      Top             =   1460
      Width           =   10575
      Begin VB.CommandButton Command5 
         Caption         =   "&Clear All"
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   4680
         Width           =   1215
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Import &Loan"
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   4200
         Width           =   1215
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Import &TS"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   3720
         Width           =   1215
      End
      Begin VB.Frame Frame5 
         Caption         =   "Wage Calculation Summary"
         Height          =   1455
         Left            =   1440
         TabIndex        =   31
         Top             =   3640
         Width           =   9015
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid3 
            Height          =   1095
            Left            =   120
            TabIndex        =   32
            Top             =   240
            Width           =   8775
            _ExtentX        =   15478
            _ExtentY        =   1931
            _Version        =   393216
            Rows            =   4
            AllowBigSelection=   0   'False
            AllowUserResizing=   1
            _NumberOfBands  =   1
            _Band(0).Cols   =   2
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Deduction"
         Height          =   1695
         Left            =   120
         TabIndex        =   24
         Top             =   1940
         Width           =   10335
         Begin VB.TextBox TextMSH2 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            ForeColor       =   &H00C00000&
            Height          =   275
            Left            =   0
            MaxLength       =   20
            TabIndex        =   3
            Text            =   "Text1"
            Top             =   1440
            Visible         =   0   'False
            Width           =   975
         End
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid2 
            Height          =   1335
            Left            =   120
            TabIndex        =   2
            Top             =   240
            Width           =   10095
            _ExtentX        =   17806
            _ExtentY        =   2355
            _Version        =   393216
            FixedCols       =   0
            AllowBigSelection=   0   'False
            AllowUserResizing=   1
            _NumberOfBands  =   1
            _Band(0).Cols   =   2
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Incomes"
         Height          =   1695
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Width           =   10335
         Begin VB.TextBox TextMSH1 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            ForeColor       =   &H00C00000&
            Height          =   275
            Left            =   0
            MaxLength       =   20
            TabIndex        =   1
            Text            =   "Text1"
            Top             =   1440
            Visible         =   0   'False
            Width           =   975
         End
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
            Height          =   1335
            Left            =   120
            TabIndex        =   0
            Top             =   240
            Width           =   10095
            _ExtentX        =   17806
            _ExtentY        =   2355
            _Version        =   393216
            FixedCols       =   0
            AllowBigSelection=   0   'False
            AllowUserResizing=   1
            _NumberOfBands  =   1
            _Band(0).Cols   =   2
         End
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   8280
      TabIndex        =   8
      Top             =   6840
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   9600
      TabIndex        =   9
      Top             =   6840
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Employee Information"
      Height          =   1215
      Left            =   240
      TabIndex        =   10
      Top             =   240
      Width           =   10575
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   4
         Left            =   5640
         TabIndex        =   30
         Top             =   840
         Width           =   4575
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   3
         Left            =   1200
         TabIndex        =   29
         Top             =   840
         Width           =   2895
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   5640
         TabIndex        =   28
         Top             =   600
         Width           =   4575
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1200
         TabIndex        =   27
         Top             =   600
         Width           =   3015
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1200
         TabIndex        =   26
         Top             =   360
         Width           =   8775
      End
      Begin VB.Label Label3 
         Caption         =   "Label3"
         ForeColor       =   &H000000C0&
         Height          =   255
         Left            =   9480
         TabIndex        =   25
         Top             =   0
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   " Cal. Date :"
         Height          =   255
         Index           =   7
         Left            =   8520
         TabIndex        =   21
         Top             =   0
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Branch :"
         Height          =   255
         Index           =   4
         Left            =   240
         TabIndex        =   15
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Payment :"
         Height          =   255
         Index           =   3
         Left            =   4440
         TabIndex        =   14
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Position :"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   13
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Department :"
         Height          =   255
         Index           =   1
         Left            =   4440
         TabIndex        =   12
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   975
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   16
      Top             =   7410
      Width           =   11025
      _ExtentX        =   19447
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
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   1
      Left            =   1560
      TabIndex        =   20
      Top             =   7080
      Width           =   3975
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   0
      Left            =   1560
      TabIndex        =   19
      Top             =   6840
      Width           =   3975
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Last Modified by :"
      Height          =   255
      Index           =   6
      Left            =   240
      TabIndex        =   18
      Top             =   7080
      Width           =   1455
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Created by :"
      Height          =   255
      Index           =   5
      Left            =   240
      TabIndex        =   17
      Top             =   6840
      Width           =   1455
   End
End
Attribute VB_Name = "WageCalculationDTLDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private incRec As Long
Private dedRec As Long
Private Minc As Currency
Private Mded As Currency
Private Mtsp(2) As Currency
Private Yinc As Currency
Private Yded As Currency
Private Ytsp(2) As Currency
Private dedtaxable As Currency
Private dedswfable As Currency
Private dedpdfable As Currency
Private inctaxable As Currency
Private incswfable As Currency
Private incpdfable As Currency

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 13
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "IncomesCode"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 0

MSHFlexGrid1.TextMatrix(0, 1) = "Incomes"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 2500

MSHFlexGrid1.TextMatrix(0, 2) = "F"
MSHFlexGrid1.ColAlignment(2) = flexAlignCenterCenter
MSHFlexGrid1.ColWidth(2) = 200

MSHFlexGrid1.TextMatrix(0, 3) = "T"
MSHFlexGrid1.ColAlignment(3) = flexAlignCenterCenter
MSHFlexGrid1.ColWidth(3) = 200

MSHFlexGrid1.TextMatrix(0, 4) = "JobCode"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 1100

MSHFlexGrid1.TextMatrix(0, 5) = "CalMethodCode"
MSHFlexGrid1.ColAlignment(5) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(5) = 0

MSHFlexGrid1.TextMatrix(0, 6) = "CalMethod"
MSHFlexGrid1.ColAlignment(6) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(6) = 1500

MSHFlexGrid1.TextMatrix(0, 7) = "Quantity"
MSHFlexGrid1.ColAlignment(7) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(7) = 1200

MSHFlexGrid1.TextMatrix(0, 8) = "Rate"
MSHFlexGrid1.ColAlignment(8) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(8) = 1200

MSHFlexGrid1.TextMatrix(0, 9) = "Amount"
MSHFlexGrid1.ColAlignment(9) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(9) = 1200

MSHFlexGrid1.TextMatrix(0, 10) = "t"
MSHFlexGrid1.ColAlignment(10) = flexAlignCenterCenter
MSHFlexGrid1.ColWidth(10) = 200

MSHFlexGrid1.TextMatrix(0, 11) = "s"
MSHFlexGrid1.ColAlignment(11) = flexAlignCenterCenter
MSHFlexGrid1.ColWidth(11) = 200

MSHFlexGrid1.TextMatrix(0, 12) = "p"
MSHFlexGrid1.ColAlignment(12) = flexAlignCenterCenter
MSHFlexGrid1.ColWidth(12) = 200

MSHFlexGrid1.MergeCells = flexMergeRestrictRows
MSHFlexGrid1.MergeCol(0) = True
MSHFlexGrid1.MergeCol(1) = True
For j = 2 To 12
    MSHFlexGrid1.MergeCol(j) = False
Next j

End Sub

Sub MSHFlexGrid2Clear()
Dim j As Long

MSHFlexGrid2.Cols = 14
MSHFlexGrid2.Clear
For j = 1 To MSHFlexGrid2.Rows - 2
 MSHFlexGrid2.RemoveItem 1
Next j

MSHFlexGrid2.TextMatrix(0, 0) = "DeductionCode"
MSHFlexGrid2.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(0) = 0

MSHFlexGrid2.TextMatrix(0, 1) = "Deduction"
MSHFlexGrid2.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(1) = 2500

MSHFlexGrid2.TextMatrix(0, 2) = "F"
MSHFlexGrid2.ColAlignment(2) = flexAlignCenterCenter
MSHFlexGrid2.ColWidth(2) = 200

MSHFlexGrid2.TextMatrix(0, 3) = "P"
MSHFlexGrid2.ColAlignment(3) = flexAlignCenterCenter
MSHFlexGrid2.ColWidth(3) = 200

MSHFlexGrid2.TextMatrix(0, 4) = "JobCode"
MSHFlexGrid2.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(4) = 1100

MSHFlexGrid2.TextMatrix(0, 5) = "CalMethodCode"
MSHFlexGrid2.ColAlignment(5) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(5) = 0

MSHFlexGrid2.TextMatrix(0, 6) = "CalMethod"
MSHFlexGrid2.ColAlignment(6) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(6) = 1500

MSHFlexGrid2.TextMatrix(0, 7) = "Quantity"
MSHFlexGrid2.ColAlignment(7) = flexAlignRightCenter
MSHFlexGrid2.ColWidth(7) = 1200

MSHFlexGrid2.TextMatrix(0, 8) = "Rate"
MSHFlexGrid2.ColAlignment(8) = flexAlignRightCenter
MSHFlexGrid2.ColWidth(8) = 1200

MSHFlexGrid2.TextMatrix(0, 9) = "Amount"
MSHFlexGrid2.ColAlignment(9) = flexAlignRightCenter
MSHFlexGrid2.ColWidth(9) = 1200

MSHFlexGrid2.TextMatrix(0, 10) = "t"
MSHFlexGrid2.ColAlignment(10) = flexAlignCenterCenter
MSHFlexGrid2.ColWidth(10) = 200

MSHFlexGrid2.TextMatrix(0, 11) = "s"
MSHFlexGrid2.ColAlignment(11) = flexAlignCenterCenter
MSHFlexGrid2.ColWidth(11) = 200

MSHFlexGrid2.TextMatrix(0, 12) = "p"
MSHFlexGrid2.ColAlignment(12) = flexAlignCenterCenter
MSHFlexGrid2.ColWidth(12) = 200

MSHFlexGrid2.TextMatrix(0, 13) = "CompanyPay"
MSHFlexGrid2.ColAlignment(13) = flexAlignRightCenter
MSHFlexGrid2.ColWidth(13) = 0

MSHFlexGrid2.MergeCells = flexMergeRestrictRows
MSHFlexGrid2.MergeCol(0) = True
MSHFlexGrid2.MergeCol(1) = True

For j = 2 To 13
    MSHFlexGrid2.MergeCol(j) = False
Next j

End Sub

Sub MSHFlexGrid3Clear()
Dim i As Long
Dim j As Long

MSHFlexGrid3.Cols = 7
MSHFlexGrid3.Clear
For j = 1 To MSHFlexGrid3.Rows - 2
 MSHFlexGrid3.RemoveItem 1
Next j

MSHFlexGrid3.TextMatrix(0, 0) = ""
MSHFlexGrid3.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid3.ColWidth(0) = 1500

MSHFlexGrid3.TextMatrix(0, 1) = "Incomes"
MSHFlexGrid3.ColAlignment(1) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(1) = 1200

MSHFlexGrid3.TextMatrix(0, 2) = "Deduction"
MSHFlexGrid3.ColAlignment(2) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(2) = 1200

MSHFlexGrid3.TextMatrix(0, 3) = "Tax"
MSHFlexGrid3.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(3) = 1200

MSHFlexGrid3.TextMatrix(0, 4) = "SWF"
MSHFlexGrid3.ColAlignment(4) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(4) = 1200

MSHFlexGrid3.TextMatrix(0, 5) = "PDF"
MSHFlexGrid3.ColAlignment(5) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(5) = 1200

MSHFlexGrid3.TextMatrix(0, 6) = "NetPay"
MSHFlexGrid3.ColAlignment(6) = flexAlignRightCenter
MSHFlexGrid3.ColWidth(6) = 1200

MSHFlexGrid3.TextMatrix(1, 0) = "This Pay"

MSHFlexGrid3.AddItem "Month to Date"
MSHFlexGrid3.AddItem "Year to Date"

For i = 1 To 3
    For j = 1 To 6
        MSHFlexGrid3.TextMatrix(i, j) = "0.00"
    Next j
Next i

End Sub

Private Sub Command1_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(6) As New ADODB.Parameter
Dim aPr(13) As New ADODB.Parameter
Dim bPr(14) As New ADODB.Parameter
Dim cPr(5) As New ADODB.Parameter
Dim dPr(4) As New ADODB.Parameter
Dim ePr(5) As New ADODB.Parameter
Dim fPr(3) As New ADODB.Parameter
Dim gPr(2) As New ADODB.Parameter
Dim hPr(2) As New ADODB.Parameter
Dim i As Long
Dim j As Long
Dim importTAflag As Boolean
Dim loanflag As Boolean
Dim loanamt As Currency

If CFC(MSHFlexGrid3.TextMatrix(1, 6)) < 0 Then
    MsgBox "NetPay of this pay must not be less than zero...", vbCritical + vbOKOnly
    Exit Sub
End If

For i = 1 To incRec
    If MSHFlexGrid1.TextMatrix(i, 2) = "X" Then
        MsgBox "Incomes: " + MSHFlexGrid1.TextMatrix(i, 1) + " has no rate...", vbCritical + vbOKOnly
        Exit Sub
    End If
Next i

For i = 1 To dedRec
    If MSHFlexGrid2.TextMatrix(i, 2) = "X" Then
        MsgBox "Deduction: " + MSHFlexGrid2.TextMatrix(i, 1) + " has no rate...", vbCritical + vbOKOnly
        Exit Sub
    End If
Next i

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_calc_detail_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set tPr(3) = tCmd.CreateParameter("TotalIncomes", adCurrency, adParamInput, 8)
        Set tPr(4) = tCmd.CreateParameter("TotalDeduction", adCurrency, adParamInput, 8)
        Set tPr(5) = tCmd.CreateParameter("NetPay", adCurrency, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = CDateX(Label3.Caption)
        tPr(2).Value = Trim(Left(Label4(0).Caption, 10))
        tPr(3).Value = CFC(MSHFlexGrid3.TextMatrix(1, 1))
        tPr(4).Value = CFC(MSHFlexGrid3.TextMatrix(1, 2)) + CFC(MSHFlexGrid3.TextMatrix(1, 3)) + CFC(MSHFlexGrid3.TextMatrix(1, 4)) + CFC(MSHFlexGrid3.TextMatrix(1, 5))
        tPr(5).Value = CFC(MSHFlexGrid3.TextMatrix(1, 6))
        tPr(6).Value = CurUser
        
        For i = 0 To 6
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_calc_detail_update"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set tPr(3) = tCmd.CreateParameter("TotalIncomes", adCurrency, adParamInput, 8)
        Set tPr(4) = tCmd.CreateParameter("TotalDeduction", adCurrency, adParamInput, 8)
        Set tPr(5) = tCmd.CreateParameter("NetPay", adCurrency, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = CDateX(Label3.Caption)
        tPr(2).Value = Trim(Left(Label4(0).Caption, 10))
        tPr(3).Value = CFC(MSHFlexGrid3.TextMatrix(1, 1))
        tPr(4).Value = CFC(MSHFlexGrid3.TextMatrix(1, 2)) + CFC(MSHFlexGrid3.TextMatrix(1, 3)) + CFC(MSHFlexGrid3.TextMatrix(1, 4)) + CFC(MSHFlexGrid3.TextMatrix(1, 5))
        tPr(5).Value = CFC(MSHFlexGrid3.TextMatrix(1, 6))
        tPr(6).Value = CurUser

        For i = 0 To 6
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute

        For i = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next i
        
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_calc_import_incomes_from_ta_unconfirmed"
        
        Set ePr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set ePr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
        Set ePr(2) = tCmd.CreateParameter("BeginDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(1).Caption))
        Set ePr(3) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(2).Caption))
        Set ePr(4) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))
        Set ePr(5) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)
        
        For i = 0 To 5
            tCmd.Parameters.Append ePr(i)
        Next i
        
        Set tRs = tCmd.Execute
                
        For i = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next i
                
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_calc_loan_payback_unconfirmed"
        
        Set fPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set fPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
        Set fPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))
        Set fPr(3) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)
        
        For i = 0 To 3
            tCmd.Parameters.Append fPr(i)
        Next i
        
        Set tRs = tCmd.Execute
                
        For i = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next i
                
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_calc_detail_incomes_delete_by_EID"
        
        Set gPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set gPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))
        Set gPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
        
        For i = 0 To 2
            tCmd.Parameters.Append gPr(i)
        Next i
        
        Set tRs = tCmd.Execute
                
        For i = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next i
                
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_calc_detail_deduction_delete_by_EID"
        
        Set hPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set hPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))
        Set hPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
        
        For i = 0 To 2
            tCmd.Parameters.Append hPr(i)
        Next i
        
        Set tRs = tCmd.Execute

    Case Else
        MainMDI.MousePointer = vbDefault
        MsgBox "Invalid Form Status...", vbCritical + vbOKOnly
        Exit Sub
End Select
        
For i = 0 To tCmd.Parameters.Count - 1
    tCmd.Parameters.Delete 0
Next i
        
'Incomes
importTAflag = False
For j = 1 To incRec

    If MSHFlexGrid1.TextMatrix(j, 3) = "X" Then
        importTAflag = True
    End If

    If CFC(MSHFlexGrid1.TextMatrix(j, 9)) > 0 Then

    For i = 0 To tCmd.Parameters.Count - 1
        tCmd.Parameters.Delete 0
    Next i

    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "pr_wage_calc_detail_incomes_insert"

    Set aPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
    Set aPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
    Set aPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
    Set aPr(3) = tCmd.CreateParameter("IncomesCode", adVarChar, adParamInput, 8)
    Set aPr(4) = tCmd.CreateParameter("JobCode", adVarChar, adParamInput, 10)
    Set aPr(5) = tCmd.CreateParameter("CalMethod", adChar, adParamInput, 1)
    Set aPr(6) = tCmd.CreateParameter("Quantity", adCurrency, adParamInput, 8)
    Set aPr(7) = tCmd.CreateParameter("Rate", adCurrency, adParamInput, 8)
    Set aPr(8) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8)
    Set aPr(9) = tCmd.CreateParameter("FromTimeAttendant", adBoolean, adParamInput, 1)
    Set aPr(10) = tCmd.CreateParameter("TaxCal", adBoolean, adParamInput, 1)
    Set aPr(11) = tCmd.CreateParameter("SWFCal", adBoolean, adParamInput, 1)
    Set aPr(12) = tCmd.CreateParameter("PDFCal", adBoolean, adParamInput, 1)
    Set aPr(13) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
    
    aPr(0).Value = CurCmp
    aPr(1).Value = CDateX(Label3.Caption)
    aPr(2).Value = Trim(Left(Label4(0).Caption, 10))
    aPr(3).Value = MSHFlexGrid1.TextMatrix(j, 0)
    aPr(4).Value = MSHFlexGrid1.TextMatrix(j, 4)
    aPr(5).Value = MSHFlexGrid1.TextMatrix(j, 5)
    
    If MSHFlexGrid1.TextMatrix(j, 7) = "" Then
        aPr(6).Value = Null
    Else
        aPr(6).Value = CFC(MSHFlexGrid1.TextMatrix(j, 7))
    End If
    
    If MSHFlexGrid1.TextMatrix(j, 8) = "" Then
        aPr(7).Value = Null
    Else
        aPr(7).Value = CFC(MSHFlexGrid1.TextMatrix(j, 8))
    End If
    
    aPr(8).Value = CFC(MSHFlexGrid1.TextMatrix(j, 9))
    aPr(9).Value = X2Bool(MSHFlexGrid1.TextMatrix(j, 3))
    aPr(10).Value = X2Bool(MSHFlexGrid1.TextMatrix(j, 10))
    aPr(11).Value = X2Bool(MSHFlexGrid1.TextMatrix(j, 11))
    aPr(12).Value = X2Bool(MSHFlexGrid1.TextMatrix(j, 12))
    aPr(13).Value = CurUser
    
    For i = 0 To 13
        tCmd.Parameters.Append aPr(i)
    Next i
    
    Set tRs = tCmd.Execute
    
    End If
Next j

'Update TA
If importTAflag = True Then

    For i = 0 To tCmd.Parameters.Count - 1
        tCmd.Parameters.Delete 0
    Next i

    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "pr_wage_calc_import_incomes_from_ta_confirmed"

    Set cPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
    Set cPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
    Set cPr(2) = tCmd.CreateParameter("BeginDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(1).Caption))
    Set cPr(3) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(2).Caption))
    Set cPr(4) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(0).Caption))
    Set cPr(5) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)
    
    For i = 0 To 5
        tCmd.Parameters.Append cPr(i)
    Next i
    
    Set tRs = tCmd.Execute

End If

'Deduction
loanflag = False
loanamt = 0
For j = 1 To dedRec

    If MSHFlexGrid2.TextMatrix(j, 0) = "LPB" And CFC(MSHFlexGrid2.TextMatrix(j, 9)) > 0 Then
        loanflag = True
        loanamt = CFC(MSHFlexGrid2.TextMatrix(j, 9))
    End If
    
    If CFC(MSHFlexGrid2.TextMatrix(j, 9)) > 0 Then

    For i = 0 To tCmd.Parameters.Count - 1
        tCmd.Parameters.Delete 0
    Next i

    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "pr_wage_calc_detail_deduction_insert"

    Set bPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
    Set bPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
    Set bPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
    Set bPr(3) = tCmd.CreateParameter("DeductionCode", adVarChar, adParamInput, 8)
    Set bPr(4) = tCmd.CreateParameter("JobCode", adVarChar, adParamInput, 10)
    Set bPr(5) = tCmd.CreateParameter("CalMethod", adChar, adParamInput, 1)
    Set bPr(6) = tCmd.CreateParameter("Quantity", adCurrency, adParamInput, 8)
    Set bPr(7) = tCmd.CreateParameter("Rate", adCurrency, adParamInput, 8)
    Set bPr(8) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8)
    Set bPr(9) = tCmd.CreateParameter("CompanyPay", adCurrency, adParamInput, 8)
    Set bPr(10) = tCmd.CreateParameter("Auto", adBoolean, adParamInput, 1)
    Set bPr(11) = tCmd.CreateParameter("TaxCal", adBoolean, adParamInput, 1)
    Set bPr(12) = tCmd.CreateParameter("SWFCal", adBoolean, adParamInput, 1)
    Set bPr(13) = tCmd.CreateParameter("PDFCal", adBoolean, adParamInput, 1)
    Set bPr(14) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
    
    bPr(0).Value = CurCmp
    bPr(1).Value = CDateX(Label3.Caption)
    bPr(2).Value = Trim(Left(Label4(0).Caption, 10))
    bPr(3).Value = MSHFlexGrid2.TextMatrix(j, 0)
    bPr(4).Value = MSHFlexGrid2.TextMatrix(j, 4)
    bPr(5).Value = MSHFlexGrid2.TextMatrix(j, 5)
    
    If MSHFlexGrid2.TextMatrix(j, 7) = "" Then
        bPr(6).Value = Null
    Else
        bPr(6).Value = CFC(MSHFlexGrid2.TextMatrix(j, 7))
    End If
    
    If MSHFlexGrid2.TextMatrix(j, 8) = "" Then
        bPr(7).Value = Null
    Else
        bPr(7).Value = CFC(MSHFlexGrid2.TextMatrix(j, 8))
    End If
    
    bPr(8).Value = CFC(MSHFlexGrid2.TextMatrix(j, 9))
    bPr(9).Value = CFC(MSHFlexGrid2.TextMatrix(j, 13))
    bPr(10).Value = X2Bool(MSHFlexGrid2.TextMatrix(j, 3))
    bPr(11).Value = X2Bool(MSHFlexGrid2.TextMatrix(j, 10))
    bPr(12).Value = X2Bool(MSHFlexGrid2.TextMatrix(j, 11))
    bPr(13).Value = X2Bool(MSHFlexGrid2.TextMatrix(j, 12))
    bPr(14).Value = CurUser
    
    For i = 0 To 14
        tCmd.Parameters.Append bPr(i)
    Next i
    
    Set tRs = tCmd.Execute
    
    End If
Next j

'Update LoanPayback
If loanflag = True Then

    For i = 0 To tCmd.Parameters.Count - 1
        tCmd.Parameters.Delete 0
    Next i

    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "pr_wage_calc_loan_payback_confirmed"

    Set dPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
    Set dPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
    Set dPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(0).Caption))
    Set dPr(3) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8, loanamt)
    Set dPr(4) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)
    
    For i = 0 To 4
        tCmd.Parameters.Append dPr(i)
    Next i
    
    Set tRs = tCmd.Execute

End If
     
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

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(4) As ADODB.Parameter
Dim i As Long
Dim j As Long
Dim k As Long
Dim max As Long

Co = MsgBox("Do you want to import work sheet from Time Attendant Module?" + Chr(13) + Chr(10) + "Warning! All incomes records which match the work sheet will be replaced automatically...", vbExclamation + vbYesNo)
If Co = vbNo Then Exit Sub

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_import_incomes_from_ta"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(2) = tCmd.CreateParameter("BeginDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(1).Caption))
Set tPr(3) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(2).Caption))
Set tPr(4) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(0).Caption))

For i = 0 To 4
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Do While Not tRs.EOF
    
    For j = 1 To incRec
        If MSHFlexGrid1.TextMatrix(j, 0) = tRs("IncomesCode") Then
            max = j
            For k = j To incRec
                'Found existing record
                If MSHFlexGrid1.TextMatrix(k, 0) = tRs("IncomesCode") Then
                
                    max = k
                    
                    If MSHFlexGrid1.TextMatrix(k, 4) = tRs("JobCode") Then
                
                        'Replace existing value
                        MSHFlexGrid1.TextMatrix(k, 3) = "X"
                        If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
                            MSHFlexGrid1.TextMatrix(k, 7) = ""
                            MSHFlexGrid1.TextMatrix(k, 8) = ""
                            MSHFlexGrid1.TextMatrix(k, 9) = Format(tRs("Quantity"), "#,##0.00")
                        Else
                            MSHFlexGrid1.TextMatrix(k, 7) = Format(tRs("Quantity"), "#,##0.0000")
                        End If
                        
                        GoTo FoundEX
                    
                    End If
                
                End If
            Next k
        
        If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
            MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + MSHFlexGrid1.TextMatrix(max, 1) + Chr(9) + "" + Chr(9) + "X" + Chr(9) + tRs("JobCode") + Chr(9) + MSHFlexGrid1.TextMatrix(max, 5) + Chr(9) + MSHFlexGrid1.TextMatrix(max, 6) + Chr(9) + "" + Chr(9) + "" + Chr(9) + Format(tRs("Quantity"), "#,##0.00") + Chr(9) + MSHFlexGrid1.TextMatrix(max, 10) + Chr(9) + MSHFlexGrid1.TextMatrix(max, 11) + Chr(9) + MSHFlexGrid1.TextMatrix(max, 12), max + 1
        Else
            MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + MSHFlexGrid1.TextMatrix(max, 1) + Chr(9) + "" + Chr(9) + "X" + Chr(9) + tRs("JobCode") + Chr(9) + MSHFlexGrid1.TextMatrix(max, 5) + Chr(9) + MSHFlexGrid1.TextMatrix(max, 6) + Chr(9) + Format(tRs("Quantity"), "#,##0.0000") + Chr(9) + MSHFlexGrid1.TextMatrix(max, 8) + Chr(9) + "0.00" + Chr(9) + MSHFlexGrid1.TextMatrix(max, 10) + Chr(9) + MSHFlexGrid1.TextMatrix(max, 11) + Chr(9) + MSHFlexGrid1.TextMatrix(max, 12), max + 1
        End If
        
        incRec = incRec + 1
        If incRec = 1 Then MSHFlexGrid1.RemoveItem 1
        
FoundEX:
        
        GoTo FoundAll
        
        End If
    Next j

    If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
        MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "X" + Chr(9) + "X" + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "" + Chr(9) + "" + Chr(9) + "0.00" + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWCal")) + Chr(9) + Bool2X(tRs("PFCal"))
    Else
        MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "X" + Chr(9) + "X" + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + Format(tRs("Quantity"), "#,##0.0000") + Chr(9) + "0.00" + Chr(9) + "0.00" + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWCal")) + Chr(9) + Bool2X(tRs("PFCal"))
    End If
    
    incRec = incRec + 1
    If incRec = 1 Then MSHFlexGrid1.RemoveItem 1

FoundAll:
    
    tRs.MoveNext
Loop

CalculateIncomes
   
Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub Command4_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As ADODB.Parameter
Dim i As Long
Dim j As Long
Dim k As Long
Dim max As Long

Co = MsgBox("Do you want to import loan payback?" + Chr(13) + Chr(10) + "Warning! Advance/Loan Payback record will be replaced automatically...", vbExclamation + vbYesNo)
If Co = vbNo Then Exit Sub

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_get_loan_payback"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(frmCaller.Label2(0).Caption))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

If tRs.EOF = False Then
    For i = 1 To dedRec
        If MSHFlexGrid2.TextMatrix(i, 0) = "LPB" Then Exit For
    Next i

    MSHFlexGrid2.TextMatrix(i, 9) = Format(tRs("payback"), "#,##0.00")

End If

CalculateDeduction
   
Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub Command5_Click()

Co = MsgBox("Do you want to clear all details in this windows?", vbExclamation + vbYesNo)
If Co = vbNo Then Exit Sub

LoadDefaultIncomes
LoadDefaultDeduction
GetHistory
CalculateIncomes
CalculateDeduction
RefreshSummary

End Sub

Private Sub Command6_Click()

Dim frmCalled As New Leave
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

Me.Enabled = False
frmCalled.EmpCbSelect Trim(Left(Label4(0).Caption, 10))
frmCalled.EmpCb.Enabled = False
frmCalled.Command1.Enabled = False

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

If TextMSH1.Visible = True Then MSHFlexGrid1_LeaveCell
If TextMSH2.Visible = True Then MSHFlexGrid2_LeaveCell

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Private Sub ClrScr()
Dim i As Long

Label3.Caption = ""
For i = 0 To 4
    Label4(i).Caption = ""
Next i

Label2(0).Caption = ""
Label2(1).Caption = ""

MSHFlexGrid1Clear
MSHFlexGrid2Clear
MSHFlexGrid3Clear

End Sub

Public Sub CreateDetail(ByVal CalDate As String, ByVal EID As String)

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create
Label2(0).Caption = "N/A"
Label2(1).Caption = "N/A"

Label3.Caption = CalDate

Command3.Enabled = True
Command4.Enabled = True

GatherEmployeeInfo CalDate, EID
LoadDefaultIncomes
LoadDefaultDeduction
GetHistory
CalculateIncomes
CalculateDeduction
RefreshSummary

End Sub

Public Sub ViewDetail(ByVal CalDate As String, ByVal EID As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As New ADODB.Parameter

Dim i As Long
Dim j As Long
Dim k As Long
Dim iMaxInc As String
Dim iMaxJob As String
Dim iMax As Long
Dim dMaxDed As String
Dim dMaxJob As String
Dim dMax As Long

ClrScr
StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Label3.Caption = CalDate

Command1.Enabled = False
Command3.Enabled = False
Command4.Enabled = False
Command5.Enabled = False

GatherEmployeeInfo CalDate, EID

LoadDefaultIncomes
LoadDefaultDeduction
GetHistory

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_detail_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)

tPr(0).Value = CurCmp
tPr(1).Value = CDateX(CalDate)
tPr(2).Value = Trim(Left(Label4(0).Caption, 10))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

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

tCmd.CommandText = "pr_wage_calc_detail_incomes_select_by_EID"
Set tRs = tCmd.Execute

Do While Not tRs.EOF

    iMaxInc = ""
    iMaxJob = ""
    iMax = 1
    For j = 1 To incRec
        
        If MSHFlexGrid1.TextMatrix(j, 0) > iMaxInc And MSHFlexGrid1.TextMatrix(j, 0) <= tRs("IncomesCode") Then
            If MSHFlexGrid1.TextMatrix(j, 0) = tRs("IncomesCode") Then

            Else
                iMax = j
                iMaxInc = MSHFlexGrid1.TextMatrix(j, 0)
            End If

        End If
        
        If MSHFlexGrid1.TextMatrix(j, 0) = tRs("IncomesCode") Then
            For k = j To incRec
                'Found existing record
                If MSHFlexGrid1.TextMatrix(k, 0) = tRs("IncomesCode") Then
                    If MSHFlexGrid1.TextMatrix(j, 4) > iMaxJob And MSHFlexGrid1.TextMatrix(j, 4) <= tRs("JobCode") Then
                        iMax = j
                        iMaxJob = MSHFlexGrid1.TextMatrix(j, 4)
                    End If
                
                    If MSHFlexGrid1.TextMatrix(k, 4) = tRs("JobCode") Then

                        'Replace existing value
                        MSHFlexGrid1.TextMatrix(k, 3) = Bool2X(tRs("FromTimeAttendant"))
                        MSHFlexGrid1.TextMatrix(k, 5) = tRs("CalMethod")
                        MSHFlexGrid1.TextMatrix(k, 6) = tRs("CalMethodDSC")
                        
                        If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
                            MSHFlexGrid1.TextMatrix(k, 7) = ""
                            MSHFlexGrid1.TextMatrix(k, 8) = ""
                            MSHFlexGrid1.TextMatrix(k, 9) = Format(tRs("Amount"), "#,##0.00")
                        Else
                            MSHFlexGrid1.TextMatrix(k, 7) = Format(tRs("Quantity"), "#,##0.0000")
                            MSHFlexGrid1.TextMatrix(k, 8) = Format(tRs("Rate"), "#,##0.00")
                            MSHFlexGrid1.TextMatrix(k, 9) = Format(tRs("Amount"), "#,##0.00")
                        End If

                        MSHFlexGrid1.TextMatrix(k, 10) = Bool2X(tRs("TaxCal"))
                        MSHFlexGrid1.TextMatrix(k, 11) = Bool2X(tRs("SWFCal"))
                        MSHFlexGrid1.TextMatrix(k, 12) = Bool2X(tRs("PDFCal"))

                        GoTo FoundEX

                    End If
                End If
            Next k

            If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
                MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("FromTimeAttendant")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "" + Chr(9) + "" + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")), iMax + 1
            Else
                MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("FromTimeAttendant")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + Format(tRs("Quantity"), "#,##0.0000") + Chr(9) + Format(tRs("Rate"), "#,##0.00") + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")), iMax + 1
            End If
    
            incRec = incRec + 1
            If incRec = 1 Then MSHFlexGrid1.RemoveItem 1
    
FoundEX:
    
            GoTo FoundAll
    
        End If
    Next j

    If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
        MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("FromTimeAttendant")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "" + Chr(9) + "" + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")), iMax + 1
    Else
        MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("FromTimeAttendant")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + Format(tRs("Quantity"), "#,##0.0000") + Chr(9) + Format(tRs("Rate"), "#,##0.00") + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")), iMax + 1
    End If

    incRec = incRec + 1
    If incRec = 1 Then MSHFlexGrid1.RemoveItem 1
    
FoundAll:

    tRs.MoveNext
Loop

tCmd.CommandText = "pr_wage_calc_detail_deduction_select_by_EID"
Set tRs = tCmd.Execute

Do While Not tRs.EOF

    If tRs("DeductionCode") = "TAX" Then MSHFlexGrid3.TextMatrix(1, 3) = Format(tRs("Amount"), "#,##0.00")
    If tRs("DeductionCode") = "SWF" Then MSHFlexGrid3.TextMatrix(1, 4) = Format(tRs("Amount"), "#,##0.00")
    If tRs("DeductionCode") = "PDF" Then MSHFlexGrid3.TextMatrix(1, 5) = Format(tRs("Amount"), "#,##0.00")

    dMaxInc = ""
    dMaxJob = ""
    dMax = 1
    For j = 1 To dedRec
        
        If MSHFlexGrid2.TextMatrix(j, 0) > dMaxInc And MSHFlexGrid2.TextMatrix(j, 0) <= tRs("DeductionCode") Then
            If MSHFlexGrid2.TextMatrix(j, 0) = tRs("DeductionCode") Then

            Else
                dMax = j
                dMaxInc = MSHFlexGrid2.TextMatrix(j, 0)
            End If

        End If
        
        If MSHFlexGrid2.TextMatrix(j, 0) = tRs("DeductionCode") Then
            For k = j To dedRec
                'Found existing record
                If MSHFlexGrid2.TextMatrix(k, 0) = tRs("DeductionCode") Then
                    If MSHFlexGrid2.TextMatrix(j, 4) > dMaxJob And MSHFlexGrid2.TextMatrix(j, 4) <= tRs("JobCode") Then
                        dMax = j
                        dMaxJob = MSHFlexGrid2.TextMatrix(j, 4)
                    End If
                
                    If MSHFlexGrid2.TextMatrix(k, 4) = tRs("JobCode") Then

                        'Replace existing value
                        MSHFlexGrid2.TextMatrix(k, 3) = Bool2X(tRs("Auto"))
                        MSHFlexGrid2.TextMatrix(k, 5) = tRs("CalMethod")
                        MSHFlexGrid2.TextMatrix(k, 6) = tRs("CalMethodDSC")
                        
                        If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
                            MSHFlexGrid2.TextMatrix(k, 7) = ""
                            MSHFlexGrid2.TextMatrix(k, 8) = ""
                            MSHFlexGrid2.TextMatrix(k, 9) = Format(tRs("Amount"), "#,##0.00")
                        Else
                            MSHFlexGrid2.TextMatrix(k, 7) = Format(tRs("Quantity"), "#,##0.0000")
                            MSHFlexGrid2.TextMatrix(k, 8) = Format(tRs("Rate"), "#,##0.00")
                            MSHFlexGrid2.TextMatrix(k, 9) = Format(tRs("Amount"), "#,##0.00")
                        End If

                        MSHFlexGrid2.TextMatrix(k, 10) = Bool2X(tRs("TaxCal"))
                        MSHFlexGrid2.TextMatrix(k, 11) = Bool2X(tRs("SWFCal"))
                        MSHFlexGrid2.TextMatrix(k, 12) = Bool2X(tRs("PDFCal"))
                        MSHFlexGrid2.TextMatrix(k, 13) = Format(tRs("CompanyPay"), "#,##0.00")

                        GoTo FoundEX2

                    End If
                End If
            Next k

            If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
                MSHFlexGrid2.AddItem tRs("DeductionCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("Auto")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "" + Chr(9) + "" + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")) + Chr(9) + Format(tRs("CompanyPay"), "#,##0.00"), dMax + 1
            Else
                MSHFlexGrid2.AddItem tRs("DeductionCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("Auto")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + Format(tRs("Quantity"), "#,##0.0000") + Chr(9) + Format(tRs("Rate"), "#,##0.00") + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")) + Chr(9) + Format(tRs("CompanyPay"), "#,##0.00"), dMax + 1
            End If
    
            dedRec = dedRec + 1
            If dedRec = 1 Then MSHFlexGrid2.RemoveItem 1
    
FoundEX2:
    
            GoTo FoundAll2
    
        End If
    Next j

    If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
        MSHFlexGrid2.AddItem tRs("DeductionCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("Auto")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "" + Chr(9) + "" + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")) + Chr(9) + Format(tRs("CompanyPay"), "#,##0.00"), dMax + 1
    Else
        MSHFlexGrid2.AddItem tRs("DeductionCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("Auto")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + Format(tRs("Quantity"), "#,##0.0000") + Chr(9) + Format(tRs("Rate"), "#,##0.00") + Chr(9) + Format(tRs("Amount"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWFCal")) + Chr(9) + Bool2X(tRs("PDFCal")) + Chr(9) + Format(tRs("CompanyPay"), "#,##0.00"), dMax + 1
    End If

    dedRec = dedRec + 1
    If dedRec = 1 Then MSHFlexGrid2.RemoveItem 1
    
FoundAll2:

    tRs.MoveNext
Loop

CalculateIncomes
CalculateDeduction
RefreshSummary

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Public Sub ModifyDetail(ByVal CalDate As String, ByVal EID As String)

ViewDetail CalDate, EID

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Frame1.Enabled = True
Command1.Enabled = True
Command3.Enabled = False
Command4.Enabled = False

End Sub

Public Sub GatherEmployeeInfo(ByVal CalDate As String, ByVal EID As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_gather_emp_info"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(CalDate))
Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, EID)

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Label4(0).Caption = FillSpace(tRs("EID"), 10) + " - " + tRs("EmpName")
Label4(1).Caption = tRs("BranchName")
Label4(2).Caption = tRs("DepartmentName")
Label4(3).Caption = tRs("PositionName")
If tRs("PaymentType") = "Transfer" Then
    Label4(4).Caption = tRs("PayFrequency") + " by " + tRs("PaymentType") + " to " + tRs("BankBrID") + " A/C No." + tRs("BankAccount")
Else
    Label4(4).Caption = tRs("PayFrequency") + " by " + tRs("PaymentType")
End If
    
Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Sub LoadDefaultIncomes()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_default_incomes"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

MSHFlexGrid1Clear

incRec = 0
Do While Not tRs.EOF

    If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
        MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + "" + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "" + Chr(9) + "" + Chr(9) + Format(tRs("vRate"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWCal")) + Chr(9) + Bool2X(tRs("PFCal"))
    Else
        MSHFlexGrid1.AddItem tRs("IncomesCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + "" + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "0.0000" + Chr(9) + Format(tRs("vRate"), "#,##0.00") + Chr(9) + "0.00" + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWCal")) + Chr(9) + Bool2X(tRs("PFCal"))
    End If
    
    incRec = incRec + 1
    If incRec = 1 Then MSHFlexGrid1.RemoveItem 1
    
    tRs.MoveNext
Loop
    
Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Sub LoadDefaultDeduction()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_default_deduction"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

MSHFlexGrid2Clear

dedRec = 0
Do While Not tRs.EOF

    If tRs("CalMethod") = "V" Or tRs("CalMethod") = "F" Then
        MSHFlexGrid2.AddItem tRs("DeductionCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("AutoFlag")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "" + Chr(9) + "" + Chr(9) + Format(tRs("vRate"), "#,##0.00") + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWCal")) + Chr(9) + Bool2X(tRs("PFCal")) + Chr(9) + "0.00"
    Else
        MSHFlexGrid2.AddItem tRs("DeductionCode") + Chr(9) + tRs("EN_Title") + Chr(9) + "" + Chr(9) + Bool2X(tRs("AutoFlag")) + Chr(9) + tRs("JobCode") + Chr(9) + tRs("CalMethod") + Chr(9) + tRs("CalMethodDSC") + Chr(9) + "0.0000" + Chr(9) + Format(tRs("vRate"), "#,##0.00") + Chr(9) + "0.00" + Chr(9) + Bool2X(tRs("TaxCal")) + Chr(9) + Bool2X(tRs("SWCal")) + Chr(9) + Bool2X(tRs("PFCal")) + Chr(9) + "0.00"
    End If
    
    dedRec = dedRec + 1
    If dedRec = 1 Then MSHFlexGrid2.RemoveItem 1
    
    tRs.MoveNext
Loop
    
Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub MSHFlexGrid1_EnterCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String

If frmStatus <> View Then
    Rowsel = MSHFlexGrid1.Rowsel
    Colsel = MSHFlexGrid1.Colsel
    Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel)
    If MSHFlexGrid1.TextMatrix(Rowsel, 2) = "" And MSHFlexGrid1.TextMatrix(Rowsel, 3) = "" And ((MSHFlexGrid1.TextMatrix(Rowsel, 5) <> "F" And MSHFlexGrid1.TextMatrix(Rowsel, 5) <> "V" And Colsel = 7) Or ((MSHFlexGrid1.TextMatrix(Rowsel, 5) = "V" Or MSHFlexGrid1.TextMatrix(Rowsel, 5) = "F") And Colsel = 9)) Then
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
End If

End Sub

Private Sub MSHFlexGrid1_LeaveCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String

Rowsel = MSHFlexGrid1.Rowsel
Colsel = MSHFlexGrid1.Colsel
Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel)

If TextMSH1.Visible = True Then
    If MSHFlexGrid1.Colsel = 7 Then
        MSHFlexGrid1.Text = Format(CFC(TextMSH1.Text), "#,##0.0000")
    ElseIf MSHFlexGrid1.Colsel = 9 Then
        If MSHFlexGrid1.TextMatrix(Rowsel, 5) = "V" Then
            MSHFlexGrid1.Text = Format(CFC(TextMSH2.Text), "#,##0.00")
        ElseIf MSHFlexGrid1.TextMatrix(Rowsel, 5) = "F" And CFC(TextMSH1.Text) = 0 Then
            MSHFlexGrid1.Text = Format(CFC(TextMSH2.Text), "#,##0.00")
        End If
    End If
    CalculateIncomes
    TextMSH1.Text = ""
End If

End Sub

Private Sub MShFlexGrid1_Scroll()

TextMSH1.Visible = False

End Sub

Private Sub MSHFlexGrid2_EnterCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String

If frmStatus <> View Then
    Rowsel = MSHFlexGrid2.Rowsel
    Colsel = MSHFlexGrid2.Colsel
    Value = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.Rowsel, MSHFlexGrid2.Colsel)
    If MSHFlexGrid2.TextMatrix(Rowsel, 2) = "" And (MSHFlexGrid2.TextMatrix(Rowsel, 3) = "" Or MSHFlexGrid2.TextMatrix(Rowsel, 0) = "LPB") And ((MSHFlexGrid2.TextMatrix(Rowsel, 5) <> "F" And MSHFlexGrid2.TextMatrix(Rowsel, 5) <> "V" And Colsel = 7) Or ((MSHFlexGrid2.TextMatrix(Rowsel, 5) = "V" Or MSHFlexGrid2.TextMatrix(Rowsel, 5) = "F") And Colsel = 9)) Then
        TextMSH2.Width = MSHFlexGrid2.CellWidth - 20
        TextMSH2.Height = MSHFlexGrid2.CellHeight - 20
        TextMSH2.Left = MSHFlexGrid2.CellLeft + MSHFlexGrid2.Left
        TextMSH2.Top = MSHFlexGrid2.CellTop + MSHFlexGrid2.Top
        TextMSH2.Text = Value
        TextMSH2.Visible = True
        TextMSH2.SetFocus
    Else
        TextMSH2.Visible = False
    End If
End If

End Sub

Private Sub MSHFlexGrid2_LeaveCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String

Rowsel = MSHFlexGrid2.Rowsel
Colsel = MSHFlexGrid2.Colsel
Value = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.Rowsel, MSHFlexGrid2.Colsel)

If TextMSH2.Visible = True Then
    If MSHFlexGrid2.Colsel = 7 Then
        MSHFlexGrid2.Text = Format(CFC(TextMSH2.Text), "#,##0.0000")
    ElseIf MSHFlexGrid2.Colsel = 9 Then
        If MSHFlexGrid2.TextMatrix(Rowsel, 5) = "V" Then
            MSHFlexGrid2.Text = Format(CFC(TextMSH2.Text), "#,##0.00")
        ElseIf MSHFlexGrid2.TextMatrix(Rowsel, 5) = "F" And CFC(TextMSH2.Text) = 0 Then
            MSHFlexGrid2.Text = Format(CFC(TextMSH2.Text), "#,##0.00")
        End If
    End If
    CalculateDeduction
    TextMSH2.Text = ""
End If

End Sub

Private Sub MShFlexGrid2_Scroll()

TextMSH2.Visible = False

End Sub

Sub CalculateIncomes()

Dim i As Long
Dim Sum As Currency

Sum = 0
inctaxable = 0: incswfable = 0: incpdfable = 0

For i = 1 To incRec
    Select Case MSHFlexGrid1.TextMatrix(i, 5)
        Case Is = "H", "D", "M", "P"
            MSHFlexGrid1.TextMatrix(i, 9) = Format(CFC(MSHFlexGrid1.TextMatrix(i, 7)) * CFC(MSHFlexGrid1.TextMatrix(i, 8)), "#,##0.00")
        Case Is = "S", "G"
            MSHFlexGrid1.TextMatrix(i, 9) = Format(CFC(MSHFlexGrid1.TextMatrix(i, 7)) * CFC(MSHFlexGrid1.TextMatrix(i, 8)) / 100, "#,##0.00")
    End Select
    
    Sum = Sum + CFC(MSHFlexGrid1.TextMatrix(i, 9))
    If MSHFlexGrid1.TextMatrix(i, 10) = "X" Then inctaxable = inctaxable + CFC(MSHFlexGrid1.TextMatrix(i, 9))
    If MSHFlexGrid1.TextMatrix(i, 11) = "X" Then incswfable = incswfable + CFC(MSHFlexGrid1.TextMatrix(i, 9))
    If MSHFlexGrid1.TextMatrix(i, 12) = "X" Then incpdfable = incpdfable + CFC(MSHFlexGrid1.TextMatrix(i, 9))
Next i

MSHFlexGrid3.TextMatrix(1, 1) = Format(Sum, "#,##0.00")
RefreshSummary

End Sub

Sub CalculateDeduction()

Dim i As Long
Dim Sum As Currency

Sum = 0
dedtaxable = 0: dedswfable = 0: dedpdfable = 0

For i = 1 To dedRec
    Select Case MSHFlexGrid2.TextMatrix(i, 5)
        Case Is = "H", "D", "M", "P"
            MSHFlexGrid2.TextMatrix(i, 9) = Format(CFC(MSHFlexGrid2.TextMatrix(i, 7)) * CFC(MSHFlexGrid2.TextMatrix(i, 8)), "#,##0.00")
        Case Is = "S", "G"
            MSHFlexGrid2.TextMatrix(i, 9) = Format(CFC(MSHFlexGrid2.TextMatrix(i, 7)) * CFC(MSHFlexGrid2.TextMatrix(i, 8)) / 100, "#,##0.00")
    End Select

    If MSHFlexGrid2.TextMatrix(i, 0) <> "TAX" And MSHFlexGrid2.TextMatrix(i, 0) <> "SWF" And MSHFlexGrid2.TextMatrix(i, 0) <> "PDF" Then
        Sum = Sum + CFC(MSHFlexGrid2.TextMatrix(i, 9))
        If MSHFlexGrid2.TextMatrix(i, 10) = "X" Then dedtaxable = dedtaxable + CFC(MSHFlexGrid2.TextMatrix(i, 9))
        If MSHFlexGrid2.TextMatrix(i, 11) = "X" Then dedswfable = dedswfable + CFC(MSHFlexGrid2.TextMatrix(i, 9))
        If MSHFlexGrid2.TextMatrix(i, 12) = "X" Then dedpdfable = dedpdfable + CFC(MSHFlexGrid2.TextMatrix(i, 9))
    End If
Next i

MSHFlexGrid3.TextMatrix(1, 2) = Format(Sum, "#,##0.00")
RefreshSummary

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
tCmd.CommandText = "pr_wage_calc_get_mtd_inc"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))

For i = 0 To 2
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Minc = tRs("mtd_incomes")
Else
    Minc = 0
End If

tCmd.CommandText = "pr_wage_calc_get_mtd_ded"
Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Mded = tRs("mtd_deduction")
Else
    Mded = 0
End If

tCmd.CommandText = "pr_wage_calc_get_mtd_tsp"
Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Mtsp(0) = tRs("mtd_tax")
    Mtsp(1) = tRs("mtd_swf")
    Mtsp(2) = tRs("mtd_pdf")
Else
    For i = 0 To 2
        Mtsp(i) = 0
    Next i
End If

tCmd.CommandText = "pr_wage_calc_get_ytd_inc"
Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Yinc = tRs("ytd_incomes")
Else
    Yinc = 0
End If

tCmd.CommandText = "pr_wage_calc_get_ytd_ded"
Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Yded = tRs("ytd_deduction")
Else
    Yded = 0
End If

tCmd.CommandText = "pr_wage_calc_get_ytd_tsp"
Set tRs = tCmd.Execute

If tRs.EOF = False Then
    Ytsp(0) = tRs("ytd_tax")
    Ytsp(1) = tRs("ytd_swf")
    Ytsp(2) = tRs("ytd_pdf")
Else
    For i = 0 To 2
        Ytsp(i) = 0
    Next i
End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Public Sub RefreshSummary()

'This Pay
If frmStatus <> View Then
    SWCalc (incswfable - dedswfable)
    PFCalc (incpdfable - dedpdfable)
    TaxCalc (inctaxable - dedtaxable)
End If
MSHFlexGrid3.TextMatrix(1, 6) = Format(CFC(MSHFlexGrid3.TextMatrix(1, 1)) - CFC(MSHFlexGrid3.TextMatrix(1, 2)) - CFC(MSHFlexGrid3.TextMatrix(1, 3)) - CFC(MSHFlexGrid3.TextMatrix(1, 4)) - CFC(MSHFlexGrid3.TextMatrix(1, 5)), "#,##0.00")

'MTD
MSHFlexGrid3.TextMatrix(2, 1) = Format(Minc + CFC(MSHFlexGrid3.TextMatrix(1, 1)), "#,##0.00")
MSHFlexGrid3.TextMatrix(2, 2) = Format(Mded + CFC(MSHFlexGrid3.TextMatrix(1, 2)), "#,##0.00")
MSHFlexGrid3.TextMatrix(2, 3) = Format(Mtsp(0) + CFC(MSHFlexGrid3.TextMatrix(1, 3)), "#,##0.00")
MSHFlexGrid3.TextMatrix(2, 4) = Format(Mtsp(1) + CFC(MSHFlexGrid3.TextMatrix(1, 4)), "#,##0.00")
MSHFlexGrid3.TextMatrix(2, 5) = Format(Mtsp(2) + CFC(MSHFlexGrid3.TextMatrix(1, 5)), "#,##0.00")
MSHFlexGrid3.TextMatrix(2, 6) = Format(CFC(MSHFlexGrid3.TextMatrix(2, 1)) - CFC(MSHFlexGrid3.TextMatrix(2, 2)) - CFC(MSHFlexGrid3.TextMatrix(2, 3)) - CFC(MSHFlexGrid3.TextMatrix(2, 4)) - CFC(MSHFlexGrid3.TextMatrix(2, 5)), "#,##0.00")

'YTD
MSHFlexGrid3.TextMatrix(3, 1) = Format(Yinc + CFC(MSHFlexGrid3.TextMatrix(1, 1)), "#,##0.00")
MSHFlexGrid3.TextMatrix(3, 2) = Format(Yded + CFC(MSHFlexGrid3.TextMatrix(1, 2)), "#,##0.00")
MSHFlexGrid3.TextMatrix(3, 3) = Format(Ytsp(0) + CFC(MSHFlexGrid3.TextMatrix(1, 3)), "#,##0.00")
MSHFlexGrid3.TextMatrix(3, 4) = Format(Ytsp(1) + CFC(MSHFlexGrid3.TextMatrix(1, 4)), "#,##0.00")
MSHFlexGrid3.TextMatrix(3, 5) = Format(Ytsp(2) + CFC(MSHFlexGrid3.TextMatrix(1, 5)), "#,##0.00")
MSHFlexGrid3.TextMatrix(3, 6) = Format(CFC(MSHFlexGrid3.TextMatrix(3, 1)) - CFC(MSHFlexGrid3.TextMatrix(3, 2)) - CFC(MSHFlexGrid3.TextMatrix(3, 3)) - CFC(MSHFlexGrid3.TextMatrix(3, 4)) - CFC(MSHFlexGrid3.TextMatrix(3, 5)), "#,##0.00")

End Sub

Public Sub TaxCalc(ByVal CalAmount As Currency)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(6) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_do_tax_calc"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))
Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(3) = tCmd.CreateParameter("dYear", adInteger, adParamInput, 4, CurDyr)
Set tPr(4) = tCmd.CreateParameter("CalAmount", adCurrency, adParamInput, 8, CalAmount)
Set tPr(5) = tCmd.CreateParameter("SWAmount", adCurrency, adParamInput, 8, CFC(MSHFlexGrid3.TextMatrix(1, 4)))
Set tPr(6) = tCmd.CreateParameter("PFAmount", adCurrency, adParamInput, 8, CFC(MSHFlexGrid3.TextMatrix(1, 5)))

For i = 0 To 6
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

For i = 1 To dedRec
    If MSHFlexGrid2.TextMatrix(i, 0) = "TAX" Then Exit For
Next i

If tRs.EOF = False Then
    MSHFlexGrid3.TextMatrix(1, 3) = Format(tRs("tax"), "#,##0.00")
    MSHFlexGrid2.TextMatrix(i, 9) = Format(tRs("tax"), "#,##0.00")
Else
    MSHFlexGrid3.TextMatrix(1, 3) = "0.00"
    MSHFlexGrid2.TextMatrix(i, 9) = "0.00"
End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Public Sub SWCalc(ByVal CalAmount As Currency)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(3) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_do_swf_calc"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))
Set tPr(3) = tCmd.CreateParameter("CalAmount", adCurrency, adParamInput, 8, CalAmount)

For i = 0 To 3
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

For i = 1 To dedRec
    If MSHFlexGrid2.TextMatrix(i, 0) = "SWF" Then Exit For
Next i

If tRs.EOF = False Then
    MSHFlexGrid3.TextMatrix(1, 4) = Format(tRs("swfe"), "#,##0.00")
    MSHFlexGrid2.TextMatrix(i, 9) = Format(tRs("swfe"), "#,##0.00")
    MSHFlexGrid2.TextMatrix(i, 13) = Format(tRs("swfc"), "#,##0.00")
Else
    MSHFlexGrid3.TextMatrix(1, 4) = "0.00"
    MSHFlexGrid2.TextMatrix(i, 9) = "0.00"
    MSHFlexGrid2.TextMatrix(i, 13) = "0.00"
End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Public Sub PFCalc(ByVal CalAmount As Currency)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(3) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_do_pdf_calc"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(Label4(0).Caption, 10)))
Set tPr(2) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label3.Caption))
Set tPr(3) = tCmd.CreateParameter("CalAmount", adCurrency, adParamInput, 8, CalAmount)

For i = 0 To 3
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

For i = 1 To dedRec
    If MSHFlexGrid2.TextMatrix(i, 0) = "PDF" Then Exit For
Next i

If tRs.EOF = False Then
    MSHFlexGrid3.TextMatrix(1, 5) = Format(tRs("pdfe"), "#,##0.00")
    MSHFlexGrid2.TextMatrix(i, 9) = Format(tRs("pdfe"), "#,##0.00")
    MSHFlexGrid2.TextMatrix(i, 13) = Format(tRs("pdfc"), "#,##0.00")
Else
    MSHFlexGrid3.TextMatrix(1, 5) = "0.00"
    MSHFlexGrid2.TextMatrix(i, 9) = "0.00"
    MSHFlexGrid2.TextMatrix(i, 13) = "0.00"
End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

