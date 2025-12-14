VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "โปรแกรมแสดงจำนวนครั้งในการใช้คอมพิวเตอร์"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   9855
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7215
   ScaleWidth      =   9855
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      BorderStyle     =   0  'None
      Caption         =   "year"
      Height          =   7095
      Left            =   0
      TabIndex        =   28
      Top             =   0
      Width           =   9855
      Begin VB.Label titley 
         Alignment       =   2  'Center
         Caption         =   "กราฟแสดงจำนวนครั้งในการใช้คอมพิวเตอร์ต่อช่วงวัน"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   600
         TabIndex        =   40
         Top             =   6600
         Width           =   8655
      End
      Begin VB.Label ly5 
         BackStyle       =   0  'Transparent
         Caption         =   "Label21"
         Height          =   375
         Left            =   120
         TabIndex        =   39
         Top             =   360
         Width           =   2055
      End
      Begin VB.Label ly4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label20"
         Height          =   255
         Left            =   120
         TabIndex        =   38
         Top             =   1830
         Width           =   1455
      End
      Begin VB.Label ly1 
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         Height          =   375
         Left            =   120
         TabIndex        =   37
         Top             =   6000
         Width           =   255
      End
      Begin VB.Label ly2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label18"
         Height          =   495
         Left            =   120
         TabIndex        =   36
         Top             =   4650
         Width           =   615
      End
      Begin VB.Label ly3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label16"
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   3300
         Width           =   615
      End
      Begin VB.Label Label15 
         Caption         =   "6 - 10"
         Height          =   375
         Left            =   2760
         TabIndex        =   34
         Top             =   6240
         Width           =   855
      End
      Begin VB.Label Label14 
         Caption         =   "1 - 5"
         Height          =   255
         Left            =   1560
         TabIndex        =   33
         Top             =   6240
         Width           =   495
      End
      Begin VB.Label Label13 
         Caption         =   "21 - 25"
         Height          =   375
         Left            =   6720
         TabIndex        =   32
         Top             =   6240
         Width           =   735
      End
      Begin VB.Label Label12 
         Caption         =   "11 - 15"
         Height          =   495
         Left            =   4080
         TabIndex        =   31
         Top             =   6240
         Width           =   1215
      End
      Begin VB.Label Label11 
         Caption         =   "26 - 31"
         Height          =   495
         Left            =   8040
         TabIndex        =   30
         Top             =   6240
         Width           =   1695
      End
      Begin VB.Label Label10 
         Caption         =   "16 - 20"
         Height          =   495
         Left            =   5400
         TabIndex        =   29
         Top             =   6240
         Width           =   855
      End
      Begin VB.Shape gy6 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   8040
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gy2 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   2760
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gy3 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   4080
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gy4 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   5400
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gy5 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   6720
         Top             =   4440
         Width           =   495
      End
      Begin VB.Line Line4 
         BorderWidth     =   3
         X1              =   600
         X2              =   9240
         Y1              =   6120
         Y2              =   6120
      End
      Begin VB.Line Line3 
         BorderWidth     =   3
         X1              =   600
         X2              =   600
         Y1              =   480
         Y2              =   6120
      End
      Begin VB.Shape gy1 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   1560
         Top             =   4440
         Width           =   495
      End
   End
   Begin VB.Frame Frame3 
      BorderStyle     =   0  'None
      Caption         =   "year"
      Height          =   7095
      Left            =   0
      TabIndex        =   15
      Top             =   0
      Width           =   9855
      Begin VB.Label titleu 
         Alignment       =   2  'Center
         Caption         =   "กราฟแสดงจำนวนครั้งในการใช้คอมพิวเตอร์ต่อเดือน"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   600
         TabIndex        =   27
         Top             =   6480
         Width           =   8655
      End
      Begin VB.Shape gu1 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   1440
         Top             =   4440
         Width           =   495
      End
      Begin VB.Line Line6 
         BorderWidth     =   3
         X1              =   600
         X2              =   600
         Y1              =   480
         Y2              =   6120
      End
      Begin VB.Line Line5 
         BorderWidth     =   3
         X1              =   600
         X2              =   9240
         Y1              =   6120
         Y2              =   6120
      End
      Begin VB.Shape gu5 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   6720
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gu4 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   5400
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gu3 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   4080
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gu2 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   2880
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gu6 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   8040
         Top             =   4440
         Width           =   495
      End
      Begin VB.Label Label31 
         Caption         =   "4"
         Height          =   495
         Left            =   5520
         TabIndex        =   26
         Top             =   6240
         Width           =   975
      End
      Begin VB.Label Label30 
         Caption         =   "6"
         Height          =   495
         Left            =   8160
         TabIndex        =   25
         Top             =   6240
         Width           =   1095
      End
      Begin VB.Label Label29 
         Caption         =   "3"
         Height          =   495
         Left            =   4200
         TabIndex        =   24
         Top             =   6240
         Width           =   1215
      End
      Begin VB.Label Label28 
         Caption         =   "5"
         Height          =   375
         Left            =   6840
         TabIndex        =   23
         Top             =   6240
         Width           =   735
      End
      Begin VB.Label Label27 
         Caption         =   "1"
         Height          =   255
         Left            =   1560
         TabIndex        =   22
         Top             =   6240
         Width           =   495
      End
      Begin VB.Label Label26 
         Caption         =   "2"
         Height          =   375
         Left            =   2880
         TabIndex        =   21
         Top             =   6240
         Width           =   855
      End
      Begin VB.Label lu3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label16"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   3300
         Width           =   615
      End
      Begin VB.Label lu2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label18"
         Height          =   495
         Left            =   120
         TabIndex        =   19
         Top             =   4650
         Width           =   615
      End
      Begin VB.Label lu1 
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         Height          =   375
         Left            =   120
         TabIndex        =   18
         Top             =   6000
         Width           =   255
      End
      Begin VB.Label lu4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label20"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1830
         Width           =   1455
      End
      Begin VB.Label lu5 
         BackStyle       =   0  'Transparent
         Caption         =   "Label21"
         Height          =   375
         Left            =   120
         TabIndex        =   16
         Top             =   360
         Width           =   2055
      End
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Caption         =   "day"
      Height          =   7095
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9855
      Begin VB.Label titled 
         Alignment       =   2  'Center
         Caption         =   "กราฟแสดงจำนวนครั้งในการใช้คอมพิวเตอร์ต่อช่วงเวลา"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   600
         TabIndex        =   14
         Top             =   6600
         Width           =   8655
      End
      Begin VB.Label ld1 
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   6000
         Width           =   735
      End
      Begin VB.Label ld3 
         BackStyle       =   0  'Transparent
         Caption         =   "Label15"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   3300
         Width           =   855
      End
      Begin VB.Label ld4 
         BackStyle       =   0  'Transparent
         Caption         =   "Label12"
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   1830
         Width           =   1575
      End
      Begin VB.Label ld5 
         BackStyle       =   0  'Transparent
         Caption         =   "Label11"
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label ld2 
         BackStyle       =   0  'Transparent
         Caption         =   "Label10"
         Height          =   375
         Left            =   120
         TabIndex        =   9
         Top             =   4650
         Width           =   735
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         Caption         =   "21.00 - 24.00"
         Height          =   375
         Left            =   8400
         TabIndex        =   8
         Top             =   6240
         Width           =   1095
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         Caption         =   "18.00 - 21.00"
         Height          =   375
         Left            =   7320
         TabIndex        =   7
         Top             =   6240
         Width           =   975
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         Caption         =   "15.00 - 18.00"
         Height          =   375
         Left            =   6240
         TabIndex        =   6
         Top             =   6240
         Width           =   975
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         Caption         =   "12.00 - 15.00"
         Height          =   375
         Left            =   5160
         TabIndex        =   5
         Top             =   6240
         Width           =   975
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         Caption         =   "9.00 - 12.00"
         Height          =   375
         Left            =   4080
         TabIndex        =   4
         Top             =   6240
         Width           =   975
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         Caption         =   "6.00 - 9.00"
         Height          =   375
         Left            =   3120
         TabIndex        =   3
         Top             =   6240
         Width           =   855
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "3.00 - 6.00"
         Height          =   255
         Left            =   2040
         TabIndex        =   2
         Top             =   6240
         Width           =   855
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "24.00 - 3.00"
         Height          =   255
         Left            =   840
         TabIndex        =   1
         Top             =   6240
         Width           =   975
      End
      Begin VB.Line Line2 
         BorderWidth     =   3
         X1              =   600
         X2              =   9240
         Y1              =   6120
         Y2              =   6120
      End
      Begin VB.Line Line1 
         BorderWidth     =   3
         X1              =   600
         X2              =   600
         Y1              =   480
         Y2              =   6120
      End
      Begin VB.Shape gd1 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   1080
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gd2 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   2160
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gd7 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   2535
         Left            =   7560
         Top             =   3600
         Width           =   495
      End
      Begin VB.Shape gd5 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   5400
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gd8 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   8640
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gd4 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   4320
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gd6 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   6480
         Top             =   4440
         Width           =   495
      End
      Begin VB.Shape gd3 
         BackStyle       =   1  'Opaque
         BorderColor     =   &H000080FF&
         FillColor       =   &H00FFC0C0&
         FillStyle       =   0  'Solid
         Height          =   1695
         Left            =   3240
         Top             =   4440
         Width           =   495
      End
   End
   Begin VB.Menu set 
      Caption         =   "Set"
      Begin VB.Menu Scalendar 
         Caption         =   "Calendar"
      End
   End
   Begin VB.Menu graph 
      Caption         =   "Graph"
      Index           =   3
      Begin VB.Menu PerDay 
         Caption         =   "Per Day"
      End
      Begin VB.Menu permonth 
         Caption         =   "Per Month"
      End
      Begin VB.Menu peryear 
         Caption         =   "Per Year"
      End
   End
   Begin VB.Menu exit 
      Caption         =   "Exit"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Private Sub exchange(c As Long)
