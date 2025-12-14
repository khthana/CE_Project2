VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form CompanyDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Company Information"
   ClientHeight    =   6900
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9600
   Icon            =   "CompanyDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6900
   ScaleWidth      =   9600
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   8040
      TabIndex        =   20
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   6720
      TabIndex        =   17
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Company Information"
      Height          =   5655
      Left            =   240
      TabIndex        =   19
      Top             =   240
      Width           =   9135
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   4
         Left            =   6120
         MaxLength       =   12
         TabIndex        =   4
         Text            =   "Text1"
         Top             =   1380
         Width           =   2415
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   3
         Left            =   1920
         MaxLength       =   10
         TabIndex        =   3
         Text            =   "Text1"
         Top             =   1380
         Width           =   2175
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   2
         Left            =   1920
         MaxLength       =   50
         TabIndex        =   2
         Text            =   "Text1"
         Top             =   1020
         Width           =   6615
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   1
         Left            =   1920
         MaxLength       =   50
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   660
         Width           =   6615
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   0
         Left            =   1920
         MaxLength       =   3
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   300
         Width           =   735
      End
      Begin VB.Frame Frame22 
         Caption         =   "Vacation"
         Height          =   1215
         Index           =   0
         Left            =   120
         TabIndex        =   36
         Top             =   1800
         Width           =   8895
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   7
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   5
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   8
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   6
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   9
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   7
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   10
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   8
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Begining Balance :"
            Height          =   255
            Index           =   17
            Left            =   360
            TabIndex        =   40
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Balance :"
            Height          =   255
            Index           =   18
            Left            =   360
            TabIndex        =   39
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Earn Per Period :"
            Height          =   255
            Index           =   19
            Left            =   4440
            TabIndex        =   38
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Carryover :"
            Height          =   255
            Index           =   20
            Left            =   4440
            TabIndex        =   37
            Top             =   720
            Width           =   1575
         End
      End
      Begin VB.Frame Frame22 
         Caption         =   "Sick"
         Height          =   1215
         Index           =   1
         Left            =   120
         TabIndex        =   31
         Top             =   3015
         Width           =   8895
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   11
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   12
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   12
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   11
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   13
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   10
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   14
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   9
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Carryover :"
            Height          =   255
            Index           =   21
            Left            =   4440
            TabIndex        =   35
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Earn Per Period :"
            Height          =   255
            Index           =   22
            Left            =   4440
            TabIndex        =   34
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Balance :"
            Height          =   255
            Index           =   23
            Left            =   360
            TabIndex        =   33
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Begining Balance :"
            Height          =   255
            Index           =   24
            Left            =   360
            TabIndex        =   32
            Top             =   360
            Width           =   1575
         End
      End
      Begin VB.Frame Frame22 
         Caption         =   "Personal"
         Height          =   1215
         Index           =   2
         Left            =   120
         TabIndex        =   26
         Top             =   4245
         Width           =   8895
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   15
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   16
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   16
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   15
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   17
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   14
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   18
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   13
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Carryover :"
            Height          =   255
            Index           =   25
            Left            =   4440
            TabIndex        =   30
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Earn Per Period :"
            Height          =   255
            Index           =   26
            Left            =   4440
            TabIndex        =   29
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Balance :"
            Height          =   255
            Index           =   27
            Left            =   360
            TabIndex        =   28
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Begining Balance :"
            Height          =   255
            Index           =   28
            Left            =   360
            TabIndex        =   27
            Top             =   360
            Width           =   1575
         End
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "SW Code :"
         Height          =   255
         Index           =   4
         Left            =   4560
         TabIndex        =   25
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Tax ID :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   24
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Name :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   23
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Name :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   22
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Company ID :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   21
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   18
      Top             =   6585
      Width           =   9600
      _ExtentX        =   16933
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
      TabIndex        =   44
      Top             =   6000
      Width           =   1455
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Last Modified by :"
      Height          =   255
      Index           =   6
      Left            =   240
      TabIndex        =   43
      Top             =   6240
      Width           =   1455
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   0
      Left            =   1800
      TabIndex        =   42
      Top             =   6000
      Width           =   4935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   1
      Left            =   1800
      TabIndex        =   41
      Top             =   6240
      Width           =   4935
   End
