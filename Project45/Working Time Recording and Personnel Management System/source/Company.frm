VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Company 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Company"
   ClientHeight    =   5475
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9510
   Icon            =   "Company.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5475
   ScaleWidth      =   9510
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "List of Company"
      Height          =   4695
      Left            =   240
      TabIndex        =   7
      Top             =   240
      Width           =   9015
      Begin VB.CommandButton Command6 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   2280
         TabIndex        =   3
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&Branch"
         Height          =   375
         Left            =   4680
         TabIndex        =   6
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
      Begin VB.CommandButton Command3 
         Caption         =   "&Create"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7920
         TabIndex        =   5
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
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3735
         Left            =   120
         TabIndex        =   0
         ToolTipText     =   "Double Click to view detail..."
         Top             =   240
         Width           =   8775
         _ExtentX        =   15478
         _ExtentY        =   6588
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   8
      Top             =   5160
      Width           =   9510
      _ExtentX        =   16775
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
Attribute VB_Name = "Company"
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

MSHFlexGrid1.TextMatrix(0, 0) = "CID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 700

MSHFlexGrid1.TextMatrix(0, 1) = "TH_CompanyName"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 3500

MSHFlexGrid1.TextMatrix(0, 2) = "EN_CompanyName"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 4000

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_company_select_all"

Set tRs = tCmd.Execute

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1

    MSHFlexGrid1.AddItem tRs("CID") + Chr(9) + tRs("TH_CompanyName") + Chr(9) + tRs("EN_CompanyName")

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

Dim frmCalled As New CompanyBranch

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.DTLDisplay FillSpace(MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0), 3) + " - " + MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 2)
Me.Enabled = False

End Sub

Private Sub Command2_Click()

Dim frmCalled As New CompanyDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ViewDetail MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
Me.Enabled = False

End Sub

Private Sub Command3_Click()

Dim frmCalled As New CompanyDetail

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.CreateDetail
Me.Enabled = False

End Sub

Private Sub Command4_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As New ADODB.Parameter
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
tCmd.CommandText = "app_company_delete"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0))

For i = 0 To 0
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
End Sub

Private Sub Command6_Click()

Dim frmCalled As New CompanyDetail

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ModifyDetail MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
Me.Enabled = False

End Sub

Private Sub Form_Load()
    Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
    Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
    Command5_Click
End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Private Sub MSHFlexGrid1_DblClick()

Command2_Click

End Sub
