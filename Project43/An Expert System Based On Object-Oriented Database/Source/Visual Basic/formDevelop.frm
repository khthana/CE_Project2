VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form formDevelop 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Knowledge Base"
   ClientHeight    =   6495
   ClientLeft      =   1590
   ClientTop       =   1500
   ClientWidth     =   7380
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   7380
   Begin VB.Frame frmDetails 
      Caption         =   "Details"
      Height          =   6495
      Left            =   0
      TabIndex        =   87
      Top             =   0
      Visible         =   0   'False
      Width           =   7215
      Begin VB.CommandButton cmdDetailsClose 
         Caption         =   "&Close"
         Height          =   375
         Left            =   3120
         TabIndex        =   89
         Top             =   5880
         Width           =   975
      End
      Begin MSComctlLib.TreeView tvwFrame 
         Height          =   5295
         Left            =   240
         TabIndex        =   88
         Top             =   360
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   9340
         _Version        =   393217
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Frame frmRule 
      Caption         =   "Rulegroup : "
      Height          =   6135
      Left            =   0
      TabIndex        =   45
      Top             =   0
      Visible         =   0   'False
      Width           =   7215
      Begin MSComctlLib.ListView lvwRules 
         Height          =   3975
         Left            =   120
         TabIndex        =   86
         Top             =   360
         Width           =   6975
         _ExtentX        =   12303
         _ExtentY        =   7011
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ID"
            Object.Width           =   1951
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "If"
            Object.Width           =   5080
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Then"
            Object.Width           =   5080
         EndProperty
      End
      Begin VB.CommandButton cmdCRule 
         Caption         =   "&Cancel"
         Height          =   495
         Left            =   5880
         TabIndex        =   85
         Top             =   5400
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.CommandButton cmdQRule 
         Caption         =   "&Quit"
         Height          =   495
         Left            =   5880
         TabIndex        =   54
         Top             =   5400
         Width           =   1095
      End
      Begin VB.CommandButton cmdURule 
         Caption         =   "&Update"
         Height          =   495
         Left            =   4440
         TabIndex        =   53
         Top             =   5400
         Width           =   1095
      End
      Begin VB.CommandButton cmdARule 
         Caption         =   "&Add"
         Height          =   495
         Left            =   1560
         TabIndex        =   52
         Top             =   5400
         Width           =   1095
      End
      Begin VB.CommandButton cmdDRule 
         Caption         =   "&Delete"
         Height          =   495
         Left            =   3000
         TabIndex        =   51
         Top             =   5400
         Width           =   1095
      End
      Begin VB.CommandButton cmdNRule 
         Caption         =   "&New"
         Height          =   495
         Left            =   120
         TabIndex        =   50
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox txtThenRule 
         Height          =   375
         Left            =   3600
         TabIndex        =   49
         Top             =   4800
         Width           =   3375
      End
      Begin VB.TextBox txtIfRule 
         Height          =   375
         Left            =   120
         TabIndex        =   47
         Top             =   4800
         Width           =   3255
      End
      Begin VB.Label lblThenRule 
         Caption         =   "Enter the THEN cluase for this rule :"
         Height          =   255
         Left            =   3600
         TabIndex        =   48
         Top             =   4440
         Width           =   3135
      End
      Begin VB.Label lblIfRule 
         Caption         =   "Enter the IF clause for this rule :"
         Height          =   375
         Left            =   120
         TabIndex        =   46
         Top             =   4440
         Width           =   3855
      End
   End
   Begin VB.Frame frmParm 
      Caption         =   "Parmgroup : "
      Height          =   6135
      Left            =   0
      TabIndex        =   27
      Top             =   0
      Visible         =   0   'False
      Width           =   7215
      Begin VB.TextBox txtDefaultParm 
         Height          =   375
         Left            =   3240
         TabIndex        =   84
         Top             =   4080
         Width           =   3735
      End
      Begin VB.CommandButton cmdNParm 
         Caption         =   "&New"
         Height          =   495
         Left            =   120
         TabIndex        =   64
         Top             =   5400
         Width           =   1095
      End
      Begin VB.TextBox txtValuesParm 
         Height          =   375
         Left            =   3240
         TabIndex        =   55
         Top             =   4800
         Width           =   3735
      End
      Begin VB.ComboBox cboExpectParm 
         Height          =   330
         ItemData        =   "formDevelop.frx":0000
         Left            =   3240
         List            =   "formDevelop.frx":0002
         TabIndex        =   43
         Text            =   "cboExpectParm"
         Top             =   3360
         Width           =   3735
      End
      Begin VB.CommandButton cmdUParm 
         Caption         =   "&Update"
         Height          =   495
         Left            =   4440
         TabIndex        =   40
         Top             =   5400
         Width           =   1095
      End
      Begin VB.CommandButton cmdCParm 
         Caption         =   "&Cancel"
         Height          =   495
         Left            =   5880
         TabIndex        =   39
         Top             =   5400
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.CommandButton cmdDParm 
         Caption         =   "&Delete"
         Height          =   495
         Left            =   3000
         TabIndex        =   38
         Top             =   5400
         Width           =   1095
      End
      Begin VB.CommandButton cmdAParm 
         Caption         =   "&Add"
         Height          =   495
         Left            =   1560
         TabIndex        =   37
         Top             =   5400
         Width           =   1095
      End
      Begin VB.ListBox lstParms 
         Height          =   4680
         Left            =   240
         TabIndex        =   36
         Top             =   360
         Width           =   2775
      End
      Begin VB.ComboBox cboTypeParm 
         Height          =   330
         ItemData        =   "formDevelop.frx":0004
         Left            =   3240
         List            =   "formDevelop.frx":0006
         TabIndex        =   35
         Text            =   "cboTypeParm"
         Top             =   2640
         Width           =   3735
      End
      Begin VB.TextBox txtPromptParm 
         Height          =   375
         Left            =   3240
         TabIndex        =   33
         Top             =   1920
         Width           =   3735
      End
      Begin VB.TextBox txtTParm 
         Height          =   375
         Left            =   3240
         TabIndex        =   31
         Top             =   1200
         Width           =   3735
      End
      Begin VB.TextBox txtParm 
         Height          =   375
         Left            =   3240
         TabIndex        =   29
         Top             =   480
         Width           =   3735
      End
      Begin VB.CommandButton cmdQParm 
         Caption         =   "&Quit"
         Height          =   495
         Left            =   5880
         TabIndex        =   41
         Top             =   5400
         Width           =   1095
      End
      Begin VB.Label lblDefaultParm 
         Caption         =   "Enter the Default Values :"
         Height          =   375
         Left            =   3240
         TabIndex        =   83
         Top             =   3840
         Width           =   3855
      End
      Begin VB.Label lblValuesParm 
         Caption         =   "Enter the VALUES you expect for the parameter "
         Height          =   375
         Left            =   3240
         TabIndex        =   44
         Top             =   4560
         Width           =   3855
      End
      Begin VB.Label lblExpectParm 
         Caption         =   "Select an EXPECT value of parameter "
         Height          =   375
         Left            =   3240
         TabIndex        =   42
         Top             =   3120
         Width           =   3855
      End
      Begin VB.Label lblTypeParm 
         Caption         =   "Enter the TYPE of the parameter "
         Height          =   375
         Left            =   3240
         TabIndex        =   34
         Top             =   2400
         Width           =   3855
      End
      Begin VB.Label lblPromptParm 
         Caption         =   "Enter the Statement for PROMPT "
         Height          =   375
         Left            =   3240
         TabIndex        =   32
         Top             =   1680
         Width           =   3855
      End
      Begin VB.Label lblTParm 
         Caption         =   "Enter the TRANSLATION of "
         Height          =   375
         Left            =   3240
         TabIndex        =   30
         Top             =   960
         Width           =   3855
      End
      Begin VB.Label lblParm 
         Caption         =   "Enter the Name of this parameter :"
         Height          =   375
         Left            =   3240
         TabIndex        =   28
         Top             =   240
         Width           =   3855
      End
   End
   Begin VB.Frame frmCharacteristics 
      Caption         =   "Frame : "
      Height          =   5295
      Left            =   1800
      TabIndex        =   15
      Top             =   0
      Visible         =   0   'False
      Width           =   3975
      Begin VB.CommandButton cmdFCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   2280
         TabIndex        =   26
         Top             =   4560
         Width           =   1215
      End
      Begin VB.CommandButton cmdFOK 
         Caption         =   "&OK"
         Height          =   375
         Left            =   480
         TabIndex        =   25
         Top             =   4560
         Width           =   1215
      End
      Begin VB.OptionButton optTextags 
         Caption         =   "TEXTAGS"
         Enabled         =   0   'False
         Height          =   495
         Left            =   240
         TabIndex        =   24
         Top             =   3960
         Width           =   3495
      End
      Begin VB.OptionButton optFunctions 
         Caption         =   "FUNCTIONS"
         Enabled         =   0   'False
         Height          =   495
         Left            =   240
         TabIndex        =   23
         Top             =   3360
         Width           =   3615
      End
      Begin VB.OptionButton optVariables 
         Caption         =   "VARIABLES"
         Enabled         =   0   'False
         Height          =   495
         Left            =   240
         TabIndex        =   22
         Top             =   2760
         Width           =   3615
      End
      Begin VB.OptionButton optMetaRules 
         Caption         =   "META-RULES"
         Enabled         =   0   'False
         Height          =   495
         Left            =   240
         TabIndex        =   21
         Top             =   2160
         Width           =   3615
      End
      Begin VB.OptionButton optRules 
         Caption         =   "APERTURE-RULES"
         Height          =   375
         Left            =   240
         TabIndex        =   20
         Top             =   1560
         Width           =   3615
      End
      Begin VB.OptionButton optParams 
         Caption         =   "APERTURE-PARAMETERS"
         Height          =   375
         Left            =   240
         TabIndex        =   19
         Top             =   960
         Width           =   3615
      End
      Begin VB.OptionButton optProperties 
         Caption         =   "PROPERTIES"
         Height          =   375
         Left            =   240
         TabIndex        =   18
         Top             =   360
         Width           =   3615
      End
   End
   Begin VB.Frame frmFrameList 
      Caption         =   "Select Frame :"
      Height          =   6135
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Visible         =   0   'False
      Width           =   7215
      Begin VB.CommandButton cmdDFCancel2 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   5880
         TabIndex        =   82
         Top             =   5520
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.CommandButton cmdDFUpdate 
         Caption         =   "&Update"
         Height          =   375
         Left            =   4080
         TabIndex        =   81
         Top             =   5520
         Width           =   975
      End
      Begin VB.CommandButton cmdDFCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   5880
         TabIndex        =   80
         Top             =   5520
         Width           =   975
      End
      Begin VB.CommandButton cmdDFCreate 
         Caption         =   "&Create"
         Height          =   375
         Left            =   240
         TabIndex        =   79
         Top             =   5520
         Width           =   975
      End
      Begin VB.ComboBox cboDFDestination 
         Height          =   330
         Left            =   2880
         TabIndex        =   78
         Top             =   4920
         Width           =   4095
      End
      Begin VB.ComboBox cboDFSource 
         Height          =   330
         Left            =   2880
         TabIndex        =   76
         Top             =   4200
         Width           =   4095
      End
      Begin VB.ComboBox cboDFTypeGoals 
         Height          =   330
         Left            =   2880
         TabIndex        =   74
         Top             =   3480
         Width           =   4095
      End
      Begin VB.TextBox txtDFTGoals 
         Height          =   375
         Left            =   2880
         TabIndex        =   72
         Top             =   2760
         Width           =   4095
      End
      Begin VB.TextBox txtDFGoals 
         Height          =   375
         Left            =   2880
         TabIndex        =   70
         Top             =   2040
         Width           =   4095
      End
      Begin VB.TextBox txtDFTranslation 
         Height          =   375
         Left            =   2880
         TabIndex        =   68
         Top             =   1320
         Width           =   4095
      End
      Begin VB.TextBox txtDFName 
         Height          =   315
         Left            =   2880
         TabIndex        =   66
         Top             =   600
         Width           =   4095
      End
      Begin VB.CommandButton cmdDFNew 
         Caption         =   "&New"
         Height          =   375
         Left            =   2160
         TabIndex        =   58
         ToolTipText     =   """Add New Frame"""
         Top             =   5520
         Width           =   975
      End
      Begin VB.ListBox lstFrameList 
         Height          =   4050
         Left            =   240
         TabIndex        =   57
         Top             =   600
         Width           =   2295
      End
      Begin VB.CommandButton cmdDFNext 
         Caption         =   "&Frame Characteristic"
         Height          =   375
         Left            =   240
         TabIndex        =   17
         Top             =   4920
         Width           =   2175
      End
      Begin VB.Label lblDestination 
         Caption         =   "Select Destination :"
         Height          =   375
         Left            =   2880
         TabIndex        =   77
         Top             =   4680
         Width           =   4215
      End
      Begin VB.Label lblDFSource 
         Caption         =   "Select Parent Frame :"
         Height          =   255
         Left            =   2880
         TabIndex        =   75
         Top             =   3960
         Width           =   4215
      End
      Begin VB.Label lblDFTypeGoals 
         Caption         =   "Enter the TYPE of the parameter :"
         Height          =   375
         Left            =   2880
         TabIndex        =   73
         Top             =   3240
         Width           =   4215
      End
      Begin VB.Label lblDFTGoals 
         Caption         =   "Enter the Translation for Goals :"
         Height          =   495
         Left            =   2880
         TabIndex        =   71
         Top             =   2520
         Width           =   4215
      End
      Begin VB.Label lblDFGoals 
         Caption         =   "Enter the Goals for the Frame :"
         Height          =   375
         Left            =   2880
         TabIndex        =   69
         Top             =   1800
         Width           =   4215
      End
      Begin VB.Label lblDFTranslation 
         Caption         =   "Enter the Translation for this Frame :"
         Height          =   375
         Left            =   2880
         TabIndex        =   67
         Top             =   1080
         Width           =   4215
      End
      Begin VB.Label lblDFName 
         Caption         =   "Enter the Name of this Frame :"
         Height          =   375
         Left            =   2880
         TabIndex        =   65
         Top             =   360
         Width           =   4095
      End
      Begin VB.Label lblFrameList 
         Caption         =   "Frame :"
         Height          =   255
         Left            =   240
         TabIndex        =   56
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame frmKB 
      Caption         =   "Knowledge Base :"
      Height          =   6495
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   7215
      Begin VB.CommandButton cmdCancel 
         Caption         =   "&Cancel"
         Height          =   375
         Left            =   5160
         TabIndex        =   63
         Top             =   6000
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "&Update"
         Height          =   375
         Left            =   3840
         TabIndex        =   62
         Top             =   6000
         Width           =   1095
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "&New"
         Height          =   375
         Left            =   4440
         TabIndex        =   61
         Top             =   5520
         Width           =   1095
      End
      Begin VB.ListBox lstDomain 
         Height          =   5940
         Left            =   240
         TabIndex        =   60
         Top             =   360
         Width           =   2535
      End
      Begin VB.CommandButton cmdNext 
         Caption         =   "Next"
         Height          =   375
         Left            =   5760
         TabIndex        =   59
         Top             =   5520
         Width           =   1095
      End
      Begin VB.TextBox txtTGoals 
         Height          =   375
         Left            =   3240
         TabIndex        =   13
         Top             =   4080
         Width           =   3495
      End
      Begin VB.TextBox txtGoals 
         Height          =   375
         Left            =   3240
         TabIndex        =   11
         Top             =   3240
         Width           =   3495
      End
      Begin VB.TextBox txtTRootFrame 
         Height          =   375
         Left            =   3240
         TabIndex        =   9
         Top             =   2400
         Width           =   3495
      End
      Begin VB.TextBox txtRootFrame 
         Height          =   315
         Left            =   3240
         TabIndex        =   7
         Top             =   1560
         Width           =   3495
      End
      Begin VB.TextBox txtDomain 
         Height          =   315
         Left            =   3240
         TabIndex        =   5
         ToolTipText     =   """Click New Button Before"""
         Top             =   720
         Width           =   3495
      End
      Begin VB.ComboBox cboTypeGoals 
         Height          =   330
         ItemData        =   "formDevelop.frx":0008
         Left            =   3240
         List            =   "formDevelop.frx":000A
         TabIndex        =   3
         Text            =   "cboTypeGoals"
         Top             =   4920
         Width           =   3495
      End
      Begin VB.CommandButton cmdCreate 
         Caption         =   "C&reate"
         Height          =   375
         Left            =   3120
         TabIndex        =   2
         Top             =   5520
         Width           =   1095
      End
      Begin VB.CommandButton cmdQuit 
         Caption         =   "&Quit"
         Height          =   375
         Left            =   5160
         TabIndex        =   1
         Top             =   6000
         Width           =   1095
      End
      Begin VB.Label lblTypeGoals 
         Caption         =   "Enter the TYPE of the parameter :"
         Height          =   375
         Left            =   3240
         TabIndex        =   14
         Top             =   4560
         Width           =   3735
      End
      Begin VB.Label lblTGoals 
         Caption         =   "Enter the Translation for Goals :"
         Height          =   375
         Left            =   3240
         TabIndex        =   12
         Top             =   3720
         Width           =   3735
      End
      Begin VB.Label lblGoals 
         Caption         =   "Enter the Goals for the Frame :"
         Height          =   375
         Left            =   3240
         TabIndex        =   10
         Top             =   2880
         Width           =   3735
      End
      Begin VB.Label lblTRootFrame 
         Caption         =   "Enter the Translation for Root Frame :"
         Height          =   255
         Left            =   3240
         TabIndex        =   8
         Top             =   2040
         Width           =   3735
      End
      Begin VB.Label lblRootFrame 
         Caption         =   "Enter the Name of this Root Frame :"
         Height          =   375
         Left            =   3240
         TabIndex        =   6
         Top             =   1200
         Width           =   3735
      End
      Begin VB.Label lblDomain 
         Caption         =   "Enter the Knowledge Base Heading (DOMAIN) :"
         Height          =   255
         Left            =   3240
         TabIndex        =   4
         Top             =   360
         Width           =   3735
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit Develop"
      End
   End
   Begin VB.Menu mnuKB 
      Caption         =   "&Knowledge Base"
      Begin VB.Menu mnuCKB 
         Caption         =   "&Intensional Knowledge Base"
      End
      Begin VB.Menu mnuIFacts 
         Caption         =   "&Extensional Knowledge Base"
      End
   End
   Begin VB.Menu mnuKBDomain 
      Caption         =   "&Domain"
      Begin VB.Menu mnuKBCDomain 
         Caption         =   "&Create Domain"
      End
   End
   Begin VB.Menu mnuKBFrame 
      Caption         =   "&Frame"
      Begin VB.Menu mnuKBAddSubFrame 
         Caption         =   "Add Sub Frame"
      End
   End
