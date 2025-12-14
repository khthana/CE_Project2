VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmSign 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Digital Signature"
   ClientHeight    =   6600
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6645
   Icon            =   "frmSign.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6600
   ScaleWidth      =   6645
   Begin VB.Frame Frame3 
      Height          =   4455
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   6615
      Begin VB.TextBox txtUserID 
         Alignment       =   2  'Center
         Height          =   375
         Left            =   1440
         TabIndex        =   14
         Top             =   480
         Width           =   1455
      End
      Begin VB.TextBox txtSource 
         Height          =   375
         Left            =   1680
         TabIndex        =   13
         Top             =   2760
         Width           =   3015
      End
      Begin VB.TextBox txtDest 
         Height          =   375
         Left            =   1680
         TabIndex        =   12
         Top             =   3480
         Width           =   3015
      End
      Begin VB.CommandButton cmdBrowsSrc 
         Caption         =   "Browse"
         Height          =   375
         Left            =   5160
         TabIndex        =   11
         Top             =   2760
         Width           =   975
      End
      Begin VB.Frame Frame1 
         Caption         =   "Sign Method"
         Height          =   615
         Left            =   360
         TabIndex        =   8
         Top             =   1800
         Width           =   2535
         Begin VB.OptionButton optMD5 
            Caption         =   "MD5"
            Height          =   255
            Left            =   1440
            TabIndex        =   10
            Top             =   240
            Width           =   855
         End
         Begin VB.OptionButton optSha1 
            Caption         =   "SHA1"
            Height          =   255
            Left            =   360
            TabIndex        =   9
            Top             =   240
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   5880
         Top             =   3480
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Label Label1 
         Caption         =   "User/Market ID"
         Height          =   255
         Left            =   240
         TabIndex        =   25
         Top             =   540
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "Key Type"
         Height          =   255
         Left            =   3600
         TabIndex        =   24
         Top             =   540
         Width           =   735
      End
      Begin VB.Label lblType 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Not Know"
         Height          =   375
         Left            =   4680
         TabIndex        =   23
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label Label3 
         Caption         =   "Key Date"
         Height          =   255
         Left            =   3600
         TabIndex        =   22
         Top             =   1260
         Width           =   855
      End
      Begin VB.Label lblKeyDate 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Not Know"
         Height          =   375
         Left            =   4680
         TabIndex        =   21
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label Label4 
         Caption         =   "Source File"
         Height          =   255
         Left            =   240
         TabIndex        =   20
         Top             =   2880
         Width           =   1095
      End
      Begin VB.Label Label6 
         Caption         =   "Destination File"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   3480
         Width           =   1215
      End
      Begin VB.Label Label5 
         Caption         =   "KeyID"
         Height          =   255
         Left            =   3600
         TabIndex        =   18
         Top             =   1980
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.Label lblKeyID 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Not Know"
         Height          =   375
         Left            =   4680
         TabIndex        =   17
         Top             =   1920
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.Label Label8 
         Caption         =   "Date Create"
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   1260
         Width           =   855
      End
      Begin VB.Label lblDateCreate 
         Alignment       =   2  'Center
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Not Know"
         Height          =   375
         Left            =   1440
         TabIndex        =   15
         Top             =   1200
         Width           =   1455
      End
   End
   Begin VB.Frame Frame2 
      Height          =   1935
      Left            =   0
      TabIndex        =   0
      Top             =   4560
      Width           =   6615
      Begin VB.CommandButton cmdDecrypt 
         Caption         =   "Decrypt File"
         Height          =   495
         Left            =   5040
         TabIndex        =   26
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdSign 
         Caption         =   "Signature"
         Height          =   495
         Left            =   120
         TabIndex        =   6
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         Height          =   495
         Left            =   4440
         TabIndex        =   5
         Top             =   1200
         Width           =   1575
      End
      Begin VB.CommandButton cmdValid 
         Caption         =   "Validate"
         Height          =   495
         Left            =   1680
         TabIndex        =   4
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdGenKey 
         Caption         =   "Generate Key"
         Height          =   495
         Left            =   720
         TabIndex        =   3
         Top             =   1200
         Width           =   1455
      End
      Begin VB.CommandButton cmdEncrypt 
         Caption         =   "Encrypt File"
         Height          =   495
         Left            =   3480
         TabIndex        =   2
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdKeyRing 
         Caption         =   "Manage Key Ring"
         Height          =   495
         Left            =   2520
         TabIndex        =   1
         Top             =   1200
         Width           =   1575
      End
   End
