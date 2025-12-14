VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form BankBranchPayRollDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "PayRoll-Supported Bank Branch Information"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7695
   Icon            =   "BankBranchPayRollDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   7695
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6240
      TabIndex        =   4
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4920
      TabIndex        =   3
      Top             =   2280
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Bank Branch Information"
      Height          =   1935
      Left            =   240
      TabIndex        =   6
      Top             =   240
      Width           =   7215
      Begin VB.CommandButton Command3 
         Height          =   315
         Left            =   6480
         Picture         =   "BankBranchPayRollDetail.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   300
         Width           =   375
      End
      Begin VB.ComboBox BankBrCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         TabIndex        =   0
         Text            =   "Combo1"
         Top             =   300
         Width           =   4575
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   10
         TabIndex        =   2
         Text            =   "Text1"
         Top             =   660
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Customer ID :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   12
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
         TabIndex        =   11
         Top             =   1440
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   10
         Top             =   1080
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   9
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   8
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Bank Branch ID :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   7
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   2880
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
Attribute VB_Name = "BankBranchPayRollDetail"
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

LoadBankBrCb

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Check2_Click()

If Check2.Value = Checked Then
    Text4.Visible = True
Else
    Text4.Visible = False
End If

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(3) As New ADODB.Parameter
Dim xPr(4) As New ADODB.Parameter
Dim i As Long

For i = 0 To BankBrCb.ListCount - 1
    If BankBrCb.Text = BankBrCb.List(i) Then GoTo FoundBankBrCb
Next i

MsgBox "Invalid Bank ID...", vbCritical + vbOKOnly
Exit Sub
FoundBankBrCb:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_bankbranchpayroll_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set tPr(1) = tCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8, Trim(Left(BankBrCb.Text, 8)))
        Set tPr(2) = tCmd.CreateParameter("CustomerID", adVarChar, adParamInput, 10, Text1.Text)
        Set tPr(3) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 3
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_bankbranchpayroll_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set xPr(1) = tCmd.CreateParameter("oldBankBrID", adVarChar, adParamInput, 8, OldCode)
        Set xPr(2) = tCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8, Trim(Left(BankBrCb.Text, 8)))
        Set xPr(3) = tCmd.CreateParameter("CustomerD", adVarChar, adParamInput, 10, Text1.Text)
        Set xPr(4) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 4
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

Dim frmCalled As New BankBranch
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
Dim tPr(1) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_bankbranchpayroll_select"

tPr(0) = CurCmp
tPr(1) = CodeParam

Set tRs = tCmd.Execute(, tPr)

BankBrCbSelect tRs("BankBrID")

Text1.Text = tRs("CustomerID")

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

Public Sub LoadBankBrCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_bankbranch_select_all"

Set tRs = tCmd.Execute

BankBrCb.Clear

Do While Not tRs.EOF

    BankBrCb.AddItem FillSpace(tRs("BankBrID"), 8) + " - " + tRs("EN_BankBrName")

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

Public Sub BankBrCbSelect(ByVal Param As String)
Dim i As Long

LoadBankBrCb

For i = 0 To BankBrCb.ListCount - 1
    If Trim(Left(BankBrCb.List(i), 8)) = Trim(Param) Then
        BankBrCb.Text = BankBrCb.List(i)
        Exit Sub
    End If
Next i

End Sub

