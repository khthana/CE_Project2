VERSION 5.00
Object = "{8767A745-088E-4CA6-8594-073D6D2DE57A}#9.2#0"; "crviewer9.dll"
Begin VB.Form frmRp 
   ClientHeight    =   7800
   ClientLeft      =   60
   ClientTop       =   180
   ClientWidth     =   9480
   Icon            =   "frmRp.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7800
   ScaleWidth      =   9480
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdParameter 
      Caption         =   "&Variable Setup"
      Height          =   495
      Left            =   1920
      TabIndex        =   2
      Top             =   120
      Width           =   2055
   End
   Begin VB.CommandButton cmdPrinterSetup 
      Caption         =   "&Print Setup"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1695
   End
   Begin CRVIEWER9LibCtl.CRViewer9 CRViewer91 
      Height          =   7005
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   9285
      lastProp        =   500
      _cx             =   16378
      _cy             =   12356
      DisplayGroupTree=   0   'False
      DisplayToolbar  =   -1  'True
      EnableGroupTree =   -1  'True
      EnableNavigationControls=   -1  'True
      EnableStopButton=   -1  'True
      EnablePrintButton=   -1  'True
      EnableZoomControl=   -1  'True
      EnableCloseButton=   -1  'True
      EnableProgressControl=   -1  'True
      EnableSearchControl=   -1  'True
      EnableRefreshButton=   -1  'True
      EnableDrillDown =   -1  'True
      EnableAnimationControl=   -1  'True
      EnableSelectExpertButton=   0   'False
      EnableToolbar   =   -1  'True
      DisplayBorder   =   -1  'True
      DisplayTabs     =   0   'False
      DisplayBackgroundEdge=   -1  'True
      SelectionFormula=   ""
      EnablePopupMenu =   -1  'True
      EnableExportButton=   0   'False
      EnableSearchExpertButton=   0   'False
      EnableHelpButton=   0   'False
      LaunchHTTPHyperlinksInNewBrowser=   -1  'True
   End
End
Attribute VB_Name = "frmRp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public ReportName As String
Public ReportTitle As String
Public CIDflag As Boolean
Dim CRXApplication As New CRAXDRT.Application
Dim CRXReport As CRAXDRT.Report

Private Sub cmdParameter_Click()
    Screen.MousePointer = vbHourglass
    ReQueryData1
    Screen.MousePointer = vbDefault
End Sub

Private Sub cmdPrinterSetup_Click()
    CRXReport.PrinterSetup Me.hWnd
End Sub

Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    Me.Caption = ReportTitle
    ReportFile = App.Path & "\Report\" & ReportName & ".rpt"
    Set CRXReport = CRXApplication.OpenReport(ReportFile, 1)
    ReQueryData1
    Screen.MousePointer = vbDefault
End Sub
Private Sub ReQueryData1()
    Dim varCommand As Variant
    CRXReport.Database.ConvertDatabaseDriver "p2sodbc.dll", True
    
    For Each varCommand In CRXReport.Database.Tables
        varCommand.SetLogOnInfo gblDSN, gblDSN, gblUser, gblPassword
    Next
        
    CRXReport.DiscardSavedData
    
    'ASSIGN PARAMETERS TO REPORT
    If CIDflag = True Then
        Set ParamFD = CRXReport.ParameterFields
    
        ParamValue = CurCmp
        Set ParamField = ParamFD.Item(1)
        ParamField.SetCurrentValue CStr(ParamValue), 12
    End If
    
    CRViewer91.ReportSource = CRXReport
    CRViewer91.ViewReport
End Sub

Private Sub Form_Resize()
    CRViewer91.Left = 0
    CRViewer91.Height = ScaleHeight - Me.cmdPrinterSetup.Height - 220
    CRViewer91.Width = ScaleWidth
End Sub

