VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form FormMainClient 
   Caption         =   "  Data Warehouse 2000"
   ClientHeight    =   8670
   ClientLeft      =   2250
   ClientTop       =   1770
   ClientWidth     =   9450
   Icon            =   "FormMainClient01.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   8670
   ScaleWidth      =   9450
   Begin MSComctlLib.ProgressBar Bar 
      Height          =   255
      Left            =   3070
      TabIndex        =   28
      Top             =   8375
      Width           =   6100
      _ExtentX        =   10742
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   0
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSFlexGrid 
      Height          =   7455
      Left            =   2250
      TabIndex        =   16
      Top             =   840
      Width           =   7170
      _ExtentX        =   12647
      _ExtentY        =   13150
      _Version        =   393216
      Rows            =   1
      FixedRows       =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
      _Band(0).GridLineWidthBand=   1
   End
   Begin VB.TextBox TxtQuery 
      Height          =   1005
      Left            =   2280
      MultiLine       =   -1  'True
      TabIndex        =   3
      Top             =   5160
      Visible         =   0   'False
      Width           =   7215
   End
   Begin VB.ListBox List2 
      Height          =   1035
      Left            =   2280
      TabIndex        =   5
      Top             =   7320
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.ListBox List1 
      Height          =   1035
      Left            =   2280
      TabIndex        =   4
      Top             =   6240
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.ListBox List7 
      Height          =   1035
      Left            =   8040
      TabIndex        =   27
      Top             =   6240
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.ListBox ListDMMem 
      Height          =   1035
      Left            =   6600
      TabIndex        =   26
      Top             =   7320
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.ListBox ListMem 
      Height          =   1035
      Left            =   6600
      TabIndex        =   25
      Top             =   6240
      Visible         =   0   'False
      Width           =   1455
   End
   Begin MSComctlLib.TreeView TreeMem 
      Height          =   1215
      Left            =   0
      TabIndex        =   24
      Top             =   5160
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   2143
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
   Begin VB.ListBox List6 
      Height          =   1035
      Left            =   5160
      TabIndex        =   23
      Top             =   7320
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.ListBox List5 
      Height          =   1035
      Left            =   5160
      TabIndex        =   22
      Top             =   6240
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.TextBox Text6 
      Height          =   375
      Left            =   9360
      TabIndex        =   21
      Text            =   "Text6"
      Top             =   8040
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox Text4 
      Height          =   375
      Left            =   8040
      TabIndex        =   20
      Text            =   "Text4"
      Top             =   8040
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ListBox List4 
      Height          =   1035
      Left            =   3720
      TabIndex        =   18
      Top             =   7320
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.ListBox List3 
      Height          =   1035
      Left            =   3720
      TabIndex        =   17
      Top             =   6240
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Clear"
      Height          =   495
      Left            =   7680
      TabIndex        =   15
      Top             =   0
      Visible         =   0   'False
      Width           =   615
   End
   Begin MSComctlLib.ImageList ImageList3 
      Left            =   8040
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   14
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":0CCA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":0FBC
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":12DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":1630
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":1A3A
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":1F78
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":22A4
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView PivotTree 
      Height          =   1935
      Left            =   0
      TabIndex        =   14
      Top             =   6360
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   3413
      _Version        =   393217
      Indentation     =   459
      Style           =   7
      Appearance      =   1
   End
   Begin VB.TextBox TxtDatabase 
      Height          =   375
      Left            =   6240
      TabIndex        =   11
      Top             =   7680
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.TextBox Text3 
      Height          =   615
      Left            =   8040
      TabIndex        =   10
      Top             =   6840
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.CommandButton Command2 
      Caption         =   "FillGrid"
      Height          =   495
      Left            =   7080
      TabIndex        =   9
      Top             =   0
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox Text2 
      Height          =   615
      Left            =   8040
      MultiLine       =   -1  'True
      TabIndex        =   8
      Top             =   6240
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Query"
      Height          =   495
      Left            =   6480
      TabIndex        =   7
      Top             =   0
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txtCube 
      Height          =   375
      Left            =   4440
      TabIndex        =   6
      Top             =   7800
      Visible         =   0   'False
      Width           =   1095
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   8295
      Width           =   9450
      _ExtentX        =   16669
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1773
            MinWidth        =   1764
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   3519
            MinWidth        =   3528
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   10848
            MinWidth        =   10848
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList2 
      Left            =   7440
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   17
      ImageHeight     =   17
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   17
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":25A0
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":2966
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":2C38
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":2F5A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":32AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":3506
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":37F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":3D36
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":40FC
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":44C2
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":4888
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":4C4E
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":5014
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":53DA
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":57A0
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":5B66
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":5F2C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   480
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9450
      _ExtentX        =   16669
      _ExtentY        =   847
      ButtonWidth     =   714
      ButtonHeight    =   688
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "disconnect"
            Object.ToolTipText     =   "connect"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "splitview"
            Object.ToolTipText     =   "Split View"
            ImageIndex      =   2
            Style           =   2
            Value           =   1
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "resultview"
            Object.ToolTipText     =   "Result View"
            ImageIndex      =   3
            Style           =   2
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "queryview"
            Object.ToolTipText     =   "Query View"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "RunQuery"
            Object.ToolTipText     =   "Run Query"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "ClearQuery"
            Object.ToolTipText     =   "Clear Query"
            ImageIndex      =   6
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   6840
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   20
      ImageHeight     =   20
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":62F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":67F4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":6CF6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":71F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":76BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FormMainClient01.frx":7BC0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
      Height          =   1335
      Left            =   2250
      TabIndex        =   19
      Top             =   600
      Width           =   7170
      _ExtentX        =   12647
      _ExtentY        =   2355
      _Version        =   393216
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin MSComctlLib.TreeView CubeDefTree 
      Height          =   4695
      Left            =   0
      TabIndex        =   1
      Top             =   480
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   8281
      _Version        =   393217
      Indentation     =   459
      Style           =   7
      Appearance      =   1
   End
   Begin VB.Label Label2 
      Caption         =   "Data base :"
      Height          =   255
      Left            =   4560
      TabIndex        =   13
      Top             =   8400
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Cube :"
      Height          =   255
      Left            =   2760
      TabIndex        =   12
      Top             =   8400
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuConnect 
         Caption         =   "Connect..."
      End
      Begin VB.Menu mnuDisconnect 
         Caption         =   "Disconnect"
      End
      Begin VB.Menu mnusep1 
         Caption         =   "-"
      End
      Begin VB.Menu munExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "View"
      Begin VB.Menu mnuSplit 
         Caption         =   "Split "
      End
      Begin VB.Menu mnuResult 
         Caption         =   "Results"
      End
      Begin VB.Menu mnusep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuQuery 
         Caption         =   "Query"
      End
   End
   Begin VB.Menu mnuRowCol 
      Caption         =   "RowCol"
      Visible         =   0   'False
      Begin VB.Menu mnuAsCol 
         Caption         =   "Add as Column"
      End
      Begin VB.Menu mnuAsRow 
         Caption         =   "Add as Row"
      End
   End
   Begin VB.Menu mnuRowColLV 
      Caption         =   "RowColLV"
      Visible         =   0   'False
      Begin VB.Menu mnuAsColLV 
         Caption         =   "Add as Column"
      End
      Begin VB.Menu mnuAsRowLV 
         Caption         =   "Add as Row"
      End
   End
   Begin VB.Menu mnuPivot 
      Caption         =   "Pivot"
      Visible         =   0   'False
      Begin VB.Menu mnuRemove 
         Caption         =   "Remove Dimension"
      End
      Begin VB.Menu mnuD2C 
         Caption         =   "Move Dimension to Columns"
      End
      Begin VB.Menu mnuD2R 
         Caption         =   "Move Dimension to Rows"
      End
   End
   Begin VB.Menu mnuRowColMB 
      Caption         =   "RowColMB"
      Visible         =   0   'False
      Begin VB.Menu mnuAsColMB 
         Caption         =   "Add as Column"
      End
      Begin VB.Menu mnuAsRowMB 
         Caption         =   "Add as Row"
      End
   End
   Begin VB.Menu mnuGridDrillRow 
      Caption         =   "GridDrillRow"
      Visible         =   0   'False
      Begin VB.Menu mnuRowDrillUp 
         Caption         =   "Drill Up"
      End
      Begin VB.Menu mnuRowDrillDown 
         Caption         =   "Drill Down"
      End
   End
   Begin VB.Menu mnuGridDrillCol 
      Caption         =   "GridDrillCol"
      Visible         =   0   'False
      Begin VB.Menu mnuColDrillUp 
         Caption         =   "Drill Up"
      End
      Begin VB.Menu mnuColDrillDown 
         Caption         =   "Drill Down"
      End
   End
   Begin VB.Menu mnuQuery1 
      Caption         =   "Query"
      Begin VB.Menu mnuRunQuery 
         Caption         =   "Run Query"
      End
      Begin VB.Menu mnuClearQuery 
         Caption         =   "Clear Query"
      End
   End
