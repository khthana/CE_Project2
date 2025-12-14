VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmPartnerPayment 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Partner Payment"
   ClientHeight    =   8610
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   12030
   Icon            =   "frmPartnerPayment.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8610
   ScaleWidth      =   12030
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame4 
      Height          =   1095
      Left            =   7200
      TabIndex        =   20
      Top             =   7440
      Width           =   4815
      Begin VB.Label lblTotalPayment 
         Alignment       =   1  'Right Justify
         Caption         =   "..."
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   2640
         TabIndex        =   22
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label lblPayment 
         AutoSize        =   -1  'True
         Caption         =   "Total Ship Payment"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   840
         TabIndex        =   21
         Top             =   480
         Width           =   1380
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Detail"
      Height          =   4095
      Left            =   0
      TabIndex        =   18
      Top             =   3240
      Width           =   12015
      Begin MSDataGridLib.DataGrid dtgDetail 
         Height          =   3375
         Left            =   180
         TabIndex        =   19
         Top             =   360
         Width           =   11655
         _ExtentX        =   20558
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
   Begin VB.Frame Frame3 
      Height          =   1095
      Left            =   0
      TabIndex        =   14
      Top             =   7440
      Width           =   7095
      Begin VB.CommandButton cmdSendToBank 
         Caption         =   "Send To Bank"
         Height          =   495
         Left            =   2160
         TabIndex        =   17
         Top             =   360
         Width           =   1815
      End
      Begin VB.CommandButton cmdQuery 
         Caption         =   "Query"
         Height          =   495
         Left            =   240
         TabIndex        =   16
         Top             =   360
         Width           =   1815
      End
      Begin VB.CommandButton cmdClose 
         Caption         =   "Close"
         Height          =   495
         Left            =   5040
         TabIndex        =   15
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Seller Information"
      Height          =   3135
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12015
      Begin VB.ComboBox cmbShipMethod 
         Height          =   315
         Left            =   5520
         TabIndex        =   23
         Top             =   1080
         Width           =   2775
      End
      Begin VB.TextBox txtStartDate 
         Height          =   350
         Left            =   10200
         TabIndex        =   3
         Top             =   1650
         Width           =   1455
      End
      Begin VB.TextBox txtEndDate 
         Height          =   350
         Left            =   10200
         TabIndex        =   2
         Top             =   2325
         Width           =   1455
      End
      Begin VB.ComboBox cmbSellerID 
         Height          =   315
         Left            =   1320
         TabIndex        =   1
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Ship Method"
         Height          =   195
         Left            =   4440
         TabIndex        =   24
         Top             =   1125
         Width           =   900
      End
      Begin VB.Label Label3 
         Caption         =   "Seller ID"
         Height          =   255
         Left            =   360
         TabIndex        =   13
         Top             =   1125
         Width           =   735
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Partner Payment"
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
         Left            =   4568
         TabIndex        =   12
         Top             =   240
         Width           =   2895
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Current Date"
         Height          =   195
         Left            =   8880
         TabIndex        =   11
         Top             =   1080
         Width           =   900
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Start Date"
         Height          =   195
         Left            =   8880
         TabIndex        =   10
         Top             =   1800
         Width           =   720
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "End Date"
         Height          =   195
         Left            =   8880
         TabIndex        =   9
         Top             =   2400
         Width           =   675
      End
      Begin VB.Label lblDate 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   10200
         TabIndex        =   8
         Top             =   1080
         Width           =   135
      End
      Begin VB.Label lblName 
         BorderStyle     =   1  'Fixed Single
         Height          =   855
         Left            =   1320
         TabIndex        =   7
         Top             =   1800
         Width           =   2775
      End
      Begin VB.Label lblAddress 
         BorderStyle     =   1  'Fixed Single
         Height          =   855
         Left            =   5520
         TabIndex        =   6
         Top             =   1800
         Width           =   2775
      End
      Begin VB.Label Label11 
         Caption         =   "Business Name"
         Height          =   495
         Left            =   360
         TabIndex        =   5
         Top             =   1800
         Width           =   735
      End
      Begin VB.Label Label12 
         Caption         =   "Business Address"
         Height          =   495
         Left            =   4680
         TabIndex        =   4
         Top             =   1800
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmPartnerPayment"
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
        
        If cmbSellerID.Text = "" Then
                MsgBox "Please Select Seller ID Before Query "
        Else
                        If rcsDetail.State <> adStateClosed Then rcsDetail.Close
                        startdate = Format$(DateValue(txtStartDate.Text), "mm/dd/yy")
                        enddate = Format$(DateAdd("d", 1, DateValue(txtEndDate.Text)), "mm/dd/yy")
                        rcsDetail.Open "SELECT    PO.POID , PO.PONO ,PO.SellerOrderNo , PRShipPrice , " & _
                                                                                "PO.POFullDate , PO.UpdateDate , PO.POstatus " & _
                                                        "FROM         PO INNER JOIN " & _
                                                                                "PR ON PO.PRID = PR.PRID " & _
                                                        "WHERE     (PR.SellerID = " & cmbSellerID.Text & ") AND (PO.POstatus = '" & SAccept & "' OR " & _
                                                                                "PO.POstatus = '" & SDeliver & "' OR " & _
                                                                                "PO.POstatus = '" & SPartial & "') AND (PO.UpdateDate BETWEEN '" & startdate & _
                                                                                "' AND '" & enddate & "') and PR.shipmethod = '" & cmbShipMethod.Text & "'", conn, 1, 3
                        Set dtgDetail.DataSource = rcsDetail
                        dtgDetail.Refresh
                                totalpayment = 0
                                If Not (rcsDetail.BOF) Then rcsDetail.MoveFirst
                                Do While Not (rcsDetail.EOF)
                                        totalpayment = totalpayment + rcsDetail!PRShipPrice
                                        rcsDetail.MoveNext
                                Loop
                                lblTotalPayment.Caption = Format$(totalpayment, "##,##0.00")
        End If
