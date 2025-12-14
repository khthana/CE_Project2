VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmMPayment 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Monthly Payment"
   ClientHeight    =   8595
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11445
   Icon            =   "frmMPayment.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8595
   ScaleWidth      =   11445
   Begin VB.Frame Frame4 
      Height          =   1335
      Left            =   6840
      TabIndex        =   24
      Top             =   7200
      Width           =   4575
      Begin VB.Label lblPayment 
         AutoSize        =   -1  'True
         Caption         =   "Total Payment"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   1080
         TabIndex        =   28
         Top             =   360
         Width           =   1020
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Total Charge"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   1080
         TabIndex        =   27
         Top             =   840
         Width           =   915
      End
      Begin VB.Label lblTotalPayment 
         Alignment       =   1  'Right Justify
         Caption         =   "..."
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   2520
         TabIndex        =   26
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label lblTotalCharge 
         Alignment       =   1  'Right Justify
         Caption         =   "..."
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   2520
         TabIndex        =   25
         Top             =   840
         Width           =   1335
      End
   End
   Begin VB.Frame Frame3 
      Height          =   1335
      Left            =   0
      TabIndex        =   15
      Top             =   7200
      Width           =   6735
      Begin VB.CommandButton cmdClose 
         Caption         =   "Close"
         Height          =   735
         Left            =   4800
         TabIndex        =   18
         Top             =   360
         Width           =   1575
      End
      Begin VB.CommandButton cmdQuery 
         Caption         =   "Query"
         Height          =   735
         Left            =   240
         TabIndex        =   17
         Top             =   360
         Width           =   1575
      End
      Begin VB.CommandButton cmdSendToBank 
         Caption         =   "Send To Bank"
         Height          =   735
         Left            =   2040
         TabIndex        =   16
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Detail"
      Height          =   4095
      Left            =   0
      TabIndex        =   8
      Top             =   3000
      Width           =   11415
      Begin MSDataGridLib.DataGrid dtgDetail 
         Height          =   3375
         Left            =   195
         TabIndex        =   9
         Top             =   360
         Width           =   11055
         _ExtentX        =   19500
         _ExtentY        =   5953
         _Version        =   393216
         AllowUpdate     =   0   'False
         AllowArrows     =   0   'False
         HeadLines       =   1
         RowHeight       =   15
         BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ColumnCount     =   2
         BeginProperty Column00 
            DataField       =   ""
            Caption         =   ""
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1054
               SubFormatType   =   0
            EndProperty
         EndProperty
         BeginProperty Column01 
            DataField       =   ""
            Caption         =   ""
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1054
               SubFormatType   =   0
            EndProperty
         EndProperty
         SplitCount      =   1
         BeginProperty Split0 
            BeginProperty Column00 
            EndProperty
            BeginProperty Column01 
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Seller Information"
      Height          =   2895
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11415
      Begin VB.ComboBox cmbSellerID 
         Height          =   315
         Left            =   2280
         TabIndex        =   19
         Top             =   1080
         Width           =   855
      End
      Begin VB.TextBox txtEndDate 
         Height          =   350
         Left            =   9480
         TabIndex        =   13
         Top             =   2202
         Width           =   1455
      End
      Begin VB.TextBox txtStartDate 
         Height          =   350
         Left            =   9480
         TabIndex        =   11
         Top             =   1650
         Width           =   1455
      End
      Begin VB.TextBox txtCharge 
         Alignment       =   1  'Right Justify
         Height          =   350
         Left            =   2280
         TabIndex        =   0
         Text            =   "3"
         Top             =   1680
         Width           =   855
      End
      Begin VB.Label lblUnit 
         AutoSize        =   -1  'True
         Caption         =   "%"
         Height          =   195
         Left            =   3240
         TabIndex        =   29
         Top             =   1725
         Width           =   120
      End
      Begin VB.Label Label12 
         Caption         =   "Business Address"
         Height          =   495
         Left            =   3960
         TabIndex        =   23
         Top             =   1920
         Width           =   735
      End
      Begin VB.Label Label11 
         Caption         =   "Business Name"
         Height          =   495
         Left            =   3960
         TabIndex        =   22
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label lblAddress 
         BorderStyle     =   1  'Fixed Single
         Height          =   615
         Left            =   4920
         TabIndex        =   21
         Top             =   1920
         Width           =   2775
      End
      Begin VB.Label lblName 
         BorderStyle     =   1  'Fixed Single
         Height          =   615
         Left            =   4920
         TabIndex        =   20
         Top             =   1080
         Width           =   2775
      End
      Begin VB.Label lblDate 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   9600
         TabIndex        =   14
         Top             =   1125
         Width           =   135
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "End Date"
         Height          =   195
         Left            =   8160
         TabIndex        =   12
         Top             =   2280
         Width           =   675
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Start Date"
         Height          =   195
         Left            =   8160
         TabIndex        =   10
         Top             =   1725
         Width           =   720
      End
      Begin VB.Label lblType 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   2280
         TabIndex        =   7
         Top             =   2280
         Width           =   135
      End
      Begin VB.Label Label6 
         Caption         =   "Payment Type"
         Height          =   255
         Left            =   600
         TabIndex        =   6
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Current Date"
         Height          =   195
         Left            =   8160
         TabIndex        =   5
         Top             =   1125
         Width           =   900
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Monthly Payment"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   18
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   4237
         TabIndex        =   4
         Top             =   240
         Width           =   2970
      End
      Begin VB.Label Label3 
         Caption         =   "Seller ID"
         Height          =   255
         Left            =   600
         TabIndex        =   3
         Top             =   1125
         Width           =   735
      End
      Begin VB.Label lblPCharge 
         Caption         =   "Payment Charge"
         Height          =   255
         Left            =   600
         TabIndex        =   2
         Top             =   1725
         Width           =   1335
      End
   End
