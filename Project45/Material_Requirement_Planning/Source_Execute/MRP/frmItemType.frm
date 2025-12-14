VERSION 5.00
Begin VB.Form frmItemType 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Item Type Management"
   ClientHeight    =   3615
   ClientLeft      =   6810
   ClientTop       =   6900
   ClientWidth     =   7815
   Icon            =   "frmItemType.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   7815
   Begin VB.CommandButton cmdEndBrand 
      Height          =   492
      Left            =   1560
      Picture         =   "frmItemType.frx":27A2
      Style           =   1  'Graphical
      TabIndex        =   13
      ToolTipText     =   "End"
      Top             =   2160
      Width           =   492
   End
   Begin VB.CommandButton cmdNextBrand 
      Height          =   492
      Left            =   1080
      Picture         =   "frmItemType.frx":2B77
      Style           =   1  'Graphical
      TabIndex        =   14
      ToolTipText     =   "Next"
      Top             =   2160
      Width           =   492
   End
   Begin VB.CommandButton cmdPreviousBrand 
      Height          =   492
      Left            =   600
      Picture         =   "frmItemType.frx":2F35
      Style           =   1  'Graphical
      TabIndex        =   15
      ToolTipText     =   "Previous"
      Top             =   2160
      Width           =   492
   End
   Begin VB.CommandButton cmdFirstBrand 
      Height          =   492
      Left            =   120
      Picture         =   "frmItemType.frx":32D2
      Style           =   1  'Graphical
      TabIndex        =   16
      ToolTipText     =   "First"
      Top             =   2160
      Width           =   492
   End
   Begin VB.CommandButton cmdEditBrand 
      Caption         =   "แก้ไข"
      Height          =   855
      Left            =   5880
      MouseIcon       =   "frmItemType.frx":36AB
      MousePointer    =   99  'Custom
      Picture         =   "frmItemType.frx":39B5
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   2640
      Width           =   1812
   End
   Begin VB.CommandButton cmdDeleteBrand 
      Caption         =   "ลบ"
      Height          =   855
      Left            =   5880
      MouseIcon       =   "frmItemType.frx":3CBF
      MousePointer    =   99  'Custom
      Picture         =   "frmItemType.frx":3FC9
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   1800
      Width           =   1815
   End
   Begin VB.CommandButton cmdAddBrand 
      Caption         =   "เพิ่ม"
      Height          =   855
      Left            =   5880
      MouseIcon       =   "frmItemType.frx":440B
      MousePointer    =   99  'Custom
      Picture         =   "frmItemType.frx":4715
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   960
      Width           =   1815
   End
   Begin VB.CommandButton cmdCancelBrand 
      Caption         =   "ยกเลิก"
      Height          =   855
      Left            =   3960
      MouseIcon       =   "frmItemType.frx":554F
      MousePointer    =   99  'Custom
      Picture         =   "frmItemType.frx":5859
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   2640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdOKBrand 
      Caption         =   "บันทึก"
      Height          =   855
      Left            =   2160
      MouseIcon       =   "frmItemType.frx":5B63
      MousePointer    =   99  'Custom
      Picture         =   "frmItemType.frx":5E6D
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   2640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search ItemTypeID"
      Height          =   375
      Left            =   6000
      MaskColor       =   &H8000000F&
      TabIndex        =   6
      Top             =   240
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   3360
      MaxLength       =   3
      TabIndex        =   5
      Top             =   240
      Width           =   2412
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ItemType"
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Width           =   5595
      Begin VB.TextBox txtItemTypeName 
         Appearance      =   0  'Flat
         DataField       =   "ItemTypeName"
         DataMember      =   "ItemType"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1905
         TabIndex        =   4
         Top             =   720
         Width           =   3375
      End
      Begin VB.TextBox txtItemTypeID 
         Appearance      =   0  'Flat
         DataField       =   "ItemTypeID"
         DataMember      =   "ItemType"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1905
         TabIndex        =   2
         Top             =   345
         Width           =   3375
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ItemTypeName:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   60
         TabIndex        =   3
         Top             =   765
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000013&
         Caption         =   "ItemTypeID:"
         ForeColor       =   &H80000001&
         Height          =   255
         Index           =   0
         Left            =   60
         TabIndex        =   1
         Top             =   390
         Width           =   1815
      End
   End
   Begin VB.Label Label2Brand 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   2160
      TabIndex        =   17
      Top             =   2160
      Width           =   1815
   End
   Begin VB.Label Label5 
      BackColor       =   &H80000013&
      Height          =   615
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   7575
   End
End
Attribute VB_Name = "frmItemType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAddBrand_Click()
Call UnLockCtrl

cmdAddBrand.Enabled = False
cmdEditBrand.Enabled = False
cmdDeleteBrand.Enabled = False

cmdFirstBrand.Enabled = False
cmdPreviousBrand.Enabled = False
cmdNextBrand.Enabled = False
cmdEndBrand.Enabled = False

cmdOKBrand.Visible = True
cmdCancelBrand.Visible = True

DataEnInventories.rsItemType.AddNew

txtItemTypeName.SetFocus
txtItemTypeID.BackColor = &H80000013

Dim tmpB As String

With DataEnInventories.rsItemType

If .RecordCount = 0 Then
            .AddNew
            .Fields("ItemTypeID").Value = "01"
            .Update
            tmpB = "01"
