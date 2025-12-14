VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form formDatabase 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Extentional Database"
   ClientHeight    =   6495
   ClientLeft      =   1620
   ClientTop       =   1455
   ClientWidth     =   8175
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   8175
   Begin VB.Frame frmImportData 
      Caption         =   "Import Data :"
      Height          =   2055
      Left            =   2160
      TabIndex        =   77
      Top             =   1680
      Visible         =   0   'False
      Width           =   3015
      Begin VB.CommandButton cmdImportNo 
         Caption         =   "&No"
         Height          =   495
         Left            =   1680
         TabIndex        =   79
         Top             =   1200
         Width           =   975
      End
      Begin VB.CommandButton cmdImportYes 
         Caption         =   "&Yes"
         Height          =   495
         Left            =   360
         TabIndex        =   78
         Top             =   1200
         Width           =   975
      End
      Begin VB.Label lblImportData 
         Alignment       =   2  'Center
         Caption         =   "Import Data Now ?"
         Height          =   495
         Left            =   240
         TabIndex        =   80
         Top             =   480
         Width           =   2535
      End
   End
   Begin VB.Frame frmInputFacts 
      Caption         =   "Extersional Knowledge Base :"
      Height          =   6495
      Left            =   0
      TabIndex        =   48
      Top             =   0
      Visible         =   0   'False
      Width           =   8175
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   10
         Left            =   5280
         TabIndex        =   81
         Top             =   5160
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.CommandButton cmdFactsCancel 
         Caption         =   "Cancel"
         Enabled         =   0   'False
         Height          =   375
         Left            =   6720
         TabIndex        =   74
         Top             =   5880
         Width           =   855
      End
      Begin VB.CommandButton cmdFactsClose 
         Caption         =   "&Close"
         Height          =   375
         Left            =   6720
         TabIndex        =   75
         Top             =   5880
         Width           =   855
      End
      Begin VB.CommandButton cmdFactsDelete 
         Caption         =   "&Delete"
         Enabled         =   0   'False
         Height          =   375
         Left            =   5040
         TabIndex        =   73
         Top             =   5880
         Width           =   855
      End
      Begin VB.CommandButton cmdFactsUpdate 
         Caption         =   "&Update"
         Enabled         =   0   'False
         Height          =   375
         Left            =   3480
         TabIndex        =   72
         Top             =   5880
         Width           =   855
      End
      Begin VB.CommandButton cmdFactsAdd 
         Caption         =   "&Add"
         Enabled         =   0   'False
         Height          =   375
         Left            =   1920
         TabIndex        =   71
         Top             =   5880
         Width           =   855
      End
      Begin VB.CommandButton cmdFactsNew 
         Caption         =   "&New"
         Enabled         =   0   'False
         Height          =   375
         Left            =   480
         TabIndex        =   70
         Top             =   5880
         Width           =   855
      End
      Begin MSComctlLib.ListView lvwFacts 
         Height          =   5175
         Left            =   360
         TabIndex        =   69
         Top             =   360
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   9128
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   9
         Left            =   5280
         TabIndex        =   68
         Top             =   4680
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   8
         Left            =   5280
         TabIndex        =   66
         Top             =   4200
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   7
         Left            =   5280
         TabIndex        =   64
         Top             =   3720
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   6
         Left            =   5280
         TabIndex        =   62
         Top             =   3240
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   5
         Left            =   5280
         TabIndex        =   60
         Top             =   2760
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   4
         Left            =   5280
         TabIndex        =   58
         Top             =   2280
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   3
         Left            =   5280
         TabIndex        =   56
         Top             =   1800
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   2
         Left            =   5280
         TabIndex        =   54
         Top             =   1320
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Height          =   315
         Index           =   1
         Left            =   5280
         TabIndex        =   52
         Top             =   840
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.TextBox txtValue 
         Enabled         =   0   'False
         Height          =   315
         Index           =   0
         Left            =   5280
         TabIndex        =   50
         Top             =   360
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   10
         Left            =   4200
         TabIndex        =   82
         Top             =   5160
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   9
         Left            =   4200
         TabIndex        =   67
         Top             =   4680
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   8
         Left            =   4200
         TabIndex        =   65
         Top             =   4200
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   7
         Left            =   4200
         TabIndex        =   63
         Top             =   3720
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   6
         Left            =   4200
         TabIndex        =   61
         Top             =   3240
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   5
         Left            =   4200
         TabIndex        =   59
         Top             =   2760
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   4
         Left            =   4200
         TabIndex        =   57
         Top             =   2280
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   3
         Left            =   4200
         TabIndex        =   55
         Top             =   1800
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   2
         Left            =   4200
         TabIndex        =   53
         Top             =   1320
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   1
         Left            =   4200
         TabIndex        =   51
         Top             =   840
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lblName 
         Caption         =   "Label1"
         Height          =   255
         Index           =   0
         Left            =   4200
         TabIndex        =   49
         Top             =   360
         Visible         =   0   'False
         Width           =   855
      End
   End
   Begin VB.Frame frmDBLists 
      Caption         =   "Database :"
      Height          =   4695
      Left            =   0
      TabIndex        =   35
      Top             =   0
      Visible         =   0   'False
      Width           =   7575
      Begin VB.TextBox txtDBFile 
         Enabled         =   0   'False
         Height          =   315
         Left            =   360
         ScrollBars      =   2  'Vertical
         TabIndex        =   47
         Top             =   720
         Width           =   1935
      End
      Begin VB.ListBox lstDBSlots 
         Height          =   1950
         Left            =   360
         TabIndex        =   44
         Top             =   2040
         Width           =   4575
      End
      Begin VB.CommandButton cmdDBCancel 
         Caption         =   "&Cancel"
         Height          =   495
         Left            =   5640
         TabIndex        =   42
         Top             =   3720
         Width           =   1215
      End
      Begin VB.CommandButton cmdDBImport 
         Caption         =   "&Import"
         Height          =   495
         Left            =   5640
         TabIndex        =   41
         Top             =   3000
         Width           =   1215
      End
      Begin VB.ListBox lstDBDomain 
         Height          =   900
         Left            =   5280
         TabIndex        =   40
         Top             =   1800
         Width           =   1935
      End
      Begin VB.ListBox lstDBDatabase 
         Height          =   900
         Left            =   2640
         TabIndex        =   38
         Top             =   720
         Width           =   2295
      End
      Begin VB.TextBox txtDBClassName 
         Height          =   315
         Left            =   5280
         TabIndex        =   37
         Top             =   720
         Width           =   1935
      End
      Begin VB.Label lblDBFile 
         Caption         =   "Databasse File"
         Height          =   255
         Left            =   360
         TabIndex        =   46
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label lblDBSlots 
         Caption         =   "Property :"
         Height          =   255
         Left            =   360
         TabIndex        =   45
         Top             =   1440
         Width           =   2295
      End
      Begin VB.Label lblDBDomain 
         Caption         =   "Domain :"
         Height          =   255
         Left            =   5280
         TabIndex        =   43
         Top             =   1320
         Width           =   1815
      End
      Begin VB.Label lblDBClassName 
         Caption         =   "Class Name :"
         Height          =   255
         Left            =   5280
         TabIndex        =   39
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label lblDBDatabase 
         Caption         =   "DataBase :"
         Height          =   255
         Left            =   2640
         TabIndex        =   36
         Top             =   360
         Width           =   1695
      End
   End
   Begin MSAdodcLib.Adodc ADODatabase 
      Height          =   375
      Left            =   4800
      Top             =   6120
      Visible         =   0   'False
      Width           =   1905
      _ExtentX        =   3360
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.Frame frmFileDetails 
      Caption         =   "Details :"
      Height          =   2535
      Left            =   5280
      TabIndex        =   32
      Top             =   0
      Visible         =   0   'False
      Width           =   2895
      Begin VB.TextBox txtFileDetails 
         Height          =   1935
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   1  'Horizontal
         TabIndex        =   33
         Top             =   360
         Width           =   2415
      End
   End
   Begin VB.Frame frmImport 
      Caption         =   "Import Database :"
      Height          =   5415
      Left            =   0
      TabIndex        =   26
      Top             =   0
      Visible         =   0   'False
      Width           =   5295
      Begin VB.CommandButton cmdCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   3240
         TabIndex        =   31
         Top             =   4800
         Width           =   975
      End
      Begin VB.CommandButton cmdGetDetails 
         Caption         =   "&Select"
         Height          =   375
         Left            =   960
         TabIndex        =   30
         Top             =   4800
         Width           =   975
      End
      Begin VB.FileListBox File1 
         Height          =   4290
         Left            =   2760
         Pattern         =   "*.mdb"
         TabIndex        =   29
         Top             =   360
         Width           =   2295
      End
      Begin VB.DirListBox Dir1 
         Height          =   3690
         Left            =   240
         TabIndex        =   28
         Top             =   960
         Width           =   2295
      End
      Begin VB.DriveListBox Drive1 
         Height          =   330
         Left            =   240
         TabIndex        =   27
         Top             =   360
         Width           =   2295
      End
   End
   Begin VB.Frame frmFacts 
      Caption         =   "Extensional Knowledge Base :"
      Height          =   3375
      Left            =   2520
      TabIndex        =   24
      Top             =   1080
      Visible         =   0   'False
      Width           =   2415
      Begin VB.ListBox lstSlots 
         Enabled         =   0   'False
         Height          =   2790
         Left            =   240
         TabIndex        =   25
         Top             =   360
         Width           =   1935
      End
   End
   Begin VB.Frame frmIF 
      Caption         =   "Select Parameters :"
      Height          =   6495
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   2535
      Begin VB.CommandButton cmdIFO 
         Caption         =   "&Open"
         Enabled         =   0   'False
         Height          =   375
         Left            =   1440
         TabIndex        =   76
         Top             =   5280
         Width           =   855
      End
      Begin VB.CommandButton cmdIFI 
         Caption         =   "&Import"
         Height          =   375
         Left            =   360
         TabIndex        =   34
         Top             =   5880
         Width           =   855
      End
      Begin VB.CommandButton cmdIFR 
         Caption         =   "&Delete"
         Enabled         =   0   'False
         Height          =   375
         Left            =   1440
         TabIndex        =   21
         Top             =   5280
         Width           =   855
      End
      Begin VB.ListBox lstDomainIF 
         Height          =   1530
         Left            =   360
         TabIndex        =   20
         Top             =   720
         Width           =   1815
      End
      Begin VB.CommandButton cmdIFC 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   1440
         TabIndex        =   19
         Top             =   5880
         Width           =   855
      End
      Begin VB.CommandButton cmdIFN 
         Caption         =   "&New"
         Height          =   375
         Left            =   360
         TabIndex        =   18
         Top             =   5280
         Width           =   855
      End
      Begin VB.ListBox lstEKB 
         Height          =   1950
         Left            =   360
         TabIndex        =   17
         Top             =   3000
         Width           =   1815
      End
      Begin VB.Label lblDomainIF 
         Caption         =   "Select Domain :"
         Height          =   255
         Left            =   360
         TabIndex        =   23
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label lbllstEKB 
         Caption         =   "         Extensional                   Knowledge Base :"
         Height          =   615
         Left            =   360
         TabIndex        =   22
         Top             =   2400
         Width           =   1815
      End
   End
   Begin VB.Frame frmSlotsList 
      Caption         =   "Select :"
      Height          =   6495
      Left            =   2520
      TabIndex        =   8
      Top             =   0
      Visible         =   0   'False
      Width           =   2175
      Begin VB.ListBox lstIFParm 
         Height          =   1740
         Left            =   240
         TabIndex        =   12
         Top             =   3720
         Width           =   1695
      End
      Begin VB.ListBox lstIFFrame 
         Height          =   1320
         Left            =   240
         TabIndex        =   11
         Top             =   2040
         Width           =   1695
      End
      Begin VB.ListBox lstIFDomain 
         Height          =   900
         Left            =   240
         TabIndex        =   10
         Top             =   720
         Width           =   1695
      End
      Begin VB.CommandButton cmdIFA 
         Caption         =   "&Add"
         Height          =   375
         Left            =   720
         TabIndex        =   9
         Top             =   5880
         Width           =   855
      End
      Begin VB.Label lblIFParm 
         Caption         =   "Parameters :"
         Height          =   375
         Left            =   240
         TabIndex        =   15
         Top             =   3480
         Width           =   1815
      End
      Begin VB.Label lblIFDomain 
         Caption         =   "Domain :"
         Height          =   375
         Left            =   240
         TabIndex        =   14
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lblIFFrame 
         Caption         =   "Frame :"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   1800
         Width           =   1815
      End
   End
   Begin VB.Frame frmSlotsSelect 
      Caption         =   "Extensional Knowledge Base :"
      Height          =   6495
      Left            =   4680
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   2535
      Begin VB.TextBox txtEKB 
         Height          =   315
         Left            =   360
         TabIndex        =   5
         Top             =   600
         Width           =   1815
      End
      Begin VB.CommandButton cmdIFC2 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   840
         TabIndex        =   4
         Top             =   5880
         Width           =   855
      End
      Begin VB.ListBox lstIFSlots 
         Height          =   3420
         Left            =   360
         TabIndex        =   3
         Top             =   1440
         Width           =   1815
      End
      Begin VB.CommandButton cmdIFD 
         Caption         =   "&Delete"
         Height          =   375
         Left            =   360
         TabIndex        =   2
         Top             =   5280
         Width           =   855
      End
      Begin VB.CommandButton cmdIFB 
         Caption         =   "&Build"
         Height          =   375
         Left            =   1320
         TabIndex        =   1
         Top             =   5280
         Width           =   855
      End
      Begin VB.Label lblEKBName 
         Caption         =   "Name :"
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Width           =   1575
      End
      Begin VB.Label lblIFSlots 
         Caption         =   "Slots Select :"
         Height          =   375
         Left            =   360
         TabIndex        =   6
         Top             =   1080
         Width           =   1335
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "formDatabase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const CAllDomain = "AllDomain"

