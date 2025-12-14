VERSION 5.00
Begin VB.Form frmExportCSM 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Export as CSM"
   ClientHeight    =   5895
   ClientLeft      =   5010
   ClientTop       =   1260
   ClientWidth     =   5775
   Icon            =   "frmExportCSM.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   393
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   385
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Options"
      Height          =   2535
      Left            =   120
      TabIndex        =   16
      Top             =   2760
      Width           =   5535
      Begin VB.TextBox txtRatio 
         Height          =   315
         Left            =   1440
         TabIndex        =   33
         Text            =   "5"
         Top             =   2040
         Width           =   735
      End
      Begin VB.CheckBox chkFPSReduce 
         Caption         =   "Use Framerate Reduction"
         Height          =   195
         Left            =   240
         TabIndex        =   31
         Top             =   1800
         Width           =   2295
      End
      Begin VB.CheckBox chk3DOptimizer 
         Caption         =   "Use 3D Point Optimizer"
         Height          =   195
         Left            =   240
         TabIndex        =   26
         Top             =   1080
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.TextBox txt3DArrSize 
         Height          =   315
         Left            =   1440
         TabIndex        =   25
         Text            =   "3"
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox txt3DThreshold 
         Height          =   315
         Left            =   3360
         TabIndex        =   24
         Text            =   "0.2"
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox txt2DThreshold 
         Height          =   315
         Left            =   3360
         TabIndex        =   22
         Text            =   "10"
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox txt2DArrSize 
         Height          =   315
         Left            =   1440
         TabIndex        =   20
         Text            =   "3"
         Top             =   600
         Width           =   735
      End
      Begin VB.CheckBox chk2DOptimizer 
         Caption         =   "Use 2D Point Optimizer"
         Height          =   195
         Left            =   240
         TabIndex        =   17
         Top             =   360
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "Ratio:     1/"
         Height          =   195
         Left            =   600
         TabIndex        =   32
         Top             =   2080
         Width           =   795
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "metre"
         Height          =   195
         Left            =   4200
         TabIndex        =   30
         Top             =   1350
         Width           =   390
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "pixels"
         Height          =   195
         Left            =   4200
         TabIndex        =   29
         Top             =   650
         Width           =   390
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Array size:"
         Height          =   195
         Left            =   600
         TabIndex        =   28
         Top             =   1350
         Width           =   720
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "Threshold:"
         Height          =   195
         Left            =   2520
         TabIndex        =   27
         Top             =   1350
         Width           =   750
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "Threshold:"
         Height          =   195
         Left            =   2520
         TabIndex        =   23
         Top             =   650
         Width           =   750
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Array size:"
         Height          =   195
         Left            =   600
         TabIndex        =   21
         Top             =   650
         Width           =   720
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "CSM Parameters"
      Height          =   2535
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   5535
      Begin VB.TextBox txtFramerate 
         Height          =   315
         Left            =   1080
         TabIndex        =   18
         Top             =   960
         Width           =   735
      End
      Begin VB.TextBox txtComment 
         Height          =   315
         Left            =   1080
         TabIndex        =   14
         Text            =   "Created by Motion Analyser : 3D Character Animation Studio v2.0"
         Top             =   2040
         Width           =   4335
      End
      Begin VB.TextBox txtActor 
         Height          =   315
         Left            =   1080
         TabIndex        =   12
         Text            =   "Noname"
         Top             =   1680
         Width           =   2175
      End
      Begin VB.TextBox txtTo 
         Height          =   315
         Left            =   2520
         TabIndex        =   10
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox txtFrom 
         Height          =   315
         Left            =   1320
         TabIndex        =   7
         Top             =   1320
         Width           =   735
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "..."
         Height          =   315
         Left            =   5040
         TabIndex        =   4
         Top             =   600
         Width           =   375
      End
      Begin VB.TextBox txtFilename 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   600
         Width           =   4815
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Framerate:"
         Height          =   195
         Left            =   240
         TabIndex        =   19
         Top             =   1000
         Width           =   750
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "Comment:"
         Height          =   195
         Left            =   240
         TabIndex        =   15
         Top             =   2100
         Width           =   705
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Actor:"
         Height          =   195
         Left            =   240
         TabIndex        =   13
         Top             =   1740
         Width           =   420
      End
      Begin VB.Label lblRange 
         AutoSize        =   -1  'True
         Caption         =   "(Valid range = 0 to 0)"
         Height          =   195
         Left            =   3360
         TabIndex        =   11
         Top             =   1360
         Width           =   1500
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "To"
         Height          =   195
         Left            =   2160
         TabIndex        =   9
         Top             =   1360
         Width           =   195
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Export Range:"
         Height          =   195
         Left            =   240
         TabIndex        =   8
         Top             =   1360
         Width           =   1020
      End
      Begin VB.Label lblFramerate 
         AutoSize        =   -1  'True
         Caption         =   "(Video framerate Left=0, Right=0)"
         Height          =   195
         Left            =   1920
         TabIndex        =   6
         Top             =   1000
         Width           =   2370
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Output Filename:"
         Height          =   195
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   1200
      End
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4440
      TabIndex        =   1
      Top             =   5400
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3120
      TabIndex        =   0
      Top             =   5400
      Width           =   1215
   End
