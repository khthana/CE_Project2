VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form JobDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Job Information"
   ClientHeight    =   5340
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7845
   Icon            =   "JobDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5340
   ScaleWidth      =   7845
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6360
      TabIndex        =   8
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   5040
      TabIndex        =   7
      Top             =   4440
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Job Information"
      Height          =   4095
      Left            =   240
      TabIndex        =   10
      Top             =   240
      Width           =   7335
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   4440
         TabIndex        =   6
         Top             =   2820
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         Format          =   60817409
         CurrentDate     =   37642
      End
      Begin VB.TextBox Text5 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   1920
         MaxLength       =   20
         TabIndex        =   5
         Text            =   "Text5"
         Top             =   2820
         Width           =   1455
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Active"
         Height          =   255
         Left            =   6000
         TabIndex        =   1
         Top             =   360
         Width           =   855
      End
      Begin VB.TextBox Text4 
         ForeColor       =   &H00C00000&
         Height          =   1365
         Left            =   1920
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   4
         Text            =   "JobDetail.frx":0442
         Top             =   1380
         Width           =   4935
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
         MaxLength       =   10
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   300
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Job Start :"
         Height          =   255
         Index           =   7
         Left            =   3600
         TabIndex        =   20
         Top             =   2880
         Width           =   735
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Budget :"
         Height          =   255
         Index           =   4
         Left            =   360
         TabIndex        =   19
         Top             =   2880
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   1920
         TabIndex        =   18
         Top             =   3600
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   1920
         TabIndex        =   17
         Top             =   3240
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   360
         TabIndex        =   16
         Top             =   3600
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   15
         Top             =   3240
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Description :"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   14
         Top             =   1440
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Name :"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   13
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Name :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   12
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Job Code :"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   11
         Top             =   360
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   9
      Top             =   5025
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
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Label3"
      Height          =   255
      Left            =   240
      TabIndex        =   21
      Top             =   4560
      Width           =   4575
   End
End
Attribute VB_Name = "JobDetail"
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

Check1.Value = Checked

DTPicker1.Value = DateFilter(Now)

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(8) As ADODB.Parameter
Dim xPr(9) As ADODB.Parameter
Dim i As Long

On Error GoTo ErrHandler

If Text4.Text = "" Then Text4.Text = " "

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_job_insert"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("JobCode", adVarChar, adParamInput, 10)
        Set tPr(2) = tCmd.CreateParameter("TH_JobName", adVarChar, adParamInput, 30)
        Set tPr(3) = tCmd.CreateParameter("EN_JobName", adVarChar, adParamInput, 30)
        Set tPr(4) = tCmd.CreateParameter("Description", adLongVarChar, adParamInput, Len(Text4.Text))
        Set tPr(5) = tCmd.CreateParameter("Budget", adCurrency, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("JobStart", adDBTimeStamp, adParamInput, 8)
        Set tPr(7) = tCmd.CreateParameter("Active", adBoolean, adParamInput, 1)
        Set tPr(8) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = Text1.Text
        tPr(2).Value = Text2.Text
        tPr(3).Value = Text3.Text
        tPr(4).Value = Text4.Text
        tPr(5).Value = CFC(Text5.Text)
        tPr(6).Value = DateFilter(DTPicker1.Value)
        If Check1.Value = Checked Then
            tPr(7).Value = True
        Else
            tPr(7).Value = False
        End If
        tPr(8).Value = CurUser

        For i = 0 To 8
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_job_update"

        Set xPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set xPr(1) = tCmd.CreateParameter("OldCode", adVarChar, adParamInput, 10)
        Set xPr(2) = tCmd.CreateParameter("JobCode", adVarChar, adParamInput, 10)
        Set xPr(3) = tCmd.CreateParameter("TH_JobName", adVarChar, adParamInput, 30)
        Set xPr(4) = tCmd.CreateParameter("EN_JobName", adVarChar, adParamInput, 30)
        Set xPr(5) = tCmd.CreateParameter("Description", adLongVarChar, adParamInput, Len(Text4.Text))
        Set xPr(6) = tCmd.CreateParameter("Budget", adCurrency, adParamInput, 8)
        Set xPr(7) = tCmd.CreateParameter("JobStart", adDBTimeStamp, adParamInput, 8)
        Set xPr(8) = tCmd.CreateParameter("Active", adBoolean, adParamInput, 1)
        Set xPr(9) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        xPr(0).Value = CurCmp
        xPr(1).Value = OldCode
        xPr(2).Value = Text1.Text
        xPr(3).Value = Text2.Text
        xPr(4).Value = Text3.Text
        xPr(5).Value = Text4.Text
        xPr(6).Value = CFC(Text5.Text)
        xPr(7).Value = DateFilter(DTPicker1.Value)
        If Check1.Value = Checked Then
            xPr(8).Value = True
        Else
            xPr(8).Value = False
        End If
        xPr(9).Value = CurUser
        
        For i = 0 To 9
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
tCmd.CommandText = "hrm_job_select"

tPr(0) = CurCmp
tPr(1) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("JobCode")
Text2.Text = tRs("TH_JobName")
Text3.Text = tRs("EN_JobName")
Text4.Text = tRs("Description")
Text5.Text = Format(tRs("Budget"), "#,##0.00")

DTPicker1.Value = DateFilter(tRs("JobStart").Value)

If tRs("Active") = True Then
    Check1.Value = Checked
Else
    Check1.Value = Unchecked
End If

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

