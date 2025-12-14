VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form PeriodicProcessLoan 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Periodic Process for Loan"
   ClientHeight    =   1950
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4965
   Icon            =   "PeriodicProcessLoan.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1950
   ScaleWidth      =   4965
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&Process"
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   1320
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3480
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Process Date for Interest Calculation"
      Height          =   975
      Left            =   240
      TabIndex        =   3
      Top             =   240
      Width           =   4455
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1320
         TabIndex        =   0
         Top             =   360
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   60489729
         CurrentDate     =   37642
      End
   End
End
Attribute VB_Name = "PeriodicProcessLoan"
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

Private Sub Command1_Click()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(2) As New ADODB.Parameter
Dim i As Long

Co = MsgBox("Do you want to do periodic loan process?", vbQuestion + vbYesNo)
If Co = vbYes Then

    On Error GoTo ErrHandler
    
    MainMDI.MousePointer = vbHourglass
    Me.Enabled = False
    
    Set tCmd.ActiveConnection = sConn
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "pr_loan_periodic_process"
    
    Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
    Set tPr(1) = tCmd.CreateParameter("ProcessDate", adDBTimeStamp, adParamInput, 8)
    Set tPr(2) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
    
    tPr(0).Value = CurCmp
    tPr(1).Value = DTPicker1.Value
    tPr(2).Value = CurUser
    
    For i = 0 To 2
        tCmd.Parameters.Append tPr(i)
    Next i
    
    Set tRs = tCmd.Execute
    
    MainMDI.MousePointer = vbDefault
    Me.Enabled = True
    MsgBox "Operation Completed...", vbInformation + vbOKOnly
    
End If

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
Me.Enabled = True
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

DTPicker1.Value = DateFilter(Now)

End Sub