End
Attribute VB_Name = "frmExportCSM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private cdlSave As New clsCommonDialog

' Reference to video forms
Private vdo1 As frmVideo
Private vdo2 As frmVideo
Private vdo3 As frmVideo
Private vdo4 As frmVideo

Private FrameMax As Long    ' Max frame

Private Sub CancelButton_Click()
    Unload Me
End Sub

Public Sub SetVideoForm(Video1 As frmVideo, Video2 As frmVideo, Video3 As frmVideo, Video4 As frmVideo)     ' Set video forms
    Set vdo1 = Video1
    Set vdo2 = Video2
    Set vdo3 = Video3
    Set vdo4 = Video4
    
    ' Get data
    txtFramerate.Text = Trim$(Str$(vdo1.GetFramerate))
    lblFramerate.Caption = "(Video framerate Left=" + Trim$(Str$(vdo1.GetFramerate)) + ", Right=" + Trim$(Str$(vdo2.GetFramerate)) + ")"
    txtFrom.Text = "0"
    If (vdo1.GetLastframe <= vdo2.GetLastframe) And (vdo1.GetLastframe <= vdo3.GetLastframe) And (vdo1.GetLastframe <= vdo4.GetLastframe) Then
        FrameMax = vdo1.GetLastframe
    ElseIf (vdo2.GetLastframe <= vdo1.GetLastframe) And (vdo1.GetLastframe <= vdo3.GetLastframe) And (vdo1.GetLastframe <= vdo4.GetLastframe) Then
        FrameMax = vdo2.GetLastframe
    ElseIf (vdo3.GetLastframe <= vdo1.GetLastframe) And (vdo1.GetLastframe <= vdo2.GetLastframe) And (vdo1.GetLastframe <= vdo4.GetLastframe) Then
        FrameMax = vdo3.GetLastframe
    ElseIf (vdo4.GetLastframe <= vdo1.GetLastframe) And (vdo1.GetLastframe <= vdo2.GetLastframe) And (vdo1.GetLastframe <= vdo3.GetLastframe) Then
        FrameMax = vdo4.GetLastframe
    End If
    txtTo.Text = Trim$(Str$(FrameMax))
    lblRange.Caption = "(Valid range = 0 To " + Trim$(Str$(FrameMax)) + ")"
    txtComment.Text = "Created by Motion Analyser : 3D Character Animation Studio v" + Trim$(Str$(App.Major)) + "." + Trim$(Str$(App.Minor))
End Sub


Private Sub chk2DOptimizer_Click()  ' Update control
    If (chk2DOptimizer.Value = vbChecked) Then
        txt2DArrSize.Enabled = True
        txt2DThreshold.Enabled = True
    Else
        txt2DArrSize.Enabled = False
        txt2DThreshold.Enabled = False
    End If
End Sub

Private Sub chk3DOptimizer_Click()  ' Update control
    If (chk3DOptimizer.Value = vbChecked) Then
        txt3DArrSize.Enabled = True
        txt3DThreshold.Enabled = True
    Else
        txt3DArrSize.Enabled = False
        txt3DThreshold.Enabled = False
    End If
End Sub

Private Sub chkFPSReduce_Click()
    If (chkFPSReduce.Value = vbChecked) Then
        txtRatio.Enabled = True
    Else
        txtRatio.Enabled = False
    End If
End Sub

Private Sub cmdBrowse_Click()   ' Open save dialog
    With cdlSave
        .DialogTitle = "Save Marker Data"
        .DefaultExt = ".csm"
        .Filter = "Character Studio Motion File (*.csm)|*.csm|All files|*.*"
        .flags = &H2000 + &H2 + &H800
        .MaxFileSize = 254
        .FileName = ""
    End With
    cdlSave.ShowSave
    
    If (Trim$(cdlSave.FileName) <> "") Then
        txtFilename.Text = cdlSave.FileName
    End If
End Sub

Private Sub Form_Load()
    chk2DOptimizer_Click
    chk3DOptimizer_Click
    chkFPSReduce_Click
End Sub