End
Attribute VB_Name = "formDevelop"
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
Dim IDFacts As Integer

Dim InstFrames() As String
Dim InstParms() As String
Dim instRules() As String
Dim FrameChild() As String
Dim RestoreIf() As String
Dim RestoreThen() As String


Dim CEKB As String
Dim IDCEKB As Integer
Dim SlotsName As String
Dim IDSlots As Integer

'Variables for all
Dim selectcombo As Object

Dim createclass As Object
Dim mainclass As Object
Dim embedclass1 As Object
Dim embedclass2 As Object
Dim deleteclass As Object

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
Dim tmpID As Integer

Dim pers As Object
Dim displays As String, delimd As String, types() As String
Dim i, j, k, l As Integer
Dim tmp, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6 As Variant
Dim oid As Integer
Dim txtComplete As Boolean
Dim columns As Integer
Dim IfString As String
Dim ThenString As String

Dim tagDomain As Boolean
Dim tagFrame As Boolean
Dim tagParameter As Boolean
Dim tagRule As Boolean
Dim rulesitem As ListItem
Dim addnode As Node

'CDomain
  '1. ID
  '2. Destination
  '3. FrameTranslationName
  '4. Name
  '5. Source
  '6. Goals_GoalsTranslation
  '7. Goals_Name
  '8. Goals_Type
  '9. Parameters_Default
