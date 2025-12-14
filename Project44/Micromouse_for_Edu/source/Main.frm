VERSION 5.00
Object = "{37AE774D-63A5-11D2-B108-E19FE47C377C}#1.0#0"; "VBUSPL~1.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm MDIMainForm 
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   10478
   ClientLeft      =   767
   ClientTop       =   -1560
   ClientWidth     =   14872
   LinkTopic       =   "MDIForm1"
   MouseIcon       =   "Main.frx":0000
   WindowState     =   2  'Maximized
   Begin VBUSplitterControl2.vbuSplitter2 SimSplitter 
      Align           =   2  'Align Bottom
      CausesValidation=   0   'False
      Height          =   2171
      Left            =   0
      TabIndex        =   0
      Top             =   8307
      Visible         =   0   'False
      Width           =   14872
      _ExtentX        =   26239
      _ExtentY        =   3834
      Style           =   2
      SplitterLeft    =   1418
      Begin VB.PictureBox Picture1 
         Height          =   2020
         Left            =   0
         ScaleHeight     =   1963
         ScaleWidth      =   14183
         TabIndex        =   1
         Top             =   60
         Width           =   14235
         Begin VB.TextBox txtComplie 
            BackColor       =   &H80000003&
            Height          =   2415
            Left            =   0
            MultiLine       =   -1  'True
            TabIndex        =   2
            Top             =   0
            Width           =   15255
         End
      End
   End
   Begin MSComDlg.CommonDialog Dialog1 
      Left            =   0
      Top             =   0
      _ExtentX        =   839
      _ExtentY        =   839
      _Version        =   393216
   End
   Begin VB.Menu MenuFile 
      Caption         =   "&File"
      Begin VB.Menu MenuFileNew 
         Caption         =   "&New"
         Begin VB.Menu MenuFileNewFlowChart 
            Caption         =   "FlowChart"
         End
         Begin VB.Menu MenuFileNewCode 
            Caption         =   "Code"
         End
      End
      Begin VB.Menu MenuFileOpen 
         Caption         =   "&Open"
         Begin VB.Menu MenuFileOpenCode 
            Caption         =   "Code"
         End
      End
      Begin VB.Menu a0 
         Caption         =   "-"
      End
      Begin VB.Menu MenuFileSave 
         Caption         =   "&Save"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFileSaveAs 
         Caption         =   "Save As"
         Enabled         =   0   'False
      End
      Begin VB.Menu a1 
         Caption         =   "-"
      End
      Begin VB.Menu MenuFilePrint 
         Caption         =   "Print"
         Enabled         =   0   'False
      End
      Begin VB.Menu a5 
         Caption         =   "-"
      End
      Begin VB.Menu MenuFileClose 
         Caption         =   "C&lose"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu MenuView 
      Caption         =   "&View"
      Enabled         =   0   'False
      Begin VB.Menu MenuViewCode 
         Caption         =   "Code"
         Enabled         =   0   'False
      End
      Begin VB.Menu a3 
         Caption         =   "-"
      End
      Begin VB.Menu MenuViewMouseSim 
         Caption         =   "Mouse Simulation"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuViewSimPanel 
         Caption         =   "Simulation Panel"
      End
      Begin VB.Menu a4 
         Caption         =   "-"
      End
      Begin VB.Menu MenuStatusBar 
         Caption         =   "Satatus Bar"
      End
      Begin VB.Menu MenuViewToolBar 
         Caption         =   "ToolBar"
      End
   End
   Begin VB.Menu MenuRun 
      Caption         =   "&Run"
      Begin VB.Menu MenuRunDownLoad 
         Caption         =   "Download"
      End
      Begin VB.Menu MenuRunSPI 
         Caption         =   "SPI Download"
      End
      Begin VB.Menu MenuRunCompile 
         Caption         =   "Compile"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuWindow 
      Caption         =   "&Window"
      Enabled         =   0   'False
      Begin VB.Menu MenuWindowTileVer 
         Caption         =   "Tile Vertically"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuWindowTileHor 
         Caption         =   "Tile Horizontally"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuWindowCascade 
         Caption         =   "Cascade"
         Enabled         =   0   'False
      End
      Begin VB.Menu a2 
         Caption         =   "-"
      End
      Begin VB.Menu MenuWindowShowAll 
         Caption         =   "Show All"
         Enabled         =   0   'False
      End
      Begin VB.Menu MenuWindowCloseAll 
         Caption         =   "Close All"
         Enabled         =   0   'False
      End
   End
   Begin VB.Menu MenuHelp 
      Caption         =   "&Help"
      Begin VB.Menu MenuHelpIndex 
         Caption         =   "&Index"
      End
      Begin VB.Menu MenuHelpAbout 
         Caption         =   "About Micromouse"
      End
   End
