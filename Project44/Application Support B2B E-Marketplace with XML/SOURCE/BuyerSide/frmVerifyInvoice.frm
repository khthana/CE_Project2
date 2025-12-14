VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVerifyInvoice 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Accept Or Reject Invoice"
   ClientHeight    =   7365
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10590
   Icon            =   "frmVerifyInvoice.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7365
   ScaleWidth      =   10590
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   7335
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10575
      Begin VB.ComboBox cmbInvoiceID 
         Height          =   315
         Left            =   1440
         TabIndex        =   16
         Text            =   "Select Invoice ID here"
         Top             =   600
         Width           =   2055
      End
      Begin VB.CommandButton cmdReject 
         Caption         =   "REJECT"
         Height          =   495
         Left            =   1920
         TabIndex        =   15
         Top             =   6360
         Width           =   1335
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "CANCEL"
         Height          =   495
         Left            =   3360
         TabIndex        =   12
         Top             =   6360
         Width           =   1335
      End
      Begin VB.TextBox txtDueDate 
         Enabled         =   0   'False
         Height          =   375
         Left            =   8160
         TabIndex        =   5
         Top             =   570
         Width           =   1575
      End
      Begin VB.CommandButton cmdAccept 
         Caption         =   "ACCEPT"
         Height          =   495
         Left            =   480
         TabIndex        =   2
         Top             =   6360
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid flxData 
         Height          =   3975
         Left            =   120
         TabIndex        =   1
         Top             =   1440
         Width           =   10335
         _ExtentX        =   18230
         _ExtentY        =   7011
         _Version        =   393216
         Rows            =   1
         Cols            =   8
         FixedCols       =   0
      End
      Begin VB.Label lblPONo 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   5400
         TabIndex        =   14
         Top             =   660
         Width           =   135
      End
      Begin VB.Label Label9 
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
         Height          =   255
         Left            =   4200
         TabIndex        =   13
         Top             =   660
         Width           =   855
      End
      Begin VB.Label lblTotal 
         AutoSize        =   -1  'True
         Caption         =   "Total Value"
         Height          =   195
         Left            =   8880
         TabIndex        =   11
         Top             =   6720
         Width           =   840
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "TOTAL"
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
         Left            =   5880
         TabIndex        =   10
         Top             =   6720
         Width           =   600
      End
      Begin VB.Label lblTaxValue 
         AutoSize        =   -1  'True
         Caption         =   "Tax Value"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   8880
         TabIndex        =   9
         Top             =   6240
         Width           =   750
      End
      Begin VB.Label lblSubTotal 
         AutoSize        =   -1  'True
         Caption         =   "Sub Value"
         Height          =   195
         Left            =   8880
         TabIndex        =   8
         Top             =   5760
         Width           =   765
      End
      Begin VB.Label lblvattax 
         AutoSize        =   -1  'True
         Caption         =   "VALUE ADDED TAX"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   5880
         TabIndex        =   7
         Top             =   6240
         Width           =   1725
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "SUB TOTAL"
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
         Left            =   5880
         TabIndex        =   6
         Top             =   5760
         Width           =   1035
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Due Date"
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
         Left            =   7080
         TabIndex        =   4
         Top             =   660
         Width           =   810
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Invoice ID."
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
         TabIndex        =   3
         Top             =   660
         Width           =   945
      End
   End
End
Attribute VB_Name = "frmVerifyInvoice"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const vat = 7
Dim conn As ADODB.Connection
Dim rcs As ADODB.Recordset


