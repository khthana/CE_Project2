VERSION 5.00
Begin VB.Form EmployeeDetailIncomes 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Employee Information - Incomes"
   ClientHeight    =   3735
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7350
   Icon            =   "EmployeeDetailIncomes.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3735
   ScaleWidth      =   7350
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6000
      TabIndex        =   17
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4800
      TabIndex        =   16
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Incomes Information"
      Height          =   2775
      Left            =   240
      TabIndex        =   9
      Top             =   240
      Width           =   6855
      Begin VB.ComboBox Combo1 
         ForeColor       =   &H00C00000&
         Height          =   315
         ItemData        =   "EmployeeDetailIncomes.frx":0442
         Left            =   1680
         List            =   "EmployeeDetailIncomes.frx":045E
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   660
         Width           =   2055
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
         Left            =   4680
         MaxLength       =   20
         TabIndex        =   4
         Text            =   "Text4"
         Top             =   1020
         Width           =   1935
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Independent Rate"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   1080
         Value           =   -1  'True
         Width           =   1935
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Dependent Rate"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   1440
         Width           =   1575
      End
      Begin VB.ComboBox Combo2 
         ForeColor       =   &H00C00000&
         Height          =   315
         ItemData        =   "EmployeeDetailIncomes.frx":04F4
         Left            =   1680
         List            =   "EmployeeDetailIncomes.frx":0510
         TabIndex        =   6
         Text            =   "IncCb"
         Top             =   1740
         Width           =   4935
      End
      Begin VB.TextBox Text6 
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
         Left            =   1680
         MaxLength       =   20
         TabIndex        =   7
         Top             =   2100
         Width           =   1935
      End
      Begin VB.TextBox Text7 
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
         Left            =   4680
         MaxLength       =   20
         TabIndex        =   8
         Top             =   2100
         Width           =   1935
      End
      Begin VB.CommandButton Command5 
         Height          =   315
         Left            =   6240
         Picture         =   "EmployeeDetailIncomes.frx":05A6
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   300
         Width           =   375
      End
      Begin VB.ComboBox IncCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1680
         TabIndex        =   0
         Text            =   "Combo1"
         Top             =   300
         Width           =   4575
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Calculate Method :"
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   15
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Rate :"
         Height          =   255
         Index           =   0
         Left            =   3960
         TabIndex        =   14
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Incomes Code :"
         Height          =   255
         Index           =   8
         Left            =   360
         TabIndex        =   13
         Top             =   1800
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Ratio :"
         Height          =   255
         Index           =   9
         Left            =   360
         TabIndex        =   12
         Top             =   2160
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Plus :"
         Height          =   255
         Index           =   10
         Left            =   3960
         TabIndex        =   11
         Top             =   2160
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Incomes Code :"
         Height          =   255
         Index           =   7
         Left            =   240
         TabIndex        =   10
         Top             =   360
         Width           =   1455
      End
   End
End
Attribute VB_Name = "EmployeeDetailIncomes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private OldLoc As Long
Private CalMethodRF As Boolean

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub Combo2_Change()

CalMethodRF = True
RateRefresh

End Sub

Private Sub Combo2_Click()

CalMethodRF = True
RateRefresh

End Sub

Private Sub RateRefresh()

Dim XMSHFlexGrid As MSHFlexGrid
Dim XfrmCaller As EmployeeDetail
Dim i As Long

Set XfrmCaller = frmCaller

On Error GoTo ErrHandler

For i = 1 To XfrmCaller.MSHFlexGrid1.Rows - 1
    If XfrmCaller.MSHFlexGrid1.TextMatrix(i, 0) = Trim(Left(Combo2.Text, 8)) Then
        GoTo Found
    End If
Next i

Exit Sub
Found:

If CalMethodRF = True Then Combo1.Text = XfrmCaller.MSHFlexGrid1.TextMatrix(i, 2)
Text4.Text = Format((CFC(XfrmCaller.MSHFlexGrid1.TextMatrix(i, 3)) * CFC(Text6.Text)) + CFC(Text7.Text), "#,##0.0000")

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command1_Click()

Dim XMSHFlexGrid As MSHFlexGrid
Dim XfrmCaller As EmployeeDetail
Dim i As Long

Set XfrmCaller = frmCaller

For i = 0 To IncCb.ListCount - 1
    If IncCb.List(i) = IncCb.Text Then GoTo FoundIncCb
Next i

MsgBox "Invalid IncomesCode...", vbCritical + vbOKOnly
Exit Sub
FoundIncCb:

For i = 0 To Combo1.ListCount - 1
    If Combo1.List(i) = Combo1.Text Then GoTo FoundCombo1
Next i

MsgBox "Invalid Calculate Method...", vbCritical + vbOKOnly
Exit Sub
FoundCombo1:

If Option2.Value = True Then

    For i = 0 To Combo2.ListCount - 1
        If Combo2.List(i) = Combo2.Text Then GoTo FoundCombo2
    Next i

    MsgBox "Invalid Dependent IncomesCode...", vbCritical + vbOKOnly
    Exit Sub
FoundCombo2:

End If

On Error GoTo ErrHandler

Select Case frmStatus
    Case Is = FormState.Create
    
        If XfrmCaller.IsDupIncomes(Trim(Left(IncCb.Text, 8))) = True Then
            MsgBox "Duplicate IncomesCode Found...", vbCritical + vbOKOnly
            Exit Sub
        End If
                
        Inc$ = Trim(Left(IncCb.Text, 8))
        Tit$ = Right(IncCb.Text, Len(IncCb.Text) - 11)
        Cmt$ = Combo1.Text
        Rte$ = Format(CFC(Text4.Text), "#,##0.0000")
        
        If Option1.Value = True Then
            Dic$ = ""
            Drt$ = ""
            Dps$ = ""
        Else
            Dic$ = Trim(Left(Combo2.Text, 8))
            Drt$ = Format(CFC(Text6.Text), "#,##0.0000")
            Dps$ = Format(CFC(Text6.Text), "#,##0.0000")
        End If
        
        XfrmCaller.AddIncomes Inc$, Tit$, Cmt$, Rte$, Dic$, Drt$, Dps$
    
    Case Is = FormState.Modify
    
        If Trim(Left(IncCb.Text, 8)) <> OldCode And XfrmCaller.IsDupIncomes(Trim(Left(IncCb.Text, 8))) = True Then
            MsgBox "Duplicate IncomesCode Found...", vbCritical + vbOKOnly
            Exit Sub
        End If
                
        If Trim(Left(IncCb.Text, 8)) <> OldCode And XfrmCaller.IsDepIncomes(OldCode) = True Then
            MsgBox "Dependent IncomesCode cannot be modified...", vbCritical + vbOKOnly
            Exit Sub
        End If
        
        If Option2.Value = True And XfrmCaller.IsDepIncomes(OldCode) = True Then
            MsgBox "Dependent IncomesCode cannot depend on other IncomesCode...", vbCritical + vbOKOnly
            Exit Sub
        End If
                
        Inc$ = Trim(Left(IncCb.Text, 8))
        Tit$ = Right(IncCb.Text, Len(IncCb.Text) - 11)
        Cmt$ = Combo1.Text
        Rte$ = Format(CFC(Text4.Text), "#,##0.0000")
        
        If Option1.Value = True Then
            Dic$ = ""
            Drt$ = ""
            Dps$ = ""
        Else
            Dic$ = Trim(Left(Combo2.Text, 8))
            Drt$ = Format(CFC(Text6.Text), "#,##0.0000")
            Dps$ = Format(CFC(Text6.Text), "#,##0.0000")
        End If
        
        XfrmCaller.MSHFlexGrid1.TextMatrix(OldLoc, 0) = Inc$
        XfrmCaller.MSHFlexGrid1.TextMatrix(OldLoc, 1) = Tit$
        XfrmCaller.MSHFlexGrid1.TextMatrix(OldLoc, 2) = Cmt$
        XfrmCaller.MSHFlexGrid1.TextMatrix(OldLoc, 3) = Rte$
        XfrmCaller.MSHFlexGrid1.TextMatrix(OldLoc, 4) = Dic$
        XfrmCaller.MSHFlexGrid1.TextMatrix(OldLoc, 5) = Drt$
        XfrmCaller.MSHFlexGrid1.TextMatrix(OldLoc, 6) = Dps$
        
        XfrmCaller.UpdateDepIncomes Inc$, CFC(Text4.Text)
        
    Case Else
        MsgBox "Invalid Form Status...", vbCritical + vbOKOnly
End Select

Unload Me

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command5_Click()

Dim frmCalled As New Incomes
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
ClrScr

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub LoadIncCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_incomes_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

IncCb.Clear

Do While Not tRs.EOF

    IncCb.AddItem FillSpace(tRs("IncomesCode"), 8) + " - " + tRs("EN_Title")

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