'    Dim H0 As Integer
'    H0 = 1695
'    Dim T0 As Integer
'    T0 = 480
'
'    Dim x As Integer
'    On Error Resume Next
'    x = c
'    Shape1.Height = x / 100 * H0
'    Shape1.Top = T0 + H0 - Shape1.Height
'End Sub

'Private Sub Calendar1_Click()
'Dim a As Long
'    a = Calendar1.Month
'End Sub
'
'Private Sub Command1_Click()
'Dim a As Long
'    a = Calendar1.Month
'End Sub

Private Sub exit_Click()
    End
End Sub

Private Sub Form_Load()
    Frame1.Visible = False
    Frame2.Visible = False
    Frame3.Visible = False
    graph_d
    graph_h
    graph_y
    Frame1.Visible = True
    Frame2.Visible = False
    Frame3.Visible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub PerDay_Click()
    Frame1.Visible = True
    Frame2.Visible = False
    Frame3.Visible = False
End Sub

Private Sub permonth_Click()
    Frame1.Visible = False
    Frame2.Visible = True
    Frame3.Visible = False
End Sub

Private Sub peryear_Click()
    Frame1.Visible = False
    Frame2.Visible = False
    Frame3.Visible = True
End Sub

Private Sub Scalendar_Click()
    Form1.Enabled = False
    Form2.Show
