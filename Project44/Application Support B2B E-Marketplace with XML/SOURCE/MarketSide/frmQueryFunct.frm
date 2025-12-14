VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form frmQueryFunct 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Query Function"
   ClientHeight    =   6270
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5100
   Icon            =   "frmQueryFunct.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6270
   ScaleWidth      =   5100
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdAdmin 
      Caption         =   "SQL"
      Height          =   495
      Left            =   120
      TabIndex        =   15
      Top             =   5640
      Width           =   1215
   End
   Begin VB.CommandButton cmdView 
      Caption         =   "View"
      Height          =   495
      Left            =   2520
      TabIndex        =   16
      Top             =   5640
      Width           =   1215
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   495
      Left            =   3840
      TabIndex        =   17
      Top             =   5640
      Width           =   1215
   End
   Begin VB.Frame FrameSeller 
      Caption         =   "Seller"
      Height          =   1935
      Left            =   0
      TabIndex        =   23
      Top             =   1080
      Width           =   5055
      Begin VB.TextBox txtSellerID 
         Height          =   285
         Left            =   2520
         TabIndex        =   3
         Top             =   840
         Width           =   1575
      End
      Begin VB.OptionButton optSellerAll 
         Caption         =   "All Seller"
         Height          =   255
         Left            =   600
         TabIndex        =   1
         Top             =   360
         Value           =   -1  'True
         Width           =   1095
      End
      Begin VB.OptionButton optOnlySellerID 
         Caption         =   "Only Seller ID"
         Height          =   255
         Left            =   600
         TabIndex        =   2
         Top             =   840
         Width           =   1455
      End
      Begin VB.OptionButton optUserName 
         Caption         =   "Only User Name"
         Height          =   255
         Left            =   600
         TabIndex        =   4
         Top             =   1320
         Width           =   1575
      End
      Begin VB.TextBox txtUserName 
         Height          =   285
         Left            =   2520
         TabIndex        =   5
         Top             =   1320
         Width           =   1575
      End
   End
   Begin VB.Frame FrameDate 
      Caption         =   "Date"
      Height          =   2415
      Left            =   0
      TabIndex        =   20
      Top             =   3120
      Width           =   5055
      Begin VB.TextBox txtYear 
         Alignment       =   2  'Center
         Enabled         =   0   'False
         Height          =   315
         Left            =   3720
         TabIndex        =   24
         Top             =   810
         Width           =   855
      End
      Begin ComCtl2.UpDown UpDown1 
         Height          =   315
         Left            =   4560
         TabIndex        =   9
         Top             =   840
         Width           =   240
         _ExtentX        =   423
         _ExtentY        =   556
         _Version        =   327681
         Enabled         =   -1  'True
      End
      Begin VB.OptionButton optDateAll 
         Caption         =   "All"
         Height          =   255
         Left            =   480
         TabIndex        =   6
         Top             =   360
         Value           =   -1  'True
         Width           =   735
      End
      Begin VB.OptionButton optOnlyDate 
         Caption         =   "Only Date"
         Height          =   255
         Left            =   480
         TabIndex        =   10
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox txtFrom 
         Height          =   285
         Left            =   1920
         TabIndex        =   13
         Top             =   1785
         Width           =   1215
      End
      Begin VB.OptionButton optRange 
         Caption         =   "Range"
         Height          =   255
         Left            =   480
         TabIndex        =   12
         Top             =   1800
         Width           =   855
      End
      Begin VB.TextBox txtTo 
         Height          =   285
         Left            =   3600
         TabIndex        =   14
         Top             =   1785
         Width           =   1215
      End
      Begin VB.TextBox txtOnlyDate 
         Height          =   285
         Left            =   1920
         TabIndex        =   11
         Top             =   1305
         Width           =   1215
      End
      Begin VB.OptionButton optOnlyMonth 
         Caption         =   "Only Month"
         Height          =   255
         Left            =   480
         TabIndex        =   7
         Top             =   840
         Width           =   1215
      End
      Begin VB.ComboBox cmbMonth 
         Height          =   315
         Left            =   1920
         TabIndex        =   8
         Top             =   810
         Width           =   1215
      End
      Begin VB.Label lblDateType 
         AutoSize        =   -1  'True
         Caption         =   "(mm/dd/yy)"
         Height          =   195
         Left            =   3360
         TabIndex        =   26
         Top             =   1320
         Width           =   810
      End
      Begin VB.Label lblYear 
         AutoSize        =   -1  'True
         Caption         =   "Year"
         Height          =   195
         Left            =   3240
         TabIndex        =   25
         Top             =   870
         Width           =   330
      End
      Begin VB.Label lblFrom 
         AutoSize        =   -1  'True
         Caption         =   "From"
         Height          =   195
         Left            =   1440
         TabIndex        =   22
         Top             =   1830
         Width           =   345
      End
      Begin VB.Label lblTo 
         AutoSize        =   -1  'True
         Caption         =   "To"
         Height          =   195
         Left            =   3240
         TabIndex        =   21
         Top             =   1830
         Width           =   195
      End
   End
   Begin VB.Frame Frame1 
      Height          =   975
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Width           =   5055
      Begin VB.ComboBox cmbFunction 
         Height          =   315
         Left            =   1800
         TabIndex        =   0
         Top             =   360
         Width           =   2775
      End
      Begin VB.Label Label1 
         Caption         =   "Function Names"
         Height          =   255
         Left            =   360
         TabIndex        =   19
         Top             =   390
         Width           =   1215
      End
   End
