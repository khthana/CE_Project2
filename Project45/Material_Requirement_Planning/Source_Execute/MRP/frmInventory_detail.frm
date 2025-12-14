VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmInventoryManagement 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Inventory Management"
   ClientHeight    =   6810
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   11925
   Icon            =   "frmInventory_detail.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6810
   ScaleWidth      =   11925
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdEnd 
      Height          =   492
      Left            =   1560
      Picture         =   "frmInventory_detail.frx":27A2
      Style           =   1  'Graphical
      TabIndex        =   37
      ToolTipText     =   "End"
      Top             =   6000
      Width           =   492
   End
   Begin VB.CommandButton cmdNext 
      Height          =   492
      Left            =   1080
      Picture         =   "frmInventory_detail.frx":2B77
      Style           =   1  'Graphical
      TabIndex        =   36
      ToolTipText     =   "Next"
      Top             =   6000
      Width           =   492
   End
   Begin VB.Frame Frame4 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Inventory"
      ForeColor       =   &H80000008&
      Height          =   2130
      Left            =   120
      TabIndex        =   6
      Top             =   3720
      Width           =   5175
      Begin VB.CheckBox chkItemStatus 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ยกเลิกใช้"
         DataField       =   "ItemStatus"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   3840
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   45
         Top             =   1680
         Width           =   1290
      End
      Begin VB.TextBox txtLotSize 
         Appearance      =   0  'Flat
         DataField       =   "LotSize"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1920
         TabIndex        =   33
         Top             =   1680
         Width           =   1140
      End
      Begin VB.TextBox txtOnHand 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "OnHand"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1920
         TabIndex        =   29
         Top             =   240
         Width           =   1140
      End
      Begin VB.TextBox txtSafetyStock 
         Appearance      =   0  'Flat
         DataField       =   "SafetyStock"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1920
         TabIndex        =   32
         Top             =   1320
         Width           =   1140
      End
      Begin VB.TextBox txtAllocatedQuantities 
         Appearance      =   0  'Flat
         DataField       =   "AllocatedQuantities"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1920
         TabIndex        =   31
         Top             =   960
         Width           =   1140
      End
      Begin VB.TextBox txtLeadtime 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "Leadtime"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1920
         TabIndex        =   30
         Top             =   600
         Width           =   1140
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "LotSize:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   21
         Left            =   960
         TabIndex        =   11
         Top             =   1680
         Width           =   855
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000013&
         Caption         =   "OnHand:"
         ForeColor       =   &H80000001&
         Height          =   255
         Index           =   20
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "SafetyStock:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   19
         Left            =   720
         TabIndex        =   9
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "AllocatedQuantities:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   18
         Left            =   255
         TabIndex        =   8
         Top             =   990
         Width           =   1575
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Leadtime:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   17
         Left            =   240
         TabIndex        =   7
         Top             =   615
         Width           =   1575
      End
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search ItemID"
      Height          =   375
      Left            =   5760
      MaskColor       =   &H8000000F&
      TabIndex        =   1
      Top             =   360
      Width           =   1332
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   3240
      MaxLength       =   3
      TabIndex        =   0
      Top             =   360
      Width           =   2412
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "แก้ไข"
      Height          =   855
      Left            =   5400
      MouseIcon       =   "frmInventory_detail.frx":2F35
      MousePointer    =   99  'Custom
      Picture         =   "frmInventory_detail.frx":323F
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   5520
      Width           =   1812
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "ยกเลิก"
      Height          =   855
      Left            =   9360
      MouseIcon       =   "frmInventory_detail.frx":3549
      MousePointer    =   99  'Custom
      Picture         =   "frmInventory_detail.frx":3853
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   5520
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdPrevious 
      Height          =   492
      Left            =   600
      Picture         =   "frmInventory_detail.frx":3B5D
      Style           =   1  'Graphical
      TabIndex        =   35
      ToolTipText     =   "Previous"
      Top             =   6000
      Width           =   492
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Picture of Product"
      ForeColor       =   &H80000008&
      Height          =   5172
      Left            =   7320
      TabIndex        =   3
      Top             =   240
      Width           =   4212
      Begin VB.CommandButton cmdBrowse2 
         Caption         =   ">>"
         Height          =   375
         Left            =   3720
         MouseIcon       =   "frmInventory_detail.frx":3EFA
         MousePointer    =   99  'Custom
         TabIndex        =   41
         Top             =   4680
         Width           =   375
      End
      Begin MSComDlg.CommonDialog cdlBrowse 
         Left            =   3600
         Top             =   480
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
         Filter          =   "All Pictures (*.bmp;*.ico;*.gif;*.jpg)|*.bmp;*.ico;*.gif;*.jpg"
         InitDir         =   "C:\PictureProduct"
         MaxFileSize     =   254
      End
      Begin VB.Image imgProduct 
         Appearance      =   0  'Flat
         Height          =   4812
         Left            =   120
         Top             =   240
         Width           =   3492
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Detail"
      ForeColor       =   &H80000008&
      Height          =   2832
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   7095
      Begin VB.TextBox txtDetail 
         Appearance      =   0  'Flat
         BackColor       =   &H80000000&
         DataField       =   "Detail"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   3615
         TabIndex        =   16
         Top             =   240
         Width           =   3375
      End
      Begin VB.TextBox txtSellPrice 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "SellPrice"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   3960
         TabIndex        =   28
         Top             =   2400
         Width           =   1500
      End
      Begin VB.TextBox txtCost 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "Cost"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1560
         TabIndex        =   26
         Top             =   2400
         Width           =   1380
      End
      Begin VB.TextBox txtVersion 
         Appearance      =   0  'Flat
         DataField       =   "Version"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1560
         TabIndex        =   24
         Top             =   2040
         Width           =   3855
      End
      Begin VB.TextBox txtItemName 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "ItemName"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1560
         TabIndex        =   15
         Top             =   600
         Width           =   3855
      End
      Begin VB.TextBox txtItemID 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "ItemID"
         DataMember      =   "InventoryManagement"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1560
         MaxLength       =   3
         TabIndex        =   13
         Top             =   240
         Width           =   1575
      End
      Begin VB.ComboBox cboSupplier 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1560
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   1680
         Width           =   3855
      End
      Begin VB.ComboBox cboBrand 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1560
         Style           =   2  'Dropdown List
         TabIndex        =   20
         Top             =   1320
         Width           =   3855
      End
      Begin VB.ComboBox cboItemTypeName 
         Appearance      =   0  'Flat
         Height          =   315
         ItemData        =   "frmInventory_detail.frx":4204
         Left            =   1560
         List            =   "frmInventory_detail.frx":4206
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Top             =   960
         Width           =   3855
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Detail:"
         Height          =   255
         Index           =   0
         Left            =   1800
         TabIndex        =   44
         Top             =   255
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "SellPrice:"
         Height          =   255
         Index           =   13
         Left            =   3000
         TabIndex        =   27
         Top             =   2400
         Width           =   855
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Cost (/Unit):"
         Height          =   195
         Index           =   12
         Left            =   600
         TabIndex        =   25
         Top             =   2400
         Width           =   855
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Version:"
         Height          =   255
         Index           =   16
         Left            =   360
         TabIndex        =   23
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Supplier (English) :"
         Height          =   195
         Index           =   15
         Left            =   120
         TabIndex        =   21
         Top             =   1680
         Width           =   1305
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "BrandName:"
         Height          =   255
         Index           =   11
         Left            =   240
         TabIndex        =   19
         Top             =   1320
         Width           =   1215
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ItemTypeName:"
         Height          =   255
         Index           =   10
         Left            =   240
         TabIndex        =   17
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ItemName:"
         Height          =   255
         Index           =   9
         Left            =   360
         TabIndex        =   14
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000013&
         Caption         =   "ItemID: "
         ForeColor       =   &H80000001&
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   1395
      End
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "บันทึก"
      Height          =   855
      Left            =   7560
      MouseIcon       =   "frmInventory_detail.frx":4208
      MousePointer    =   99  'Custom
      Picture         =   "frmInventory_detail.frx":4512
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   5520
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "ลบ"
      Height          =   855
      Left            =   5400
      MouseIcon       =   "frmInventory_detail.frx":481C
      MousePointer    =   99  'Custom
      Picture         =   "frmInventory_detail.frx":4B26
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   4680
      Width           =   1815
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "เพิ่ม"
      Height          =   855
      Left            =   5400
      MouseIcon       =   "frmInventory_detail.frx":4F68
      MousePointer    =   99  'Custom
      Picture         =   "frmInventory_detail.frx":5272
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   3840
      Width           =   1815
   End
   Begin VB.CommandButton cmdFirst 
      Height          =   492
      Left            =   120
      Picture         =   "frmInventory_detail.frx":60AC
      Style           =   1  'Graphical
      TabIndex        =   34
      ToolTipText     =   "First"
      Top             =   6000
      Width           =   492
   End
   Begin VB.Label Label5 
      BackColor       =   &H80000013&
      Height          =   615
      Left            =   120
      TabIndex        =   5
      Top             =   240
      Width           =   7095
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   2160
      TabIndex        =   4
      Top             =   6120
      Width           =   1815
   End
