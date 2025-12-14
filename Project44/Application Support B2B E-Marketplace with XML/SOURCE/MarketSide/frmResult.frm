VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmResult 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Result"
   ClientHeight    =   7185
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8880
   Icon            =   "frmResult.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7185
   ScaleWidth      =   8880
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdGraph 
      Caption         =   "Graph"
      Height          =   615
      Left            =   5760
      TabIndex        =   7
      Top             =   6360
      Width           =   1455
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   615
      Left            =   7440
      TabIndex        =   1
      Top             =   6360
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Height          =   6015
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8895
      Begin MSDataGridLib.DataGrid DataGrid1 
         Height          =   4575
         Left            =   120
         TabIndex        =   2
         Top             =   1320
         Width           =   8655
         _ExtentX        =   15266
         _ExtentY        =   8070
         _Version        =   393216
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
      Begin VB.Label lblTitle 
         Alignment       =   2  'Center
         Caption         =   "Title"
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
         Left            =   360
         TabIndex        =   3
         Top             =   480
         Width           =   8265
      End
   End
   Begin VB.Label lblCount 
      AutoSize        =   -1  'True
      Caption         =   "..."
      Height          =   195
      Left            =   2160
      TabIndex        =   6
      Top             =   6240
      Width           =   135
   End
   Begin VB.Label lblDcrp 
      AutoSize        =   -1  'True
      Caption         =   "มีจำนวนรายการทั้งสิ้น"
      Height          =   195
      Left            =   360
      TabIndex        =   5
      Top             =   6240
      Width           =   1530
   End
   Begin VB.Label lblTail 
      AutoSize        =   -1  'True
      Caption         =   "..."
      Height          =   195
      Left            =   360
      TabIndex        =   4
      Top             =   6720
      Width           =   135
   End
End
Attribute VB_Name = "frmResult"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public graph As Boolean
Dim conn As ADODB.Connection
Dim rcs As ADODB.Recordset

Public Sub StartQuery(ByVal sql As String, ByVal index As Integer)
        Dim sum As Double
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        
        conn.Open
        rcs.Open sql, conn, 1, 3
        Set DataGrid1.DataSource = rcs
        If Not (rcs.BOF) Then rcs.MoveFirst
        sum = 0
        lblCount.Caption = rcs.RecordCount & "   รายการ"
        If index = 0 Then
                Do While Not (rcs.EOF)
                        sum = sum + rcs!totalcharge
                        rcs.MoveNext
                Loop
                lblTail.Caption = "รายได้รวมทั้งหมดที่ตลาดได้รับ =  " & Format$(sum, "##,##0.00") & "   บาท"
        ElseIf index = 1 Then
                Do While Not (rcs.EOF)
                        sum = sum + rcs!PRTotal
                        rcs.MoveNext
                Loop
                lblTail.Caption = "ปริมาณการซื้อขายผ่านตลาดทั้งหมด =  " & Format$(sum, "##,##0.00") & "   บาท"
        ElseIf index = 2 Then
                Do While Not (rcs.EOF)
                        sum = sum + rcs!PRTotal
                        rcs.MoveNext
                Loop
                lblTail.Caption = "รวมปริมาณการซื้อขายที่ถูกยกเลิก =  " & Format$(sum, "##,##0.00") & "   บาท"
        End If
        If graph Then
                cmdGraph.Enabled = True
        Else
                cmdGraph.Enabled = False
        End If
End Sub

Private Sub cmdClose_Click()
        Unload Me
End Sub

Private Sub cmdGraph_Click()
        frmGraph.Show
End Sub

Private Sub Form_Load()
        frmResult.Move 500, 500
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
End Sub

Private Sub Form_Unload(Cancel As Integer)
        If rcs.State <> adStateClosed Then
                rcs.Close
        End If
        If conn.State <> adStateClosed Then
                conn.Close
        End If
        Set rcs = Nothing
        Set conn = Nothing
End Sub