End
Attribute VB_Name = "frmSign"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdBrowsSrc_Click()
        CommonDialog1.Flags = cdlOFNFileMustExist
        CommonDialog1.Filter = "*.*"
        CommonDialog1.FileName = ""
        CommonDialog1.ShowOpen
        txtSource = CommonDialog1.FileName
        'txtDest.Text = Left$(txtSource.Text, Len(txtSource.Text) - 4) & "Tmp" & Right$(txtSource.Text, 4)
        txtDest.Text = txtSource.Text
End Sub

Private Sub cmdCancel_Click()
        Unload Me
End Sub

Private Sub cmdDecrypt_Click()
        disableButton False
        If txtSource.Text = "" Then
                MsgBox "Please Select Source File to Sign", vbExclamation + vbOKOnly
        Else
                Dim fso As FileSystemObject
                Dim txt As TextStream
                Dim txt2 As TextStream
                Set fso = New FileSystemObject
                
                If txtDest.Text = "" Or txtDest.Text = txtSource.Text Then
                          txtDest.Text = Left$(txtSource.Text, Len(txtSource.Text) - 4) & "DEC" & Right$(txtSource.Text, 4)
                End If
                
                If fso.FileExists(txtSource.Text) Then
                                On Error GoTo msgerr
                                Set txt = fso.OpenTextFile(txtSource.Text, ForReading)
                                Set txt2 = fso.CreateTextFile(txtDest.Text, True)
'                                CommonDialog1.Flags = cdlOFNFileMustExist
'                                CommonDialog1.FileName = ""
'                                CommonDialog1.Filter = "(.pvk;.pbk)|*.pvk;*.pbk"
'                                CommonDialog1.ShowOpen
'                                If CommonDialog1.FileName <> "" Then
'                                                ImportKey CommonDialog1.FileName
                               If PrivateKeyFile = "" Then
                                        MsgBox "Please Setting Private Key File in Manage Key Ring Before Encrypt"
                                Else
                                                ImportKey PrivateKeyFile
                                                Userid = txtUserID.Text
                                                KeyID = ""
                                                txt2.Write dec(txt.ReadAll, UseKey, N)
                                                If flag Then
                                                        MsgBox "Decrypt File Complete", vbInformation + vbOKOnly
                                                Else
                                                        delFile txtDest.Text
                                                End If
                                End If
                                txt.Close
                                txt2.Close
                End If
                Set fso = Nothing
        End If
        disableButton True
Exit Sub
msgerr:
        MsgBox Error$, vbExclamation + vbOKOnly, "Error !!!"
          disableButton True
End Sub

Private Sub cmdEncrypt_Click()
        disableButton False
        If txtSource.Text = "" Then
                MsgBox "Please Select Source File to Sign", vbExclamation + vbOKOnly
        Else
                Dim fso As FileSystemObject
                Dim txt As TextStream
                Dim txt2 As TextStream
                Set fso = New FileSystemObject
                
                If txtDest.Text = "" Or txtDest.Text = txtSource.Text Then
                          txtDest.Text = Left$(txtSource.Text, Len(txtSource.Text) - 4) & "ENC" & Right$(txtSource.Text, 4)
                End If
                
                If fso.FileExists(txtSource.Text) Then
                                On Error GoTo msgerr
                                Set txt = fso.OpenTextFile(txtSource.Text, ForReading)
                                Set txt2 = fso.CreateTextFile(txtDest.Text, True)
'                                CommonDialog1.Flags = cdlOFNFileMustExist
'                                CommonDialog1.FileName = ""
'                                CommonDialog1.Filter = "(.pvk;.pbk)|*.pvk;*.pbk"
'                                CommonDialog1.ShowOpen
'                                If CommonDialog1.FileName <> "" Then
                                                'ImportKey CommonDialog1.FileName
                                                Userid = txtUserID.Text
                                                KeyID = ""
                                                SearchPublicKey Userid
                                                txt2.Write enc(txt.ReadAll, UseKey, N)
                                                MsgBox "Encrypt File Complete", vbInformation + vbOKOnly
'                                End If
                                txt.Close
                                txt2.Close
                End If
                Set fso = Nothing
        End If
        disableButton True
Exit Sub
msgerr:
        MsgBox Error$, vbExclamation + vbOKOnly, "Error !!!"
          disableButton True
End Sub

