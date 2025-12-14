VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmInvoiceConfirm 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "TAX   INVOICE"
   ClientHeight    =   8805
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10590
   Icon            =   "frmInvoiceConfirm.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8805
   ScaleWidth      =   10590
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   8775
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10575
      Begin VB.TextBox txtBizName 
         Enabled         =   0   'False
         Height          =   975
         Left            =   1440
         MultiLine       =   -1  'True
         TabIndex        =   20
         Top             =   1440
         Width           =   2895
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "CANCEL"
         Height          =   495
         Left            =   2040
         TabIndex        =   19
         Top             =   7920
         Width           =   1335
      End
      Begin VB.TextBox txtSaleManNo 
         Height          =   375
         Left            =   2040
         TabIndex        =   11
         Top             =   6960
         Width           =   1575
      End
      Begin VB.TextBox txtDueDate 
         Height          =   375
         Left            =   1440
         TabIndex        =   10
         Top             =   720
         Width           =   1695
      End
      Begin VB.TextBox txtAddress 
         Enabled         =   0   'False
         Height          =   975
         Left            =   6240
         MultiLine       =   -1  'True
         TabIndex        =   6
         Top             =   1440
         Width           =   2895
      End
      Begin VB.CommandButton cmdConfirm 
         Caption         =   "CONFIRM"
         Height          =   495
         Left            =   480
         TabIndex        =   2
         Top             =   7920
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid flxData 
         Height          =   3975
         Left            =   135
         TabIndex        =   1
         Top             =   2760
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
         Left            =   6240
         TabIndex        =   23
         Top             =   360
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
         Left            =   5160
         TabIndex        =   22
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label7 
         Caption         =   "Customer Name"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   21
         Top             =   1440
         Width           =   735
      End
      Begin VB.Label lblTotal 
         AutoSize        =   -1  'True
         Caption         =   "Total Value"
         Height          =   195
         Left            =   8640
         TabIndex        =   18
         Top             =   8040
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
         TabIndex        =   17
         Top             =   8040
         Width           =   600
      End
      Begin VB.Label lblTaxValue 
         AutoSize        =   -1  'True
         Caption         =   "Tax Value"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   8640
         TabIndex        =   16
         Top             =   7560
         Width           =   750
      End
      Begin VB.Label lblSubTotal 
         AutoSize        =   -1  'True
         Caption         =   "Sub Value"
         Height          =   195
         Left            =   8640
         TabIndex        =   15
         Top             =   7080
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
         TabIndex        =   14
         Top             =   7560
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
         TabIndex        =   13
         Top             =   7080
         Width           =   1035
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Sale Man No."
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
         Left            =   600
         TabIndex        =   12
         Top             =   7080
         Width           =   1155
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
         Left            =   240
         TabIndex        =   9
         Top             =   840
         Width           =   810
      End
      Begin VB.Label lblDate 
         AutoSize        =   -1  'True
         Caption         =   "lblDate"
         Height          =   195
         Left            =   6240
         TabIndex        =   8
         Top             =   840
         Width           =   495
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Date"
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
         TabIndex        =   7
         Top             =   840
         Width           =   405
      End
      Begin VB.Label Label2 
         Caption         =   "Customer Address"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   5160
         TabIndex        =   5
         Top             =   1440
         Width           =   915
      End
      Begin VB.Label lblInvoiceNo 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   1440
         TabIndex        =   4
         Top             =   360
         Width           =   135
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Invoice No."
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
         Top             =   360
         Width           =   990
      End
   End
End
Attribute VB_Name = "frmInvoiceConfirm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public poid As String
Public index As Integer

Private Sub cmdCancel_Click()
        Unload Me
End Sub

