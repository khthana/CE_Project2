VERSION 5.00
Begin VB.Form frmInvoice 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Generate Invoice"
   ClientHeight    =   9060
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11445
   Icon            =   "frmInvoice.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   9060
   ScaleWidth      =   11445
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame4 
      Height          =   1335
      Left            =   6600
      TabIndex        =   41
      Top             =   7680
      Width           =   4815
      Begin VB.Label lblTotal 
         Alignment       =   1  'Right Justify
         Caption         =   "Total Value"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Left            =   3000
         TabIndex        =   47
         Top             =   960
         Width           =   1170
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         Caption         =   "Total"
         Height          =   195
         Left            =   960
         TabIndex        =   46
         Top             =   960
         Width           =   360
      End
      Begin VB.Label lblTax 
         Alignment       =   1  'Right Justify
         Caption         =   "Tax Value"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   3000
         TabIndex        =   45
         Top             =   600
         Width           =   1170
      End
      Begin VB.Label lblVatTax 
         AutoSize        =   -1  'True
         Caption         =   "Value Added TAX"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   960
         TabIndex        =   44
         Top             =   600
         Width           =   1305
      End
      Begin VB.Label lblSubTotal 
         Alignment       =   1  'Right Justify
         Caption         =   "Sub Total Value"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Left            =   3000
         TabIndex        =   43
         Top             =   240
         Width           =   1170
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         Caption         =   "Sub Total"
         Height          =   195
         Left            =   960
         TabIndex        =   42
         Top             =   240
         Width           =   690
      End
   End
   Begin VB.Frame Frame3 
      Height          =   4815
      Left            =   0
      TabIndex        =   6
      Top             =   2760
      Width           =   11415
      Begin VB.CheckBox chkLine 
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   7
         Top             =   720
         Visible         =   0   'False
         Width           =   285
      End
      Begin VB.Label lblLine 
         AutoSize        =   -1  'True
         Caption         =   "Line"
         Height          =   255
         Index           =   0
         Left            =   638
         TabIndex        =   25
         Top             =   810
         Visible         =   0   'False
         Width           =   405
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Line No."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   480
         TabIndex        =   24
         Top             =   360
         Width           =   720
      End
      Begin VB.Label lblOrderName 
         AutoSize        =   -1  'True
         Caption         =   "OrderName"
         Height          =   195
         Index           =   0
         Left            =   3195
         TabIndex        =   23
         Top             =   810
         Visible         =   0   'False
         Width           =   810
      End
      Begin VB.Label lblSellerItemID 
         AutoSize        =   -1  'True
         Caption         =   "SellerItemID"
         Height          =   195
         Index           =   0
         Left            =   1403
         TabIndex        =   22
         Top             =   810
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblItemPrice 
         AutoSize        =   -1  'True
         Caption         =   "ItemPrice"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Index           =   0
         Left            =   8025
         TabIndex        =   21
         Top             =   810
         Visible         =   0   'False
         Width           =   660
      End
      Begin VB.Label lblShipPrice 
         AutoSize        =   -1  'True
         Caption         =   "ShipPrice"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Index           =   0
         Left            =   9270
         TabIndex        =   20
         Top             =   810
         Visible         =   0   'False
         Width           =   675
      End
      Begin VB.Label lblQTY 
         AutoSize        =   -1  'True
         Caption         =   "QTY"
         Height          =   195
         Index           =   0
         Left            =   7140
         TabIndex        =   19
         Top             =   810
         Visible         =   0   'False
         Width           =   330
      End
      Begin VB.Label lblAmount 
         AutoSize        =   -1  'True
         Caption         =   "Amount"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Index           =   0
         Left            =   10485
         TabIndex        =   18
         Top             =   810
         Visible         =   0   'False
         Width           =   540
      End
      Begin VB.Label lblNeedDate 
         AutoSize        =   -1  'True
         Caption         =   "Need Date"
         Height          =   195
         Index           =   0
         Left            =   5220
         TabIndex        =   17
         Top             =   810
         Visible         =   0   'False
         Width           =   780
      End
      Begin VB.Label lblUnit 
         AutoSize        =   -1  'True
         Caption         =   "Unit"
         Height          =   195
         Index           =   0
         Left            =   6405
         TabIndex        =   16
         Top             =   810
         Visible         =   0   'False
         Width           =   285
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Product No."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   1320
         TabIndex        =   15
         Top             =   360
         Width           =   1020
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Description"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   3120
         TabIndex        =   14
         Top             =   360
         Width           =   960
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "U/M"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   6360
         TabIndex        =   13
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "Need Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   5160
         TabIndex        =   12
         Top             =   360
         Width           =   915
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Quantity"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   6960
         TabIndex        =   11
         Top             =   360
         Width           =   705
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "Price/Unit"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   7920
         TabIndex        =   10
         Top             =   360
         Width           =   870
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "Amount"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   10440
         TabIndex        =   9
         Top             =   360
         Width           =   630
      End
      Begin VB.Label Label10 
         Caption         =   "ShipPrice/Unit"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   9000
         TabIndex        =   8
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame2 
      Height          =   1335
      Left            =   0
      TabIndex        =   3
      Top             =   7680
      Width           =   6495
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Add To Invoice"
         Enabled         =   0   'False
         Height          =   735
         Left            =   1440
         TabIndex        =   48
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdGenInvoice 
         Caption         =   "Generate Invoice"
         Height          =   735
         Left            =   4440
         TabIndex        =   40
         Top             =   360
         Width           =   1815
      End
      Begin VB.CommandButton cmdNext 
         Caption         =   "Next"
         Enabled         =   0   'False
         Height          =   735
         Left            =   3000
         TabIndex        =   5
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdPrevious 
         Caption         =   "Previous"
         Enabled         =   0   'False
         Height          =   735
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Height          =   2655
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11415
      Begin VB.ComboBox cmbPOID 
         Height          =   315
         Left            =   1080
         TabIndex        =   2
         Top             =   360
         Width           =   2655
      End
      Begin VB.Label Label21 
         Caption         =   "P.O. Business Name"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   240
         TabIndex        =   52
         Top             =   1440
         Width           =   735
      End
      Begin VB.Label lblPoBizName 
         BorderStyle     =   1  'Fixed Single
         Height          =   975
         Left            =   1080
         TabIndex        =   51
         Top             =   1440
         Width           =   2655
      End
      Begin VB.Label lblPONo 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   1080
         TabIndex        =   50
         Top             =   960
         Width           =   135
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         Caption         =   "P.O. No."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   240
         TabIndex        =   49
         Top             =   960
         Width           =   735
      End
      Begin VB.Label lblPOTotalPrice 
         Alignment       =   1  'Right Justify
         Caption         =   "0"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Left            =   9960
         TabIndex        =   39
         Top             =   2160
         Width           =   810
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         Caption         =   "Total Price"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   8280
         TabIndex        =   38
         Top             =   2160
         Width           =   930
      End
      Begin VB.Label lblPOItemPrice 
         Alignment       =   1  'Right Justify
         Caption         =   "0"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Left            =   9960
         TabIndex        =   37
         Top             =   1680
         Width           =   810
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         Caption         =   "Item Price"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   8280
         TabIndex        =   36
         Top             =   1680
         Width           =   855
      End
      Begin VB.Label lblPOShipPrice 
         Alignment       =   1  'Right Justify
         Caption         =   "0"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   """ß""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1054
            SubFormatType   =   2
         EndProperty
         Height          =   195
         Left            =   9960
         TabIndex        =   35
         Top             =   1200
         Width           =   810
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         Caption         =   "Ship Price"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   8280
         TabIndex        =   34
         Top             =   1200
         Width           =   870
      End
      Begin VB.Label lblPOAddress 
         BorderStyle     =   1  'Fixed Single
         Height          =   975
         Left            =   5160
         TabIndex        =   33
         Top             =   1440
         Width           =   2655
      End
      Begin VB.Label Label14 
         Caption         =   "P.O. Business Address"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   675
         Left            =   4080
         TabIndex        =   32
         Top             =   1440
         Width           =   840
      End
      Begin VB.Label lblOrderNo 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   5160
         TabIndex        =   31
         Top             =   360
         Width           =   135
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "Order No."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   4080
         TabIndex        =   30
         Top             =   360
         Width           =   825
      End
      Begin VB.Label lblPOTerm 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   5160
         TabIndex        =   29
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "Term"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   4080
         TabIndex        =   28
         Top             =   960
         Width           =   420
      End
      Begin VB.Label lblPODate 
         Alignment       =   1  'Right Justify
         Caption         =   "..."
         Height          =   195
         Left            =   9960
         TabIndex        =   27
         Top             =   360
         Width           =   810
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "Open Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   8280
         TabIndex        =   26
         Top             =   360
         Width           =   915
      End
      Begin VB.Label Label1 
         Caption         =   "P.O. ID"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmInvoice"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const MaxLine = 7
Const Gap = 500
Const Vat = 7
Dim Indexs As Integer
Dim page As Integer
Dim row As Integer
Dim Status(MaxLine) As Boolean
Dim conn As ADODB.Connection
Dim rcs As ADODB.Recordset
Dim rcsPOid As ADODB.Recordset
Dim Total As Double
Dim Flag As Boolean
Dim buyerBizName As String
Dim buyerBizAddress As String
Dim term As Integer

Private Sub chkLine_Click(index As Integer)
        If chkLine(index).value Then
                Total = Total + CDbl(lblAmount(index).Caption)
        Else
                Total = Total - CDbl(lblAmount(index).Caption)
        End If
        ShowValue
End Sub

Private Sub cmbPOID_Click()
        If Not (rcs.BOF) Then rcs.MoveFirst
        rcs.Find "POID = " & cmbPOID.Text
        If rcs.AbsolutePosition <> adPosEOF Then
                rcsPOid.Open "select BuyerAddress,BuyerBizName,Bizname,POAddress  from PO where POID = """ & cmbPOID.Text & """", conn, 1, 3
                        lblPOAddress.Caption = rcsPOid!poaddress
                        lblPoBizName.Caption = rcsPOid!BizName
                        If Not (IsNull(rcsPOid!buyerBizName)) Then buyerBizName = rcsPOid!buyerBizName
                        If Not (IsNull(rcsPOid!buyeraddress)) Then buyerBizAddress = rcsPOid!buyeraddress
                rcsPOid.Close
                lblPOTerm.Caption = rcs!POTerm & "   day"
                term = rcs!POTerm
                lblPODate.Caption = rcs!PODate
                lblPOShipPrice.Caption = Format$(rcs!POShipprice, "##,##0.00")
                lblPOItemPrice.Caption = Format$(rcs!POitemprice, "##,##0.00")
                If Not (IsNull(rcs!pono)) Then
                        lblPONo.Caption = rcs!pono
                Else
                        lblPONo.Caption = "..."
                End If
                lblOrderNo.Caption = rcs!OrderNo
                lblPOTotalPrice.Caption = Format$(rcs!POShipprice + rcs!POitemprice, "##,##0.00")
                
                cmdPrevious.Enabled = False
                cmdNext.Enabled = False
                cmdAdd.Enabled = False
                row = 1
                Flag = False
                
                ClearAll
                rcsPOid.Open "select * from PO where POID = """ & cmbPOID.Text & """", conn, 1, 3
                If rcsPOid.RecordCount > 0 Then
                        If Not (rcsPOid.BOF) Then rcsPOid.MoveFirst
                        Do While Not (rcsPOid.EOF)
                                AddLine
                                rcsPOid.MoveNext
                        Loop
                Else
                        MsgBox "This PO Did not Contain any line"
                End If
                rcsPOid.Close
               
        Else
                MsgBox "This P.O. ID. Not Found in database." & vbCrLf & "Try Again, Please.", vbExclamation + vbOKOnly, "Warning !!!"
        End If
End Sub


Private Sub cmdAdd_Click()
        Dim i As Integer
        
        Dim amount As Double
        With frmInvoiceConfirm
                For i = 0 To Indexs - 1
                        If chkLine(i).value Then
                                .AddLineNo row, lblLine(i).Caption
                                .AddProductNo row, lblSellerItemID(i).Caption
                                .AddDescription row, lblOrderName(i).Caption
                                .AddUnit row, lblUnit(i).Caption
                                .AddQTY row, lblQTY(i).Caption
                                .AddItemPrice row, lblItemPrice(i).Caption
                                .AddShipPrice row, lblShipPrice(i).Caption
                                .AddAmount row, lblAmount(i).Caption
                                row = row + 1
                        End If
                Next
        End With
End Sub

Private Sub cmdGenInvoice_Click()
        Dim i As Integer
        Dim row As Integer
        Dim amount As Double
        row = 1
        With frmInvoiceConfirm
                If Not (Flag) Then
                        For i = 0 To Indexs - 1
                                If chkLine(i).value Then
                                        .AddLineNo row, lblLine(i).Caption
                                        .AddProductNo row, lblSellerItemID(i).Caption
                                        .AddDescription row, lblOrderName(i).Caption
                                        .AddUnit row, lblUnit(i).Caption
                                        .AddQTY row, lblQTY(i).Caption
                                        .AddItemPrice row, lblItemPrice(i).Caption
                                        .AddShipPrice row, lblShipPrice(i).Caption
                                        .AddAmount row, lblAmount(i).Caption
                                        row = row + 1
                                        Flag = True
                                End If
                        Next
                End If
                .index = row - 1
                .poid = cmbPOID.Text
                .SetCustomerName buyerBizName
                .SetAddress buyerBizAddress
                .SetPONo lblPONo.Caption
                .SetSubTotal lblSubTotal.Caption
                .SetTotal lblTotal.Caption
                .SetVat Str(Vat) & " %", lblTax.Caption
                .SetDueDate Format$(DateAdd("d", term, Date), "short date")
                frmInvoiceConfirm.Show
                Unload Me
        End With
End Sub

Private Sub cmdNext_Click()
        Dim i As Integer
        Dim count As Integer
        
        count = (page * (MaxLine + 1))
        page = page + 1
        If page > 1 Then
                cmdPrevious.Enabled = True
        Else
                cmdPrevious.Enabled = False
        End If
        ClearAll
        
        rcsPOid.Open "select * from PO where POID = """ & cmbPOID.Text & """", conn, 1, 3
                If rcsPOid.RecordCount > 0 Then
                        If Not (rcsPOid.BOF) Then rcsPOid.MoveFirst
                        For i = 1 To count
                                rcsPOid.MoveNext
                        Next
                        Do While Not (rcsPOid.EOF)
                                AddLine
                                rcsPOid.MoveNext
                        Loop
               End If
        If count + (MaxLine + 1) >= rcsPOid.RecordCount Then cmdNext.Enabled = False
       rcsPOid.Close
        
        If cmdNext.Enabled = False And cmdPrevious.Enabled = False Then
                cmdAdd.Enabled = False
        Else
                cmdAdd.Enabled = True
        End If
        
End Sub

Private Sub cmdPrevious_Click()
        Dim i As Integer
        Dim count As Integer
        page = page - 1
        count = ((page - 1) * (MaxLine + 1))
        If page > 1 Then
                cmdNext.Enabled = True
        Else
                cmdNext.Enabled = False
        End If
       If count = 0 Then cmdPrevious.Enabled = False
        If cmdNext.Enabled = False And cmdPrevious.Enabled = False Then
                cmdAdd.Enabled = False
        Else
                cmdAdd.Enabled = True
        End If
        
        ClearAll
        rcsPOid.Open "select * from PO where POID = """ & cmbPOID.Text & """", conn, 1, 3
                If rcsPOid.RecordCount > 0 Then
                        If Not (rcsPOid.BOF) Then rcsPOid.MoveFirst
                        For i = 1 To count
                                rcsPOid.MoveNext
                        Next
                        Do While Not (rcsPOid.EOF)
                                AddLine
                                rcsPOid.MoveNext
                        Loop
               End If
       rcsPOid.Close
End Sub

Private Sub Form_Load()
        frmInvoice.Move 0, 0
        Dim i As Long
        Dim sql As String
        Total = 0
        Indexs = 0
        page = 1
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        Set rcsPOid = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.Open
        cmbPOID.clear
        sql = "select distinct POID, PONO, PODate, POTerm,  POShipPrice, POItemPrice, OrderNo " & _
                  "from PO where POStatus = """ & SAccept & """ or POStatus = """ & SPartial & """ " & _
                  "or POStatus = """ & SDeliver & """"
        rcs.Open sql, conn, 1, 3
        For i = 0 To rcs.RecordCount - 1
                cmbPOID.AddItem rcs!poid
                rcs.MoveNext
        Next
        For i = 0 To MaxLine
                Status(i) = False
        Next
        lblvattax.Caption = "Value Added Tax " & Vat & " %"
        ShowValue
End Sub

Private Sub Form_Unload(Cancel As Integer)
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set rcsPOid = Nothing
        Set conn = Nothing
End Sub


Private Sub AddLine()
        If Indexs = 0 Then
                SetValue
                chkLine(Indexs).Visible = True
                lblLine(Indexs).Visible = True
                lblSellerItemID(Indexs).Visible = True
                lblOrderName(Indexs).Visible = True
                lblNeedDate(Indexs).Visible = True
                lblUnit(Indexs).Visible = True
                lblQTY(Indexs).Visible = True
                lblItemPrice(Indexs).Visible = True
                lblShipPrice(Indexs).Visible = True
                lblAmount(Indexs).Visible = True
                                
                Status(Indexs) = True
                Indexs = Indexs + 1
        ElseIf Indexs < MaxLine Then
                If Status(Indexs) Then
                        chkLine(Indexs).Visible = True
                        lblLine(Indexs).Visible = True
                        lblSellerItemID(Indexs).Visible = True
                        lblOrderName(Indexs).Visible = True
                        lblNeedDate(Indexs).Visible = True
                        lblUnit(Indexs).Visible = True
                        lblQTY(Indexs).Visible = True
                        lblItemPrice(Indexs).Visible = True
                        lblShipPrice(Indexs).Visible = True
                        lblAmount(Indexs).Visible = True
                Else
                        Load chkLine(Indexs)
                        Load lblLine(Indexs)
                        Load lblSellerItemID(Indexs)
                        Load lblOrderName(Indexs)
                        Load lblNeedDate(Indexs)
                        Load lblUnit(Indexs)
                        Load lblQTY(Indexs)
                        Load lblItemPrice(Indexs)
                        Load lblShipPrice(Indexs)
                        Load lblAmount(Indexs)
                        
                        chkLine(Indexs).Visible = True
                        lblLine(Indexs).Visible = True
                        lblSellerItemID(Indexs).Visible = True
                        lblOrderName(Indexs).Visible = True
                        lblNeedDate(Indexs).Visible = True
                        lblUnit(Indexs).Visible = True
                        lblQTY(Indexs).Visible = True
                        lblItemPrice(Indexs).Visible = True
                        lblShipPrice(Indexs).Visible = True
                        lblAmount(Indexs).Visible = True
                End If
                
                Status(Indexs) = True
                chkLine(Indexs).top = chkLine(Indexs - 1).top + Gap
                lblLine(Indexs).top = lblLine(Indexs - 1).top + Gap
                lblSellerItemID(Indexs).top = lblSellerItemID(Indexs - 1).top + Gap
                lblOrderName(Indexs).top = lblOrderName(Indexs - 1).top + Gap
                lblNeedDate(Indexs).top = lblNeedDate(Indexs - 1).top + Gap
                lblUnit(Indexs).top = lblUnit(Indexs - 1).top + Gap
                lblQTY(Indexs).top = lblQTY(Indexs - 1).top + Gap
                lblItemPrice(Indexs).top = lblItemPrice(Indexs - 1).top + Gap
                lblShipPrice(Indexs).top = lblShipPrice(Indexs - 1).top + Gap
                lblAmount(Indexs).top = lblAmount(Indexs - 1).top + Gap
                
                SetValue
                Indexs = Indexs + 1
        ElseIf Indexs = MaxLine Then
                If Status(Indexs) Then
                        chkLine(Indexs).Visible = True
                        lblLine(Indexs).Visible = True
                        lblSellerItemID(Indexs).Visible = True
                        lblOrderName(Indexs).Visible = True
                        lblNeedDate(Indexs).Visible = True
                        lblUnit(Indexs).Visible = True
                        lblQTY(Indexs).Visible = True
                        lblItemPrice(Indexs).Visible = True
                        lblShipPrice(Indexs).Visible = True
                        lblAmount(Indexs).Visible = True
                Else
                        Load chkLine(Indexs)
                        Load lblLine(Indexs)
                        Load lblSellerItemID(Indexs)
                        Load lblOrderName(Indexs)
                        Load lblNeedDate(Indexs)
                        Load lblUnit(Indexs)
                        Load lblQTY(Indexs)
                        Load lblItemPrice(Indexs)
                        Load lblShipPrice(Indexs)
                        Load lblAmount(Indexs)
                        
                        chkLine(Indexs).Visible = True
                        lblLine(Indexs).Visible = True
                        lblSellerItemID(Indexs).Visible = True
                        lblOrderName(Indexs).Visible = True
                        lblNeedDate(Indexs).Visible = True
                        lblUnit(Indexs).Visible = True
                        lblQTY(Indexs).Visible = True
                        lblItemPrice(Indexs).Visible = True
                        lblShipPrice(Indexs).Visible = True
                        lblAmount(Indexs).Visible = True
                End If
                
                Status(Indexs) = True
                
                chkLine(Indexs).top = chkLine(Indexs - 1).top + Gap
                lblLine(Indexs).top = lblLine(Indexs - 1).top + Gap
                lblSellerItemID(Indexs).top = lblSellerItemID(Indexs - 1).top + Gap
                lblOrderName(Indexs).top = lblOrderName(Indexs - 1).top + Gap
                lblNeedDate(Indexs).top = lblNeedDate(Indexs - 1).top + Gap
                lblUnit(Indexs).top = lblUnit(Indexs - 1).top + Gap
                lblQTY(Indexs).top = lblQTY(Indexs - 1).top + Gap
                lblItemPrice(Indexs).top = lblItemPrice(Indexs - 1).top + Gap
                lblShipPrice(Indexs).top = lblShipPrice(Indexs - 1).top + Gap
                lblAmount(Indexs).top = lblAmount(Indexs - 1).top + Gap
                
                SetValue
                Indexs = Indexs + 1
                
                cmdNext.Enabled = True
                cmdAdd.Enabled = True
                'MsgBox "next"
        'Else
                'MsgBox "indexs Error"
        End If
End Sub

Private Sub RemoveLine()
        If Indexs > 0 Then
                Indexs = Indexs - 1
                chkLine(Indexs).value = 0
                chkLine(Indexs).Visible = False
                lblLine(Indexs).Visible = False
                lblSellerItemID(Indexs).Visible = False
                lblOrderName(Indexs).Visible = False
                lblNeedDate(Indexs).Visible = False
                lblUnit(Indexs).Visible = False
                lblQTY(Indexs).Visible = False
                lblItemPrice(Indexs).Visible = False
                lblShipPrice(Indexs).Visible = False
                lblAmount(Indexs).Visible = False
        Else
                MsgBox "indexs Error"
        End If
End Sub

Private Sub SetValue()
        If rcsPOid!GenInvoice Then
                chkLine(Indexs).Enabled = False
        Else
                chkLine(Indexs).Enabled = True
        End If
            
        lblLine(Indexs).Caption = rcsPOid!Line
        lblSellerItemID(Indexs).Caption = rcsPOid!OrderSellerItemID
        lblOrderName(Indexs).Caption = rcsPOid!OrderName
        lblNeedDate(Indexs).Caption = rcsPOid!needdate
        lblUnit(Indexs).Caption = rcsPOid!OrderUnit
        lblQTY(Indexs).Caption = rcsPOid!OrderQTY
        lblItemPrice(Indexs).Caption = Format$(rcsPOid!OrderItemPrice, "##,##0.00")
        lblShipPrice(Indexs).Caption = Format$(rcsPOid!OrderShipprice, "##,##0.00")
        lblAmount(Indexs).Caption = Format$(rcsPOid!OrderQTY * (rcsPOid!OrderItemPrice + rcsPOid!OrderShipprice), "##,##0.00")
End Sub

Private Sub ClearAll()
        Do While Indexs > 0
                RemoveLine
        Loop
        Total = 0
        ShowValue
End Sub

Private Sub unloadAllLine()
        Dim i As Integer
        For i = 0 To MaxLine
                If Status(i) Then
                        Unload chkLine(i)
                        Unload lblLine(i)
                        Unload lblSellerItemID(i)
                        Unload lblOrderName(i)
                        Unload lblNeedDate(i)
                        Unload lblQTY(i)
                        Unload lblShipPrice(i)
                        Unload lblItemPrice(i)
                        Unload lblAmount(i)
                        Status(i) = False
                End If
        Next
End Sub

Private Sub ShowValue()
        Dim vatvalue As Double
        Dim vatstr As String
        vatvalue = (Vat * Total) / 100
        vatstr = Format$(vatvalue, "##,##0.00")
        lblSubTotal.Caption = Format$(Total - CDbl(vatstr), "##,##0.00")
        lblTax.Caption = vatstr
        lblTotal.Caption = Format$(Total, "##,##0.00")
End Sub
