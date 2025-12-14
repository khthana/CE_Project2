VERSION 5.00
Begin VB.Form frmExportTXT 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Export as CSV"
   ClientHeight    =   6975
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5775
   Icon            =   "frmExportTXT.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   465
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   385
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Options"
      Height          =   2535
      Left            =   120
      TabIndex        =   11
      Top             =   3840
      Width           =   5535
      Begin VB.TextBox txtRatio 
         Height          =   315
         Left            =   1440
         TabIndex        =   26
         Text            =   "5"
         Top             =   2040
         Width           =   735
      End
      Begin VB.CheckBox chkFPSReduce 
         Caption         =   "Use Framerate Reduction"
         Height          =   195
         Left            =   240
         TabIndex        =   24
         Top             =   1800
         Width           =   2295
      End
      Begin VB.CheckBox chk3DOptimizer 
         Caption         =   "Use 3D Point Optimizer"
         Height          =   195
         Left            =   240
         TabIndex        =   19
         Top             =   1080
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.TextBox txt3DArrSize 
         Height          =   315
         Left            =   1440
         TabIndex        =   18
         Text            =   "3"
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox txt3DThreshold 
         Height          =   315
         Left            =   3360
         TabIndex        =   17
         Text            =   "0.2"
         Top             =   1320
         Width           =   735
      End
      Begin VB.TextBox txt2DThreshold 
         Height          =   315
         Left            =   3360
         TabIndex        =   15
         Text            =   "10"
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox txt2DArrSize 
         Height          =   315
         Left            =   1440
         TabIndex        =   13
         Text            =   "3"
         Top             =   600
         Width           =   735
      End
      Begin VB.CheckBox chk2DOptimizer 
         Caption         =   "Use 2D Point Optimizer"
         Height          =   195
         Left            =   240
         TabIndex        =   12
         Top             =   360
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Caption         =   "Ratio:     1/"
         Height          =   195
         Left            =   600
         TabIndex        =   25
         Top             =   2160
         Width           =   795
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "metre"
         Height          =   195
         Left            =   4200
         TabIndex        =   23
         Top             =   1440
         Width           =   390
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Caption         =   "pixels"
         Height          =   195
         Left            =   4200
         TabIndex        =   22
         Top             =   720
         Width           =   390
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Array size:"
         Height          =   195
         Left            =   600
         TabIndex        =   21
         Top             =   1440
         Width           =   720
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "Threshold:"
         Height          =   195
         Left            =   2520
         TabIndex        =   20
         Top             =   1440
         Width           =   750
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "Threshold:"
         Height          =   195
         Left            =   2520
         TabIndex        =   16
         Top             =   720
         Width           =   750
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Array size:"
         Height          =   195
         Left            =   600
         TabIndex        =   14
         Top             =   720
         Width           =   720
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Export Settings"
      Height          =   3615
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   5535
      Begin VB.ListBox lstJoints 
         Height          =   1860
         Left            =   1440
         Style           =   1  'Checkbox
         TabIndex        =   27
         Top             =   1560
         Width           =   2415
      End
      Begin VB.TextBox txtTo 
         Height          =   315
         Left            =   2520
         TabIndex        =   9
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox txtFrom 
         Height          =   315
         Left            =   1320
         TabIndex        =   6
         Top             =   1080
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
         Caption         =   "Exported Joints:"
         Height          =   195
         Left            =   240
         TabIndex        =   28
         Top             =   1560
         Width           =   1125
      End
      Begin VB.Label lblRange 
         AutoSize        =   -1  'True
         Caption         =   "(Valid range = 0 to 0)"
         Height          =   195
         Left            =   3360
         TabIndex        =   10
         Top             =   1200
         Width           =   1500
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "To"
         Height          =   195
         Left            =   2160
         TabIndex        =   8
         Top             =   1200
         Width           =   195
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Export Range:"
         Height          =   195
         Left            =   240
         TabIndex        =   7
         Top             =   1200
         Width           =   1020
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
      Top             =   6480
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3120
      TabIndex        =   0
      Top             =   6480
      Width           =   1215
   End
End
Attribute VB_Name = "frmExportTXT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private cdlSave As New clsCommonDialog

' Reference to video forms
Private vdoLeft As frmVideo
Private vdoRight As frmVideo

Private FrameMax As Long    ' Max frame

Private Sub CancelButton_Click()
    Unload Me