Private Sub cmdGenKey_Click()
        CommonDialog1.Flags = cdlOFNFileMustExist
        CommonDialog1.FileName = ""
        CommonDialog1.Filter = ""
        CommonDialog1.ShowSave
        If CommonDialog1.FileName <> "" Then
                GenKey (CommonDialog1.FileName)
        End If
End Sub

Private Sub cmdKeyRing_Click()
        frmKeyRing.Show
End Sub

Private Sub cmdSign_Click()
        disableButton False
        If txtUserID.Text = "" Then
                MsgBox "UserID Cannot be Empty", vbExclamation + vbOKOnly
        ElseIf txtSource.Text = "" Then
                MsgBox "Please Select Source File to Sign", vbExclamation + vbOKOnly
        Else
                Dim fso As FileSystemObject
                Dim txt As TextStream
                Set fso = New FileSystemObject
                
                If txtDest.Text = "" Or txtDest.Text = txtSource.Text Then
                          txtDest.Text = Left$(txtSource.Text, Len(txtSource.Text) - 4) & "SIGN" & Right$(txtSource.Text, 4)
                End If
                
                If fso.FileExists(txtSource.Text) Then
                                Set txt = fso.OpenTextFile(txtSource.Text, ForReading)
'                                CommonDialog1.Flags = cdlOFNFileMustExist
'                                CommonDialog1.FileName = ""
'                                CommonDialog1.Filter = "(.pvk;.pbk)|*.pvk;*.pbk"
'                                CommonDialog1.ShowOpen
'                                If CommonDialog1.FileName <> "" Then
'                                               ImportKey CommonDialog1.FileName
                                If PrivateKeyFile = "" Then
                                                MsgBox "Please Select Private Key File in Manage Key Ring Beffore sign"
                                Else
                                                ImportKey PrivateKeyFile
                                                Userid = txtUserID.Text
                                                KeyID = ""
                                                lblDateCreate.Caption = Format$(Now, "Short Date")
                                                If optSha1.value Then
                                                        Sha1SignFile "", Userid, lblDateCreate.Caption, txtSource.Text, txtDest.Text, UseKey, N
                                                ElseIf optMD5.value Then
                                                        MD5SignFile "", Userid, lblDateCreate.Caption, txtSource.Text, txtDest.Text, UseKey, N
                                                End If
                                                MsgBox "Sign File Already"
                                                lblKeyDate.Caption = keyDate
                                                lblType.Caption = KeyType
                                                lblKeyID.Caption = KeyID
                                                
                                End If
                                txt.Close
                  End If
                Set fso = Nothing
        End If
        disableButton True
End Sub

Private Sub disableButton(ByVal flag As Boolean)
        cmdSign.Enabled = flag
        cmdGenKey.Enabled = flag
        cmdValid.Enabled = flag
        cmdEncrypt.Enabled = flag
        cmdDecrypt.Enabled = flag
        cmdKeyRing.Enabled = flag
End Sub


Private Sub cmdValid_Click()
        disableButton False
        'If txtUserID.Text = "" Then
        '        MsgBox "UserID Cannot be Empty", vbExclamation + vbOKOnly
        If txtSource.Text = "" Then
                MsgBox "Please Select Source File to Sign", vbExclamation + vbOKOnly
        Else
                Dim fso As FileSystemObject
                Set fso = New FileSystemObject
                If txtDest.Text = "" Or txtDest.Text = txtSource.Text Then
                           txtDest.Text = Left$(txtSource.Text, Len(txtSource.Text) - 4) & "Valid" & Right$(txtSource.Text, 4)
                End If
                If fso.FileExists(txtSource.Text) Then
'                                CommonDialog1.Flags = cdlOFNFileMustExist
'                                CommonDialog1.FileName = ""
'                                CommonDialog1.Filter = "(.pvk;.pbk)|*.pvk;*.pbk"
'                                CommonDialog1.ShowOpen
'                                If CommonDialog1.FileName <> "" Then
'                                        ImportKey CommonDialog1.FileName
                                                                        
                                        'UserID = txtUserID.Text
                                        'SearchPublicKey txtUserID.Text
                                        ValidateFile txtSource.Text, txtDest.Text
'                                End If
                Else
                        MsgBox "Source File does not Exist"
                End If
                Set fso = Nothing
        End If
        disableButton True
End Sub

Private Sub Form_Load()
'        ConString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\KeyRing.mdb;Persist Security Info=False"
'        PrivateKeyFile = ""
End Sub