End
Attribute VB_Name = "frmInventoryManagement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim ItemPictureFileName As String

Private Sub Form_Load()
cmdOK.Visible = False
cmdCancel.Visible = False
            ItemPictureFileName = ""

    With DataEnInventories.rsItemTypeName
        If .State = adStateOpen Then .Close
        .Open
        
        Do While Not .EOF
        cboItemTypeName.AddItem .Fields("ItemTypeName").Value
        .MoveNext
        Loop
    End With
    
    With DataEnInventories.rsBrandName
        If .State = adStateOpen Then .Close
        .Open

        Do While Not .EOF
        cboBrand.AddItem .Fields("BrandName").Value
        .MoveNext
        Loop
    End With
    
    With DataEnInventories.rsSupplierName
        If .State = adStateOpen Then .Close
        .Open
        
        Do While Not .EOF
        cboSupplier.AddItem .Fields("SupplierNameEnglish").Value
        .MoveNext
        Loop
    End With
'------------------------
    With DataEnInventories.rsInventoryManagement
        'If .State = adStateOpen Then .Close
        '.Open
        
        Dim ItemType_ID As String
        Dim Brand_ID As String
        Dim Supplier_ID As String
    
    'With DataEnInventories.rsInventoryManagement
     '   If .State = adStateOpen Then .Close
      '  .Open
        
            ItemType_ID = .Fields("ItemTypeID").Value
            Brand_ID = .Fields("BrandID").Value
            Supplier_ID = .Fields("SupplierID").Value
    
    'End With
        
            Dim parameterItemType_Name As String
            Dim parameterBrand_Name As String
            Dim parameterSupplier_Name As String
        
    With DataEnInventories.rsparameterItemTypeName
        If .State = adStateOpen Then .Close
        '.Open

            DataEnInventories.parameterItemTypeName (ItemType_ID)
            parameterItemType_Name = DataEnInventories.rsparameterItemTypeName.Fields("ItemTypeName")
            cboItemTypeName.Text = parameterItemType_Name
    End With
    
    With DataEnInventories.rsparameterBrandName
        If .State = adStateOpen Then .Close
        '.Open

            DataEnInventories.parameterBrandName (Brand_ID)
            parameterBrand_Name = DataEnInventories.rsparameterBrandName.Fields("BrandName")
            cboBrand.Text = parameterBrand_Name
    End With
    
    With DataEnInventories.rsparameterSupplierName
        If .State = adStateOpen Then .Close
        '.Open

            DataEnInventories.parameterSupplierName (Supplier_ID)
            parameterSupplier_Name = DataEnInventories.rsparameterSupplierName.Fields("SupplierNameEnglish")
            cboSupplier.Text = parameterSupplier_Name
    End With
    
            Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
            
            If .Fields("ItemPictureFileName").Value <> "" Then
            ItemPictureFileName = .Fields("ItemPictureFileName").Value
            Else
            ItemPictureFileName = ""
            End If
            imgProduct.Picture = LoadPicture(ItemPictureFileName)

    End With