Else
            tmpB = Format(.RecordCount, "00")
        End If
        txtItemTypeID.Text = tmpB
        
        Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
        
End With

End Sub


Private Sub cmdCancelBrand_Click()
With DataEnInventories.rsItemType
    .CancelUpdate
    .MoveFirst
    Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With

    cmdAddBrand.Enabled = True
    cmdEditBrand.Enabled = True
    cmdDeleteBrand.Enabled = True
    
    cmdOKBrand.Visible = False
    cmdCancelBrand.Visible = False

    cmdFirstBrand.Enabled = True
    cmdPreviousBrand.Enabled = True
    cmdNextBrand.Enabled = True
    cmdEndBrand.Enabled = True
    
    Call LockCtrl

End Sub

Private Sub cmdDeleteBrand_Click()

If MsgBox("คุณต้องการลบเร็คคอร์ดนี้หรื่อไม่", vbYesNo, "ItemType") = vbYes Then
    With DataEnInventories.rsItemType
        .Delete
        .MoveNext
            If .EOF Then
                .MoveLast
            End If
        
    End With
End If

End Sub

Private Sub cmdEditBrand_Click()
Call UnLockCtrl
    txtItemTypeID.SetFocus
    
    cmdAddBrand.Enabled = False
    cmdEditBrand.Enabled = False
    cmdDeleteBrand.Enabled = False
        
    cmdOKBrand.Visible = True
    cmdCancelBrand.Visible = True
    
    'txtItemTypeID.BackColor = &H80000013
    'txtItemTypeName.BackColor = &H80000013
    
End Sub

Private Sub cmdEndBrand_Click()
With DataEnInventories.rsItemType
.MoveLast
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount

End With
End Sub

Private Sub cmdFirstBrand_Click()
With DataEnInventories.rsItemType
.MoveFirst
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdNextBrand_Click()
With DataEnInventories.rsItemType
.MoveNext
        If .EOF Then
            .MoveFirst
        End If
        
        Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdOKBrand_Click()

Dim tmp_Brand As String

    If (txtItemTypeID.Text = "") Then
        MsgBox "กรุณาใส่รหัสชนิดสินค้าด้วย !", vbOKOnly + vbCritical, "ItemType"
        txtItemTypeID.SetFocus
        cmdAddBrand.Enabled = False
        cmdEditBrand.Enabled = False
        Exit Sub
    End If
    
    If (txtItemTypeName.Text = "") Then
        MsgBox "กรุณาใส่ชื่อชนิดสินค้าด้วย !", vbOKOnly + vbCritical, "ItemType"
        txtItemTypeName.SetFocus
        cmdAddBrand.Enabled = False
        cmdEditBrand.Enabled = False
        Exit Sub
    End If

With DataEnInventories.rsItemType
.Update

End With

    Call LockCtrl
    
    cmdAddBrand.Enabled = True
    cmdEditBrand.Enabled = True
    cmdDeleteBrand.Enabled = True
    
    cmdOKBrand.Visible = False
    cmdCancelBrand.Visible = False

    cmdFirstBrand.Enabled = True
    cmdPreviousBrand.Enabled = True
    cmdNextBrand.Enabled = True
    cmdEndBrand.Enabled = True

End Sub

Private Sub cmdPreviousBrand_Click()
With DataEnInventories.rsItemType
.MovePrevious
    If .BOF Then
        .MoveLast
    End If
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdSearch_Click()
Dim userCriteria As String

userCriteria = "ItemTypeID like '" & Text1.Text & "'"

If Text1.Text = "" Then
    MsgBox "กรุณาใส่ ItemTypeID", vbOKOnly, "ItemType"
ElseIf IsNumeric(Text1.Text) Then
    With DataEnInventories.rsItemType
        .MoveFirst
        .Find userCriteria, , adSearchForward
        Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
           
            On Error GoTo Err1
            'If .Fields("ItemPictureFileName").Value <> "" Then
            'ItemPictureFileName = .Fields("ItemPictureFileName").Value
            'Else
            'ItemPictureFileName = ""
            'End If
            'imgProduct.Picture = LoadPicture(ItemPictureFileName)

    End With
       
End If

Err1:
    If DataEnInventories.rsItemType.EOF Then
        MsgBox "ไม่พบข้อมูล", vbOKOnly, "ItemType"
    Label2Brand.Caption = "Record: "
                'imgProduct.Picture = LoadPicture("")
    End If


End Sub

Private Sub Form_Load()
cmdOKBrand.Visible = False
cmdCancelBrand.Visible = False

With DataEnInventories.rsItemType
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With

Call LockCtrl


End Sub

Private Sub LockCtrl()
txtItemTypeID.Locked = True
txtItemTypeName.Locked = True

txtItemTypeID.BackColor = &H80000013
txtItemTypeName.BackColor = &H8000000F

cmdSearch.Enabled = True
Text1.Enabled = True

End Sub

Private Sub UnLockCtrl()
txtItemTypeID.Locked = False
txtItemTypeName.Locked = False

txtItemTypeID.BackColor = &H80000013
txtItemTypeName.BackColor = &H80000009

cmdSearch.Enabled = False
Text1.Enabled = False

End Sub

Private Sub text1_keypress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call cmdSearch_Click
    End If
End Sub


