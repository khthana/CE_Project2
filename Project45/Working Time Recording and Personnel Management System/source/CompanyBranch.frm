VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form CompanyBranch 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Company Branch"
   ClientHeight    =   6660
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8775
   Icon            =   "CompanyBranch.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6660
   ScaleWidth      =   8775
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "List of Company Branch"
      Height          =   4935
      Left            =   240
      TabIndex        =   8
      Top             =   1200
      Width           =   8295
      Begin VB.CommandButton Command1 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   2280
         TabIndex        =   3
         Top             =   4320
         Width           =   975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   3360
         TabIndex        =   4
         Top             =   4320
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7200
         TabIndex        =   5
         Top             =   4320
         Width           =   975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "&Create"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   4320
         Width           =   975
      End
      Begin VB.CommandButton Command2 
         Caption         =   "&View"
         Height          =   375
         Left            =   1200
         TabIndex        =   2
         Top             =   4320
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3975
         Left            =   120
         TabIndex        =   0
         ToolTipText     =   "Double Click to view detail..."
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   7011
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
      Caption         =   "Company Information"
      Height          =   855
      Left            =   240
      TabIndex        =   7
      Top             =   240
      Width           =   8295
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1440
         TabIndex        =   10
         Top             =   360
         Width           =   6615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Company :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   1095
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
Attribute VB_Name = "CompanyBranch"
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

MSHFlexGrid1.Cols = 3
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "BranchCode"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 1000

MSHFlexGrid1.TextMatrix(0, 1) = "TH_BranchName"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 3000

MSHFlexGrid1.TextMatrix(0, 2) = "EN_BranchName"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 3000

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim aPr(0) As ADODB.Parameter
Dim i As Long

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_company_branch_select_all"

Set aPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)

aPr(0).Value = Trim(Left(Label2(0).Caption, 3))

For i = 0 To 0
    tCmd.Parameters.Append aPr(i)
Next i
   
Set tRs = tCmd.Execute

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1
    
    MSHFlexGrid1.AddItem tRs("BranchCode") + Chr(9) + tRs("TH_BranchName") + Chr(9) + tRs("EN_BranchName")

    tRs.MoveNext
Loop

If numRec > 0 Then MSHFlexGrid1.RemoveItem 1

StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command1_Click()

Dim frmCalled As New CompanyBranchDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ModifyDetail Trim(Left(Label2(0).Caption, 3)), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
Me.Enabled = False

End Sub

Private Sub Command2_Click()

Dim frmCalled As New CompanyBranchDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ViewDetail Trim(Left(Label2(0).Caption, 3)), MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
Me.Enabled = False

End Sub

Private Sub Command3_Click()

Dim frmCalled As New CompanyBranchDetail

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.CreateDetail Trim(Left(Label2(0).Caption, 3))
Me.Enabled = False

End Sub

Private Sub Command4_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(1) As New ADODB.Parameter
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
tCmd.CommandText = "app_company_branch_delete"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, Trim(Left(Label2(0).Caption, 3)))
Set tPr(1) = tCmd.CreateParameter("BranchCode", adVarChar, adParamInput, 5, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0))

For i = 0 To 1
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

Public Sub DTLDisplay(ByVal CmpInfo As String)
Dim i As Long

Label2(0).Caption = CmpInfo

Command5_Click

End Sub

Private Sub MSHFlexGrid1_DblClick()

Command2_Click

End Sub