End
Attribute VB_Name = "frmQueryFunct"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim graph As Boolean
Dim dateSQL As String
Private Sub cmbFunction_Click()
        Select Case cmbFunction.ListIndex
                Case 0, 1, 2
                        SellerEnable True
                Case Else
                        SellerEnable False
        End Select
        ClearTxt
        DateEnable True
End Sub

Private Sub cmdAdmin_Click()
        frmQueryAdmin.Show
End Sub

Private Sub cmdClose_Click()
        Unload Me
End Sub

Private Sub cmdView_Click()
        Dim sql As String
        If cmbFunction.Text = "" Then
                MsgBox "Please Select Function in Function Name"
        ElseIf CheckInput Then
                sql = setSQL(cmbFunction.ListIndex)
                frmResult.lblTitle.Caption = cmbFunction.Text
                If graph Then
                        frmGraph.dateSQL = dateSQL
                        frmGraph.index = cmbFunction.ListIndex
                End If
                frmResult.graph = graph
                frmResult.Show
                frmResult.StartQuery sql, cmbFunction.ListIndex
        End If
End Sub

Private Sub Form_Load()
        frmQueryFunct.Move 0, 0
        cmbMonth.Clear
        cmbMonth.AddItem "January"
        cmbMonth.AddItem "Feburary"
        cmbMonth.AddItem "March"
        cmbMonth.AddItem "May"
        cmbMonth.AddItem "June"
        cmbMonth.AddItem "July"
        cmbMonth.AddItem "August"
        cmbMonth.AddItem "September"
        cmbMonth.AddItem "October"
        cmbMonth.AddItem "November"
        cmbMonth.AddItem "December"
        
        cmbFunction.Clear
        cmbFunction.AddItem "รายได้ของตลาดแยกตามผู้ขาย"                                   'index 0
        cmbFunction.AddItem "ปริมาณการซื้อขายสินค้าแยกตามผู้ขาย"                       'index 1
        cmbFunction.AddItem "ปริมาณมใบสั่งซื้อ (PO) ที่ถูกยกเลิก"                           'index 2
        'cmbFunction.AddItem "ใบกำกับสินค้า (Invoice) ที่ยังค้างการชำระเงิน"        'index 4
        'cmbFunction.AddItem "ข้อมูลของใบขอสั่งซื้อ (PR)"                                      'index 5
        'cmbFunction.AddItem "ข้อมูลของใบสั่งซื้อ (PO)"                                          'index 6
        'cmbFunction.AddItem "ข้อมูลของใบกำกับสินค้า (Invice)"                             'index 7
        
        DateEnable False
        SellerEnable False
End Sub

Private Sub SellerEnable(ByVal bool As Boolean)
        optSellerAll.Enabled = bool
        optOnlySellerID.Enabled = bool
        optUserName.Enabled = bool
        txtUserName.Enabled = bool
        txtSellerID.Enabled = bool
       ' lblSellerInfo.Enabled = bool
        FrameSeller.Enabled = bool
