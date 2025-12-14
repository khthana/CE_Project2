VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.MDIForm frmMain 
   Appearance      =   0  'Flat
   BackColor       =   &H8000000C&
   Caption         =   "MRP SYSTEM"
   ClientHeight    =   4485
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   7050
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar tbToolBar 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   7050
      _ExtentX        =   12435
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      ImageList       =   "imlToolbarIcons"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Print"
            Object.ToolTipText     =   "Print"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   4
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Inventory Management"
            Object.ToolTipText     =   "Inventory Management"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Purchase"
            Object.ToolTipText     =   "Purchase"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "CheckOrder"
            Object.ToolTipText     =   "CheckOrder"
            ImageIndex      =   8
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   4
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Supplier"
            Object.ToolTipText     =   "Supplier"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Sale Order"
            Object.ToolTipText     =   "Sale Order"
            ImageIndex      =   9
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin MSComctlLib.StatusBar sbStatusBar 
      Align           =   2  'Align Bottom
      Height          =   285
      Left            =   0
      TabIndex        =   0
      Top             =   4200
      Width           =   7050
      _ExtentX        =   12435
      _ExtentY        =   503
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   6773
            Text            =   "Status"
            TextSave        =   "Status"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            AutoSize        =   2
            TextSave        =   "20/4/2546"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            AutoSize        =   2
            TextSave        =   "15:54"
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog dlgCommonDialog 
      Left            =   3840
      Top             =   1560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Left            =   1800
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":27A2
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":28B4
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":29C6
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2AD8
            Key             =   "Print"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2BEA
            Key             =   "Inventory Management"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":539C
            Key             =   "Supplier"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":61EE
            Key             =   "Purchase"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":6EC8
            Key             =   "Check Order"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":731A
            Key             =   "SaleOrder"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuMRPsystems 
      Caption         =   "&MRP Systems"
      Begin VB.Menu mnuBOM 
         Caption         =   "&BOM"
      End
      Begin VB.Menu mnuInventoryRecord 
         Caption         =   "&InventoryRecord"
      End
      Begin VB.Menu mnuUpdateMasterSchedule 
         Caption         =   "&updateตารางการผลิตหลัก"
      End
   End
   Begin VB.Menu mnuInventory 
      Caption         =   "&Inventory"
      Begin VB.Menu mnuInventoryManagement 
         Caption         =   "&Inventory Management"
      End
      Begin VB.Menu mnuItemType 
         Caption         =   "&Item Type"
      End
      Begin VB.Menu mnuInventoryBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuItemLowLimit 
         Caption         =   "&Item Low Limit (ตรวจสินค้าเหลือน้อย)"
      End
      Begin VB.Menu mnuPurchase 
         Caption         =   "&Purchase (สั่งซื้อสินค้า)"
      End
      Begin VB.Menu mnuReceived 
         Caption         =   "&Check Received Order (รับสินค้า)"
      End
      Begin VB.Menu mnuCancelPO 
         Caption         =   "&Cancel Purchase Order (ยกเลิกใบสั่งซื้อ)"
      End
      Begin VB.Menu mnuInventoryBar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSalesOrder 
         Caption         =   "&Sales Order (ขายสินค้า)"
      End
      Begin VB.Menu mnuCancelCustomerOrder 
         Caption         =   "&Cancel Customer Order (ยกเลิกใบขายสินค้า)"
      End
   End
   Begin VB.Menu mnuCommunity 
      Caption         =   "&Community"
      Begin VB.Menu mnuSupplier 
         Caption         =   "&Supplier"
      End
      Begin VB.Menu mnuBrandManage 
         Caption         =   "&Brand Management"
      End
      Begin VB.Menu mnuCommunityBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuItemPurchase 
         Caption         =   "&Item Purchase (ตรวจสอบรายการที่ยังไม่ได้รับ)"
      End
      Begin VB.Menu mnuCheckSalesValue 
         Caption         =   "&Check Sales Value (ตรวจสอบรายการขาย)"
      End
      Begin VB.Menu mnuTransactionLog 
         Caption         =   "&Transaction Log"
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin VB.Menu mnuCascade 
         Caption         =   "Cascade"
      End
      Begin VB.Menu mnuTileHorizontal 
         Caption         =   "Tile Horizontally"
      End
      Begin VB.Menu mnuTileVertical 
         Caption         =   "Tile Vertically"
      End
      Begin VB.Menu mnuArrangeIcons 
         Caption         =   "Arrange Icons"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpContents 
         Caption         =   "&Contents"
      End
      Begin VB.Menu mnuHelpSearchForHelpOn 
         Caption         =   "&Search For Help On..."
      End
      Begin VB.Menu mnuHelpBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "&About "
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Any) As Long
Const EM_UNDO = &HC7
Private Declare Function OSWinHelp% Lib "user32" Alias "WinHelpA" (ByVal hwnd&, ByVal HelpFile$, ByVal wCommand%, dwData As Any)

