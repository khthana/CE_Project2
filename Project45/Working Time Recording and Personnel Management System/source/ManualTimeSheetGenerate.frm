VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form ManualTimeSheetGenerate 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Generate New Manual Time Sheet"
   ClientHeight    =   6780
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8415
   Icon            =   "ManualTimeSheetGenerate.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6780
   ScaleWidth      =   8415
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame3 
      Caption         =   "DateTime Range"
      Height          =   855
      Left            =   240
      TabIndex        =   13
      Top             =   240
      Width           =   7935
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1320
         TabIndex        =   0
         Top             =   300
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   60620803
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   5280
         TabIndex        =   1
         Top             =   300
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   60620803
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "To Time :"
         Height          =   255
         Left            =   4200
         TabIndex        =   15
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "From Time :"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Generate"
      Height          =   375
      Left            =   6000
      TabIndex        =   8
      Top             =   5880
      Width           =   2055
   End
   Begin VB.Frame Frame2 
      Caption         =   "List of Employee to generate Manual Time Sheet"
      Height          =   3615
      Left            =   240
      TabIndex        =   11
      Top             =   2160
      Width           =   7935
      Begin VB.CommandButton Command7 
         Caption         =   "&Remove"
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   3120
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Clear"
         Height          =   375
         Left            =   6840
         TabIndex        =   7
         Top             =   3120
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   2775
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   4895
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Add Employee to List"
      Height          =   855
      Left            =   240
      TabIndex        =   9
      Top             =   1200
      Width           =   7935
      Begin VB.CommandButton Command2 
         Caption         =   "&Add to List"
         Height          =   315
         Left            =   6480
         TabIndex        =   4
         Top             =   300
         Width           =   1215
      End
      Begin VB.ComboBox EmpCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1200
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   300
         Width           =   4815
      End
      Begin VB.CommandButton Command1 
         Height          =   315
         Left            =   6000
         Picture         =   "ManualTimeSheetGenerate.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   300
         Width           =   375
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee :"
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   360
         Width           =   1095
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   12
      Top             =   6465
      Width           =   8415
      _ExtentX        =   14843
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
Attribute VB_Name = "ManualTimeSheetGenerate"
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

MSHFlexGrid1.Cols = 2
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "EID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 1000

MSHFlexGrid1.TextMatrix(0, 1) = "Name"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 3000

numRec = 0
StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

End Sub

Private Sub Command1_Click()

Dim frmCalled As New Employee
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command2_Click()
Dim i As Long
Dim j As Long

For i = 0 To EmpCb.ListCount - 1
    If EmpCb.Text = EmpCb.List(i) Then
    
        For j = 1 To numRec
            If MSHFlexGrid1.TextMatrix(j, 0) = Trim(Left(EmpCb.Text, 10)) Then
                MsgBox "Unable to add duplicated item...", vbExclamation + vbOKOnly
                Exit Sub
            End If
        Next j
    
        MSHFlexGrid1.AddItem Trim(Left(EmpCb.Text, 10)) + Chr(9) + Trim(Right(EmpCb.Text, Len(EmpCb.Text) - 13))
        
        numRec = numRec + 1
        If numRec = 1 Then MSHFlexGrid1.RemoveItem 1

        StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."
                
        Exit Sub
    End If
Next i

MsgBox "Invalid Employee Information...", vbCritical + vbOKOnly

End Sub

Private Sub Command3_Click()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(3) As New ADODB.Parameter
Dim i As Long
Dim j As Long

If DTPicker1.Value >= DTPicker2.Value Then
    MsgBox "ToTime must be greater than FromTime...", vbCritical + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to generate manual time sheet(s) for above employee(s)?", vbQuestion + vbYesNo)
If Co = vbYes Then

    On Error GoTo ErrHandler
    
    MainMDI.MousePointer = vbHourglass
    Me.Enabled = False
    
    For j = 1 To numRec
    
        For i = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next i
    
        Set tCmd.ActiveConnection = sConn
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_manual_time_sheet_generate"
        
        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set tPr(2) = tCmd.CreateParameter("FromDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(3) = tCmd.CreateParameter("ToDate", adDBTimeStamp, adParamInput, 8)
        
        tPr(0).Value = CurCmp
        tPr(1).Value = MSHFlexGrid1.TextMatrix(j, 0)
        tPr(2).Value = DTPicker1.Value
        tPr(3).Value = DTPicker2.Value
        
        For i = 0 To 3
            tCmd.Parameters.Append tPr(i)
        Next i
        
        Set tRs = tCmd.Execute
    
    Next j
    
    Set sCmd = Nothing
    Set sRs = Nothing
    
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

Private Sub Command5_Click()

MSHFlexGrid1Clear

End Sub

Private Sub Command7_Click()

If MSHFlexGrid1.RowSel = 0 Or numRec = 0 Then
    MsgBox "Please choose item first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to remove this item?", vbQuestion + vbYesNo)
If Co = vbYes Then

    If numRec = 1 Then
        MSHFlexGrid1Clear
    Else
        MSHFlexGrid1.RemoveItem MSHFlexGrid1.RowSel
        numRec = numRec - 1
    End If
    
    StatusBar1.SimpleText = "Total " + Format(numRec, "#,##0") + " record(s)..."

End If

End Sub

Private Sub Form_Load()
    Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
    Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
    DTPicker1.Value = Now
    DTPicker2.Value = Now
    LoadEmpCb
    Command5_Click
End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
    frmCaller.Command5_Click
End If

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
        Command5_Click
        Exit Sub
    End If
Next i

End Sub