Public Sub IncCbSelect(ByVal Param As String)
Dim i As Long

LoadIncCb

For i = 0 To IncCb.ListCount - 1
    If Trim(Left(IncCb.List(i), 8)) = Trim(Param) Then
        IncCb.Text = IncCb.List(i)
        IncCb_Click
        Exit Sub
    End If
Next i

End Sub

Sub ClrScr()

LoadIncCb

Combo1.Text = ""
Combo2.Clear
Text4.Text = ""
'Text6.Text = ""
'Text7.Text = ""

Text4.Enabled = True

Combo2.Enabled = False
Text6.Enabled = False
Text7.Enabled = False

End Sub

Private Sub IncCb_Change()

IncCb_Click

End Sub

Private Sub IncCb_Click()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_incomes_select"
tPr(0) = CurCmp
tPr(1) = Trim(Left(IncCb.Text, 8))

Set tRs = tCmd.Execute(, tPr)

If Not tRs.EOF Then
    Combo1Select tRs("CalMethod")
    Text4.Text = Format(tRs("vRate"), "#,##0.0000")
    LoadCombo2
    If IsNull(tRs("dIncomesCode")) = True Then
        Option1.Value = True
        Option1_Click
        Combo2.Text = ""
        Text6.Text = ""
        Text7.Text = ""
    Else
        Option2.Value = True
        Option2_Click
        Combo2Select tRs("dIncomesCode")
        Text6.Text = Format(tRs("dRatio"), "#,##0.0000")
        Text7.Text = Format(tRs("dPlus"), "#,##0.0000")
    End If

End If

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Option1_Click()

Text4.Enabled = True

Combo2.Enabled = False
Text6.Enabled = False
Text7.Enabled = False

End Sub

Private Sub Option2_Click()

Text4.Enabled = False

Combo2.Enabled = True
Text6.Enabled = True
Text7.Enabled = True

End Sub

Public Sub LoadCombo2()
Dim XMSHFlexGrid As MSHFlexGrid
Dim XfrmCaller As EmployeeDetail
Dim i As Long

Set XfrmCaller = frmCaller

On Error GoTo ErrHandler

Combo2.Clear

For i = 1 To XfrmCaller.MSHFlexGrid1.Rows - 1
    If XfrmCaller.MSHFlexGrid1.TextMatrix(i, 0) <> "" And XfrmCaller.MSHFlexGrid1.TextMatrix(i, 0) <> Trim(Left(IncCb.Text, 8)) Then
        Combo2.AddItem FillSpace(XfrmCaller.MSHFlexGrid1.TextMatrix(i, 0), 8) + " - " + XfrmCaller.MSHFlexGrid1.TextMatrix(i, 1)
    End If
Next i

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub Combo1Select(Param As String)
Dim i As Long

For i = 0 To Combo1.ListCount - 1
    If Left(Combo1.List(i), 1) = Param Then
        Combo1.Text = Combo1.List(i)
        Exit Sub
    End If
Next i

End Sub

Public Sub Combo2Select(Param As String)
Dim i As Long

For i = 0 To Combo2.ListCount - 1
    If Trim(Left(Combo2.List(i), 8)) = Param Then
        Combo2.Text = Combo2.List(i)
        Exit Sub
    End If
Next i

End Sub

Private Sub Text6_Change()

CalMethodRF = False
RateRefresh

End Sub

Private Sub Text7_Change()

CalMethodRF = False
RateRefresh

End Sub

Public Sub CreateDetail()

frmStatus = Create

End Sub

Public Sub ModifyDetail(ByVal xInc As Long)
Dim XMSHFlexGrid As MSHFlexGrid
Dim XfrmCaller As EmployeeDetail
Dim i As Long

On Error GoTo ErrHandler

Set XfrmCaller = frmCaller

frmStatus = Modify
OldCode = XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 0)
OldLoc = xInc

IncCbSelect XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 0)
Combo1Select Left(XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 2), 1)
Text4.Text = Format(CFC(XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 3)), "#,##0.0000")

If XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 4) = "" Then
    Option1.Value = True
    Option1_Click
Else
    Option2.Value = True
    Option2_Click
    Combo2Select Trim(Left(XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 4), 8))
    Text6.Text = Format(CFC(XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 5)), "#,##0.0000")
    Text7.Text = Format(CFC(XfrmCaller.MSHFlexGrid1.TextMatrix(xInc, 6)), "#,##0.0000")
End If

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