Private Sub OKButton_Click()    ' Export
    ' Validation
    If (Trim$(txtFilename.Text) = "") Then MsgBox "Please select output file.", vbExclamation + vbOKOnly: Exit Sub
    If (Val(txtFramerate.Text)) <= 0 Then MsgBox "Invalid framerate.", vbExclamation + vbOKOnly: Exit Sub
    If (Val(txtFrom.Text) < 0) Then MsgBox "Invalid export range.", vbExclamation + vbOKOnly: Exit Sub
    If (Val(txtTo.Text) < Val(txtFrom.Text)) Or (Val(txtTo.Text) > FrameMax) Then MsgBox "Invalid export range.", vbExclamation + vbOKOnly: Exit Sub
    
    If (chk2DOptimizer.Value = vbChecked) Then
        If (Val(txt2DArrSize.Text) <= 0) Then MsgBox "Error in 2D Point Optimizer: Invalid array size.", vbExclamation + vbOKOnly: Exit Sub
        If (Val(txt2DThreshold.Text) < 0) Then MsgBox "Error in 2D Point Optimizer: Invalid threshold value.", vbExclamation + vbOKOnly: Exit Sub
    End If
    If (chk3DOptimizer.Value = vbChecked) Then
        If (Val(txt3DArrSize.Text) <= 0) Then MsgBox "Error in 3D Point Optimizer: Invalid array size.", vbExclamation + vbOKOnly: Exit Sub
        If (Val(txt3DThreshold.Text) < 0) Then MsgBox "Error in 3D Point Optimizer: Invalid threshold value.", vbExclamation + vbOKOnly: Exit Sub
    End If
    If (chkFPSReduce.Value = vbChecked) Then
        If (Val(txtRatio.Text) <= 0) Then MsgBox "Error in Framerate Reduction: Invalid ratio value.", vbExclamation + vbOKOnly: Exit Sub
    End If

    ' Collect data to export
    Dim i As Long
'    Dim MotionDat() As STR_WORLDCOOR    ' Motion data for export in a frame
    Dim Avrdata() As clsWORLDCOOR       ' Motion data AVR data
    Dim CsmParams As CSM_PARAMETERS
'    ReDim MotionDat(0 To JOINT_MAX) As STR_WORLDCOOR
    ReDim Avrdata(0 To JOINT_MAX) As clsWORLDCOOR
    For i = 0 To JOINT_MAX
        Set Avrdata(i) = New clsWORLDCOOR
    Next i
    Dim Frameratio As Long
    Frameratio = 1
    
    ' Collect data
    CsmParams.FileName = txtFilename.Text
    CsmParams.Framerate = Int(Val(txtFramerate.Text))
    CsmParams.LastFrame = Val(txtTo.Text) - Val(txtFrom.Text) + 1
    CsmParams.Datetime = Now
    CsmParams.Actorname = txtActor.Text
    CsmParams.Comment = txtComment.Text
    
    ' Get framerate ratio
    If (chkFPSReduce.Value = vbChecked) Then
        Frameratio = Val(txtRatio.Text)
        CsmParams.Framerate = CsmParams.Framerate \ Frameratio
    End If
    
    ' Init Optimizer
    If (chk2DOptimizer.Value = vbChecked) Then
        vdo1.NewAverageMarker Int(Val(txt2DArrSize.Text)), Int(Val(txt2DThreshold.Text))
        vdo2.NewAverageMarker Int(Val(txt2DArrSize.Text)), Int(Val(txt2DThreshold.Text))
        vdo3.NewAverageMarker Int(Val(txt2DArrSize.Text)), Int(Val(txt2DThreshold.Text))
        vdo4.NewAverageMarker Int(Val(txt2DArrSize.Text)), Int(Val(txt2DThreshold.Text))
    Else
        vdo1.NewAverageMarker 1, -1  ' Always update
        vdo2.NewAverageMarker 1, -1
        vdo3.NewAverageMarker 1, -1
        vdo4.NewAverageMarker 1, -1
    End If
    If (chk3DOptimizer.Value = vbChecked) Then
        For i = 0 To JOINT_MAX
            Avrdata(i).NewAverage Int(Val(txt2DArrSize.Text))
            Avrdata(i).MoveThreshold = Int(Val(txt2DThreshold.Text))
        Next i
    Else
        For i = 0 To JOINT_MAX
            Avrdata(i).NewAverage 1         ' Always update
            Avrdata(i).MoveThreshold = -1
        Next i
    End If
    
    ' Generate and write to file
    CSM_Open CsmParams.FileName, 1
    CSM_WriteHeader CsmParams
    
    For i = 0 To Val(txtTo.Text)
'        GetMotionData i, vdo1, vdo2, MotionDat, AvrData
        Avr i, MotionDat, Avrdata
        If (i >= Val(txtFrom.Text)) And (i <= Val(txtTo.Text)) Then ' Write only
            If ((i - Val(txtFrom.Text)) Mod Frameratio = 0) Then
                CSM_WriteFrame Avrdata  'MotionDat, i   ' Write to file
            End If
        End If
    Next i
    
    CSM_Close
    
    MsgBox "Export completed!", vbInformation + vbOKOnly

    Unload Me
End Sub