End
Attribute VB_Name = "CompanyDetail"
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

For i = 0 To 4
    Text1(i).Text = ""
Next i

For i = 7 To 18
    Text3(i).Text = "0.0000"
Next i

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(17) As New ADODB.Parameter
Dim xPr(18) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "app_company_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("TH_CompanyName", adVarChar, adParamInput, 50)
        Set tPr(2) = tCmd.CreateParameter("EN_CompanyName", adVarChar, adParamInput, 50)
        Set tPr(3) = tCmd.CreateParameter("TaxID", adVarChar, adParamInput, 10)
        Set tPr(4) = tCmd.CreateParameter("SWCompanyCode", adVarChar, adParamInput, 12)
        Set tPr(5) = tCmd.CreateParameter("LV1BB", adCurrency, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("LV1EP", adCurrency, adParamInput, 8)
        Set tPr(7) = tCmd.CreateParameter("LV1MB", adCurrency, adParamInput, 8)
        Set tPr(8) = tCmd.CreateParameter("LV1MC", adCurrency, adParamInput, 8)
        Set tPr(9) = tCmd.CreateParameter("LV2BB", adCurrency, adParamInput, 8)
        Set tPr(10) = tCmd.CreateParameter("LV2EP", adCurrency, adParamInput, 8)
        Set tPr(11) = tCmd.CreateParameter("LV2MB", adCurrency, adParamInput, 8)
        Set tPr(12) = tCmd.CreateParameter("LV2MC", adCurrency, adParamInput, 8)
        Set tPr(13) = tCmd.CreateParameter("LV3BB", adCurrency, adParamInput, 8)
        Set tPr(14) = tCmd.CreateParameter("LV3EP", adCurrency, adParamInput, 8)
        Set tPr(15) = tCmd.CreateParameter("LV3MB", adCurrency, adParamInput, 8)
        Set tPr(16) = tCmd.CreateParameter("LV3MC", adCurrency, adParamInput, 8)
        Set tPr(17) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = Text1(0).Text
        tPr(1).Value = Text1(1).Text
        tPr(2).Value = Text1(2).Text
        tPr(3).Value = Text1(3).Text
        tPr(4).Value = Text1(4).Text
        tPr(5).Value = CFC(Text3(7).Text)
        tPr(6).Value = CFC(Text3(8).Text)
        tPr(7).Value = CFC(Text3(9).Text)
        tPr(8).Value = CFC(Text3(10).Text)
        tPr(9).Value = CFC(Text3(14).Text)
        tPr(10).Value = CFC(Text3(13).Text)
        tPr(11).Value = CFC(Text3(12).Text)
        tPr(12).Value = CFC(Text3(11).Text)
        tPr(13).Value = CFC(Text3(18).Text)
        tPr(14).Value = CFC(Text3(17).Text)
        tPr(15).Value = CFC(Text3(16).Text)
        tPr(16).Value = CFC(Text3(15).Text)
        tPr(17).Value = CurUser
        
        For i = 0 To 17
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "app_company_update"

        Set xPr(0) = tCmd.CreateParameter("oldCID", adVarChar, adParamInput, 3)
        Set xPr(1) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set xPr(2) = tCmd.CreateParameter("TH_CompanyName", adVarChar, adParamInput, 50)
        Set xPr(3) = tCmd.CreateParameter("EN_CompanyName", adVarChar, adParamInput, 50)
        Set xPr(4) = tCmd.CreateParameter("TaxID", adVarChar, adParamInput, 10)
        Set xPr(5) = tCmd.CreateParameter("SWCompanyCode", adVarChar, adParamInput, 12)
        Set xPr(6) = tCmd.CreateParameter("LV1BB", adCurrency, adParamInput, 8)
        Set xPr(7) = tCmd.CreateParameter("LV1EP", adCurrency, adParamInput, 8)
        Set xPr(8) = tCmd.CreateParameter("LV1MB", adCurrency, adParamInput, 8)
        Set xPr(9) = tCmd.CreateParameter("LV1MC", adCurrency, adParamInput, 8)
        Set xPr(10) = tCmd.CreateParameter("LV2BB", adCurrency, adParamInput, 8)
        Set xPr(11) = tCmd.CreateParameter("LV2EP", adCurrency, adParamInput, 8)
        Set xPr(12) = tCmd.CreateParameter("LV2MB", adCurrency, adParamInput, 8)
        Set xPr(13) = tCmd.CreateParameter("LV2MC", adCurrency, adParamInput, 8)
        Set xPr(14) = tCmd.CreateParameter("LV3BB", adCurrency, adParamInput, 8)
        Set xPr(15) = tCmd.CreateParameter("LV3EP", adCurrency, adParamInput, 8)
        Set xPr(16) = tCmd.CreateParameter("LV3MB", adCurrency, adParamInput, 8)
        Set xPr(17) = tCmd.CreateParameter("LV3MC", adCurrency, adParamInput, 8)
        Set xPr(18) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        xPr(0).Value = OldCode
        xPr(1).Value = Text1(0).Text
        xPr(2).Value = Text1(1).Text
        xPr(3).Value = Text1(2).Text
        xPr(4).Value = Text1(3).Text
        xPr(5).Value = Text1(4).Text
        xPr(6).Value = CFC(Text3(7).Text)
        xPr(7).Value = CFC(Text3(8).Text)
        xPr(8).Value = CFC(Text3(9).Text)
        xPr(9).Value = CFC(Text3(10).Text)
        xPr(10).Value = CFC(Text3(14).Text)
        xPr(11).Value = CFC(Text3(13).Text)
        xPr(12).Value = CFC(Text3(12).Text)
        xPr(13).Value = CFC(Text3(11).Text)
        xPr(14).Value = CFC(Text3(18).Text)
        xPr(15).Value = CFC(Text3(17).Text)
        xPr(16).Value = CFC(Text3(16).Text)
        xPr(17).Value = CFC(Text3(15).Text)
        xPr(18).Value = CurUser
        
        For i = 0 To 18
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
Dim tPr(0) As New ADODB.Parameter
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
tCmd.CommandText = "app_company_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)

tPr(0).Value = CodeParam

For i = 0 To 0
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Text1(0).Text = tRs("CID")
Text1(1).Text = tRs("TH_CompanyName")
Text1(2).Text = tRs("EN_CompanyName")
Text1(3).Text = tRs("TaxID")
Text1(4).Text = tRs("SWCompanyCode")

Text3(7).Text = Format(tRs("LV1BB"), "#,##0.0000")
Text3(8).Text = Format(tRs("LV1EP"), "#,##0.0000")
Text3(9).Text = Format(tRs("LV1MB"), "#,##0.0000")
Text3(10).Text = Format(tRs("LV1MC"), "#,##0.0000")
Text3(14).Text = Format(tRs("LV2BB"), "#,##0.0000")
Text3(13).Text = Format(tRs("LV2EP"), "#,##0.0000")
Text3(12).Text = Format(tRs("LV2MB"), "#,##0.0000")
Text3(11).Text = Format(tRs("LV2MC"), "#,##0.0000")
Text3(18).Text = Format(tRs("LV3BB"), "#,##0.0000")
Text3(17).Text = Format(tRs("LV3EP"), "#,##0.0000")
Text3(16).Text = Format(tRs("LV3MB"), "#,##0.0000")
Text3(15).Text = Format(tRs("LV3MC"), "#,##0.0000")

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