End
Attribute VB_Name = "MDIMainForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub MDIForm_Load()
    Show
    ChDir App.Path
    ReDim Document(1)
    ReDim FState(1)
    'Document(1).Tag = 1
    FState(1).Dirty = False
    FState(1).Deleted = True
    txtComplie.Width = SimSplitter.Width
    txtComplie.Height = SimSplitter.Height
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    If Not AnyPadsLeft() Then End
End Sub

Private Sub MenuFileClose_Click()
 Unload CodeForm
 Unload MouseSimForm
 SimSplitter.Visible = False
 Call NoCode
End Sub

Private Sub MenuFileExit_Click()
    End
End Sub

'Private Sub MenuFileNew_Click()
'    Unload CodeForm
'    Unload MouseSimForm
'
'    Dim FileObject As New FileSystemObject
'    Dim Txtstream As TextStream
'    Dim Str As String
'    Set Txtstream = FileObject.OpenTextFile("util/new.txt", ForReading, True)
'
'    Str = Txtstream.ReadAll
'    Txtstream.Close
'    CodeForm.Code.Text = Str
'    CodeForm.Caption = "Default"
'    Call HaveCode
'End Sub
Private Sub MenuFileNewC51_Click()
    FileNew
End Sub
Private Sub MenuFileNewCode_Click()
    FileNew
End Sub

Private Sub MenuFileNewFlowChart_Click()
FlowchartCodeForm.Show
frmFlowchart.Visible = True
  MDIMainForm.Arrange 2
End Sub

Private Sub MenuFileOpenCode_Click()
    FileOpenProc
End Sub

'Private Sub MenuFileOpen_Click()
  '  ' CancelError is True.
'    On Error GoTo ErrHandler
    
'    Dialog1.Flags = cd10FNHideReadOnly
'    Dialog1.Filter = "C51 Files" & "(*.c)|*.c|Text Files (*.txt)|*.txt|Maze Files (*.maz)|*.maz|All Files (*.*)|*.*"
'    Dialog1.FilterIndex = 1
'    Dialog1.ShowOpen
    
'    Dim FileObject As New FileSystemObject
 '   Dim Txtstream As TextStream
  '  Dim Str As String
    
 '   Set Txtstream = FileObject.OpenTextFile(Dialog1.Filename)
 '   Str = Txtstream.ReadAll
 '   Txtstream.Close
  '  Unload CodeForm
  '  Unload MouseSimForm
  '  CodeForm.txtCode.Text = Str
  '  CodeForm.Caption = Dialog1.Filename
  '  Call HaveCode
  '  Exit Sub
    
'ErrHandler:
' ' User pressed Cancel button.
 '  Exit Sub
'End Sub

Private Sub MenuFileOpenFlowchart_Click()
    Dim intRetVal
    On Error Resume Next
    Dim strOpenFileName As String
    MDIMainForm.Dialog1.filename = ""
    MDIMainForm.Dialog1.Filter = "A51 Files (*.a)|*.a|C51 Files" & "(*.c)|*.c|Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
    MDIMainForm.Dialog1.ShowOpen
    If Err <> 32755 Then
        strOpenFileName = MDIMainForm.Dialog1.filename
        If strOpenFileName = "" Then
            Exit Sub
        End If
        If FileLen(strOpenFileName) > 65000 Then
            MsgBox "The file is too large to Open."
            Exit Sub
        End If
        FlowchartCodeForm.FlowChartOpenFile (strOpenFileName)
    End If
End Sub

Private Sub MenuFilePrint_Click()
' CancelError is True.
    On Error GoTo ErrHandler
    Dialog1.ShowPrinter
ErrHandler:
' User pressed Cancel button.
   Exit Sub
End Sub


