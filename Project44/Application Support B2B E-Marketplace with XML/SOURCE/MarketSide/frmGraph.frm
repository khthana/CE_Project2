VERSION 5.00
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmGraph 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Graph"
   ClientHeight    =   6900
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6510
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   222
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmGraph.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6900
   ScaleWidth      =   6510
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame3 
      Caption         =   "Graph Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   0
      TabIndex        =   5
      Top             =   6000
      Width           =   4215
      Begin VB.OptionButton opt2D 
         Caption         =   "2 Dimension"
         Height          =   255
         Left            =   600
         TabIndex        =   7
         Top             =   360
         Value           =   -1  'True
         Width           =   1335
      End
      Begin VB.OptionButton opt3D 
         Caption         =   "3 Dimension"
         Height          =   255
         Left            =   2400
         TabIndex        =   6
         Top             =   360
         Width           =   1335
      End
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5895
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   6495
      Begin MSChart20Lib.MSChart MsGraph 
         Height          =   4695
         Left            =   120
         OleObjectBlob   =   "frmGraph.frx":164A
         TabIndex        =   3
         Top             =   1080
         Width           =   6255
      End
      Begin VB.Label lblTitle 
         Alignment       =   2  'Center
         Caption         =   "Title"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   6255
      End
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   4320
      TabIndex        =   0
      Top             =   6000
      Width           =   2175
      Begin VB.CommandButton cmdClose 
         Caption         =   "Close"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1935
      End
   End
End
Attribute VB_Name = "frmGraph"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public dateSQL As String
Public index As Integer

Dim conn As ADODB.Connection
Dim rcs As ADODB.Recordset


Private Sub cmdClose_Click()
        Unload Me
End Sub

Private Sub Form_Load()
        frmGraph.Move 1000, 1000
        MsGraph.chartType = VtChChartType2dBar
        
        Dim sql As String
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        
       conn.ConnectionString = DBconString
       conn.CursorLocation = adUseClient
       conn.Open
       If index = 0 Then
                lblTitle.Caption = "กราฟเปรียบเทียบ ปริมาณรายได้ของตลาดจากผู้ซื้อแต่ละราย"
                dropTemp
                sql = "SELECT DISTINCT " & _
                              "MonthlyPayment.TotalCharge , MonthlyPayment.PaymentID , MonthlyPayment.CreateDate , PR.SellerID " & _
                                "Into [temp] " & _
                        "FROM         PR INNER JOIN " & _
                                "PO ON PR.PRID = PO.PRID INNER JOIN " & _
                                "MonthlyPayment INNER JOIN " & _
                                "MonthlyPaymentDetail ON MonthlyPayment.PaymentID = MonthlyPaymentDetail.PaymentID ON PO.POID = MonthlyPaymentDetail.POID"
                conn.Execute sql
                sql = "select sum(totalcharge) as sumTotal,sellerid from temp where (totalcharge is not null) " & _
                                 dateSQL & " group by sellerid order by sellerid"
       ElseIf index = 1 Then
                lblTitle.Caption = "กราฟเปรียบเทียบปริมาณการซื้อ - ขายทั้งหมดที่ผ่านตลาดของผู้ซื้อแต่ละราย"
                dropTemp
                sql = "SELECT DISTINCT PR.SellerID, PR.PRTotal, PR.PRID, PO.POID, PO.POFullDate " & _
                                        "Into [temp] " & _
                                "FROM         PR INNER JOIN " & _
                                        "PO ON PR.PRID = PO.PRID"
                conn.Execute sql
                sql = "select sum(prtotal) as sumTotal,sellerid from temp where (prtotal is not null) " & _
                                 dateSQL & " group by sellerid order by sellerid"
       ElseIf index = 2 Then
                lblTitle.Caption = "กราฟเปรียบเทียบ ปริมาณใบสั่งซื้อที่ถูกยกเลิกของผู้ซื้อแต่ละราย"
                sql = "SELECT     COUNT(*) AS sumtotal, PR.SellerID " & _
                                "FROM         PR INNER JOIN " & _
                                                "PO ON PR.PRID = PO.PRID " & _
                                "WHERE     (PO.POstatus = 'rejected') " & _
                                dateSQL & " GROUP BY PR.SellerID "
       End If
       rcs.Open sql, conn, 1, 3
       MsGraph.ColumnCount = 1
       MsGraph.RowCount = rcs.RecordCount
       If Not (rcs.BOF) Then rcs.MoveFirst
       Do While Not (rcs.EOF)
                MsGraph.Row = rcs.AbsolutePosition
                MsGraph.RowLabel = "SellerID " & rcs!sellerID
                MsGraph.Data = rcs!sumTotal
                rcs.MoveNext
       Loop
End Sub

Private Sub Form_Unload(Cancel As Integer)
        If index = 0 Or index = 1 Then
                conn.Execute "drop table temp"
        End If
        If rcs.State <> adStateClosed Then
                rcs.Close
        End If
        If conn.State <> adStateClosed Then
                conn.Close
        End If
        Set rcs = Nothing
        Set conn = Nothing
End Sub

Public Sub dropTemp()
        On Error Resume Next
      conn.Execute "drop table temp"
End Sub

Private Sub opt2D_Click()
        If opt2D Then
                MsGraph.chartType = VtChChartType2dBar
                MsGraph.Refresh
        End If
End Sub

Private Sub opt3D_Click()
        If opt3D Then
                MsGraph.chartType = VtChChartType3dBar
                MsGraph.Refresh
        End If
End Sub