'-----------------------------------
    Call LockCtrl

End Sub

Private Sub cmdEdit_Click()
Call UnLockCtrl
     Text1.Enabled = False
     cmdSearch.Enabled = False
     
    cmdAdd.Enabled = False
    cmdEdit.Enabled = False
    cmdDelete.Enabled = False
        
    cmdOK.Visible = True
    cmdCancel.Visible = True
    
    txtItemID.BackColor = &H80000013
    txtItemName.BackColor = &H80000013
    txtOnHand.BackColor = &H80000013
    txtLeadtime.BackColor = &H80000013

End Sub

Private Sub cmdCancel_Click()

With DataEnInventories.rsInventoryManagement
    .CancelUpdate
    '.MoveFirst
    Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
    
    If .Fields("ItemPictureFileName").Value <> "" Then
            ItemPictureFileName = .Fields("ItemPictureFileName").Value
            Else
            ItemPictureFileName = ""
            End If
            imgProduct.Picture = LoadPicture(ItemPictureFileName)
End With
    
    cmdAdd.Enabled = True
    cmdEdit.Enabled = True
    cmdDelete.Enabled = True
    
    cmdOK.Visible = False
    cmdCancel.Visible = False
    
    Text1.Enabled = True
    cmdSearch.Enabled = True
    
    cmdFirst.Enabled = True
    cmdPrevious.Enabled = True
    cmdNext.Enabled = True
    cmdEnd.Enabled = True
    
    Call LockCtrl