End Sub


Private Sub cmdSendToBank_Click()
        Dim rcs As ADODB.Recordset
        Dim paymentID As String
        Dim SuserID As String
        Dim senderID As String
        
        If cmbSellerID.Text = "" Then
                MsgBox "Please Select Seller ID Before Send Monthly Payment to Bank"
        ElseIf lblTotalPayment.Caption = "0.00" Then
                MsgBox "This Seller ID did not have any charge for this month"
        Else
                        Set rcs = New ADODB.Recordset
                        rcs.Open "select max(PaymentID) as maxID from PartnerPayment", conn, 1, 3
                        If IsNull(rcs!maxid) Then
                                paymentID = "1"
                        Else
                                paymentID = rcs!maxid + 1
                        End If
                        rcs.Close
                        rcs.Open "PartnerPayment", conn, 1, 3
                        rcs.AddNew
                                rcs!paymentID = paymentID
                                rcs!totalshipprice = lblTotalPayment.Caption
                                rcs!startdate = txtStartDate.Text
                                rcs!enddate = txtEndDate.Text
                                rcs!createdate = Now
                                rcs!Partner = cmbShipMethod.Text
                        rcs.Update
                        rcs.Close
                        MsgBox "Update Database Complete"
                        
                        '---------------- Update PartnerPaymentDetail -------------------
                        If Not (rcsDetail.BOF) Then rcsDetail.MoveFirst
                        Do While Not (rcsDetail.EOF)
                                conn.Execute "delete from PartnerPaymentDetail where paymentid = " & paymentID & _
                                                           " and poid = " & rcsDetail!poid
                                rcsDetail.MoveNext
                        Loop
                        
                        If Not (rcsDetail.BOF) Then rcsDetail.MoveFirst
                        rcs.Open "PartnerPaymentDetail", conn, 1, 3
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
                        Set conn2 = New ADODB.Connection
                        Set objxml = New XML
                        objxml.SetRootName = "MonthlyPayment"
                        objxml.SetSubRootName = "Manager_Market"
                        objxml.SetStatus = "Partner"
                        Select Case cmbShipMethod.Text
                                Case "EMS"
                                        SuserID = "CAT"
                                Case "FedEx"
                                        SuserID = "FedEx"
                        End Select
                        
                        conn2 = conString
                        conn2.Open
                        rcs.Open "select userid from publickey where memberid = " & cmbSellerID, conn2, 1, 3
                                senderID = rcs!Userid
                        rcs.Close
                        conn2.Close
                        Set conn2 = Nothing
                                                        
                        rcs.Open "SELECT     PaymentID, TotalShipPrice, StartDate , EndDate, " & _
                                                                        "(SELECT     PartnerName " & _
                                                                        "From PartnerBankID " & _
                                                                        "WHERE     (PartnerName = '" & SuserID & "')) as Partner " & _
                                                "FROM         PartnerPayment " & _
                                                "WHERE paymentID = " & paymentID, conn, 1, 3
                        dest = App.Path & "\MonthlyPayment\Seller\PNID" & paymentID & "_Sent.xml"
                        objxml.Recordset2XMLwithoutDTD rcs, dest, ""
                        rcs.Close
                        mdlSendQueue.AddQueue dest, senderID
                        
                        rcs.Open "SELECT     PaymentID, TotalShipPrice, " & _
                                                                "(SELECT     Member.BankID " & _
                                                                "FROM          Member " & _
                                                                "WHERE      (Member.ID = 1)) AS FromBankID, " & _
                                                                "(SELECT     BankID " & _
                                                                "From PartnerBankID " & _
                                                                "WHERE     (PartnerName = '" & SuserID & "')) as ToBankID " & _
                                                "FROM         PartnerPayment " & _
                                                "WHERE paymentID = " & paymentID, conn, 1, 3
                        dest = App.Path & "\MonthlyPayment\Bank\PNID" & paymentID & "_Sent.xml"
                        objxml.Recordset2XMLwithoutDTD rcs, dest, ""
                        rcs.Close
                        Set rcs = Nothing
                        Set objxml = Nothing
                        MsgBox "Create XML Complete"
                        
                        FileName = dest
                        mdlOperation.searchIP_PortfromUID "Bank"
                        mdiMain.WSSend 2
                        Unload Me
        End If
End Sub

Private Sub Form_Load()
        frmPartnerPayment.top = 0
        frmPartnerPayment.Left = 0
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
        
        cmbShipMethod.AddItem "EMS"
        cmbShipMethod.AddItem "FedEx"
        cmbShipMethod.Text = "EMS"
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