End Sub

Public Sub graph_h()
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql As String
Dim val1 As String
Dim val2 As String
Dim countu(8) As Long
Dim Max As Long
Dim MaxUser As Long
    Max = 5640
    MaxUser = 0
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 3) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(0) = 0
            Do While Not rs.EOF
                countu(0) = countu(0) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(0) Then
                MaxUser = countu(0)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 3) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 6) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(1) = 0
            Do While Not rs.EOF
                countu(1) = countu(1) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(1) Then
                MaxUser = countu(1)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 6) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 9) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(2) = 0
            Do While Not rs.EOF
                countu(2) = countu(2) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(2) Then
                MaxUser = countu(2)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 9) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 12) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(3) = 0
            Do While Not rs.EOF
                countu(3) = countu(3) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(3) Then
                MaxUser = countu(3)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 12) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 15) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(4) = 0
            Do While Not rs.EOF
                countu(4) = countu(4) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(4) Then
                MaxUser = countu(4)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 15) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 18) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(5) = 0
            Do While Not rs.EOF
                countu(5) = countu(5) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(5) Then
                MaxUser = countu(5)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 18) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 21) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(6) = 0
            Do While Not rs.EOF
                countu(6) = countu(6) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(6) Then
                MaxUser = countu(6)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + Form2.Calendar1.Day) * 24
    val1 = (val1 + 21) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + Form2.Calendar1.Day) * 24
    val2 = (val2 + 24) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(7) = 0
            Do While Not rs.EOF
                countu(7) = countu(7) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(7) Then
                MaxUser = countu(7)
            End If
        End If
    rs.Close
    Dim ratio As Long
    If MaxUser = 0 Then
        ratio = 0
    Else
        ratio = Max / MaxUser
    End If
    gd1.Height = countu(0) * ratio
    gd1.Top = 6120 - gd1.Height
    gd2.Height = countu(1) * ratio
    gd2.Top = 6120 - gd2.Height
    gd3.Height = countu(2) * ratio
    gd3.Top = 6120 - gd3.Height
    gd4.Height = countu(3) * ratio
    gd4.Top = 6120 - gd4.Height
    gd5.Height = countu(4) * ratio
    gd5.Top = 6120 - gd5.Height
    gd6.Height = countu(5) * ratio
    gd6.Top = 6120 - gd6.Height
    gd7.Height = countu(6) * ratio
    gd7.Top = 6120 - gd7.Height
    gd8.Height = countu(7) * ratio
    gd8.Top = 6120 - gd8.Height
   
    ld5.Caption = Int(MaxUser)
    ld4.Caption = Int(MaxUser / 4 * 3)
    ld3.Caption = Int(MaxUser / 4 * 2)
    ld2.Caption = Int(MaxUser / 4)
    