Const TCDomain = "FrameSchema"
Const TCGoals = "Goals"
Const TCParameters = "Parameters"
Const TCRules = "Rules"
Const TCMethods = "Routines"
Const TCEKB = "EKB"

Dim cache As New cacheobject.Factory

'Variables keep Name of Class

Dim CDomain As String
Dim InstanceFrame As String
Dim IDCDomain As Integer
Dim IDCparameters As Integer
Dim IDFrame As Integer
Dim IDCRules As Integer

Dim IDDatabase As Integer

Dim CEKB As String
Dim IDCEKB As Integer
Dim SlotsName As String
Dim IDSlots As Integer
Dim IDFacts As Integer

'Variables for all
Dim selectcombo As Object
Dim createclass As Object
Dim mainclass As Object
Dim deleteclass As Object
Dim embedclass1 As Object

Dim getinstance As Object
Dim deleteinstance As Object
Dim insertinstance As Object

Dim queryinstance As Object
Dim SqlStatement As String

Dim domainindex As Integer
Dim frameindex As Integer
Dim parmsindex As Integer
Dim rulesindex As Integer
Dim ekbindex As Integer
Dim columnFacts As Integer

Dim i, j, k, l As Integer
Dim tmp, tmp1 As Variant
Dim oid As Integer
Dim columns As Integer

