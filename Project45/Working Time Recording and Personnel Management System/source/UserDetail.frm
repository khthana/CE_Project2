VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form UserDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "User Information"
   ClientHeight    =   5355
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10350
   Icon            =   "UserDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5355
   ScaleWidth      =   10350
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   8880
      TabIndex        =   13
      Top             =   4440
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   7560
      TabIndex        =   12
      Top             =   4440
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "User Information"
      Height          =   4095
      Left            =   240
      TabIndex        =   15
      Top             =   240
      Width           =   9855
      Begin VB.TextBox Text4 
         ForeColor       =   &H00C00000&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   4560
         MaxLength       =   10
         PasswordChar    =   "o"
         TabIndex        =   8
         Text            =   "Text2"
         Top             =   2580
         Width           =   1575
      End
      Begin VB.TextBox Text3 
         ForeColor       =   &H00C00000&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   4560
         MaxLength       =   10
         PasswordChar    =   "o"
         TabIndex        =   7
         Text            =   "Text2"
         Top             =   2220
         Width           =   1575
      End
      Begin VB.Frame Frame2 
         Caption         =   "Photo"
         Height          =   3615
         Left            =   240
         TabIndex        =   25
         Top             =   360
         Width           =   2415
         Begin VB.CommandButton Command15 
            Caption         =   "&Import"
            Height          =   375
            Left            =   120
            TabIndex        =   9
            Top             =   3120
            Width           =   735
         End
         Begin VB.CommandButton Command16 
            Caption         =   "&Clear"
            Height          =   375
            Left            =   840
            TabIndex        =   10
            Top             =   3120
            Width           =   735
         End
         Begin VB.CommandButton Command17 
            Caption         =   "&Export"
            Height          =   375
            Left            =   1560
            TabIndex        =   11
            Top             =   3120
            Width           =   735
         End
         Begin VB.Image Image1 
            Height          =   2775
            Left            =   120
            Stretch         =   -1  'True
            Top             =   240
            Width           =   2175
         End
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Enabled"
         Height          =   255
         Left            =   8520
         TabIndex        =   1
         Top             =   480
         Width           =   975
      End
      Begin VB.ComboBox UsrGrpCb 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   4560
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   780
         Width           =   4575
      End
      Begin VB.CommandButton Command3 
         Height          =   315
         Left            =   9120
         Picture         =   "UserDetail.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   780
         Width           =   375
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   4560
         MaxLength       =   50
         TabIndex        =   4
         Text            =   "Text2"
         Top             =   1140
         Width           =   4935
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   285
         Left            =   4560
         MaxLength       =   10
         TabIndex        =   0
         Text            =   "Tx1"
         Top             =   420
         Width           =   1575
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   4560
         TabIndex        =   5
         Top             =   1500
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   556
         _Version        =   393216
         Format          =   64946177
         CurrentDate     =   37642
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   315
         Left            =   4560
         TabIndex        =   6
         Top             =   1860
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   556
         _Version        =   393216
         Format          =   64946177
         CurrentDate     =   37642
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Verify Password :"
         Height          =   255
         Index           =   8
         Left            =   3000
         TabIndex        =   27
         Top             =   2640
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Password :"
         Height          =   255
         Index           =   2
         Left            =   3000
         TabIndex        =   26
         Top             =   2280
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Effective Date :"
         Height          =   255
         Index           =   7
         Left            =   3000
         TabIndex        =   24
         Top             =   1560
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Expire Date :"
         Height          =   255
         Index           =   4
         Left            =   3000
         TabIndex        =   23
         Top             =   1920
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "User Group Code :"
         Height          =   255
         Index           =   3
         Left            =   3000
         TabIndex        =   22
         Top             =   840
         Width           =   1455
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   4560
         TabIndex        =   21
         Top             =   3360
         Width           =   4935
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   4560
         TabIndex        =   20
         Top             =   3000
         Width           =   4935
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Last Modified by :"
         Height          =   255
         Index           =   6
         Left            =   3000
         TabIndex        =   19
         Top             =   3360
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Created by :"
         Height          =   255
         Index           =   5
         Left            =   3000
         TabIndex        =   18
         Top             =   3000
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "User Name :"
         Height          =   255
         Index           =   1
         Left            =   3000
         TabIndex        =   17
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "User ID :"
         Height          =   255
         Index           =   0
         Left            =   3000
         TabIndex        =   16
         Top             =   480
         Width           =   1455
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   14
      Top             =   5040
      Width           =   10350
      _ExtentX        =   18256
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
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   4560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DialogTitle     =   "Import Image File"
      Filter          =   "Image Files (*.jpg; *.gif; *.bmp)| *.jpg;*.gif;*.bmp;"
   End
   Begin MSComDlg.CommonDialog CommonDialog2 
      Left            =   480
      Top             =   4560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DefaultExt      =   "bmp"
      DialogTitle     =   "Export Image File"
      FileName        =   "employee.bmp"
      Filter          =   "Image Files (*.jpg; *.gif; *.bmp)| *.jpg;*.gif;*.bmp;"
   End