'10. Parameters_Expect
'11. Parameters_Name
'12. Parameters_ParametersTranslation
'13. Parameters_Prompt
'14. Parameters_Type
'15. Parameters_Value
'16. Rules_FramePointer
'17. Rules_IfStatement
'18. Rules_ThenStatement

'Cache 4
'1. ID
'2. Destination
'3. FrameTranslation
'4. Goals ( Name GoalsTranslation Type)
'5. Name
'6. Parameters ( Name ParametersTranslation Prompt Type Expect Value Default)
'7. Rules ( FramePointer IfStatement ThenStatement)
'8.Source

'***************************************************** Main ****************************************************
Private Sub Form_Load()
    
    'Initial Variables
    IDCDomain = 0
    IDCRules = 0
    IDCparameters = 0
    IDFrame = 0
    IDCEKB = 0
    IDSlots = 0
    IDFacts = 0
    
    domainindex = 0
    frameindex = 0
    parmsindex = 0
    rulesindex = 0
    
    If cache.IsConnected Then
        MsgBox "Connection is OK"
    Else
        ConnectToCache
    End If
    
    'Disable menu
    mnuKB.Enabled = True
    mnuKBDomain.Enabled = False
    mnuKBFrame.Enabled = False
    
End Sub

Private Sub ConnectToCache()
    
    If cache.Connect("cn_iptcp:127.0.0.1[1972]:EXPERTSYSTEM") Then
        MsgBox ("Connect to Cache OK")
    Else
        MsgBox ("Can't Connect to Cache")
    End If

End Sub

Private Sub mnuCKB_Click()
    
    'manage frame
    'load domain list
    'load combo
    'manage button
    'manage menu
       
    formDevelop.Caption = "Intensional Knowledge Base"
    'manage frame
    frmKB.Visible = True
    
    'load domain list
    Call LoadDomainList(lstDomain)
    
    'loadcombo
    Call LoadTypeGoalsCombo(cboTypeGoals)
    
    'manage button
    cmdUpdate.Enabled = False
    cmdNext.Enabled = False
    cmdCreate.Enabled = False
    
    'manage menu
    mnuKBDomain.Enabled = True
    mnuExit.Enabled = False
    mnuIFacts.Enabled = False
    If domainindex = 0 Then
        cmdCreate.Enabled = True
        cmdNew.Enabled = False
    End If
    
End Sub

Private Sub LoadTypeGoalsCombo(selectcombo As Object)
    
    Set pers = cache.Static(TCGoals)
    displays = pers.GoalsTypeDisplay
    delimd = Left(displays, 1)
    types = Split(displays, delimd)
    selectcombo.Clear
    For i = 1 To UBound(types)
        selectcombo.AddItem types(i)
    Next i

End Sub
'***************************************************** Main ****************************************************

'*************************************************** Domain ***************************************************
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

Private Sub DomainProcess(tagDomain)
    
    'check input
    'operation
    'clear screen
    'load domain list

    'check input
    txtComplete = False
    If txtDomain = "" Then
        lblDomain.ForeColor = &HFF&
        txtComplete = True
    Else
        lblDomain.ForeColor = &H80000012
    End If
    If txtRootFrame = "" Then
        lblRootFrame.ForeColor = &HFF&
        txtComplete = True
    Else
        lblRootFrame.ForeColor = &H80000012
    End If
    'If txtGoals = "" Then
        'lblGoals.ForeColor = &HFF&
        'txtComplete = True
    'Else
        'lblGoals.ForeColor = &H80000012
    'End If
    'If cboTypeGoals = "" Then
        'lblTypeGoals.ForeColor = &HFF&
        'txtComplete = True
    'Else
        'lblTypeGoals.ForeColor = &H80000012
    'End If

    If txtComplete = True Then
        MsgBox "Please Check Input"
    Else
        Screen.MousePointer = vbHourglass
        'operation
        'get details and goals
        'add instance to CDomain class and goals to Parameters
        '1. create CDomain class
        '2. insert instance to CDomain class
            '2.1 new &openid mainclass check tagDomain
            '2.2 new embeddable Goals
            '2.3 new embeddable Parameters
            '2.4 add to CDomain
        '3. insert instance to CAllDomain
        
        'create class and insert instance to CAllDomain and CDomain
        '1. call method "CDomain" to create class from Routines Class "TCMethods"
        '2. insert instance to CDomain
        '2.1 new &OpenId mainclass
        
        'True New
        'False Update
        
        Dim OldGoals As String
        
        'check old goals
        If tagDomain Then    'new
            'don't mind oldgoals
        Else 'update
            Set getinstance = cache.OpenId(CDomain, 1)
            If getinstance.Goals.GetAt(1).Name = "" Then
                OldGoals = ""
            Else
                OldGoals = getinstance.Goals.GetAt(1).Name
            End If
            getinstance.sys_Close
        End If
        
        If tagDomain Then 'new
            Set createclass = cache.Static(TCMethods)
            tmp1 = createclass.CDomain(CDomain)
            Set mainclass = cache.New(CDomain)
        Else 'update
            Set mainclass = cache.OpenId(CDomain, 1)
        End If
        If mainclass Is Nothing Then
            MsgBox "Error"
        Else
            
            '2.2 new embeddable Goals
            Set embedclass1 = cache.New(TCGoals)
            embedclass1.Name = txtGoals.Text
            embedclass1.GoalsTranslation = txtTGoals.Text
            embedclass1.Type = cboTypeGoals.Text
            
            '2.3 new embeddable Parameters
            Set embedclass2 = cache.New(TCParameters)
            embedclass2.Name = txtGoals.Text
            embedclass2.ParametersTranslation = txtTGoals.Text
            embedclass2.Prompt = ""
            embedclass2.Type = cboTypeGoals.Text
            embedclass2.Expect = ""
            embedclass2.Values = ""
            embedclass2.Default = ""
            mainclass.Name = txtRootFrame.Text
            mainclass.FrameTranslation = txtTRootFrame.Text
            mainclass.Source = txtRootFrame.Text
            mainclass.Destination = "Own"
            
            If tagDomain Then ' new
                tmp1 = mainclass.Goals.InsertAt(embedclass1, 1)
                If txtGoals.Text = "" Then
                    'new don't have so don't add parameter
                Else
                    'new have so add parameter
                    tmp2 = mainclass.Parameters.InsertAt(embedclass2, 1)
                End If
            
            Else 'update
                If OldGoals = "" Then
                    If txtGoals.Text = "" Then
                        'old don't have and new don't have so don't add goals and parameters
                    Else 'new have
                        'old don't have and new have so add goals and add parameters
                        tmp1 = mainclass.Goals.InsertAt(embedclass1, 1)
                        tmp2 = mainclass.Parameters.InsertAt(embedclass2, 1)
                    End If
                Else 'old have
                    If txtGoals.Text = "" Then
                        'old have and new don't have so setat goals and remove  parameters
                        tmp1 = mainclass.Goals.SetAt(embedclass1, 1)
                        tmp2 = mainclass.Parameters.RemoveAt(1)
                    Else
                        'old have and new have so update
                        tmp1 = mainclass.Goals.SetAt(embedclass1, 1)
                        tmp2 = mainclass.Parameters.SetAt(embedclass2, 1)
                    End If
                End If
            End If
            
            '2.4 add to CDomain
            mainclass.sys_Save
            embedclass1.sys_Close
            embedclass2.sys_Close
            mainclass.sys_Close
        End If
        
        If tagDomain Then
            '3. insert instance to CAllDomain
            Set insertinstance = cache.Static(TCMethods)
            tmp = insertinstance.SaveDomain(CDomain)
        End If
        
        Screen.MousePointer = vbDefault
    End If
    
    'clear screen
    Call ClearfrmDomain
        
    'load domain list
    Call LoadDomainList(lstDomain)

End Sub

Private Sub cmdCreate_Click()
    
    'map variables
    'call domainprocess
    'manage button
    'manage menu
    
    'map variables
    CDomain = txtDomain.Text
    IDCDomain = IDCDomain + 1
    tagDomain = True
    
    'call domainprocess
    Call DomainProcess(tagDomain)
    
    'manage button
    cmdCreate.Enabled = False
    cmdNext.Enabled = False
    cmdUpdate.Enabled = False
    cmdCancel.Visible = False
    cmdNew.Enabled = True
    
    'manage menu
    mnuExit.Enabled = False
    
End Sub

Private Sub cmdNew_Click()
    
    'manage screen
    'clear screen
    'load domain list
    'manage button
    'manage menu
    
    'manage screen
    txtDomain.Enabled = True
    
    'clear screen
    Call ClearfrmDomain
    
    'load domain list
    Call LoadDomainList(lstDomain)
    IDCDomain = domainindex
        
    'manage button
    cmdNext.Enabled = False
    cmdUpdate.Enabled = False
    cmdNew.Enabled = False
    cmdCreate.Enabled = True
    cmdCancel.Visible = True
    
    'manage menu
    
End Sub

Private Sub cmdNext_Click()
    
    'manage var to next frame
    'manage frame
    'load framelist
    'load combo
    'manage button
    
    'manage var to next frame
    IDFrame = 1
    
    'manage frame
    frmKB.Visible = False
    frmFrameList.Visible = True
    
    'load framelist
    Call LoadFrameList(lstFrameList)
    
    'load combo
    'cboDFTypeGoals
    Call LoadTypeGoalsCombo(cboDFTypeGoals)
    'cboDFSource
    Call LoadFrameList(cboDFSource)
    'cboDFDestination
    Call LoadDestinationCombo(cboDFDestination)
    
    'manage button
        'manage button in framelist frame
        cmdDFCreate.Enabled = False
        cmdDFNext.Enabled = False
        cmdDFUpdate.Enabled = False
        cmdDFNew.Enabled = True
    
    'manage menu
    mnuKBFrame.Enabled = True
    mnuKBDomain.Enabled = False
    
End Sub

Private Sub cmdUpdate_Click()
    
    'map var
    'manage screen
    'call domainprocess
    'manage button
    'manage menu
   
    'map var
    tagDomain = False
    
    'manage screen
    txtDomain.Enabled = True
    
    'call domainprocess
    Call DomainProcess(tagDomain)
    
    'manage button
    cmdCreate.Enabled = False
    cmdNext.Enabled = False
    cmdUpdate.Enabled = False
    
    'manage menu

