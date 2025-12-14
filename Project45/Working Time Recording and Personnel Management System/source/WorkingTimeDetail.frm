VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form WorkingTimeDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Working Time Information"
   ClientHeight    =   6405
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8415
   Icon            =   "WorkingTimeDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6405
   ScaleWidth      =   8415
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6960
      TabIndex        =   14
      Top             =   5520
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5640
      TabIndex        =   13
      Top             =   5520
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Working Time Information"
      Height          =   5175
      Left            =   240
      TabIndex        =   16
      Top             =   240
      Width           =   7935
      Begin VB.Frame Frame3 
         Caption         =   "Working Time Detail"
         Enabled         =   0   'False
         Height          =   1815
         Left            =   120
         TabIndex        =   20
         Top             =   3160
         Width           =   7695
         Begin VB.CheckBox Check1 
            Caption         =   "Late Check"
            Height          =   255
            Left            =   1440
            TabIndex        =   10
            Top             =   1440
            Width           =   2055
         End
         Begin VB.CommandButton Command7 
            Caption         =   "&Cancel"
            Height          =   375
            Left            =   6360
            TabIndex        =   12
            Top             =   720
            Width           =   1095
         End
         Begin VB.CommandButton Command6 
            Caption         =   "&OK"
            Height          =   375
            Left            =   6360
            TabIndex        =   11
            Top             =   240
            Width           =   1095
         End
         Begin VB.ComboBox IncCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   1440
            TabIndex        =   8
            Text            =   "Combo1"
            Top             =   1020
            Width           =   4335
         End
         Begin VB.CommandButton Command5 
            Height          =   315
            Left            =   5760
            Picture         =   "WorkingTimeDetail.frx":0442
            Style           =   1  'Graphical
            TabIndex        =   9
            Top             =   1020
            Width           =   375
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   315
            Left            =   1440
            TabIndex        =   6
            Top             =   660
            Width           =   1575
            _ExtentX        =   2778
            _ExtentY        =   556
            _Version        =   393216
            CustomFormat    =   "HH:mm:ss"
            Format          =   19660803
            UpDown          =   -1  'True
            CurrentDate     =   36526
            MaxDate         =   36526.9999884259
            MinDate         =   36526
         End
         Begin VB.ComboBox Combo1 
            ForeColor       =   &H00C00000&
            Height          =   315
            ItemData        =   "WorkingTimeDetail.frx":0544
            Left            =   1440
            List            =   "WorkingTimeDetail.frx":0560
            TabIndex        =   5
            Text            =   "Combo1"
            Top             =   300
            Width           =   4695
         End
         Begin MSComCtl2.DTPicker DTPicker2 
            Height          =   315
            Left            =   4560
            TabIndex        =   7
            Top             =   660
            Width           =   1575
            _ExtentX        =   2778
            _ExtentY        =   556
            _Version        =   393216
            CustomFormat    =   "HH:mm:ss"
            Format          =   19660803
            UpDown          =   -1  'True
            CurrentDate     =   36526.9999884259
            MaxDate         =   36526.9999884259
            MinDate         =   36526
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Incomes Code :"
            Height          =   255
            Index           =   7
            Left            =   240
            TabIndex        =   24
            Top             =   1080
            Width           =   1455
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "To Time :"
            Height          =   255
            Index           =   4
            Left            =   3360
            TabIndex        =   23
            Top             =   720
            Width           =   735
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "From Time :"
            Height          =   255
            Index           =   3
            Left            =   240
            TabIndex        =   22
            Top             =   720
            Width           =   1455
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Day of Week :"
            Height          =   255
            Index           =   2
            Left            =   240
            TabIndex        =   21
            Top             =   360
            Width           =   1455
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Lisr of Working Time"
         Height          =   2175
         Left            =   120
         TabIndex        =   19
         Top             =   960
         Width           =   7695
         Begin VB.CommandButton Command4 
            Caption         =   "&Remove"
            Height          =   375
            Left            =   6360
            TabIndex        =   4
            Top             =   720
            Width           =   1095
         End
         Begin VB.CommandButton Command3 
            Caption         =   "&Add"
            Height          =   375
            Left            =   6360
            TabIndex        =   3
            Top             =   240
            Width           =   1095
         End
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
            Height          =   1815
            Left            =   120
            TabIndex        =   2
            ToolTipText     =   "Click to view detail..."
            Top             =   240
            Width           =   6015
            _ExtentX        =   10610
            _ExtentY        =   3201
            _Version        =   393216
            FixedCols       =   0
            AllowBigSelection=   0   'False
            SelectionMode   =   1
            AllowUserResizing=   1
            _NumberOfBands  =   1
            _Band(0).Cols   =   2
         End
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   1
         Text            =   "Text2"
         Top             =   660
         Width           =   4335
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   3
         TabIndex        =   0
         Text            =   "tx1"
         Top             =   300
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "wtName :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   18
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "wtCode :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   17
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   15
      Top             =   6090
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
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Created by :"
      Height          =   255
      Index           =   5
      Left            =   240
      TabIndex        =   28
      Top             =   5520
      Width           =   1455
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Last Modified by :"
      Height          =   255
      Index           =   6
      Left            =   240
      TabIndex        =   27
      Top             =   5760
      Width           =   1455
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   0
      Left            =   1560
      TabIndex        =   26
      Top             =   5520
      Width           =   3975
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   1
      Left            =   1560
      TabIndex        =   25
      Top             =   5760
      Width           =   3975
   End