Private Sub MDIForm_Load()
    Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
    Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
    Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
    Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
    blnDataChange = False
    
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    If Me.WindowState <> vbMinimized Then
        SaveSetting App.Title, "Settings", "MainLeft", Me.Left
        SaveSetting App.Title, "Settings", "MainTop", Me.Top
        SaveSetting App.Title, "Settings", "MainWidth", Me.Width
        SaveSetting App.Title, "Settings", "MainHeight", Me.Height
    End If
End Sub

Private Sub mnuArrangeIcons_Click()
    frmMain.Arrange vbArrangeIcons
End Sub

Private Sub mnuBOM_Click()
    frmBrand.Caption = "Bill Of Material"
    Load frmBOM
    frmBOM.Show
End Sub

Private Sub mnuBrandManage_Click()
    frmBrand.Caption = "Brand Management"
    Load frmBrand
    frmBrand.Show
End Sub

Private Sub mnuCancelCustomerOrder_Click()
    frmCancelSO.Caption = "Cancel Customer Order"
    Load frmCancelSO
    frmCancelSO.Show
End Sub

Private Sub mnuCancelPO_Click()
    frmCancelPO.Caption = "Cancel Purchase Order"
    Load frmCancelPO
    frmCancelPO.Show
End Sub

Private Sub mnuCascade_Click()
    frmMain.Arrange vbCascade
End Sub

Private Sub mnuCheckSalesValue_Click()
    frmCheckSalesValue.Caption = "Check Sales Value"
    Load frmCheckSalesValue
    frmCheckSalesValue.Show
End Sub

Private Sub mnuInventoryManagement_Click()
    frmInventoryManagement.Caption = "Inventory Management"
    Load frmInventoryManagement
    frmInventoryManagement.Show
End Sub

Private Sub mnuInventoryRecord_Click()
    frmViewInventoryRecord.Caption = "Inventory Record"
    Load frmViewInventoryRecord
    frmViewInventoryRecord.Show
End Sub

Private Sub mnuItemLowLimit_Click()
    frmAllItemLowLimit.Caption = "Item Low Limit"
    Load frmAllItemLowLimit
    frmAllItemLowLimit.Show

End Sub

Private Sub mnuItemPurchase_Click()
    frmItemSendToday.Caption = "Item Purchase"
    Load frmItemSendToday
    frmItemSendToday.Show
End Sub

Private Sub mnuItemType_Click()
    frmItemType.Caption = "ItemType Management"
    Load frmItemType
    frmItemType.Show
End Sub

Private Sub mnuNewBill_Click()
    frmBill.Caption = "NewBill"
    Load frmBill
    frmBill.Show
End Sub

Private Sub mnuNewBOM_Click()
    frmBOM.Caption = "NewBOM"
    Load frmBOM
    frmBOM.Show
End Sub

Private Sub mnuNewInvoice_Click()
    frmInvoice.Caption = "NewInvoice"
    Load frmInvoice
    frmInvoice.Show
End Sub

Private Sub mnuNewMasterSchedule_Click()
    frmMasterSchedule.Caption = "NewMasterSchedule"
    Load frmMasterSchedule
    frmMasterSchedule.Show
End Sub

Private Sub mnuNewPriceTable_Click()
    frmPriceTable.Caption = "NewPriceTable"
    Load frmPriceTable
    frmPriceTable.Show
End Sub

Private Sub mnuOpenBill_Click()
    frmBill.Caption = "OpenBill"
    Load frmBill
    frmBill.Show
End Sub

Private Sub mnuOpenBOM_Click()
    frmBOM.Caption = "OpenBOM"
    Load frmBOM
    frmBOM.Show
    
End Sub

Private Sub mnuOpenInvoice_Click()
    frmInvoice.Caption = "OpenInvoice"
    Load frmInvoice
    frmInvoice.Show
    
End Sub

Private Sub mnuOpenMasterSchedule_Click()
    frmMasterSchedule.Caption = "OpenMasterSchedule"
    Load frmMasterSchedule
    frmMasterSchedule.Show
    
End Sub