End Sub

Private Sub cmdCancel_Click()
    
    'clear screen
    'manage button
    'manage menu
    
    'clear screen
    Call ClearfrmDomain
    
    'manage button
    cmdNew.Enabled = True
    cmdCreate.Enabled = False
    cmdCancel.Visible = False
    
    'manage menu

End Sub

Private Sub cmdQuit_Click()
    
    'clear screen
    'manage frame
    'manage menu
    
    'clearscreen
    Call ClearfrmDomain
    
    'manage frame
    frmKB.Visible = False
    
    'manage menu
    mnuExit.Enabled = True
    mnuKBDomain.Enabled = False
    mnuIFacts.Enabled = True
    
    formDevelop.Caption = "Knowledge Base"

End Sub

Private Sub lstDomain_Click()
        
    'manage screen
    'map var
    'get variables from cache
    'map variables to vb
    'manage button
    'manage menu
    
    'manage screen
    txtDomain.Enabled = False
    
    'map var
    CDomain = lstDomain.Text
    IDCDomain = lstDomain.ListIndex + 1
    
    'get variables from cache
    Set getinstance = cache.OpenId(CDomain, 1)
    
    'map variables to vb
    txtDomain.Text = CDomain
    txtRootFrame.Text = getinstance.Name
    txtTRootFrame.Text = getinstance.FrameTranslation
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    tmp = 0
    While queryinstance.Next
        tmp = tmp + 1
        For i = 1 To queryinstance.GetColumnCount
            Debug.Print " Column " & i & " : " & queryinstance.GetColumnHeader(i) & " Value : " & queryinstance.GetData(i)
        Next i
    Wend
    If tmp = 0 Then
        txtGoals.Text = ""
        txtTGoals.Text = ""
        cboTypeGoals.Text = ""
        lblGoals.Caption = "Enter the Goals for the frame :"
        lblTGoals.Caption = "Enter the Translation for :"
        lblTypeGoals.Caption = "Enter the Type of the parameter :"
    Else
        txtGoals.Text = getinstance.Goals.GetAt(1).Name
        txtTGoals.Text = getinstance.Goals.GetAt(1).GoalsTranslation
        cboTypeGoals.Text = getinstance.Goals.GetAt(1).Type
        lblGoals.Caption = "Enter the Goals for the frame " & getinstance.Goals.GetAt(1).Name & " :"
        lblTGoals.Caption = "Enter the Translation for " & getinstance.Goals.GetAt(1).Name & " :"
        lblTypeGoals.Caption = "Enter the Type of the parameter " & getinstance.Goals.GetAt(1).Name & " :"
    End If
    lblTRootFrame.Caption = "Enter the Translation for " & getinstance.Name & " :"
    queryinstance.Close
    getinstance.sys_Close
    
    'manage button
    cmdCreate.Enabled = False
    cmdNext.Enabled = True
    cmdUpdate.Enabled = True
    cmdNew.Enabled = True
    
    'manage menu
    
End Sub

Private Sub ClearfrmDomain()

    txtDomain.Text = ""
    txtRootFrame.Text = ""
    txtTRootFrame.Text = ""
    txtGoals.Text = ""
    txtTGoals.Text = ""
    cboTypeGoals.Text = ""
    lblTRootFrame.Caption = "Enter the Translation for :"
    lblGoals.Caption = "Enter the Goals for the frame :"
    lblTGoals.Caption = "Enter the Translation for :"
    lblTypeGoals.Caption = "Enter the Type of the parameter :"

End Sub

Private Sub mnuIFacts_Click()
        
    formDevelop.Visible = False
    formDatabase.Visible = True

End Sub

Private Sub txtDomain_LostFocus()

    txtDomain.Text = Replace(txtDomain.Text, " ", "", 1, -1, vbTextCompare)
    
End Sub

Private Sub txtRootFrame_LostFocus()
        
    If txtRootFrame.Text <> "" Then
    txtRootFrame.Text = UCase$(txtRootFrame.Text)
    lblTRootFrame.Caption = "Enter the Translation for " & txtRootFrame.Text & " :"
    lblGoals.Caption = "Enter the Goals for the frame " & txtRootFrame.Text & " :"
    End If

End Sub

Private Sub txtGoals_LostFocus()

    If txtGoals.Text <> "" Then
    txtGoals.Text = UCase$(txtGoals.Text)
    lblTGoals.Caption = "Enter the Translation for " & txtGoals.Text & " :"
    lblTypeGoals.Caption = "Enter the Type of the parameter " & txtGoals.Text & " :"
    End If

End Sub
'*************************************************** Domain ***************************************************

'*************************************************** Frame ***************************************************
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

Private Sub FrameProcess(tagFrame)

    'check input
    'operation
    'clear screen
    'load frame list
    
    'check input
    txtComplete = False
    If txtDFName = "" Then
        lblDFName.ForeColor = &HFF&
        txtComplete = True
    Else
        lblDFName.ForeColor = &H80000012
    End If
    If txtDFTranslation = "" Then
        lblDFTranslation.ForeColor = &HFF&
        txtComplete = True
    Else
        lblDFTranslation.ForeColor = &H80000012
    End If
    'If txtDFGoals = "" Then
        'lblDFGoals.ForeColor = &HFF&
        'txtComplete = True
    'Else
        'lblDFGoals.ForeColor = &H80000012
    'End If
    'If cboDFTypeGoals = "" Then
        'lblDFTypeGoals.ForeColor = &HFF&
        'txtComplete = True
    'Else
        'lblDFTypeGoals.ForeColor = &H80000012
    'End If
    
    If txtComplete = True Then
        MsgBox "Please Check Input"
    Else
        Screen.MousePointer = vbHourglass
        'operation
        'save instance to CDomain
        'and add goals to parameters
        ' 1 new & openid CDomain check tagFrame
        ' 2 new TCGoals,TCParameters
        ' 3 add to CDomain
        
        '1.new & openid CDomain class
        'True New
        'False Update
        
        'check old goals
        Dim OldGoals As String
        
        If tagFrame Then 'new don't mind
        Else
            Set getinstance = cache.OpenId(CDomain, IDFrame)
            If getinstance.Goals.GetAt(1).Name = "" Then
                OldGoals = ""
            Else
                OldGoals = getinstance.Goals.GetAt(1).Name
            End If
            getinstance.sys_Close
        End If
        
        If tagFrame Then
            Set mainclass = cache.New(CDomain)
        Else
            Set mainclass = cache.OpenId(CDomain, IDFrame)
        End If
        If mainclass Is Nothing Then
            MsgBox "Error"
        Else
            '2 new TCGoals,TCParameters
            '2.1 new TCGoals
            Set embedclass1 = cache.New(TCGoals)
            embedclass1.Name = txtDFGoals.Text
            embedclass1.GoalsTranslation = txtDFTGoals.Text
            embedclass1.Type = cboDFTypeGoals.Text
            '2.2 new tcparameters
            Set embedclass2 = cache.New(TCParameters)
            embedclass2.Name = txtDFGoals.Text
            embedclass2.ParametersTranslation = txtDFTGoals.Text
            embedclass2.Prompt = ""
            embedclass2.Type = cboDFTypeGoals.Text
            embedclass2.Expect = ""
            embedclass2.Values = ""
            embedclass2.Default = ""
            'save
            '3. add to CDomain
                'tagFrame true mean new
                'tagframe false mean update only setat
            If tagFrame Then 'new
                If txtDFGoals.Text <> "" Then 'mean new and have goal
                    tmp1 = mainclass.Goals.InsertAt(embedclass1, 1)
                    tmp2 = mainclass.Parameters.InsertAt(embedclass2, 1)
                Else 'new and don't have goals
                    tmp1 = mainclass.Goals.InsertAt(embedclass1, 1)
                End If
            Else 'update
                If OldGoals = "" Then
                    'update and old don't have goals
                    If txtDFGoals.Text = "" Then
                        'update don't have don't do anything
                    Else
                        'new have
                        tmp1 = mainclass.Goals.SetAt(embedclass1, 1)
                        tmp2 = mainclass.Parameters.InsertAt(embedclass2, 1)
                    End If
                Else
                    'old have goals
                    If txtDFGoals.Text = "" Then
                        'new don't have
                        tmp1 = mainclass.Goals.SetAt(embedclass1, 1)
                        tmp2 = mainclass.Parameters.RemoveAt(1)
                    Else
                        'new have
                        tmp1 = mainclass.Goals.SetAt(embedclass1, 1)
                        tmp2 = mainclass.Parameters.SetAt(embedclass2, 1)
                    End If
                End If
            End If
            mainclass.Name = txtDFName.Text
            mainclass.FrameTranslation = txtDFTranslation.Text
            mainclass.Rules = ""
            mainclass.Source = cboDFSource.Text
            mainclass.Destination = cboDFDestination.Text
            mainclass.sys_Save
            embedclass1.sys_Close
            embedclass2.sys_Close
            mainclass.sys_Close
        End If
        
        Screen.MousePointer = vbDefault
    End If
        
    'clear screen
    Call ClearfrmFrameList
        
    'load frame list
    Call LoadFrameList(lstFrameList)
    
End Sub

Private Sub cmdDFCreate_Click()
    
    'map variables
    'call frameprocess
    'manage button
    'manage menu
    
    'map variables
    IDFrame = IDFrame + 1
    tagFrame = True
    
    'call frameprocess
    Call FrameProcess(tagFrame)
        
    'manage button
    cmdDFCreate.Enabled = False
    cmdDFCancel2.Visible = False
    cmdDFNext.Enabled = False
    cmdDFUpdate.Enabled = False
    cmdDFNew.Enabled = True
        
    'manage menu
    
End Sub

Private Sub cmdDFNew_Click()
    
    'clear screen
    'load frame list
    'manage button
    'manage menu
    
    'clear screen
    Call ClearfrmFrameList
    
    'load frame list
    Call LoadFrameList(lstFrameList)
    IDFrame = frameindex
        
    'manage button
    cmdDFNext.Enabled = False
    cmdDFUpdate.Enabled = False
    cmdDFNew.Enabled = False
    cmdDFCreate.Enabled = True
    cmdDFCancel2.Visible = True
    
    'manage menu
    
