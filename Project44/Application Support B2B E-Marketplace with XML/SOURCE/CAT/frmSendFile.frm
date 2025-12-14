VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmSendFile 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Send File Dialog"
   ClientHeight    =   4650
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7035
   Icon            =   "frmSendFile.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4650
   ScaleWidth      =   7035
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   240
      Top             =   3960
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   495
      Left            =   5400
      TabIndex        =   14
      Top             =   3960
      Width           =   1455
   End
   Begin VB.CommandButton cmdSendfile 
      Caption         =   "Send File"
      Height          =   495
      Left            =   3600
      TabIndex        =   1
      Top             =   3960
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Height          =   3735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6975
      Begin VB.OptionButton optOther 
         Caption         =   "Other"
         Height          =   255
         Left            =   3840
         TabIndex        =   13
         Top             =   3000
         Width           =   855
      End
      Begin VB.OptionButton optPR 
         Caption         =   "Purchase Request (PR)"
         Height          =   255
         Left            =   600
         TabIndex        =   12
         Top             =   2400
         Value           =   -1  'True
         Width           =   2055
      End
      Begin VB.OptionButton optInvoice 
         Caption         =   "Invoice"
         Height          =   255
         Left            =   600
         TabIndex        =   11
         Top             =   3000
         Width           =   975
      End
      Begin VB.OptionButton optPO 
         Caption         =   "Purchase Order (PO)"
         Height          =   255
         Left            =   3840
         TabIndex        =   10
         Top             =   2400
         Width           =   2295
      End
      Begin VB.Frame Frame3 
         Height          =   135
         Left            =   120
         TabIndex        =   9
         Top             =   1920
         Width           =   2655
      End
      Begin VB.Frame Frame2 
         Height          =   135
         Left            =   3840
         TabIndex        =   7
         Top             =   1920
         Width           =   3015
      End
      Begin VB.TextBox txtDest 
         Height          =   375
         Left            =   2040
         TabIndex        =   6
         Text            =   "Unknow"
         Top             =   1200
         Width           =   3375
      End
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   6120
         Top             =   1080
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "Browse"
         Height          =   375
         Left            =   5760
         TabIndex        =   4
         Top             =   480
         Width           =   975
      End
      Begin VB.TextBox txtSource 
         Height          =   375
         Left            =   2040
         TabIndex        =   2
         Text            =   "Unknow"
         Top             =   480
         Width           =   3375
      End
      Begin VB.Label Label3 
         Caption         =   "File Type"
         Height          =   255
         Left            =   3000
         TabIndex        =   8
         Top             =   1920
         Width           =   735
      End
      Begin VB.Label Label2 
         Caption         =   "Destination File Name"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "Source File Name"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   1335
      End
   End
End
Attribute VB_Name = "frmSendFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim fileTp As String

Private Sub cmdBrowse_Click()
        CommonDialog1.FileName = ""
        CommonDialog1.Flags = cdlOFNFileMustExist
        CommonDialog1.ShowOpen
        If CommonDialog1.FileName <> "" Then
                txtSource.Text = CommonDialog1.FileName
                txtDest.Text = CommonDialog1.FileTitle
        End If
End Sub

Private Sub cmdClose_Click()
        Unload Me
End Sub

Private Sub cmdSendfile_Click()
        If txtSource.Text = "Unknow" Then
                MsgBox "Please Enter Source File Name before  Send File"
        ElseIf txtDest.Text = "Unknow" Then
                MsgBox "Please Enter Destination File Name before  Send File"
        Else
                
                If optPR.value Then
                        fileTp = ftPR
                ElseIf optPO.value Then
                        fileTp = ftPO
                ElseIf optInvoice.value Then
                        fileTp = ftInvoice
                ElseIf optOther.value Then
                        fileTp = ftOther
                Else
                        fileTp = ""
                End If
                
                If fileTp = "" Then
                        MsgBox "File Type Error"
                Else
                        If Winsock1.State <> sckClosed Then Winsock1.Close
                        Winsock1.Connect RemoteIP, RemotePort
                End If
        End If
End Sub


Private Sub Winsock1_Connect()
                 SendFile txtSource.Text, txtDest.Text, fileTp
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
        MsgBox Description, vbCritical + vbOKOnly, "Winsock Error"
        Winsock1.Close
End Sub

Private Sub Winsock1_SendComplete()
        MsgBox "Send File Complete", vbInformation + vbOKOnly, "Send File"
        Winsock1.Close
End Sub

Private Sub SendFile(ByVal SourceFile As String, ByVal destFile As String, ByVal ft As String)
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim x As String
        
        
        Set fso = New FileSystemObject
        If fso.FileExists(SourceFile) Then
                Winsock1.SendData DestBegin & destFile & vbCrLf
                Winsock1.SendData fileType & ft & vbCrLf
                 
                Dim arrByteArray() As Byte
                Dim IntNextFreeFile As Integer
                'Open the source file and read the content
                'into a arrByteArray to pass onto encryption
                IntNextFreeFile = FreeFile
                Open SourceFile For Binary As #IntNextFreeFile
                ReDim arrByteArray(0 To LOF(IntNextFreeFile) - 1)
                Get #IntNextFreeFile, , arrByteArray()
                Close #IntNextFreeFile
                 
                Winsock1.SendData arrByteArray()
                 

                Winsock1.SendData EofFile
                Set txt = Nothing
        Else
                MsgBox "File " & SourceFile & " Not Found", vbExclamation + vbOKOnly, "Open File"
        End If
        Set fso = Nothing
End Sub