End Sub
Public Sub graph_d()
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql As String
Dim val1 As String
Dim val2 As String
Dim countu(8) As Long
Dim Max As Long
Dim MaxUser As Long
    Max = 5640
    MaxUser = 0
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + 1) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + 5) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(0) = 0
            Do While Not rs.EOF
                countu(0) = countu(0) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(0) Then
                MaxUser = countu(0)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + 6) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + 10) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(1) = 0
            Do While Not rs.EOF
                countu(1) = countu(1) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(1) Then
                MaxUser = countu(1)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + 11) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + 15) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(2) = 0
            Do While Not rs.EOF
                countu(2) = countu(2) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(2) Then
                MaxUser = countu(2)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + 16) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + 20) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(3) = 0
            Do While Not rs.EOF
                countu(3) = countu(3) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(3) Then
                MaxUser = countu(3)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + 21) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + 25) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(4) = 0
            Do While Not rs.EOF
                countu(4) = countu(4) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(4) Then
                MaxUser = countu(4)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + Form2.Calendar1.Month) * 31
    val1 = (val1 + 26) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + Form2.Calendar1.Month) * 31
    val2 = (val2 + 31) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(5) = 0
            Do While Not rs.EOF
                countu(5) = countu(5) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(5) Then
                MaxUser = countu(5)
            End If
        End If
    rs.Close
