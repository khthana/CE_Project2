VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form WageCalculationDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Wage Calculation Information"
   ClientHeight    =   3180
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7845
   Icon            =   "WageCalculationDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3180
   ScaleWidth      =   7845
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6360
      TabIndex        =   4
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5040
      TabIndex        =   3
      Top             =   2280
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Wage Calculation Information"
      Height          =   1935
      Left            =   240
      TabIndex        =   6
      Top             =   240
      Width           =   7335
      Begin VB.CheckBox Check1 
         Caption         =   "Approved"
         Enabled         =   0   'False
         Height          =   255
         Left            =   3840
         TabIndex        =   14
         Top             =   360
         Width           =   1095
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   1920
         TabIndex        =   0
         Top             =   300
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19726337
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   1920
         TabIndex        =   1
         Top             =   660
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19726337
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker3 
         Height          =   315
         Left            =   5280
         TabIndex        =   2
         Top             =   660
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19726337
         CurrentDate     =   37642
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "End Date :"
         Height          =   255
         Index           =   1
         Left            =   3840
         TabIndex        =   13
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
         TabIndex        =   12
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
         TabIndex        =   11
         Top             =   1080
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   10
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   9
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Begin Date :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   8
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Cal. Date :"
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
      Top             =   2865
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
Attribute VB_Name = "WageCalculationDetail"
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

DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DateFilter(Now)
DTPicker3.Value = DateFilter(Now)

Label2(0).Caption = ""
Label2(1).Caption = ""

Check1.Value = Unchecked

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(4) As New ADODB.Parameter
Dim xPr(4) As New ADODB.Parameter
Dim i As Long

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
        tCmd.CommandText = "pr_wage_calc_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(2) = tCmd.CreateParameter("BeginDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(3) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(4) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = DTPicker1.Value
        tPr(2).Value = DTPicker2.Value
        tPr(3).Value = DTPicker3.Value
        tPr(4).Value = CurUser
        
        For i = 0 To 4
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_calc_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set xPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(2) = tCmd.CreateParameter("BeginDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(3) = tCmd.CreateParameter("EndDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(4) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        xPr(0) = CurCmp
        xPr(1).Value = DTPicker1.Value
        xPr(2).Value = DTPicker2.Value
        xPr(3).Value = DTPicker3.Value
        xPr(4) = CurUser

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
DTPicker1.Enabled = True

End Sub

Public Sub ViewDetail(ByVal CodeParam As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(1) As New ADODB.Parameter
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
tCmd.CommandText = "pr_wage_calc_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)

tPr(0).Value = CurCmp
tPr(1).Value = CDateX(CodeParam)

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

DTPicker1.Value = tRs("CalDate")
DTPicker2.Value = tRs("BeginDate")
DTPicker3.Value = tRs("EndDate")

Check1.Value = Abs(CInt(tRs("Approved")))

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
DTPicker1.Enabled = False

End Sub

