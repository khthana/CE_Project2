VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form IncomesDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Incomes Information"
   ClientHeight    =   6300
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7845
   Icon            =   "IncomesDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6300
   ScaleWidth      =   7845
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6360
      TabIndex        =   18
      Top             =   5400
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5040
      TabIndex        =   17
      Top             =   5400
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Incomes Information"
      Height          =   5055
      Left            =   240
      TabIndex        =   20
      Top             =   240
      Width           =   7335
      Begin VB.CommandButton Command5 
         Height          =   315
         Left            =   6480
         Picture         =   "IncomesDetail.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   2460
         Width           =   375
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
         Left            =   4920
         MaxLength       =   20
         TabIndex        =   11
         Text            =   "Text7"
         Top             =   2820
         Width           =   1935
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
         Left            =   1920
         MaxLength       =   20
         TabIndex        =   10
         Text            =   "Text6"
         Top             =   2820
         Width           =   1935
      End
      Begin VB.ComboBox IncCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         ItemData        =   "IncomesDetail.frx":0544
         Left            =   1920
         List            =   "IncomesDetail.frx":0560
         TabIndex        =   8
         Text            =   "IncCb"
         Top             =   2460
         Width           =   4575
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Dependent Rate"
         Height          =   255
         Left            =   360
         TabIndex        =   7
         Top             =   2160
         Width           =   1575
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Independent Rate"
         Height          =   255
         Left            =   360
         TabIndex        =   4
         Top             =   1800
         Value           =   -1  'True
         Width           =   1935
      End
      Begin VB.CheckBox Check5 
         Caption         =   "Included in Provident Fund Cal"
         Height          =   255
         Left            =   1920
         TabIndex        =   16
         Top             =   3960
         Width           =   2535
      End
      Begin VB.CheckBox Check4 
         Caption         =   "Included in Social Welfare Cal"
         Height          =   255
         Left            =   4440
         TabIndex        =   15
         Top             =   3600
         Width           =   2535
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Included in Tax Cal"
         Height          =   255
         Left            =   1920
         TabIndex        =   14
         Top             =   3600
         Width           =   2055
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Mandatory"
         Height          =   255
         Left            =   4440
         TabIndex        =   13
         Top             =   3240
         Width           =   2055
      End
      Begin VB.TextBox Text5 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   3
         TabIndex        =   12
         Text            =   "Tx5"
         Top             =   3180
         Width           =   615
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
         Left            =   4920
         MaxLength       =   20
         TabIndex        =   6
         Text            =   "Text4"
         Top             =   1740
         Width           =   1935
      End
      Begin VB.ComboBox Combo1 
         ForeColor       =   &H00C00000&
         Height          =   315
         ItemData        =   "IncomesDetail.frx":05F6
         Left            =   1920
         List            =   "IncomesDetail.frx":060F
         TabIndex        =   5
         Text            =   "Combo1"
         Top             =   1380
         Width           =   2055
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Predefined"
         Enabled         =   0   'False
         Height          =   255
         Left            =   5760
         TabIndex        =   1
         Top             =   360
         Width           =   1095
      End
      Begin VB.TextBox Text3 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   3
         Text            =   "Text3"
         Top             =   1020
         Width           =   4935
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   2
         Text            =   "Text2"
         Top             =   660
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
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Plus :"
         Height          =   255
         Index           =   10
         Left            =   4200
         TabIndex        =   33
         Top             =   2880
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Ratio :"
         Height          =   255
         Index           =   9
         Left            =   600
         TabIndex        =   32
         Top             =   2880
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Incomes Code :"
         Height          =   255
         Index           =   8
         Left            =   600
         TabIndex        =   31
         Top             =   2520
         Width           =   1215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   29
         Top             =   4320
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Rate :"
         Height          =   255
         Index           =   7
         Left            =   4200
         TabIndex        =   28
         Top             =   1800
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   27
         Top             =   4680
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   26
         Top             =   4320
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Tax Group :"
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   25
         Top             =   3240
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Calculate Method :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   24
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Title :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   23
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Title :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   22
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Incomes Code :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   21
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1920
         TabIndex        =   30
         Top             =   4680
         Width           =   4935
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   19
      Top             =   5985
      Width           =   7845
      _ExtentX        =   13838
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
Attribute VB_Name = "IncomesDetail"
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

Text1.Text = ""
Text2.Text = ""
Text3.Text = ""
Text4.Text = ""
Text5.Text = ""
Text6.Text = ""
Text7.Text = ""

Check1.Value = Unchecked
Check2.Value = Unchecked
Check3.Value = Unchecked
Check4.Value = Unchecked
Check5.Value = Unchecked

