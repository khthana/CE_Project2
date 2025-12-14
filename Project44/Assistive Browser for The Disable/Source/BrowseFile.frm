VERSION 5.00
Begin VB.Form BrowseFile 
   BackColor       =   &H8000000A&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   3045
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4560
   Icon            =   "BrowseFile.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3045
   ScaleWidth      =   4560
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txFilename 
      BackColor       =   &H80000000&
      Enabled         =   0   'False
      Height          =   375
      Left            =   2400
      TabIndex        =   5
      Top             =   1800
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancle"
      Height          =   615
      Left            =   3480
      TabIndex        =   4
      Top             =   2280
      Width           =   975
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Load"
      Height          =   615
      Left            =   2400
      TabIndex        =   3
      Top             =   2280
      Width           =   975
   End
   Begin VB.FileListBox File 
      Height          =   1455
      Left            =   2400
      TabIndex        =   2
      Top             =   120
      Width           =   2055
   End
   Begin VB.DirListBox Dir 
      Height          =   2340
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   2175
   End
   Begin VB.DriveListBox Drive 
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2175
   End
End
Attribute VB_Name = "BrowseFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Sub EnableForm()
    'Select Case caller
        'Case MenuButtonMouse.Caption: MenuButtonMouse.Enabled = True
        'Case MenuSetColor.Caption:       MenuSetColor.Enabled = True
    'End Select
    If caller = "MenuButtonMouse" Then
        MenuButtonMouse.Enabled = True
    ElseIf caller = "MenuSetColor" Then
        MenuSetColor.Enabled = True
    ElseIf caller = "FormMain" Then
        Change_Pg = True
    End If
End Sub

Private Sub cmdCancel_Click()
    Call EnableForm
    Unload Me
End Sub

Private Sub cmdOK_Click()
    If txFilename.text <> "" Then
        filename = Dir.Path & "\" & txFilename.text
        Call EnableForm
        Unload Me
    Else
    End If
End Sub

Private Sub Dir_Change()
    File.Path = Dir.Path
End Sub

Private Sub Drive_Change()
    Dir.Path = Drive.Drive
End Sub

Private Sub File_Click()
    txFilename.text = File.filename
End Sub

Private Sub Form_Load()
    Call StayOnTop(Me.hwnd, 0)
    If loadFlag Then
        Me.Caption = "Load.."
        cmdOK.Caption = "Load"
        txFilename.Enabled = False
        txFilename.BackColor = &H80000000
    ElseIf saveFlag Then
        Me.Caption = "Save"
        cmdOK.Caption = "Save"
        txFilename.BackColor = &HFFFFFF
        txFilename.Enabled = True
    End If
End Sub

