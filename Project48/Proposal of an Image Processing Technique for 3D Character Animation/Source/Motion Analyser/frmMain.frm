VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT3N.OCX"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Motion Analyser : 3D Character Animation Studio"
   ClientHeight    =   10320
   ClientLeft      =   3450
   ClientTop       =   750
   ClientWidth     =   10170
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "frmMain"
   ScrollBars      =   0   'False
   Begin MSComctlLib.ProgressBar ProgressBar 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   10065
      Width           =   10170
      _ExtentX        =   17939
      _ExtentY        =   450
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   1
      Enabled         =   0   'False
      Scrolling       =   1
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuOpen1 
         Caption         =   "Open Video1 ..."
      End
      Begin VB.Menu mnuOpen2 
         Caption         =   "Open Video2 ..."
      End
      Begin VB.Menu mnuOpen3 
         Caption         =   "Open Video3 ..."
      End
      Begin VB.Menu mnuOpen4 
         Caption         =   "Open Video4 ..."
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExportCSM 
         Caption         =   "Export as CSM ..."
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuGenData 
      Caption         =   "&Genarate Data"
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuShowColor 
         Caption         =   "Color Settings"
      End
      Begin VB.Menu mnuStereopsis 
         Caption         =   "Stereopsis Settings"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuAbout 
         Caption         =   "&About Motion Analyser ..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ====================================================================== MEMBER VARIABLES
' Flags

' Common dialog
Private cdlOpen As New clsCommonDialog

' Video Windows
Private vdo1 As New frmVideo
Private vdo2 As New frmVideo
Private vdo3 As New frmVideo
Private vdo4 As New frmVideo
'Private FrameCurrent As Long    ' Current frame
'Private FrameMax As Long        ' Max frame number

'Private MotionDat() As STR_WORLDFRAME

' ====================================================================== PRIVATE FUNCTIONS

' ====================================================================== PUBLIC FUNCTIONS

' ====================================================================== EVENT HANDLES

Private Sub MDIForm_Load()
    ' Init variables
    
    ' Load data
    LoadColors
    LoadStereopsis
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    SaveColors
    SaveStereopsis
    End ' End program
End Sub

Private Sub mnuAbout_Click()
    frmAbout.Show vbModal
End Sub

Private Sub mnuExit_Click()
    Unload Me
End Sub

Private Sub mnuExportCSM_Click()    ' Generate CSM File
    ' Validation
    If (Not vdo1.flgOpenned) Then MsgBox "Please open video 1 file first.", vbExclamation + vbOKOnly: Exit Sub
    If (Not vdo2.flgOpenned) Then MsgBox "Please open video 2 file first.", vbExclamation + vbOKOnly: Exit Sub
    If (Not vdo3.flgOpenned) Then MsgBox "Please open video 3 file first.", vbExclamation + vbOKOnly: Exit Sub
    If (Not vdo4.flgOpenned) Then MsgBox "Please open video 4 file first.", vbExclamation + vbOKOnly: Exit Sub
    
    Load frmExportCSM
    frmExportCSM.SetVideoForm vdo1, vdo2, vdo3, vdo4
    frmExportCSM.Show vbModal

End Sub

Private Sub mnuGenData_Click()
    If ((Not vdo1.flgOpenned) Or (Not vdo2.flgOpenned) Or (Not vdo3.flgOpenned) Or (Not vdo4.flgOpenned)) Then
        If (MsgBox("Some of video(1-4) is not openned yet.") = vbOK) Then Exit Sub
    Else
        Dim v1 As Boolean
        Dim v2 As Boolean
        Dim v3 As Boolean
        Dim v4 As Boolean
'        Dim FrameMax As Long
        Dim fm As Double
        Dim i As Long
        Dim j As Integer
        Dim k As Integer
        Dim X As Long
        Dim Y As Long
        Dim X1 As Long
        Dim Y1 As Long
        Dim x2 As Long
        Dim y2 As Long
        Dim tmpcoor As STR_WORLDCOOR
        Dim Pt1 As STR_IMAGECOOR
        Dim Pt2 As STR_IMAGECOOR
        Dim ImgSize1 As STR_IMAGESIZE
        Dim ImgSize2 As STR_IMAGESIZE
        Dim Count As Integer
        Dim dx As Double
        Dim dy As Double
        Dim dz As Double