End Sub

Private Sub cmdDelete_Click()
If MsgBox("คุณต้องการลบเร็คคอร์ดนี้หรื่อไม่", vbYesNo, "ยืนยันการลบ") = vbYes Then
    With DataEnInventories.rsInventoryManagement
        .Delete
        .MoveNext
            If .EOF Then
                .MoveLast
            End If
            Call Form_Load
    End With
End If

End Sub

Private Sub cmdOK_Click()

'On Error GoTo ItemPicture


Dim tmpName As String

    If (txtItemID.Text = "") Then
        MsgBox "กรุณาใส่รหัสสินค้าด้วย !", vbOKOnly + vbCritical, "MRP Inventory Management"
        txtItemID.SetFocus
        cmdAdd.Enabled = False
        cmdEdit.Enabled = False
        Exit Sub
    End If
    
    If (txtItemName.Text = "") Then
        MsgBox "กรุณาใส่ชื่อสินค้าด้วย !", vbOKOnly + vbCritical, "MRP Inventory Management"
        txtItemName.SetFocus
        cmdAdd.Enabled = False
        cmdEdit.Enabled = False
        Exit Sub
    End If
    
    'ตรวจสอบการจำหน่ายและยกเลิกการจำหน่าย โดยใส่ข้อความไว้ด้านหลังชื่อ
    With DataEnInventories.rsInventoryManagement
        If txtItemID.Text <> "" Then
            If chkItemStatus.Value = Checked Then
            tmpName = RTrim(.Fields("ItemName").Value)
                If Right$(tmpName, 15) <> "(ยกเลิกใช้)" Then
                    .Fields("ItemName").Value = tmpName & " (ยกเลิกใช้)"
                End If
                .Fields("ItemStatus").Value = "1"
            ElseIf chkItemStatus.Value = Unchecked Then
                tmpName = RTrim(.Fields("ItemName").Value)
                tmpName = Replace(tmpName, "(ยกเลิกใช้)", "")
                .Fields("ItemName").Value = RTrim(tmpName)
                .Fields("ItemStatus").Value = "0"
            End If
        End If
        
         If (Val(Len(ItemPictureFileName)) > 300) Then
            MsgBox "รูปภาพที่คุณเลือก เก็บอยู่ในพาธที่ยาวเกินไป!", vbOKOnly + vbExclamation, "MRP Inventory Management"
            imgProduct.Picture = LoadPicture("")
            Exit Sub
        End If
        
        If (ItemPictureFileName <> "") Then
                .Fields("ItemPictureFileName").Value = ItemPictureFileName
        End If
        
        If txtCost.Text = "" Then
            .Fields("Cost").Value = 0
        End If
        
        If txtSellPrice.Text = "" Then
            .Fields("SellPrice").Value = 0
        End If

        If txtOnHand.Text = "" Then
            .Fields("OnHand").Value = 0
        End If

        If txtLeadtime.Text = "" Then
            .Fields("Leadtime").Value = 0
        End If

        If txtAllocatedQuantities.Text = "" Then
            .Fields("AllocatedQuantities").Value = 0
        End If

        If txtSafetyStock.Text = "" Then
            .Fields("SafetyStock").Value = 0
        End If
        
        If txtLotSize.Text = "" Then
            .Fields("LotSize").Value = 0
        End If
        
