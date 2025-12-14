VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form AutoTimeSheetDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Automatic Time Sheet Detail"
   ClientHeight    =   4515
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8430
   Icon            =   "AutoTimeSheetDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4515
   ScaleWidth      =   8430
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5640
      TabIndex        =   2
      Top             =   3600
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6960
      TabIndex        =   3
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Automatic Time Sheet Detail"
      Height          =   3255
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   7935
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   5520
         TabIndex        =   1
         Text            =   "Text2"
         Top             =   2340
         Width           =   2055
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   5520
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   1740
         Width           =   2055
      End
      Begin VB.ComboBox IncCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1560
         TabIndex        =   15
         Text            =   "Combo1"
         Top             =   1380
         Width           =   6015
      End
      Begin VB.ComboBox EmpCb 
         Enabled         =   0   'False
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1560
         TabIndex        =   6
         Text            =   "Combo1"
         Top             =   300
         Width           =   6015
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1560
         TabIndex        =   10
         Top             =   1020
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "HH:mm:ss"
         Format          =   60751875
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   5160
         TabIndex        =   11
         Top             =   1020
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "HH:mm:ss"
         Format          =   60751875
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin MSComCtl2.DTPicker DTPicker3 
         Height          =   315
         Left            =   1560
         TabIndex        =   14
         Top             =   660
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "dd/MM/yyyy"
         Format          =   60751875
         CurrentDate     =   36526
         MaxDate         =   2958465.99998843
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Label7"
         ForeColor       =   &H000040C0&
         Height          =   255
         Index           =   3
         Left            =   5520
         TabIndex        =   25
         Top             =   2640
         Width           =   2055
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Label7"
         ForeColor       =   &H000040C0&
         Height          =   255
         Index           =   2
         Left            =   5520
         TabIndex        =   24
         Top             =   2040
         Width           =   2055
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Label7"
         ForeColor       =   &H000040C0&
         Height          =   255
         Index           =   1
         Left            =   1560
         TabIndex        =   23
         Top             =   2640
         Width           =   2055
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Label7"
         ForeColor       =   &H000040C0&
         Height          =   255
         Index           =   0
         Left            =   1560
         TabIndex        =   22
         Top             =   2040
         Width           =   2055
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "Label6"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1560
         TabIndex        =   21
         Top             =   2400
         Width           =   2055
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "Label6"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1560
         TabIndex        =   20
         Top             =   1800
         Width           =   2055
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Approved (sec) :"
         Height          =   255
         Index           =   3
         Left            =   4080
         TabIndex        =   19
         Top             =   2400
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Late (sec) :"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   18
         Top             =   2400
         Width           =   1095
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Approved (sec) :"
         Height          =   255
         Index           =   1
         Left            =   4080
         TabIndex        =   17
         Top             =   1800
         Width           =   1335
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Incomes Code :"
         Height          =   255
         Index           =   7
         Left            =   240
         TabIndex        =   16
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "From Time :"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "To Time :"
         Height          =   255
         Left            =   4080
         TabIndex        =   12
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Work (sec) :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   9
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "WorkDate :"
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee :"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   7
         Top             =   360
         Width           =   1095
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   4
      Top             =   4200
      Width           =   8430
      _ExtentX        =   14870
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
Attribute VB_Name = "AutoTimeSheetDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private numRec As Long
Private frmStatus As FormState
Private frmCaller As Object

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub Command1_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(6) As Variant
Dim i As Long

If CFC(Text1.Text) < 0 Or CFC(Text2.Text) < 0 Then
    MsgBox "Approved Rate must no be less than zero...", vbCritical + vbOKOnly
    Exit Sub
End If

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "ta_auto_time_sheet_update"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set tPr(2) = tCmd.CreateParameter("WorkDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(3) = tCmd.CreateParameter("FromTime", adDBTimeStamp, adParamInput, 8)
        Set tPr(4) = tCmd.CreateParameter("ApprovedWorkSec", adBigInt, adParamInput, 8)
        Set tPr(5) = tCmd.CreateParameter("ApprovedLateSec", adBigInt, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = Trim(Left(EmpCb.Text, 10))
        tPr(2).Value = DTPicker3.Value
        tPr(3).Value = DTPicker1.Value
        tPr(4).Value = CFC(Text1.Text)
        tPr(5).Value = CFC(Text2.Text)
        tPr(6).Value = CurUser

        For i = 0 To 6
            tCmd.Parameters.Append tPr(i)
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

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

Label6(0).Caption = "0"
Label6(1).Caption = "0"

Text1.Text = "0"
Text2.Text = "0"

RefreshDSP

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
    frmCaller.Command5_Click
End If

End Sub

Sub ModifyDetail(ByVal EID As String, ByVal WorkDate As String, ByVal FromTime As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(3) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "ta_auto_time_sheet_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
Set tPr(2) = tCmd.CreateParameter("WorkDate", adDBTimeStamp, adParamInput, 8)
Set tPr(3) = tCmd.CreateParameter("FromTime", adDBTimeStamp, adParamInput, 8)

tPr(0).Value = CurCmp
tPr(1).Value = EID
tPr(2).Value = CDateX(WorkDate)
tPr(3).Value = CDateX(FromTime)

For i = 0 To 3
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

If tRs.EOF = False Then

    EmpCbSelect tRs("EID")
    IncCbSelect tRs("IncomesCode")
    
    DTPicker3.Value = tRs("WorkDate")
    DTPicker1.Value = tRs("FromTime")
    DTPicker2.Value = tRs("ToTime")
    
    Label6(0).Caption = Format(tRs("WorkSec"), "#,##0")
    Label6(1).Caption = Format(tRs("LateSec"), "#,##0")
    
    Text1.Text = Format(tRs("ApprovedWorkSec"), "#,##0")
    Text2.Text = Format(tRs("ApprovedLateSec"), "#,##0")
    
    RefreshDSP

End If

Set tRs = Nothing
Set tCmd = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

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

Public Sub RefreshDSP()

Label7(0).Caption = Sec2HourDSP(CFC(Label6(0).Caption))
Label7(1).Caption = Sec2HourDSP(CFC(Label6(1).Caption))
Label7(2).Caption = Sec2HourDSP(CFC(Text1.Text))
Label7(3).Caption = Sec2HourDSP(CFC(Text2.Text))

End Sub

Private Sub Text1_Change()

RefreshDSP

End Sub

Private Sub Text2_Change()

RefreshDSP

End Sub