End
Attribute VB_Name = "FormMainClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const m_sFieldCatalogName = "CATALOG_NAME"
Private Const m_iMaxMetadataTreeDepth = 68
Private m_ctActiveCatalog As Catalog
Dim m_cn As New ADODB.Connection
Dim cat As New ADOMD.Catalog
Dim cdf   As ADOMD.CubeDef
Dim dm As ADOMD.Dimension
Dim hr As ADOMD.Hierarchy
Dim lv As ADOMD.Level
Dim lv0 As ADOMD.Level
Dim mb As ADOMD.Member
Dim pr As ADODB.Property
Dim sCatalogCur As String
Dim sConnectStr As String
Dim WindowSt As String
Dim WindowSt1 As String
Dim indDM As Integer, countMeasures As Integer
Dim jj As Integer, indLV As Integer
Dim cbNameTemp As String
Dim cbtemp As String, DMtemp As String
Dim cubeName As String
Dim membercol As String, memberrow As String, memberwhere As String, strMeasure As String
Dim memberRowMeasure As String, memberColMeasure As String
Dim allowMeasure As String
Dim nFixedCols As Integer, nFixedRows As Integer
Dim iCol As Long, cCol As Long
Dim iRow As Long, cRow As Long
Dim conn As New ADODB.Connection
Dim cst As New ADOMD.Cellset
Dim axs As ADOMD.Axis
Dim pos As ADOMD.Position
Dim colPosDrill As Integer, temDMdrill As String, countrow As Long

Private Sub Command1_Click()
Dim strcol As String, strrow As String, strcube As String
Dim strwhere As String
Dim i As Integer, j As Integer, k As Integer
    
    CheckMeasure
    For i = 0 To List2.ListCount - 1
        If i = 0 Then
            strcol = strcol & "{" & List2.List(i) & "}"
            Text2.Text = strcol
        Else
            strcol = strcol & "," & "{" & List2.List(i) & "}"
            strcol = "crossjoin" & "(" & strcol & ")"
            Text2.Text = strcol
        End If
    Next
    strcol = "Select" & " " & "{" & strcol & "}" & " " & "on" & " " & "Columns,"
    Text2.Text = strcol
    
    
    For j = 0 To List1.ListCount - 1
        If j = 0 Then
            strrow = strrow & "{" & List1.List(j) & "}"
            Text3.Text = strrow
        Else
            strrow = strrow & "," & "{" & List1.List(j) & "}"
            strrow = "crossjoin" & "(" & strrow & ")"
            Text3.Text = strrow
        End If
    Next
    strrow = "{" & strrow & "}" & " " & "on" & " " & "Rows" & " "
    Text3.Text = strrow
    
    '<><><><><><><><><><><><><><><><><><><><><>
    '   Generate Where
    '<><><><><><><><><><><><><><><><><><><><><>
    For k = 0 To ListMem.ListCount - 1
        If k = 0 Then
            strwhere = ListMem.List(k)
        Else
            strwhere = strwhere & "," & ListMem.List(k)
        End If
    Next
    strwhere = "Where" & " " & "(" & strwhere & ")"
    If ListMem.ListCount = 0 Then
        strwhere = ""
    End If
    Debug.Print strwhere
    '<><><><><><><><><><><><><><><><><><><><><>
    TxtQuery.Text = Text2.Text & Text3.Text & "From" & " " & "[" & txtCube.Text & "]" & " " & strwhere
    
End Sub

Private Sub Command2_Click()
    If List1.ListCount = 0 Or List2.ListCount = 0 Then
        MsgBox "Please select Rows and Columns Axis"
        Exit Sub
    End If
    MSFlexGrid.ClearStructure
    FillGrid
    FillButton
End Sub

Private Sub Command3_Click()
    
    List1.Clear
    List2.Clear
    List3.Clear
    List4.Clear
    List5.Clear
    List6.Clear
    List7.Clear
    ListMem.Clear
    ListDMMem.Clear
    TxtQuery.Text = ""
    PivotTree.Nodes.Clear
    MSFlexGrid.ClearStructure
   
    MSFlexGrid.Cols = 2
    MSFlexGrid.Rows = 1
    MSFlexGrid.FixedCols = 1
    MSFlexGrid.FixedRows = 0
    MSHFlexGrid1.ClearStructure
    MSHFlexGrid1.FixedCols = 1
    MSHFlexGrid1.FixedRows = 1
    MSHFlexGrid1.Cols = 2
    MSHFlexGrid1.Rows = 2
    txtCube = ""
    Text2 = ""
    Text3 = ""
    allowMeasure = ""
    memberRowMeasure = ""
    memberColMeasure = ""
    TxtDatabase = ""
    
    TreeMem.Nodes.Clear
    Set PivotTree.ImageList = ImageList3
    PivotTree.Nodes.Add , , "Root", "Root", 6
    PivotTree.Nodes.Add "Root", tvwChild, "Columns", "Columns", 1
    PivotTree.Nodes.Add "Root", tvwChild, "Rows", "Rows", 2
    PivotTree.Nodes.Add "Root", tvwChild, "Slicer", "Slicer", 3
    
    PivotTree.Nodes.Add , , "Measures", "Measures", 7
End Sub

Private Sub CubeDefTree_BeforeLabelEdit(Cancel As Integer)
   Cancel = True
End Sub

Private Sub CubeDefTree_Click()
   CubeDefTree.StartLabelEdit
End Sub

Private Sub CubeDefTree_DblClick()
Dim cn_mem As ADODB.Connection
Dim ct_mem As ADOMD.Catalog
Dim cb_mem As ADOMD.CubeDef
Dim dm_mem As ADOMD.Dimension
Dim hr_mem As ADOMD.Hierarchy
Dim lv_mem As ADOMD.Level
Dim mb_mem As ADOMD.Member
Dim pr_mem As ADODB.Property
Dim i As Integer
    
    If CubeDefTree.SelectedItem.Image >= 9 And CubeDefTree.SelectedItem.Text <> "(All)" Then
        TreeMem.Nodes.Clear
        Set cn_mem = New ADODB.Connection
        cn_mem.Open "Provider=msolap" & _
                      ";Data source =" & DialogConnect.txtServer.Text & _
                      ";User ID=sa" & _
                      ";Initial Catalog =" & CubeDefTree.SelectedItem.Parent.Parent.Parent.Text
        Set ct_mem = New ADOMD.Catalog
        Set ct_mem.ActiveConnection = cn_mem

        Set cb_mem = ct_mem.CubeDefs(CubeDefTree.SelectedItem.Parent.Parent.Text)
        Set dm_mem = cb_mem.Dimensions(CubeDefTree.SelectedItem.Parent.Text)
        Set hr_mem = dm_mem.Hierarchies(0)
        Set lv_mem = hr_mem.Levels(CubeDefTree.SelectedItem.Text)
        Set TreeMem.ImageList = ImageList2
        DMtemp = CubeDefTree.SelectedItem.Parent.Text
        i = 0
        For Each mb_mem In lv_mem.Members
            TreeMem.Nodes.Add , , mb_mem.Name & str(i), mb_mem.Name, 8
            i = i + 1
        Next mb_mem
    End If
        
End Sub

Private Sub CubeDefTree_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Button = 2 Then
        If CubeDefTree.SelectedItem.Image = 5 And CubeDefTree.SelectedItem.Text <> "Measures" Then
            PopupMenu mnuRowCol
        
        ElseIf CubeDefTree.SelectedItem.Image = 7 Then
            PopupMenu mnuRowColMB
        End If
    End If