Dim parameterItemType_ID As String
Dim parameterBrand_ID As String
Dim parameterSupplier_ID As String

With DataEnInventories.rsparameterItemTypeID
If .State = adStateOpen Then .Close

    DataEnInventories.parameterItemTypeID cboItemTypeName.Text
    parameterItemType_ID = DataEnInventories.rsparameterItemTypeID.Fields("ItemTypeID")
End With

With DataEnInventories.rsparameterBrandID
If .State = adStateOpen Then .Close

    DataEnInventories.parameterBrandID cboBrand.Text
    parameterBrand_ID = DataEnInventories.rsparameterBrandID.Fields("BrandID")
End With

With DataEnInventories.rsparameterSupplierID
If .State = adStateOpen Then .Close

    DataEnInventories.parameterSupplierID cboSupplier.Text
    parameterSupplier_ID = DataEnInventories.rsparameterSupplierID.Fields("SupplierID")
End With

With DataEnInventories.rsInventoryManagement

            .Fields("ItemTypeID").Value = parameterItemType_ID
            .Fields("BrandID").Value = parameterBrand_ID
            .Fields("SupplierID").Value = parameterSupplier_ID

End With
        .Update

End With

ItemPicture:
    Select Case Err.Number
    Case -2147467259
             'MsgBox "คุณใส่รหัสสินค้าซ้ำ !", vbOKOnly + vbCritical, "MRP Inventory Management"
'            txtItem(0).SetFocus
'            txtItem(0).SelStart = 0
'            txtItem(0).SelLength = Len(txtItem(0).Text)
'            Exit Sub
    End Select
  
    Call LockCtrl
    
    cmdAdd.Enabled = True
    cmdEdit.Enabled = True
    cmdDelete.Enabled = True
    
    cmdOK.Visible = False
    cmdCancel.Visible = False
    
    Text1.Enabled = True
    cmdSearch.Enabled = True
    
    cmdFirst.Enabled = True
    cmdPrevious.Enabled = True
    cmdNext.Enabled = True
    cmdEnd.Enabled = True

End Sub

Private Sub cmdSearch_Click()
Dim userCriteria As String

userCriteria = "ItemID like '" & Text1.Text & "'"

If Text1.Text = "" Then
    MsgBox "กรุณาใส่ ItemID", vbOKOnly, "InventoryManagement"
ElseIf IsNumeric(Text1.Text) Then
    With DataEnInventories.rsInventoryManagement
        .MoveFirst
        .Find userCriteria, , adSearchForward
        Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
           
            On Error GoTo Err1
            If .Fields("ItemPictureFileName").Value <> "" Then
            ItemPictureFileName = .Fields("ItemPictureFileName").Value
            Else
            ItemPictureFileName = ""
            End If
            imgProduct.Picture = LoadPicture(ItemPictureFileName)

    End With
       
