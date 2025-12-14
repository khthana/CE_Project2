VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form LeaveDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Leave Information"
   ClientHeight    =   4275
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8175
   Icon            =   "LeaveDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4275
   ScaleWidth      =   8175
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5400
      TabIndex        =   11
      Top             =   3360
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6720
      TabIndex        =   12
      Top             =   3360
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Leave Information"
      Height          =   3015
      Left            =   240
      TabIndex        =   13
      Top             =   240
      Width           =   7695
      Begin VB.Frame Frame3 
         Caption         =   "Trans Type"
         Height          =   615
         Left            =   3480
         TabIndex        =   25
         Top             =   1340
         Width           =   3975
         Begin VB.OptionButton Option2 
            Caption         =   "Carried Over"
            Height          =   255
            Index           =   2
            Left            =   2640
            TabIndex        =   7
            Top             =   240
            Width           =   1215
         End
         Begin VB.OptionButton Option2 
            Caption         =   "Used"
            Height          =   255
            Index           =   1
            Left            =   1440
            TabIndex        =   6
            Top             =   240
            Value           =   -1  'True
            Width           =   1095
         End
         Begin VB.OptionButton Option2 
            Caption         =   "Earned"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   5
            Top             =   240
            Width           =   1095
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Leave Type"
         Height          =   615
         Left            =   3480
         TabIndex        =   24
         Top             =   720
         Width           =   3975
         Begin VB.OptionButton Option1 
            Caption         =   "Personal"
            Height          =   255
            Index           =   2
            Left            =   2640
            TabIndex        =   4
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Sick"
            Height          =   255
            Index           =   1
            Left            =   1440
            TabIndex        =   3
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Vacation"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   2
            Top             =   240
            Value           =   -1  'True
            Width           =   1095
         End
      End
      Begin VB.TextBox Text4 
         Alignment       =   1  'Right Justify
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   285
         Index           =   0
         Left            =   1680
         MaxLength       =   20
         TabIndex        =   8
         Text            =   "Text4"
         Top             =   1020
         Width           =   1695
      End
      Begin VB.ComboBox EmpCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1680
         TabIndex        =   0
         Text            =   "Combo1"
         Top             =   300
         Width           =   5775
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1680
         TabIndex        =   1
         Top             =   660
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   60620801
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   1680
         TabIndex        =   9
         Top             =   1380
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   60620801
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker3 
         Height          =   315
         Left            =   1680
         TabIndex        =   10
         Top             =   1740
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   60620801
         CurrentDate     =   37642
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "End Date :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   23
         Top             =   1800
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   8
         Left            =   1800
         TabIndex        =   22
         Top             =   2520
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   240
         TabIndex        =   21
         Top             =   2280
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   240
         TabIndex        =   20
         Top             =   2520
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   7
         Left            =   1800
         TabIndex        =   19
         Top             =   2280
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Start Date :"
         Height          =   255
         Index           =   4
         Left            =   240
         TabIndex        =   18
         Top             =   1440
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Amount :"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   17
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Trans Date :"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   16
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Employee :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   15
         Top             =   360
         Width           =   975
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   14
      Top             =   3960
      Width           =   8175
      _ExtentX        =   14420
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
Attribute VB_Name = "LeaveDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub ClrScr()
Dim i  As Long

EmpCb.Clear

Label2(7).Caption = "N/A"
Label2(8).Caption = "N/A"

DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DateFilter(Now)
DTPicker3.Value = DateFilter(Now)

DTPicker2.Visible = True
DTPicker3.Visible = True

Text4(0).Text = ""

Option1(0).Value = True
Option2(1).Value = True

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(9) As New ADODB.Parameter
Dim xPr(7) As New ADODB.Parameter
Dim i As Long

If CFC(Text4(0).Text) < 0 Then
    MsgBox "Amount must not be less than zero...", vbCritical + vbOKOnly
    Exit Sub
End If

If DTPicker3.Value < DTPicker2.Value Then
    MsgBox "EndTime must be greater than FromTime...", vbCritical + vbOKOnly
    Exit Sub