End Sub

Private Sub cmdDFUpdate_Click()
    
    'map var
    'call frame process
    'manage button
    'manage menu
    
    'map var
    tagFrame = False
    
    'call frame process
    Call FrameProcess(tagFrame)
        
    'manage button
    cmdDFUpdate.Enabled = False
    cmdDFNext.Enabled = False
    cmdDFCreate.Enabled = False
        
    'manage menu
    
End Sub

Private Sub cmdDFCancel_Click()
    
    'clear screen
    'manage frame
    'manage menu
    
    'clear screen
    Call ClearfrmFrameList
    
    'manage frame
    frmFrameList.Visible = False
    frmKB.Visible = True
    
    'manage menu
    mnuExit.Enabled = True
    mnuKBFrame.Enabled = False
    mnuKBDomain.Enabled = True
    
End Sub

Private Sub cmdDFCancel2_Click()
    
    'clear screen
    'remove frame from combo
    'manage button
    
    'clear screen
    Call ClearfrmFrameList
    
    'manage button
    cmdDFCancel2.Visible = False
    cmdDFNew.Enabled = True
    cmdDFCreate.Enabled = False

End Sub

Private Sub cmdDFNext_Click()
    
    'manage var to next frame
    'manage frame
    'change option.caption
    'manage menu
    
    'manage var to next frame
    IDCparameters = 1
    
    'manage frame
    frmFrameList.Visible = False
    frmCharacteristics.Visible = True
    
    'change option.caption
    optParams.Caption = InstanceFrame & "-PARAMETERS"
    optRules.Caption = InstanceFrame & "-RULES"
    
    'manage menu
    mnuKBFrame.Enabled = False

End Sub

Private Sub lstFrameList_Click()

    'map var
    'get variables from cache
    'map var to vb
    'manage button
    'manage menu
    
    Call LoadFrameList(cboDFSource)
    'map var
    IDFrame = lstFrameList.ListIndex + 1
    InstanceFrame = lstFrameList.Text
    
    'get variables from cache
    Set getinstance = cache.OpenId(CDomain, IDFrame)
    
    'map var to vb
    txtDFName.Text = getinstance.Name
    txtDFTranslation.Text = getinstance.FrameTranslation
    cboDFSource.Text = getinstance.Source
    cboDFDestination.Text = getinstance.Destination
    lblDFTranslation.Caption = "Enter the Translation for " & getinstance.Name & " :"
    
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    tmp = 0
    tmp1 = 0
    While queryinstance.Next
        tmp1 = tmp1 + 1
        If tmp1 = IDFrame Then
            If queryinstance.GetData(4) <> "" Then
                tmp = tmp + 1
            End If
        End If
    Wend
    If tmp = 0 Then
        txtDFGoals.Text = ""
        txtDFTGoals.Text = ""
        cboDFTypeGoals.Text = ""
        lblDFGoals.Caption = "Enter the Goals for the frame :"
        lblDFTGoals.Caption = "Enter the Translation for : "
        lblDFTypeGoals.Caption = "Enter the Type of the parameter : "
    Else
        txtDFGoals.Text = getinstance.Goals.GetAt(1).Name
        txtDFTGoals.Text = getinstance.Goals.GetAt(1).GoalsTranslation
        cboDFTypeGoals.Text = getinstance.Goals.GetAt(1).Type
        lblDFGoals.Caption = "Enter the Goals for the frame " & getinstance.Name & " :"
        lblDFTGoals.Caption = "Enter the Translation for " & getinstance.Goals.GetAt(1).Name & " :"
        lblDFTypeGoals.Caption = "Enter the Type of the parameter " & getinstance.Goals.GetAt(1).Name & " :"
    End If
    queryinstance.Close
    getinstance.sys_Close
    If IDFrame = 1 Then
        cboDFSource.Enabled = False
        cboDFDestination.Enabled = False
    Else
        cboDFSource.Enabled = True
        cboDFDestination.Enabled = True
    End If
    'manage button
    cmdDFCreate.Enabled = False
    cmdDFUpdate.Enabled = True
    cmdDFNext.Enabled = True
    
    'manage menu
    
End Sub

Private Sub LoadDestinationCombo(selectcombo As Object)

    Set pers = cache.Static(TCDomain)
    displays = pers.DestinationDisplay
    delimd = Left(displays, 1)
    types = Split(displays, delimd)
    selectcombo.Clear
    For i = 1 To UBound(types)
        selectcombo.AddItem types(i)
    Next i
    
End Sub

Private Sub ClearfrmFrameList()

    txtDFName.Text = ""
    txtDFTranslation.Text = ""
    txtDFGoals.Text = ""
    txtDFTGoals.Text = ""
    cboDFTypeGoals.Text = ""
    cboDFSource.Text = ""
    cboDFSource.Clear
    cboDFDestination.Text = ""
    lblDFTranslation.Caption = "Enter the Translation for :"
    lblDFGoals.Caption = "Enter the Goals for the frame :"
    lblDFTGoals.Caption = "Enter the Translation for :"
    lblDFTypeGoals.Caption = "Enter the Type of the parameter :"
    cboDFSource.Enabled = True
    cboDFDestination.Enabled = True

End Sub

Private Sub txtDFName_LostFocus()

    If txtDFName.Text <> "" Then
        txtDFName.Text = UCase$(txtDFName.Text)
        lblDFTranslation.Caption = "Enter the Translation for " & txtDFName.Text & " :"
        lblDFGoals.Caption = "Enter the Goals for the frame " & txtDFName.Text & " :"
    End If
    Call LoadFrameList(cboDFSource)
    cboDFSource.AddItem txtDFName.Text, frameindex
    
End Sub

Private Sub txtDFGoals_LostFocus()

    If txtDFGoals.Text <> "" Then
        txtDFGoals.Text = UCase$(txtDFGoals.Text)
        lblDFTGoals.Caption = "Enter the Translation for " & txtDFGoals.Text & " :"
        lblDFTypeGoals.Caption = "Enter the Type of the parameter " & txtDFGoals.Text & " :"
    End If

End Sub
'*************************************************** Frame ***************************************************

'*************************************** Frame Characteristics *********************************************
Private Sub cmdFOK_Click()

    If optProperties = True Then
        frmDetails.Visible = True
        Call LoadTreeView(CDomain)
    ElseIf optParams = True Then
                Call AddParameters
    ElseIf optRules = True Then
                Call AddRules
    ElseIf optMetaRules = True Then

    ElseIf optVariables = True Then

    ElseIf optFunctions = True Then

    ElseIf optTextags = True Then

    Else: MsgBox "Select One"
    End If

End Sub

Private Sub cmdFCancel_Click()
    
    'manage frame
    'manage menu
    
    'manage frame
    frmCharacteristics.Visible = False
    frmFrameList.Visible = True
    
    'manage menu
    mnuKBFrame.Enabled = True
    
End Sub
'*************************************** Frame Characteristics *********************************************

'*********************************************** Parameters *************************************************
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

Private Sub AddParameters()
    
    'manage frame
    'load parameters list
    'load combo
    'manage button
    
    'manage frame
    frmCharacteristics.Visible = False
    frmParm.Visible = True
    
    'load parameters list
    Call LoadParametersList(lstParms)
    
    'load combo
    Call LoadTypeCombo
    Call LoadExpectCombo
    
    'manage button
    cmdDParm.Enabled = False
    cmdUParm.Enabled = False
    cmdAParm.Enabled = False
    cmdNParm.Enabled = True
    cmdCParm.Visible = False
    If parmsindex = 0 Then
        cmdAParm.Enabled = True
        cmdNParm.Enabled = False
        cmdCParm.Visible = True
    End If
    
End Sub

Private Sub ParameterProcess(tagParameter)

    'check input
    'operation
    'clear screen
    'load paramter list
    
    'check input
    txtComplete = False
    If txtParm.Text = "" Then
        lblParm.ForeColor = &HFF&
        txtComplete = True
    Else
        lblParm.ForeColor = &H80000012
    End If
    If txtTParm.Text = "" Then
        lblTParm.ForeColor = &HFF&
        txtComplete = True
    Else
        lblTParm.ForeColor = &H80000012
    End If
    If txtPromptParm.Text = "" Then
        lblPromptParm.ForeColor = &HFF&
        txtComplete = True
    Else
        lblPromptParm.ForeColor = &H80000012
    End If
    If cboTypeParm.Text = "" Then
        lblTypeParm.ForeColor = &HFF&
        txtComplete = True
    Else
        lblTypeParm.ForeColor = &H80000012
    End If
    'If cboExpectParm.Text = "" Then
        'lblExpectParm.ForeColor = &HFF&
        'txtComplete = True
    'Else
        'lblExpectParm.ForeColor = &H80000012
    'End If

    If txtComplete = True Then
        MsgBox "Please Check Input"
    Else
        Screen.MousePointer = vbHourglass
        'cut space in values
        i = 1
        txtValuesParm.Text = Trim(txtValuesParm.Text)
        j = InStr(i, txtValuesParm.Text, "  ", vbTextCompare)
        While j <> 0
            txtValuesParm.Text = Replace(txtValuesParm.Text, "  ", " ", 1, -1, vbTextCompare)
            j = InStr(i, txtValuesParm.Text, "  ", vbTextCompare)
        Wend
        'operation
        '1.openid CDomain
        '2. new TCParameters
        '3. insert &SetAt to CDomain check tagParameter
        
        '1 openid CDomain
        'True New Insert
        'False Update SetAt
        Set mainclass = cache.OpenId(CDomain, IDFrame)
        If mainclass Is Nothing Then
            MsgBox "Error"
        Else
            '2. new TCParameters
            Set embedclass1 = cache.New(TCParameters)
            embedclass1.Name = txtParm.Text
            embedclass1.ParametersTranslation = txtTParm.Text
            embedclass1.Prompt = txtPromptParm.Text
            embedclass1.Type = cboTypeParm.Text
            embedclass1.Expect = cboExpectParm.Text
            embedclass1.Default = UCase$(txtDefaultParm.Text)
            embedclass1.Values = UCase$(txtValuesParm.Text)
            '3. insert &SetAt to CDomain check tagParameter
            If tagParameter Then
                tmp = mainclass.Parameters.Insert(embedclass1)
            Else
                tmp = mainclass.Parameters.SetAt(embedclass1, IDCparameters)
            End If
            mainclass.sys_Save
            embedclass1.sys_Close
            mainclass.sys_Close
        End If
        
        Screen.MousePointer = vbDefault
    End If
    
    'clear screen
    Call ClearfrmParm
    
    'load parameters list
    Call LoadParametersList(lstParms)
    