End Sub

Private Sub Form_Load()
Dim disconnst As String

    Me.Show
    DialogConnect.Show vbModal
    mnuSplit.Checked = True
    mnuResult.Checked = False
    WindowSt = "splitstate"
    
    MSFlexGrid.AllowUserResizing = flexResizeBoth
    countMeasures = 0
    
End Sub

Private Sub Form_Resize()
    If Me.WindowState = vbMaximized Then
        If WindowSt = "resultstate" Then
            MSFlexGrid.Left = 0
            MSFlexGrid.Width = Me.Width - 125
            MSFlexGrid.Height = Me.Height - Toolbar1.Height - 1350
            MSFlexGrid.Top = 720
            
            MSHFlexGrid1.Left = 0
            MSHFlexGrid1.Width = Me.Width - 120
            MSHFlexGrid1.Height = 1335
            MSHFlexGrid1.Top = 480
            
            CubeDefTree.Visible = False
            TreeMem.Visible = False
            PivotTree.Visible = False
            
            Bar.Left = StatusBar1.Panels(3).Left
            Bar.Top = StatusBar1.Top
            Bar.Width = StatusBar1.Panels(3).Width
            Bar.Height = StatusBar1.Height
            
            If WindowSt1 = "notquerystate" Then
                TxtQuery.Visible = False
            End If
        End If
        If WindowSt = "splitstate" Then
            MSFlexGrid.Left = 2250
            MSFlexGrid.Top = 720
            MSFlexGrid.Width = Me.Width - CubeDefTree.Width - 230
            MSFlexGrid.Height = Me.Height - Toolbar1.Height - 1350
            
            MSHFlexGrid1.Left = 2250
            MSHFlexGrid1.Top = 480
            MSHFlexGrid1.Width = Me.Width - CubeDefTree.Width - 230
            MSHFlexGrid1.Height = 1335
            
            CubeDefTree.Left = 0
            CubeDefTree.Top = 480
            CubeDefTree.Width = 2175
            CubeDefTree.Height = (Me.Height - Toolbar1.Height - 1115) * (0.598)
            
            TreeMem.Left = 0
            TreeMem.Width = 2175
            TreeMem.Top = CubeDefTree.Height + Toolbar1.Height
            TreeMem.Height = (Me.Height - Toolbar1.Height - 1115) * (0.1548)
            
            PivotTree.Left = 0
            PivotTree.Width = 2175
            PivotTree.Top = CubeDefTree.Height + Toolbar1.Height + TreeMem.Height
            PivotTree.Height = (Me.Height - Toolbar1.Height - 1115) * (0.246)
            
            
            CubeDefTree.Visible = True
            TreeMem.Visible = True
            PivotTree.Visible = True
            
            
            
            If WindowSt1 = "notquerystate" Then
                TxtQuery.Visible = False
            End If
        End If
        
        If WindowSt1 = "querystate" And WindowSt = "splitstate" Then
            TxtQuery.Left = 2250
            TxtQuery.Top = MSFlexGrid.Height * 0.9
            TxtQuery.Width = Me.Width - CubeDefTree.Width - 220
            TxtQuery.Height = Me.Height - TxtQuery.Top - 1150
            TxtQuery.Visible = True
            MSFlexGrid.Height = Me.Height - Toolbar1.Height - TxtQuery.Height - 1430
            
            
            
        ElseIf WindowSt1 = "querystate" And WindowSt = "resultstate" Then
            TxtQuery.Left = 0
            TxtQuery.Top = MSFlexGrid.Height * 0.9
            TxtQuery.Width = Me.Width - 150
            TxtQuery.Height = Me.Height - TxtQuery.Top - 1150
            TxtQuery.Visible = True
            MSFlexGrid.Height = Me.Height - Toolbar1.Height - TxtQuery.Height - 1430
            
            
            
        End If
    End If
    
    
    If Me.WindowState = vbNormal Then
        If WindowSt = "splitstate" Then
            MSFlexGrid.Left = 2250
            MSFlexGrid.Width = Me.Width - CubeDefTree.Width - 230
            MSFlexGrid.Top = 720
            MSFlexGrid.Height = Me.Height - Toolbar1.Height - 1350
            
            MSHFlexGrid1.Left = 2250
            MSHFlexGrid1.Width = Me.Width - CubeDefTree.Width - 230
            MSHFlexGrid1.Top = 480
            MSHFlexGrid1.Height = 1335
            
            CubeDefTree.Left = 0
            CubeDefTree.Width = 2175
            CubeDefTree.Top = 480
            CubeDefTree.Height = (Me.Height - Toolbar1.Height - 1115) * (0.598)
            
            
            TreeMem.Left = 0
            TreeMem.Width = 2175
            TreeMem.Top = CubeDefTree.Height + Toolbar1.Height
            TreeMem.Height = (Me.Height - Toolbar1.Height - 1115) * (0.1548)
            
            PivotTree.Left = 0
            PivotTree.Width = 2175
            PivotTree.Top = CubeDefTree.Height + Toolbar1.Height + TreeMem.Height
            PivotTree.Height = (Me.Height - Toolbar1.Height - 1115) * (0.246)
            
            CubeDefTree.Visible = True
            TreeMem.Visible = True
            PivotTree.Visible = True
            
           
            
            If WindowSt1 = "notquerystate" Then
                TxtQuery.Visible = False
            End If
        End If
        If WindowSt = "resultstate" Then
            MSFlexGrid.Left = 0
            MSFlexGrid.Width = Me.Width - 150
            MSFlexGrid.Top = 720
            MSFlexGrid.Height = 7575
            
            MSHFlexGrid1.Left = 0
            MSHFlexGrid1.Top = 480
            MSHFlexGrid1.Height = 1335
            MSHFlexGrid1.Width = Me.Width - 100
            
            CubeDefTree.Visible = False
            TreeMem.Visible = False
            PivotTree.Visible = False
            
           
            If WindowSt1 = "notquerystate" Then
                TxtQuery.Visible = False
            End If
        End If
        
        If WindowSt1 = "querystate" And WindowSt = "splitstate" Then
            TxtQuery.Left = 2250
            TxtQuery.Top = MSFlexGrid.Height * 0.9
            TxtQuery.Width = Me.Width - CubeDefTree.Width - 220
            TxtQuery.Height = Me.Height - TxtQuery.Top - 1130
            TxtQuery.Visible = True
            MSFlexGrid.Height = Me.Height - Toolbar1.Height - TxtQuery.Height - 1430
            
            
            
        ElseIf WindowSt1 = "querystate" And WindowSt = "resultstate" Then
            TxtQuery.Left = 0
            TxtQuery.Top = MSFlexGrid.Height * 0.9
            TxtQuery.Width = Me.Width - 150
            TxtQuery.Height = Me.Height - TxtQuery.Top - 1130
            TxtQuery.Visible = True
            MSFlexGrid.Height = Me.Height - Toolbar1.Height - TxtQuery.Height - 1430
            
           
        End If
    End If
    
End Sub

Private Sub mnuAsCol_Click()
    If checkcube = True Then
        GenColumn
        If CheckList(membercol) = True Then
            If CubeDefTree.SelectedItem.Child.Text = "(All)" Then
                List4.AddItem CubeDefTree.SelectedItem.Child.Next.Text
            Else
                List4.AddItem CubeDefTree.SelectedItem.Child.Text
            End If
            List2.AddItem membercol
            List6.AddItem CubeDefTree.SelectedItem
            PivotTree.Nodes.Add "Columns", tvwChild, CubeDefTree.SelectedItem.Text, CubeDefTree.SelectedItem.Text, 4
            Command1_Click
        End If
    End If
End Sub

Private Sub mnuAsColLV_Click()
    If checkcubeLV = True Then
        If CheckList(membercol) = True Then
            GenColumn
            List2.AddItem membercol
            PivotTree.Nodes.Add "Columns", tvwChild, membercol, membercol, 4
        End If
    End If
End Sub

