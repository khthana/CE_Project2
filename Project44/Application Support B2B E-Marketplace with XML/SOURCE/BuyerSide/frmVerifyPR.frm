VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmVerifyPR 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Accept Or Reject P.R."
   ClientHeight    =   7485
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11910
   Icon            =   "frmVerifyPR.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7485
   ScaleWidth      =   11910
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   7455
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11895
      Begin VB.ComboBox cmbPRID 
         Height          =   315
         Left            =   1320
         TabIndex        =   5
         Text            =   "Select P.R. ID here"
         Top             =   600
         Width           =   2055
      End
      Begin VB.CommandButton cmdReject 
         Caption         =   "REJECT"
         Height          =   495
         Left            =   1920
         TabIndex        =   4
         Top             =   6600
         Width           =   1335
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "CANCEL"
         Height          =   495
         Left            =   3360
         TabIndex        =   3
         Top             =   6600
         Width           =   1335
      End
      Begin VB.CommandButton cmdAccept 
         Caption         =   "ACCEPT"
         Height          =   495
         Left            =   480
         TabIndex        =   1
         Top             =   6600
         Width           =   1335
      End
      Begin MSFlexGridLib.MSFlexGrid flxData 
         Height          =   3975
         Left            =   120
         TabIndex        =   12
         Top             =   1440
         Width           =   11655
         _ExtentX        =   20558
         _ExtentY        =   7011
         _Version        =   393216
         Rows            =   1
         Cols            =   9
         FixedCols       =   0
      End
      Begin VB.Label lblTotalPrice 
         Alignment       =   1  'Right Justify
         Caption         =   "..."
         Height          =   195
         Left            =   9960
         TabIndex        =   18
         Top             =   6840
         Width           =   975
      End
      Begin VB.Label lblItemPrice 
         Alignment       =   1  'Right Justify
         Caption         =   "..."
         Height          =   195
         Left            =   9960
         TabIndex        =   17
         Top             =   5880
         Width           =   975
      End
      Begin VB.Label lblShipPrice 
         Alignment       =   1  'Right Justify
         Caption         =   "..."
         Height          =   195
         Left            =   9960
         TabIndex        =   16
         Top             =   6360
         Width           =   975
      End
      Begin VB.Label Label6 
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
         Left            =   8160
         TabIndex        =   15
         Top             =   6840
         Width           =   930
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Total Ship Price"
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
         Left            =   8160
         TabIndex        =   14
         Top             =   6360
         Width           =   1365
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Total Item Price"
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
         Left            =   8160
         TabIndex        =   13
         Top             =   5880
         Width           =   1350
      End
      Begin VB.Label lblShipMethod 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   9600
         TabIndex        =   11
         Top             =   660
         Width           =   135
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Ship Method"
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
         Left            =   8160
         TabIndex        =   10
         Top             =   660
         Width           =   1065
      End
      Begin VB.Label lblTerm 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   6960
         TabIndex        =   9
         Top             =   630
         Width           =   135
      End
      Begin VB.Label Label9 
         Caption         =   "P.R. No."
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
         Left            =   4080
         TabIndex        =   8
         Top             =   630
         Width           =   855
      End
      Begin VB.Label lblPRNo 
         AutoSize        =   -1  'True
         Caption         =   "..."
         Height          =   195
         Left            =   5160
         TabIndex        =   7
         Top             =   630
         Width           =   135
      End
      Begin VB.Label Label2 
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
         Left            =   6240
         TabIndex        =   6
         Top             =   630
         Width           =   420
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "P.R. ID."
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
         Left            =   360
         TabIndex        =   2
         Top             =   660
         Width           =   690
      End
   End
End
Attribute VB_Name = "frmVerifyPR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim conn As ADODB.Connection
Dim rcs As ADODB.Recordset


Private Sub cmbPRID_Click()
   If Not (rcs.BOF) Then rcs.MoveFirst
        Dim rcsPR As ADODB.Recordset
        Dim sql As String
        Dim row As Integer
        'Dim TotalShipPrice As Double
        'Dim TotalItemPrice As Double
        
        Set rcsPR = New ADODB.Recordset
        'TotalShipPrice = 0
        'TotalItemPrice = 0
        rcs.Find "PRID = " & cmbPRID.Text
        If rcs.AbsolutePosition <> adPosEOF Then
