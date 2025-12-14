VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form BankDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Bank Information"
   ClientHeight    =   5925
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7695
   Icon            =   "BankDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   7695
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6240
      TabIndex        =   14
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   4920
      TabIndex        =   13
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Bank Information"
      Height          =   4695
      Left            =   240
      TabIndex        =   16
      Top             =   240
      Width           =   7215
      Begin VB.Frame Frame3 
         Caption         =   "Local Area Transfer Charges"
         ForeColor       =   &H000040C0&
         Height          =   1695
         Left            =   360
         TabIndex        =   27
         Top             =   2060
         Width           =   3255
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   5
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   8
            Text            =   "Text4"
            Top             =   1260
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   4
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   7
            Text            =   "Text4"
            Top             =   900
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   3
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   6
            Text            =   "Text4"
            Top             =   540
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   2
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   5
            Text            =   "Text4"
            Top             =   180
            Width           =   1215
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Connection :"
            Height          =   255
            Index           =   5
            Left            =   600
            TabIndex        =   32
            Top             =   1320
            Width           =   975
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Fee Limit :"
            Height          =   255
            Index           =   4
            Left            =   600
            TabIndex        =   31
            Top             =   960
            Width           =   975
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "For Every :"
            Height          =   255
            Index           =   3
            Left            =   600
            TabIndex        =   30
            Top             =   600
            Width           =   975
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Fee Rate :"
            Height          =   255
            Index           =   2
            Left            =   600
            TabIndex        =   29
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Local Area Transfer Charges"
         ForeColor       =   &H000040C0&
         Height          =   1695
         Left            =   3600
         TabIndex        =   28
         Top             =   2060
         Width           =   3255
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   9
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   12
            Text            =   "Text4"
            Top             =   1260
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   8
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   11
            Text            =   "Text4"
            Top             =   900
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   7
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   10
            Text            =   "Text4"
            Top             =   540
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   6
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   9
            Text            =   "Text4"
            Top             =   180
            Width           =   1215
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Connection :"
            Height          =   255
            Index           =   9
            Left            =   600
            TabIndex        =   36
            Top             =   1320
            Width           =   975
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Fee Limit :"
            Height          =   255
            Index           =   8
            Left            =   600
            TabIndex        =   35
            Top             =   960
            Width           =   975
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "For Every :"
            Height          =   255
            Index           =   7
            Left            =   600
            TabIndex        =   34
            Top             =   600
            Width           =   975
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Fee Rate :"
            Height          =   255
            Index           =   6
            Left            =   600
            TabIndex        =   33
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Payroll Charges"
         ForeColor       =   &H000040C0&
         Height          =   615
         Left            =   360
         TabIndex        =   24
         Top             =   1440
         Width           =   6495
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   1
            Left            =   5040
            MaxLength       =   20
            TabIndex        =   4
            Text            =   "Text4"
            Top             =   180
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   285
            Index           =   0
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   3
            Text            =   "Text4"
            Top             =   180
            Width           =   1215
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Outer Area Charge :"
            Height          =   255
            Index           =   1
            Left            =   3360
            TabIndex        =   26
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Local Area Charge :"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   25
            Top             =   240
            Width           =   1575
         End
      End
      Begin VB.TextBox Text3 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   2
         Text            =   "Text3"
         Top             =   1020
         Width           =   4935
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   1
         Text            =   "Text2"
         Top             =   660
         Width           =   4935
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   3
         TabIndex        =   0
         Text            =   "Tx1"
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1920
         TabIndex        =   23
         Top             =   4200
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   22
         Top             =   3840
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   21
         Top             =   4200
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   20
         Top             =   3840
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Name :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   19
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Name :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   18
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Bank ID :"
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
      Top             =   5610
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
Attribute VB_Name = "BankDetail"
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
For i = 0 To 9
    Text4(i).Text = ""
Next i

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(13) As Variant
Dim xPr(14) As Variant
Dim i As Long

If Len(Text1.Text) <> 3 Then
    MsgBox "Bank ID length must be 3 characters...", vbCritical + vbOKOnly
    Exit Sub
End If

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_bank_insert"

        tPr(0) = Text1.Text
        tPr(1) = Text2.Text
        tPr(2) = Text3.Text
        tPr(3) = CFC(Text4(0).Text)
        tPr(4) = CFC(Text4(1).Text)
        tPr(5) = CFC(Text4(2).Text)
        tPr(6) = CFC(Text4(3).Text)
        tPr(7) = CFC(Text4(4).Text)
        tPr(8) = CFC(Text4(5).Text)
        tPr(9) = CFC(Text4(6).Text)
        tPr(10) = CFC(Text4(7).Text)
        tPr(11) = CFC(Text4(8).Text)
        tPr(12) = CFC(Text4(9).Text)
        tPr(13) = CurUser

        Set tRs = tCmd.Execute(, tPr)
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_bank_update"

        xPr(0) = OldCode
        xPr(1) = Text1.Text
        xPr(2) = Text2.Text
        xPr(3) = Text3.Text
        xPr(4) = CFC(Text4(0).Text)
        xPr(5) = CFC(Text4(1).Text)
        xPr(6) = CFC(Text4(2).Text)
        xPr(7) = CFC(Text4(3).Text)
        xPr(8) = CFC(Text4(4).Text)
        xPr(9) = CFC(Text4(5).Text)
        xPr(10) = CFC(Text4(6).Text)
        xPr(11) = CFC(Text4(7).Text)
        xPr(12) = CFC(Text4(8).Text)
        xPr(13) = CFC(Text4(9).Text)
        xPr(14) = CurUser

        Set tRs = tCmd.Execute(, xPr)

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
tCmd.CommandText = "hrm_bank_select"

tPr(0) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("BankID")
Text2.Text = tRs("TH_BankName")
Text3.Text = tRs("EN_BankName")

Text4(0).Text = Format(tRs("LAPayrollCharge"), "#,##0.00")
Text4(1).Text = Format(tRs("OAPAyrollCharge"), "#,##0.00")
Text4(2).Text = Format(tRs("LATransferFeeRate"), "#,##0.00")
Text4(3).Text = Format(tRs("LATransferBaseAmount"), "#,##0.00")
Text4(4).Text = Format(tRs("LATransferFeeLimit"), "#,##0.00")
Text4(5).Text = Format(tRs("LAConnectionCharge"), "#,##0.00")
Text4(6).Text = Format(tRs("OATransferFeeRate"), "#,##0.00")
Text4(7).Text = Format(tRs("OATransferBaseAmount"), "#,##0.00")
Text4(8).Text = Format(tRs("OATransferFeeLimit"), "#,##0.00")
Text4(9).Text = Format(tRs("OAConnectionCharge"), "#,##0.00")

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