End If

Err1:
    If DataEnInventories.rsInventoryManagement.EOF Then
        MsgBox "ไม่พบข้อมูล", vbOKOnly, "InventoryManagement"
    Label2.Caption = "Record: "
                imgProduct.Picture = LoadPicture("")
    End If

                Text1.SetFocus
                Text1.SelStart = 0
                Text1.SelLength = Len(Text1.Text)
End Sub

Private Sub cmdAdd_Click()
Call UnLockCtrl

cmdAdd.Enabled = False
cmdEdit.Enabled = False
cmdDelete.Enabled = False

cmdFirst.Enabled = False
cmdPrevious.Enabled = False
cmdNext.Enabled = False
cmdEnd.Enabled = False

cmdOK.Visible = True
cmdCancel.Visible = True
cmdSearch.Enabled = False
Text1.Enabled = False

DataEnInventories.rsInventoryManagement.AddNew
txtItemName.SetFocus
txtItemID.BackColor = &H80000013
txtItemName.BackColor = &H80000013
txtOnHand.BackColor = &H80000013
txtLeadtime.BackColor = &H80000013

Dim tmp As String

With DataEnInventories.rsInventoryManagement

If .RecordCount = 0 Then
            .AddNew
            .Fields("ItemID").Value = "001"
            .Update
            tmp = "001"
Else
            tmp = Format(.RecordCount, "000")
        End If
        txtItemID.Text = tmp
        
        Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
        chkItemStatus.Value = Unchecked
End With
                imgProduct.Picture = LoadPicture("")
End Sub
'---------------------------------Browse Picture--------------------------------
Private Sub cmdBrowse2_Click()
ItemPictureFileName = ""
    With cdlBrowse
        .DialogTitle = "Choose Picture"
        .CancelError = False
        .Action = 1
        ItemPictureFileName = .FileName
    End With
    
    If ItemPictureFileName <> "" Then
    imgProduct.Picture = LoadPicture(ItemPictureFileName)
    End If
End Sub
'----------------------------Move Record-------------------------
Private Sub cmdEnd_Click()
With DataEnInventories.rsInventoryManagement
.MoveLast
Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount

            If .Fields("ItemPictureFileName").Value <> "" Then
            ItemPictureFileName = .Fields("ItemPictureFileName").Value
            Else
            ItemPictureFileName = ""
            End If
            imgProduct.Picture = LoadPicture(ItemPictureFileName)

'------------------------
    Dim ItemType_ID As String
    Dim Brand_ID As String
    Dim Supplier_ID As String
        
        ItemType_ID = .Fields("ItemTypeID").Value
        Brand_ID = .Fields("BrandID").Value
        Supplier_ID = .Fields("SupplierID").Value
    
        Dim parameterItemType_Name As String
        Dim parameterBrand_Name As String
        Dim parameterSupplier_Name As String
        
        With DataEnInventories.rsparameterItemTypeName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterItemTypeName (ItemType_ID)
        parameterItemType_Name = DataEnInventories.rsparameterItemTypeName.Fields("ItemTypeName")
        cboItemTypeName.Text = parameterItemType_Name
        End With
        
        With DataEnInventories.rsparameterBrandName
        If .State = adStateOpen Then .Close
        
        DataEnInventories.parameterBrandName (Brand_ID)
        parameterBrand_Name = DataEnInventories.rsparameterBrandName.Fields("BrandName")
        cboBrand.Text = parameterBrand_Name
        End With
        
        With DataEnInventories.rsparameterSupplierName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterSupplierName (Supplier_ID)
        parameterSupplier_Name = DataEnInventories.rsparameterSupplierName.Fields("SupplierNameEnglish")
        cboSupplier.Text = parameterSupplier_Name
        End With
'-----------------------------------

End With
End Sub