Private Sub mnuAsColMB_Click()
Dim i As Integer
    If allowMeasure = "Cols" Or allowMeasure = "" Then
        If txtCube.Text = "" Then
            txtCube.Text = CubeDefTree.SelectedItem.Parent.Parent.Parent.Text
            TxtDatabase.Text = CubeDefTree.SelectedItem.Parent.Parent.Parent.Parent.Text
        ElseIf txtCube.Text <> CubeDefTree.SelectedItem.Parent.Parent.Parent.Text And TxtDatabase.Text <> CubeDefTree.SelectedItem.Parent.Parent.Parent.Parent.Text Then
            MsgBox "Select dimension from same cube"
            Exit Sub
        End If
        If List7.ListCount = 0 Then
            List7.AddItem CubeDefTree.SelectedItem.Text
            PivotTree.Nodes.Add "Measures", tvwChild, CubeDefTree.SelectedItem.Text, CubeDefTree.SelectedItem, 5
            allowMeasure = "Cols"
            
            Command1_Click
            Exit Sub
        Else
        For i = 0 To List7.ListCount - 1
            If CubeDefTree.SelectedItem.Text = List7.List(i) Then
                MsgBox "Duplicate Dimension with cols axis"
                Exit Sub
            End If
        Next
            List7.AddItem CubeDefTree.SelectedItem.Text
            PivotTree.Nodes.Add "Measures", tvwChild, CubeDefTree.SelectedItem.Text, CubeDefTree.SelectedItem, 5
            allowMeasure = "Cols"
            
            Command1_Click
            
        End If
    Else
        MsgBox "Measure exist on another axis"
    End If
End Sub

Private Sub mnuAsRow_Click()
    
    If checkcube = True Then
        GenRow
        If CheckList(memberrow) = True Then
            If CubeDefTree.SelectedItem.Child.Text = "(All)" Then
                List3.AddItem CubeDefTree.SelectedItem.Child.Next.Text
            Else
                List3.AddItem CubeDefTree.SelectedItem.Child.Text
            End If
            List1.AddItem memberrow
            List5.AddItem CubeDefTree.SelectedItem
            'PivotTree.Nodes.Add "Rows", tvwChild, memberrow, memberrow, 4
            PivotTree.Nodes.Add "Rows", tvwChild, CubeDefTree.SelectedItem.Text, CubeDefTree.SelectedItem.Text, 4
            Command1_Click
        End If
    End If
End Sub

Private Sub mnuAsRowLV_Click()
    
    If checkcubeLV = True Then
        If CheckList(memberrow) = True Then
            GenRow
            List1.AddItem memberrow
            PivotTree.Nodes.Add "Rows", tvwChild, memberrow, memberrow, 4
        End If
    End If
End Sub

Private Sub mnuAsRowMB_Click()
Dim i As Integer
    If allowMeasure = "Rows" Or allowMeasure = "" Then
        If txtCube.Text = "" Then
            txtCube.Text = CubeDefTree.SelectedItem.Parent.Parent.Parent.Text
            TxtDatabase.Text = CubeDefTree.SelectedItem.Parent.Parent.Parent.Parent.Text
        ElseIf txtCube.Text <> CubeDefTree.SelectedItem.Parent.Parent.Parent.Text And TxtDatabase.Text <> CubeDefTree.SelectedItem.Parent.Parent.Parent.Parent.Text Then
            MsgBox "Select dimension from same cube"
            Exit Sub
        End If
        If List7.ListCount = 0 Then
            List7.AddItem CubeDefTree.SelectedItem.Text
            PivotTree.Nodes.Add "Measures", tvwChild, CubeDefTree.SelectedItem.Text, CubeDefTree.SelectedItem, 5
            allowMeasure = "Rows"
            
             Command1_Click
            Exit Sub
        Else
        For i = 0 To List7.ListCount - 1
            If CubeDefTree.SelectedItem.Text = List7.List(i) Then
                MsgBox "Duplicate Dimension with rows axis"
                Exit Sub
            End If
       Next
            List7.AddItem CubeDefTree.SelectedItem.Text
            PivotTree.Nodes.Add "Measures", tvwChild, CubeDefTree.SelectedItem.Text, CubeDefTree.SelectedItem, 5
            allowMeasure = "Rows"
            
            Command1_Click
            
       End If
    Else
        MsgBox "Measure exist on another axis"
    End If
End Sub

Private Sub mnuClearQuery_Click()
    Command3_Click
End Sub

Private Sub mnuColDrillDown_Click()
    
    If MSHFlexGrid1.CellBackColor = vbCyan Then
        DrillDownCol (Text4.Text)
    End If
End Sub

Private Sub mnuColDrillUp_Click()
    
    If MSFlexGrid.CellBackColor = vbCyan Then
        DrillUpCol (Text4.Text)
    End If
End Sub

Private Sub mnuConnect_Click()
    DialogConnect.Show
    Toolbar1.Buttons("disconnect").Value = tbrPressed
    Toolbar1.Buttons("disconnect").Key = "connect"
    mnuConnect.Enabled = False
End Sub

Private Sub mnuD2C_Click()
Dim i As Integer
    For i = 0 To List5.ListCount - 1
        If PivotTree.SelectedItem.Key = List5.List(i) Then
            
            PivotTree.Nodes.Add "Columns", tvwChild, "Columns" & List5.List(i), List5.List(i), 4
            
            List6.AddItem List5.List(i)
            List4.AddItem List3.List(i)
            List2.AddItem List1.List(i)
            Exit For
        End If
    Next
        PivotTree.Nodes.Remove (PivotTree.SelectedItem.Key)
        
        List5.RemoveItem (i)
        List3.RemoveItem (i)
        List1.RemoveItem (i)
        
        Command1_Click
End Sub

Private Sub mnuD2R_Click()
Dim i As Integer
    For i = 0 To List6.ListCount - 1
        If PivotTree.SelectedItem.Key = List6.List(i) Then
            
            PivotTree.Nodes.Add "Rows", tvwChild, "Rows" & List6.List(i), List6.List(i), 4
            
            List5.AddItem List6.List(i)
            List3.AddItem List4.List(i)
            List1.AddItem List2.List(i)
            Exit For
        End If
    Next
        PivotTree.Nodes.Remove (PivotTree.SelectedItem.Key)
        
        List6.RemoveItem (i)
        List4.RemoveItem (i)
        List2.RemoveItem (i)
        
        Command1_Click
End Sub

Private Sub mnuDisconnect_Click()
    Toolbar1.Buttons("connect").Value = tbrUnpressed
    Toolbar1.Buttons("connect").Key = "disconnect"
    DisConnect
    mnuDisconnect.Enabled = False
    mnuConnect.Enabled = True
    
End Sub

Private Sub mnuQuery_Click()
    If Toolbar1.Buttons(5).Value = tbrUnpressed Then
        Toolbar1.Buttons(5).Key = "notqueryview"
        Toolbar1.Buttons(5).Value = tbrPressed
        mnuQuery.Checked = True
        WindowSt1 = "querystate"
        Form_Resize
        Exit Sub
    End If
    If Toolbar1.Buttons(5).Value = tbrPressed Then
        Toolbar1.Buttons(5).Key = "queryview"
        Toolbar1.Buttons(5).Value = tbrUnpressed
        mnuQuery.Checked = False
        WindowSt1 = "notquerystate"
        Form_Resize
    End If
End Sub

Private Sub mnuRemove_Click()
Dim i As Integer
    'Rows
    For i = 0 To List5.ListCount - 1
        If List5.List(i) = PivotTree.SelectedItem.Key Then
            List1.RemoveItem (i)
            List3.RemoveItem (i)
            List5.RemoveItem (i)
        End If
    Next
    'Columns
    For i = 0 To List6.ListCount - 1
        If List6.List(i) = PivotTree.SelectedItem.Key Then
            List2.RemoveItem (i)
            List4.RemoveItem (i)
            List6.RemoveItem (i)
        End If
    Next
    'Slicers
    For i = 0 To ListMem.ListCount - 1
        If ListMem.List(i) = PivotTree.SelectedItem.Key Then
            ListMem.RemoveItem (i)
            ListDMMem.RemoveItem (i)
        End If
    Next
    'Measures
    For i = 0 To List7.ListCount - 1
        If List7.List(i) = PivotTree.SelectedItem.Key Then
            List7.RemoveItem (i)
        End If
    Next
    PivotTree.Nodes.Remove PivotTree.SelectedItem.Key
    Command1_Click
