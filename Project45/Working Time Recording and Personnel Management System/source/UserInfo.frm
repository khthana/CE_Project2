VERSION 5.00
Begin VB.Form UserInfo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "User Information"
   ClientHeight    =   4485
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8265
   Icon            =   "UserInfo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4485
   ScaleWidth      =   8265
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   375
      Left            =   6840
      TabIndex        =   0
      Top             =   3840
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Password"
      Height          =   375
      Left            =   5520
      TabIndex        =   1
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Height          =   3495
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   7815
      Begin VB.Frame Frame2 
         Height          =   2895
         Left            =   240
         TabIndex        =   3
         Top             =   240
         Width           =   2295
         Begin VB.Image Image1 
            Height          =   2760
            Left            =   15
            Stretch         =   -1  'True
            Top             =   105
            Width           =   2250
         End
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   6
         Left            =   3960
         TabIndex        =   17
         Top             =   1800
         Width           =   3615
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   5
         Left            =   3960
         TabIndex        =   16
         Top             =   1560
         Width           =   3615
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   4
         Left            =   3960
         TabIndex        =   15
         Top             =   1320
         Width           =   3615
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   3
         Left            =   3960
         TabIndex        =   14
         Top             =   1080
         Width           =   3615
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   3960
         TabIndex        =   13
         Top             =   840
         Width           =   3615
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   3960
         TabIndex        =   12
         Top             =   600
         Width           =   3615
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   0
         Left            =   3960
         TabIndex        =   11
         Top             =   360
         Width           =   3615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Modified by :"
         Height          =   255
         Index           =   6
         Left            =   2640
         TabIndex        =   10
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Issued by :"
         Height          =   255
         Index           =   5
         Left            =   2640
         TabIndex        =   9
         Top             =   1560
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Expired Date :"
         Height          =   255
         Index           =   4
         Left            =   2640
         TabIndex        =   8
         Top             =   1320
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Effective Date :"
         Height          =   255
         Index           =   3
         Left            =   2640
         TabIndex        =   7
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Group :"
         Height          =   255
         Index           =   2
         Left            =   2640
         TabIndex        =   6
         Top             =   840
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Name :"
         Height          =   255
         Index           =   1
         Left            =   2640
         TabIndex        =   5
         Top             =   600
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "ID :"
         Height          =   255
         Index           =   0
         Left            =   2640
         TabIndex        =   4
         Top             =   360
         Width           =   1455
      End
   End
End
Attribute VB_Name = "UserInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

Load UserPassword
UserPassword.Show

End Sub

Private Sub Command2_Click()

Unload UserInfo
If cmpFLAG = False Then
    Load CompanySelect
    CompanySelect.Show
End If

End Sub

Private Sub Form_Load()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As Variant

Dim sCmd As New ADODB.Command
Dim sRs As New ADODB.Recordset
Dim sPr(2) As New ADODB.Parameter

Dim i As Long

Const conChunkSize = 100

Dim lngImgSize As Long
Dim lngOffset As Long
Dim ByteCount As Long
Dim ByteArray1() As Byte
Dim varChunk1() As Byte
Dim varConvertedPicture As Variant
Dim x As Long
Dim y As Long
Dim varLogo() As Byte
Dim varChunk As Variant
Dim varImage As Variant
Dim pSize As Long

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

Image1.Picture = LoadPicture()
For i = 0 To 6
    Label2(i).Caption = ""
Next i

On Error GoTo ErrHandler

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_get_user_info"
tPr(0) = CurUser

Set tRs = tCmd.Execute(, tPr)

If tRs.EOF = False Then
    Label2(0).Caption = tRs("UserID")
    Label2(1).Caption = tRs("UserName")
    
    LoadPictureFromDB tRs, "Photo", Image1
    
    Label2(3).Caption = Format(tRs("EffectiveDate"), gblMedDateTimeFmt)
    Label2(4).Caption = Format(tRs("ExpireDate"), gblMedDateTimeFmt)
    If (IsNull(tRs("CreateUserID")) Or IsNull(tRs("CreateDateTime"))) = False Then
        Label2(5).Caption = tRs("CreateUserID") + " " + Format(tRs("CreateDateTime"), gblMedDateTimeFmt)
    Else
        Label2(5).Caption = "N/A"
    End If
    If (IsNull(tRs("LastModifyUserID")) Or IsNull(tRs("LastModifyDateTime"))) = False Then
        Label2(6).Caption = tRs("LastModifyUserID") + " " + Format(tRs("LastModifyDateTime"), gblMedDateTimeFmt)
    Else
        Label2(6).Caption = "N/A"
    End If
    
    Label2(2).Caption = tRs("UserGroupName")
    
Else
    MsgBox "Unable to display user information...", vbCritical + vbOKOnly
    Exit Sub
End If

Set tCmd = Nothing
Set tRs = Nothing

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