Private Sub cmdFirst_Click()
With DataEnInventories.rsInventoryManagement
.MoveFirst
Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount

            If .Fields("ItemPictureFileName").Value <> "" Then
            ItemPictureFileName = .Fields("ItemPictureFileName").Value
            Else
            ItemPictureFileName = ""
            End If
            imgProduct.Picture = LoadPicture(ItemPictureFileName)

'------------------------
    Dim ItemType_ID As String
    Dim Brand_ID As String
    Dim Supplier_ID As String
        
        ItemType_ID = .Fields("ItemTypeID").Value
        Brand_ID = .Fields("BrandID").Value
        Supplier_ID = .Fields("SupplierID").Value
    
        Dim parameterItemType_Name As String
        Dim parameterBrand_Name As String
        Dim parameterSupplier_Name As String
        
        With DataEnInventories.rsparameterItemTypeName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterItemTypeName (ItemType_ID)
        parameterItemType_Name = DataEnInventories.rsparameterItemTypeName.Fields("ItemTypeName")
        cboItemTypeName.Text = parameterItemType_Name
        End With
        
        With DataEnInventories.rsparameterBrandName
        If .State = adStateOpen Then .Close
        
        DataEnInventories.parameterBrandName (Brand_ID)
        parameterBrand_Name = DataEnInventories.rsparameterBrandName.Fields("BrandName")
        cboBrand.Text = parameterBrand_Name
        End With
        
        With DataEnInventories.rsparameterSupplierName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterSupplierName (Supplier_ID)
        parameterSupplier_Name = DataEnInventories.rsparameterSupplierName.Fields("SupplierNameEnglish")
        cboSupplier.Text = parameterSupplier_Name
        End With
'-----------------------------------

End With
End Sub

Private Sub cmdNext_Click()
With DataEnInventories.rsInventoryManagement
.MoveNext
        If .EOF Then
            .MoveFirst
        End If
        
        Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount

            If .Fields("ItemPictureFileName").Value <> "" Then
            ItemPictureFileName = .Fields("ItemPictureFileName").Value
            Else
            ItemPictureFileName = ""
            End If
            imgProduct.Picture = LoadPicture(ItemPictureFileName)

'------------------------
    Dim ItemType_ID As String
    Dim Brand_ID As String
    Dim Supplier_ID As String
        
        ItemType_ID = .Fields("ItemTypeID").Value
        Brand_ID = .Fields("BrandID").Value
        Supplier_ID = .Fields("SupplierID").Value
    
        Dim parameterItemType_Name As String
        Dim parameterBrand_Name As String
        Dim parameterSupplier_Name As String
        
        With DataEnInventories.rsparameterItemTypeName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterItemTypeName (ItemType_ID)
        parameterItemType_Name = DataEnInventories.rsparameterItemTypeName.Fields("ItemTypeName")
        cboItemTypeName.Text = parameterItemType_Name
        End With
        
        With DataEnInventories.rsparameterBrandName
        If .State = adStateOpen Then .Close
        
        DataEnInventories.parameterBrandName (Brand_ID)
        parameterBrand_Name = DataEnInventories.rsparameterBrandName.Fields("BrandName")
        cboBrand.Text = parameterBrand_Name
        End With
        
        With DataEnInventories.rsparameterSupplierName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterSupplierName (Supplier_ID)
        parameterSupplier_Name = DataEnInventories.rsparameterSupplierName.Fields("SupplierNameEnglish")
        cboSupplier.Text = parameterSupplier_Name
        End With
'-----------------------------------

End With
End Sub

Private Sub cmdPrevious_Click()
With DataEnInventories.rsInventoryManagement
.MovePrevious
    If .BOF Then
        .MoveLast
    End If
Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount

            If .Fields("ItemPictureFileName").Value <> "" Then
            ItemPictureFileName = .Fields("ItemPictureFileName").Value
            Else
            ItemPictureFileName = ""
            End If
            imgProduct.Picture = LoadPicture(ItemPictureFileName)