End Sub

Private Sub mnuResult_Click()
    mnuResult.Checked = True
    mnuSplit.Checked = False
    Toolbar1.Buttons(4).Value = tbrPressed
    WindowSt = "resultstate"
    Form_Resize
End Sub

Private Sub mnuRowDrillDown_Click()
    
    If MSFlexGrid.CellBackColor = vbCyan Then
        DrillDownRow (Text4.Text)
    End If
End Sub

Private Sub mnuRowDrillUp_Click()
    
    If MSFlexGrid.CellBackColor = vbCyan Then
        DrillUpRow (Text4.Text)
    End If
End Sub

Private Sub mnuRunQuery_Click()
    Command2_Click
End Sub

Private Sub mnuSplit_Click()
    mnuSplit.Checked = True
    mnuResult.Checked = False
    Toolbar1.Buttons("splitview").Value = tbrPressed
    WindowSt = "splitstate"
    Form_Resize
End Sub

Private Sub MSFlexGrid_Click()
    Text4.Text = MSFlexGrid.MouseRow
    Text6.Text = MSFlexGrid.MouseCol
    MSFlexGrid.ToolTipText = Text4 & "," & Text6
End Sub

Private Sub MSFlexGrid_DblClick()
    MSFlexGrid.Row = MSFlexGrid.MouseRow
    MSFlexGrid.Col = MSFlexGrid.MouseCol
    If MSFlexGrid.CellBackColor = vbCyan Then
        Text4.Text = MSFlexGrid.TextMatrix(MSFlexGrid.MouseRow, MSFlexGrid.MouseCol)
        DrillDownRow (Text4.Text)
    End If
End Sub

Private Sub MSFlexGrid_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then
        MSFlexGrid.Row = MSFlexGrid.MouseRow
        MSFlexGrid.Col = MSFlexGrid.MouseCol
        If MSFlexGrid.CellBackColor = vbCyan Then
            Text4.Text = MSFlexGrid.TextMatrix(MSFlexGrid.MouseRow, MSFlexGrid.MouseCol)
            PopupMenu mnuGridDrillRow
        End If
    End If
End Sub

Private Sub MSHFlexGrid1_DblClick()
    MSHFlexGrid1.Row = MSHFlexGrid1.MouseRow
    MSHFlexGrid1.Col = MSHFlexGrid1.MouseCol
    If MSHFlexGrid1.CellBackColor = vbCyan Then
        Text4.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.MouseRow, MSHFlexGrid1.MouseCol)
        DrillDownCol (Text4.Text)
    End If
End Sub

Private Sub MSHFlexGrid1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then
        MSHFlexGrid1.Row = MSHFlexGrid1.MouseRow
        MSHFlexGrid1.Col = MSHFlexGrid1.MouseCol
        If MSHFlexGrid1.CellBackColor = vbCyan Then
            Text4.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.MouseRow, MSHFlexGrid1.MouseCol)
            PopupMenu mnuGridDrillCol
        End If
    End If
End Sub

Private Sub munExit_Click()
    DisConnect
    Unload DialogConnect
    Unload Me
End Sub


Private Sub OLE1_Updated(Code As Integer)

End Sub

Private Sub PivotTree_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
 If Button = 2 Then
        If PivotTree.SelectedItem.Image = 4 Then
            If PivotTree.SelectedItem.Parent.Text = "Columns" Then
                mnuD2C.Enabled = False
                mnuD2R.Enabled = True
                PopupMenu mnuPivot
            ElseIf PivotTree.SelectedItem.Parent.Text = "Rows" Then
                mnuD2C.Enabled = True
                mnuD2R.Enabled = False
                PopupMenu mnuPivot
            ElseIf PivotTree.SelectedItem.Parent.Text = "Slicer" Then
                mnuD2C.Enabled = False
                mnuD2R.Enabled = False
                PopupMenu mnuPivot
            End If
        'ElseIf PivotTree.SelectedItem.Image = 5 Then
        '    mnuD2C.Enabled = False
        '    mnuD2R.Enabled = False
        '    PopupMenu mnuPivot
        End If
    End If
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
    Select Case Button.Key
        Case "disconnect"
            Toolbar1.Buttons("disconnect").Value = tbrPressed
            Toolbar1.Buttons("disconnect").Key = "connect"
            Toolbar1.Buttons("connect").ToolTipText = "disconnect"
            CubeDefTree.Nodes.Clear
            'CubeBrowser1.DisConnect
            DialogConnect.Show vbModal
            GetConnect
        Case "connect"
            Toolbar1.Buttons("connect").Value = tbrUnpressed
            Toolbar1.Buttons("connect").Key = "disconnect"
            Toolbar1.Buttons("disconnect").ToolTipText = "connect"
            DisConnect
        Case "resultview"
            Toolbar1.Buttons("resultview").ToolTipText = "Result View"
            WindowSt = "resultstate"
            mnuResult.Checked = True
            mnuSplit.Checked = False
            Form_Resize
        Case "splitview"
            Toolbar1.Buttons("splitview").ToolTipText = "Split View"
            WindowSt = "splitstate"
            mnuResult.Checked = False
            mnuSplit.Checked = True
            Form_Resize
        Case "queryview"
            Toolbar1.Buttons("queryview").Value = tbrPressed
            Toolbar1.Buttons("queryview").Key = "notqueryview"
            WindowSt1 = "querystate"
            mnuQuery.Checked = True
            Form_Resize
        Case "notqueryview"
            Toolbar1.Buttons("notqueryview").Value = tbrUnpressed
            Toolbar1.Buttons("notqueryview").Key = "queryview"
            WindowSt1 = "notquerystate"
            mnuQuery.Checked = False
            Form_Resize
        Case "RunQuery"
            Command2_Click
        Case "ClearQuery"
            Command3_Click
    End Select
End Sub

Public Sub GetConnect()
Dim m_cn As New ADODB.Connection
Dim sSelectDB As String
Dim connstatbar As String
    If DialogConnect.Text1.Text = "true" Then
        sConnectStr = "Provider=msolap" & _
                      ";Data source =" & DialogConnect.txtServer.Text & _
                      ";User ID=sa" & _
                      ";Initial Catalog =" & DialogConnect.txtInitialDB
    
        m_cn.Open sConnectStr
        cat.ActiveConnection = m_cn
        UpdateDatabaseTree m_cn
        StatusBarSt ("connst")
    
    
        Set PivotTree.ImageList = ImageList3
    PivotTree.Nodes.Clear
    PivotTree.Nodes.Add , , "Root", "Root", 6
    PivotTree.Nodes.Add "Root", tvwChild, "Columns", "Columns", 1
    PivotTree.Nodes.Add "Root", tvwChild, "Rows", "Rows", 2
    PivotTree.Nodes.Add "Root", tvwChild, "Slicer", "Slicer", 3
    PivotTree.Nodes.Add , , "Measures", "Measures", 7
    End If
    DialogConnect.Text1.Text = ""

'<><><><><><><><><><><><><><><><><>><>
    
End Sub

Public Sub UpdateServerTree()
    Set CubeDefTree.ImageList = ImageList2
    CubeDefTree.Nodes.Add , , "Server", DialogConnect.txtServer, 1
End Sub

Private Sub UpdateDatabaseTree(cnActive As ADODB.Connection)
Dim rs As ADODB.Recordset, sCatalogActive As String
    
    CubeDefTree.Nodes.Clear
    UpdateServerTree
    If cnActive Is Nothing Then
        CubeDefTree.Enabled = False
    ElseIf cnActive.State <> adStateOpen Then
        CubeDefTree.Enabled = False
    Else
        CubeDefTree.Enabled = True
        sCatalogActive = cnActive.DefaultDatabase
        Set rs = cnActive.OpenSchema(adSchemaCatalogs)
        Do Until rs.EOF
            sCatalogCur = rs.Fields(m_sFieldCatalogName)
            CubeDefTree.Nodes.Add "Server", tvwChild, sCatalogCur, sCatalogCur, 2
            UpdateCubeTree
            rs.MoveNext
        Loop
    End If
   
End Sub

