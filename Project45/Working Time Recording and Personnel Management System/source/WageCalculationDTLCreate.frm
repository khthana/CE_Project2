VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form WageCalculationDTLCreate 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Create New Wage Calculation Detail"
   ClientHeight    =   5925
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7110
   Icon            =   "WageCalculationDTLCreate.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   7110
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command4 
      Caption         =   "&Employee"
      Height          =   375
      Left            =   5640
      TabIndex        =   8
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Refresh"
      Height          =   375
      Left            =   5640
      TabIndex        =   3
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   5640
      TabIndex        =   2
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Create"
      Height          =   375
      Left            =   5640
      TabIndex        =   1
      Top             =   360
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Employee to be paid"
      Height          =   5175
      Left            =   240
      TabIndex        =   4
      Top             =   240
      Width           =   5175
      Begin VB.ListBox List1 
         ForeColor       =   &H00C00000&
         Height          =   4740
         Left            =   120
         TabIndex        =   0
         Top             =   240
         Width           =   4935
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   5610
      Width           =   7110
      _ExtentX        =   12541
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
      Index           =   0
      Left            =   5640
      TabIndex        =   7
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Cal. Date :"
      Height          =   255
      Index           =   0
      Left            =   5640
      TabIndex        =   6
      Top             =   1440
      Width           =   1215
   End
End
Attribute VB_Name = "WageCalculationDTLCreate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private numRec As Long
Private SendFlag As Boolean

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub Command1_Click()

Dim frmCalled As New WageCalculationDTLDetail
Dim i As Long

For i = 0 To List1.ListCount - 1
    If List1.Selected(i) = True Then GoTo Found
Next i

MsgBox "You must choose employee first...", vbExclamation + vbOKOnly
Exit Sub
Found:

SendFlag = True

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = frmCaller
frmCalled.CreateDetail Label2(0).Caption, Trim(Left(List1.List(i), 10))
Unload Me

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command4_Click()

Dim frmCalled As New Employee
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

SendFlag = False

End Sub

Public Sub Command3_Click()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_calc_employee_to_be_paid"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8, CDateX(Label2(0).Caption))

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

List1.Clear
numRec = 0

Do While Not tRs.EOF
    
    List1.AddItem FillSpace(tRs("EID"), 10) + " - " + tRs("EmpName")
    numRec = numRec + 1
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

Public Sub ParamTransfer(ByVal CalDate As String)

Label2(0).Caption = CalDate
Command3_Click

End Sub

Private Sub Form_Unload(Cancel As Integer)

If SendFlag = False Then frmCaller.Enabled = True

End Sub

Private Sub List1_DblClick()

Command1_Click

End Sub

Public Sub EmpCbSelect(ByVal Param As String)
Dim i As Long

Command3_Click

For i = 0 To List1.ListCount - 1
    If Trim(Left(List1.List(i), 10)) = Trim(Param) Then
        List1.Selected(i) = True
        List1.Refresh
        Exit Sub
    End If
Next i

End Sub