Private Sub mnuOpenPartDetail_Click()
    frmInventoryDetail.Caption = "OpenInventoryDetail"
    Load frmInventoryDetail
    frmInventoryDetail.Show
    
End Sub

Private Sub mnuOpenPriceTable_Click()
    frmPriceTable.Caption = "OpenPriceTable"
    Load frmPriceTable
    frmPriceTable.Show
    
End Sub

Private Sub mnuPurchase_Click()
    frmPurchase.Caption = "Purchase"
    Load frmPurchase
    frmPurchase.Show

End Sub

Private Sub mnuReceived_Click()
    frmReceivedItem.Caption = "Check Received Order"
    Load frmReceivedItem
    frmReceivedItem.Show
End Sub

Private Sub mnuSalesOrder_Click()
    frmSales.Caption = "Sales Order"
    Load frmSales
    frmSales.Show
End Sub

Private Sub mnuSupplier_Click()
    frmSupplier.Caption = "Supplier"
    Load frmSupplier
    frmSupplier.Show
End Sub

Private Sub mnuTileHorizontal_Click()
     frmMain.Arrange vbTileHorizontal
End Sub

Private Sub mnuTileVertical_Click()
     frmMain.Arrange vbTileVertical
End Sub

Private Sub mnuTransactionLog_Click()
    frmTransactionLog.Caption = "Transaction Log"
    Load frmTransactionLog
    frmTransactionLog.Show
End Sub

Private Sub mnuViewInventoryRecord_Click()
    frmViewInventoryRecord.Caption = "ShowInventoryRecord"
    Load frmViewInventoryRecord
    frmViewInventoryRecord.Show
End Sub


Private Sub mnuUpdateMasterSchedule_Click()
    frmMasterSchedule.Caption = "ShowMasterSchedule"
    Load frmMasterSchedule
    frmMasterSchedule.Show
End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As MSComctlLib.Button)
    On Error Resume Next
    Select Case Button.Key
        Case "New"
            Load frmSelect
            frmSelect.Show
        Case "Open"
            'ToDo: Add 'Open' button code.
            MsgBox "Add 'Open' button code."
        Case "Save"
            'ToDo: Add 'Save' button code.
            MsgBox "Add 'Save' button code."
        Case "Print"
            'ToDo: Add 'Print' button code.
            Load frmPrint
            frmPrint.Show
        Case "Inventory Management"
            Load frmInventoryManagement
            frmInventoryManagement.Show
        Case "Purchase"
            Load frmPurchase
            frmPurchase.Show
        Case "CheckOrder"
            Load frmReceivedItem
            frmReceivedItem.Show
        Case "Supplier"
            Load frmSupplier
            frmSupplier.Show
        Case "Sale Order"
            Load frmSales
            frmSales.Show
    End Select
End Sub

Private Sub mnuHelpAbout_Click()
    MsgBox "Version " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub mnuHelpSearchForHelpOn_Click()
    Dim nRet As Integer

    'if there is no helpfile for this project display a message to the user
    'you can set the HelpFile for your application in the
    'Project Properties dialog
    If Len(App.HelpFile) = 0 Then
        MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
    Else
        On Error Resume Next
        nRet = OSWinHelp(Me.hwnd, App.HelpFile, 261, 0)
        If Err Then
            MsgBox Err.Description
        End If
    End If

End Sub

Private Sub mnuHelpContents_Click()
    Dim nRet As Integer


    'if there is no helpfile for this project display a message to the user
    'you can set the HelpFile for your application in the
    'Project Properties dialog
    If Len(App.HelpFile) = 0 Then
        MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
    Else
        On Error Resume Next
        nRet = OSWinHelp(Me.hwnd, App.HelpFile, 3, 0)
        If Err Then
            MsgBox Err.Description
        End If
    End If

End Sub


Private Sub mnuViewOptions_Click()
    'ToDo: Add 'mnuViewOptions_Click' code.
    MsgBox "Add 'mnuViewOptions_Click' code."
End Sub

Private Sub mnuViewRefresh_Click()
    'ToDo: Add 'mnuViewRefresh_Click' code.
    MsgBox "Add 'mnuViewRefresh_Click' code."
End Sub

Private Sub mnuEditUndo_Click()
    'ToDo: Add 'mnuEditUndo_Click' code.
    MsgBox "Add 'mnuEditUndo_Click' code."
End Sub


Private Sub mnuFileExit_Click()
    'unload the form
    Unload Me

End Sub

Private Sub mnuReceivedItem_Click()
    frmReceivedItem.Show
    frmReceivedItem.SetFocus
End Sub