'                lblSubTotal.Caption = Format$(rcs!NetAmount, "##,##0.00")
'                lblTaxValue.Caption = Format$(rcs!vat, "##,##0.00")
'                lblTotal.Caption = Format$(rcs!Totalprice, "##,##0.00")
                lblPRNo.Caption = rcs!prno
                lblTerm.Caption = rcs!PRTerm
                lblShipPrice.Caption = Format$(rcs!PRShipprice, "##,##0.00")
                lblItemPrice.Caption = Format$(rcs!PRitemprice, "##,##0.00")
                lblTotalPrice.Caption = Format$(rcs!PRitemprice + rcs!PRShipprice, "##,##0.00")
                lblShipMethod.Caption = rcs!Shipmethod
                       
                flxData.Rows = 1
                flxData.Refresh
                sql = "select PROpen.Line, PROpen.OrderSellerItemID, PROpen.OrderName, PROpen.needDate, " & _
                          "PROpen.OrderUnit, PROpen.OrderQTY, PROpen.OrderItemPrice, PROpen.OrderShipprice " & _
                          "from PROpen " & _
                          "where  PROpen.PRID = """ & cmbPRID.Text & """"
               rcsPR.Open sql, conn, 1, 3
               row = 1
                If rcsPR.RecordCount > 0 Then
                        If Not (rcsPR.BOF) Then rcsPR.MoveFirst
                        Do While Not (rcsPR.EOF)
                                flxData.AddItem rcsPR!Line, row
                                flxData.TextMatrix(row, 1) = rcsPR!OrderSellerItemID
                                flxData.TextMatrix(row, 2) = rcsPR!OrderName
                                flxData.TextMatrix(row, 3) = rcsPR!needdate
                                flxData.TextMatrix(row, 4) = rcsPR!OrderUnit
                                flxData.TextMatrix(row, 5) = rcsPR!OrderQTY
                                flxData.TextMatrix(row, 6) = rcsPR!OrderItemPrice
                                flxData.TextMatrix(row, 7) = rcsPR!OrderShipprice
                                flxData.TextMatrix(row, 8) = Format$(rcsPR!OrderQTY * (rcsPR!OrderItemPrice + rcsPR!OrderShipprice), "##,##0.00")
                                
                                row = row + 1
                                rcsPR.MoveNext
                        Loop
                        
                Else
                        MsgBox "This P.R. Did not Contain any line"
                End If
                rcsPR.Close
               Set rcsPR = Nothing
        Else
                MsgBox "This P.R. ID. Not Found in database." & vbCrLf & "Try Again, Please.", vbExclamation + vbOKOnly, "Warning !!!"
        End If
End Sub


Private Sub cmdCancel_Click()
        Unload Me
End Sub

Private Sub cmdAccept_Click()
        If cmbPRID.Text = "Select P.R. ID here" Then
                MsgBox "Please Select P.R. ID before Accept", vbExclamation + vbOKOnly, "Error !!!"
        ElseIf cmbPRID.Text = "" Then
                MsgBox "P.R. ID is empty"
        Else
                Dim conn As ADODB.Connection
                Dim rcs As ADODB.Recordset
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                conn.ConnectionString = DBconString
                conn.Open
                rcs.Open "select count(*) as rcsCount from PROpen where prid = """ & cmbPRID.Text & """", conn, 1, 3
                If rcs!rcsCount > 0 Then
                        If mdlXML.genPO(cmbPRID.Text, "") Then
                                MsgBox "Generate P.O. Complete"
                                Unload Me
                                 
                                mdiMain.WSSend 1
                        Else
                                  MsgBox "Generate PO Error !!!"
                        End If
                Else
                        MsgBox "Cannot Find this P.R. ID in database"
                End If
        End If
End Sub

Private Sub cmdReject_Click()
        If cmbPRID.Text = "Select P.R. ID here" Then
                MsgBox "Please Select P.R. ID before Accept", vbExclamation + vbOKOnly, "Error !!!"
        ElseIf cmbPRID.Text = "" Then
                MsgBox "P.R. ID is empty"
        Else
                frmReject.mode = "PR"
                frmReject.txtPRid = cmbPRID.Text
                Unload Me
                frmReject.Show vbModal
        End If
End Sub

Private Sub Form_Load()
        frmVerifyPR.Move 0, 0
        Dim i As Integer
        
        flxData.ColWidth(0) = 800
        flxData.ColWidth(1) = 1000
        flxData.ColWidth(2) = 2900
        flxData.ColWidth(3) = 1200
        flxData.ColWidth(4) = 1000
        flxData.ColWidth(5) = 1000
        flxData.ColWidth(6) = 1200
        flxData.ColWidth(7) = 1200
        flxData.ColWidth(8) = 1200
        
        For i = 0 To 7
                flxData.ColAlignment(i) = flexAlignCenterCenter
        Next
        
        flxData.TextMatrix(0, 0) = "Line No."
        flxData.TextMatrix(0, 1) = "Item ID"
        flxData.TextMatrix(0, 2) = "Description."
        flxData.TextMatrix(0, 3) = "Need Date"
        flxData.TextMatrix(0, 4) = "Unit"
        flxData.TextMatrix(0, 5) = "Quantity"
        flxData.TextMatrix(0, 6) = "Item Price/Unit"
        flxData.TextMatrix(0, 7) = "Ship Price/Unit"
        flxData.TextMatrix(0, 8) = "Amount"
        
        Dim sql As String
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        
        conn.ConnectionString = DBconString
        conn.Open
        cmbPRID.clear
        sql = "select distinct PRID, PRNO, PRTerm, PRShipPrice, PRItemPrice, ShipMethod " & _
                  "from PROpen  where PRStatus = """ & SConfirm & """"
        rcs.Open sql, conn, 1, 3
        For i = 0 To rcs.RecordCount - 1
                cmbPRID.AddItem rcs!prid
                rcs.MoveNext
        Next
End Sub

Private Sub Form_Unload(Cancel As Integer)
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
End Sub
