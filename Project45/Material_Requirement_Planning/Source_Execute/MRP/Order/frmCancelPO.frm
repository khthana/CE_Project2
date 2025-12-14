VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmCancelPO 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Cancel Purchase Order"
   ClientHeight    =   1710
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4350
   Icon            =   "frmCancelPO.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1710
   ScaleWidth      =   4350
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "รหัส Purchase Order"
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4095
      Begin VB.CommandButton cmdOK 
         Caption         =   "ยกเลิกใบสั่งซื้อ"
         Height          =   375
         Left            =   2040
         MouseIcon       =   "frmCancelPO.frx":0442
         MousePointer    =   99  'Custom
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   720
         Width           =   1695
      End
      Begin MSMask.MaskEdBox mskPO 
         Height          =   315
         Left            =   360
         TabIndex        =   0
         Top             =   720
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         MaxLength       =   10
         Mask            =   "##########"
         PromptChar      =   "_"
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "รหัสที่ต้องการยกเลิก :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   240
         TabIndex        =   2
         Top             =   480
         Width           =   2295
      End
   End
End
Attribute VB_Name = "frmCancelPO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()

If mskPO.Text = "__________" Then Exit Sub
Dim tmp_PO As String
tmp_PO = "PO-" & mskPO.Text
    
If MsgBox("คุณต้องการยกเลิกใบสั่งซื้อหมายเลข PO-" & mskPO.Text & " ใช่หรือไม่?", vbYesNo + vbQuestion, "Cancel PO") = vbYes Then
    MsgBox "ยกเลิกใบสั่งซื้อเรียบร้อยแล้ว ", vbOKOnly + vbInformation, "Cancel PO"

With DataEnInventories.rsparameterOrderID
        If .State = adStateOpen Then .Close
        DataEnInventories.parameterOrderID tmp_PO
End With
    
With DataEnInventories.rsparameterOrderID
    If .RecordCount = 0 Then Exit Sub
    
            With DataEnInventories.rsPurchase_IsReceived
            If .State = adStateOpen Then .Close
            '.Open
            DataEnInventories.Purchase_IsReceived tmp_PO
            End With
            
            With DataEnInventories.rsPurchase_IsReceived
                If .Fields("IsReceived").Value = 0 Then
    
                    DataEnInventories.UpdateCancelPO tmp_PO
    
                        mskPO.Text = "__________"
                        mskPO.SetFocus
                    Else
                    'End If
                End If
            End With
   
End With
   End If
End Sub

Private Sub mskPO_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then Call cmdOK_Click
End Sub