End
Attribute VB_Name = "frmMPayment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim rcsDetail As ADODB.Recordset
Dim conn As ADODB.Connection

Private Sub cmbSellerID_Change()
        cmbSellerID_Click
End Sub

Private Sub cmbSellerID_Click()
        Dim rcs As ADODB.Recordset
        
        Set rcs = New ADODB.Recordset
        rcs.Open "select * from member where id = " & cmbSellerID, conn, 1, 3
        
                Select Case Trim$(rcs!paymenttype)
                        Case "TS"
                                lblType.Caption = "Per Transaction"
                                txtCharge.Text = 500
                                lblUnit.Caption = "ß"
                        Case "VM"
                                lblType.Caption = "Per Volumn"
                                txtCharge.Text = 3
                                lblUnit.Caption = "%"
                 End Select
                lblName.Caption = rcs!bizname
                lblAddress.Caption = rcs!bizaddress
        rcs.Close
        Set rcs = Nothing
End Sub

Private Sub cmdClose_Click()
        Unload Me
End Sub

Private Sub cmdQuery_Click()
        Dim enddate As String
        Dim startdate As String
        Dim totalpayment As Double
        Dim totalcharge As Double
        
        If cmbSellerID.Text = "" Then
                MsgBox "Please Select Seller ID Before Query "
        Else
                        If rcsDetail.State <> adStateClosed Then rcsDetail.Close
                        startdate = Format$(DateValue(txtStartDate.Text), "mm/dd/yy")
                        enddate = Format$(DateAdd("d", 1, DateValue(txtEndDate.Text)), "mm/dd/yy")
                        rcsDetail.Open "SELECT    PO.POID , PO.PONO ,PO.SellerOrderNo , PR.PRTotal , " & _
                                                                                "PO.POFullDate , PO.UpdateDate , PO.POstatus " & _
                                                        "FROM         PO INNER JOIN " & _
                                                                                "PR ON PO.PRID = PR.PRID " & _
                                                        "WHERE     (PR.SellerID = " & cmbSellerID.Text & ") AND (PO.POstatus = '" & SAccept & "' OR " & _
                                                                                "PO.POstatus = '" & SDeliver & "' OR " & _
                                                                                "PO.POstatus = '" & SPartial & "') AND (PO.UpdateDate BETWEEN '" & startdate & _
                                                                                "' AND '" & enddate & "') ", conn, 1, 3
                        Set dtgDetail.DataSource = rcsDetail
                        dtgDetail.Refresh
                        If lblType.Caption = "Per Volumn" Then
                                totalpayment = 0
                                If Not (rcsDetail.BOF) Then rcsDetail.MoveFirst
                                Do While Not (rcsDetail.EOF)
                                        totalpayment = totalpayment + rcsDetail!PRTotal
                                        rcsDetail.MoveNext
                                Loop
                                lblPayment.Caption = "Total Payment"
                                lblTotalPayment.Caption = Format$(totalpayment, "##,##0.00")
                                totalcharge = (totalpayment * CDbl(txtCharge.Text)) / 100
                                lblTotalCharge.Caption = Format$(totalcharge, "##,##0.00")
                        ElseIf lblType.Caption = "Per Transaction" Then
                                lblPayment.Caption = "Total Transaction"
                                totalcharge = (rcsDetail.RecordCount * CDbl(txtCharge.Text))
                                lblTotalPayment.Caption = rcsDetail.RecordCount
                                lblTotalCharge.Caption = Format$(totalcharge, "##,##0.00")
                        End If
        End If
End Sub