Private Sub cmbInvoiceID_Click()
   If Not (rcs.BOF) Then rcs.MoveFirst
        Dim rcsIV As ADODB.Recordset
        Dim sql As String
        Dim row As Integer
        Set rcsIV = New ADODB.Recordset
        
        rcs.Find "InvoiceID = " & cmbInvoiceID.Text
        If rcs.AbsolutePosition <> adPosEOF Then
                txtDueDate.Text = rcs!Duedate
                lblSubTotal.Caption = Format$(rcs!NetAmount, "##,##0.00")
                lblTaxValue.Caption = Format$(rcs!vat, "##,##0.00")
                lblTotal.Caption = Format$(rcs!Totalprice, "##,##0.00")
                lblPONo.Caption = rcs!pono
                
                flxData.Rows = 1
                flxData.Refresh
                sql = "select distinct PROpen.Line, PROpen.OrderSellerItemID, PROpen.OrderName, " & _
                          "PROpen.OrderUnit, PROpen.OrderQTY, PROpen.OrderItemPrice, PROpen.OrderShipprice " & _
                          "from Invoice,  PO, PROpen ,invoiceDetail " & _
                          "where  Invoice.PONO = PO.PONO " & _
                          "and PROpen.PRID = PO.PRID and PROpen.Line = InvoiceDetail.Line and " & _
                          "PO.PONO = invoice.PONO and Invoice.InvoiceID = invoiceDetail.InvoiceID and " & _
                          "invoice.PONO = invoiceDetail.PONO and Invoice.InvoiceID = " & cmbInvoiceID.Text
               rcsIV.Open sql, conn, 1, 3
               row = 1
                If rcsIV.RecordCount > 0 Then
                        If Not (rcsIV.BOF) Then rcsIV.MoveFirst
                        Do While Not (rcsIV.EOF)
                                flxData.AddItem rcsIV!Line, row
                                flxData.TextMatrix(row, 1) = rcsIV!OrderSellerItemID
                                flxData.TextMatrix(row, 2) = rcsIV!OrderName
                                flxData.TextMatrix(row, 3) = rcsIV!OrderUnit
                                flxData.TextMatrix(row, 4) = rcsIV!OrderQTY
                                flxData.TextMatrix(row, 5) = rcsIV!OrderItemPrice
                                flxData.TextMatrix(row, 6) = rcsIV!OrderShipprice
                                flxData.TextMatrix(row, 7) = Format$(rcsIV!OrderQTY * (rcsIV!OrderItemPrice + rcsIV!OrderShipprice), "##,##0.00")
                                row = row + 1
                                rcsIV.MoveNext
                        Loop
                Else
                        MsgBox "This PO Did not Contain any line"
                End If
                rcsIV.Close
               Set rcsIV = Nothing
        Else
                MsgBox "This P.O. ID. Not Found in database." & vbCrLf & "Try Again, Please.", vbExclamation + vbOKOnly, "Warning !!!"
        End If
End Sub

Private Sub cmdCancel_Click()
        Unload Me
End Sub

Private Sub cmdAccept_Click()
        If cmbInvoiceID.Text = "Select Invoice ID here" Then
                MsgBox "Please Select Invoice ID before Accept", vbExclamation + vbOKOnly, "Error !!!"
        ElseIf cmbInvoiceID.Text = "" Then
                MsgBox "Invoice ID is empty"
        Else
                If mdlXML.GenAcceptInvoice(cmbInvoiceID.Text, "") Then
                        MsgBox "Gen Accept Invoice Complete"
                        mdiMain.WSSend 2
                        If mdlXML.GenTSPayment(cmbInvoiceID.Text, "") Then
                                Unload Me
                                MsgBox "Generate Transaction Payment Complete"
                        Else
                                MsgBox "Generate Transaction Payment Error"
                        End If
                Else
                        MsgBox "Gen Accept Invoice Error !!!"
                End If
        End If
End Sub

Private Sub cmdReject_Click()
        If cmbInvoiceID.Text = "Select Invoice ID here" Then
                MsgBox "Please Select Invoice ID before Accept", vbExclamation + vbOKOnly, "Error !!!"
        ElseIf cmbInvoiceID.Text = "" Then
                MsgBox "Invoice ID is empty"
        Else
                frmReject.mode = "IV"
                frmReject.txtPRid = cmbInvoiceID.Text
                Unload Me
                frmReject.Show vbModal
        End If
End Sub

Private Sub Form_Load()
        frmVerifyInvoice.Move 0, 0
        Dim i As Integer
        
        flxData.ColWidth(0) = 800
        flxData.ColWidth(1) = 1000
        flxData.ColWidth(2) = 2800
        flxData.ColWidth(3) = 1000
        flxData.ColWidth(4) = 1000
        flxData.ColWidth(5) = 1200
        flxData.ColWidth(6) = 1200
        flxData.ColWidth(7) = 1200
        
        For i = 0 To 7
                flxData.ColAlignment(i) = flexAlignCenterCenter
        Next
        
        flxData.TextMatrix(0, 0) = "Line No."
        flxData.TextMatrix(0, 1) = "Item ID"
        flxData.TextMatrix(0, 2) = "Description."
        flxData.TextMatrix(0, 3) = "Unit"
        flxData.TextMatrix(0, 4) = "Quantity"
        flxData.TextMatrix(0, 5) = "Item Price/Unit"
        flxData.TextMatrix(0, 6) = "Ship Price/Unit"
        flxData.TextMatrix(0, 7) = "Amount"
        
        Dim sql As String
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        
        conn.ConnectionString = DBconString
        conn.Open
        cmbInvoiceID.clear
        sql = "select distinct InvoiceID, PONO, Duedate, NetAmount,Vat, TotalPrice from Invoice  where Status = """ & SReceive & """"
        rcs.Open sql, conn, 1, 3
        For i = 0 To rcs.RecordCount - 1
                cmbInvoiceID.AddItem rcs!InvoiceID
                rcs.MoveNext
        Next
        lblvattax.Caption = "Value Added Tax " & vat & " %"
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
End Sub