End Sub

Private Sub cmdNParm_Click()
        
    'clear screen
    'load parameters list
    'manage button
    
    'clear screen
    Call ClearfrmParm
    
    'load parameters list
    Call LoadParametersList(lstParms)
    IDCparameters = parmsindex
    
    'manage button
    cmdAParm.Enabled = True
    cmdUParm.Enabled = False
    cmdDParm.Enabled = False
    cmdNParm.Enabled = False
    cmdCParm.Visible = True
    txtParm.SetFocus
    
End Sub

Private Sub cmdAParm_Click()

    'map variables
    'call parameter process
    'manage button
    
    'map variables
    IDCparameters = IDCparameters + 1
    tagParameter = True
    
    'call domainprocess
    Call ParameterProcess(tagParameter)
    
    'manage button
    cmdDParm.Enabled = False
    cmdUParm.Enabled = False
    cmdAParm.Enabled = False
    cmdNParm.Enabled = True
    cmdCParm.Visible = False
    
    'manage menu
    
End Sub

Private Sub cmdDParm_Click()
    
    'delete instance in cache
    'clear screen
    'load parameter list
    'manage button
    
    'delete instance in cache
    If IDCparameters = 1 Then
        MsgBox "Don't Do it"
    Else
        oid = IDCparameters
        Set getinstance = cache.OpenId(CDomain, IDFrame)
        If getinstance Is Nothing Then
            MsgBox "Error"
        Else
            getinstance.Parameters.RemoveAt (oid)
            getinstance.sys_Save
            getinstance.sys_Close
        End If
    End If
    
    'clear screen
    Call ClearfrmParm
    
    'load parameter list
    Call LoadParametersList(lstParms)
    
    'manage button
    cmdAParm.Enabled = False
    cmdDParm.Enabled = False
    cmdUParm.Enabled = False
    cmdNParm.Enabled = True
    
End Sub

Private Sub cmdUParm_Click()

    'manage variables
    'call parameterprocess
    'manage button
    
    'manage variables
    tagDomain = False
    
    'call parameterprocess
    Call ParameterProcess(tagDomain)
    
    'manage button
    cmdAParm.Enabled = False
    cmdDParm.Enabled = False
    cmdUParm.Enabled = False
    cmdNParm.Enabled = True
    
End Sub

Private Sub cmdCParm_Click()
    
    'clear screen
    'manage button
    
    'clear screen
    Call ClearfrmParm
    
    'manage button
    cmdAParm.Enabled = False
    cmdNParm.Enabled = True
    cmdCParm.Visible = False
    
End Sub

Private Sub cmdQParm_Click()
    
    'clear screen
    'manage frame
    
    'clear screen
    Call ClearfrmParm
    
    'manage frame
    frmParm.Visible = False
    frmCharacteristics.Visible = True
    
End Sub

Private Sub lstParms_Click()
    
    'map var
    'get var from cache
    'map var to vb
    'manage button

    'map var
    IDCparameters = lstParms.ListIndex + 1
    oid = IDCparameters
    
    'get var from cache
    Set getinstance = cache.OpenId(CDomain, IDFrame)
    If getinstance Is Nothing Then
        MsgBox "Error"
    End If
    txtParm.Text = getinstance.Parameters.GetAt(oid).Name
    txtTParm.Text = getinstance.Parameters.GetAt(oid).ParametersTranslation
    txtPromptParm.Text = getinstance.Parameters.GetAt(oid).Prompt
    txtDefaultParm.Text = getinstance.Parameters.GetAt(oid).Default
    cboTypeParm.Text = getinstance.Parameters.GetAt(oid).Type
    cboExpectParm.Text = getinstance.Parameters.GetAt(oid).Expect
    txtValuesParm.Text = getinstance.Parameters.GetAt(oid).Values
    getinstance.sys_Close
    
    'manage button
    cmdAParm.Enabled = False
    cmdNParm.Enabled = True
    cmdDParm.Enabled = True
    cmdUParm.Enabled = True
    
End Sub

Private Sub ClearfrmParm()

    txtParm.Text = ""
    txtTParm.Text = ""
    txtPromptParm.Text = ""
    cboTypeParm.Text = ""
    cboExpectParm.Text = ""
    txtValuesParm.Text = ""
    txtDefaultParm.Text = ""
    lblTParm.Caption = "Enter the TRANSLATION of :"
    lblPromptParm.Caption = "Enter the Statement for PROMPT :"
    lblTypeParm.Caption = "Enter the TYPE of the parameter :"
    lblExpectParm.Caption = "Select an EXPECT value for the parameter :"
    lblValuesParm.Caption = "Enter the VALUES you expect for the parameter :"

End Sub

Private Sub LoadTypeCombo()
    
    Set pers = cache.Static(TCParameters)
    displays = pers.TypeDisplay
    delimd = Left(displays, 1)
    types = Split(displays, delimd)
    cboTypeParm.Clear
    For i = 1 To UBound(types)
        cboTypeParm.AddItem types(i)
    Next i
    
End Sub

Private Sub LoadExpectCombo()
    
    Set pers = cache.Static(TCParameters)
    displays = pers.ExpectDisplay
    delimd = Left(displays, 1)
    types = Split(displays, delimd)
    cboExpectParm.Clear
    For i = 1 To UBound(types)
        cboExpectParm.AddItem types(i)
    Next i
    
End Sub

Private Sub txtParm_LostFocus()

    If txtParm.Text <> "" Then
        txtParm.Text = UCase$(txtParm.Text)
        lblTParm.Caption = "Enter the TRANSLATION of " & txtParm.Text & " : "
        lblPromptParm.Caption = "Enter the Statement for PROMPT " & txtParm.Text & " : "
        lblTypeParm.Caption = "Enter the TYPE of the parameter " & txtParm.Text & " : "
        lblExpectParm.Caption = "Select an EXPECT value for the parameter " & txtParm.Text & " : "
        lblValuesParm.Caption = "Enter the VALUES you expect for the parameter " & txtParm.Text & " : "
    End If
    
End Sub

Private Sub cboTypeParm_Click()

    If cboTypeParm.Text = "YES/NO" Then
        cboExpectParm.Enabled = False
        txtDefaultParm.Enabled = False
        txtValuesParm.Enabled = False
    ElseIf cboTypeParm.Text = "SINGLEVALUED" Then
        cboExpectParm.Enabled = True
        txtDefaultParm.Enabled = True
        txtValuesParm.Enabled = True
    ElseIf cboTypeParm.Text = "MULTIVALUED" Then
        cboExpectParm.Enabled = False
        txtDefaultParm.Enabled = True
        txtValuesParm.Enabled = True
    ElseIf cboTypeParm.Text = "ASK-ALL" Then
        cboExpectParm.Enabled = True
        txtDefaultParm.Enabled = True
        txtValuesParm.Enabled = True
    End If

End Sub
'*********************************************** Parameters *************************************************

'*************************************************** Rules ****************************************************

Private Sub RestoreRules(tmpID)
    
    Dim tmpParameter() As String
    Dim tmpSplit() As String
    Dim columns As Integer
    Dim columns2 As Integer
    
    Set getinstance = cache.OpenId(CDomain, tmpID)
    columns = getinstance.Parameters.Count
    columns2 = getinstance.Rules.Count
    If columns = 0 Or columns2 = 0 Then
    Else
        
        ReDim tmpParameter(1 To columns) As String
        rulesindex = 0
        For k = 1 To columns
            tmpParameter(k) = getinstance.Parameters.GetAt(k).Name
        Next k
        columns = getinstance.Rules.Count
        ReDim RestoreIf(1 To columns) As String
        ReDim RestoreThen(1 To columns) As String
        
        If getinstance.Goals.GetAt(1).Name = "" Then
            For k = 1 To columns
                RestoreIf(k) = ""
                'if
                tmpSplit = Split(getinstance.Rules.GetAt(k).IfStatement, "/", -1, vbTextCompare)
                For l = 0 To UBound(tmpSplit) - 1
                    If tmpSplit(l) <> "" Then
                        RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l) & " AND "
                    End If
                Next l
                If tmpSplit(l) <> "" Then
                    RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l)
                End If
            Next k
        Else ' have goals
            For k = 1 To columns
                RestoreIf(k) = ""
                RestoreThen(k) = ""
                'if
                tmpSplit = Split(getinstance.Rules.GetAt(k).IfStatement, "/", -1, vbTextCompare)
                For l = 1 To UBound(tmpSplit) - 1
                    If tmpSplit(l) <> "" Then
                        RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l) & " AND "
                    Else
                        RestoreIf(k) = RestoreIf(k)
                    End If
                Next l
                
                If tmpSplit(l) <> "" Then
                    RestoreIf(k) = RestoreIf(k) & tmpParameter(l + 1) & tmpSplit(l)
                Else
                    If Len(RestoreIf(k)) > 5 Then
                        RestoreIf(k) = Left(RestoreIf(k), Len(RestoreIf(k)) - 5)
                    End If
                End If
            Next k
        End If
            For k = 1 To columns
                'then
                tmpSplit = Split(getinstance.Rules.GetAt(k).ThenStatement, "/", -1, vbTextCompare)
                If tmpSplit(1) = "" Then
                    RestoreThen(k) = tmpParameter(1) & "= " & tmpSplit(0)
                Else
                    RestoreThen(k) = tmpParameter(1) & "= " & tmpSplit(0) & " AND CONSIDERFRAME " & tmpSplit(1)
                End If
            Next k
    End If
    getinstance.sys_Close
    
End Sub