'--------------------------
    
    Dim ratio As Long
    If MaxUser = 0 Then
        ratio = 0
    Else
        ratio = Max / MaxUser
    End If
    gy1.Height = countu(0) * ratio
    gy1.Top = 6120 - gy1.Height
    gy2.Height = countu(1) * ratio
    gy2.Top = 6120 - gy2.Height
    gy3.Height = countu(2) * ratio
    gy3.Top = 6120 - gy3.Height
    gy4.Height = countu(3) * ratio
    gy4.Top = 6120 - gy4.Height
    gy5.Height = countu(4) * ratio
    gy5.Top = 6120 - gy5.Height
    gy6.Height = countu(5) * ratio
    gy6.Top = 6120 - gy6.Height
       
    ly5.Caption = Int(MaxUser)
    ly4.Caption = Int(MaxUser / 4 * 3)
    ly3.Caption = Int(MaxUser / 4 * 2)
    ly2.Caption = Int(MaxUser / 4)
    
End Sub
Public Sub graph_y()
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql As String
Dim val1 As String
Dim val2 As String
Dim countu(8) As Long
Dim Max As Long
Dim MaxUser As Long
    Max = 5640
    MaxUser = 0
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + 1) * 31
    val1 = (val1 + 0) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + 2) * 31
    val2 = (val2 + 0) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(0) = 0
            Do While Not rs.EOF
                countu(0) = countu(0) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(0) Then
                MaxUser = countu(0)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + 2) * 31
    val1 = (val1 + 0) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + 3) * 31
    val2 = (val2 + 0) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(1) = 0
            Do While Not rs.EOF
                countu(1) = countu(1) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(1) Then
                MaxUser = countu(1)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + 3) * 31
    val1 = (val1 + 0) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + 4) * 31
    val2 = (val2 + 0) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(2) = 0
            Do While Not rs.EOF
                countu(2) = countu(2) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(2) Then
                MaxUser = countu(2)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + 4) * 31
    val1 = (val1 + 0) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + 5) * 31
    val2 = (val2 + 0) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(3) = 0
            Do While Not rs.EOF
                countu(3) = countu(3) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(3) Then
                MaxUser = countu(3)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + 5) * 31
    val1 = (val1 + 0) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + 6) * 31
    val2 = (val2 + 0) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(4) = 0
            Do While Not rs.EOF
                countu(4) = countu(4) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(4) Then
                MaxUser = countu(4)
            End If
        End If
    rs.Close
'--------------------------
    val1 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val1 = (val1 + 6) * 31
    val1 = (val1 + 0) * 24
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0) * 60
    val1 = (val1 + 0)
    val2 = (Form2.Calendar1.Year Mod 100) * 12    ' time and date in second
    val2 = (val2 + 7) * 31
    val2 = (val2 + 0) * 24
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0) * 60
    val2 = (val2 + 0)
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select *  from log_user where activity = 'logon' and timeactivity >= '" & val1 & "' and timeactivity < '" & val2 & "'"
    rs.Open sql, Conn, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            countu(5) = 0
            Do While Not rs.EOF
                countu(5) = countu(5) + 1
                rs.MoveNext
            Loop
            If MaxUser < countu(5) Then
                MaxUser = countu(5)
            End If
        End If
    rs.Close
'--------------------------
    
    Dim ratio As Long
     If MaxUser = 0 Then
        ratio = 0
    Else
        ratio = Max / MaxUser
    End If
    gu1.Height = countu(0) * ratio
    gu1.Top = 6120 - gu1.Height
    gu2.Height = countu(1) * ratio
    gu2.Top = 6120 - gu2.Height
    gu3.Height = countu(2) * ratio
    gu3.Top = 6120 - gu3.Height
    gu4.Height = countu(3) * ratio
    gu4.Top = 6120 - gu4.Height
    gu5.Height = countu(4) * ratio
    gu5.Top = 6120 - gu5.Height
    gu6.Height = countu(5) * ratio
    gu6.Top = 6120 - gu6.Height
       
    lu5.Caption = Int(MaxUser)
    lu4.Caption = Int(MaxUser / 4 * 3)
    lu3.Caption = Int(MaxUser / 4 * 2)
    lu2.Caption = Int(MaxUser / 4)
End Sub

