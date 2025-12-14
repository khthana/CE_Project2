VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form ManualTimeRecordDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Manual Time Record Information"
   ClientHeight    =   3915
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8745
   Icon            =   "ManualTimeRecordDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3915
   ScaleWidth      =   8745
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   6000
      TabIndex        =   5
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   7320
      TabIndex        =   6
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Manual Time Record Information"
      Height          =   2655
      Left            =   240
      TabIndex        =   8
      Top             =   240
      Width           =   8295
      Begin VB.CheckBox Check3 
         Caption         =   "Error"
         Enabled         =   0   'False
         Height          =   255
         Left            =   4920
         TabIndex        =   20
         Top             =   1440
         Width           =   1815
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Transferred"
         Enabled         =   0   'False
         Height          =   255
         Left            =   3120
         TabIndex        =   19
         Top             =   1440
         Width           =   1335
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Cancelled"
         Enabled         =   0   'False
         Height          =   255
         Left            =   1560
         TabIndex        =   18
         Top             =   1440
         Width           =   1095
      End
      Begin VB.CommandButton Command3 
         Height          =   315
         Left            =   7200
         Picture         =   "ManualTimeRecordDetail.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   300
         Width           =   375
      End
      Begin VB.ComboBox JobCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1560
         TabIndex        =   7
         Text            =   "Combo1"
         Top             =   1020
         Width           =   5655
      End
      Begin VB.CommandButton Command7 
         Height          =   315
         Left            =   7200
         Picture         =   "ManualTimeRecordDetail.frx":0544
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   1020
         Width           =   375
      End
      Begin VB.ComboBox EmpCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1560
         TabIndex        =   0
         Text            =   "Combo1"
         Top             =   300
         Width           =   5655
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1560
         TabIndex        =   2
         Top             =   660
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   19726339
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   5160
         TabIndex        =   3
         Top             =   660
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         CustomFormat    =   "dd/MM/yyyy HH:mm:ss"
         Format          =   19726339
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   240
         TabIndex        =   17
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   240
         TabIndex        =   16
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1560
         TabIndex        =   15
         Top             =   1800
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1560
         TabIndex        =   14
         Top             =   2160
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Job :"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   12
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "To Date :"
         Height          =   255
         Left            =   4080
         TabIndex        =   10
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "From Date :"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   720
         Width           =   1095
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   13
      Top             =   3600
      Width           =   8745
      _ExtentX        =   15425
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
Attribute VB_Name = "ManualTimeRecordDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private CalMethodRF As Boolean

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub ClrScr()

DTPicker1.Value = Now
DTPicker2.Value = Now

Check1.Value = Unchecked
Check2.Value = Unchecked
Check3.Value = Unchecked

LoadEmpCb
LoadJobCb

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Public Sub LoadJobCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_job_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

JobCb.Clear

Do While Not tRs.EOF

    JobCb.AddItem FillSpace(tRs("JobCode"), 10) + " - " + tRs("EN_JobName")

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

Public Sub JobCbSelect(ByVal Param As String)
Dim i As Long

LoadJobCb

For i = 0 To JobCb.ListCount - 1
    If Trim(Left(JobCb.List(i), 10)) = Trim(Param) Then
        JobCb.Text = JobCb.List(i)
        Exit Sub
    End If
Next i

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

Private Sub Command1_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(7) As New ADODB.Parameter
Dim xPr(9) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

If DTPicker1.Value >= DTPicker2.Value Then
    MsgBox "ToDate must be greater then FromDate...", vbCritical + vbOKOnly
    Exit Sub
End If

For i = 0 To EmpCb.ListCount - 1
    If EmpCb.List(i) = EmpCb.Text Then GoTo FoundEmpCb
Next i

MsgBox "Invalid Employee Information...", vbCritical + vbOKOnly
Exit Sub
FoundEmpCb:

For i = 0 To JobCb.ListCount - 1
    If JobCb.List(i) = JobCb.Text Then GoTo FoundJobCb
Next i

MsgBox "Invalid Job Information...", vbCritical + vbOKOnly
Exit Sub
FoundJobCb:

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_manual_time_record_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
        Set tPr(2) = tCmd.CreateParameter("FromDate", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        Set tPr(3) = tCmd.CreateParameter("ToDate", adDBTimeStamp, adParamInput, 8, DTPicker2.Value)
        Set tPr(4) = tCmd.CreateParameter("JobCode", adVarChar, adParamInput, 10, Trim(Left(JobCb.Text, 10)))
        Set tPr(5) = tCmd.CreateParameter("Transferred", adBoolean, adParamInput, 1, Check2.Value)
        Set tPr(6) = tCmd.CreateParameter("Cancelled", adBoolean, adParamInput, 1, Check1.Value)
        Set tPr(7) = tCmd.CreateParameter("CreateUserID ", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 7
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_manual_time_record_update"

        Set xPr(0) = tCmd.CreateParameter("ID", adGUID, adParamInput, , OldCode)
        Set xPr(1) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set xPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
        Set xPr(3) = tCmd.CreateParameter("FromDate", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        Set xPr(4) = tCmd.CreateParameter("ToDate", adDBTimeStamp, adParamInput, 8, DTPicker2.Value)
        Set xPr(5) = tCmd.CreateParameter("JobCode", adVarChar, adParamInput, 10, Trim(Left(JobCb.Text, 10)))
        Set xPr(6) = tCmd.CreateParameter("Transferred", adBoolean, adParamInput, 1, Check2.Value)
        Set xPr(7) = tCmd.CreateParameter("Cancelled", adBoolean, adParamInput, 1, Check1.Value)
        Set xPr(8) = tCmd.CreateParameter("Error", adBoolean, adParamInput, 1, Check1.Value)
        Set xPr(9) = tCmd.CreateParameter("LastModifyUserID ", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 9
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

Private Sub Command3_Click()

Dim frmCalled As New Employee
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command7_Click()

Dim frmCalled As New Job
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub EmpCb_Change()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_employee_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)

tPr(0).Value = CurCmp
tPr(1).Value = Trim(Left(EmpCb.Text, 10))

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

If Not tRs.EOF Then
    JobCbSelect tRs("DefaultJobCode")
End If

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub EmpCb_Click()

EmpCb_Change

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

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create
Label2(0).Caption = "N/A"
Label2(1).Caption = "N/A"

End Sub

Public Sub ViewDetail(ByVal CodeParam As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As New Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_manual_time_record_select"

Set tPr(0) = tCmd.CreateParameter("ID", adGUID, adParamInput, , CodeParam)

For i = 0 To 0
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

EmpCbSelect tRs("EID")
DTPicker1.Value = tRs("FromDate")
DTPicker2.Value = tRs("ToDate")
JobCbSelect tRs("JobCode")
Check1.Value = Abs(CInt(tRs("Cancelled")))
Check2.Value = Abs(CInt(tRs("Transferred")))
Check3.Value = Abs(CInt(tRs("Error")))

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

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Public Sub ModifyDetail(ByVal CodeParam As String)

OldCode = CodeParam

ViewDetail CodeParam

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Frame1.Enabled = True
Command1.Enabled = True

End Sub