'        genmode = False
        ProgressBar.Refresh
        
        If (vdo1.GetLastframe <= vdo2.GetLastframe) And (vdo1.GetLastframe <= vdo3.GetLastframe) And (vdo1.GetLastframe <= vdo4.GetLastframe) Then
            FrameMax = vdo1.GetLastframe - 1
        ElseIf (vdo2.GetLastframe <= vdo1.GetLastframe) And (vdo2.GetLastframe <= vdo3.GetLastframe) And (vdo2.GetLastframe <= vdo4.GetLastframe) Then
            FrameMax = vdo2.GetLastframe - 1
        ElseIf (vdo3.GetLastframe <= vdo1.GetLastframe) And (vdo3.GetLastframe <= vdo2.GetLastframe) And (vdo3.GetLastframe <= vdo4.GetLastframe) Then
            FrameMax = vdo3.GetLastframe - 1
        ElseIf (vdo4.GetLastframe <= vdo1.GetLastframe) And (vdo4.GetLastframe <= vdo2.GetLastframe) And (vdo4.GetLastframe <= vdo3.GetLastframe) Then
            FrameMax = vdo4.GetLastframe - 1
        End If
        fm = FrameMax

        
        ReDim MotionDat(0 To fm) As STR_WORLDFRAME
        For i = 0 To fm
            ReDim MotionDat(i).Motion(0 To JOINT_MAX) As STR_WORLDDATA
            For j = 0 To JOINT_MAX
                ReDim MotionDat(i).Motion(j).coor(0 To 3) As STR_WORLDCOOR
            Next j
        Next i
        
    vdo1.SetControlEnable False
    vdo1.cmdPlay.Enabled = False
    vdo1.flgProcess = True
    vdo2.SetControlEnable False
    vdo2.cmdPlay.Enabled = False
    vdo2.flgProcess = True
    vdo3.SetControlEnable False
    vdo3.cmdPlay.Enabled = False
    vdo3.flgProcess = True
    vdo4.SetControlEnable False
    vdo4.cmdPlay.Enabled = False
    vdo4.flgProcess = True
        
    For i = 0 To fm
        vdo1.SeekFrame
        vdo1.ProcessImage
        vdo1.DetectMarker
        
        vdo2.SeekFrame
        vdo2.ProcessImage
        vdo2.DetectMarker
        
        vdo3.SeekFrame
        vdo3.ProcessImage
        vdo3.DetectMarker
        
        vdo4.SeekFrame
        vdo4.ProcessImage
        vdo4.DetectMarker
        
        For j = 3 To 8
        If (Not i = 0) Then
            If (vdo4.GetMarker(i - 1, j, X, Y) And vdo2.GetMarker(i, j, X, Y) And vdo1.GetMarker(i, j, X, Y)) And (vdo4.GetMarker(i, j, X, Y) And vdo2.GetMarker(i, j, X, Y) And (Not vdo1.GetMarker(i, j, X, Y))) Then
                vdo1.SetBlob i, j
            End If
            If (vdo1.GetMarker(i - 1, j, X, Y) And vdo3.GetMarker(i, j, X, Y) And vdo2.GetMarker(i, j, X, Y)) And (vdo1.GetMarker(i, j, X, Y) And vdo3.GetMarker(i, j, X, Y) And (Not vdo2.GetMarker(i, j, X, Y))) Then
                vdo2.SetBlob i, j
            End If
            If (vdo2.GetMarker(i - 1, j, X, Y) And vdo4.GetMarker(i, j, X, Y) And vdo3.GetMarker(i, j, X, Y)) And (vdo2.GetMarker(i, j, X, Y) And vdo4.GetMarker(i, j, X, Y) And (Not vdo3.GetMarker(i, j, X, Y))) Then
                vdo3.SetBlob i, j
            End If
            If (vdo1.GetMarker(i - 1, j, X, Y) And vdo3.GetMarker(i, j, X, Y) And vdo4.GetMarker(i, j, X, Y)) And (vdo1.GetMarker(i, j, X, Y) And vdo3.GetMarker(i, j, X, Y) And (Not vdo4.GetMarker(i, j, X, Y))) Then
                vdo4.SetBlob i, j
            End If
        End If
        Next j
        
        ' get motion data
        GetMotionData i, vdo1, vdo2, MotionDat
        GetMotionData i, vdo2, vdo3, MotionDat
        GetMotionData i, vdo3, vdo4, MotionDat
        GetMotionData i, vdo4, vdo1, MotionDat
        
        ' set motion data
        For j = 0 To JOINT_MAX
            For k = 0 To MotionDat(i).Motion(j).Count - 1
                dx = MotionDat(i).Motion(j).coor(k).X - MotionDat(i).Motion(j).coor(k).X
                dy = MotionDat(i).Motion(j).coor(k).Y - MotionDat(i).Motion(j).coor(k).Y
                dz = MotionDat(i).Motion(j).coor(k).Z - MotionDat(i).Motion(j).coor(k).Z
                MotionDat(i).Motion(j).coor(k).dx = dx
                MotionDat(i).Motion(j).coor(k).dy = dy
                MotionDat(i).Motion(j).coor(k).dz = dz
            Next k
            
            If MotionDat(i).Motion(j).Count > 1 Then
                MAnalysis i, MotionDat, j
            End If
        Next j

        For j = 0 To 3
        'get nomarker from other vdo and find the maker
        Do While ((vdo1.GetNotMarker(i, j, X1, Y1)) Or (vdo2.GetNotMarker(i, j, X1, Y1)) Or (vdo3.GetNotMarker(i, j, X1, Y1)) Or (vdo4.GetNotMarker(i, j, X1, Y1)))
            If vdo1.GetNotMarker(i, j, X1, Y1) Then
                SetNotMarker i, j, vdo1, X1, Y1, vdo2, vdo4, MotionDat
            ElseIf vdo2.GetNotMarker(i, j, X1, Y1) Then
                SetNotMarker i, j, vdo2, X1, Y1, vdo1, vdo3, MotionDat
            ElseIf vdo3.GetNotMarker(i, j, X1, Y1) Then
                SetNotMarker i, j, vdo3, X1, Y1, vdo2, vdo4, MotionDat
            ElseIf vdo4.GetNotMarker(i, j, X1, Y1) Then
                SetNotMarker i, j, vdo4, X1, Y1, vdo1, vdo3, MotionDat
            End If
        Loop
        Next j
        
        ProgressBar.Value = i / (fm / 100)
    Next i
    vdo1.SetControlEnable True
    vdo1.cmdPlay.Enabled = True
    vdo1.flgProcess = False
    vdo1.UpdateControl
    vdo2.SetControlEnable True
    vdo2.cmdPlay.Enabled = True
    vdo2.flgProcess = False
    vdo2.UpdateControl
    vdo3.SetControlEnable True
    vdo3.cmdPlay.Enabled = True
    vdo3.flgProcess = False
    vdo3.UpdateControl
    vdo4.SetControlEnable True
    vdo4.cmdPlay.Enabled = True
    vdo4.flgProcess = False
    vdo4.UpdateControl

        ProgressBar.Value = 0
        MsgBox "Generate Data Finished", vbInformation + vbOKOnly, "Generate Data"
    End If