Private Sub cmdSendToBank_Click()
        Dim rcs As ADODB.Recordset
        Dim paymentID As String
        Dim SuserID As String
        
        If cmbSellerID.Text = "" Then
                MsgBox "Please Select Seller ID Before Send Monthly Payment to Bank"
        ElseIf lblTotalCharge.Caption = "0.00" Then
                MsgBox "This Seller ID did not have any charge for this month"
        Else
                        Set rcs = New ADODB.Recordset
                        rcs.Open "select max(PaymentID) as maxID from MonthlyPayment", conn, 1, 3
                        If IsNull(rcs!maxid) Then
                                paymentID = "1"
                        Else
                                paymentID = rcs!maxid + 1
                        End If
                        rcs.Close
                        rcs.Open "MonthlyPayment", conn, 1, 3
                        rcs.AddNew
                                rcs!paymentID = paymentID
                                rcs!totalpaymentORTS = lblTotalPayment.Caption
                                rcs!totalcharge = lblTotalCharge.Caption
                                rcs!startdate = txtStartDate.Text
                                rcs!enddate = txtEndDate.Text
                                rcs!createdate = Now
                                rcs!paymentcharge = txtCharge.Text
                                rcs!paymenttype = lblType
                        rcs.Update
                        rcs.Close
                        MsgBox "Update Database Complete"
                        
                        '---------------- Update PaymentDetail -------------------
                        If Not (rcsDetail.BOF) Then rcsDetail.MoveFirst
                        Do While Not (rcsDetail.EOF)
                                conn.Execute "delete from monthlyPaymentDetail where paymentid = " & paymentID & _
                                                           " and poid = " & rcsDetail!poid
                                rcsDetail.MoveNext
                        Loop
                        
                        If Not (rcsDetail.BOF) Then rcsDetail.MoveFirst
                        rcs.Open "MonthlyPaymentDetail", conn, 1, 3
                        Do While Not (rcsDetail.EOF)
                                rcs.AddNew
                                        rcs!paymentID = paymentID
                                        rcs!poid = rcsDetail!poid
                                rcs.Update
                                rcsDetail.MoveNext
                        Loop
                        rcs.Close
                                
                        '----------------------- Create XML -------------------------
                        Dim objxml As XML
                        Dim dest As String
                        Dim conn2 As ADODB.Connection
                        Set objxml = New XML
                        Set conn2 = New ADODB.Connection
                        objxml.SetRootName = "MonthlyPayment"
                        objxml.SetSubRootName = "Manager_Market"
                        objxml.SetStatus = "Seller"
                        conn2 = conString
                        conn2.Open
                        rcs.Open "select userid from publickey where memberid = " & cmbSellerID, conn2, 1, 3
                        SuserID = rcs!Userid
                        rcs.Close
                        conn2.Close
                        
                        rcs.Open "SELECT     PaymentID, TotalCharge,StartDate , EndDate " & _
                                                "FROM         MonthlyPayment " & _
                                                "WHERE paymentID = " & paymentID, conn, 1, 3
                        dest = App.Path & "\MonthlyPayment\Seller\MPID" & paymentID & "_Sent.xml"
                        objxml.Recordset2XMLwithoutDTD rcs, dest, ""
                        rcs.Close
                        mdlSendQueue.AddQueue dest, SuserID
                        
                        rcs.Open "SELECT     PaymentID, TotalCharge, " & _
                                                                "(SELECT     Member.BankID " & _
                                                                "FROM          Member " & _
                                                                "WHERE      (Member.ID = 1)) AS FromBankID " & _
                                                "FROM         MonthlyPayment " & _
                                                "WHERE paymentID = " & paymentID, conn, 1, 3
                        dest = App.Path & "\MonthlyPayment\Bank\MPID" & paymentID & "_Sent.xml"
                        objxml.Recordset2XMLwithoutDTD rcs, dest, ""
                        rcs.Close
                        Set rcs = Nothing
                        Set objxml = Nothing
                        Set conn2 = Nothing
                        MsgBox "Create XML Complete"
                        
                        FileName = dest
                        mdlOperation.searchIP_PortfromUID "Bank"
                        mdiMain.WSSend 2
                        Unload Me
        End If
End Sub

Private Sub Form_Load()
        frmMPayment.top = 0
        frmMPayment.Left = 0
        lblDate = Format$(Now, "Short Date")
        txtEndDate = Format$(Now, "Short Date")
        txtStartDate = Format$(DateAdd("m", -1, Now), "Short Date")
        
        Dim rcs As ADODB.Recordset
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        cmbSellerID.Clear
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        rcs.Open "SELECT   ID  FROM  Member where memberType = 's'", conn, 1, 3
        If Not (rcs.BOF) Then rcs.MoveFirst
        Do While Not (rcs.EOF)
                cmbSellerID.AddItem rcs!ID
                rcs.MoveNext
        Loop
        rcs.Close
        Set rcs = Nothing
        
        Set rcsDetail = New ADODB.Recordset

End Sub

Private Sub Form_Unload(Cancel As Integer)
        If rcsDetail.State <> adStateClosed Then
                rcsDetail.Close
        End If
        conn.Close
        Set rcsDetail = Nothing
        Set conn = Nothing
End Sub
