VERSION 5.00
Object = "{6D6671BA-4119-11D2-93F3-00104B2B96D7}#1.2#0"; "MSMDCB.OCX"
Begin VB.Form CubeBrowser 
   Caption         =   "CubeBrowser"
   ClientHeight    =   6735
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9750
   LinkTopic       =   "Form2"
   ScaleHeight     =   6735
   ScaleWidth      =   9750
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cboDatabase 
      Height          =   315
      Left            =   1440
      TabIndex        =   2
      Top             =   240
      Width           =   1455
   End
   Begin VB.ComboBox cboCube 
      Height          =   315
      Left            =   3960
      TabIndex        =   1
      Top             =   240
      Width           =   1455
   End
   Begin OLAPCubeBrowser.CubeBrowser CubeBrowser1 
      Height          =   5895
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   9495
      _ExtentX        =   16748
      _ExtentY        =   10398
   End
   Begin VB.Label lblcube 
      Caption         =   "Cube Name"
      Height          =   255
      Left            =   3000
      TabIndex        =   4
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label lbldb 
      Caption         =   "Database Name"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "CubeBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Sub initDatabase()
    Dim cnn1 As ADODB.Connection
    Dim rstSchema As ADODB.Recordset
    Dim strCnn As String
        
    Set cnn1 = New ADODB.Connection
   ' strCnn = "Data Source=" & LoginForm.txtserv & ";Provider=msolap"
    strCnn = "Data Source=" & LoginForm.txtserv & ";Provider=msolap; User ID=" & LoginForm.txtLogin & "; Password=" & LoginForm.txtPassword & ";"
    cnn1.Open strCnn
        
    Set rstSchema = cnn1.OpenSchema(adSchemaCatalogs)
    
    Do Until rstSchema.EOF
       
        cboDatabase.AddItem rstSchema!CATALOG_NAME
        rstSchema.MoveNext
    Loop
    rstSchema.Close
  
    cnn1.Close
End Sub
Public Sub initCube()
    cboCube.Clear
    
    Dim cnn1 As ADODB.Connection
    Dim rstSchema As ADODB.Recordset
    Dim strCnn As String
        
    Set cnn1 = New ADODB.Connection
    strCnn = "Data Source=" & LoginForm.txtserv & ";Provider=msolap;initial catalog=" & cboDatabase.List(cboDatabase.ListIndex)
    cnn1.Open strCnn
        
    Set rstSchema = cnn1.OpenSchema(adSchemaCubes)
    
    Do Until rstSchema.EOF
       
        cboCube.AddItem rstSchema!CUBE_NAME
        rstSchema.MoveNext
    Loop
    rstSchema.Close
    
    cnn1.Close
End Sub

Private Sub cboCube_Click()
  ' MsgBox cboDatabase.List(cboDatabase.ListIndex)
   'MsgBox cboCube.List(cboCube.ListIndex)
  ' CubeBrowser1.ConnectWStr LoginForm.txtServer, cboDatabase.List(cboDatabase.ListIndex), _
   '                        cboCube.List(cboCube.ListIndex)
   Dim conn As New ADODB.Connection
   Dim strcon As String
   
  strcon = "Data Source=" & LoginForm.txtserv & ";Provider=msolap;initial catalog=" & cboDatabase.List(cboDatabase.ListIndex)
  'strconn = "Provider=msolap;Data Source=kadop; initial catalog=FoodMart 2000;"
   conn.Open strcon
   CubeBrowser1.Connect conn, "Sales"
   'CubeBrowser1.Connect conn, cboCube.List(cboCube.ListIndex)
   
End Sub

Private Sub cboDatabase_Click()
   initCube
End Sub

Private Sub Form_Load()
   initDatabase
End Sub


Private Sub Form_Unload(Cancel As Integer)
  CubeBrowser1.Disconnect
End Sub