Private Sub cmdConfirm_Click()
        If txtAddress.Text = "" Then
                MsgBox "Address Is Empty", vbExclamation + vbOKOnly, "Error !!!"
        ElseIf txtDueDate.Text = "" Then
                MsgBox "Due Date Is Empty", vbExclamation + vbOKOnly, "Error !!!"
        Else
                Dim conn As ADODB.Connection
                Dim rcs As ADODB.Recordset
                Dim i As Integer
                Dim test As Boolean
        
                '----------- Update Invoice Table -------------
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                conn.ConnectionString = DBconString
                conn.Open
                rcs.Open "Invoice", conn, 1, 3
                rcs.AddNew
                        rcs!InvoiceNo = lblInvoiceNo.Caption
                        rcs!NetAmount = lblSubTotal.Caption
                        rcs!Vat = lblTaxValue.Caption
                        rcs!TotalPrice = lblTotal.Caption
                        rcs!Address = txtAddress.Text
                        rcs!DueDate = txtDueDate.Text
                        rcs!CustomerName = txtBizName.Text
                        rcs!OpenDate = lblDate.Caption
                        If txtSaleManNo.Text <> "" Then rcs!salemanno = txtSaleManNo.Text
                rcs.Update
                rcs.Close
                
                '-------------- Update Invoice Detail Table --------------
                rcs.Open "InvoiceDetail", conn, 1, 3
                For i = 1 To index
                        rcs.AddNew
                                rcs!InvoiceNo = lblInvoiceNo.Caption
                                rcs!poid = poid
                                rcs!Line = flxData.TextMatrix(i, 0)
                        rcs.Update
                Next
                rcs.Close
                
                '--------------- Update PO Table ------------------
                rcs.Open "select * from PO where poid = """ & poid & """", conn, 1, 3
                If rcs.RecordCount > 0 Then
                        For i = 1 To index
                                If Not (rcs.BOF) Then rcs.MoveFirst
                                rcs.Find "Line='" & flxData.TextMatrix(i, 0) & "'"
                                If rcs.AbsolutePage <> adPosEOF Then
                                        rcs!GenInvoice = 1
                                End If
                        Next
                        test = True
                        If Not (rcs.BOF) Then rcs.MoveFirst
                        Do While Not (rcs.EOF)
                                If Not (rcs!GenInvoice) Then
                                        test = False
                                End If
                                rcs.MoveNext
                        Loop
                        If Not (rcs.BOF) Then rcs.MoveFirst
                        Do While Not (rcs.EOF)
                                If test Then
                                        rcs!POStatus = SDeliver
                                Else
                                        rcs!POStatus = SPartial
                                End If
                                rcs.MoveNext
                        Loop
                        rcs.Close
                        
                        MsgBox "Update database Complete"
                        If mdlXML.GenInvoice(lblInvoiceNo.Caption, "") Then
                                MsgBox "Gen Invoice XML Complete"
                                Unload Me
                                     
                                mdiMain.WSSend 1
                        Else
                                MsgBox "Gen Invoice XML Error !!!"
                        End If
                Else
                        MsgBox "UpdatePO Table Error Don't have this POID in database"
                End If
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
         End If
End Sub

Private Sub Form_Load()
        frmInvoiceConfirm.Move 0, 0
        Dim i As Integer
        Dim rcs As ADODB.Recordset
        Dim conn As ADODB.Connection
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.Open
        rcs.Open "select max(idno) as maxid from invoice", conn, 1, 3
        If IsNull(rcs!maxid) Then
                lblInvoiceNo.Caption = 1
        Else
                lblInvoiceNo.Caption = rcs!maxid + 1
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        
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
        flxData.TextMatrix(0, 1) = "Product No."
        flxData.TextMatrix(0, 2) = "Description."
        flxData.TextMatrix(0, 3) = "Unit"
        flxData.TextMatrix(0, 4) = "Quantity"
        flxData.TextMatrix(0, 5) = "Item Price/Unit"
        flxData.TextMatrix(0, 6) = "Ship Price/Unit"
        flxData.TextMatrix(0, 7) = "Amount"
        
        lblDate.Caption = Now
        'txtDueDate.Text = Format$(Now, "short date")
End Sub

Public Sub AddItem(ByVal x As Long, ByVal y As Long, ByVal Text As String)
        flxData.TextMatrix(x, y) = Text
End Sub
Public Sub AddLineNo(ByVal row As Long, ByVal Text As String)
        flxData.AddItem Text, row
        'flxData.TextMatrix(row, 0) = Text
End Sub
Public Sub AddProductNo(ByVal row As Long, ByVal Text As String)
        'flxData.AddItem Text, row
        flxData.TextMatrix(row, 1) = Text
End Sub
Public Sub AddDescription(ByVal row As Long, ByVal Text As String)
        flxData.TextMatrix(row, 2) = Text
End Sub
Public Sub AddUnit(ByVal row As Long, ByVal Text As String)
        flxData.TextMatrix(row, 3) = Text
End Sub
Public Sub AddQTY(ByVal row As Long, ByVal Text As String)
        flxData.TextMatrix(row, 4) = Text
End Sub
Public Sub AddItemPrice(ByVal row As Long, ByVal Text As String)
        flxData.TextMatrix(row, 5) = Text
End Sub
Public Sub AddShipPrice(ByVal row As Long, ByVal Text As String)
        flxData.TextMatrix(row, 6) = Text
End Sub
Public Sub AddAmount(ByVal row As Long, ByVal Text As String)
        flxData.TextMatrix(row, 7) = Text
End Sub

Public Sub SetAddress(ByVal Text As String)
        txtAddress.Text = Text
End Sub

Public Sub SetSubTotal(ByVal Text As String)
        lblSubTotal.Caption = Text
End Sub

Public Sub SetVat(ByVal tax As String, ByVal value As String)
        lblvattax.Caption = "VALUE ADDED TAX  " & tax
        lblTaxValue.Caption = value
End Sub

Public Sub SetTotal(ByVal Text As String)
        lblTotal.Caption = Text
End Sub

Public Sub SetCustomerName(ByVal Text As String)
        txtBizName.Text = Text
End Sub

Public Sub SetPONo(ByVal Text As String)
        lblPONo.Caption = Text
End Sub

Public Sub SetDueDate(ByVal Text As String)
        txtDueDate.Text = Text
End Sub
