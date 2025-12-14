VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form CompanyBranchDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Company Branch Information"
   ClientHeight    =   4215
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7845
   Icon            =   "CompanyBranchDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4215
   ScaleWidth      =   7845
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6360
      TabIndex        =   7
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5040
      TabIndex        =   5
      Top             =   3240
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Company Branch Information"
      Height          =   2895
      Left            =   240
      TabIndex        =   8
      Top             =   240
      Width           =   7335
      Begin VB.TextBox Text5 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         MaxLength       =   50
         TabIndex        =   4
         Text            =   "Text1"
         Top             =   1740
         Width           =   4815
      End
      Begin VB.TextBox Text4 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         MaxLength       =   6
         TabIndex        =   3
         Text            =   "Text1"
         Top             =   1380
         Width           =   975
      End
      Begin VB.TextBox Text3 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   2
         Text            =   "Text1"
         Top             =   1020
         Width           =   4815
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         MaxLength       =   30
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   660
         Width           =   4815
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   1920
         MaxLength       =   5
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   300
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Address :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   17
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "SW Branch Code :"
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   16
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Name :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   15
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
         TabIndex        =   14
         Top             =   2520
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   13
         Top             =   2160
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   12
         Top             =   2520
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   11
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Name :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   10
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Branch Code :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   9
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   6
      Top             =   3900
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
Attribute VB_Name = "CompanyBranchDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private cCID As String

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

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(6) As New ADODB.Parameter
Dim xPr(7) As New ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "app_company_branch_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("BranchCode", adVarChar, adParamInput, 5)
        Set tPr(2) = tCmd.CreateParameter("TH_BranchName", adVarChar, adParamInput, 30)
        Set tPr(3) = tCmd.CreateParameter("EN_BranchName", adVarChar, adParamInput, 30)
        Set tPr(4) = tCmd.CreateParameter("SWBranchCode", adVarChar, adParamInput, 6)
        Set tPr(5) = tCmd.CreateParameter("Address", adVarChar, adParamInput, 50)
        Set tPr(6) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = cCID
        tPr(1).Value = Text1.Text
        tPr(2).Value = Text2.Text
        tPr(3).Value = Text3.Text
        tPr(4).Value = Text4.Text
        tPr(5).Value = Text5.Text
        tPr(6).Value = CurUser

        For i = 0 To 6
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "app_company_branch_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set xPr(1) = tCmd.CreateParameter("oldBranchCode", adVarChar, adParamInput, 5)
        Set xPr(2) = tCmd.CreateParameter("BranchCode", adVarChar, adParamInput, 5)
        Set xPr(3) = tCmd.CreateParameter("TH_BranchName", adVarChar, adParamInput, 30)
        Set xPr(4) = tCmd.CreateParameter("EN_BranchName", adVarChar, adParamInput, 30)
        Set xPr(5) = tCmd.CreateParameter("SWBranchCode", adVarChar, adParamInput, 6)
        Set xPr(6) = tCmd.CreateParameter("Address", adVarChar, adParamInput, 50)
        Set xPr(7) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        xPr(0).Value = cCID
        xPr(1).Value = OldCode
        xPr(2).Value = Text1.Text
        xPr(3).Value = Text2.Text
        xPr(4).Value = Text3.Text
        xPr(5).Value = Text4.Text
        xPr(6).Value = Text5.Text
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

Public Sub CreateDetail(ByVal CID As String)

cCID = CID

ClrScr
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create
Label2(0).Caption = "N/A"
Label2(1).Caption = "N/A"

End Sub

Public Sub ViewDetail(ByVal CID As String, ByVal BranchCode As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(1) As New ADODB.Parameter
Dim i As Long

cCID = CID

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_company_branch_select"

Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
Set tPr(1) = tCmd.CreateParameter("BranchCode", adVarChar, adParamInput, 5)

tPr(0).Value = CID
tPr(1).Value = BranchCode

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Text1.Text = tRs("BranchCode")
Text2.Text = tRs("TH_BranchName")
Text3.Text = tRs("EN_BranchName")
Text4.Text = tRs("SWBranchCode")
Text5.Text = tRs("Address")

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

Public Sub ModifyDetail(ByVal CID As String, ByVal BranchCode As String)

ViewDetail CID, BranchCode

OldCode = BranchCode

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Frame1.Enabled = True
Command1.Enabled = True

End Sub

