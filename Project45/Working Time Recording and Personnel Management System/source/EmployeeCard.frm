VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form EmployeeCard 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Employee Card"
   ClientHeight    =   5325
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8790
   Icon            =   "EmployeeCard.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5325
   ScaleWidth      =   8790
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Caption         =   "List of Employee Card"
      Height          =   4575
      Left            =   240
      TabIndex        =   6
      Top             =   240
      Width           =   8295
      Begin VB.CommandButton Command6 
         Caption         =   "&Select"
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   0
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7200
         TabIndex        =   5
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   4560
         TabIndex        =   4
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   3480
         TabIndex        =   3
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command2 
         Caption         =   "&View"
         Height          =   375
         Left            =   2400
         TabIndex        =   2
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&Create"
         Height          =   375
         Left            =   1320
         TabIndex        =   1
         Top             =   4080
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3735
         Left            =   120
         TabIndex        =   8
         ToolTipText     =   "Double Click to view detail..."
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   6588
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   5010
      Width           =   8790
      _ExtentX        =   15505
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
Attribute VB_Name = "EmployeeCard"
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

MSHFlexGrid1.Cols = 6
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "EID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 1200

MSHFlexGrid1.TextMatrix(0, 1) = "CardHolderName"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 2000

MSHFlexGrid1.TextMatrix(0, 2) = "Void"
MSHFlexGrid1.ColAlignment(2) = flexAlignCenterCenter
MSHFlexGrid1.ColWidth(2) = 500

MSHFlexGrid1.TextMatrix(0, 3) = "CardID"
MSHFlexGrid1.ColAlignment(3) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(3) = 2000

MSHFlexGrid1.TextMatrix(0, 4) = "EffectiveDate"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 2000

MSHFlexGrid1.TextMatrix(0, 5) = "ExpireDate"
MSHFlexGrid1.ColAlignment(5) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(5) = 2000

MSHFlexGrid1.MergeCells = flexMergeRestrictRows
MSHFlexGrid1.MergeCol(0) = True
MSHFlexGrid1.MergeCol(1) = True
MSHFlexGrid1.MergeCol(2) = False
MSHFlexGrid1.MergeCol(3) = False
MSHFlexGrid1.MergeCol(4) = False
MSHFlexGrid1.MergeCol(5) = False

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant
Dim x(1) As Byte

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_employee_card_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1
    
    If IsNull(tRs("EffectiveDate")) = False Then
        EFD$ = Format(tRs("EffectiveDate"), "short date")
    Else
        EFD$ = "N/A"
    End If
    
    If IsNull(tRs("ExpireDate")) = False Then
        EXD$ = Format(tRs("ExpireDate"), "short date")
    Else
        EXD$ = "N/A"
    End If
    
    MSHFlexGrid1.AddItem tRs("EID") + Chr(9) + tRs("CardHolderName") + Chr(9) + Format(tRs("Void"), "Yes/No") + Chr(9) + tRs("CardID") + Chr(9) + EFD$ + Chr(9) + EXD$

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

Dim frmCalled As New EmployeeCardDetail

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.CreateDetail
Me.Enabled = False

End Sub

Private Sub Command2_Click()

Dim frmCalled As New EmployeeCardDetail

If MSHFlexGrid1.RowSel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ViewDetail MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 3)
Me.Enabled = False

End Sub

Private Sub Command3_Click()

Dim frmCalled As New EmployeeCardDetail

If MSHFlexGrid1.RowSel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.ModifyDetail MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 3)
Me.Enabled = False

End Sub

Private Sub Command4_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As Variant

On Error GoTo ErrHandler

If MSHFlexGrid1.RowSel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to delete this record?", vbQuestion + vbYesNo)
If Co = vbYes Then

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_employee_card_delete"

tPr(0) = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 3)

Set tRs = tCmd.Execute(, tPr)

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

On Error GoTo ErrHandler

frmCaller.EmpCardCbSelect MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 3)
Unload Me
frmCaller.ZOrder 0
frmCaller.SetFocus
    
Exit Sub
ErrHandler:

Command6.Enabled = False

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

Public Sub SelectCalled()

Command6.Enabled = True

End Sub
