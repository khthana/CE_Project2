VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form UserGroupPermission 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "User Group Permission"
   ClientHeight    =   7155
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9615
   Icon            =   "UserGroupPermission.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7155
   ScaleWidth      =   9615
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command6 
      Caption         =   "&Drop All"
      Height          =   375
      Left            =   2760
      TabIndex        =   6
      Top             =   6240
      Width           =   1095
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Grant &All"
      Height          =   375
      Left            =   1560
      TabIndex        =   5
      Top             =   6240
      Width           =   1095
   End
   Begin VB.Frame Frame2 
      Caption         =   "Permission"
      Height          =   4575
      Left            =   240
      TabIndex        =   13
      Top             =   1560
      Width           =   9135
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   4215
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   8895
         _ExtentX        =   15690
         _ExtentY        =   7435
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
   End
   Begin VB.CommandButton Command4 
      Caption         =   "&Reload"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   6240
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Save"
      Height          =   375
      Left            =   7080
      TabIndex        =   7
      Top             =   6240
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   8280
      TabIndex        =   8
      Top             =   6240
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Conditions"
      Height          =   1215
      Left            =   240
      TabIndex        =   9
      Top             =   240
      Width           =   9135
      Begin VB.ComboBox CmpCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1800
         TabIndex        =   2
         Text            =   "Combo2"
         Top             =   660
         Width           =   6615
      End
      Begin VB.CommandButton Command3 
         Height          =   315
         Left            =   8400
         Picture         =   "UserGroupPermission.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   300
         Width           =   375
      End
      Begin VB.ComboBox UsrGrpCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1800
         TabIndex        =   0
         Text            =   "Combo1"
         Top             =   300
         Width           =   6615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Company :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   12
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "User Group Code :"
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   10
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   11
      Top             =   6840
      Width           =   9615
      _ExtentX        =   16960
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
Attribute VB_Name = "UserGroupPermission"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private numRec As Long
Private frmCaller As Object
Private dirtyFlag As Boolean

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 4
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "FeatureCode"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 0

MSHFlexGrid1.TextMatrix(0, 1) = "Feature Description"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 8300

MSHFlexGrid1.TextMatrix(0, 2) = "OldValue"
MSHFlexGrid1.ColAlignment(2) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(2) = 0

MSHFlexGrid1.TextMatrix(0, 3) = "V"
MSHFlexGrid1.ColAlignment(3) = flexAlignCenterCenter
MSHFlexGrid1.ColWidth(3) = 250

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As Variant
Dim i As Long

If dirtyFlag = True Then
    Command2_Click
End If

dirtyFlag = False

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_group_permission_select_all"

tPr(0) = Trim(Left(UsrGrpCb.Text, 6))
tPr(1) = Trim(Left(CmpCb.Text, 3))

Set tRs = tCmd.Execute(, tPr)

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1

    VL$ = Bool2X(Not (IsNull(tRs("fc"))))

    MSHFlexGrid1.AddItem tRs("FeatureCode") + Chr(9) + tRs("FeatureName") + Chr(9) + VL$ + Chr(9) + VL$

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

Private Sub CmpCb_Change()

Command4_Click

End Sub

Private Sub CmpCb_Click()

Command4_Click

End Sub

Private Sub Command1_Click()

Unload Me

End Sub

Private Sub Command2_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(4) As Variant
Dim i As Long
Dim j As Long

On Error GoTo ErrHandler

If numRec = 0 Then
    MsgBox "No record found...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to save changes?", vbQuestion + vbYesNo)
If Co = vbYes Then

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_group_permission_update"

For i = 1 To numRec
    If MSHFlexGrid1.TextMatrix(i, 2) <> MSHFlexGrid1.TextMatrix(i, 3) Then
        
        For j = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next j
        
        Set tPr(0) = tCmd.CreateParameter("UserGroupCode", adVarChar, adParamInput, 6)
        Set tPr(1) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(2) = tCmd.CreateParameter("FeatureCode", adVarChar, adParamInput, 10)
        Set tPr(3) = tCmd.CreateParameter("Value", adBoolean, adParamInput, 1)
        Set tPr(4) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
        
        tPr(0).Value = Trim(Left(UsrGrpCb.Text, 6))
        tPr(1).Value = Trim(Left(CmpCb.Text, 3))
        tPr(2).Value = MSHFlexGrid1.TextMatrix(i, 0)
        tPr(3).Value = X2Bool(MSHFlexGrid1.TextMatrix(i, 3))
        tPr(4).Value = CurUser
        
        For j = 0 To 4
            tCmd.Parameters.Append tPr(j)
        Next j

        Set tRs = tCmd.Execute
    End If
Next i

Set tRs = Nothing
Set tCmd = Nothing

dirtyFlag = False

Command4_Click

End If

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command3_Click()

Dim frmCalled As New UserGroup
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command4_Click()

LoadMSHFlexGrid1

End Sub

Private Sub Command5_Click()
Dim i As Long

For i = 1 To numRec
    MSHFlexGrid1.TextMatrix(i, 3) = "X"
Next i

End Sub

Private Sub Command6_Click()
Dim i As Long

For i = 1 To numRec
    MSHFlexGrid1.TextMatrix(i, 3) = ""
Next i

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

dirtyFlag = False

LoadUsrGrpCb
LoadCmpCb
Command4_Click

End Sub

Private Sub MSHFlexGrid1_EnterCell()

Dim Rowsel As Long, Colsel As Long
Dim Value As String

Rowsel = MSHFlexGrid1.Rowsel
Colsel = MSHFlexGrid1.Colsel
Value = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel)

If Colsel = 3 Then
    If MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel) = "X" Then
        MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel) = ""
    Else
        MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, MSHFlexGrid1.Colsel) = "X"
    End If
    dirtyFlag = True
    MSHFlexGrid1.Col = 0
End If

End Sub

Public Sub LoadUsrGrpCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_group_select_all"

Set tRs = tCmd.Execute

UsrGrpCb.Clear

Do While Not tRs.EOF

    UsrGrpCb.AddItem FillSpace(tRs("UserGroupCode"), 6) + " - " + tRs("UserGroupName")

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

Public Sub UsrGrpCbSelect(ByVal Param As String)
Dim i As Long

LoadUsrGrpCb

For i = 0 To UsrGrpCb.ListCount - 1
    If Trim(Left(UsrGrpCb.List(i), 6)) = Trim(Param) Then
        UsrGrpCb.Text = UsrGrpCb.List(i)
        Command4_Click
        Exit Sub
    End If
Next i

End Sub

Public Sub LoadCmpCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_company_select_all"

Set tRs = tCmd.Execute

CmpCb.Clear

Do While Not tRs.EOF

    CmpCb.AddItem FillSpace(tRs("CID"), 3) + " - " + tRs("EN_CompanyName")

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

Private Sub UsrGrpCb_Change()

Command4_Click

End Sub

Private Sub UsrGrpCb_Click()

Command4_Click

End Sub
