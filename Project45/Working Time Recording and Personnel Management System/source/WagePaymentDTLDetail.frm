VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form WagePaymentDTLDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Wage Payment Detail Information"
   ClientHeight    =   3915
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7845
   Icon            =   "WagePaymentDTLDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3915
   ScaleWidth      =   7845
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6360
      TabIndex        =   3
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5040
      TabIndex        =   2
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Wage Payment Detail Information"
      Height          =   2655
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   7335
      Begin VB.ComboBox Combo1 
         ForeColor       =   &H00C00000&
         Height          =   315
         ItemData        =   "WagePaymentDTLDetail.frx":0442
         Left            =   1920
         List            =   "WagePaymentDTLDetail.frx":0455
         TabIndex        =   0
         Text            =   "Combo1"
         Top             =   1020
         Width           =   3255
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   20
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   1380
         Width           =   1455
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   1920
         TabIndex        =   17
         Top             =   720
         Width           =   5055
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   4920
         TabIndex        =   16
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label3"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   15
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Pay Amount :"
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   14
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Payment Method :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   13
         Top             =   1080
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
         TabIndex        =   11
         Top             =   1800
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   10
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   9
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Cal Date :"
         Height          =   255
         Index           =   2
         Left            =   3720
         TabIndex        =   8
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   7
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Pay Date :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   6
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   4
      Top             =   3600
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
Attribute VB_Name = "WagePaymentDTLDetail"
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

Text1.Text = ""
Combo1.Text = ""

Label3(0).Caption = ""
Label3(1).Caption = ""
Label3(2).Caption = ""

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim xPr(7) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

If CFC(Text1.Text) <= 0 Then
    MsgBox "PayAmount must be greater than zero...", vbExclamation + vbOKOnly
    Exit Sub
End If

For i = 0 To Combo1.ListCount - 1
    If Combo1.List(i) = Combo1.Text Then GoTo Found
Next i

MsgBox "Invalid Payment Method...", vbCritical + vbOKOnly
Exit Sub
Found:

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_wage_payment_detail_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set xPr(1) = tCmd.CreateParameter("PayDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(2) = tCmd.CreateParameter("oldPaymentType", adChar, adParamInput, 1)
        Set xPr(3) = tCmd.CreateParameter("PaymentType", adChar, adParamInput, 1)
        Set xPr(4) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(5) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set xPr(6) = tCmd.CreateParameter("PayAmount", adCurrency, adParamInput, 8)
        Set xPr(7) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        xPr(0).Value = CurCmp
        xPr(1).Value = CDateX(Label3(0).Caption)
        xPr(2).Value = OldCode
        xPr(3).Value = Left(Combo1.Text, 1)
        xPr(4).Value = CDateX(Label3(1).Caption)
        xPr(5).Value = Trim(Left(Label3(2).Caption, 10))
        xPr(6).Value = CFC(Text1.Text)
        xPr(7).Value = CurUser

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

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub ViewDetail(ByVal PayDate As String, ByVal CalDate As String, ByVal EID As String, ByVal EName As String, ByVal PaymentType As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(4) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Label3(0).Caption = PayDate
Label3(1).Caption = CalDate
Label3(2).Caption = FillSpace(EID, 10) + " - " + EName

For i = 0 To Combo1.ListCount - 1
    If Left(Combo1.List(i), 1) = PaymentType Then
        Combo1.Text = Combo1.List(i)
    End If
Next i

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "pr_wage_payment_detail_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("PayDate", adDBTimeStamp, adParamInput, 8)
Set tPr(2) = tCmd.CreateParameter("PaymentType", adChar, adParamInput, 1)
Set tPr(3) = tCmd.CreateParameter("CalDate", adDBTimeStamp, adParamInput, 8)
Set tPr(4) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)

tPr(0).Value = CurCmp
tPr(1).Value = CDate(PayDate)
tPr(2).Value = PaymentType
tPr(3).Value = CDate(CalDate)
tPr(4).Value = EID

For i = 0 To 4
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Text1.Text = Format(tRs("PayAmount"), "#,##0.00")

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

Public Sub ModifyDetail(ByVal PayDate As String, ByVal CalDate As String, ByVal EID As String, ByVal EName As String, ByVal PaymentType As String)

ViewDetail PayDate, CalDate, EID, EName, PaymentType

OldCode = PaymentType

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Frame1.Enabled = True
Command1.Enabled = True

End Sub