End Sub

Private Sub DateEnable(ByVal bool As Boolean)
        optDateAll.Enabled = bool
        optOnlyDate.Enabled = bool
        optOnlyMonth.Enabled = bool
        cmbMonth.Enabled = bool
        optRange.Enabled = bool
        txtFrom.Enabled = bool
        txtTo.Enabled = bool
        lblFrom.Enabled = bool
        lblTo.Enabled = bool
        lblYear.Enabled = bool
        txtYear.Enabled = bool
        lblDateType.Enabled = bool
        FrameDate.Enabled = bool
End Sub

Private Function setSQL(ByVal index As Integer) As String
        Dim sql As String
       ' Dim datesql As String
        Select Case index
                Case 0
                        dateSQL = ConvertDateSQL("CreateDate")
                        If optSellerAll Then
                                        sql = "SELECT DISTINCT " & _
                                                        "MonthlyPayment.PaymentID, MonthlyPayment.TotalPaymentOrTs, " & _
                                                        "MonthlyPayment.TotalCharge, MonthlyPayment.StartDate, " & _
                                                        "MonthlyPayment.EndDate,MonthlyPayment.CreateDate, PR.SellerID " & _
                                                "FROM         PO INNER JOIN " & _
                                                        "MonthlyPayment INNER JOIN " & _
                                                        "MonthlyPaymentDetail ON " & _
                                                        "MonthlyPayment.PaymentID = MonthlyPaymentDetail.PaymentID ON " & _
                                                        "PO.POID = MonthlyPaymentDetail.POID INNER JOIN " & _
                                                        "PR ON PO.PRID = PR.PRID "
                        ElseIf optOnlySellerID Then
                                If txtSellerID.Text = "" Then
                                        MsgBox "Seller ID is Empty"
                                Else
                                        sql = "SELECT DISTINCT " & _
                                                        "MonthlyPayment.PaymentID, MonthlyPayment.TotalPaymentOrTs, " & _
                                                        "MonthlyPayment.TotalCharge, MonthlyPayment.StartDate, " & _
                                                        "MonthlyPayment.EndDate,MonthlyPayment.CreateDate " & _
                                                "FROM         PO INNER JOIN " & _
                                                        "MonthlyPayment INNER JOIN " & _
                                                        "MonthlyPaymentDetail ON " & _
                                                        "MonthlyPayment.PaymentID = MonthlyPaymentDetail.PaymentID ON " & _
                                                        "PO.POID = MonthlyPaymentDetail.POID INNER JOIN " & _
                                                        "PR ON PO.PRID = PR.PRID " & _
                                                "Where (PR.sellerID = " & txtSellerID.Text & ")"
                                End If
                        ElseIf optUserName Then
                                If txtUserName.Text = "" Then
                                        MsgBox "User Name is Empty"
                                Else
                                        sql = "SELECT DISTINCT MonthlyPayment.PaymentID, MonthlyPayment.TotalPaymentOrTs, " & _
                                                        "MonthlyPayment.TotalCharge, MonthlyPayment.StartDate, " & _
                                                        "MonthlyPayment.EndDate, MonthlyPayment.CreateDate " & _
                                          "FROM         PO INNER JOIN " & _
                                                                "MonthlyPayment INNER JOIN " & _
                                                                "MonthlyPaymentDetail ON MonthlyPayment.PaymentID = MonthlyPaymentDetail.PaymentID " & _
                                                                "ON PO.POID = MonthlyPaymentDetail.POID INNER JOIN " & _
                                                                "PR ON PO.PRID = PR.PRID INNER JOIN " & _
                                                                "Member ON PR.SellerID = Member.ID " & _
                                        "WHERE (Member.UserName = '" & txtUserName.Text & "')"
                                End If
                        End If
                        sql = sql & dateSQL
                Case 1  '------------------------ Transaction --------------------
                        dateSQL = ConvertDateSQL("POFullDate")
                        If optSellerAll Then
                                sql = "SELECT     PO.POID, PO.PRID, PO.PONO, PO.SellerOrderNo, PO.POstatus, " & _
                                                 "PR.PRNo, PR.PRTotal, PR.PRItemPrice, PR.PRShipPrice, PR.SellerID, PR.BuyerID " & _
                                  "FROM         PO INNER JOIN " & _
                                                        "PR ON PO.PRID = PR.PRID " & _
                                "WHERE     ((PO.POstatus = '" & SAccept & "') OR " & _
                                                "(PO.POstatus = '" & SPartial & "') OR " & _
                                                "(PO.POstatus = '" & SDeliver & "')) "
                        ElseIf optOnlySellerID Then
                                sql = "SELECT     PO.POID, PO.PRID, PO.PONO, PO.SellerOrderNo, PO.POstatus, " & _
                                                 "PR.PRNo, PR.PRTotal, PR.PRItemPrice, PR.PRShipPrice, PR.BuyerID " & _
                                  "FROM         PO INNER JOIN " & _
                                                        "PR ON PO.PRID = PR.PRID " & _
                                "WHERE     ((PO.POstatus = '" & SAccept & "') OR " & _
                                                "(PO.POstatus = '" & SPartial & "') OR " & _
                                                "(PO.POstatus = '" & SDeliver & "')) and (PR.SellerID = " & txtSellerID.Text & ") "
                        ElseIf optUserName Then
                                sql = "SELECT     PO.POID, PO.PRID, PO.PONO, PO.SellerOrderNo, PO.POstatus, " & _
                                                 "PR.PRNo, PR.PRTotal, PR.PRItemPrice, PR.PRShipPrice, PR.SellerID, PR.BuyerID " & _
                                  "FROM         PO INNER JOIN  INNER JOIN " & _
                                                        "Member ON PR.SellerID = Member.ID " & _
                                                        "PR ON PO.PRID = PR.PRID " & _
                                "WHERE     ((PO.POstatus = '" & SAccept & "') OR " & _
                                                "(PO.POstatus = '" & SPartial & "') OR " & _
                                                "(PO.POstatus = '" & SDeliver & "')) and (member.UserName = '" & txtUserName.Text & "') "
                        End If
                        sql = sql & dateSQL
                Case 2          '------------------- Rejected PO -------------------
                        dateSQL = ConvertDateSQL("POFullDate")
                        If optSellerAll Then
                                sql = "SELECT     PO.POID, PO.PONO, PO.SellerOrderNo, PO.POstatus,PO.POstatus,  PO.POFullDate, " & _
                                        "PO.POSellerComment, PR.SellerID, PR.BuyerID, PR.PRTotal " & _
                                        "FROM         PR INNER JOIN " & _
                                        "PO ON PR.PRID = PO.PRID " & _
                                        "WHERE     (PO.POstatus = 'rejected')"
                        ElseIf optOnlySellerID Then
                                sql = "SELECT     PO.POID, PO.PONO, PO.SellerOrderNo, PO.POstatus,  PO.POFullDate, " & _
                                        "PO.POSellerComment, PR.BuyerID, PR.PRTotal " & _
                                        "FROM         PR INNER JOIN " & _
                                        "PO ON PR.PRID = PO.PRID " & _
                                        "WHERE     (PO.POstatus = 'rejected') and (PR.Sellerid = " & txtSellerID.Text & ")"
                        ElseIf optUserName Then
                                sql = "SELECT     PO.POID, PO.PONO, PO.SellerOrderNo, PO.POstatus,  PO.POFullDate, " & _
                                                "PO.POSellerComment, PR.SellerID, PR.BuyerID, PR.PRTotal " & _
                                        "FROM         PR INNER JOIN " & _
                                                "PO ON PR.PRID = PO.PRID  INNER JOIN " & _
                                                "Member ON PR.SellerID = Member.ID " & _
                                        "WHERE     (PO.POstatus = 'rejected') and (Member.UserName = '" & txtUserName.Text & "')"
                        End If
                        sql = sql & dateSQL
        End Select
        setSQL = sql
