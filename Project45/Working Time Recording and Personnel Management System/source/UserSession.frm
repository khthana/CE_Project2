VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form UserSession 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "User Session"
   ClientHeight    =   5580
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9060
   Icon            =   "UserSession.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5580
   ScaleWidth      =   9060
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Caption         =   "User Session"
      Height          =   4815
      Left            =   240
      TabIndex        =   7
      Top             =   240
      Width           =   8535
      Begin VB.OptionButton Option1 
         Caption         =   "Show both Active and Inactive Session"
         Height          =   255
         Index           =   2
         Left            =   5040
         TabIndex        =   2
         Top             =   360
         Width           =   3375
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Show only Inactive Session"
         Height          =   255
         Index           =   1
         Left            =   2520
         TabIndex        =   1
         Top             =   360
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Show only Active Session"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   0
         Top             =   360
         Value           =   -1  'True
         Width           =   2535
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Delete &All Inactive"
         Height          =   375
         Left            =   1200
         TabIndex        =   5
         Top             =   4320
         Width           =   1695
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   4320
         Width           =   975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "&Refresh"
         Height          =   375
         Left            =   7440
         TabIndex        =   6
         Top             =   4320
         Width           =   975
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   3495
         Left            =   120
         TabIndex        =   3
         Top             =   720
         Width           =   8295
         _ExtentX        =   14631
         _ExtentY        =   6165
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
      Top             =   5265
      Width           =   9060
      _ExtentX        =   15981
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
Attribute VB_Name = "UserSession"
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

MSHFlexGrid1.TextMatrix(0, 0) = "sesID"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 0

MSHFlexGrid1.TextMatrix(0, 1) = "StartSession"
MSHFlexGrid1.ColAlignment(1) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(1) = 1700

MSHFlexGrid1.TextMatrix(0, 2) = "LastActive"
MSHFlexGrid1.ColAlignment(2) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(2) = 1700

MSHFlexGrid1.TextMatrix(0, 3) = "EndSession"
MSHFlexGrid1.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(3) = 1700

MSHFlexGrid1.TextMatrix(0, 4) = "UserID"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 1200

MSHFlexGrid1.TextMatrix(0, 5) = "WorkStation"
MSHFlexGrid1.ColAlignment(5) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(5) = 1500

End Sub

Sub LoadMSHFlexGrid1()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

MSHFlexGrid1Clear

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_session_select_all"

If Option1(0).Value = True Then tPr(0) = 1
If Option1(1).Value = True Then tPr(0) = 2
If Option1(2).Value = True Then tPr(0) = 3

Set tRs = tCmd.Execute(, tPr)

numRec = 0

Do While Not tRs.EOF
    numRec = numRec + 1

    If IsNull(tRs("EndSession")) = False Then
        ESS$ = Format(tRs("EndSession"), "dd/MM/yyyy HH:mm:ss")
    Else
        ESS$ = ""
    End If

    MSHFlexGrid1.AddItem tRs("sesID") + Chr(9) + Format(tRs("StartSession"), "dd/MM/yyyy HH:mm:ss") + Chr(9) + Format(tRs("LastActive"), "dd/MM/yyyy HH:mm:ss") + Chr(9) + ESS$ + Chr(9) + tRs("UserID") + Chr(9) + tRs("Workstation")

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

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

Co = MsgBox("Do you want to delete all inactive sessions?", vbQuestion + vbYesNo)
If Co = vbYes Then

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_session_delete"

Set tPr(0) = tCmd.CreateParameter("sesID", adGUID, adParamInput, 16, Null)

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

Private Sub Command4_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

If MSHFlexGrid1.Rowsel = 0 Or numRec = 0 Then
    MsgBox "Please choose session first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to delete this session?", vbQuestion + vbYesNo)
If Co = vbYes Then

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_session_delete"

Set tPr(0) = tCmd.CreateParameter("sesID", adGUID, adParamInput, 16, MSHFlexGrid1.TextMatrix(MSHFlexGrid1.Rowsel, 0))

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

Private Sub Command5_Click()

LoadMSHFlexGrid1

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

Private Sub Option1_Click(Index As Integer)

Command5_Click

End Sub