'------------------------
    Dim ItemType_ID As String
    Dim Brand_ID As String
    Dim Supplier_ID As String
        
        ItemType_ID = .Fields("ItemTypeID").Value
        Brand_ID = .Fields("BrandID").Value
        Supplier_ID = .Fields("SupplierID").Value
    
        Dim parameterItemType_Name As String
        Dim parameterBrand_Name As String
        Dim parameterSupplier_Name As String
        
        With DataEnInventories.rsparameterItemTypeName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterItemTypeName (ItemType_ID)
        parameterItemType_Name = DataEnInventories.rsparameterItemTypeName.Fields("ItemTypeName")
        cboItemTypeName.Text = parameterItemType_Name
        End With
        
        With DataEnInventories.rsparameterBrandName
        If .State = adStateOpen Then .Close
        
        DataEnInventories.parameterBrandName (Brand_ID)
        parameterBrand_Name = DataEnInventories.rsparameterBrandName.Fields("BrandName")
        cboBrand.Text = parameterBrand_Name
        End With
        
        With DataEnInventories.rsparameterSupplierName
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterSupplierName (Supplier_ID)
        parameterSupplier_Name = DataEnInventories.rsparameterSupplierName.Fields("SupplierNameEnglish")
        cboSupplier.Text = parameterSupplier_Name
        End With
'-----------------------------------

End With
End Sub
'-----------------------------------------End Move Record-----------------------------

Private Sub text1_keypress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call cmdSearch_Click
    End If
End Sub

Private Sub LockCtrl()

txtItemID.Locked = True
txtItemName.Locked = True
cboItemTypeName.Locked = True
cboBrand.Locked = True
cboSupplier.Locked = True
txtVersion.Locked = True
txtCost.Locked = True
txtSellPrice.Locked = True
txtDetail.Locked = True

txtOnHand.Locked = True
txtLeadtime.Locked = True
txtAllocatedQuantities.Locked = True
txtSafetyStock.Locked = True
txtLotSize.Locked = True

chkItemStatus.Enabled = False

'txtItem(i).BackColor = &H8000000F  'สีเทา
txtItemID.BackColor = &H80000013
txtItemName.BackColor = &H80000013

cboItemTypeName.BackColor = &H8000000F
cboBrand.BackColor = &H8000000F
cboSupplier.BackColor = &H8000000F
txtVersion.BackColor = &H8000000F
txtCost.BackColor = &H8000000F
txtSellPrice.BackColor = &H8000000F
txtDetail.BackColor = &H8000000F

txtOnHand.BackColor = &H80000013
txtLeadtime.BackColor = &H80000013

txtAllocatedQuantities.BackColor = &H8000000F
txtSafetyStock.BackColor = &H8000000F
txtLotSize.BackColor = &H8000000F

cmdBrowse2.Enabled = False
    
End Sub

Private Sub UnLockCtrl()

txtItemID.Locked = False
txtItemName.Locked = False
cboItemTypeName.Locked = False
cboBrand.Locked = False
cboSupplier.Locked = False
txtVersion.Locked = False
txtCost.Locked = False
txtSellPrice.Locked = False
txtDetail.Locked = False

txtOnHand.Locked = False
txtLeadtime.Locked = False
txtAllocatedQuantities.Locked = False
txtSafetyStock.Locked = False
txtLotSize.Locked = False

chkItemStatus.Enabled = True

cmdBrowse2.Enabled = True

'txtItem(i).BackColor = &H80000009   'สีขาว
txtItemID.BackColor = &H80000009
txtItemName.BackColor = &H80000009
cboItemTypeName.BackColor = &H80000009
cboBrand.BackColor = &H80000009
cboSupplier.BackColor = &H80000009
txtVersion.BackColor = &H80000009
txtCost.BackColor = &H80000009
txtSellPrice.BackColor = &H80000009
txtDetail.BackColor = &H80000009

txtOnHand.BackColor = &H80000009
txtLeadtime.BackColor = &H80000009
txtAllocatedQuantities.BackColor = &H80000009
txtSafetyStock.BackColor = &H80000009
txtLotSize.BackColor = &H80000009
    
End Sub