End Function

Public Function ConvertDateSQL(ByVal dateCompare As String) As String
        Dim d As Date
        Dim dateStr1 As String
        Dim dateStr2 As String
        
        If optDateAll Then
                ConvertDateSQL = ""
        ElseIf optOnlyDate Then
                d = CDate(txtOnlyDate.Text)
                d = DateAdd("d", 1, d)
                ConvertDateSQL = " and (" & dateCompare & " Between '" & txtOnlyDate.Text & "' and '" & Format$(d, "mm/dd/yy") & "')"
        ElseIf optRange Then
                d = CDate(txtTo.Text)
                d = DateAdd("d", 1, d)
                ConvertDateSQL = " and (" & dateCompare & " Between '" & txtFrom.Text & "' and '" & Format$(d, "mm/dd/yy") & "')"
        ElseIf optOnlyMonth Then
                d = DateSerial(Val(txtYear.Text), cmbMonth.ListIndex + 1, 1)
                dateStr1 = Format$(d, "mm/dd/yy")
                d = DateSerial(Val(txtYear.Text), cmbMonth.ListIndex + 2, 1)
                dateStr2 = Format$(d, "mm/dd/yy")
                ConvertDateSQL = " and (" & dateCompare & " Between '" & dateStr1 & "' and '" & dateStr2 & "')"
                
        Else
                ConvertDateSQL = ""
        End If