Public Sub UpdateCubeTree()
Dim rs As ADODB.Recordset
Dim cnActive As New ADODB.Connection
Dim sCatalogActive As String
Dim i As Integer, j As Integer
Dim sSelectedCube As String
Dim cb As CubeDef, dm As Dimension
    sConnectStr = "Provider=msolap" & _
                  ";Data source =" & DialogConnect.txtServer.Text & _
                  ";User ID=sa" & _
                  ";Initial Catalog =" & sCatalogCur
    cnActive.Open sConnectStr
    cat.ActiveConnection = cnActive
    sCatalogActive = cnActive.DefaultDatabase
    Set rs = cnActive.OpenSchema(adSchemaCatalogs)
   
    With cat.CubeDefs
        For indDM = 0 To .Count - 1
            CubeDefTree.Nodes.Add sCatalogCur, tvwChild, sCatalogCur & .Item(indDM).Name, .Item(indDM).Name, 3
            'List1.AddItem sCatalogCur & .Item(i).Name
            cbtemp = .Item(indDM).Name
            UpdateDimension
        Next
    End With
End Sub

Public Sub DisConnect()
    Set cat.ActiveConnection = Nothing
    CubeDefTree.Nodes.Clear
    'CubeBrowser1.DisConnect
    StatusBarSt ("disconnst")
    PivotTree.Nodes.Clear
    TreeMem.Nodes.Clear
End Sub

Public Sub StatusBarSt(stat As String)
Dim i As Integer
On Error GoTo EH:
    Select Case stat
        Case "connst"
            StatusBar1.Panels(1).Picture = LoadPicture("picture/connst.bmp")
            StatusBar1.Panels(1).Text = "  " & DialogConnect.txtServer & "  "
        Case "disconnst"
            StatusBar1.Panels(1).Picture = LoadPicture("picture/disconst.bmp")
            StatusBar1.Panels(1).Text = " " & "Not Connected" & " "
        Case "conncube"
            For i = 1 To 5000
            Next
            StatusBar1.Panels(2).Text = " " & "Opening" & "   " & CubeDefTree.SelectedItem.Text & _
                                        " " & "Cube" & "  " & "..."
        Case "disconncube"
            StatusBar1.Panels(2).Text = ""
    End Select
EH:
    Debug.Print Err.Description
End Sub

Public Sub UpdateDimension()
'Dim m_cn1 As New ADODB.Connection
'Dim cat1  As New ADOMD.Catalog
'Dim j As Integer

    If cat.CubeDefs.Count <> 0 Then
        Set cdf = cat.CubeDefs(cat.CubeDefs.Item(indDM).Name)
        For jj = 0 To cdf.Dimensions.Count - 1
            cbNameTemp = sCatalogCur & cbtemp
            CubeDefTree.Nodes.Add cbNameTemp, tvwChild, sCatalogCur & cbtemp & cdf.Dimensions.Item(jj).Name, cdf.Dimensions.Item(jj).Name, 5
            UpdateLevel
        Next jj
    End If
End Sub


Public Sub UpdateLevel()

'Dim mb As ADOMD.Member
'Dim pr As ADODB.Property

'Set cn = New ADODB.Connection
'cn.Open "provider=msolap;data source=Jate;initial catalog=Foodmart;"

    'Set ct = New ADOMD.Catalog
    'Set ct.ActiveConnection = cn

    Set cdf = cat.CubeDefs(indDM)
    
    Set dm = cdf.Dimensions(cdf.Dimensions(jj).Name)
    Set hr = dm.Hierarchies(0)
    'Set lv = hr.Levels(0)
    For indLV = 0 To hr.Levels.Count - 1
        CubeDefTree.Nodes.Add sCatalogCur & cbtemp & cdf.Dimensions.Item(jj).Name, tvwChild, sCatalogCur & cbtemp & cdf.Dimensions.Item(jj).Name & hr.Levels.Item(indLV).Name, hr.Levels.Item(indLV).Name, indLV + 9
        If cdf.Dimensions.Item(jj).Name = "Measures" Then
            UpdateMember
        End If
    Next indLV
End Sub

Public Sub UpdateMember()
Dim i As Integer
    Set lv = hr.Levels(indLV)
    i = 0
    For Each mb In lv.Members
        CubeDefTree.Nodes.Add sCatalogCur & cbtemp & cdf.Dimensions.Item(jj).Name & hr.Levels.Item(indLV).Name, tvwChild, sCatalogCur & cbtemp & cdf.Dimensions.Item(jj).Name & hr.Levels.Item(indLV).Name & str(i) & mb.Name, mb.Name, 7
        i = i + 1
    Next mb
    FindMeasure
End Sub
Public Function checkcube() As Boolean
    If txtCube.Text = "" Then
        txtCube.Text = CubeDefTree.SelectedItem.Parent.Text
        TxtDatabase.Text = CubeDefTree.SelectedItem.Parent.Parent.Text
        checkcube = True
    ElseIf txtCube.Text <> CubeDefTree.SelectedItem.Parent.Text And TxtDatabase.Text <> CubeDefTree.SelectedItem.Parent.Parent.Parent.Text Then
        MsgBox "Select dimension from same cube"
        checkcube = False
        Else
            checkcube = True
    End If
End Function
Public Function CheckList(listItem As String) As Boolean
Dim i As Integer, j As Integer
Dim temp As String
    
    For i = 0 To List1.ListCount - 1
        If listItem = List1.List(i) Then
            CheckList = False
            MsgBox "Dimension exist"
            Exit Function
        End If
    Next
    
    For j = 0 To List2.ListCount - 1
        If listItem = List2.List(j) Then
            CheckList = False
            MsgBox "Dimension exist"
            Exit Function
        End If
    Next
    
    CheckList = True
End Function
Public Sub FillGrid()
Dim i As Integer, j As Integer
    'Set up the connection to the server.
    conn.ConnectionString = "Datasource=" & DialogConnect.txtServer & ";Provider=msolap;User ID=sa;" & "Initial Catalog=" & TxtDatabase.Text & ";"
    conn.Open
    Set cst.ActiveConnection = conn ' You must use Set.
    cst.Source = TxtQuery.Text
    cst.Open
    
    'Set up the FlexGrid control.
    MSFlexGrid.ClearStructure
    nFixedCols = List1.ListCount
    nFixedRows = List2.ListCount
    cCol = cst.Axes(0).Positions.Count
    MSFlexGrid.Cols = cCol + nFixedCols
    cRow = cst.Axes(1).Positions.Count
    MSFlexGrid.Rows = cRow + nFixedRows
    MSFlexGrid.FixedCols = nFixedCols
    MSFlexGrid.FixedRows = nFixedRows
    MSFlexGrid.MergeCells = 2
    For i = 0 To nFixedCols - 2
        MSFlexGrid.MergeCol(i) = True
    Next
    For i = 0 To nFixedRows - 2
        MSFlexGrid.MergeRow(i) = True
    Next
    
    
    Bar.Left = StatusBar1.Panels(3).Left + 26
    Bar.Top = StatusBar1.Top + 80
    Bar.Width = StatusBar1.Panels(3).Width - 50
    Bar.Height = StatusBar1.Height - 120
    Bar.Visible = True
    
    Bar.Max = (cCol * cRow)
    Bar.Value = 0
    StatusBar1.Panels(2).Text = "Opening cellset..."
    
    'Add column headers.
    iCol = nFixedCols
    For Each pos In cst.Axes(0).Positions
      'The caption for each member is used as the header.
        For i = 0 To List2.ListCount - 1
            MSFlexGrid.TextMatrix(i, iCol) = pos.Members(i).Caption
        Next
        iCol = iCol + 1
    Next
    
    'Add row headers.
    iRow = nFixedRows
    For Each pos In cst.Axes(1).Positions
        'The CrossJoin function in MDX indicates that this axis will have two members per position.
        For j = 0 To List1.ListCount - 1
            MSFlexGrid.TextMatrix(iRow, j) = pos.Members(j).Caption
        Next
        iRow = iRow + 1
    Next
    
    
    'Iterate through the cellset array values.
    For iCol = 0 To cCol - 1
        For iRow = 0 To cRow - 1
            ' Retrieve each value with the default method of the cst object.
            If IsNull(cst(iCol, iRow).Value) Then
                MSFlexGrid.TextMatrix(iRow + nFixedRows, iCol + nFixedCols) = ""
            Else
                MSFlexGrid.TextMatrix(iRow + nFixedRows, iCol + nFixedCols) = cst(iCol, iRow).Value
            End If
        Bar.Value = Bar.Value + 1
        Next
    Next
    StatusBar1.Panels(2).Text = ""
    Bar.Value = 0
    Bar.Visible = False
    conn.Close