Private Sub LoadlvwRules()
    
    Set getinstance = cache.OpenId(CDomain, IDFrame)
    If getinstance.Rules.Count <> 0 Then
        Call RestoreRules(IDFrame)
        lvwRules.ListItems.Clear
        columns = getinstance.Rules.Count
        For i = 1 To columns
            Set rulesitem = lvwRules.ListItems.Add()
            rulesitem.Text = i
            rulesitem.SubItems(1) = RestoreIf(i)
            rulesitem.SubItems(2) = RestoreThen(i)
            rulesindex = rulesindex + 1
        Next i
    Else
        lvwRules.ListItems.Clear
    End If
    getinstance.sys_Close
    
End Sub

Private Sub AddRules()
    
    'manage frame
    'clear screen
    'load rules listview
    'manage button

    'manage frame
    frmCharacteristics.Visible = False
    frmRule.Visible = True
    
    'clearscreen
    Call ClearfrmRule
    
    'load rules list
    Call LoadlvwRules
    
    'manage button
    cmdDRule.Enabled = False
    cmdURule.Enabled = False
    cmdARule.Enabled = False
    cmdCRule.Visible = False
    cmdNRule.Enabled = True
    
    If rulesindex = 0 Then
        cmdNRule.Enabled = False
        cmdARule.Enabled = True
        cmdCRule.Visible = True
    End If
    
End Sub

Private Sub RuleProcess(tagRule)

    'check input
    'operation
    'clear screen
    'load rule list
        
    'check input
    txtComplete = False
    If txtIfRule.Text = "" Then
        lblIfRule.ForeColor = &HFF&
        txtComplete = True
    Else
        lblIfRule.ForeColor = &H80000012
    End If
    If txtIfRule.Text = "" Then
        lblIfRule.ForeColor = &HFF&
        txtComplete = True
    Else
        lblIfRule.ForeColor = &H80000012
    End If
    
    If txtComplete = True Then
        MsgBox "Please Check Input"
    Else
        Screen.MousePointer = vbHourglass
        'operation
        'cut space
        '1.openid CDomain
        '2. new TCParameters
        '3. insert & add to CDomain check tagParameter
        

        'pattern
        'parameter advice,asa,light
        'ex if asa = 100 and light = bright
        'change if to (,100,bright,)
        'and operation to (,and,)
        'in cache (,100,bright,)-(,and,)

        IfString = txtIfRule.Text
        ThenString = txtThenRule.Text
        
        Call ManageRule(IfString, ThenString)
        
        txtIfRule.Text = IfString
        txtThenRule.Text = ThenString
    
        '1. openid domain
        Set mainclass = cache.OpenId(CDomain, IDFrame)
        If mainclass Is Nothing Then
            MsgBox "Error"
        Else
            '2. new TCRules
            Set embedclass1 = cache.New(TCRules)
            embedclass1.FramePointer = "None"
            embedclass1.IfStatement = txtIfRule.Text
            embedclass1.ThenStatement = txtThenRule.Text
            '3.insert &SetAt to CDomain check tagParameter
            If tagRule Then
                tmp = mainclass.Rules.Insert(embedclass1)
            Else
                tmp = mainclass.Rules.SetAt(embedclass1, IDCRules)
            End If
            mainclass.sys_Save
            embedclass1.sys_Close
            mainclass.sys_Close
        End If
        
        Screen.MousePointer = vbDefault
    End If
    
    'clear screen
    Call ClearfrmRule
    
    'load rule list
    Call LoadlvwRules

End Sub

Private Sub ManageRule(ByRef IfString, ByRef ThenString)
    
    Dim tmpName, tmpValue, tmpOpr As String
    Dim tmpstring1() As String
    Dim tmpstring2() As String
    Dim tmpParameter() As String
    Dim tmpIfValue() As String
    Dim tmpThenValue(1 To 2) As String
    
    'load all parameters to array
    Set getinstance = cache.OpenId(CDomain, IDFrame)
    columns = getinstance.Parameters.Count
    
    ReDim tmpParameter(1 To columns) As String
    ReDim tmpIfValue(1 To columns) As String
    
    For i = 1 To columns
        tmpParameter(i) = getinstance.Parameters.GetAt(i).Name
    Next i
    getinstance.sys_Close
    
    'manage if
    'cut space
    i = 1
    IfString = Trim(IfString)
    j = InStr(i, IfString, "  ", vbTextCompare)
    While j <> 0
        IfString = Replace(IfString, "  ", " ", 1, -1, vbTextCompare)
        j = InStr(i, IfString, "  ", vbTextCompare)
    Wend
    'find "and"  and split
    tmpstring1 = Split(IfString, " and ", -1, vbTextCompare)
    
    For i = 0 To UBound(tmpstring1)
        tmpstring1(i) = Trim(tmpstring1(i))
        tmpstring1(i) = Replace(tmpstring1(i), " ", "", 1, -1, vbTextCompare)
        
        If InStr(1, tmpstring1(i), "=", vbTextCompare) <> 0 Then
            j = InStr(1, tmpstring1(i), "=", vbTextCompare)
        ElseIf InStr(1, tmpstring1(i), ">", vbTextCompare) <> 0 Then
            j = InStr(1, tmpstring1(i), ">", vbTextCompare)
        ElseIf InStr(1, tmpstring1(i), "<", vbTextCompare) <> 0 Then
            j = InStr(1, tmpstring1(i), "<", vbTextCompare)
        ElseIf InStr(1, tmpstring1(i), ">=", vbTextCompare) <> 0 Then
            j = InStr(1, tmpstring1(i), ">=", vbTextCompare)
        ElseIf InStr(1, tmpstring1(i), "<=", vbTextCompare) <> 0 Then
            j = InStr(1, tmpstring1(i), "<=", vbTextCompare)
        ElseIf InStr(1, tmpstring1(i), "<>", vbTextCompare) <> 0 Then
            j = InStr(1, tmpstring1(i), "<>", vbTextCompare)
        End If
        tmpValue = UCase$(Mid(tmpstring1(i), j))
        tmp = UCase$(Left(tmpstring1(i), j - 1))
        For j = 1 To columns
            If tmp = tmpParameter(j) Then
                If tmpIfValue(j) <> "" Then
                    tmpIfValue(j) = tmpIfValue(j) & "," & tmpValue
                Else
                    tmpIfValue(j) = tmpValue
                End If
            End If
        Next j
    Next i
    
    'manage then
    'cut space
    i = 1
    ThenString = Trim(ThenString)
    j = InStr(i, ThenString, "  ", vbTextCompare)
    While j <> 0
        ThenString = Replace(ThenString, "  ", " ", 1, -1, vbTextCompare)
        j = InStr(i, ThenString, "  ", vbTextCompare)
    Wend
        ThenString = Replace(ThenString, " = ", "=", 1, -1, vbTextCompare)
        ThenString = Replace(ThenString, " =", "=", 1, -1, vbTextCompare)
        ThenString = Replace(ThenString, "= ", "=", 1, -1, vbTextCompare)
    'find "considerframe" and split
    If InStr(1, ThenString, "considerframe ", vbTextCompare) <> 0 Then
        tmp = Mid(ThenString, InStr(1, ThenString, "considerframe ", vbTextCompare))
        tmp = Trim(Replace(tmp, "considerframe ", "", 1, -1, vbTextCompare))
        tmpThenValue(2) = UCase$(tmp)
        tmpThenValue(1) = Trim(Left(ThenString, InStr(1, ThenString, "and considerframe", vbTextCompare) - 1))
        tmpThenValue(1) = Mid(tmpThenValue(1), (InStr(1, tmpThenValue(1), "=", vbTextCompare) + 1))
    Else
        tmpThenValue(2) = ""
        tmpThenValue(1) = Mid(ThenString, InStr(1, ThenString, "=", vbTextCompare) + 1)
    End If
    'map to ifstring and thenstring
    IfString = ""
    For i = 1 To columns - 1
        IfString = IfString & tmpIfValue(i) & "/"
    Next i
    IfString = IfString & tmpIfValue(columns)
    
    ThenString = tmpThenValue(1) & "/" & tmpThenValue(2)
    
End Sub

Private Sub cmdARule_Click()
    
    'map var
    'call ruleprocess
    'manage button
        
    'map var
    IDCRules = IDCRules + 1
    tagRule = True
    
    'call ruleprocess
    Call RuleProcess(tagRule)
    
    'manage button
    cmdARule.Enabled = False
    cmdDRule.Enabled = False
    cmdURule.Enabled = False
    cmdNRule.Enabled = True
    cmdCRule.Visible = False

End Sub

Private Sub cmdNRule_Click()

    'clear screen
    'load rule list
    'manage button
    
    'clear screen
    Call ClearfrmRule
    
    'load rule list
    Call LoadlvwRules
    IDCRules = rulesindex
        
    'manage button
    cmdDRule.Enabled = False
    cmdURule.Enabled = False
    cmdARule.Enabled = True
    cmdNRule.Enabled = False
    cmdCRule.Visible = True
    
End Sub

Private Sub cmdDRule_Click()
    
    'delete instance in cache
    'load rule list
    'manage button
    
    'delete instance in cache
    oid = IDCRules
    Set getinstance = cache.OpenId(CDomain, IDFrame)
    If getinstance Is Nothing Then
        MsgBox "Error"
    Else
        getinstance.Rules.RemoveAt (oid)
        getinstance.sys_Save
        getinstance.sys_Close
    End If
    
    'load rule list
    Call LoadlvwRules
    
    'manage button
    cmdARule.Enabled = False
    cmdDRule.Enabled = False
    cmdURule.Enabled = False
    cmdNRule.Enabled = True
    
End Sub

Private Sub cmdURule_Click()
    
    'map var
    'call rule process
    'manage button
    'check input
    
    'map var
    tagRule = False
    
    'call rule process
    Call RuleProcess(tagRule)
    
    'manage button
    cmdARule.Enabled = False
    cmdDRule.Enabled = False
    cmdNRule.Enabled = True
    
End Sub

Private Sub cmdCRule_Click()

    'clear screen
    'manage button
    
    'clear screen
    Call ClearfrmRule
    
    'manage button
    cmdNRule.Enabled = True
    cmdARule.Enabled = False
    cmdCRule.Visible = False
    
End Sub

Private Sub cmdQRule_Click()

    'manage frame
    
    'manage frame
    frmRule.Visible = False
    frmCharacteristics.Visible = True
    
