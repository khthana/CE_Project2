VERSION 5.00
Begin VB.Form CodeForm 
   AutoRedraw      =   -1  'True
   Caption         =   "Form1"
   ClientHeight    =   6305
   ClientLeft      =   65
   ClientTop       =   754
   ClientWidth     =   10985
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6315
   ScaleMode       =   0  'User
   ScaleWidth      =   7945.799
   Visible         =   0   'False
   Begin VB.TextBox txtCode 
      Height          =   8535
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   -120
      Width           =   11175
   End
   Begin VB.Menu MenuFile 
      Caption         =   "&File"
      Begin VB.Menu MenuFileNew 
         Caption         =   "&New"
         Begin VB.Menu MenuFileNewFlowChart 
            Caption         =   "FlowChart"
            Enabled         =   0   'False
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
      Begin VB.Menu MenuFileSave 
         Caption         =   "Save"
      End
      Begin VB.Menu MenuFileSaveAs 
         Caption         =   "SaveAs"
      End
      Begin VB.Menu MenuFileClose 
         Caption         =   "Close"
      End
      Begin VB.Menu MenuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu MenuView 
      Caption         =   "&View"
      Begin VB.Menu MenuViewFlowChart 
         Caption         =   "FlowChart"
      End
      Begin VB.Menu MenuViewCompilePanel 
         Caption         =   "Compile Panel"
      End
   End
   Begin VB.Menu MenuRun 
      Caption         =   "&Run"
      Begin VB.Menu MenuRunDownload 
         Caption         =   "Download"
      End
      Begin VB.Menu MenuRunSPI 
         Caption         =   "SPI Download"
      End
      Begin VB.Menu MenuRunComplie 
         Caption         =   "Compile"
      End
   End
   Begin VB.Menu MenuWindow 
      Caption         =   "&Window"
      Begin VB.Menu MenuWindowCascade 
         Caption         =   "Cascade"
      End
      Begin VB.Menu MenuWindowTileVer 
         Caption         =   "Tile Vertically"
      End
      Begin VB.Menu MenuWindowTileHor 
         Caption         =   "Tile Horizontally"
      End
      Begin VB.Menu MenuWindowCloseAll 
         Caption         =   "Close All"
      End
   End
   Begin VB.Menu MenuHelp 
      Caption         =   "&Help"
      Begin VB.Menu MenuHelpIndex 
         Caption         =   "Index"
      End
      Begin VB.Menu MenuHelpAbout 
         Caption         =   "About Micromouse"
      End
   End
End
Attribute VB_Name = "CodeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub MenuRunComplie_Click()
Compiler Me.Caption
End Sub

Private Sub MenuRunSPI_Click()
Shell App.Path & "\isp.exe"
End Sub

Private Sub MenuViewCompilePanel_Click()
MDIMainForm.SimSplitter.Visible = True
End Sub

Private Sub MenuViewFlowChart_Click()
    If frmFlowchart.Visible = True Then
        frmFlowchart.Visible = False
        MenuViewFlowChart.Checked = False
    Else
        frmFlowchart.Visible = True
        MenuViewFlowChart.Checked = True
    End If
End Sub

Private Sub txtCode_Change()
    FState(Me.Tag).Dirty = True
End Sub

Private Sub Form_Load()
    Me.Width = 5000
    Me.Height = 10000
    txtCode.Left = 0
    txtCode.Top = 0
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Dim Msg As String, filename As String, Response As Integer
     'CancelError is True.
            On Error GoTo ErrHandler
            
    If FState(Me.Tag).Dirty Then
        filename = Me.Caption
        Msg = "The Text in [" & filename & "] has changed. Do You want to save?"
        Response = MsgBox(Msg, vbYesNoCancel, MDIMainForm.Caption)
        Select Case Response
            Case vbYes
                If Left(Me.Caption, 8) = "Untitled" Then
                    MDIMainForm.Dialog1.Filter = "A51 Files" & "(*.a)|*.a|C51 Files" & "(*.c)|*.c|Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
                    MDIMainForm.Dialog1.ShowSave
                    filename = MDIMainForm.Dialog1.filename