Private Sub MenuFileSave_Click()
'    Dim FileStr As Variant
'    Dim Resp As Variant
'    Resp = MsgBox("Are you sure?", vbQuestion + vbYesNo, "Save File")
'    If Resp = vbYes Then
'        If CodeForm.Caption = "Default" Then
'            ' CancelError is True.
 '           On Error GoTo ErrHandler
 '           'Call Dialog
 '           Dialog1.Flags = cd10FNHideReadOnly
 '           Dialog1.Filter = "C51 Files" & "(*.c)|*.c|Text Files (*.txt)|*.txt|Maze Files (*.maz)|*.maz|All Files (*.*)|*.*"
 '           Dialog1.FilterIndex = 1
 '           Dialog1.ShowSave
 '           FileStr = Dialog1.Filename
 '       Else
 '           FileStr = CodeForm.Caption
 '       End If
 '      Dim FileObject As New FileSystemObject
 '           Dim Txtstream As TextStream
 '           Set Txtstream = FileObject.CreateTextFile(FileStr)
 '           Txtstream.WriteLine (CodeForm.Code.Text)
 '           Txtstream.Close
  '      CodeForm.Caption = FileStr
  '  End If
'ErrHandler:
' ' User pressed Cancel button.
 '  Exit Sub
End Sub

Private Sub MenuFileSaveAs_Click()
   ' ' CancelError is True.
   ' On Error GoTo ErrHandler
   '
   ' Dialog1.Flags = cd10FNHideReadOnly
   ' Dialog1.Filter = "C51 Files" & "(*.c)|*.c|Text Files (*.txt)|*.txt|Maze Files (*.maz)|*.maz|All Files (*.*)|*.*"
   ' Dialog1.FilterIndex = 1
   ' Dialog1.ShowSave
   '
   ' Dim FileObject As New FileSystemObject
   ' Dim Txtstream As TextStream
   ' Dim Str As String
   '
   ' Set Txtstream = FileObject.CreateTextFile(Dialog1.Filename)
   ' Str = CodeForm.Code.Text
   ' Txtstream.WriteLine (Str)
   ' Txtstream.Close
   ' CodeForm.Code.Text = Str
   ' CodeForm.Show
   ' Exit Sub
    '
'ErrHandler:
' ' User pressed Cancel button.
  ' Exit Sub
End Sub

Private Sub MenuRunCompile_Click()
    Compiler Me.Caption
End Sub

Private Sub MenuRunDownload_Click()
    Shell App.Path & "\SerialPort"
End Sub

Private Sub MenuRunDownloadSetting_Click()
frmProperties.Show vbModal
End Sub

Private Sub MenuRunSPI_Click()
Shell App.Path & "\isp.exe"
End Sub

Private Sub MenuViewCode_Click()
CodeForm.Show
End Sub

Private Sub MenuViewMouseSim_Click()
    MouseSimForm.Show
End Sub

Private Sub MenuViewSimPanel_Click()
If SimSplitter.Visible = True Then
    SimSplitter.Visible = False
Else
    SimSplitter.Visible = True
End If
End Sub

Private Sub MenuWindowCascade_Click()
    MDIMainForm.Arrange 0
End Sub

Private Sub MenuWindowCloseAll_Click()
    CodeForm.Hide
    SimSplitter.Visible = False
    MouseSimForm.Hide
End Sub

Private Sub MenuWindowShowAll_Click()
    CodeForm.Show
    MouseSimForm.Show
    SimSplitter.Visible = True
End Sub

Private Sub MenuWindowTileHor_Click()
    MDIMainForm.Arrange 1
End Sub

Private Sub MenuWindowTileVer_Click()
    MDIMainForm.Arrange 2
End Sub
Private Sub HaveCode()
    MenuFileSave.Enabled = True
    MenuFileSaveAs.Enabled = True
    MenuFilePrint.Enabled = True
    MenuFileClose.Enabled = True
    MenuViewMouseSim.Enabled = True
    MenuViewCode.Enabled = True
    MenuWindowCascade.Enabled = True
    MenuWindowTileHor.Enabled = True
    MenuWindowTileVer.Enabled = True
    MenuWindowShowAll = True
    MenuWindowCloseAll = True
End Sub


Private Sub NoCode()
    MenuFileSave.Enabled = False
    MenuFileSaveAs.Enabled = False
    MenuFilePrint.Enabled = False
    MenuFileClose.Enabled = False
    MenuViewMouseSim.Enabled = False
    MenuViewCode.Enabled = False
    MenuWindowCascade.Enabled = False
    MenuWindowTileHor.Enabled = False
    MenuWindowTileVer.Enabled = False
    SimSplitter.Visible = False
    MenuWindowShowAll = False
    MenuWindowCloseAll = False
End Sub

Private Sub Text1_Change()

End Sub