End Sub

Private Sub lvwRules_ItemClick(ByVal item As MSComctlLib.ListItem)
    
    'map var
    'map var to vb
    'manage button

    'map var
    IDCRules = lvwRules.SelectedItem
    oid = IDCRules
    
    'map var to vb
    txtIfRule.Text = RestoreIf(IDCRules)
    txtThenRule.Text = RestoreThen(IDCRules)
    
    'manage button
    cmdARule.Enabled = False
    cmdNRule.Enabled = True
    cmdDRule.Enabled = True
    cmdURule.Enabled = True
    
End Sub

Private Sub ClearfrmRule()
        
    txtIfRule.Text = ""
    txtThenRule.Text = ""

End Sub
'*************************************************** Rules ****************************************************

Private Sub LoadTreeView(tmp)
    
    Dim tmpFrame As String
    Dim tmpFrameRoot As String
    Dim tmpFrameNow As String
    Dim tmpFrameSource As String
    Dim tmpProperty As String
    Dim tmpGoals As String
    Dim tmpParms As String
    Dim tmpSlots As String
    Dim tmpRules As String
    Dim tmpIfThenRules As String
    Dim tmpName As String
    Dim tagAdd As Boolean
    'map var
    'clear tvw
    'get instance from cache before
    'manage button
    'how to work
    
    'map var
    CDomain = tmp
    tagAdd = False
    
    'clear tvw
    tvwFrame.Nodes.Clear
    
    'get instance from cache before
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    frameindex = 0
    While queryinstance.Next
        frameindex = frameindex + 1
    Wend
    queryinstance.Close
    
    For i = IDFrame To frameindex
        tmpID = i
        Set getinstance = cache.OpenId(CDomain, i)
        Call RestoreRules(tmpID)
        parmsindex = getinstance.Parameters.Count
        rulesindex = getinstance.Rules.Count
        
        tmpFrame = "Frame : " & getinstance.Name
        tmpProperty = getinstance.Name & " Property : "
        tmpRules = getinstance.Name & " Rules : "
        If getinstance.Destination = "Own" Then
            'check
            If i = 1 Then
                Set addnode = tvwFrame.Nodes.Add(, , tmpFrame, tmpFrame)
                tmpFrameRoot = tmpFrame
                tmpFrameNow = tmpFrame
            Else
                If i = IDFrame Then
                    Set addnode = tvwFrame.Nodes.Add(, , tmpFrame, tmpFrame)
                    tmpFrameRoot = tmpFrame
                    tmpFrameNow = tmpFrame
                Else
                    Set addnode = tvwFrame.Nodes.Add(tmpFrameRoot, tvwNext, tmpFrame, tmpFrame)
                End If
                
            End If
        Else 'mean member
            'check
            If i = IDFrame Then
                Set addnode = tvwFrame.Nodes.Add(, , tmpFrame, tmpFrame)
                tmpFrameRoot = tmpFrame
                tmpFrameNow = tmpFrame
            Else
                tmpFrameSource = "Frame : " & getinstance.Source
                If tmpFrameSource = tmpFrameNow Then 'source = now
                    tmpFrame = tmpFrame
                    Set addnode = tvwFrame.Nodes.Add(tmpFrameNow, tvwChild, tmpFrame, tmpFrame)
                    tmpFrameNow = tmpFrameSource
                Else ' check source = root ? source <> now
                        If tmpFrameSource <> "" Then
                            'try to add add source
                            On Error GoTo AddAgain
                            tagAdd = True
                            Set addnode = tvwFrame.Nodes.Add(tmpFrameSource, tvwChild, tmpFrame, tmpFrame)
                            tagAdd = False
ResumeMain:
                            tmpFrameNow = tmpFrameSource
                            End If
                End If
            End If
        End If
        'add property contain goals and rules and parameters
        Set addnode = tvwFrame.Nodes.Add(tmpFrame, tvwChild, tmpProperty, tmpProperty)
        'add goals header and value parameter 1
        On Error GoTo AddAgain2
        Debug.Print getinstance.Goals.GetAt(1).Name
        tagAdd = True
        If getinstance.Goals.GetAt(1).Name <> "" Then
            tmpGoals = getinstance.Name & " Goals : " & getinstance.Goals.GetAt(1).Name
            Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpGoals, tmpGoals)
            tagAdd = False
        Else
ResumeMain2:
            tmpGoals = getinstance.Name & "Goals : (None)"
            Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpGoals, tmpGoals)
            tagAdd = False
        End If
        
        'header parameters
        tmpParms = getinstance.Name & " Parameters : "
        Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpParms, tmpParms)
        'parameters 1
        If getinstance.Goals.GetAt(1).Name <> "" Then
            tmpSlots = "Parameter (Goals) : " & getinstance.Parameters.GetAt(1).Name
            Set addnode = tvwFrame.Nodes.Add(tmpParms, tvwChild, tmpSlots, tmpSlots)
        Else
            tmpSlots = "Parameter : " & getinstance.Parameters.GetAt(1).Name
            Set addnode = tvwFrame.Nodes.Add(tmpParms, tvwChild, tmpSlots, tmpSlots)
        End If
        'add parameters 2 to all
        For j = 2 To parmsindex
            tmpSlots = getinstance.Name & " Parameter : " & getinstance.Parameters.GetAt(j).Name
            Set addnode = tvwFrame.Nodes.Add(tmpParms, tvwChild, tmpSlots, tmpSlots)
        Next j
        
        'header rules
        Set addnode = tvwFrame.Nodes.Add(tmpProperty, tvwChild, tmpRules, tmpRules)
        For j = 1 To rulesindex
            tmpSlots = j & ". Pointer : " & getinstance.Rules.GetAt(j).FramePointer & ", If : " & RestoreIf(j) & " , Then : " & RestoreThen(j)
            Set addnode = tvwFrame.Nodes.Add(tmpRules, tvwChild, tmpSlots, tmpSlots)
        Next j
    Next i
AddAgain:
    If tagAdd Then
        Set addnode = tvwFrame.Nodes.Add(tmpFrameNow, tvwNext, tmpFrame, tmpFrame)
        tmpFrameNow = tmpFrameSource
        tagAdd = False
    Resume ResumeMain
    End If
AddAgain2:
    If tagAdd Then
    Resume ResumeMain2
    End If
End Sub

Private Sub cmdDetailsClose_Click()
    
    frmDetails.Visible = False

End Sub
    
Private Sub mnuExit_Click()
    
    formDevelop.Caption = "Knowldege Base"
    
    SqlStatement = "Select * from " & CAllDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    domainindex = 0
    Dim tmpi As Integer
    While queryinstance.Next
        domainindex = domainindex + 1
    Wend
    
    For tmpi = 1 To domainindex
        Set getinstance = cache.OpenId(CAllDomain, tmpi)
        CDomain = getinstance.Name
        getinstance.sys_Close
        Call RelateFrame
    Next tmpi

    Unload formDevelop
End Sub

Private Sub RelateFrame()
    
    Dim tmpIf, tmpThen As String
    Dim tmpPointer As String
    Dim tmpSplit() As String
    
    Dim tmpParameters() As String
    Dim tmpFrames() As String
    Dim tmpRules() As String
    
    Dim allFrame As Integer
    Screen.MousePointer = vbHourglass
    'manage FramePointer in Rules Property
    'get all of frame
    SqlStatement = "Select * from " & CDomain
    Set queryinstance = cache.DynamicSQL(SqlStatement)
    queryinstance.Execute
    frameindex = 0
    While queryinstance.Next
        frameindex = frameindex + 1
    Wend
    queryinstance.Close
    allFrame = frameindex
    
    'get count of Frame to frameindex
    ReDim tmpFrames(1 To frameindex, 1 To 2) As String
    ReDim tmpParameters(1 To frameindex, 1 To 2) As String
    ReDim tmpParameters(1 To frameindex, 1 To 2) As String
    
    For i = 1 To frameindex
        Set getinstance = cache.OpenId(CDomain, i)
        parmsindex = getinstance.Parameters.Count
        tmpFrames(i, 1) = i
        tmpFrames(i, 2) = getinstance.Name
        
        tmpParameters(i, 1) = i
        tmp = " "
        If getinstance.Goals.GetAt(1).Name <> "" Then
            For j = 1 To parmsindex
                tmp = tmp & getinstance.Parameters.GetAt(j).Name & " "
            Next j
        Else
            For j = 2 To parmsindex
                tmp = tmp & getinstance.Parameters.GetAt(j).Name & " "
            Next j
        End If
        tmpParameters(i, 2) = Trim(tmp)
        getinstance.sys_Close
    Next i
    Dim tmpFrmName As String
    For i = 1 To frameindex
        Set getinstance = cache.OpenId(CDomain, i)
        columns = getinstance.Rules.Count
        tmpIf = ""
        tmpThen = ""
        For j = 1 To columns ' loop for rules
            tmpPointer = ""
            tmpThen = getinstance.Rules.GetAt(j).ThenStatement
            tmpSplit = Split(tmpThen, "/", -1, vbTextCompare)
            'after split will have 2 parameters
            '1 is the value of goals
            '2 is the next frame
            If tmpSplit(1) <> "" Then
                For k = 1 To allFrame
                    If InStr(1, tmpFrames(k, 2), tmpSplit(1), vbTextCompare) <> 0 Then
                        'MsgBox "BinGo"
                        tmpPointer = tmpSplit(1) 'name
                    End If
                Next k
                If tmpPointer = "" Then
                    ' not found
                    MsgBox "Not found Consider Frame"
                    tmpPointer = tmpFrames(i, 2)
                End If
            Else
                tmpPointer = tmpFrames(i, 2)
            End If
        Set embedclass1 = cache.New(TCRules)
        embedclass1.FramePointer = tmpPointer
        embedclass1.IfStatement = getinstance.Rules.GetAt(j).IfStatement
        embedclass1.ThenStatement = getinstance.Rules.GetAt(j).ThenStatement
        tmp = getinstance.Rules.SetAt(embedclass1, j)
        embedclass1.sys_Close
        Next j
        getinstance.sys_Save
        getinstance.sys_Close
    Next i
    Screen.MousePointer = vbDefault
    
End Sub