Dim Conn As ADODB.Connection
Dim rsSchema As ADODB.Recordset
Dim Cmd As ADODB.Command

Dim StrConn As String
Dim DBName As String
Dim DBDetails() As String
Dim currentTable As String
Dim nextTable As String
Dim CountTable As Integer
Dim addlist As ListItem

'Cache 4
'1. ID
'2. Destination
'3. FrameTranslation
'4. Goals ( Name GoalsTranslation Type)
'5. Name
'6. Parameters ( Name ParametersTranslation Prompt Type Expect Value Default)
'7. Rules ( FramePointer IfStatement ThenStatement)
'8.Source

Private Sub cmdGetDetails_Click()
    
    Dim tmpDBDetails() As String
    Dim tmpDBType() As String
    
    'get database details
    'map to DBDetails
    'load frame to show details
    'select table to import
    
    'manage frame
    frmFileDetails.Visible = False
    frmImport.Visible = False
        
    Screen.MousePointer = vbHourglass
    'Get Table Name and Columns for Each Table
    Call GetTableAndColumn
    
    'Get Table Name ,Table Type ,Table Column and Column Type and Column Size
    Call GetTypeDB
    
    'show frame and select table to build
    Call MapToCache
    Screen.MousePointer = vbDefault
    
    'manage fram button in next frame
    frmDBLists.Visible = True
    cmdDBImport.Enabled = False
    cmdDBCancel.Enabled = True
    
End Sub

