VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form EmployeeCardDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Employee Card Information"
   ClientHeight    =   4275
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7695
   Icon            =   "EmployeeCardDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4275
   ScaleWidth      =   7695
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6240
      TabIndex        =   8
      Top             =   3360
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4920
      TabIndex        =   7
      Top             =   3360
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Employee Card Information"
      Height          =   3015
      Left            =   240
      TabIndex        =   10
      Top             =   240
      Width           =   7215
      Begin VB.CheckBox Check1 
         Caption         =   "Void"
         Height          =   255
         Left            =   6000
         TabIndex        =   1
         Top             =   360
         Width           =   855
      End
      Begin VB.CommandButton Command3 
         Height          =   315
         Left            =   6480
         Picture         =   "EmployeeCardDetail.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   660
         Width           =   375
      End
      Begin VB.ComboBox EmpCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   660
         Width           =   4575
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   1920
         MaxLength       =   10
         PasswordChar    =   "o"
         TabIndex        =   6
         Text            =   "Text2"
         Top             =   1740
         Width           =   1815
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   20
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   300
         Width           =   1815
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1920
         TabIndex        =   4
         Top             =   1020
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   556
         _Version        =   393216
         Format          =   60424193
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   1920
         TabIndex        =   5
         Top             =   1380
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   556
         _Version        =   393216
         Format          =   60424193
         CurrentDate     =   37642
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Expire Date :"
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   19
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Effective Date :"
         Height          =   255
         Index           =   7
         Left            =   360
         TabIndex        =   18
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee ID :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   17
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1920
         TabIndex        =   16
         Top             =   2520
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   15
         Top             =   2160
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   14
         Top             =   2520
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   13
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Password :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   12
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Card ID :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   11
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   9
      Top             =   3960
      Width           =   7695
      _ExtentX        =   13573
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
Attribute VB_Name = "EmployeeCardDetail"
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
Dim i As Long

Text1.Text = ""
Text2.Text = ""
DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DTPicker2.MaxDate

LoadEmpCb

Check1.Value = Unchecked

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(7) As New ADODB.Parameter
Dim xPr(8) As New ADODB.Parameter
Dim i As Long

For i = 0 To EmpCb.ListCount - 1
    If EmpCb.Text = EmpCb.List(i) Then GoTo FoundEmpCb
Next i

MsgBox "Invalid Employee ID...", vbCritical + vbOKOnly
Exit Sub
FoundEmpCb:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_employee_card_insert"

        Set tPr(0) = tCmd.CreateParameter("CardID", adVarChar, adParamInput, 20)
        Set tPr(1) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(2) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set tPr(3) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(4) = tCmd.CreateParameter("ExpireDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(5) = tCmd.CreateParameter("Password", adVarChar, adParamInput, 10)
        Set tPr(6) = tCmd.CreateParameter("Void", adBoolean, adParamInput, 1)
        Set tPr(7) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
    
        tPr(0).Value = Text1.Text
        tPr(1).Value = CurCmp
        tPr(2).Value = Trim(Left(EmpCb.Text, 10))
        tPr(3).Value = DTPicker1.Value
        tPr(4).Value = DTPicker2.Value
        tPr(5).Value = Text2.Text
        
        If Check1.Value = Checked Then tPr(6).Value = True
        If Check1.Value = Unchecked Then tPr(6).Value = False
        
        tPr(7).Value = CurUser

        For i = 0 To 7
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_employee_card_update"

        Set xPr(0) = tCmd.CreateParameter("oldCardID", adVarChar, adParamInput, 20)
        Set xPr(1) = tCmd.CreateParameter("CardID", adVarChar, adParamInput, 20)
        Set xPr(2) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set xPr(3) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set xPr(4) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(5) = tCmd.CreateParameter("ExpireDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(6) = tCmd.CreateParameter("Password", adVarChar, adParamInput, 10)
        Set xPr(7) = tCmd.CreateParameter("Void", adBoolean, adParamInput, 1)
        Set xPr(8) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)
    
        xPr(0).Value = OldCode
        xPr(1).Value = Text1.Text
        xPr(2).Value = CurCmp
        xPr(3).Value = Trim(Left(EmpCb.Text, 10))
        xPr(4).Value = DTPicker1.Value
        xPr(5).Value = DTPicker2.Value
        xPr(6).Value = Text2.Text
        
        If Check1.Value = Checked Then xPr(7).Value = True
        If Check1.Value = Unchecked Then xPr(7).Value = False
        
        xPr(8).Value = CurUser

        For i = 0 To 8
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
Dim tPr(0) As Variant

'On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_employee_card_select"

tPr(0) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("CardID")
EmpCbSelect tRs("EID")

Text2.Text = tRs("Password")

If tRs("Void") = True Then
    Check1.Value = Checked
Else
    Check1.Value = Unchecked
End If

DTPicker1.Value = tRs("EffectiveDate")
If IsNull(tRs("ExpireDate")) = False Then DTPicker2.Value = tRs("ExpireDate")

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

ViewDetail CodeParam

OldCode = CodeParam

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

