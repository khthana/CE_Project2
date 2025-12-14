VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form BankBranchDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Bank Branch Information"
   ClientHeight    =   3900
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7695
   Icon            =   "BankBranchDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   7695
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6240
      TabIndex        =   7
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4920
      TabIndex        =   6
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Bank Branch Information"
      Height          =   2655
      Left            =   240
      TabIndex        =   9
      Top             =   240
      Width           =   7215
      Begin VB.CommandButton Command3 
         Height          =   315
         Left            =   6480
         Picture         =   "BankBranchDetail.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   660
         Width           =   375
      End
      Begin VB.ComboBox BankCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   660
         Width           =   4575
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Located in Local Area"
         Height          =   255
         Left            =   4800
         TabIndex        =   1
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox Text3 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   5
         Text            =   "Text3"
         Top             =   1380
         Width           =   4935
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   4
         Text            =   "Text2"
         Top             =   1020
         Width           =   4935
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   8
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   300
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Bank ID :"
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
         Top             =   2160
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
         Top             =   1800
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   14
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   13
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Name :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   12
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Name :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   11
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Bank Branch ID :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   10
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   8
      Top             =   3585
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
Attribute VB_Name = "BankBranchDetail"
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
Text3.Text = ""

LoadBankCb

Check1.Value = Checked

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
Dim tPr(6) As New ADODB.Parameter
Dim xPr(7) As New ADODB.Parameter
Dim i As Long

For i = 0 To BankCb.ListCount - 1
    If BankCb.Text = BankCb.List(i) Then GoTo FoundBankCb
Next i

MsgBox "Invalid Bank ID...", vbCritical + vbOKOnly
Exit Sub
FoundBankCb:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_bankbranch_insert"

        Set tPr(0) = tCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8, Text1.Text)
        Set tPr(1) = tCmd.CreateParameter("BankID", adVarChar, adParamInput, 3, Trim(Left(BankCb.Text, 3)))
        Set tPr(2) = tCmd.CreateParameter("TH_BankBrName", adVarChar, adParamInput, 30, Text2.Text)
        Set tPr(3) = tCmd.CreateParameter("EN_BankBrName", adVarChar, adParamInput, 30, Text3.Text)
        
        If Check1.Value = Checked Then
            Set tPr(4) = tCmd.CreateParameter("InLocalArea", adBoolean, adParamInput, 1, True)
        Else
            Set tPr(4) = tCmd.CreateParameter("InLocalArea", adBoolean, adParamInput, 1, False)
        End If
        
        Set tPr(6) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 6
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_bankbranch_update"

        Set xPr(0) = tCmd.CreateParameter("oldBankBrID", adVarChar, adParamInput, 8, OldCode)
        Set xPr(1) = tCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8, Text1.Text)
        Set xPr(2) = tCmd.CreateParameter("BankID", adVarChar, adParamInput, 3, Trim(Left(BankCb.Text, 3)))
        Set xPr(3) = tCmd.CreateParameter("TH_BankBrName", adVarChar, adParamInput, 30, Text2.Text)
        Set xPr(4) = tCmd.CreateParameter("EN_BankBrName", adVarChar, adParamInput, 30, Text3.Text)
        
        If Check1.Value = Checked Then
            Set xPr(5) = tCmd.CreateParameter("InLocalArea", adBoolean, adParamInput, 1, True)
        Else
            Set xPr(5) = tCmd.CreateParameter("InLocalArea", adBoolean, adParamInput, 1, False)
        End If
        
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

Private Sub Command3_Click()

Dim frmCalled As New Bank
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

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_bankbranch_select"

tPr(0) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("BankBrID")

BankCbSelect tRs("BankID")

Text2.Text = tRs("TH_BankBrName")
Text3.Text = tRs("EN_BankBrName")

If tRs("InLocalArea") = True Then
    Check1.Value = Checked
Else
    Check1.Value = Unchecked
End If

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

Public Sub LoadBankCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_bank_select_all"

Set tRs = tCmd.Execute

BankCb.Clear

Do While Not tRs.EOF

    BankCb.AddItem FillSpace(tRs("BankID"), 3) + " - " + tRs("EN_BankName")

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

Public Sub BankCbSelect(ByVal Param As String)
Dim i As Long

LoadBankCb

For i = 0 To BankCb.ListCount - 1
    If Trim(Left(BankCb.List(i), 3)) = Trim(Param) Then
        BankCb.Text = BankCb.List(i)
        Exit Sub
    End If
Next i

End Sub