End If

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_leave_history_insert"

        Set tPr(0) = tCmd.CreateParameter("dYear", adInteger, adParamInput, 4, CurDyr)
        Set tPr(1) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10, Trim(Left(EmpCb.Text, 10)))
        
        If Option1(0).Value = True Then Set tPr(3) = tCmd.CreateParameter("LeaveType", adTinyInt, adParamInput, 1, 1)
        If Option1(1).Value = True Then Set tPr(3) = tCmd.CreateParameter("LeaveType", adTinyInt, adParamInput, 1, 2)
        If Option1(2).Value = True Then Set tPr(3) = tCmd.CreateParameter("LeaveType", adTinyInt, adParamInput, 1, 3)
        
        If Option2(0).Value = True Then Set tPr(4) = tCmd.CreateParameter("LVTransType", adChar, adParamInput, 1, "E")
        If Option2(1).Value = True Then Set tPr(4) = tCmd.CreateParameter("LVTransType", adChar, adParamInput, 1, "U")
        If Option2(2).Value = True Then Set tPr(4) = tCmd.CreateParameter("LVTransType", adChar, adParamInput, 1, "C")
        
        Set tPr(5) = tCmd.CreateParameter("TransDate", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        
        If Option2(0).Value = True Then
            Set tPr(6) = tCmd.CreateParameter("StartDate", adDBTimeStamp, adParamInput, 8, Null)
            Set tPr(7) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8, Null)
        Else
            Set tPr(6) = tCmd.CreateParameter("StartDate", adDBTimeStamp, adParamInput, 8, DTPicker2.Value)
            Set tPr(7) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8, DTPicker3.Value)
        End If

        Set tPr(8) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8, CFC(Text4(0).Text))
        Set tPr(9) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 9
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_leave_history_update"
        
        Set xPr(0) = tCmd.CreateParameter("ID", adGUID, adParamInput, , OldCode)
        
        If Option1(0).Value = True Then Set xPr(1) = tCmd.CreateParameter("LeaveType", adTinyInt, adParamInput, 1, 1)
        If Option1(1).Value = True Then Set xPr(1) = tCmd.CreateParameter("LeaveType", adTinyInt, adParamInput, 1, 2)
        If Option1(2).Value = True Then Set xPr(1) = tCmd.CreateParameter("LeaveType", adTinyInt, adParamInput, 1, 3)
        
        If Option2(0).Value = True Then Set xPr(2) = tCmd.CreateParameter("LVTransType", adChar, adParamInput, 1, "E")
        If Option2(1).Value = True Then Set xPr(2) = tCmd.CreateParameter("LVTransType", adChar, adParamInput, 1, "U")
        If Option2(2).Value = True Then Set xPr(2) = tCmd.CreateParameter("LVTransType", adChar, adParamInput, 1, "C")
        
        Set xPr(3) = tCmd.CreateParameter("TransDate", adDBTimeStamp, adParamInput, 8, DTPicker1.Value)
        
        If Option2(0).Value = True Then
            Set xPr(4) = tCmd.CreateParameter("StartDate", adDBTimeStamp, adParamInput, 8, Null)
            Set xPr(5) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8, Null)
        Else
            Set xPr(4) = tCmd.CreateParameter("StartDate", adDBTimeStamp, adParamInput, 8, DTPicker2.Value)
            Set xPr(5) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8, DTPicker3.Value)
        End If
        
        Set xPr(6) = tCmd.CreateParameter("Amount", adCurrency, adParamInput, 8, CFC(Text4(0).Text))
        Set xPr(7) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 7
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

Private Sub DTPicker2_Change()
Dim d As Long

d = Cur2IntwUp(CFC(Text4(0).Text)) - 1
If d < 0 Then d = 0

DTPicker3.Value = DateAdd("d", d, DTPicker2.Value)

End Sub

Private Sub DTPicker3_Change()

Dim d As Long

d = Cur2IntwUp(CFC(Text4(0).Text)) - 1
If d < 0 Then d = 0

DTPicker2.Value = DateAdd("d", (-1) * d, DTPicker3.Value)

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
Dim i As Long

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create

End Sub

Public Sub ViewDetail(ByVal CodeParam As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As New ADODB.Parameter
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
tCmd.CommandText = "pr_leave_history_select"

Set tPr(0) = tCmd.CreateParameter("ID", adGUID, adParamInput, , CodeParam)

For i = 0 To 0
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

EmpCbSelect tRs("EID")

DTPicker1.Value = tRs("TransDate")

Text4(0).Text = Format(tRs("Amount"), "#,##0.00")

Option1(tRs("LeaveType") - 1).Value = True

Select Case tRs("LVTransType")
    Case Is = "E"
        Option2(0).Value = True
        DTPicker2.Visible = False
        DTPicker3.Visible = False
    Case Is = "U"
        Option2(1).Value = True
        DTPicker2.Value = tRs("StartDate")
        DTPicker3.Value = tRs("EndDate")
        DTPicker2.Visible = True
        DTPicker3.Visible = True
    Case Is = "C"
        Option2(2).Value = True
        DTPicker2.Value = tRs("StartDate")
        DTPicker3.Value = tRs("EndDate")
        DTPicker2.Visible = True
        DTPicker3.Visible = True
End Select
    
If IsNull(tRs("CreateUserID")) Or IsNull(tRs("CreateDateTime")) Then
    Label2(7).Caption = "N/A"
Else
    Label2(7).Caption = Trim(tRs("CreateUserID")) + " :: " + Format(tRs("CreateDateTime"), "Long Date") + " " + Format(tRs("CreateDateTime"), "Long Time")
End If
If IsNull(tRs("LastModifyUserID")) Or IsNull(tRs("LastModifyDateTime")) Then
    Label2(8).Caption = "N/A"
Else
    Label2(8).Caption = Trim(tRs("LastModifyUserID")) + " :: " + Format(tRs("LastModifyDateTime"), "Long Date") + " " + Format(tRs("LastModifyDateTime"), "Long Time")
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

Private Sub Option2_Click(Index As Integer)

If Index = 0 Then
    DTPicker2.Visible = False
    DTPicker3.Visible = False
Else
    DTPicker2.Visible = True
    DTPicker3.Visible = True
End If

End Sub

Private Sub Text4_Change(Index As Integer)

DTPicker2_Change

End Sub
