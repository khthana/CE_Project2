VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.2#0"; "Crystl32.OCX"
Begin VB.Form frmPrint 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Print Report"
   ClientHeight    =   3210
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5040
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3210
   ScaleWidth      =   5040
   Begin Crystal.CrystalReport crptReport 
      Left            =   120
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      WindowTitle     =   "Preview Report"
      WindowControlBox=   -1  'True
      WindowMaxButton =   -1  'True
      WindowMinButton =   -1  'True
      WindowState     =   2
      PrintFileLinesPerPage=   60
      WindowShowCloseBtn=   -1  'True
      WindowShowPrintSetupBtn=   -1  'True
      WindowShowRefreshBtn=   -1  'True
   End
   Begin VB.CommandButton Command1 
      Caption         =   "View Report"
      Height          =   615
      Left            =   1680
      TabIndex        =   2
      Top             =   2160
      Width           =   1815
   End
   Begin VB.ComboBox Combo2 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   360
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   1680
      Visible         =   0   'False
      Width           =   4215
   End
   Begin VB.ComboBox Combo1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   1200
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   840
      Width           =   2655
   End
   Begin VB.Label lblCond 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1320
      Width           =   4455
   End
   Begin VB.Label lblReport 
      BackColor       =   &H00C0C0C0&
      Caption         =   "เลือก Report ที่ต้องการ"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1560
      TabIndex        =   3
      Top             =   360
      Width           =   2055
   End
End
Attribute VB_Name = "frmPrint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Combo1_Click()
    If DataEnReport.Conn.State = adStateOpen Then
        DataEnReport.Conn.Close
        DataEnReport.Conn.Open
    End If
    Combo2.Visible = False
    lblCond.Caption = ""
    Select Case Combo1.ListIndex
        Case 1
            lblCond = "เลือก Finish Goods ที่ต้องการแสดง"
            Combo2.Visible = True
            Combo2.Clear
            DataEnReport.listBom
            With DataEnReport.rslistBom
                Do While Not .EOF
                    Combo2.AddItem .Fields("itemid").Value & " : " & .Fields("itemname").Value
                    .MoveNext
                Loop
            End With
            Combo2.ListIndex = 0
        Case 2
        Case 3
            lblCond = "เลือกใบสั่งซื้อที่ต้องการแสดง"
            Combo2.Visible = True
            Combo2.Clear
            DataEnReport.listPurchase
            With DataEnReport.rslistPurchase
                Do While Not .EOF
                    Combo2.AddItem .Fields("orderId").Value & " : " & .Fields("supplierNameThai").Value
                    .MoveNext
                Loop
            End With
            Combo2.ListIndex = 0
        Case 4
            lblCond = "เลือกใบขายสินค้าที่ต้องการแสดง"
            Combo2.Visible = True
            Combo2.Clear
            DataEnReport.listCustomer
            With DataEnReport.rslistCustomer
                Do While Not .EOF
                    Combo2.AddItem .Fields("customerOrderId").Value & " : " & .Fields("customerName").Value
                    .MoveNext
                Loop
            End With
            Combo2.ListIndex = 0
        Case 5
        Case 6
        Case Else
    End Select
End Sub

Private Sub Command1_Click()
    If Combo1.ListIndex Then
        crptReport.ParameterFields(0) = ""
        Select Case Combo1.ListIndex
            Case 1
                crptReport.ReportFileName = App.Path & "\Report_Bom.rpt"
                crptReport.ParameterFields(0) = "ParentItemID;" & Split(Combo2.Text, " : ")(0) & ";TRUE"
            Case 2
                crptReport.ReportFileName = App.Path & "\Report_Inventory.rpt"
            Case 3
                crptReport.ReportFileName = App.Path & "\Report_Purchase.rpt"
                crptReport.ParameterFields(0) = "OrderID;" & Split(Combo2.Text, " : ")(0) & ";TRUE"
            Case 4
                crptReport.ReportFileName = App.Path & "\Report_Customer.rpt"
                crptReport.ParameterFields(0) = "CustomerOrderID;" & Split(Combo2.Text, " : ")(0) & ";TRUE"
            Case 5
                crptReport.ReportFileName = App.Path & "\Report_Master.rpt"
            Case 6
                crptReport.ReportFileName = App.Path & "\Report_InventoryRec.rpt"
            Case Else
        End Select
        crptReport.RetrieveDataFiles
        crptReport.Action = 1
    End If
End Sub

Private Sub Form_Load()
    Combo1.Clear
    Combo1.AddItem "เลือก Report ที่ต้องการ"
    Combo1.AddItem "Bill of Material Report" ' 1
    Combo1.AddItem "ข้อมูลของคงคลัง" '2
    Combo1.AddItem "ใบสั่งซื้อ" '3
    Combo1.AddItem "ใบขายสินค้า" '4
    Combo1.AddItem "ตารางการผลิตหลัก" '5
    Combo1.AddItem "Planned Order" '6
    Combo1.ListIndex = 0
End Sub