End Sub

Public Function checkcubeLV() As Boolean
Dim cubeName As String
    If txtCube.Text = "" Then
        txtCube.Text = CubeDefTree.SelectedItem.Parent.Parent.Text
        TxtDatabase.Text = CubeDefTree.SelectedItem.Parent.Parent.Parent.Text
        checkcubeLV = True
    ElseIf txtCube.Text <> CubeDefTree.SelectedItem.Parent.Parent.Text And TxtDatabase.Text <> CubeDefTree.SelectedItem.Parent.Parent.Parent.Text Then
        MsgBox "Select level from same cube"
        checkcubeLV = False
        Else
            checkcubeLV = True
    End If
End Function

Public Sub GenColumn()
   
    If CubeDefTree.SelectedItem.Child.Text = "(All)" Then
        membercol = "[" & CubeDefTree.SelectedItem.Text & "]" & _
                    "," & "[" & CubeDefTree.SelectedItem.Text & "]" & _
                    "." & "[" & CubeDefTree.SelectedItem.Child.Next.Text & "]" & _
                    "." & "members"
    ElseIf CubeDefTree.SelectedItem.Child.Text <> "(All)" Then
        membercol = "[" & CubeDefTree.SelectedItem.Text & "]" & _
                    "." & "[" & CubeDefTree.SelectedItem.Child.Text & "]" & _
                    "." & "members"
    End If
    
    
End Sub

Public Sub GenRow()
    
    If CubeDefTree.SelectedItem.Child.Text = "(All)" Then
        memberrow = "[" & CubeDefTree.SelectedItem.Text & "]" & _
                    "," & "[" & CubeDefTree.SelectedItem.Text & "]" & _
                    "." & "[" & CubeDefTree.SelectedItem.Child.Next.Text & "]" & _
                    "." & "members"
    ElseIf CubeDefTree.SelectedItem.Child.Text <> "(All)" Then
        memberrow = "[" & CubeDefTree.SelectedItem.Text & "]" & _
                    "." & "[" & CubeDefTree.SelectedItem.Child.Text & "]" & _
                    "." & "members"
    End If
End Sub

Public Sub GenWith()

End Sub

Public Sub GenWhere()
Dim strwhere As String
    
    memberwhere = "[" & DMtemp & "]" & "." & "[" & CubeDefTree.SelectedItem.Text & "]" & "." & _
    "[" & TreeMem.SelectedItem.Text & "]"
    ListMem.AddItem memberwhere
End Sub

Public Sub FindMeasure()

End Sub

Public Sub FillButton()
Dim i As Integer
    MSHFlexGrid1.ClearStructure
    MSHFlexGrid1.Cols = List4.ListCount + MSFlexGrid.FixedCols
    MSHFlexGrid1.FixedCols = List4.ListCount + MSFlexGrid.FixedCols - 1
    'Column Level
    For i = 0 To List4.ListCount - 1
        MSHFlexGrid1.TextMatrix(0, i + nFixedCols) = List4.List(i)
        MSHFlexGrid1.Col = i + nFixedCols
        MSHFlexGrid1.Row = 0
        MSHFlexGrid1.CellBackColor = vbCyan
    Next
    'Row Level
    For i = 0 To List3.ListCount - 1
        MSFlexGrid.TextMatrix(nFixedRows - 1, i) = List3.List(i)
        MSFlexGrid.Col = i
        MSFlexGrid.Row = nFixedRows - 1
        MSFlexGrid.CellBackColor = vbCyan
    Next
End Sub

Public Function DrillDownRow(levelBefore As String)
Dim i As Integer
    'row
    For i = 0 To List5.ListCount - 1
        If List3.List(i) = Text4.Text Then
            If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & _
            List5.List(i) & Text4.Text).LastSibling.Text <> CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List5.List(i) & Text4.Text) Then
                Text6.Text = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List5.List(i) & Text4.Text).Next.Text
                temDMdrill = List5.List(i)
                CreateGridDrillRow
            Else
                MsgBox "Last Level"
            End If
        End If
    Next
    
End Function

Public Function DrillDownCol(levelBefore As String)
Dim i As Integer
    For i = 0 To List6.ListCount - 1
        If List4.List(i) = Text4.Text Then
            If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & _
            List6.List(i) & Text4.Text).LastSibling.Text <> CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text) Then
                Text6.Text = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Next.Text
                temDMdrill = List6.List(i)
                CreateGridDrillCol
            Else
                MsgBox "Last Level"
            End If
        End If
    Next
End Function

Public Sub CreateGridDrillRow()
    'Allocate Column Number
    colPosDrill = MSFlexGrid.MouseCol
    CreateListDrillRow
End Sub

Public Sub CreateListDrillRow()
Dim i As Integer
'Change all list for gen MDX
    For i = 0 To List3.ListCount - 1
        If List3.List(i) = Text4.Text Then
            List3.List(i) = Text6.Text
            List1.List(i) = "Drilldownlevel" & "(" & "{" & "[" & List5.List(i) & "]" & _
                            "." & "[" & Text4.Text & "]" & "." & "members" & "}" & _
                            "," & "[" & Text4.Text & "]" & ")"
            
            
            If Text4.Text = "Quarter" Or Text4.Text = "Month" Then
                List1.List(i) = "DrillDownMember" & "(" & "{" & "[" & List5.List(i) & "]" & _
                                "." & "Members" & "}" & "," & "{" & "[" & List5.List(i) & "]" & _
                                "." & "Members" & "}" & ")"
            End If
            'column from old text2.text
            'row
            Text3.Text = "{" & List1.List(i) & "}" & " " & "on" & " " & "rows" & " "
            TxtQuery.Text = Text2.Text & Text3.Text & "from" & " " & "[" & txtCube.Text & "]"
            
            Command1_Click
            FillGrid
            FillButton
            Exit For
        End If
    Next
End Sub

Public Sub CreateGridDrillCol()
    CreateListDrillCol
End Sub

Public Sub CreateListDrillCol()
Dim i As Integer
'Change all list for gen MDX
    
    For i = 0 To List4.ListCount - 1
        If List4.List(i) = Text4.Text Then
            List4.List(i) = Text6.Text
            List2.List(i) = "Drilldownlevel" & "(" & "{" & "[" & List6.List(i) & "]" & _
                            "." & "[" & Text4.Text & "]" & "." & "members" & "}" & _
                            "," & "[" & Text4.Text & "]" & ")"
            If Text4.Text = "Quarter" Or Text4.Text = "Month" Then
                List2.List(i) = "DrillDownMember" & "(" & "{" & "[" & List6.List(i) & "]" & _
                                "." & "Members" & "}" & "," & "{" & "[" & List6.List(i) & "]" & _
                                "." & "Members" & "}" & ")"
            End If
            'row from old text3.text
            'column
            Text2.Text = "Select" & "{" & List2.List(i) & "}" & " " & "on" & " " & "columns," & " "
            TxtQuery.Text = Text2.Text & Text3.Text & "from" & " " & "[" & txtCube.Text & "]"
            
            
            Command1_Click
            FillGrid
            FillButton
            Exit For
        End If
    Next
End Sub

Public Function DrillUpRow(levelBefore As String)
Dim i As Integer
    'row
    For i = 0 To List5.ListCount - 1
        If List3.List(i) = Text4.Text Then
            If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List5.List(i) & Text4.Text).Previous.Text <> CubeDefTree.Nodes.Item(TxtDatabase.Text & _
            txtCube.Text & List5.List(i) & Text4.Text) Then
                If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List5.List(i) & Text4.Text).Previous.Text <> "(All)" Then
                    Text6.Text = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List5.List(i) & Text4.Text).Previous.Text
                    temDMdrill = List5.List(i)
                    CreateGridDrillUpRow
                Else
                    MsgBox "First Level"
                End If
            End If
        End If
    Next
