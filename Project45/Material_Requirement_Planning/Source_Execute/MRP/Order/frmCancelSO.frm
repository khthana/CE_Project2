VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmCancelSO 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Cancel Customer Order"
   ClientHeight    =   1695
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4335
   Icon            =   "frmCancelSO.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1695
   ScaleWidth      =   4335
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "รหัส Sale Order"
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4095
      Begin VB.CommandButton cmdOK 
         Caption         =   "ยกเลิกใบขาย"
         Height          =   375
         Left            =   2040
         MouseIcon       =   "frmCancelSO.frx":27A2
         MousePointer    =   99  'Custom
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   720
         Width           =   1695
      End
      Begin MSMask.MaskEdBox mskPO 
         Height          =   315
         Left            =   360
         TabIndex        =   2
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
         BackColor       =   &H00C0C0C0&
         Caption         =   "รหัสที่ต้องการยกเลิก :"
         Height          =   315
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   2295
      End
   End
End
Attribute VB_Name = "frmCancelSO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()

If mskPO.Text = "__________" Then Exit Sub
Dim tmp_PO As String
tmp_PO = "SO-" & mskPO.Text
    
If MsgBox("คุณต้องการยกเลิกใบสั่งซื้อหมายเลข SO-" & mskPO.Text & " ใช่หรือไม่?", vbYesNo + vbQuestion, "Cancel SO") = vbYes Then
    MsgBox "ยกเลิกใบขายสินค้าเรียบร้อยแล้ว ", vbOKOnly + vbInformation, "Cancel SO"

With DataEnInventories.rsSelectCusOrderID
        If .State = adStateOpen Then .Close
        DataEnInventories.SelectCusOrderID tmp_PO
End With
    
With DataEnInventories.rsSelectCusOrderID
    If .RecordCount = 0 Then Exit Sub
    
            'With DataEnInventories.rsPurchase_IsReceived
            'If .State = adStateOpen Then .Close
            '.Open
            'DataEnInventories.Purchase_IsReceived tmp_PO
            'End With
            
            'With DataEnInventories.rsPurchase_IsReceived
             '   If .Fields("IsReceived").Value = 0 Then
    
              '      DataEnInventories.UpdateCancelPO tmp_PO
                    DataEnInventories.UpdateCancelSO tmp_PO
                    
                        mskPO.Text = "__________"
                        mskPO.SetFocus
                    'Else
                    'End If
            End With
   
   'End If
'End With
End If
End Sub

Private Sub mskPO_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then Call cmdOK_Click
End Sub