End Sub

Public Sub SetVideoForm(LeftVideo As frmVideo, RightVideo As frmVideo)     ' Set video forms
    Set vdoLeft = LeftVideo
    Set vdoRight = RightVideo
    
    ' Get data
    Dim i As Integer
    txtFrom.Text = "0"
    For i = 0 To JOINT_MAX
        lstJoints.AddItem JOINT_NAME(i)
    Next i
    If (vdoLeft.GetLastframe < vdoRight.GetLastframe) Then
        FrameMax = vdoLeft.GetLastframe
    Else
        FrameMax = vdoRight.GetLastframe
    End If
    txtTo.Text = Trim$(Str$(FrameMax))
    lblRange.Caption = "(Valid range = 0 To " + Trim$(Str$(FrameMax)) + ")"
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
        .DefaultExt = ".csv"
        .Filter = "Comma Seperated Values File (*.csv)|*.csv|All files|*.*"
        .flags = &H2000 + &H2 + &H800
        .MaxFileSize = 254
        .Filename = ""
    End With
    cdlSave.ShowSave
    
    If (Trim$(cdlSave.Filename) <> "") Then
        txtFilename.Text = cdlSave.Filename
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
    Dim MotionDat() As STR_WORLDCOOR    ' Motion data for export in a frame
    Dim AvrData() As clsWORLDCOOR       ' Motion data AVR data
    ReDim MotionDat(0 To JOINT_MAX) As STR_WORLDCOOR
    ReDim AvrData(0 To JOINT_MAX) As clsWORLDCOOR
    For i = 0 To JOINT_MAX
        Set AvrData(i) = New clsWORLDCOOR
    Next i
    Dim Frameratio As Long
    Frameratio = 1
    
    
    ' Get framerate ratio
    If (chkFPSReduce.Value = vbChecked) Then
        Frameratio = Val(txtRatio.Text)
    End If
    
    ' Init Optimizer
    If (chk2DOptimizer.Value = vbChecked) Then
        vdoLeft.NewAverageMarker Int(Val(txt2DArrSize.Text)), Int(Val(txt2DThreshold.Text))
        vdoRight.NewAverageMarker Int(Val(txt2DArrSize.Text)), Int(Val(txt2DThreshold.Text))
    Else
        vdoLeft.NewAverageMarker 1, -1  ' Always update
        vdoRight.NewAverageMarker 1, -1
    End If
    If (chk3DOptimizer.Value = vbChecked) Then
        For i = 0 To JOINT_MAX
            AvrData(i).NewAverage Int(Val(txt2DArrSize.Text))
            AvrData(i).MoveThreshold = Int(Val(txt2DThreshold.Text))
        Next i
    Else
        For i = 0 To JOINT_MAX
            AvrData(i).NewAverage 1         ' Always update
            AvrData(i).MoveThreshold = -1
        Next i
    End If
    
    ' Generate and write to file
    Open txtFilename.Text For Output As #1
    ' Write header
    Dim j As Integer
    Dim tmpstr As String
    tmpstr = "Frame" + ","
    For j = 0 To JOINT_MAX
        If (lstJoints.Selected(j)) Then
            tmpstr = tmpstr + JOINT_NAME(j) + "_X," + JOINT_NAME(j) + "_Y," + JOINT_NAME(j) + "_Z,"
        End If
    Next j
    Print #1, tmpstr
    
    Dim count As Long
    count = 0
    For i = 0 To Val(txtTo.Text)
        GetMotionData i, vdoLeft, vdoRight, MotionDat, AvrData
            
        If (i >= Val(txtFrom.Text)) And (i <= Val(txtTo.Text)) Then ' Write only
            If ((i - Val(txtFrom.Text)) Mod Frameratio = 0) Then
                tmpstr = Format$(count, "0") + ","
                For j = 0 To JOINT_MAX
                    If (lstJoints.Selected(j)) Then 'Write to file
                        tmpstr = tmpstr + Format$(MotionDat(j).X * 1000, "0.00") + "," + Format$(MotionDat(j).Y * 1000, "0.00") + "," + Format$(MotionDat(j).Z * 1000, "0.00") + ","
                    End If
                Next j
                Print #1, tmpstr
                
                count = count + 1
            End If
        End If
    Next i
    
    Close #1
    
    MsgBox "Export completed!", vbInformation + vbOKOnly

    Unload Me
End Sub
