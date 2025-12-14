VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form ProgressiveTaxBaseDeductionDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Progressive Tax Base Deduction Information"
   ClientHeight    =   4965
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8175
   Icon            =   "ProgressiveTaxBaseDeductionDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4965
   ScaleWidth      =   8175
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6720
      TabIndex        =   13
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5400
      TabIndex        =   12
      Top             =   4080
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Progressive Tax Base Deduction Information"
      Height          =   3735
      Left            =   240
      TabIndex        =   15
      Top             =   240
      Width           =   7695
      Begin VB.TextBox Text9 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   2160
         MaxLength       =   20
         TabIndex        =   11
         Text            =   "Text9"
         Top             =   2460
         Width           =   1455
      End
      Begin VB.TextBox Text8 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   5760
         MaxLength       =   20
         TabIndex        =   10
         Text            =   "Text8"
         Top             =   2100
         Width           =   1455
      End
      Begin VB.TextBox Text7 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   2160
         MaxLength       =   20
         TabIndex        =   9
         Text            =   "Text7"
         Top             =   2100
         Width           =   1455
      End
      Begin VB.TextBox Text6 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   5760
         MaxLength       =   20
         TabIndex        =   8
         Text            =   "Text6"
         Top             =   1740
         Width           =   1455
      End
      Begin VB.TextBox Text5 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   2160
         MaxLength       =   20
         TabIndex        =   7
         Text            =   "Text5"
         Top             =   1740
         Width           =   1455
      End
      Begin VB.TextBox Text4 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   5760
         MaxLength       =   20
         TabIndex        =   6
         Text            =   "Text4"
         Top             =   1380
         Width           =   1455
      End
      Begin VB.TextBox Text3 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   2160
         MaxLength       =   20
         TabIndex        =   5
         Text            =   "Text3"
         Top             =   1380
         Width           =   1455
      End
      Begin VB.TextBox Text2 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   5760
         MaxLength       =   20
         TabIndex        =   4
         Text            =   "Text2"
         Top             =   1020
         Width           =   1455
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   2160
         MaxLength       =   20
         TabIndex        =   3
         Text            =   "Text1"
         Top             =   1020
         Width           =   1455
      End
      Begin VB.CheckBox Check1 
         Caption         =   "No Expire Date"
         Height          =   255
         Left            =   3840
         TabIndex        =   2
         Top             =   720
         Width           =   1455
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   2160
         TabIndex        =   0
         Top             =   300
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19595265
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   2160
         TabIndex        =   1
         Top             =   660
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19595265
         CurrentDate     =   37642
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Tax Base Excemption :"
         Height          =   255
         Index           =   12
         Left            =   360
         TabIndex        =   30
         Top             =   2520
         Width           =   1695
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Insurance Fee Limit :"
         Height          =   255
         Index           =   11
         Left            =   3840
         TabIndex        =   29
         Top             =   2160
         Width           =   1575
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Child Limit :"
         Height          =   255
         Index           =   10
         Left            =   360
         TabIndex        =   28
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Child Not Study Exp :"
         Height          =   255
         Index           =   9
         Left            =   3840
         TabIndex        =   27
         Top             =   1800
         Width           =   1575
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Child Study Exp :"
         Height          =   255
         Index           =   8
         Left            =   360
         TabIndex        =   26
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Spouse Exp :"
         Height          =   255
         Index           =   7
         Left            =   3840
         TabIndex        =   25
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Personal Exp :"
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   24
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Gen Exp Limit :"
         Height          =   255
         Index           =   2
         Left            =   3840
         TabIndex        =   23
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Gen Exp Rate (%) :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   22
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
         TabIndex        =   21
         Top             =   3240
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   20
         Top             =   2880
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   19
         Top             =   3240
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   18
         Top             =   2880
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Expire Date :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   17
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Effective Date :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   16
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   14
      Top             =   4650
      Width           =   8175
      _ExtentX        =   14420
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
Attribute VB_Name = "ProgressiveTaxBaseDeductionDetail"
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
Text2.Text = ""
Text3.Text = ""
Text4.Text = ""
Text5.Text = ""
Text6.Text = ""
Text7.Text = ""
Text8.Text = ""
Text9.Text = ""

Check1.Value = Unchecked
DTPicker2.Visible = True

DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DateFilter(Now)

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Check1_Click()

If Check1.Value = Checked Then
    DTPicker2.Visible = False
Else
    DTPicker2.Visible = True