Combo1.Text = ""

Option1.Value = True
Combo1.Enabled = True
Text4.Enabled = True

LoadIncCb

IncCb.Enabled = False
Text6.Enabled = False
Text7.Enabled = False
Command5.Enabled = False

Label2(0).Caption = ""
Label2(1).Caption = ""

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

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(15) As New ADODB.Parameter
Dim xPr(16) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

For i = 0 To Combo1.ListCount - 1
    If Combo1.List(i) = Combo1.Text Then GoTo FoundCombo1
Next i

MsgBox "Invalid Calculate Method...", vbCritical + vbOKOnly
Exit Sub
FoundCombo1:

If Option2.Value = True Then
    For i = 0 To IncCb.ListCount - 1
        If IncCb.List(i) = IncCb.Text Then GoTo FoundIncCb
    Next i

    MsgBox "Invalid IncomesCode...", vbCritical + vbOKOnly
    Exit Sub
FoundIncCb:

End If

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_incomes_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set tPr(1) = tCmd.CreateParameter("IncomesCode", adVarChar, adParamInput, 8, Text1.Text)
        Set tPr(2) = tCmd.CreateParameter("TH_Title", adVarChar, adParamInput, 30, Text2.Text)
        Set tPr(3) = tCmd.CreateParameter("EN_Title", adVarChar, adParamInput, 30, Text3.Text)
        Set tPr(4) = tCmd.CreateParameter("CalMethod ", adVarChar, adParamInput, 1, Left(Combo1.Text, 1))

        If Option1.Value = True Then
            Set tPr(5) = tCmd.CreateParameter("Rate ", adCurrency, adParamInput, 8, CFC(Text4.Text))
            Set tPr(6) = tCmd.CreateParameter("dIncomesCode ", adVarChar, adParamInput, 8, Null)
            Set tPr(7) = tCmd.CreateParameter("dRatio ", adCurrency, adParamInput, 8, Null)
            Set tPr(8) = tCmd.CreateParameter("dPlus ", adCurrency, adParamInput, 8, Null)
        Else
            Set tPr(5) = tCmd.CreateParameter("Rate", adCurrency, adParamInput, 8, Null)
            Set tPr(6) = tCmd.CreateParameter("dIncomesCode", adVarChar, adParamInput, 8, Trim(Left(IncCb.Text, 8)))
            Set tPr(7) = tCmd.CreateParameter("dRatio", adCurrency, adParamInput, 8, CFC(Text6.Text))
            Set tPr(8) = tCmd.CreateParameter("dPlus", adCurrency, adParamInput, 8, CFC(Text7.Text))
        End If

        Set tPr(9) = tCmd.CreateParameter("IncludedInTaxCal ", adBoolean, adParamInput, 1, Check3.Value)
        Set tPr(10) = tCmd.CreateParameter("IncludedInSWCal ", adBoolean, adParamInput, 1, Check4.Value)
        Set tPr(11) = tCmd.CreateParameter("IncludedInPFCal ", adBoolean, adParamInput, 1, Check5.Value)
        Set tPr(12) = tCmd.CreateParameter("TaxGroup ", adTinyInt, adParamInput, 1, CFC(Text5.Text))
        Set tPr(13) = tCmd.CreateParameter("Predefined ", adBoolean, adParamInput, 1, Check1.Value)
        Set tPr(14) = tCmd.CreateParameter("Mandatory ", adBoolean, adParamInput, 1, Check2.Value)
        Set tPr(15) = tCmd.CreateParameter("CreateUserID ", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 15
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_incomes_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
        Set xPr(1) = tCmd.CreateParameter("oldIncomesCode", adVarChar, adParamInput, 8, OldCode)
        Set xPr(2) = tCmd.CreateParameter("IncomesCode", adVarChar, adParamInput, 8, Text1.Text)
        Set xPr(3) = tCmd.CreateParameter("TH_Title", adVarChar, adParamInput, 30, Text2.Text)
        Set xPr(4) = tCmd.CreateParameter("EN_Title", adVarChar, adParamInput, 30, Text3.Text)
        Set xPr(5) = tCmd.CreateParameter("CalMethod ", adVarChar, adParamInput, 1, Left(Combo1.Text, 1))

        If Option1.Value = True Then
            Set xPr(6) = tCmd.CreateParameter("Rate ", adCurrency, adParamInput, 8, CFC(Text4.Text))
            Set xPr(7) = tCmd.CreateParameter("dIncomesCode ", adVarChar, adParamInput, 8, Null)
            Set xPr(8) = tCmd.CreateParameter("dRatio ", adCurrency, adParamInput, 8, Null)
            Set xPr(9) = tCmd.CreateParameter("dPlus ", adCurrency, adParamInput, 8, Null)
        Else
            Set xPr(6) = tCmd.CreateParameter("Rate", adCurrency, adParamInput, 8, Null)
            Set xPr(7) = tCmd.CreateParameter("dIncomesCode", adVarChar, adParamInput, 8, Trim(Left(IncCb.Text, 8)))
            Set xPr(8) = tCmd.CreateParameter("dRatio", adCurrency, adParamInput, 8, CFC(Text6.Text))
            Set xPr(9) = tCmd.CreateParameter("dPlus", adCurrency, adParamInput, 8, CFC(Text7.Text))
        End If

        Set xPr(10) = tCmd.CreateParameter("IncludedInTaxCal ", adBoolean, adParamInput, 1, Check3.Value)
        Set xPr(11) = tCmd.CreateParameter("IncludedInSWCal ", adBoolean, adParamInput, 1, Check4.Value)
        Set xPr(12) = tCmd.CreateParameter("IncludedInPFCal ", adBoolean, adParamInput, 1, Check5.Value)
        Set xPr(13) = tCmd.CreateParameter("TaxGroup ", adTinyInt, adParamInput, 1, CFC(Text5.Text))
        Set xPr(14) = tCmd.CreateParameter("Predefined ", adBoolean, adParamInput, 1, Check1.Value)
        Set xPr(15) = tCmd.CreateParameter("Mandatory ", adBoolean, adParamInput, 1, Check2.Value)
        Set xPr(16) = tCmd.CreateParameter("LastModifyUserID ", adVarChar, adParamInput, 10, CurUser)

        For i = 0 To 16
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
tCmd.CommandText = "hrm_incomes_select"

tPr(0) = CurCmp
tPr(1) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("IncomesCode")
Text2.Text = tRs("TH_Title")
Text3.Text = tRs("EN_Title")
Text4.Text = Format(tRs("vRate"), "#,##0.0000")

If IsNull(tRs("dIncomesCode")) = True Then
    Option1.Value = True
    Option1_Click
Else
    Option2.Value = True
    Option2_Click
    IncCbSelect tRs("dIncomesCode")
    Text6.Text = Format(tRs("dRatio"), "#,##0.0000")
    Text7.Text = Format(tRs("dPlus"), "#,##0.0000")
End If
    
Combo1Select tRs("CalMethod")
Text5.Text = Format(tRs("TaxGroup"), "0")
Check1.Value = Abs(CInt(tRs("Predefined")))
Check2.Value = Abs(CInt(tRs("Mandatory")))
Check3.Value = Abs(CInt(tRs("IncludedInTaxCal")))
Check4.Value = Abs(CInt(tRs("IncludedInSWCal")))
Check5.Value = Abs(CInt(tRs("IncludedInPFCal")))

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

Private Sub IncCb_Change()

CalMethodRF = True
RateRefresh

End Sub

Private Sub IncCb_Click()

CalMethodRF = True
RateRefresh

End Sub

Private Sub RateRefresh()

Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(1) As Variant
Dim i As Long

For i = 0 To IncCb.ListCount - 1
    If IncCb.List(i) = IncCb.Text Then
        GoTo FoundIncCb
    End If
Next i

Exit Sub
FoundIncCb:

CalMethod = ""

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_incomes_select"
tPr(0) = CurCmp
tPr(1) = Trim(Left(IncCb.Text, 8))

Set tRs = tCmd.Execute(, tPr)

If Not tRs.EOF Then

    Text4.Text = Format((tRs("Rate") * CFC(Text6.Text)) + CFC(Text7.Text), "#,##0.0000")
    If CalMethodRF = True Then Combo1Select tRs("CalMethod")
    
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

IncCb.Enabled = False
Text6.Enabled = False
Text7.Enabled = False
Command5.Enabled = False

End Sub

Private Sub Option2_Click()

Text4.Enabled = False

IncCb.Enabled = True
Text6.Enabled = True
Text7.Enabled = True
Command5.Enabled = True

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

    If Trim(tRs("IncomesCode")) <> Trim(OldCode) Then
        IncCb.AddItem FillSpace(tRs("IncomesCode"), 8) + " - " + tRs("EN_Title")
    End If

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

Private Sub Text6_Change()

CalMethodRF = False
RateRefresh

End Sub

Private Sub Text7_Change()

CalMethodRF = False
RateRefresh

End Sub