ErrHandler:
' User pressed Cancel button.
   Cancel = True
                Else
                    filename = "Me.Caption"
                End If
                If filename <> "" Then SaveFileAs filename
            Case vbNo
                Cancel = False
            Case vbCancel
                Cancel = True
        End Select
    End If
End Sub

Private Sub Form_Resize()
    txtCode.Width = Me.Width
    txtCode.Height = Me.Height
    'txtCode.Width = ScaleHeight
   ' txtCode.Height = ScaleWidth
End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Unload CodeForm
   ' Unload MouseSimForm
    '
   ' MDIMainForm.SimSplitter.Visible = False
   ' MDIMainForm.MenuFileSave.Enabled = False
   ' MDIMainForm.MenuFileSaveAs.Enabled = False
   ' MDIMainForm.MenuFilePrint.Enabled = False
   ' MDIMainForm.MenuFileClose.Enabled = False
   ' MDIMainForm.MenuViewMouseSim.Enabled = False
   ' MDIMainForm.MenuViewCode.Enabled = False
   ' MDIMainForm.MenuWindowCascade.Enabled = False
   ' MDIMainForm.MenuWindowTileHor.Enabled = False
   ' MDIMainForm.MenuWindowTileVer.Enabled = False
   ' MDIMainForm.SimSplitter.Visible = False
   ' MDIMainForm.MenuWindowShowAll = False
   ' MDIMainForm.MenuWindowCloseAll = False
   FState(Me.Tag).Deleted = True
End Sub

Private Sub MenuFileClose_Click()
    Unload Me
End Sub

Private Sub MenuFileExit_Click()
    Unload MDIMainForm
End Sub

Private Sub MenuFileNewCode_Click()
    FileNew
End Sub

Private Sub MenuFileNewFlowChart_Click()
    FileNew
End Sub

Private Sub MenuFileOpenCode_Click()
    FileOpenProc
End Sub

Private Sub MenuFileOpenFlowchart_Click()
    FileOpenProc
End Sub

Private Sub MenuFileSave_Click()
    Dim filename As String
    If Left(Me.Caption, 8) = "Untitled" Then
        filename = GetFileName(filename)
    Else
        filename = Me.Caption
    End If
    If filename <> "" Then SaveFileAs filename
End Sub

Private Sub MenuFileSaveAs_Click()
    Dim SaveFileName As String
    Dim DefaultName As String
    DefaultName = Me.Caption
    If Left(Me.Caption, 8) = "Untitled" Then
        SaveFileName = GetFileName("")
        If SaveFileName <> "" Then SaveFileAs (SaveFileName)
    Else
        SaveFileName = GetFileName(DefaultName)
        If SaveFileName <> "" Then SaveFileAs (SaveFileName)
    End If
End Sub

Private Sub MenuRunDownload_Click()
  Shell App.Path & "\SerialPort"
End Sub

Private Sub MenuRunDownloadSetting_Click()
frmProperties.Show vbModal
End Sub

Private Sub MenuViewSimPanel_Click()
    If MDIMainForm.SimSplitter.Visible = True Then
        MDIMainForm.SimSplitter.Visible = False
        MenuViewSimPanel.Checked = False
    Else
        MDIMainForm.SimSplitter.Visible = True
        MenuViewSimPanel.Checked = True
    End If
End Sub

Private Sub MenuWindowCascade_Click()
    MDIMainForm.Arrange 0
End Sub

Private Sub MenuWindowCloseAll_Click()
    CloseAll
End Sub

Private Sub MenuWindowTileHor_Click()
    MDIMainForm.Arrange 1
End Sub

Private Sub MenuWindowTileVer_Click()
    MDIMainForm.Arrange 2
End Sub
