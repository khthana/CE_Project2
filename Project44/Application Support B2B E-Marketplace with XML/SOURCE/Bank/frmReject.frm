VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmReject 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Reject"
   ClientHeight    =   5790
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7695
   Icon            =   "frmReject.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5790
   ScaleWidth      =   7695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   7080
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Height          =   5775
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7695
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         Height          =   495
         Left            =   4200
         TabIndex        =   9
         Top             =   4920
         Width           =   1575
      End
      Begin VB.CommandButton cmdOK 
         Caption         =   "OK"
         Height          =   495
         Left            =   1800
         TabIndex        =   8
         Top             =   4920
         Width           =   1575
      End
      Begin VB.TextBox txtReason 
         Height          =   2295
         Left            =   1680
         MultiLine       =   -1  'True
         TabIndex        =   7
         Top             =   2160
         Width           =   5535
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "Browse"
         Height          =   375
         Left            =   6000
         TabIndex        =   5
         Top             =   1260
         Width           =   1215
      End
      Begin VB.TextBox txtDest 
         Height          =   375
         Left            =   1800
         TabIndex        =   4
         Top             =   1260
         Width           =   3855
      End
      Begin VB.TextBox txtPRid 
         Height          =   375
         Left            =   1800
         TabIndex        =   2
         Top             =   420
         Width           =   2655
      End
      Begin VB.Label Label3 
         Caption         =   "Reject 's Reason"
         Height          =   495
         Left            =   360
         TabIndex        =   6
         Top             =   2160
         Width           =   735
      End
      Begin VB.Label Label2 
         Caption         =   "XML Destination"
         Height          =   255
         Left            =   360
         TabIndex        =   3
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "P.R. Identifier"
         Height          =   255
         Left            =   360
         TabIndex        =   1
         Top             =   480
         Width           =   1335
      End
   End
End
Attribute VB_Name = "frmReject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public mode As String


Private Sub cmdBrowse_Click()
    CommonDialog1.Flags = cdlOFNPathMustExist
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "XML Files(*.xml)|*.xml|All Files(*.*)|*.*"
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
        txtDest.Text = CommonDialog1.FileName
    End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    If txtPRid.Text = "" Then
        MsgBox "Please Enter P.R. Identify before click OK"
    ElseIf txtReason.Text = "" Then
        MsgBox "Please Enter Reason for Reject PR before click OK"
    Else
        If txtDest.Text = "" Then
                txtDest.Text = App.Path & PRdir & "\Reject\PR" & txtPRid.Text & "_Reject.xml"
        End If
                If mode = "PR" Then
                        If mdlXML.genRejectPR(txtPRid.Text, txtReason.Text, txtDest.Text) Then
                                MsgBox "Generate Reject PR Complete"
                                
                                FileName = txtDest.Text
                                mdiMain.WSSend 1
                                Unload Me
                        Else
                                MsgBox "Generate Reject PR Error !!!"
                        End If
                ElseIf mode = "PO" Then
                        If mdlXML.GenRejectPO(txtPRid.Text, txtReason.Text, txtDest.Text) Then
                                MsgBox "Generate Reject PO Complete"
                                
                                FileName = txtDest.Text
                                mdiMain.WSSend 1
                                Unload Me
                        Else
                                MsgBox "Generate Reject PO Error !!!"
                        End If
                ElseIf mode = "IV" Then
                        If mdlXML.GenRejectInvoice(txtPRid.Text, txtReason.Text, txtDest.Text) Then
                                MsgBox "Generate Reject Invoice Complete"
                                
                                FileName = txtDest.Text
                                mdiMain.WSSend 1
                                Unload Me
                        Else
                                MsgBox "Generate Reject Invoice Error !!!"
                        End If

                Else
                        MsgBox "Tag Error"
                End If
                
    End If
End Sub

Private Sub Form_Load()
        If mode = "PR" Then
                frmReject.Caption = "Reject P.R."
                frmReject.Label1.Caption = "P.R. Identifier"
        ElseIf mode = "PO" Then
                frmReject.Caption = "Reject P.O."
                frmReject.Label1.Caption = "P.O. Identifier"
        ElseIf mode = "IV" Then
                frmReject.Caption = "Reject Invoice."
                frmReject.Label1.Caption = "Invoice Identifier"
        Else
               frmReject.Caption = "Reject"
               frmReject.Label1.Caption = "Identifier"
       End If
End Sub

Private Sub txtPRid_Change()
        If mode = "PR" Then
                txtDest.Text = App.Path & PRdir & "\Reject\PR" & txtPRid.Text & "_Reject.xml"
        ElseIf mode = "PO" Then
                txtDest.Text = App.Path & POdir & "\Reject\PO" & txtPRid.Text & "_Reject.xml"
        ElseIf mode = "IV" Then
                txtDest.Text = App.Path & IVdir & "\Reject\IVID" & txtPRid.Text & "_Reject.xml"
        End If
End Sub


