VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmKeyRing 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Key Ring Setting"
   ClientHeight    =   5190
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   Icon            =   "frmKeyRing.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5190
   ScaleWidth      =   4680
   Begin VB.CommandButton cmdApply 
      Caption         =   "Apply"
      Height          =   495
      Left            =   1680
      TabIndex        =   5
      Top             =   4560
      Width           =   1335
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   495
      Left            =   3120
      TabIndex        =   6
      Top             =   4560
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   4560
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Caption         =   "Public Key Ring"
      Height          =   1335
      Left            =   0
      TabIndex        =   12
      Top             =   3000
      Width           =   4695
      Begin VB.CommandButton cmdCommand 
         Caption         =   "Command"
         Height          =   495
         Left            =   3120
         TabIndex        =   10
         Top             =   480
         Width           =   1335
      End
      Begin VB.CommandButton cmdView 
         Caption         =   "View"
         Height          =   495
         Left            =   1680
         TabIndex        =   9
         Top             =   480
         Width           =   1335
      End
      Begin VB.CommandButton cmdImport 
         Caption         =   "Import/Update"
         Height          =   495
         Left            =   240
         TabIndex        =   8
         Top             =   480
         Width           =   1335
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Private Key"
      Height          =   2895
      Left            =   0
      TabIndex        =   11
      Top             =   0
      Width           =   4695
      Begin VB.TextBox txtPassphase 
         Height          =   375
         IMEMode         =   3  'DISABLE
         Left            =   1680
         PasswordChar    =   "#"
         TabIndex        =   2
         Text            =   "12345678"
         Top             =   1560
         Width           =   2415
      End
      Begin VB.TextBox txtConfirm 
         Height          =   375
         IMEMode         =   3  'DISABLE
         Left            =   1680
         PasswordChar    =   "#"
         TabIndex        =   3
         Text            =   "12345678"
         Top             =   2160
         Width           =   2415
      End
      Begin VB.TextBox txtMarketID 
         Height          =   375
         Left            =   1680
         TabIndex        =   1
         Top             =   960
         Width           =   1455
      End
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   4080
         Top             =   480
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton cmdSetting 
         Caption         =   "Setting"
         Height          =   375
         Left            =   3360
         TabIndex        =   0
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "Password"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   1560
         Width           =   975
      End
      Begin VB.Label Label4 
         Caption         =   "Confirm Password"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   2160
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Market ID"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   1020
         Width           =   855
      End
      Begin VB.Label lblPrivateKey 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Not Know"
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   360
         Width           =   2895
      End
   End
End
Attribute VB_Name = "frmKeyRing"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub cmdApply_Click()
                
        If PrivateKeyFile = "" Then
                MsgBox "Please Select Private Key File before apply", vbExclamation + vbOKOnly
        ElseIf txtMarketID.Text = "Not Know" Then
                MsgBox "Please Enter Market ID before apply", vbExclamation + vbOKOnly
        ElseIf txtPassphase.Text = "" Then
                MsgBox "Password is Empty", vbExclamation + vbOKOnly, "Error!!!"
        ElseIf txtConfirm.Text = "" Then
                MsgBox "Confirm Passphase is Empty", vbExclamation + vbOKOnly, "Error!!!"
        Else
                If txtPassphase.Text = txtConfirm.Text Then
                    MarketID = txtMarketID.Text
                    
                    Password = txtPassphase.Text
                    If ImportKey(lblPrivateKey.Caption) Then
                            MsgBox "Configure Complete"
                    End If
                Else
                    MsgBox "Password Not Match with Confirm Password", vbExclamation + vbOKOnly, "Error!!!"
                End If
        End If
        
End Sub

Private Sub cmdClose_Click()
        Unload Me
End Sub

Private Sub cmdCommand_Click()
        Dim cmd As String
        Dim conn As ADODB.Connection
        
        cmd = InputBox("Enter SQL Command to Execute", "SQL Commond", "")
        If cmd <> "" Then
                On Error GoTo msgerr
                Set conn = New ADODB.Connection
                conn.Open conString
                conn.Execute cmd
                conn.Close
                Set conn = Nothing
                MsgBox "Command Successful", vbInformation + vbOKOnly
        End If
Exit Sub
msgerr:
        MsgBox Error$, vbExclamation + vbOKOnly, "Error !!!"
End Sub

