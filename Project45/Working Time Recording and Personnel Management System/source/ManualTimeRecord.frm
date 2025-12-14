VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form ManualTimeRecord 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Manual Time Record"
   ClientHeight    =   7035
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8790
   Icon            =   "ManualTimeRecord.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7035
   ScaleWidth      =   8790
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "List Conditions"
      Height          =   1575
      Left            =   240
      TabIndex        =   19
      Top             =   240
      Width           =   8295
      Begin VB.OptionButton Option1 
         Caption         =   "Show both Transferred && not Transferred"
         Height          =   255
         Index           =   2
         Left            =   4800
         TabIndex        =   9
         Top             =   1080
         Width           =   3255
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Show only Transferred"
         Height          =   255
         Index           =   1
         Left            =   2760
         TabIndex        =   8
         Top             =   1080
         Width           =   1935
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Show only not Transferred"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   7
         Top             =   1080
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.CheckBox Check3 
         Caption         =   "To Time :"
         Height          =   255
         Left            =   4320
         TabIndex        =   5
         Top             =   720
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.CheckBox Check2 
         Caption         =   "From Time :"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Employee :"
         Height          =   255
         Left            =   240
         TabIndex        =   0
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7680
         Picture         =   "ManualTimeRecord.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   300
         Width           =   375
      End
      Begin VB.ComboBox EmpCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1560
         TabIndex        =   1
         Text            =   "Combo1"
         Top             =   300
         Width           =   6135
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1560
         TabIndex        =   4
         Top             =   660
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
         Left            =   5640
         TabIndex        =   6
         Top             =   660
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   60620803
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "List of Manual Time Records"
      Height          =   4575
      Left            =   240
      TabIndex        =   17
      Top             =   1920
      Width           =   8295
      Begin VB.CommandButton Command7 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   2280
         TabIndex        =   13
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command6 
         Caption         =   "&View"
         Height          =   375
         Left            =   1200
         TabIndex        =   12
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "&Create"
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command2 
         Caption         =   "&Cancel/Uncancel"
         Height          =   375
         Left            =   3360
         TabIndex        =   14
         Top             =   4080
         Width           =   1575
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7200
         TabIndex        =   16
         Top             =   4080
         Width           =   975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   5040
         TabIndex        =   15
         Top             =   4080
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3735
         Left            =   120
         TabIndex        =   10
         ToolTipText     =   "Double Click to view detail..."
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
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
      TabIndex        =   18
      Top             =   6720
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
Attribute VB_Name = "ManualTimeRecord"
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

MSHFlexGrid1.Cols = 7
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "ID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 0

MSHFlexGrid1.TextMatrix(0, 1) = "EID"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 1500

MSHFlexGrid1.TextMatrix(0, 2) = "FromDate"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 2000

MSHFlexGrid1.TextMatrix(0, 3) = "ToDate"
MSHFlexGrid1.ColAlignment(3) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(3) = 2000

MSHFlexGrid1.TextMatrix(0, 4) = "JobCode"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 1200

MSHFlexGrid1.TextMatrix(0, 5) = "Cancelled"
MSHFlexGrid1.ColAlignment(5) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(5) = 1000

MSHFlexGrid1.TextMatrix(0, 6) = "Transferred"
MSHFlexGrid1.ColAlignment(6) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(6) = 1000

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim aPr(3) As ADODB.Parameter
Dim bPr(4) As ADODB.Parameter
Dim i As Long

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

If Check1.Value = Unchecked Then

    Set tCmd.ActiveConnection = sConn
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "ta_manual_time_record_select_by_DateTime"
    
    Set aPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
    Set aPr(1) = tCmd.CreateParameter("FromDate", adDBTimeStamp, adParamInput, 8)
    Set aPr(2) = tCmd.CreateParameter("ToDate", adDBTimeStamp, adParamInput, 8)
    Set aPr(3) = tCmd.CreateParameter("TransferOption", adTinyInt, adParamInput, 1)
    
    aPr(0).Value = CurCmp
    
    If Check2.Value = Unchecked Then
        aPr(1).Value = Null
    Else
        aPr(1).Value = DTPicker1.Value
    End If
    
    If Check3.Value = Unchecked Then
        aPr(2).Value = Null
    Else
        aPr(2).Value = DTPicker2.Value
    End If
    
    If Option1(0).Value = True Then aPr(3).Value = 1
    If Option1(1).Value = True Then aPr(3).Value = 2
    If Option1(2).Value = True Then aPr(3).Value = 3
    
    For i = 0 To 3
        tCmd.Parameters.Append aPr(i)
    Next i
       
    Set tRs = tCmd.Execute