End Sub

Private Sub mnuOpen1_Click() ' Open left vieo
    ' Validation
    If (vdo1.flgOpenned) Then
        If (MsgBox("Video1 is already openned. Opening new file will cause all data lose. Continue?", vbExclamation + vbYesNo) = vbNo) Then Exit Sub
    End If

    With cdlOpen
        .DialogTitle = "Open Video 1"
        .Filter = "AVI Video|*.avi|All files|*.*"
        .flags = &H4 + &H800 + &H1000
        .MaxFileSize = 254
        .FileName = ""
    End With
    cdlOpen.ShowOpen
    
    ' Open video 1 window
    If Trim$(cdlOpen.FileName <> "") Then
        If (vdo1.InitVideo(cdlOpen.FileName)) Then
            vdo1.Show
            vdo1.cams = 1
        Else
            MsgBox "Cannot open the video file.", vbExclamation + vbOKOnly
            Unload vdo1
        End If
    End If
    ChDir App.Path
End Sub

Private Sub mnuOpen2_Click()
    If (vdo2.flgOpenned) Then
        If (MsgBox("Video2 is already openned. Open new file will cause all data lose. Continue?", vbExclamation + vbYesNo) = vbNo) Then Exit Sub
    End If

    With cdlOpen
        .DialogTitle = "Open Video 2"
        .Filter = "AVI Video|*.avi|All files|*.*"
        .flags = &H4 + &H800 + &H1000
        .MaxFileSize = 254
        .FileName = ""
    End With
    cdlOpen.ShowOpen
    
    ' Open video 2 window
    If Trim$(cdlOpen.FileName <> "") Then
        If (vdo2.InitVideo(cdlOpen.FileName)) Then
            vdo2.Show
            vdo2.cams = 2
        Else
            MsgBox "Cannot open the video file.", vbExclamation + vbOKOnly
            Unload vdo2
        End If
    End If
    ChDir App.Path
