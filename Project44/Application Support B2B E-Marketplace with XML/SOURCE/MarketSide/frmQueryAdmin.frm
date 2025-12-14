VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmQueryAdmin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Query Adminisrator"
   ClientHeight    =   7755
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9420
   Icon            =   "frmQueryAdmin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7755
   ScaleWidth      =   9420
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   2895
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   9375
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   495
         Left            =   8040
         TabIndex        =   12
         Top             =   360
         Width           =   1095
      End
      Begin VB.CheckBox chkDistinct 
         Caption         =   "Distinct"
         Height          =   255
         Left            =   4800
         TabIndex        =   11
         Top             =   480
         Width           =   975
      End
      Begin VB.CommandButton cmdQuery 
         Caption         =   "Query"
         Height          =   495
         Left            =   6600
         TabIndex        =   6
         Top             =   360
         Width           =   1335
      End
      Begin VB.TextBox txtSql 
         Height          =   1455
         Left            =   3480
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   5
         Top             =   1080
         Width           =   5655
      End
      Begin VB.ListBox lstField 
         Height          =   1410
         ItemData        =   "frmQueryAdmin.frx":164A
         Left            =   720
         List            =   "frmQueryAdmin.frx":164C
         Style           =   1  'Checkbox
         TabIndex        =   4
         Top             =   1080
         Width           =   2295
      End
      Begin VB.ComboBox cmbTable 
         Height          =   315
         Left            =   720
         TabIndex        =   3
         Top             =   480
         Width           =   2295
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "SQL Statement"
         Height          =   195
         Left            =   3480
         TabIndex        =   10
         Top             =   480
         Width           =   1080
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Field"
         Height          =   195
         Left            =   240
         TabIndex        =   9
         Top             =   1080
         Width           =   330
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Table"
         Height          =   195
         Left            =   240
         TabIndex        =   8
         Top             =   480
         Width           =   405
      End
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   495
      Left            =   8040
      TabIndex        =   1
      Top             =   7200
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Caption         =   "Detail"
      Height          =   4095
      Left            =   0
      TabIndex        =   0
      Top             =   3000
      Width           =   9375
      Begin MSDataGridLib.DataGrid dtgDetail 
         Height          =   3495
         Left            =   210
         TabIndex        =   7
         Top             =   360
         Width           =   9015
         _ExtentX        =   15901
         _ExtentY        =   6165
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
   End
End
Attribute VB_Name = "frmQueryAdmin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim conn As ADODB.Connection
Dim rcs As ADODB.Recordset
Dim FromStr As String
Dim SelectStr As String
Dim fieldCount As Integer
Dim rcsDetail As ADODB.Recordset


Private Sub chkDistinct_Click()
        If chkDistinct.value Then
                txtSql.Text = Mid$(txtSql.Text, 1, 7) & "Distinct " & Mid$(txtSql.Text, 8, Len(txtSql.Text) - 7)
                SelectStr = Mid$(SelectStr, 1, 7) & "Distinct " & Mid$(SelectStr, 8, Len(SelectStr) - 7)
        Else
                txtSql.Text = Mid$(txtSql.Text, 1, 7) & Mid$(txtSql.Text, 8 + Len("Distinct "), Len(txtSql.Text) - 7)
                SelectStr = Mid$(SelectStr, 1, 7) & Mid$(SelectStr, 8 + Len("Distinct "), Len(SelectStr) - 7)
        End If
End Sub

Private Sub cmbTable_Click()
        Dim i As Integer
        If rcs.State <> adStateClosed Then
                rcs.Close
        End If
        rcs.Open cmbTable.Text, conn, 1, 3
        If Not (rcs.BOF) Then rcs.MoveFirst
        lstField.Clear
        For i = 0 To rcs.Fields.count - 1
                lstField.AddItem rcs.Fields.item(i).Name
        Next
        fieldCount = 0
End Sub

Private Sub cmdClear_Click()
        txtSql.Text = ""
End Sub

Private Sub cmdClose_Click()
        Unload Me
End Sub