End Function

Private Sub optDateAll_Click()
        ClearTxt
End Sub

Private Sub optOnlyDate_Click()
        ClearTxt
        If optOnlyDate.value Then
                txtOnlyDate.Text = Format$(Now, "mm/dd/yy")
        Else
                txtOnlyDate.Text = ""
        End If
        txtOnlyDate.SetFocus
End Sub

Private Sub optOnlyMonth_Click()
        ClearTxt
        If optOnlyMonth Then
                txtYear.Text = Year(Now)
        Else
                txtYear.Text = ""
        End If
        cmbMonth.SetFocus
End Sub

Private Sub optOnlySellerID_Click()
        ClearTxt
        txtSellerID.SetFocus
End Sub

Private Sub optRange_Click()
        ClearTxt
        If optRange.value Then
                txtFrom.Text = Format$(Now, "mm/dd/yy")
                txtTo.Text = Format$(Now, "mm/dd/yy")
        Else
                txtFrom.Text = ""
                txtTo.Text = ""
        End If
        txtFrom.SetFocus
End Sub

Public Function CheckInput() As Boolean
        CheckInput = False
        graph = False
        Select Case cmbFunction.ListIndex
                Case 0, 1, 2
                        If optSellerAll Then
                                If CheckDate Then
                                        CheckInput = True
                                        graph = True
                                End If
                        ElseIf optOnlySellerID Then
                                If txtSellerID.Text = "" Then
                                        MsgBox "Seller ID is Empty"
                                  Else
                                        If CheckDate Then
                                                CheckInput = True
                                        End If
                                End If
                        ElseIf optUserName Then
                                If txtUserName.Text = "" Then
                                        MsgBox "User Name is Empty"
                                Else
                                        If CheckDate Then
                                                CheckInput = True
                                        End If
                                End If
                        End If
                'Case 1
                '        If CheckDate Then
                 '               CheckInput = True
                 '       End If
                Case Else
                          CheckInput = False
        End Select
End Function

Public Function CheckDate() As Boolean
        CheckDate = False
        If optDateAll Then
                CheckDate = True
        ElseIf optOnlyDate Then
                If txtOnlyDate.Text = "" Then
                        MsgBox "Only Date is Empty"
                Else
                        CheckDate = True
                End If
        ElseIf optRange Then
                If txtFrom.Text = "" Then
                        MsgBox "Date From is Empty"
                ElseIf txtTo.Text = "" Then
                        MsgBox "Date To is Empty"
                Else
                        CheckDate = True
                End If
        ElseIf optOnlyMonth Then
                If cmbMonth.Text = "" Then
                        MsgBox "Month is Empty"
                Else
                        CheckDate = True
                End If
        End If
End Function

Private Sub ClearTxt()
        txtSellerID.Text = ""
        txtUserName.Text = ""
        txtOnlyDate.Text = ""
        txtFrom.Text = ""
        txtTo.Text = ""
        txtYear.Text = ""
        cmbMonth.Text = ""
End Sub

Private Sub optSellerAll_Click()
        ClearTxt
End Sub

Private Sub optUserName_Click()
        ClearTxt
        txtUserName.SetFocus
End Sub

Private Sub UpDown1_DownClick()
        txtYear.Text = txtYear.Text - 1
End Sub

Private Sub UpDown1_UpClick()
        txtYear.Text = txtYear.Text + 1
End Sub