Private Sub cmdImport_Click()
        Dim pbk As String
        Dim uid As String
        pbk = InputBox("Enter UserID of Public Key which Import to Key Ring" & _
                                        vbCrLf & "then Click OK and select Public Key to File Import", "Import Key", "")
        uid = InputBox("Enter Buyer/Seller ID", "Member ID")
        dlgRemote.Show vbModal
        If (pbk <> "") And (uid <> "") Then
                CommonDialog1.Flags = cdlOFNFileMustExist
                CommonDialog1.FileName = ""
                CommonDialog1.Filter = "(*.pbk)|*.pbk"
                CommonDialog1.ShowOpen
                If CommonDialog1.FileName <> "" Then
                        ImportPublicKeyRing CommonDialog1.FileName, pbk, remoteIP, remotePort, uid
                        'MsgBox "Import Key to Keyring Successful", vbInformation + vbOKOnly, "Import Key"
                        remoteIP = ""
                        remotePort = ""
                End If
        End If
End Sub

Private Sub cmdOK_Click()
If PrivateKeyFile = "" Then
                MsgBox "Please Select Private Key File before apply", vbExclamation + vbOKOnly
        ElseIf txtMarketID.Text = "Not Know" Then
                MsgBox "Please Enter Market ID before apply", vbExclamation + vbOKOnly
        ElseIf txtPassphase.Text = "" Then
                MsgBox "Password is Empty", vbExclamation + vbOKOnly, "Error!!!"
        ElseIf txtConfirm.Text = "" Then
                MsgBox "Confirm Passphase is Empty", vbExclamation + vbOKOnly, "Error!!!"
        Else
                If txtPassphase.Text = txtConfirm.Text Then
                    MarketID = txtMarketID.Text
                    
                    Password = txtPassphase.Text
                    If ImportKey(lblPrivateKey.Caption) Then
                            MsgBox "Configure Complete"
                            Unload Me
                            'mdiMain.EnableQueue
                    End If
                Else
                    MsgBox "Password Not Match with Confirm Password", vbExclamation + vbOKOnly, "Error!!!"
                End If
        End If
End Sub

Private Sub cmdSetting_Click()
        CommonDialog1.Flags = cdlOFNFileMustExist
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = "(*.pvk)|*.pvk"
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                PrivateKeyFile = CommonDialog1.FileName
                lblPrivateKey.Caption = CommonDialog1.FileName
        End If
End Sub

Private Sub cmdView_Click()
        frmViewPublicKey.Show
End Sub


Public Sub ImportPublicKeyRing(ByVal PbkFile As String, ByVal Userid As String, ByVal cIP As String, _
                                                                 ByVal cPort As String, ByVal memberID As String)
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        
        Dim IntNextFreeFile As Integer
        Dim keyfile1 As Double
        Dim keyfile2 As Double
        Dim keyDate As Date
        
        Select Case Right(PbkFile, 4)
                        Case ".pbk"     'public key
                                IntNextFreeFile = FreeFile
                                Open PbkFile For Binary As #IntNextFreeFile
                                Get #IntNextFreeFile, , keyfile1
                                Get #IntNextFreeFile, , keyfile2
                                Get #IntNextFreeFile, , keyDate
                                Close #IntNextFreeFile
                        Case Else
                                MsgBox "This File Type Is Not Public Key." & vbCrLf & "Did not import key."
                                Exit Sub
        End Select
        
        'add key to keyring
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = conString
        conn.Open
        rcs.Open "PublicKey", conn, 1, 3, adCmdTable
        rcs.Find "UserID = '" & Userid & "'"
        If (rcs.AbsolutePosition <> adPosEOF) Then
               If MsgBox("This UserID has already in Key Ring" & vbCrLf & _
                                    "Do you want to Update this UserID which New Public Key ?", _
                                    vbQuestion + vbYesNo, "Update Public Key") = vbYes Then
                                With rcs
                                                !keyDate = keyDate
                                                !PublicKey = keyfile1
                                                !N = keyfile2
                                                !ip = cIP
                                                !port = CLng(cPort)
                                                !memberID = memberID
                                        .Update
                                End With
                                MsgBox "Update Public Key Successful", vbInformation + vbOKOnly, "Public Key Ring"
                End If
        Else
                With rcs
                        .AddNew
                                !Userid = Userid
                                !keyDate = keyDate
                                !PublicKey = keyfile1
                                !N = keyfile2
                                !ip = cIP
                                !port = CLng(cPort)
                                !memberID = memberID
                        .Update
                End With
                MsgBox "Import New Public Key to Key Ring Successful", vbInformation + vbOKOnly, "Import Public Key"
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
End Sub

Private Sub Form_Load()
        If PrivateKeyFile = "" Then
                lblPrivateKey.Caption = "Not Know"
        Else
                lblPrivateKey.Caption = PrivateKeyFile
        End If
        If MarketID = "" Then
                txtMarketID.Text = "Not Know"
        Else
                txtMarketID.Text = MarketID
        End If
End Sub
