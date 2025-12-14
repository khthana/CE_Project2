VERSION 5.00
Begin VB.Form FlowchartCodeForm 
   Caption         =   "Form1"
   ClientHeight    =   8489
   ClientLeft      =   65
   ClientTop       =   754
   ClientWidth     =   12350
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8489
   ScaleWidth      =   12350
   Begin VB.TextBox txtFlowChartCode 
      Enabled         =   0   'False
      Height          =   8175
      Left            =   0
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   0
      Width           =   12375
   End
   Begin VB.Menu MenuFile 
      Caption         =   "&File"
      Begin VB.Menu MenuFileNew 
         Caption         =   "New"
         Begin VB.Menu MenuFileNewFlowchart 
            Caption         =   "FlowChart"
            Enabled         =   0   'False
         End
         Begin VB.Menu MenuFileNewCode 
            Caption         =   "Code"
            Enabled         =   0   'False
         End
      End
      Begin VB.Menu MenuFileOpen 
         Caption         =   "Open"
         Begin VB.Menu MenuFileOpenCode 
            Caption         =   "Code"
            Enabled         =   0   'False
         End
      End
      Begin VB.Menu a 
         Caption         =   "-"
      End
      Begin VB.Menu MenuFileSave 
         Caption         =   "Save"
      End
      Begin VB.Menu MenuFileSaveAs 
         Caption         =   "Save As"
      End
      Begin VB.Menu a0 
         Caption         =   "-"
      End
      Begin VB.Menu MenuFileClose 
         Caption         =   "Close"
      End
      Begin VB.Menu MenuFileExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu MenuView 
      Caption         =   "&View"
      Begin VB.Menu MenuViewFlowChart 
         Caption         =   "FlowChart"
      End
      Begin VB.Menu MenuViewCompilePanel 
         Caption         =   "Cimpile Panel"
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
      Begin VB.Menu MenuRuncompile 
         Caption         =   "Compile"
      End
   End
   Begin VB.Menu MenuWindow 
      Caption         =   "&Window"
      Begin VB.Menu MenuWindowCascade 
         Caption         =   "Cascade"
      End
      Begin VB.Menu MenuWndowTileVer 
         Caption         =   "Tile Vertically"
      End
      Begin VB.Menu MenuWndowTileHor 
         Caption         =   "Tile Horizontally"
      End
      Begin VB.Menu MenuWndowCloseAll 
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
Attribute VB_Name = "FlowchartCodeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MenuFileClose_Click()
    Unload Me
End Sub

Private Sub MenuFileExit_Click()
    Unload MDIMainForm
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
    '
        SaveFileName = GetFileName("")
        If SaveFileName <> "" Then SaveFileAs (SaveFileName)
    Else
        SaveFileName = GetFileName(DefaultName)
        If SaveFileName <> "" Then SaveFileAs (SaveFileName)
    End If
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

Private Sub MenuWndowCloseAll_Click()
Unload FlowchartCodeForm
End Sub

Private Sub MenuWndowTileHor_Click()
MDIMainForm.Arrange 1
End Sub

Private Sub MenuWndowTileVer_Click()
MDIMainForm.Arrange 2
End Sub

Private Sub txtFlowChartCode_Change()
    Flowstate.Dirty = True
End Sub

Private Sub Form_Load()
    If (frmFlowchart.Visible = True) Then
        MenuViewFlowChart.Checked = True
    End If
    Me.Width = 5000
    Me.Height = 10000
    Me.Caption = "Untitled"
    txtFlowChartCode.Left = 0
    txtFlowChartCode.Top = 0
    
    Flowstate.Dirty = True
End Sub

Private Sub Form_Resize()
    txtFlowChartCode.Width = Me.Width
    txtFlowChartCode.Height = Me.Height
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Dim Msg As String, filename As String, Response As Integer
     'CancelError is True.
            On Error GoTo ErrHandler
    Unload frmFlowchart
    If Flowstate.Dirty Then
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
Sub FlowChartOpenFile(filename)
    On Error Resume Next
    Open filename For Input As #1
    If Err Then
        MsgBox "Can't Open File : " + filename
        Exit Sub
    End If
    Me.Caption = UCase(filename)
    Me.txtFlowChartCode.Text = StrConv(InputB(LOF(1), 1), vbUnicode)
    Flowstate.Dirty = False
    Me.Show
    Close #1
End Sub