End Function

Public Function DrillUpCol(levelBefore As String)
Dim i As Integer
    'col
    For i = 0 To List6.ListCount - 1
        If List4.List(i) = Text4.Text Then
            If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).FirstSibling.Text = "(All)" Then
                If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Previous.Text = "(All)" Then
                    MsgBox "First Level"
                    Exit Function
                Else
                    Text6.Text = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Previous.Text
                    temDMdrill = List6.List(i)
                    CreateGridDrillUpCol
                End If
            Else
                If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).FirstSibling.Text = CubeDefTree.Nodes.Item(TxtDatabase.Text & _
                txtCube.Text & List6.List(i) & Text4.Text) Then
                    MsgBox "First Level"
                Else
                    Text6.Text = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Previous.Text
                    temDMdrill = List6.List(i)
                    CreateGridDrillUpCol
                End If
            End If
        End If
        
        '    If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Previous.Text <> CubeDefTree.Nodes.Item(TxtDatabase.Text & _
        '    txtCube.Text & List6.List(i) & Text4.Text) Then
        '        If CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Previous.Text <> "(all)" Then
        '            Text6.Text = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Previous.Text
        '            temDMdrill = List6.List(i)
        '            CreateGridDrillCol
        '        Else
        '            MsgBox "First Level"
        '        End If
        '    End If
        'End If
    Next
End Function

Public Sub CreateGridDrillUpCol()
Dim i As Integer
Dim str As String
'Change all list for gen MDX
    
    For i = 0 To List4.ListCount - 1
        If List4.List(i) = Text4.Text Then
            If Text6.Text <> "Year" Then
                str = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & Text4.Text).Previous.Previous.Text
                List4.List(i) = Text6.Text
                List2.List(i) = "Drilldownlevel" & "(" & "{" & "[" & List6.List(i) & "]" & _
                                "." & "[" & str & "]" & "." & "members" & "}" & _
                                "," & "[" & List6.List(i) & "]" & "." & "[" & str & "]" & ")"
            Else
                str = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List6.List(i) & "Year").Text
                List4.List(i) = Text6.Text
                List2.List(i) = "[" & List6.List(i) & "]" & "." & "[" & List4.List(i) & "]" & "." & "members"
            End If
            'row from old text3.text
            'column
            Text2.Text = "Select" & "{" & List2.List(i) & "}" & " " & "on" & " " & "columns," & " "
            TxtQuery.Text = Text2.Text & Text3.Text & "from" & " " & "[" & txtCube.Text & "]"
            
            Command1_Click
            FillGrid
            FillButton
            Exit For
            
        End If
    Next
End Sub

Public Sub CreateGridDrillUpRow()
Dim i As Integer
Dim str As String
'Change all list for gen MDX

    For i = 0 To List3.ListCount - 1
        If List3.List(i) = Text4.Text Then
            If Text6.Text <> "Year" Then
                str = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List5.List(i) & Text4.Text).Previous.Previous.Text
                List3.List(i) = Text6.Text
                List1.List(i) = "Drilldownlevel" & "(" & "{" & "[" & List5.List(i) & "]" & _
                                "." & "[" & str & "]" & "." & "members" & "}" & _
                                "," & "[" & List5.List(i) & "]" & "." & "[" & str & "]" & ")"
            Else
                str = CubeDefTree.Nodes.Item(TxtDatabase.Text & txtCube.Text & List5.List(i) & "Year").Text
                List3.List(i) = Text6.Text
                List1.List(i) = "[" & List5.List(i) & "]" & "." & "[" & List3.List(i) & "]" & "." & "members"
            End If
            'column from old text2.text
            'row
            Text3.Text = "{" & List1.List(i) & "}" & " " & "on" & " " & "rows" & " "
            TxtQuery.Text = Text2.Text & Text3.Text & "from" & " " & "[" & txtCube.Text & "]"
            
            Command1_Click
            FillGrid
            FillButton
            Exit For
        End If
    Next
End Sub

Private Sub TreeMem_DblClick()
Dim i As Integer
    If List5.ListCount <> 0 And List6.ListCount <> 0 Then
    For i = 0 To List5.ListCount - 1
        If DMtemp = List5.List(i) Then
            MsgBox "Duplicate with Row Axis"
            Exit Sub
        End If
    Next
    For i = 0 To List6.ListCount - 1
        If DMtemp = List6.List(i) Then
            MsgBox "Duplicate with Column Axis"
            Exit Sub
        End If
    Next
    If ListDMMem.ListCount = 0 Then
        If CubeDefTree.SelectedItem.Parent.Parent.Text = txtCube.Text And CubeDefTree.SelectedItem.Parent.Parent.Parent.Text = TxtDatabase.Text Then
            ListDMMem.AddItem CubeDefTree.SelectedItem.Parent.Text
            GenWhere
            PivotTree.Nodes.Add "Slicer", tvwChild, memberwhere, memberwhere, 4
            Command1_Click
        Else
            MsgBox "Select slicer from same cube"
        End If
    Else
        For i = 0 To ListDMMem.ListCount - 1
            If CubeDefTree.SelectedItem.Parent = ListDMMem.List(i) Then
                MsgBox "Duplicate with Slicer Axis"
                Exit Sub
            End If
        Next
        If CubeDefTree.SelectedItem.Parent.Parent.Text = txtCube.Text And CubeDefTree.SelectedItem.Parent.Parent.Parent.Text = TxtDatabase.Text Then
            ListDMMem.AddItem CubeDefTree.SelectedItem.Parent.Text
            GenWhere
            PivotTree.Nodes.Add "Slicer", tvwChild, memberwhere, memberwhere, 4
            Command1_Click
        Else
            MsgBox "Select slicer from same cube"
        End If
    End If
    End If
End Sub

Public Sub CheckMeasure()
Dim i As Integer, OldstrM As String, OldstrM1 As String

If List7.ListCount >= 1 Then
    If List7.ListCount = 1 Then
        OldstrM = "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
    End If
    
    If CubeDefTree.SelectedItem.Image = 7 Then
        For i = 0 To List7.ListCount - 2
            If i = 0 Then
                OldstrM = "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            Else
                OldstrM = OldstrM & "," & "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            End If
        Next
        For i = 0 To List7.ListCount - 1
            If i = 0 Then
                OldstrM1 = "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            Else
                OldstrM1 = OldstrM & "," & "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            End If
        Next
    ElseIf CubeDefTree.SelectedItem.Image = 5 Then
        For i = 0 To List7.ListCount - 1
            If i = 0 Then
                OldstrM = "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            Else
                OldstrM = OldstrM & "," & "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            End If
        Next
    Else
        For i = 0 To List7.ListCount - 1
            If i = 0 Then
                OldstrM = "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            ElseIf i <> 0 Then
                OldstrM = OldstrM & "," & "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
            End If
        Next
    End If
    

    If allowMeasure = "Cols" Then
        For i = 0 To List2.ListCount - 1
            If List2.List(i) = OldstrM Then
                List2.RemoveItem (i)
                Exit For
            End If
        Next
        For i = 0 To List2.ListCount - 1
            If List2.List(i) = OldstrM1 Then
                List2.RemoveItem (i)
                Exit For
            End If
        Next
    
    ElseIf allowMeasure = "Rows" Then
        For i = 0 To List1.ListCount - 1
            If List1.List(i) = OldstrM Then
                List1.RemoveItem (i)
                Exit For
            End If
        Next
        For i = 0 To List1.ListCount - 1
            If List1.List(i) = OldstrM1 Then
                List1.RemoveItem (i)
                Exit For
            End If
        Next
    End If
End If
    
    
    For i = 0 To List7.ListCount - 1
        If i = 0 Then
            strMeasure = "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
        Else
            strMeasure = strMeasure & "," & "[" & "Measures" & "]" & "." & "[" & List7.List(i) & "]"
        End If
    Next
    
    
        If allowMeasure = "Cols" Then
            List2.AddItem strMeasure
        ElseIf allowMeasure = "Rows" Then
            List1.AddItem strMeasure
        End If
        OldstrM = ""
    
End Sub

Private Sub TV1_GotFocus()

End Sub