End
Attribute VB_Name = "WorkingTimeDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private numRec As Long

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub ClrScr()

Text1.Text = ""
Text2.Text = ""

MSHFlexGrid1Clear

Label2(0).Caption = ""
Label2(1).Caption = ""

ClrScrSub

End Sub

Private Sub ClrScrSub()

Combo1.Text = ""
Check1.Value = Unchecked
LoadIncCb

DTPicker1.Value = CDateX("01/01/2000 00:00:00")
DTPicker2.Value = CDateX("01/01/2000 23:59:59")

End Sub

Private Sub Command1_Click()
Dim tCmd As New adodb.Command
Dim tRs As New adodb.Recordset
Dim tPr(3) As Variant
Dim xPr(4) As Variant
Dim dPr(1) As Variant
Dim iPr(7) As Variant
Dim i As Long
Dim j As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_workingtime_insert"

        tPr(0) = CurCmp
        tPr(1) = Text1.Text
        tPr(2) = Text2.Text
        tPr(3) = CurUser

        Set tRs = tCmd.Execute(, tPr)
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_workingtime_update"

        xPr(0) = CurCmp
        xPr(1) = OldCode
        xPr(2) = Text1.Text
        xPr(3) = Text2.Text
        xPr(4) = CurUser

        Set tRs = tCmd.Execute(, xPr)

        For j = 0 To tCmd.Parameters.Count - 1
            tCmd.Parameters.Delete 0
        Next j

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_workingtimesub_delete_by_wtCode"

        dPr(0) = CurCmp
        dPr(1) = OldCode

        Set tRs = tCmd.Execute(, dPr)

    Case Else
        MsgBox "Invalid Form Status...", vbCritical + vbOKOnly
        Exit Sub
End Select

For i = 1 To numRec

    For j = 0 To tCmd.Parameters.Count - 1
        tCmd.Parameters.Delete 0
    Next j
    
    tCmd.CommandType = adCmdStoredProc
    tCmd.CommandText = "hrm_workingtimesub_insert"
    
    Set iPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
    Set iPr(1) = tCmd.CreateParameter("wtCode", adVarChar, adParamInput, 3)
    Set iPr(2) = tCmd.CreateParameter("DayOfWeek", adTinyInt, adParamInput, 1)
    Set iPr(3) = tCmd.CreateParameter("FromTime", adDBTimeStamp, adParamInput, 3)
    Set iPr(4) = tCmd.CreateParameter("ToTime", adDBTimeStamp, adParamInput, 3)
    Set iPr(5) = tCmd.CreateParameter("IncomesCode", adVarChar, adParamInput, 8)
    Set iPr(6) = tCmd.CreateParameter("LateCheck", adBoolean, adParamInput, 1)
    Set iPr(7) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
    
    For j = 0 To 7
        tCmd.Parameters.Append iPr(j)
    Next j

    iPr(0).Value = CurCmp
    iPr(1).Value = Text1.Text
    iPr(2).Value = CFC(Left(MSHFlexGrid1.TextMatrix(i, 0), 1))
    iPr(3).Value = CDateX("1/1/2000 " + MSHFlexGrid1.TextMatrix(i, 1))
    iPr(4).Value = CDateX("1/1/2000 " + MSHFlexGrid1.TextMatrix(i, 2))
    iPr(5).Value = Trim(Left(MSHFlexGrid1.TextMatrix(i, 3), 8))
    If MSHFlexGrid1.TextMatrix(i, 4) = "No" Then iPr(6).Value = 0
    If MSHFlexGrid1.TextMatrix(i, 4) = "Yes" Then iPr(6).Value = 1
    iPr(7).Value = CurUser

    Set tRs = tCmd.Execute(, iPr)

Next i

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

ClrScrSub
Frame2.Enabled = False
Frame3.Enabled = True
Text1.Enabled = False
Text2.Enabled = False
Command1.Enabled = False
Combo1.SetFocus

End Sub

Private Sub Command4_Click()

If MSHFlexGrid1.RowSel = 0 Or numRec = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Co = MsgBox("Do you want to delete this record?", vbQuestion + vbYesNo)
If Co = vbYes Then
    numRec = numRec - 1
    If numRec > 0 Then
        MSHFlexGrid1.RemoveItem MSHFlexGrid1.RowSel
    Else
        MSHFlexGrid1Clear
    End If
End If

End Sub

Private Sub Command5_Click()

Dim frmCalled As New Incomes
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command6_Click()
Dim i As Long
Dim XsDate As Date
Dim XtDate As Date
Dim YsDate As Date
Dim YtDate As Date

For i = 0 To Combo1.ListCount - 1
    If Combo1.Text = Combo1.List(i) Then GoTo FoundCombo1
Next i