Private Sub cmdQuery_Click()
        If txtSql.Text = "" Then
                MsgBox "Please Enter SQL Statement Before Query", , "Query"
        Else
                On Error GoTo msgerr:
                If rcsDetail.State <> adStateClosed Then rcsDetail.Close
                rcsDetail.Open txtSql.Text, conn, 1, 1
                Set dtgDetail.DataSource = rcsDetail
        End If
Exit Sub
msgerr:
        MsgBox Error$, vbCritical, "Query Error !!!"
End Sub

Private Sub Form_Load()
        frmQueryAdmin.Move 500, 500
        '------------- Add Table Name -------------
        cmbTable.Clear
        cmbTable.AddItem "Catalog"
        cmbTable.AddItem "CATService"
        cmbTable.AddItem "EMS"
        cmbTable.AddItem "FedExService"
        cmbTable.AddItem "Invoice"
        cmbTable.AddItem "InvoiceDetail"
        cmbTable.AddItem "Member"
        cmbTable.AddItem "MonthlyPayment"
        cmbTable.AddItem "MonthlyPaymentDetail"
        cmbTable.AddItem "Order Detail"
        cmbTable.AddItem "PartnerPayment"
        cmbTable.AddItem "PartnerPayment Detail"
        cmbTable.AddItem "PO"
        cmbTable.AddItem "PR"
        cmbTable.AddItem "Province"
        cmbTable.AddItem "Registor"
        cmbTable.AddItem "Term"
        
        SelectStr = "Select "
        FromStr = "From "
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
         Set rcsDetail = New ADODB.Recordset
         
         'Dim DBconString As String
         'DBconString = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=Marketplace;Data Source=B2B"
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
End Sub

Private Sub Form_Unload(Cancel As Integer)
        If rcs.State <> adStateClosed Then
                rcs.Close
        End If
        If rcsDetail.State <> adStateClosed Then
                rcsDetail.Close
        End If
        If conn.State <> adStateClosed Then
                conn.Close
        End If
        Set rcs = Nothing
        Set conn = Nothing
End Sub

Private Sub lstField_ItemCheck(item As Integer)
        Dim pos As Integer
        pos = InStr(1, SelectStr, " " & cmbTable.Text & "." & lstField.List(item) & " ")
        If pos > 0 Then
                SelectStr = Mid$(SelectStr, 1, pos - 1) & Mid$(SelectStr, pos + Len(cmbTable.Text & "." & lstField.List(item)) + 3, Len(SelectStr) - pos - Len(cmbTable.Text & "." & lstField.List(item)) - 1)
                fieldCount = fieldCount - 1
                txtSql.Text = Left$(SelectStr, Len(SelectStr) - 2)
        Else
                SelectStr = SelectStr & cmbTable.Text & "." & lstField.List(item) & " "
                txtSql.Text = SelectStr
                SelectStr = SelectStr & ", "
                fieldCount = fieldCount + 1
        End If
        
        If fieldCount > 0 Then
                pos = InStr(1, FromStr, " " & cmbTable.Text & " ")
                If pos <= 0 Then
                        FromStr = FromStr & cmbTable.Text & " "
                        txtSql.Text = txtSql.Text & vbCrLf & FromStr
                        FromStr = FromStr & ", "
                Else
                        txtSql.Text = Left$(SelectStr, Len(SelectStr) - 2) & vbCrLf & Left$(FromStr, Len(FromStr) - 2)
                End If
        Else
                pos = InStr(1, FromStr, " " & cmbTable.Text & " ")
                If pos > 0 Then
                        FromStr = Mid$(FromStr, 1, pos - 1) & Mid$(FromStr, pos + Len(cmbTable.Text) + 3, Len(FromStr) - pos - Len(cmbTable.Text) - 1)
                        txtSql.Text = txtSql.Text & vbCrLf & Left$(FromStr, Len(FromStr) - 2)
                Else
                        txtSql.Text = Left$(SelectStr, Len(SelectStr) - 2) & vbCrLf & Left$(FromStr, Len(FromStr) - 2)
                End If
        End If
End Sub