End
Attribute VB_Name = "UserDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private OldPsw As String

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
Text4.Text = ""

Check1.Value = Checked

LoadUsrGrpCb

Image1.Picture = LoadPicture()

DTPicker1.Value = DateFilter(Now)
DTPicker2.Value = DateFilter(Now)

Label2(0).Caption = ""
Label2(1).Caption = ""

End Sub

Private Sub Command1_Click()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(7) As New ADODB.Parameter
Dim xPr(8) As New ADODB.Parameter
Dim i As Long
Dim s As Long

If frmStatus = FormState.Create And Text3.Text <> Text4.Text Then
    MsgBox "Password and Verify password are not identical...", vbCritical + vbOKOnly
    Exit Sub
End If

For i = 0 To UsrGrpCb.ListCount - 1
    If UsrGrpCb.Text = UsrGrpCb.List(i) Then GoTo FoundUsrGrpCb
Next i

MsgBox "Invalid UserGroup Code", vbCritical + vbOKOnly
Exit Sub
FoundUsrGrpCb:

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create
    
        AddLogin

        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "app_user_insert"

        Set tPr(0) = tCmd.CreateParameter("UserID", adVarChar, adParamInput, 10)
        Set tPr(1) = tCmd.CreateParameter("UserGroupCode", adVarChar, adParamInput, 6)
        Set tPr(2) = tCmd.CreateParameter("UserName", adVarChar, adParamInput, 50)
        Set tPr(3) = tCmd.CreateParameter("Photo", adLongVarBinary, adParamInput)
        Set tPr(4) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(5) = tCmd.CreateParameter("ExpireDate", adDBTimeStamp, adParamInput, 8)
        Set tPr(6) = tCmd.CreateParameter("Enabled", adBoolean, adParamInput, 1)
        Set tPr(7) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = Text1.Text
        tPr(1).Value = Trim(Left(UsrGrpCb.Text, 6))
        tPr(2).Value = Text2.Text
        
        SavePictureToParam tPr(3), Image1, s
        tPr(3).Size = s
        
        tPr(4).Value = DTPicker1.Value
        tPr(5).Value = DTPicker2.Value
        
        If Check1.Value = Checked Then
            tPr(6).Value = True
        Else
            tPr(6).Value = False
        End If
        
        tPr(7).Value = CurUser

        For i = 0 To 7
            tCmd.Parameters.Append tPr(i)
        Next i

        Set tRs = tCmd.Execute
        
    Case Is = FormState.Modify
    
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "app_user_update"

        Set xPr(0) = tCmd.CreateParameter("oldUserID", adVarChar, adParamInput, 10)
        Set xPr(1) = tCmd.CreateParameter("UserID", adVarChar, adParamInput, 10)
        Set xPr(2) = tCmd.CreateParameter("UserGroupCode", adVarChar, adParamInput, 6)
        Set xPr(3) = tCmd.CreateParameter("UserName", adVarChar, adParamInput, 50)
        Set xPr(4) = tCmd.CreateParameter("Photo", adLongVarBinary, adParamInput)
        Set xPr(5) = tCmd.CreateParameter("EffectiveDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(6) = tCmd.CreateParameter("ExpireDate", adDBTimeStamp, adParamInput, 8)
        Set xPr(7) = tCmd.CreateParameter("Enabled", adBoolean, adParamInput, 1)
        Set xPr(8) = tCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        xPr(0).Value = OldCode
        xPr(1).Value = Text1.Text
        xPr(2).Value = Trim(Left(UsrGrpCb.Text, 6))
        xPr(3).Value = Text2.Text
        
        SavePictureToParam xPr(4), Image1, s
        xPr(4).Size = s
        
        xPr(5).Value = DTPicker1.Value
        xPr(6).Value = DTPicker2.Value
        
        If Check1.Value = Checked Then
            xPr(7).Value = True
        Else
            xPr(7).Value = False
        End If
        
        xPr(8).Value = CurUser

        For i = 0 To 8
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

If frmStatus = FormState.Create Then DeleteLogin

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub Command15_Click()

On Error GoTo ErrHandler

CommonDialog1.ShowOpen

Image1.Picture = LoadPicture(CommonDialog1.FileName)

Exit Sub
ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command16_Click()

Image1.Picture = LoadPicture()

End Sub

Private Sub Command17_Click()

On Error GoTo ErrHandler

CommonDialog2.ShowSave

SavePicture Image1.Picture, CommonDialog2.FileName

Exit Sub
ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command3_Click()

Dim frmCalled As New UserGroup
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
Label1(2).Visible = True
Label1(8).Visible = True
Text3.Visible = True
Text4.Visible = True

End Sub

Public Sub ViewDetail(ByVal CodeParam As String)

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As Variant

On Error GoTo ErrHandler

Label1(2).Visible = False
Label1(8).Visible = False
Text3.Visible = False
Text4.Visible = False

MainMDI.MousePointer = vbHourglass

ClrScr

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_select"

tPr(0) = CodeParam

Set tRs = tCmd.Execute(, tPr)

Text1.Text = tRs("UserID")
Text2.Text = tRs("UserName")

UsrGrpCbSelect tRs("UserGroupCode")

LoadPictureFromDB tRs, "Photo", Image1

DTPicker1.Value = tRs("EffectiveDate")
DTPicker2.Value = tRs("ExpireDate")

If tRs("Enabled") = True Then
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

Public Sub LoadUsrGrpCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_group_select_all"

Set tRs = tCmd.Execute

UsrGrpCb.Clear

Do While Not tRs.EOF

    UsrGrpCb.AddItem FillSpace(tRs("UserGroupCode"), 6) + " - " + tRs("UserGroupName")

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

Public Sub UsrGrpCbSelect(ByVal Param As String)
Dim i As Long

LoadUsrGrpCb

For i = 0 To UsrGrpCb.ListCount - 1
    If Trim(Left(UsrGrpCb.List(i), 6)) = Trim(Param) Then
        UsrGrpCb.Text = UsrGrpCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Public Sub AddLogin()

Dim aCmd As New ADODB.Command
Dim aRs As New ADODB.Recordset
Dim aPr(2) As Variant
Dim bCmd As New ADODB.Command
Dim bRs As New ADODB.Recordset
Dim bPr(0) As Variant
Dim cCmd As New ADODB.Command
Dim cRs As New ADODB.Recordset
Dim cPr(1) As Variant

On Error Resume Next

Set aCmd.ActiveConnection = sConn

aCmd.CommandType = adCmdStoredProc
aCmd.CommandText = "sp_addlogin"

aPr(0) = Text1.Text
aPr(1) = Text3.Text
aPr(2) = "PISpro"

Set aRs = aCmd.Execute(, aPr)

Set bCmd.ActiveConnection = sConn

bCmd.CommandType = adCmdStoredProc
bCmd.CommandText = "sp_grantdbaccess"

bPr(0) = Text1.Text

Set bRs = bCmd.Execute(, bPr)

Set cCmd.ActiveConnection = sConn

cCmd.CommandType = adCmdStoredProc
cCmd.CommandText = "sp_addrolemember"

cPr(0) = "PISproApp"
cPr(1) = Text1.Text

Set cRs = cCmd.Execute(, cPr)

Set aRs = Nothing
Set aCmd = Nothing
Set bRs = Nothing
Set bCmd = Nothing
Set cRs = Nothing
Set cCmd = Nothing

End Sub

Public Sub DeleteLogin()

Dim aCmd As New ADODB.Command
Dim aRs As New ADODB.Recordset
Dim aPr(0) As Variant
Dim bCmd As New ADODB.Command
Dim bRs As New ADODB.Recordset
Dim bPr(0) As Variant

On Error Resume Next

Set aCmd.ActiveConnection = sConn

aCmd.CommandType = adCmdStoredProc
aCmd.CommandText = "sp_dropuser"

aPr(0) = Text1.Text

Set aRs = aCmd.Execute(, aPr)

Set bCmd.ActiveConnection = sConn

bCmd.CommandType = adCmdStoredProc
bCmd.CommandText = "sp_droplogin"

bPr(0) = Text1.Text

Set bRs = bCmd.Execute(, bPr)

Set aRs = Nothing
Set aCmd = Nothing
Set bCmd = Nothing

End Sub