End If

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(12) As New ADODB.Parameter
Dim xPr(13) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_ptbd_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(2) = tCmd.CreateParameter("ExpireDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(3) = tCmd.CreateParameter("GenExpRate", adCurrency, adParamInput, 8)
        Set tPr(4) = tCmd.CreateParameter("GenExpLimit", adCurrency, adParamInput, 8)
        Set tPr(5) = tCmd.CreateParameter("PersonalExp", adCurrency, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("SpouseExp", adCurrency, adParamInput, 8)
        Set tPr(7) = tCmd.CreateParameter("ChildStudyExp", adCurrency, adParamInput, 8)
        Set tPr(8) = tCmd.CreateParameter("ChildNotStudyExp", adCurrency, adParamInput, 8)
        Set tPr(9) = tCmd.CreateParameter("ChildLimit", adTinyInt, adParamInput, 8)
        Set tPr(10) = tCmd.CreateParameter("InsuranceFeeLimit", adCurrency, adParamInput, 8)
        Set tPr(11) = tCmd.CreateParameter("TaxBaseExemption", adCurrency, adParamInput, 8)
        Set tPr(12) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = DateFilter(DTPicker1.Value)
        If Check1.Value = Unchecked Then
            tPr(2).Value = DateFilter(DTPicker2.Value)
        Else
            tPr(2).Value = Null
        End If
        tPr(3).Value = CFC(Text1.Text)
        tPr(4).Value = CFC(Text2.Text)
        tPr(5).Value = CFC(Text3.Text)
        tPr(6).Value = CFC(Text4.Text)
        tPr(7).Value = CFC(Text5.Text)
        tPr(8).Value = CFC(Text6.Text)
        tPr(9).Value = CFC(Text7.Text)
        tPr(10).Value = CFC(Text8.Text)
        tPr(11).Value = CFC(Text9.Text)
        tPr(12).Value = CurUser
        
        For i = 0 To 12
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "pr_ptbd_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set xPr(1) = tCmd.CreateParameter("oldEffectiveDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(2) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(3) = tCmd.CreateParameter("ExpireDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(4) = tCmd.CreateParameter("GenExpRate", adCurrency, adParamInput, 8)
        Set xPr(5) = tCmd.CreateParameter("GenExpLimit", adCurrency, adParamInput, 8)
        Set xPr(6) = tCmd.CreateParameter("PersonalExp", adCurrency, adParamInput, 8)
        Set xPr(7) = tCmd.CreateParameter("SpouseExp", adCurrency, adParamInput, 8)
        Set xPr(8) = tCmd.CreateParameter("ChildStudyExp", adCurrency, adParamInput, 8)
        Set xPr(9) = tCmd.CreateParameter("ChildNotStudyExp", adCurrency, adParamInput, 8)
        Set xPr(10) = tCmd.CreateParameter("ChildLimit", adTinyInt, adParamInput, 8)
        Set xPr(11) = tCmd.CreateParameter("InsuranceFeeLimit", adCurrency, adParamInput, 8)
        Set xPr(12) = tCmd.CreateParameter("TaxBaseExemption", adCurrency, adParamInput, 8)
        Set xPr(13) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        xPr(0) = CurCmp
        xPr(1) = CDateX(OldCode)
        xPr(2).Value = DateFilter(DTPicker1.Value)
        If Check1.Value = Unchecked Then
            xPr(3).Value = DateFilter(DTPicker2.Value)
        Else
            xPr(3).Value = Null
        End If
        xPr(4).Value = CFC(Text1.Text)
        xPr(5).Value = CFC(Text2.Text)
        xPr(6).Value = CFC(Text3.Text)
        xPr(7).Value = CFC(Text4.Text)
        xPr(8).Value = CFC(Text5.Text)
        xPr(9).Value = CFC(Text6.Text)
        xPr(10).Value = CFC(Text7.Text)
        xPr(11).Value = CFC(Text8.Text)
        xPr(12).Value = CFC(Text9.Text)
        xPr(13) = CurUser

        For i = 0 To 13
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
tCmd.CommandText = "pr_ptbd_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)

tPr(0).Value = CurCmp
tPr(1).Value = CDateX(CodeParam)

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

DTPicker1.Value = tRs("EffectiveDate")
If IsNull(tRs("ExpireDate")) = False Then
    DTPicker2.Value = tRs("ExpireDate")
    Check1.Value = Unchecked
    DTPicker2.Visible = True
Else
    Check1.Value = Checked
    DTPicker2.Visible = False
End If

Text1.Text = Format(tRs("GenExpRate"), "#,##0.00")
Text2.Text = Format(tRs("GenExpLimit"), "#,##0.00")
Text3.Text = Format(tRs("PersonalExp"), "#,##0.00")
Text4.Text = Format(tRs("SpouseExp"), "#,##0.00")
Text5.Text = Format(tRs("ChildStudyExp"), "#,##0.00")
Text6.Text = Format(tRs("ChildNotStudyExp"), "#,##0.00")
Text7.Text = Format(tRs("ChildLimit"), "#,##0")
Text8.Text = Format(tRs("InsuranceFeeLimit"), "#,##0.00")
Text9.Text = Format(tRs("TaxBaseExemption"), "#,##0.00")

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