Else
    
    Set tCmd.ActiveConnection = sConn
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "ta_manual_time_record_select_by_EID"
    
    Set bPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
    Set bPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
    Set bPr(2) = tCmd.CreateParameter("FromDate", adDBTimeStamp, adParamInput, 8)
    Set bPr(3) = tCmd.CreateParameter("ToDate", adDBTimeStamp, adParamInput, 8)
    Set bPr(4) = tCmd.CreateParameter("TransferOption", adTinyInt, adParamInput, 1)
    
    bPr(0).Value = CurCmp
    
    If Check1.Value = Unchecked Then
        bPr(1).Value = Null
    Else
        bPr(1).Value = Trim(Left(EmpCb.Text, 10))
    End If
        
    If Check2.Value = Unchecked Then
        bPr(2).Value = Null
    Else
        bPr(2).Value = DTPicker1.Value
    End If
    
    If Check3.Value = Unchecked Then
        bPr(3).Value = Null
    Else
        bPr(3).Value = DTPicker2.Value
    End If
    
    If Option1(0).Value = True Then bPr(4).Value = 1
    If Option1(1).Value = True Then bPr(4).Value = 2
    If Option1(2).Value = True Then bPr(4).Value = 3
    
    For i = 0 To 4
        tCmd.Parameters.Append bPr(i)
    Next i
    
    Set tRs = tCmd.Execute
End If

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1

    
    MSHFlexGrid1.AddItem Format(tRs("ID"), "0") + Chr(9) + tRs("EID") + Chr(9) + Format(tRs("FromDate"), "dd/MM/yyyy HH:mm:ss") + Chr(9) + Format(tRs("ToDate"), "dd/MM/yyyy HH:mm:ss") + Chr(9) + tRs("JobCode") + Chr(9) + Format(tRs("Cancelled"), "Yes/No") + Chr(9) + Format(tRs("Transferred"), "Yes/No")

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

Private Sub Check1_Click()

If Check1.Value = Checked Then
    EmpCb.Enabled = True
    Command1.Enabled = True
ElseIf Check1.Value = Unchecked Then
    EmpCb.Enabled = False
    Command1.Enabled = False
End If

Command5_Click

End Sub

Private Sub Check2_Click()

If Check2.Value = Checked Then
    DTPicker1.Enabled = True
ElseIf Check2.Value = Unchecked Then
    DTPicker1.Enabled = False
End If

Command5_Click

End Sub

Private Sub Check3_Click()

If Check3.Value = Checked Then
    DTPicker2.Enabled = True
ElseIf Check3.Value = Unchecked Then
    DTPicker2.Enabled = False
End If

Command5_Click

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
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim aPr(2) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to cancel/uncancel this record?", vbQuestion + vbYesNo)
If Co = vbYes Then
    
    Set tCmd.ActiveConnection = sConn
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "ta_manual_time_record_cancel_update"
    
    Set aPr(0) = tCmd.CreateParameter("ID", adGUID, adParamInput)
    Set aPr(1) = tCmd.CreateParameter("Cancelled", adBoolean, adParamInput, 1)
    Set aPr(2) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)
    
    aPr(0).Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
    Select Case MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 5)
        Case Is = "No"
            aPr(1).Value = 1
        Case Is = "Yes"
            aPr(1).Value = 0
    End Select
    
    aPr(2).Value = CurUser
    
    For i = 0 To 2
        tCmd.Parameters.Append aPr(i)
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

Private Sub Command3_Click()

Dim frmCalled As New ManualTimeRecordDetail

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.CreateDetail
Me.Enabled = False

End Sub

Private Sub Command4_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim aPr(0) As ADODB.Parameter
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
    tCmd.CommandText = "ta_manual_time_record_delete"
    
    Set aPr(0) = tCmd.CreateParameter("ID", adGUID, adParamInput)
    
    aPr(0).Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0)
    
    For i = 0 To 0
        tCmd.Parameters.Append aPr(i)
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

Dim frmCalled As New ManualTimeRecordDetail

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

Private Sub Command7_Click()

Dim frmCalled As New ManualTimeRecordDetail

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

Private Sub DTPicker1_Change()

Command5_Click

End Sub

Private Sub DTPicker1_Validate(Cancel As Boolean)

Command5_Click

End Sub

Private Sub DTPicker2_Click()

Command5_Click

End Sub

Private Sub DTPicker2_Validate(Cancel As Boolean)

Command5_Click

End Sub

Private Sub EmpCardCb_Change()

Command5_Click

End Sub

Private Sub EmpCardCb_Click()

Command5_Click

End Sub

Private Sub EmpCb_Change()

Command5_Click

End Sub

Private Sub EmpCb_Click()

Command5_Click

End Sub

Private Sub Form_Load()
    Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
    Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
    
    EmpCb.Enabled = False
    Command1.Enabled = False
    DTPicker1.Enabled = True
    DTPicker2.Enabled = True
    LoadEmpCb
    DTPicker1.Value = Now
    DTPicker2.Value = Now
    
    Check2.Value = Checked
    Check3.Value = Checked
    Option1(0).Value = True
    
    Command5_Click
End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
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

Private Sub MSHFlexGrid1_DblClick()

Command6_Click

End Sub

Private Sub Option1_Click(Index As Integer)

Command5_Click

End Sub