End Sub


Private Sub mnuOpen3_Click()
    If (vdo3.flgOpenned) Then
        If (MsgBox("Video3 is already openned. Open new file will cause all data lose. Continue?", vbExclamation + vbYesNo) = vbNo) Then Exit Sub
    End If

    With cdlOpen
        .DialogTitle = "Open Video 3"
        .Filter = "AVI Video|*.avi|All files|*.*"
        .flags = &H4 + &H800 + &H1000
        .MaxFileSize = 254
        .FileName = ""
    End With
    cdlOpen.ShowOpen
    
    ' Open video 3 window
    If Trim$(cdlOpen.FileName <> "") Then
        If (vdo3.InitVideo(cdlOpen.FileName)) Then
            vdo3.Show
            vdo3.cams = 3
        Else
            MsgBox "Cannot open the video file.", vbExclamation + vbOKOnly
            Unload vdo3
        End If
    End If
    ChDir App.Path
End Sub

Private Sub mnuOpen4_Click()
    If (vdo4.flgOpenned) Then
        If (MsgBox("Video 4 is already openned. Open new file will cause all data lose. Continue?", vbExclamation + vbYesNo) = vbNo) Then Exit Sub
    End If

    With cdlOpen
        .DialogTitle = "Open Video 4"
        .Filter = "AVI Video|*.avi|All files|*.*"
        .flags = &H4 + &H800 + &H1000
        .MaxFileSize = 254
        .FileName = ""
    End With
    cdlOpen.ShowOpen
    
    ' Open video 4 window
    If Trim$(cdlOpen.FileName <> "") Then
        If (vdo4.InitVideo(cdlOpen.FileName)) Then
            vdo4.Show
            vdo4.cams = 4
        Else
            MsgBox "Cannot open the video file.", vbExclamation + vbOKOnly
            Unload vdo4
        End If
    End If
    ChDir App.Path
End Sub

Private Sub mnuShowColor_Click()    ' Show color settings dialog
    If (mnuShowColor.Checked) Then
        frmColor.Hide
    Else
        frmColor.Show
    End If
    mnuShowColor.Checked = Not mnuShowColor.Checked
End Sub

Private Sub mnuStereopsis_Click()   ' Show stereopsis settings
    If (mnuStereopsis.Checked) Then
        frmStereopsis.Hide
    Else
        frmStereopsis.Show
    End If
    mnuStereopsis.Checked = Not mnuStereopsis.Checked
End Sub