Private Sub GetTableAndColumn()

    Dim tmpDBDetails() As String
        
    DBName = Dir1.List(Dir1.ListIndex) & "\" & File1.FileName
    DBName = Replace(DBName, "\\", "\", 1, -1, vbTextCompare)
    
    StrConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBName & ";Persist Security Info=False"
    'connect Database
    Set Conn = New ADODB.Connection
    Conn.Open StrConn
    
    'open Table
    
    'get all of table
    Set rsSchema = Conn.OpenSchema(adSchemaTables)
    i = 0
    currentTable = ""
    nextTable = "'"
    While Not rsSchema.EOF
        currentTable = rsSchema!Table_Name
        If (currentTable <> nextTable) Then
            i = i + 1
            nextTable = rsSchema!Table_Name
        End If
        rsSchema.MoveNext
    Wend
    CountTable = i
    
    ReDim tmpDBDetails(1 To CountTable, 1 To 4) As String
    'get table name
    Set rsSchema = Conn.OpenSchema(adSchemaColumns)
    i = 0
    currentTable = ""
    nextTable = ""
    While Not rsSchema.EOF
        currentTable = rsSchema!Table_Name
        If (currentTable <> nextTable) Then
            i = i + 1
            tmpDBDetails(i, 1) = rsSchema!Table_Name
            nextTable = rsSchema!Table_Name
        End If
        rsSchema.MoveNext
    Wend

    'get type of table
    j = 0
    i = 1
    Set rsSchema = Conn.OpenSchema(adSchemaTables)
    While Not rsSchema.EOF
        If tmpDBDetails(i, 1) = rsSchema!Table_Name Then
            tmpDBDetails(i, 2) = rsSchema!Table_Type
            i = i + 1
        End If
        rsSchema.MoveNext
    Wend
    
    i = 0
    'get number of  TABLE class
    For j = 1 To CountTable
        If tmpDBDetails(j, 2) = "TABLE" Then
            i = i + 1
        End If
    Next j
    
    'map to DBDetails
    ReDim DBDetails(1 To i, 1 To 4) As String
    i = 0
    For j = 1 To CountTable
        If tmpDBDetails(j, 2) = "TABLE" Then
            i = i + 1
            DBDetails(i, 1) = tmpDBDetails(j, 1)
            DBDetails(i, 2) = tmpDBDetails(j, 2)
        End If
    Next j
    CountTable = i

End Sub

Private Sub GetTypeDB()

    Dim rs As ADODB.Recordset
    Dim fld As ADODB.Field
    Dim flds As Variant
    
    Set Conn = New ADODB.Connection
    With Conn
        .ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBName & ";Persist Security Info=False"
        .CommandTimeout = 25
        .CursorLocation = adUseClient
        .Open
    End With
    
    Set Cmd = New ADODB.Command
    Set rs = New ADODB.Recordset
    
    For i = 1 To CountTable
        DBDetails(i, 3) = ""
        With Cmd
            .CommandText = "Select * From " & DBDetails(i, 1)
            .CommandType = adCmdText
            .ActiveConnection = Conn
        End With
        Set rs = Cmd.Execute
        j = 0
        Set flds = rs.Fields
        For Each fld In flds
            DBDetails(i, 3) = DBDetails(i, 3) & fld.Name & "/"
            DBDetails(i, 4) = DBDetails(i, 4) & fld.Type & "/"
        j = j + 1
        Next
        DBDetails(i, 3) = Left(DBDetails(i, 3), Len(DBDetails(i, 3)) - 1)
        DBDetails(i, 4) = Left(DBDetails(i, 4), Len(DBDetails(i, 4)) - 1)
    Next i
    
    For i = 1 To CountTable
        Debug.Print "Table : " & i & " Name : "; DBDetails(i, 1) & " Type : " & DBDetails(i, 2) & " Column : " & DBDetails(i, 3) & " Column Type : " & DBDetails(i, 4)
    Next i
    
    'Meaning of Type
    'Text                       202
    'Memo                   203
    'Number                    3,2
    'Date/Time              7
    'Currency                  6
    'AutoNumber           3
    'YesNO                   11
    'OLE Object         205

End Sub

Private Sub MapToCache()
    
    'DBDetails(i,1) tell TableName
    'DBDetails(i,2) tell Type of Table
    'DBDetails(i,3) tell All of Columns
    'DBDetails(i,4) tell Type of Columns
    
    'show detalis
    txtDBFile.Text = DBName
    
    'Load lstDBDatabase list and lstDBSlots
    lstDBDatabase.Clear
    For i = 1 To CountTable
        lstDBDatabase.AddItem DBDetails(i, 1), i - 1 'add db name
    Next i
    
    'Load lstDBDomain
    Call LoadDomainList(lstDBDomain)
    
End Sub

Private Sub lstDBDatabase_Click()
    
    Dim splitColumn() As String
    Dim splitType() As String
    Dim ColumnType As String
    
    IDDatabase = lstDBDatabase.ListIndex + 1
    txtDBClassName.Text = lstDBDatabase.List(lstDBDatabase.ListIndex)
    
    lstDBSlots.Clear
    'split column DBDetails(i,3)
    splitColumn = Split(DBDetails(IDDatabase, 3), "/", -1, vbTextCompare)
    splitType = Split(DBDetails(IDDatabase, 4), "/", -1, vbTextCompare)
    
    For i = 0 To UBound(splitColumn)
    'Change Type
    'Text                202           -> %String         DefineSize 50
    'Memo            203           -> %                    DefineSize 536870910 2^29
    'Number              3,2       -> %Numeric   DefineSize 4
    'Date/Time        7           -> %Date          DefineSize 8
    'Currency            6           ->%Currency   DefineSize 8
    'AutoNumber     3           -> %Numeric   DefineSize   4     Don't knon how it's difference between  Number and AutoNumber
    'YesNO             11           -> %String        DefineSize    2
    'OLE Object   205           ->                        DefineSize    1073741823 2^30
        If splitType(i) = 2 Then
            ColumnType = "Numeric"
        ElseIf splitType(i) = 3 Then
            ColumnType = "Numeric"
        ElseIf splitType(i) = 6 Then
            ColumnType = "Currency"
        ElseIf splitType(i) = 7 Then
            ColumnType = "Date"
        ElseIf splitType(i) = 11 Then
            ColumnType = "YES/NO"
        ElseIf splitType(i) = 202 Then
            ColumnType = "Text"
        ElseIf splitType(i) = 203 Then
            ColumnType = "Memo"
        ElseIf splitType(i) = 205 Then
            ColumnType = "OLE Object"
        End If
        lstDBSlots.AddItem " Column : " & splitColumn(i) & " Type : " & ColumnType
    Next i
    
    cmdDBImport.Enabled = True
    
End Sub

Private Sub lstDBDomain_Click()

    CDomain = lstDBDomain.List(lstDBDomain.ListIndex)
    IDCDomain = lstDBDomain.ListIndex + 1

End Sub

Private Sub txtDBClassName_LostFocus()

    txtDBClassName.Text = Replace(txtDBClassName.Text, " ", "_", 1, -1, vbTextCompare)
    
End Sub

Private Sub cmdDBImport_Click()

    Dim splitColumn() As String
    Dim splitType() As String
    
    Screen.MousePointer = vbHourglass
    
    CEKB = txtDBClassName.Text
    If txtDBClassName.Text = "" Then
        If lstDBDomain.ListIndex <= -1 Then
            MsgBox "Select Domain to Import Beform"
            Exit Sub
        End If
        MsgBox "Enter the Name of Class Name"
        Exit Sub
    Else
        If lstDBDomain.ListIndex <= -1 Then
            MsgBox "Select Domain to Import Beform"
        Else
            'OK do operation
            'call methods to build class
            'send name and slots and tagType
    'Change Type
    'Text                202             -> %String         DefineSize 50
    'Memo            203              -> %String                    DefineSize 536870910 2^29
    'Number              3,2          -> %Numeric   DefineSize 4
    'Date/Time        7              -> %Date          DefineSize 8
    'Currency            6               ->%Currency   DefineSize 8
    'AutoNumber     3               -> %Numeric   DefineSize   4     Don't knon how it's difference between  Number and AutoNumber
    'YesNO             11               -> %String        DefineSize    2
    'OLE Object   205               ->%Stream       DefineSize    1073741823 2^30
            'Operation
            '1. create class and insert slots
            '1.1 compile class
            '2. insert list of EKB and add to CAllDomain
            '2.1 open CAllDomain
            '2.2 new TCEKB embeddable
            '2.3 add EKB property list
            '2.4 save to CAllDomain
            '1. createclass and insert slots
            
            splitColumn = Split(DBDetails(IDDatabase, 3), "/", -1, vbTextCompare)
            splitType = Split(DBDetails(IDDatabase, 4), "/", -1, vbTextCompare)
            For i = 0 To UBound(splitColumn)
                If splitType(i) = 2 Then        'Number
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB1(DBDetails(IDDatabase, 1), splitColumn(i))
                ElseIf splitType(i) = 3 Then    'Number
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB1(DBDetails(IDDatabase, 1), splitColumn(i))
                ElseIf splitType(i) = 6 Then    'Currency
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB2(DBDetails(IDDatabase, 1), splitColumn(i))
                ElseIf splitType(i) = 7 Then    'Date
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB3(DBDetails(IDDatabase, 1), splitColumn(i))
                ElseIf splitType(i) = 11 Then   'Yes/No
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB4(DBDetails(IDDatabase, 1), splitColumn(i))
                ElseIf splitType(i) = 202 Then  'Text
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB5(DBDetails(IDDatabase, 1), splitColumn(i))
                ElseIf splitType(i) = 203 Then  'Memo
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB6(DBDetails(IDDatabase, 1), splitColumn(i))
                ElseIf splitType(i) = 205 Then  'OLE Object
                    Set createclass = cache.Static(TCMethods)
                    tmp = createclass.CreateEKB7(DBDetails(IDDatabase, 1), splitColumn(i))
                End If
            Next i
            
            'check ekb count
            Set getinstance = cache.OpenId(CAllDomain, 1)
            tmp = getinstance.EKB.Count
            If tmp <> 0 Then
                For i = 1 To tmp
                    tmp = getinstance.EKB.RemoveAt(i)
            Next i
            End If
            getinstance.sys_Save
            getinstance.sys_Close
            
            '1.1 complie class
            Set createclass = cache.Static(TCMethods)
            tmp = createclass.CompileEKB(DBDetails(IDDatabase, 1))
            
            '2. insert list of EKB and add to CAllDomain
            '2.1 open CAllDomain
            '2.2 new TCEKB embeddable
            '2.3 add EKB property list
            '2.4 save to CAllDomain
            
            '2.1 open CAllDomain
            Set mainclass = cache.OpenId(CAllDomain, IDCDomain)
            If mainclass Is Nothing Then
                MsgBox "Error"
            Else
                '2.2 new TCEKB  embeddable
                Set embedclass1 = cache.New(TCEKB)
                embedclass1.Name = txtDBClassName.Text
                '2.3 add EKB property list
                For i = 0 To UBound(splitColumn)
                    tmp = embedclass1.Slots.Insert(splitColumn(i))
                Next i
                '2.4 save to CAllDomain
                tmp = mainclass.EKB.InsertAt(embedclass1, 1)
                mainclass.sys_Save
                embedclass1.sys_Close
                mainclass.sys_Close
            End If
            MsgBox "Import OK"
            Call LoadEKBList(lstEKB)
        End If
    End If
    Screen.MousePointer = vbDefault
    frmDBLists.Visible = False
    frmImport.Visible = False
    frmImportData.Visible = True
    

End Sub

Private Sub cmdImportYes_Click()
    
    Dim rs As ADODB.Recordset
    Dim fld As ADODB.Field
    Dim flds As Variant
    Dim tmpSplitColumn() As String
    
    'Import Data
    'operation
    Set Conn = New ADODB.Connection
    With Conn
        .ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBName & ";Persist Security Info=False"
        .CommandTimeout = 25
        .CursorLocation = adUseClient
        .Open
    End With
    
    Set Cmd = New ADODB.Command
    Set rs = New ADODB.Recordset
    
    With Cmd
        .CommandText = "Select * From " & DBDetails(IDDatabase, 1)
        .CommandType = adCmdText
        .ActiveConnection = Conn
    End With
    i = 0
    'split
    tmpSplitColumn = Split(DBDetails(IDDatabase, 3), "/", -1, vbTextCompare)
    Set rs = Cmd.Execute
    tmp1 = ""
    While Not rs.EOF
        i = i + 1
        Set flds = rs.Fields
        Set insertinstance = cache.Static(TCMethods)
        tmp = insertinstance.InstanceNew(CEKB, tmpSplitColumn(0), tmp1)
        j = 1
        For Each fld In flds
            If j = 1 Then
                tmp = insertinstance.InstanceOpen(CEKB, i, fld.Name, fld.Value)
                j = j + 1
            Else
                tmp = insertinstance.InstanceOpen(CEKB, i, fld.Name, UCase$(fld.Value))
            End If
            
        Next
        rs.MoveNext
    Wend
    
    MsgBox "Import Data OK"
    
    frmDBLists.Visible = False
    frmImport.Visible = False
    frmImportData.Visible = False
    frmIF.Enabled = True

End Sub

Private Sub cmdImportNo_Click()

    frmDBLists.Visible = False
    frmImport.Visible = True
    frmImportData.Visible = False

End Sub

Private Sub cmdDBCancel_Click()

    frmImport.Visible = True
    frmDBLists.Visible = False
    
End Sub

Private Sub cmdCancel_Click()
    
    frmImport.Visible = False
    frmIF.Enabled = True
    frmFileDetails.Visible = False
    
End Sub

Private Sub cmdIFI_Click()
    
    frmImport.Visible = True
    frmIF.Enabled = False
    frmSlotsList.Visible = False
    frmSlotsSelect.Visible = False
    cmdGetDetails.Enabled = False

End Sub

Private Sub File1_Click()

    Dim SelectFile As New FileSystemObject
    Dim FileDetails As File
    Dim FileDat As Variant

    'show file details
    frmFileDetails.Visible = True

    If File1.FileName <> "" Then
        Set FileDetails = SelectFile.GetFile(Dir1.List(Dir1.ListIndex) & "\" & File1.FileName)
        FileDat = UCase(FileDetails.Name) & " file." & vbCrLf
        FileDat = FileDat & "File Created : " & FileDetails.DateCreated & vbCrLf
        FileDat = FileDat & "File Last Accessed : " & FileDetails.DateLastAccessed & vbCrLf
        FileDat = FileDat & "File Last Modified : " & FileDetails.DateLastModified & vbCrLf
        FileDat = FileDat & "File Size : " & FileDetails.Size & " Byte(s). " & vbCrLf
        FileDat = FileDat & "File Type : " & FileDetails.Type
        txtFileDetails.Text = FileDat & vbCrLf & CStr(Day(FileDetails.DateCreated)) & "/" & CStr(Month(FileDetails.DateCreated)) & "/" & CStr(Year(FileDetails.DateCreated))
    End If
    
    cmdGetDetails.Enabled = True
    
End Sub

Private Sub mnuExit_Click()
    
    formDatabase.Visible = False
    formDevelop.Visible = True
    
End Sub

Private Sub Dir1_Change()
    
    File1.Path = Dir1.Path
    frmFileDetails.Visible = False

End Sub

Private Sub Dir1_Click()
    
    tmp = Split(Dir1.List(Dir1.ListIndex), "\", -1, vbTextCompare)
    Dir1.ToolTipText = tmp(UBound(tmp))

End Sub

Private Sub Drive1_Change()

   Dir1.Path = Drive1.Drive
   frmFileDetails.Visible = False
   
End Sub

Private Sub cmdIFO_Click()
    
    'get property of cekb class
    SqlStatement = "Select * from " & CEKB
    frmInputFacts.Visible = True
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    For i = 0 To queryinstance.GetColumnCount - 1
            lblName(i).Visible = True
            lblName(i).Caption = queryinstance.GetColumnHeader(i + 1)
            txtValue(i).Visible = True
    Next i
    queryinstance.Close
    
    'manage lvwFacts
    SqlStatement = "Select * from " & CEKB
    frmInputFacts.Visible = True
    
    lvwFacts.ColumnHeaders.Clear
    lvwFacts.ListItems.Clear
    
    'add column header
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    columnFacts = queryinstance.GetColumnCount
    For i = 1 To queryinstance.GetColumnCount
        If (i = 1) Then
            lvwFacts.ColumnHeaders.Add , , queryinstance.GetColumnHeader(i), 500, lvwColumnLeft
        Else
            lvwFacts.ColumnHeaders.Add , , queryinstance.GetColumnHeader(i), , lvwColumnRight
        End If
    Next i
    queryinstance.Close
        
    'add value
    queryinstance.Execute
    i = 0
    While queryinstance.Next
        i = i + 1
        Set addlist = lvwFacts.ListItems.Add()
        addlist.Text = i
        For j = 2 To queryinstance.GetColumnCount
            addlist.SubItems(j - 1) = queryinstance.GetData(j)
        Next j
    Wend
    queryinstance.Close
    IDFacts = i
    cmdFactsNew.Enabled = True
    cmdFactsAdd.Enabled = False
    cmdFactsUpdate.Enabled = False
    cmdFactsDelete.Enabled = False
    cmdFactsCancel.Visible = False
    cmdFactsClose.Enabled = True


End Sub

Private Sub lvwFacts_ItemClick(ByVal item As MSComctlLib.ListItem)

    IDFacts = lvwFacts.SelectedItem
    SqlStatement = "Select * from " & CEKB
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    i = 0
    While queryinstance.Next
        i = i + 1
        If i = IDFacts Then
            txtValue(0) = i
            For j = 2 To columnFacts
                txtValue(j - 1) = queryinstance.GetData(j)
            Next j
        End If
    Wend
    queryinstance.Close
    
    cmdFactsNew.Enabled = True
    cmdFactsAdd.Enabled = False
    cmdFactsUpdate.Enabled = True
    cmdFactsDelete.Enabled = True
    cmdFactsCancel.Enabled = False
    cmdFactsClose.Enabled = True

End Sub

Private Sub cmdFactsNew_Click()

    For i = 1 To lvwFacts.ColumnHeaders.Count
        txtValue(i - 1).Text = ""
    Next i
    cmdFactsNew.Enabled = False
    cmdFactsAdd.Enabled = True
    cmdFactsUpdate.Enabled = False
    cmdFactsCancel.Visible = True
    cmdFactsCancel.Enabled = True
    cmdFactsClose.Enabled = True
    
End Sub

Private Sub cmdFactsAdd_Click()

    Dim tmpcolumn As String
    
    IDFacts = lvwFacts.ListItems.Count + 1
    tmp1 = ""
    Set insertinstance = cache.Static(TCMethods)
    tmpcolumn = lvwFacts.ColumnHeaders(2)
    tmp = insertinstance.InstanceNew(CEKB, tmpcolumn, tmp1)
    For i = 2 To lvwFacts.ColumnHeaders.Count
        tmpcolumn = lvwFacts.ColumnHeaders(i)
        If i = 2 Then
            tmp = insertinstance.InstanceOpen(CEKB, IDFacts, tmpcolumn, txtValue(i - 1).Text)
        Else
            tmp = insertinstance.InstanceOpen(CEKB, IDFacts, tmpcolumn, UCase$(txtValue(i - 1).Text))
        End If
    Next i
    'clear screen
    For i = 1 To lvwFacts.ColumnHeaders.Count
        txtValue(i - 1).Text = ""
    Next i
    Call cmdIFO_Click
    
    cmdFactsNew.Enabled = True
    cmdFactsAdd.Enabled = False
    cmdFactsUpdate.Enabled = False
    cmdFactsCancel.Visible = False
    cmdFactsClose.Enabled = True
    
End Sub

Private Sub cmdFactsUpdate_Click()
        
    Dim tmpcolumn As String
    
    IDFacts = lvwFacts.SelectedItem
    tmp1 = ""
    
    Debug.Print IDCDomain
    Debug.Print CAllDomain
    Debug.Print CDomain
    Set getinstance = cache.OpenId(CDomain, 1)
    If getinstance.Goals.GetAt(1).Name = "" Then
        Set insertinstance = cache.Static(TCMethods)
        For i = 2 To lvwFacts.ColumnHeaders.Count
            tmpcolumn = lvwFacts.ColumnHeaders(i)
            tmp = insertinstance.InstanceOpen(CEKB, IDFacts, tmpcolumn, UCase$(txtValue(i - 1).Text))
        Next i
    Else
        Set insertinstance = cache.Static(TCMethods)
        For i = 2 To lvwFacts.ColumnHeaders.Count
            tmpcolumn = lvwFacts.ColumnHeaders(i)
            If i = 2 Then
                tmp = insertinstance.InstanceOpen(CEKB, IDFacts, tmpcolumn, txtValue(i - 1).Text)
            Else
                tmp = insertinstance.InstanceOpen(CEKB, IDFacts, tmpcolumn, UCase$(txtValue(i - 1).Text))
            End If
        Next i
    End If
    
    For i = 1 To lvwFacts.ColumnHeaders.Count
        txtValue(i - 1).Text = ""
    Next i
    getinstance.sys_Close
    Call cmdIFO_Click
    
    cmdFactsNew.Enabled = False
    cmdFactsAdd.Enabled = True
    cmdFactsUpdate.Enabled = False
    cmdFactsClose.Enabled = True

End Sub

Private Sub cmdFactsDelete_Click()

    cmdFactsNew.Enabled = False
    cmdFactsAdd.Enabled = True
    cmdFactsUpdate.Enabled = False
    cmdFactsClose.Enabled = True

End Sub

Private Sub cmdFactsCancel_Click()

    cmdFactsNew.Enabled = True
    cmdFactsAdd.Enabled = False
    cmdFactsUpdate.Enabled = False
    cmdFactsDelete.Enabled = False
    cmdFactsCancel.Visible = False
    cmdFactsClose.Enabled = True

End Sub

Private Sub cmdFactsClose_Click()
    
    'clear frame
    SqlStatement = "Select * from " & CEKB
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    For i = 0 To queryinstance.GetColumnCount - 1
            lblName(i).Visible = False
            lblName(i).Caption = "Label1"
            txtValue(i).Visible = False
    Next i
    queryinstance.Close
    
    frmInputFacts.Visible = False
    
    cmdFactsNew.Enabled = True
    cmdFactsAdd.Enabled = False
    cmdFactsUpdate.Enabled = False
    cmdFactsDelete.Enabled = False
    cmdFactsClose.Enabled = True

End Sub


'********************************Extensional Knowledbe Base********************************************

Private Sub mnuIFacts_Click()
        
    'manage frame
    'load domain list
    'manage button
    'manage menu
    
    'manage frame
    frmIF.Visible = True
    
    'load domain list
    formDevelop.Caption = "Extensional Knowledge Base"
    Call LoadDomainList(lstDomainIF)
            
    'manage button
    cmdIFN.Enabled = True
    cmdIFR.Enabled = False
    
End Sub

Private Sub Form_Load()
    
    If cache.IsConnected Then
        MsgBox ("Connection is OK")
    Else
        ConnectToCache
    End If
    frmIF.Visible = True
    frmSlotsList.Visible = False
    frmSlotsSelect.Visible = False
    frmFacts.Visible = False
    frmFileDetails.Visible = False
    frmDBLists.Visible = False
    frmInputFacts.Visible = False
    
    Call LoadDomainList(lstDomainIF)
    

End Sub

Private Sub ConnectToCache()
    
    If cache.Connect("cn_iptcp:127.0.0.1[1972]:EXPERTSYSTEM") Then
        MsgBox ("Connect to Cache OK")
    Else
        MsgBox ("Can't Connect to Cache")
    End If

End Sub

Private Sub LoadDomainList(selectcombo As Object)

    Set queryinstance = cache.ResultSet(CAllDomain, "All")
    queryinstance.Execute
    columns = queryinstance.GetColumnCount()
    selectcombo.Clear
    domainindex = 0
    While queryinstance.Next
        selectcombo.AddItem queryinstance.GetData(2), domainindex
        domainindex = domainindex + 1
    Wend
    queryinstance.Close

End Sub

Private Sub LoadFrameList(selectlist As Object)
    
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    selectlist.Clear
    frameindex = 0
    While queryinstance.Next
        selectlist.AddItem queryinstance.GetData(5), frameindex
        frameindex = frameindex + 1
    Wend
    queryinstance.Close
    
End Sub

Private Sub LoadParametersList(selectcombo As Object)
    
    'get instance from cache
    'add to vb list
    
    'get instance from cache
    Set getinstance = cache.OpenId(CDomain, IDFrame)
    columns = getinstance.Parameters.Count
    selectcombo.Clear
    parmsindex = 0
    
    'add to vblist
    For j = 1 To columns
        selectcombo.AddItem getinstance.Parameters.GetAt(j).Name, parmsindex
        parmsindex = parmsindex + 1
    Next j
    getinstance.sys_Close

End Sub

Private Sub lstDomainIF_Click()
    
    'map var
    'load ekb list
    'manage button
    
    'map var
    CDomain = lstDomainIF.List(lstDomainIF.ListIndex)
    IDCDomain = lstDomainIF.ListIndex + 1
    
    'load ekb list
    Call LoadEKBList(lstEKB)
    IDCEKB = ekbindex
    
    'manage button
    cmdIFN.Enabled = True
    cmdIFR.Enabled = False
    frmFacts.Visible = False
        
End Sub

Private Sub LoadEKBList(selectcombo As Object)

    Set getinstance = cache.OpenId(CAllDomain, IDCDomain)
    columns = getinstance.EKB.Count
        selectcombo.Clear
    ekbindex = 0
    For i = 1 To columns
        selectcombo.AddItem getinstance.EKB.GetAt(i).Name, ekbindex
        ekbindex = ekbindex + 1
    Next i
    getinstance.sys_Close

End Sub

Private Sub lstEKB_Click()

    'map var
    'manage frame
    'operation
    'manage button
    
    'map var
    CEKB = lstEKB.List(lstEKB.ListIndex)
    IDCEKB = lstEKB.ListIndex + 1
    
    'manage frame
    frmFacts.Visible = True
    
    'operation
    'load EKB Class Property
    'manage lbl and txt
    'get slots from all frame
    'lstDomainIF click get name and id = CDomain,IDCDomain
    'lstEKB click get name and id =  CEKB, IDCEKB
    'get var from cache
    
    SqlStatement = "Select * from " & CEKB
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    columns = queryinstance.GetColumnCount()
    lstSlots.Clear
    For i = 1 To columns
        lstSlots.AddItem queryinstance.GetColumnName(i)
    Next i
    
    'manage button
    cmdIFR.Enabled = True
    cmdIFO.Enabled = True

End Sub

Private Sub cmdIFN_Click()
    
    'manage frame
    'manage frame
    'load domain list
    'manage button
    
    'manage frame
    frmFacts.Visible = False
    
    'manage frame
    frmIF.Enabled = False
    frmFacts.Visible = False
    frmSlotsList.Visible = True
    frmSlotsSelect.Visible = True
    
    
    'load domainlist
    Call LoadDomainList(lstIFDomain)
    Call LoadEKBList(lstEKB)
    
    'manage button
    cmdIFA.Enabled = False
    cmdIFD.Enabled = False
    cmdIFB.Enabled = False
    
End Sub

Private Sub cmdIFC_Click()

    'manage frame
    'manage menu
    
    'manage frame
    frmFacts.Visible = False
    Call ClearfrmFacts
    formDatabase.Visible = False
    formDevelop.Visible = True

End Sub

Private Sub lstIFDomain_Click()

    'map var
    'load frame list
    
    'map var
    CDomain = lstIFDomain.Text
    IDCDomain = lstIFDomain.ListIndex + 1
    
    'load frame list
    Call LoadFrameList(lstIFFrame)

End Sub

Private Sub lstIFFrame_Click()

    'map var
    'load parameter list
    
    'map var
    InstanceFrame = lstIFFrame.Text
    IDFrame = lstIFFrame.ListIndex + 1
    
    'load parameter list
    Call LoadParametersList(lstIFParm)
    
End Sub

Private Sub lstIFParm_Click()
    
    'manage button
    cmdIFA.Enabled = True

End Sub

Private Sub cmdIFA_Click()

    'add to frmSlotsSelect
    'manage button
    'load all list again to clear screen
    
    'add to frmSlotsSelect
    lstIFSlots.AddItem lstIFParm.Text, IDSlots
    IDSlots = IDSlots + 1
    
    'manage button
    cmdIFD.Enabled = False
    cmdIFB.Enabled = True
    cmdIFA.Enabled = False
    
    'load all list
    Call LoadDomainList(lstIFDomain)
    Call LoadFrameList(lstIFFrame)
    Call LoadParametersList(lstIFParm)
    
End Sub

Private Sub lstIFSlots_Click()

    'map var
    'manage button
    
    'map var
    SlotsName = lstIFSlots.Text
    IDSlots = lstIFSlots.ListIndex + 1
    
    'manage button
    cmdIFD.Enabled = True
    cmdIFB.Enabled = True
    
End Sub

Private Sub cmdIFD_Click()

    'delete from lstIFSlots
    'map var
    'manage button
    
    'delete from lstIFSlots
    lstIFSlots.RemoveItem lstIFSlots.ListIndex
    'map var
    IDSlots = IDSlots - 1
    
    'manage button
    cmdIFD.Enabled = False

End Sub

Private Sub cmdIFC2_Click()
    
    'manage list
    'manage frame
    
    'manage list
    lstIFDomain.Clear
    lstIFFrame.Clear
    lstIFParm.Clear
    lstIFSlots.Clear
    
    
    'manage frame
    frmSlotsList.Visible = False
    frmSlotsSelect.Visible = False
    frmIF.Enabled = True
    
End Sub

Private Sub cmdIFB_Click()
    
    'map var
    'operation
    'load ekb list
    'manage frame and list
    
    'map var
    If txtEKB.Text = "" Then
        CEKB = InputBox("Enter Name :", "Please Enter name ")
    Else
        CEKB = txtEKB.Text
    End If
    
    'check ekb count
    Set getinstance = cache.OpenId(CAllDomain, IDCDomain)
    tmp = getinstance.EKB.Count
    If tmp <> 0 Then
        For i = 1 To tmp
            tmp = getinstance.EKB.RemoveAt(i)
        Next i
    End If
    getinstance.sys_Save
    getinstance.sys_Close
    
    'operation
    Screen.MousePointer = vbHourglass
    CEKB = Replace(CEKB, " ", "", 1, -1, vbTextCompare)
    IDCEKB = IDCEKB + 1
    
    'operation
    '1. create class
    '2. insert list of EKB and add to Mainclass
    
    '1. create class
    For i = 1 To IDSlots
        Set createclass = cache.Static(TCMethods)
        tmp = createclass.CreateEKB(CEKB, lstIFSlots.List(i - 1))
    Next i
    '1.1 compile
    Set createclass = cache.Static(TCMethods)
    tmp = createclass.CompileEKB(CEKB)
    
    '2. insert list of EKB and add to CAllDomain
    '2.1 open CAllDomain
    '2.2 new TCEKB embeddable
    '2.3 add EKB property list
    '2.4 save to CAllDomain
    
    '2.1 open CAllDomain
    Set mainclass = cache.OpenId(CAllDomain, IDCDomain)
    If mainclass Is Nothing Then
        MsgBox "Error"
    Else
        '2.2 new TCEKB  embeddable
        Set embedclass1 = cache.New(TCEKB)
        embedclass1.Name = CEKB
        '2.3 add EKB property list
        For i = 1 To IDSlots
            tmp = embedclass1.Slots.InsertAt(lstIFSlots.List(i - 1), 1)
        Next i
        '2.4 save to CAllDomain
        tmp = mainclass.EKB.InsertAt(embedclass1, 1)
        mainclass.sys_Save
        embedclass1.sys_Close
        mainclass.sys_Close
    Screen.MousePointer = vbDefault
    End If
    
    'add ekb list
    Call LoadEKBList(lstEKB)
    
    'manage frame and list
    lstIFDomain.Clear
    lstIFFrame.Clear
    lstIFSlots.Clear
    lstIFSlots.Clear
    txtEKB.Text = ""
    frmSlotsList.Visible = False
    frmSlotsSelect.Visible = False
    frmIF.Enabled = True

End Sub

Private Sub cmdIFR_Click()
    
    'manage frame
    'operation
    'load ekb list
    
    'manage frame
    frmFacts.Visible = False
    
    'opearation
    '1.delete all instance
    '1.1 check instance
    '2.delete from cache
    
    '1. delete all instance
    '1.1check instance
    SqlStatement = "Select * from " & CEKB
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    j = 0
    While queryinstance.Next
        j = j + 1
    Wend
    queryinstance.Close
    '1.2 delete from cache
    If j <> 0 Then
        For i = 1 To j
        Set getinstance = cache.OpenId(CEKB, i)
        tmp = getinstance.sys_DeleteId(i)
        getinstance.sys_Save
        getinstance.sys_Close
        Next i
    End If
    Set deleteclass = cache.Static(TCMethods)
    tmp = deleteclass.DeleteEKB(CEKB)
    
    '2.remove from CDomain list
    Set deleteinstance = cache.OpenId(CAllDomain, IDCDomain)
    tmp = deleteinstance.EKB.RemoveAt(IDCEKB)
    deleteinstance.sys_Save
    deleteinstance.sys_Close
    
    'load ekb list
    Call LoadEKBList(lstEKB)
    
End Sub

Private Sub ClearfrmFacts()

    lstSlots.Clear
    
End Sub
'********************************Extensional Knowledbe Base********************************************