MsgBox "Invalid Day of Week", vbExclamation + vbOKOnly
Exit Sub

FoundCombo1:

For i = 0 To IncCb.ListCount - 1
    If IncCb.Text = IncCb.List(i) Then GoTo FoundIncCb
Next i

MsgBox "Invalid Incomes Code", vbExclamation + vbOKOnly
Exit Sub

FoundIncCb:

'======== Time Range Collision Check

For i = 0 To MSHFlexGrid1.Rows - 1
    If MSHFlexGrid1.TextMatrix(i, 0) = Combo1.Text Then

        XsDate = DTPicker1.Value
        XtDate = DTPicker2.Value
        YsDate = CDateX("1/1/2000 " + MSHFlexGrid1.TextMatrix(i, 1))
        YtDate = CDateX("1/1/2000 " + MSHFlexGrid1.TextMatrix(i, 2))

        If (YsDate <= XsDate And XsDate <= YtDate) Or (YsDate <= XtDate And XtDate <= YtDate) Then

            MsgBox "This working time violates the existing one (invalid time range)", vbExclamation + vbOKOnly

            Exit Sub
        End If
    End If
Next i

If Check1.Value = Checked Then LC$ = "Yes"
If Check1.Value = Unchecked Then LC$ = "No"

'======== Insert new row
MSHFlexGrid1.AddItem Combo1.Text + Chr(9) + Format(DTPicker1.Value, "HH:mm:ss") + Chr(9) + Format(DTPicker2.Value, "HH:mm:ss") + Chr(9) + IncCb.Text + Chr(9) + LC$

numRec = numRec + 1
If numRec = 1 Then MSHFlexGrid1.RemoveItem 1

Command7_Click

End Sub

Private Sub Command7_Click()

ClrScrSub
Frame2.Enabled = True
Frame3.Enabled = False
Text1.Enabled = True
Text2.Enabled = True
Command1.Enabled = True
MSHFlexGrid1.SetFocus

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

Dim tCmd As New adodb.Command
Dim tRs As New adodb.Recordset
Dim tPr(1) As Variant
Dim xCmd As New adodb.Command
Dim xRs As New adodb.Recordset
Dim xPr(1) As Variant
Dim i As Long
Dim j As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Command1.Enabled = False
Command3.Enabled = False
Command4.Enabled = False
Text1.Enabled = False
Text2.Enabled = False
Frame3.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_workingtime_select"

tPr(0) = CurCmp
tPr(1) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("wtCode")
Text2.Text = tRs("wtName")

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

LoadIncCb

Set xCmd.ActiveConnection = sConn

xCmd.CommandType = adCmdStoredProc
xCmd.CommandText = "hrm_workingtimesub_select_by_wtCode"

xPr(0) = CurCmp
xPr(1) = CodeParam

Set xRs = xCmd.Execute(, xPr)

numRec = 0
MSHFlexGrid1Clear
Do While Not xRs.EOF

    For i = 0 To Combo1.ListCount - 1
        If CFC(Left(Combo1.List(i), 1)) = xRs("DayOfWeek") Then
            DOW$ = Combo1.List(i)
            Exit For
        End If
    Next i

    For i = 0 To IncCb.ListCount - 1
        If Trim(Left(IncCb.List(i), 8)) = xRs("IncomesCode") Then
            Inc$ = IncCb.List(i)
            Exit For
        End If
    Next i

    If xRs("LateCheck") = 0 Then LC$ = "No"
    If xRs("LateCheck") = 1 Then LC$ = "Yes"

    MSHFlexGrid1.AddItem DOW$ + Chr(9) + Format(xRs("FromTime"), "HH:mm:ss") + Chr(9) + Format(xRs("ToTime"), "HH:mm:ss") + Chr(9) + Inc$ + Chr(9) + LC$

    numRec = numRec + 1

    xRs.MoveNext
Loop
If numRec > 0 Then MSHFlexGrid1.RemoveItem 1

Set xRs = Nothing
Set xCmd = Nothing

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

Command1.Enabled = True
Command3.Enabled = True
Command4.Enabled = True
Text1.Enabled = True
Text2.Enabled = True
Frame3.Enabled = True

End Sub

Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 5
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "Day of Week"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 1500

MSHFlexGrid1.TextMatrix(0, 1) = "FromTime"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 1200

MSHFlexGrid1.TextMatrix(0, 2) = "ToTime"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 1200

MSHFlexGrid1.TextMatrix(0, 3) = "Incomes"
MSHFlexGrid1.ColAlignment(3) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(3) = 3000

MSHFlexGrid1.TextMatrix(0, 4) = "LateCheck"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 1000

numRec = 0

End Sub

Public Sub LoadIncCb()
Dim tRs As New adodb.Recordset
Dim tCmd As New adodb.Command
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
        Exit Sub
    End If
Next i

End Sub

Private Sub MSHFlexGrid1_Click()

ClrScrSub

Combo1.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 0)

DTPicker1.Value = CDateX("01/01/2000 " + MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 1))
DTPicker2.Value = CDateX("01/01/2000 " + MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 2))

IncCb.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.RowSel, 3)

End Sub
