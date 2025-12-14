VERSION 5.00
Object = "{A91E1E76-6AE7-11D4-AD08-A8AB2E818B70}#1.0#0"; "VideoOCX.ocx"
Begin VB.Form frmVideo 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Video"
   ClientHeight    =   4365
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4815
   Icon            =   "frmVideo.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   291
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   321
   Begin VB.Timer tmrPlay 
      Enabled         =   0   'False
      Left            =   0
      Top             =   480
   End
   Begin VB.PictureBox picToolbar 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   660
      Left            =   0
      ScaleHeight     =   44
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   321
      TabIndex        =   2
      Top             =   3720
      Width           =   4815
      Begin VB.CommandButton cmdPlay 
         Height          =   330
         Left            =   0
         Picture         =   "frmVideo.frx":0F7A
         Style           =   1  'Graphical
         TabIndex        =   0
         ToolTipText     =   "Play/Stop Movie"
         Top             =   0
         Width           =   330
      End
      Begin VB.CommandButton cmdLoad 
         Height          =   330
         Left            =   3675
         Picture         =   "frmVideo.frx":1301
         Style           =   1  'Graphical
         TabIndex        =   9
         ToolTipText     =   "Load Marker Data"
         Top             =   330
         Width           =   450
      End
      Begin VB.CommandButton cmdSave 
         Height          =   330
         Left            =   3075
         Picture         =   "frmVideo.frx":1683
         Style           =   1  'Graphical
         TabIndex        =   8
         ToolTipText     =   "Save Marker Data"
         Top             =   330
         Width           =   450
      End
      Begin VB.ComboBox cmbMarker 
         Height          =   315
         Left            =   1230
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   330
         Width           =   1095
      End
      Begin VB.CommandButton cmdDetectDef 
         Height          =   330
         Left            =   4275
         Picture         =   "frmVideo.frx":1A09
         Style           =   1  'Graphical
         TabIndex        =   6
         ToolTipText     =   "Detect Markers in Default Gesture"
         Top             =   330
         Width           =   450
      End
      Begin VB.CheckBox chkCrosshair 
         Height          =   330
         Left            =   2475
         Picture         =   "frmVideo.frx":1D73
         Style           =   1  'Graphical
         TabIndex        =   5
         ToolTipText     =   "Toggle Crosshair Visibility"
         Top             =   330
         Width           =   450
      End
      Begin VB.ComboBox cmbView 
         Height          =   315
         ItemData        =   "frmVideo.frx":20D8
         Left            =   0
         List            =   "frmVideo.frx":20DA
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   330
         Width           =   1095
      End
      Begin VB.HScrollBar hsbFrame 
         Height          =   330
         LargeChange     =   10
         Left            =   240
         Max             =   100
         TabIndex        =   3
         Top             =   0
         Width           =   4485
      End
   End
   Begin VB.PictureBox picImage 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H0000FF00&
      Height          =   3600
      Left            =   0
      ScaleHeight     =   240
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   320
      TabIndex        =   1
      Top             =   0
      Width           =   4800
      Begin VIDEOOCXLib.VideoOCX vdoocxVideo 
         Height          =   495
         Left            =   0
         TabIndex        =   10
         Top             =   0
         Visible         =   0   'False
         Width           =   495
         _Version        =   65536
         _ExtentX        =   873
         _ExtentY        =   873
         _StockProps     =   0
         ScaledDisplay   =   0   'False
         SaveAudio       =   0   'False
         Driver          =   0
         ControlWidth    =   384
         ControlHeight   =   288
         Mode            =   0
      End
   End
End
Attribute VB_Name = "frmVideo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ====================================================================== MEMBER VARIABLES
' Auxilary flags
Public flgOpenned As Boolean   ' Determine if the video is openned
Private flgToolbar As Boolean   ' Show toolbar?
Private flgCrosshair As Boolean ' Show crosshair?
Public flgProcess As Boolean   ' Processing?

' Image frames
Private vimgFrame As Long   ' Captured image handle
Private vimgBuffer() As Long    ' Image frame buffers
Private ViewCurrent As Long    ' Current view (-1 = Original)

' Marker data
Private NoMarkers() As NO_MARKER
Private Markers() As MARKER_GLOBAL    ' Detected Joints
Private MarkerActive As Integer     ' Current active marker
Private MarkerAvr() As clsIMAGECOOR ' Averaged marker data

' Video Parameters
Private VideoPath As String     ' Current video path & filename
Private FrameCurrent As Long    ' Current frame
'Private FrameMax As Long        ' Max frame number

Private cdlOpenSave As New clsCommonDialog

Public cams As Integer


' ====================================================================== PRIVATE FUNCTIONS
Private Function GetFilename(Path As String) As String     ' Return filename
    Dim tmpstr() As String
    Dim index As Integer
    tmpstr = Split(Path, "\")
    index = 0
    
    On Error GoTo Err1:
    While True
        GetFilename = tmpstr(index)
        index = index + 1
    Wend
    Exit Function
Err1: Resume Quit:
Quit:
End Function

Private Sub DrawMarker(PicBox As PictureBox, X As Long, Y As Long, size As Long, Color As Long)    ' Draw a marker on picImage
    PicBox.Line (X - size, Y)-(X + size + 1, Y), Color
    PicBox.Line (X, Y - size)-(X, Y + size + 1), Color
End Sub

Private Sub UpdateMarker()    ' Draw all markers on picImage
    picImage.Cls
    If (Not flgCrosshair) Then Exit Sub
       
    ' Draw marker crosshair
    Dim i  As Integer
    For i = 0 To MARKER_MAX
        If (FrameCurrent <= FrameMax) Then
            If (Markers(i).Data(FrameCurrent).valid) Then
                If (i = MarkerActive) Then
                    DrawMarker picImage, Markers(i).Data(FrameCurrent).X, Markers(i).Data(FrameCurrent).Y, MARKER_SIZE, MARKER_ACTIVE
                    picImage.CurrentX = Markers(i).Data(FrameCurrent).X - MARKER_SIZE
                    picImage.CurrentY = Markers(i).Data(FrameCurrent).Y - 12 - MARKER_SIZE
                    picImage.ForeColor = MARKER_ACTIVE
                    picImage.Print MARKER_NAME(i)
                Else
                    DrawMarker picImage, Markers(i).Data(FrameCurrent).X, Markers(i).Data(FrameCurrent).Y, MARKER_SIZE, MARKER_NORMAL
                End If
            End If
        End If
    Next i
End Sub

Private Sub UpdateView()    ' Update current view
    If (ViewCurrent < 0) Then
        picImage.Picture = vdoocxVideo.ToPicture(vimgFrame)
    Else
        picImage.Picture = vdoocxVideo.ToPicture(vimgBuffer(ViewCurrent))
    End If
    UpdateMarker
End Sub

Private Sub UpdateForm()    ' Update controls and form
    ' Resize controls & window to fit new video
    Me.width = Me.width - (Me.ScaleWidth * Screen.TwipsPerPixelX) + vdoocxVideo.GetWidth * Screen.TwipsPerPixelX
    Me.height = Me.height - (Me.ScaleHeight * Screen.TwipsPerPixelY) + vdoocxVideo.GetHeight * Screen.TwipsPerPixelY
    If (flgToolbar) Then
        Me.height = Me.height + (picToolbar.height * Screen.TwipsPerPixelY)
        picToolbar.Visible = True
    Else
        picToolbar.Visible = False
    End If
    picImage.width = vdoocxVideo.GetWidth
    picImage.height = vdoocxVideo.GetHeight
    picToolbar.Top = picImage.height
    picToolbar.Left = 0
    picToolbar.width = Me.ScaleWidth
    
    ' Init control properties
    hsbFrame.Max = FrameMax
    hsbFrame.Value = FrameCurrent
End Sub

Public Sub UpdateControl()     ' Update control to reflect changes
    hsbFrame.Max = FrameMax
    If FrameCurrent > FrameMax Then
        Exit Sub
    End If
    hsbFrame.Value = FrameCurrent
    cmbView.ListIndex = ViewCurrent + 1
    cmbMarker.ListIndex = MarkerActive + 1
    If (flgCrosshair) Then
        chkCrosshair.Value = vbChecked
    Else
        chkCrosshair.Value = vbUnchecked
    End If
End Sub

Private Sub GenerateLost(Markerno As Integer, Frameno As Long) ' Generate lost marker data in a period
    ' Validation
    If (Frameno < 0) Or (Frameno > FrameMax) Then Exit Sub
    If (Markers(Markerno).Data(Frameno).valid) Then Exit Sub
    
    Dim LeftFrame As Long, RightFrame As Long   ' Left & Right frame of valid marker data
    LeftFrame = Frameno
    RightFrame = Frameno
    
    ' Find left valid frame no.
    Do While (LeftFrame >= 0)
        If (Markers(Markerno).Data(LeftFrame).valid) Then Exit Do
        LeftFrame = LeftFrame - 1
    Loop
    If (LeftFrame < 0) Then Exit Sub ' No left valid frame, exit
    
    ' Find right valid frame no.
    Do While (RightFrame <= FrameMax)
        If (Markers(Markerno).Data(RightFrame).valid) Then Exit Do
        RightFrame = RightFrame + 1
    Loop
    If (RightFrame > FrameMax) Then Exit Sub ' No right valid frame, exit
    
    ' Generate lost range
    Dim AddX As Double, AddY As Double
    Dim i As Long
    AddX = (Markers(Markerno).Data(RightFrame).X - Markers(Markerno).Data(LeftFrame).X) / (RightFrame - LeftFrame)
    AddY = (Markers(Markerno).Data(RightFrame).Y - Markers(Markerno).Data(LeftFrame).Y) / (RightFrame - LeftFrame)
    For i = (LeftFrame + 1) To (RightFrame - 1)
        Markers(Markerno).Data(i).X = Markers(Markerno).Data(LeftFrame).X + (AddX * (i - LeftFrame))
        Markers(Markerno).Data(i).Y = Markers(Markerno).Data(LeftFrame).Y + (AddY * (i - LeftFrame))
        Markers(Markerno).Data(i).valid = True
    Next i
End Sub

Public Function SetControlEnable(Enable As Boolean) ' Set control to enable/disable
    If (Enable) Then
'        cmdProcessDetect.Enabled = True
        cmdDetectDef.Enabled = True
'        cmdGen.Enabled = True
        cmdLoad.Enabled = True
        cmdSave.Enabled = True
        hsbFrame.Enabled = True
    Else
'        cmdProcessDetect.Enabled = False
        cmdDetectDef.Enabled = False
'        cmdGen.Enabled = False
        cmdLoad.Enabled = False
        cmdSave.Enabled = False
        hsbFrame.Enabled = False
    End If
End Function

' ====================================================================== PUBLIC FUNCTIONS

Public Function GetLastframe() As Long
    ' Validation
    If (Not flgOpenned) Then Exit Function

    GetLastframe = FrameMax
End Function

Public Function GetFramerate() As Long
    ' Validation
    If (Not flgOpenned) Then Exit Function

    GetFramerate = vdoocxVideo.GetFPS
End Function

Public Function GetMarker(Frameno As Long, Markerno As Integer, X As Long, Y As Long) ' Get marker data
'    MarkerAvr(Markerno).SetXY Markers(Markerno).Data(Frameno).X, Markers(Markerno).Data(Frameno).Y
'    X = MarkerAvr(Markerno).X
'    Y = MarkerAvr(Markerno).Y
        X = Markers(Markerno).Data(Frameno).X
        Y = Markers(Markerno).Data(Frameno).Y
        GetMarker = Markers(Markerno).Data(Frameno).valid
End Function

Public Function GetMarkers(Frameno As Long, Markerno As Integer, Color As Integer, X As Long, Y As Long) ' Get marker data
    Dim col As MARKERCOLOR
    If Color = 0 Then
        col = cBlue
    ElseIf Color = 1 Then
        col = cPink
    ElseIf Color = 2 Then
        col = cGreen
    ElseIf Color = 3 Then
        col = cYellow
    End If
    
    If (Markers(Markerno).detectframe = col) Then
'        MarkerAvr(Markerno).SetXY Markers(Markerno).Data(Frameno).X, Markers(Markerno).Data(Frameno).Y
'        X = MarkerAvr(Markerno).X
'        Y = MarkerAvr(Markerno).Y
'        GetMarkers = Markers(Markerno).Data(Frameno).valid
        X = Markers(Markerno).Data(Frameno).X
        Y = Markers(Markerno).Data(Frameno).Y
        GetMarkers = Markers(Markerno).Data(Frameno).valid
    Else
        GetMarkers = False
    End If
End Function

Public Function CheckMarkerCol(Frameno As Long, marker As Integer, Color As Integer)
    Dim col As MARKERCOLOR
    If Color = 0 Then
        col = cBlue
    ElseIf Color = 1 Then
        col = cPink
    ElseIf Color = 2 Then
        col = cGreen
    ElseIf Color = 3 Then
        col = cYellow
    End If
    
    If Markers(marker).detectframe = Color Then
        CheckMarkerCol = True
    Else
        CheckMarkerCol = False
    End If
End Function

Public Function GetNotMarker(Frameno As Long, col As Integer, X As Long, Y As Long) ' Get no marker data
    If NoMarkers(Frameno).Color(col).count <= 0 Then
        GetNotMarker = False
    Else
        X = NoMarkers(Frameno).Color(col).Data(0).X
        Y = NoMarkers(Frameno).Color(col).Data(0).Y
        GetNotMarker = True
    End If
End Function

Public Function GetNotMarkerCount(Frameno As Long, col As Integer)
    GetNotMarkerCount = NoMarkers(Frameno).Color(col).count
End Function

Public Function SetMarker(Frameno As Long, joint As Integer, X As Long, Y As Long)
    Dim mark As Integer
    JointToMarker joint, mark
    If mark >= 0 Then
        Markers(mark).Data(Frameno).valid = True
        Markers(mark).Data(Frameno).X = X
        Markers(mark).Data(Frameno).Y = Y
    End If
End Function

Public Function SetBlob(Frameno As Long, marker As Integer)
    Dim Pt As STR_IMAGECOOR
    
    Pt.X = Markers(Markers(marker).Data(Frameno).near1).Data(Frameno).X
    Pt.Y = Markers(Markers(marker).Data(Frameno).near1).Data(Frameno).Y
    Markers(marker).Data(Frameno).X = Pt.X
    Markers(marker).Data(Frameno).Y = Pt.Y
    Markers(marker).Data(Frameno).valid = True
End Function

Public Function SetNewBlob(Frameno As Long, marker As Integer, X As Long, Y As Long)
    Markers(marker).Data(Frameno).X = X
    Markers(marker).Data(Frameno).Y = Y
    Markers(marker).Data(Frameno).valid = True
End Function

Public Sub NewAverageMarker(ArrSize As Integer, Threshold As Double)    ' Create new average for GetMarker
    Dim i As Integer
    For i = 0 To MARKER_MAX
        MarkerAvr(i).NewAverage ArrSize
        MarkerAvr(i).MoveThreshold = Threshold
    Next i
End Sub

Public Sub GenerateLostMark(Optional FrameStart As Long = -1, Optional FrameStop As Long = -1)  ' Generate lost marker data
    ' Validation
    If (FrameStart < 0) Then FrameStart = 0
    If (FrameStop < 0) Or (FrameStop > FrameMax) Then FrameStop = FrameMax
    
    Dim i As Integer
    Dim f As Long
    Dim A As Long, b As Long
For i = 0 To MARKER_MAX
    A = 0: b = 0
    While A < FrameMax
        If (Markers(i).Data(A).valid) Then
        Else
        End If
        
    Wend
Next i
End Sub

Public Function IsMarkerLost(Markerno As Integer, Optional MaxLost As Long = 0) As Boolean ' Determine if marker lost more than MaxLost
    ' Validation
    If (MaxLost <= 0) Then MaxLost = LOSTMARK_MAX

    Dim i As Long
    Dim count As Long
    i = FrameCurrent
    count = 0
    While (Not Markers(Markerno).Data(i).valid)
        i = i - 1
        count = count + 1
        If (count > MaxLost) Then IsMarkerLost = True: Exit Function
        If (i < 0) Then IsMarkerLost = False: Exit Function
    Wend
    IsMarkerLost = False
End Function

Public Function InitVideo(FileName As String) As Boolean   ' Init video file (AVI)
    If (Not vdoocxVideo.InitFromFile(FileName)) Then InitVideo = False: Exit Function
    flgOpenned = True
    VideoPath = FileName
    FrameMax = vdoocxVideo.GetLen - 1
    FrameCurrent = vdoocxVideo.GetFrameNumber

    ' Allocate data
    Dim i As Integer
    Dim j As Integer
    For i = 0 To MARKER_MAX
        ReDim Markers(i).Data(0 To FrameMax) As MARKER_DATA
        For j = 0 To FrameMax
            Markers(i).Data(j).near1 = -1
            Markers(i).Data(j).near2 = -1
        Next j
    Next i
    
        ' Assign which frame to be detected to find each marker
    Markers(marker.LFHD).detectframe = cPink
    Markers(marker.RFHD).detectframe = cBlue
    Markers(marker.CLAV).detectframe = cPink
    Markers(marker.LSHO).detectframe = cYellow
    Markers(marker.RSHO).detectframe = cGreen
    Markers(marker.LELB).detectframe = cYellow
    Markers(marker.RELB).detectframe = cGreen
    Markers(marker.LWRE).detectframe = cYellow
    Markers(marker.RWRE).detectframe = cGreen
    Markers(marker.STRN).detectframe = cBlue
    Markers(marker.LFWT).detectframe = cPink
    Markers(marker.RFWT).detectframe = cBlue
    Markers(marker.LKNE).detectframe = cPink
    Markers(marker.RKNE).detectframe = cBlue
    Markers(marker.LANK).detectframe = cPink
    Markers(marker.RANK).detectframe = cBlue
    
    Markers(marker.LBHD).detectframe = cPink
    Markers(marker.RBHD).detectframe = cBlue
    Markers(marker.C7).detectframe = cPink
    Markers(marker.T10).detectframe = cBlue
    Markers(marker.LBWT).detectframe = cPink
    Markers(marker.RBWT).detectframe = cBlue
    Markers(marker.LKNI).detectframe = cPink
    Markers(marker.RKNI).detectframe = cBlue
    
    ReDim NoMarkers(0 To FrameMax) As NO_MARKER
    For i = 0 To FrameMax
        ReDim NoMarkers(i).Color(0 To FRAME_MAX) As MARKER_DATA2
        
        For j = 0 To FRAME_MAX
            ReDim NoMarkers(i).Color(j).Data(0 To BLOBDETECT_MAX) As MARKER_DATA
        Next j
    Next i

    For i = 0 To FRAME_MAX
        ReDim ProcessInfo(i).Frame(0 To FrameMax) As PROCESS

        For j = 0 To FrameMax
            ReDim ProcessInfo(i).Frame(j).Blobs(0 To BLOBDETECT_MAX) As F_BLOB
            ReDim ProcessInfo(i).Frame(j).BlobsExt(0 To BLOBDETECT_MAX) As F_BLOB_EXT
        Next j
    Next i

    ProcessInfo(0).Name = "Blue"
    ProcessInfo(1).Name = "Pink"
    ProcessInfo(2).Name = "Green"
    ProcessInfo(3).Name = "Yellow"

    cmbView.AddItem "Original"
    For i = 0 To FRAME_MAX
        cmbView.AddItem ProcessInfo(i).Name
    Next i
    cmbView.ListIndex = 0
    
    vimgFrame = vdoocxVideo.GetColorImageHandle
    ReDim vimgBuffer(0 To FRAME_MAX) As Long
    For i = 0 To FRAME_MAX
        vimgBuffer(i) = vdoocxVideo.GetColorImageHandle
    Next i

    UpdateForm
    UpdateControl
    
    vdoocxVideo.Start
    SeekFrame 0
    InitVideo = True
End Function

Public Sub CloseVideo() ' Close video
    ' Validation
    If (Not flgOpenned) Then Exit Sub
    
    vdoocxVideo.Stop
    
    ' Deallocate data
    Dim i As Integer
    For i = 0 To FRAME_MAX
        vdoocxVideo.ReleaseImageHandle vimgBuffer(i)
    Next i
    vdoocxVideo.ReleaseImageHandle vimgFrame
    
    vdoocxVideo.Close
    flgOpenned = False
End Sub

Public Sub SeekFrame(Optional Frameno As Long = -1, Optional Fast As Boolean = False)  ' Move to a video frame (Default is next frame)
    ' Validation
    If (Not flgOpenned) Then Exit Sub
'    If (Frameno > FrameMax) Then Exit Sub
    If (Frameno < 0) Then Frameno = FrameCurrent + 1
    If (Frameno > FrameMax) Then Frameno = 0
    
    ' Seek frame
    FrameCurrent = Frameno
    vdoocxVideo.Seek FrameCurrent
    
    ' Capture & update image
    vdoocxVideo.Capture (vimgFrame)
    'UpdateControl
    UpdateMarker
    If (Not Fast) Then ProcessImage
    UpdateView
    
    ' Update caption
    Me.Caption = "Camera" + (Trim$(Str$(cams))) + " : " + GetFilename(VideoPath) + " [" + Format$(FrameCurrent, "0") + "/" + Format$(FrameMax, "0") + "]"
End Sub

Public Sub SetActiveMarker(Markerno As Integer)     ' Set current active marker
    ' Validation
    If (Not flgOpenned) Then Exit Sub
    If (Markerno < -1) Or (Markerno > MARKER_MAX) Then Exit Sub
    
    MarkerActive = Markerno
    UpdateMarker
    UpdateControl
End Sub

Public Sub SetCurrentView(Frameno As Integer)   ' Set current view of image
    ' Validation
    If (Not flgOpenned) Then Exit Sub
    If (Frameno < -1) Or (Frameno > FRAME_MAX) Then Exit Sub
    ViewCurrent = Frameno
    UpdateView
    UpdateControl
End Sub

Public Sub ProcessImage()    ' Process image frames
    ' Validation
    If (Not flgOpenned) Then Exit Sub

    Dim i As Integer
    
    FAL_SetImageDimension vdoocxVideo.GetWidth, vdoocxVideo.GetHeight
    For i = 0 To FRAME_MAX
        FAL_HSVThreshold vdoocxVideo.GetDataPointer(vimgFrame), vdoocxVideo.GetDataPointer(vimgBuffer(i)), ProcessInfo(i).Range, ProcessInfo(i).HueOffset
        FAL_PutFloodfillBorder vdoocxVideo.GetDataPointer(vimgBuffer(i))
        If FrameCurrent <= FrameMax Then ProcessInfo(i).Frame(FrameCurrent).Blob_count = FAL_AnalyseBlob2(vdoocxVideo.GetDataPointer(vimgBuffer(i)), ProcessInfo(i).Frame(FrameCurrent).Blobs(0), BLOBDETECT_MAX)
    Next i
End Sub

Public Sub DetectDefault()  ' Detect marker in default gesture by generate last-frame position
    ' Validation
    If (Not flgOpenned) Then Exit Sub

    Dim Lastframe As Long
    If (FrameCurrent = 0) Then Lastframe = FrameCurrent Else Lastframe = FrameCurrent - 1
    
    ' Default Data
    If (cams = 1) Then
        Markers(marker.LFHD).Data(Lastframe).X = 170
        Markers(marker.LFHD).Data(Lastframe).Y = 70
        Markers(marker.RFHD).Data(Lastframe).X = 165
        Markers(marker.RFHD).Data(Lastframe).Y = 70
        Markers(marker.RBHD).Data(Lastframe).X = 155
        Markers(marker.RBHD).Data(Lastframe).Y = 75
        Markers(marker.CLAV).Data(Lastframe).X = 165
        Markers(marker.CLAV).Data(Lastframe).Y = 95
        Markers(marker.LSHO).Data(Lastframe).X = 170
        Markers(marker.LSHO).Data(Lastframe).Y = 95
        Markers(marker.RSHO).Data(Lastframe).X = 165
        Markers(marker.RSHO).Data(Lastframe).Y = 95
        Markers(marker.LELB).Data(Lastframe).X = 183
        Markers(marker.LELB).Data(Lastframe).Y = 105
        Markers(marker.RELB).Data(Lastframe).X = 140
        Markers(marker.RELB).Data(Lastframe).Y = 105
        Markers(marker.LWRE).Data(Lastframe).X = 183
        Markers(marker.LWRE).Data(Lastframe).Y = 150
        Markers(marker.RWRE).Data(Lastframe).X = 140
        Markers(marker.RWRE).Data(Lastframe).Y = 150
        Markers(marker.STRN).Data(Lastframe).X = 165
        Markers(marker.STRN).Data(Lastframe).Y = 100
        Markers(marker.LFWT).Data(Lastframe).X = 172
        Markers(marker.LFWT).Data(Lastframe).Y = 110
        Markers(marker.RFWT).Data(Lastframe).X = 152
        Markers(marker.RFWT).Data(Lastframe).Y = 110
        Markers(marker.LKNE).Data(Lastframe).X = 172
        Markers(marker.LKNE).Data(Lastframe).Y = 145
        Markers(marker.RKNE).Data(Lastframe).X = 150
        Markers(marker.RKNE).Data(Lastframe).Y = 145
        Markers(marker.LANK).Data(Lastframe).X = 170
        Markers(marker.LANK).Data(Lastframe).Y = 185
        Markers(marker.RANK).Data(Lastframe).X = 150
        Markers(marker.RANK).Data(Lastframe).Y = 185
    ElseIf (cams = 2) Then
        Markers(marker.LFHD).Data(Lastframe).X = 155
        Markers(marker.LFHD).Data(Lastframe).Y = 75
        Markers(marker.LBHD).Data(Lastframe).X = 165
        Markers(marker.LBHD).Data(Lastframe).Y = 75
        Markers(marker.RFHD).Data(Lastframe).X = 150
        Markers(marker.RFHD).Data(Lastframe).Y = 70
        Markers(marker.CLAV).Data(Lastframe).X = 155
        Markers(marker.CLAV).Data(Lastframe).Y = 95
        Markers(marker.LSHO).Data(Lastframe).X = 170
        Markers(marker.LSHO).Data(Lastframe).Y = 80
        Markers(marker.RSHO).Data(Lastframe).X = 150
        Markers(marker.RSHO).Data(Lastframe).Y = 85
        Markers(marker.LELB).Data(Lastframe).X = 170
        Markers(marker.LELB).Data(Lastframe).Y = 100
        Markers(marker.RELB).Data(Lastframe).X = 145
        Markers(marker.RELB).Data(Lastframe).Y = 105
        Markers(marker.LWRE).Data(Lastframe).X = 180
        Markers(marker.LWRE).Data(Lastframe).Y = 135
        Markers(marker.RWRE).Data(Lastframe).X = 140
        Markers(marker.RWRE).Data(Lastframe).Y = 150
        Markers(marker.STRN).Data(Lastframe).X = 150
        Markers(marker.STRN).Data(Lastframe).Y = 110
        Markers(marker.LFWT).Data(Lastframe).X = 172
        Markers(marker.LFWT).Data(Lastframe).Y = 110
        Markers(marker.RFWT).Data(Lastframe).X = 150
        Markers(marker.RFWT).Data(Lastframe).Y = 120
        Markers(marker.LKNE).Data(Lastframe).X = 160
        Markers(marker.LKNE).Data(Lastframe).Y = 145
        Markers(marker.RKNE).Data(Lastframe).X = 150
        Markers(marker.RKNE).Data(Lastframe).Y = 145
        Markers(marker.LANK).Data(Lastframe).X = 170
        Markers(marker.LANK).Data(Lastframe).Y = 185
        Markers(marker.RANK).Data(Lastframe).X = 150
        Markers(marker.RANK).Data(Lastframe).Y = 185
    ElseIf (cams = 3) Then
        Markers(marker.LFHD).Data(Lastframe).X = 150
        Markers(marker.LFHD).Data(Lastframe).Y = 75
        Markers(marker.LBHD).Data(Lastframe).X = 160
        Markers(marker.LBHD).Data(Lastframe).Y = 75
        Markers(marker.RBHD).Data(Lastframe).X = 160
        Markers(marker.RBHD).Data(Lastframe).Y = 70
        Markers(marker.C7).Data(Lastframe).X = 160
        Markers(marker.C7).Data(Lastframe).Y = 90
        
        Markers(marker.LSHO).Data(Lastframe).X = 150
        Markers(marker.LSHO).Data(Lastframe).Y = 85
        Markers(marker.RSHO).Data(Lastframe).X = 165
        Markers(marker.RSHO).Data(Lastframe).Y = 85
        Markers(marker.LELB).Data(Lastframe).X = 145
        Markers(marker.LELB).Data(Lastframe).Y = 105
        Markers(marker.RELB).Data(Lastframe).X = 170
        Markers(marker.RELB).Data(Lastframe).Y = 105
        Markers(marker.LWRE).Data(Lastframe).X = 140
        Markers(marker.LWRE).Data(Lastframe).Y = 125
        Markers(marker.RWRE).Data(Lastframe).X = 170
        Markers(marker.RWRE).Data(Lastframe).Y = 125
        
        Markers(marker.T10).Data(Lastframe).X = 160
        Markers(marker.T10).Data(Lastframe).Y = 100
        Markers(marker.LBWT).Data(Lastframe).X = 160
        Markers(marker.LBWT).Data(Lastframe).Y = 115
        Markers(marker.RBWT).Data(Lastframe).X = 165
        Markers(marker.RBWT).Data(Lastframe).Y = 115
        Markers(marker.LKNI).Data(Lastframe).X = 160
        Markers(marker.LKNI).Data(Lastframe).Y = 145
        Markers(marker.RKNI).Data(Lastframe).X = 165
        Markers(marker.RKNI).Data(Lastframe).Y = 145
    ElseIf (cams = 4) Then
        Markers(marker.LBHD).Data(Lastframe).X = 155
        Markers(marker.LBHD).Data(Lastframe).Y = 75
        Markers(marker.RFHD).Data(Lastframe).X = 170
        Markers(marker.RFHD).Data(Lastframe).Y = 75
        Markers(marker.RBHD).Data(Lastframe).X = 160
        Markers(marker.RBHD).Data(Lastframe).Y = 75
        Markers(marker.C7).Data(Lastframe).X = 160
        Markers(marker.C7).Data(Lastframe).Y = 90
        
        Markers(marker.LSHO).Data(Lastframe).X = 155
        Markers(marker.LSHO).Data(Lastframe).Y = 85
        Markers(marker.RSHO).Data(Lastframe).X = 170
        Markers(marker.RSHO).Data(Lastframe).Y = 85
        Markers(marker.LELB).Data(Lastframe).X = 145
        Markers(marker.LELB).Data(Lastframe).Y = 105
        Markers(marker.RELB).Data(Lastframe).X = 175
        Markers(marker.RELB).Data(Lastframe).Y = 100
        Markers(marker.LWRE).Data(Lastframe).X = 145
        Markers(marker.LWRE).Data(Lastframe).Y = 120
        Markers(marker.RWRE).Data(Lastframe).X = 180
        Markers(marker.RWRE).Data(Lastframe).Y = 120
        
        Markers(marker.T10).Data(Lastframe).X = 155
        Markers(marker.T10).Data(Lastframe).Y = 105
        Markers(marker.LBWT).Data(Lastframe).X = 155
        Markers(marker.LBWT).Data(Lastframe).Y = 110
        Markers(marker.RBWT).Data(Lastframe).X = 160
        Markers(marker.RBWT).Data(Lastframe).Y = 120
        Markers(marker.LKNI).Data(Lastframe).X = 150
        Markers(marker.LKNI).Data(Lastframe).Y = 145
        Markers(marker.RKNI).Data(Lastframe).X = 160
        Markers(marker.RKNI).Data(Lastframe).Y = 145
    End If
    DetectMarker True
End Sub

Public Sub DetectMarker(Optional DetectDefault As Boolean = False)   ' Detect all markers (Last frame data must be all valid)
    Dim ind As Long
    Dim i As Integer
    Dim Lastframe As Long
    Dim blob As F_BLOB
    Dim tmppt As STR_IMAGECOOR
    Dim dx As Double, dy As Double, dist As Double
    Dim j As Integer
    Dim NoMark As Boolean
    Dim k As Integer
    Dim col As MARKERCOLOR
    If FrameCurrent > FrameMax Then
        Exit Sub
    End If
    ' Get last valid frame
For i = 0 To MARKER_MAX
    If (FrameCurrent = 0) Then
        Lastframe = FrameCurrent
    Else
        Dim count As Long
        Lastframe = FrameCurrent - 1
        Do While (Not Markers(i).Data(Lastframe).valid)
            Lastframe = Lastframe - 1
            count = count + 1
            If (count > LOSTMARK_MAX) Then Lastframe = FrameCurrent - 1: Exit Do ' Force use invalid data
            If Lastframe < 0 Then
                Lastframe = 0
                Exit Do
            End If
        Loop
    End If
    
    ' Detect all marker
If (DetectDefault) Or (Markers(i).Data(Lastframe).valid) Then  ' Process only if detectdefault or valid
    FAL_SetBlobData ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).Blobs(0), ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).Blob_count
    FAL_BlobMoveFirst
    
    ' Detect marker's position on current frame related to previous frame position
    ind = FAL_BlobGetDataSNR(blob, ProcessInfo(Markers(i).detectframe).blob_min, ProcessInfo(Markers(i).detectframe).blob_max, Markers(i).Data(Lastframe).X, vdoocxVideo.GetHeight - Markers(i).Data(Lastframe).Y - 1, MOVEMENT_RADIUS)
    If (ind >= 0) Then
        tmppt.X = (blob.xmin + blob.xmax) / 2
        tmppt.Y = vdoocxVideo.GetHeight - ((blob.ymin + blob.ymax) / 2) - 1
        dx = (tmppt.X - Markers(i).Data(Lastframe).X)
        dy = (tmppt.Y - Markers(i).Data(Lastframe).Y)
        dist = Sqr((dx * dx) + (dy * dy))
        
        If (blob.ffalse <> 0) Then
            ' If this blob has been detected as other, compare and choose the nearest one
            If (dist < ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).BlobsExt(ind).dist) Then
                ' This one is nearer than the old one
                Markers(ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).BlobsExt(ind).detectas).Data(FrameCurrent).valid = False ' Set the old invalid

                ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).BlobsExt(ind).detectas = i
                ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).BlobsExt(ind).dist = dist
                Markers(i).Data(FrameCurrent).X = tmppt.X
                Markers(i).Data(FrameCurrent).Y = tmppt.Y
                Markers(i).Data(FrameCurrent).valid = True
            Else
                ' This one is not nearer than the old one
                Markers(i).Data(FrameCurrent).valid = False
            End If
        Else
            ' This blob is free
            FAL_BlobMarkFalse ind

            ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).BlobsExt(ind).detectas = i
            ProcessInfo(Markers(i).detectframe).Frame(FrameCurrent).BlobsExt(ind).dist = dist
            Markers(i).Data(FrameCurrent).X = tmppt.X
            Markers(i).Data(FrameCurrent).Y = tmppt.Y
            Markers(i).Data(FrameCurrent).valid = True
        End If
    Else
        ' Cannot detected
        Markers(i).Data(FrameCurrent).valid = False
    End If
    FAL_UnsetBlobData
End If

Next i

    For i = 0 To FRAME_MAX
        Dim X As Long
        Dim Y As Long
        
        If i = 0 Then
            col = cBlue
        ElseIf i = 1 Then
            col = cPink
        ElseIf i = 2 Then
            col = cGreen
        ElseIf i = 3 Then
            col = cYellow
        End If

        FAL_SetBlobData ProcessInfo(i).Frame(FrameCurrent).Blobs(0), ProcessInfo(i).Frame(FrameCurrent).Blob_count
        FAL_BlobMoveFirst
        ind = FAL_BlobGetNextS(blob, ProcessInfo(Markers(i).detectframe).blob_min, ProcessInfo(Markers(i).detectframe).blob_max)
        Do While ind >= 0
            tmppt.X = (blob.xmin + blob.xmax) / 2
            tmppt.Y = vdoocxVideo.GetHeight - ((blob.ymin + blob.ymax) / 2) - 1
            NoMark = True
            For j = 0 To MARKER_MAX
                If (Markers(j).detectframe = col) And (Markers(j).Data(FrameCurrent).valid) Then
                If (Markers(j).Data(FrameCurrent).X = tmppt.X) And (Markers(j).Data(FrameCurrent).Y = tmppt.Y) Then
                    NoMark = False
                    Exit For
                End If
                End If
            Next j
            j = j - 1
            If NoMark Then
                NoMarkers(FrameCurrent).Color(i).Data(NoMarkers(FrameCurrent).Color(i).count).X = tmppt.X
                NoMarkers(FrameCurrent).Color(i).Data(NoMarkers(FrameCurrent).Color(i).count).Y = tmppt.Y
                NoMarkers(FrameCurrent).Color(i).Data(NoMarkers(FrameCurrent).Color(i).count).valid = True
                NoMarkers(FrameCurrent).Color(i).count = NoMarkers(FrameCurrent).Color(i).count + 1
            End If
            FAL_BlobMarkFalse ind
            ind = FAL_BlobGetNextS(blob, ProcessInfo(Markers(i).detectframe).blob_min, ProcessInfo(Markers(i).detectframe).blob_max)
        Loop
    FAL_UnsetBlobData
    Next i

    UpdateMarker
End Sub

Public Function DelNotMarker(Frameno As Long, col As Integer)
    Dim i As Integer
    Dim j As Integer
    NoMarkers(Frameno).Color(col).count = NoMarkers(Frameno).Color(col).count - 1
    For i = 0 To NoMarkers(Frameno).Color(col).count - 1
        j = i + 1
        NoMarkers(Frameno).Color(col).Data(i).valid = NoMarkers(Frameno).Color(col).Data(j).valid
        NoMarkers(Frameno).Color(col).Data(i).X = NoMarkers(Frameno).Color(col).Data(j).X
        NoMarkers(Frameno).Color(col).Data(i).Y = NoMarkers(Frameno).Color(col).Data(j).Y
    Next i
    
End Function

Public Function DelMarker(Frameno As Long, mark As Integer)
    Markers(mark).Data(Frameno).valid = False
End Function

Public Function DetectLostMarker() As Integer  ' Return lost marker on current frame
    Dim i As Integer
    Dim count As Long
    For i = 0 To MARKER_MAX
        If (Not Markers(i).Data(FrameCurrent).valid) Then
            DetectLostMarker = i
            Exit Function
        End If
    Next i
    DetectLostMarker = -1
End Function

Public Sub GenerateLostData()   ' Generate lost marker if possible
    ' Validation
    If (Not flgOpenned) Then Exit Sub

    Dim m As Integer, i As Long
    For m = 0 To MARKER_MAX
        For i = 0 To FrameMax
            If (Not Markers(m).Data(i).valid) Then GenerateLost m, i
        Next i
    Next m
End Sub

' ====================================================================== EVENT HANDLES
Private Sub chkCrosshair_Click()
    If (chkCrosshair.Value = vbChecked) Then
        flgCrosshair = True
    Else
        flgCrosshair = False
    End If
    UpdateMarker
End Sub

Private Sub cmbMarker_Click()
    SetActiveMarker cmbMarker.ListIndex - 1
End Sub

Private Sub cmbView_Click() ' Change view
    SetCurrentView cmbView.ListIndex - 1
End Sub

Private Sub cmdDetectDef_Click()
    ProcessImage
    DetectDefault
End Sub

Private Sub cmdGen_Click()
    GenerateLostData
End Sub

Private Sub cmdLoad_Click() ' Load marker data from file
    With cdlOpenSave
        .DialogTitle = "Load Marker Data"
        .Filter = "Marker Data File (*.mkd)|*.mkd|All files|*.*"
        .flags = &H4 + &H800 + &H1000
        .MaxFileSize = 254
        .FileName = ""
    End With
    cdlOpenSave.ShowOpen
    
    ' Load marker
    If (Trim$(cdlOpenSave.FileName) <> "") Then
        Dim m As Integer, f As Long
        Open cdlOpenSave.FileName For Random As #1
            For m = 0 To MARKER_MAX
                For f = 0 To FrameMax
                    Get #1, , Markers(m).Data(f)
                Next f
            Next m
        Close #1
        UpdateMarker
    End If
End Sub

' Play video
Public Sub cmdPlay_Click()
    tmrPlay.Interval = 1000 \ vdoocxVideo.GetFPS
    If (tmrPlay.Enabled) Then
        SetControlEnable True
'        cmdStart.Enabled = True
'        cmdStop.Enabled = True
        tmrPlay.Enabled = False
    Else
        SetControlEnable False
'        cmdStart.Enabled = False
'        cmdStop.Enabled = False
        tmrPlay.Enabled = True
    End If
    UpdateControl
End Sub

Private Sub cmdProcessDetect_Click()    ' Process & detect
    ProcessImage
    DetectMarker
End Sub

Private Sub cmdSave_Click() ' Save marker data to file
    With cdlOpenSave
        .DialogTitle = "Save Marker Data"
        .DefaultExt = ".mkd"
        .Filter = "Marker Data File (*.mkd)|*.mkd|All files|*.*"
        .flags = &H2000 + &H2 + &H800
        .MaxFileSize = 254
        .FileName = ""
    End With
    cdlOpenSave.ShowSave
    
    ' Save marker
    If (Trim$(cdlOpenSave.FileName) <> "") Then
        Dim m As Integer, f As Long
        Open cdlOpenSave.FileName For Random As #1
            For m = 0 To MARKER_MAX
                For f = 0 To FrameMax
                    Put #1, , Markers(m).Data(f)
                Next f
            Next m
        Close #1
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    If (KeyAscii = 27) Then ' ESC => Reset markers
        If (MsgBox("Are you sure to reset all marker data?", vbExclamation + vbYesNo) = vbNo) Then Exit Sub
    
        Dim i As Long, m As Integer
        For m = 0 To MARKER_MAX
            For i = 0 To FrameMax
                Markers(m).Data(i).valid = False
            Next i
        Next m
        UpdateMarker
    End If
End Sub

Private Sub Form_Load()
    Dim i As Integer

    ' Init controls
    vdoocxVideo.Mode = 1    ' AVI Mode
    
    ' Init variables
    flgOpenned = False
    flgToolbar = True
    flgCrosshair = True
    flgProcess = False
    MarkerActive = -1
    ViewCurrent = -1
    ReDim Markers(0 To MARKER_MAX) As MARKER_GLOBAL
'    ReDim NoMarkers(0 To FrameMax) As NO_MARKER
    ReDim MarkerAvr(0 To MARKER_MAX) As clsIMAGECOOR
    For i = 0 To MARKER_MAX
        Set MarkerAvr(i) = New clsIMAGECOOR
    Next i
    
    ' Init controls
    cmbMarker.AddItem "None"
    For i = 0 To MARKER_MAX
        cmbMarker.AddItem MARKER_NAME(i)
    Next i
    cmbMarker.ListIndex = 0
    
'    ' Assign which frame to be detected to find each marker
'    Markers(marker.LFHD).detectframe = cPink
'    Markers(marker.RFHD).detectframe = cBlue
'    Markers(marker.CLAV).detectframe = cPink
'    Markers(marker.LSHO).detectframe = cYellow
'    Markers(marker.RSHO).detectframe = cGreen
'    Markers(marker.LELB).detectframe = cYellow
'    Markers(marker.RELB).detectframe = cGreen
'    Markers(marker.LWRE).detectframe = cYellow
'    Markers(marker.RWRE).detectframe = cGreen
'    Markers(marker.STRN).detectframe = cBlue
'    Markers(marker.LFWT).detectframe = cPink
'    Markers(marker.RFWT).detectframe = cBlue
'    Markers(marker.LKNE).detectframe = cPink
'    Markers(marker.RKNE).detectframe = cBlue
'    Markers(marker.LANK).detectframe = cPink
'    Markers(marker.RANK).detectframe = cBlue
'
'    Markers(marker.LBHD).detectframe = cPink
'    Markers(marker.RBHD).detectframe = cBlue
'    Markers(marker.C7).detectframe = cPink
'    Markers(marker.T10).detectframe = cBlue
'    Markers(marker.LBWT).detectframe = cPink
'    Markers(marker.RBWT).detectframe = cBlue
'    Markers(marker.LKNI).detectframe = cPink
'    Markers(marker.RKNI).detectframe = cBlue
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CloseVideo
End Sub

Private Sub hsbFrame_Change()   ' Goto frame
    SeekFrame hsbFrame.Value
End Sub

Private Sub hsbFrame_Scroll()
    SeekFrame hsbFrame.Value, True
End Sub

Private Sub picImage_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)   ' Update marker position
    If (Button = vbLeftButton) Then
        ' Validation
        If (Not flgOpenned) Then Exit Sub
        ' If press at a marker then set it to active
        Dim i As Integer
        Dim selmark As Integer
        selmark = -1
        For i = 0 To MARKER_MAX
            If (Markers(i).Data(FrameCurrent).valid) Then
                If (X >= (Markers(i).Data(FrameCurrent).X - MARKER_SIZE)) And (X <= (Markers(i).Data(FrameCurrent).X + MARKER_SIZE)) Then
                    If (Y >= (Markers(i).Data(FrameCurrent).Y - MARKER_SIZE)) And (Y <= (Markers(i).Data(FrameCurrent).Y + MARKER_SIZE)) Then
                        selmark = i
                        Exit For
                    End If
                End If
            End If
        Next i
        ' If don't click on a marker
        If (selmark < 0) Then
            ' Use current active marker
            If (MarkerActive < 0) Then Exit Sub
        Else
            ' Click on a marker
            MarkerActive = selmark
        End If
        flgCrosshair = True
    
        Markers(MarkerActive).Data(FrameCurrent).valid = True
        Markers(MarkerActive).Data(FrameCurrent).X = X - MARKER_SIZE
        Markers(MarkerActive).Data(FrameCurrent).Y = Y - MARKER_SIZE
    
        UpdateMarker
    ElseIf (Button = vbRightButton) Then
        ' Deselect marker
        SetActiveMarker -1

    End If
End Sub

Private Sub picImage_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)   ' Update marker position
    If (Button = vbLeftButton) Then
        ' Validation
        If (Not flgOpenned) Then Exit Sub
        If (MarkerActive < 0) Or (MarkerActive > MARKER_MAX) Then Exit Sub
        
        Markers(MarkerActive).Data(FrameCurrent).X = X - MARKER_SIZE
        Markers(MarkerActive).Data(FrameCurrent).Y = Y - MARKER_SIZE
    
        UpdateMarker
    End If
End Sub

Private Sub picImage_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (Button = vbLeftButton) Then
        UpdateControl
    End If
End Sub

Private Sub picToolbar_Resize() ' Resize controls on toolbar
    hsbFrame.width = picToolbar.width - 22
End Sub

Private Sub tmrPlay_Timer() ' Play video (loop infinity)
    If (FrameCurrent >= FrameMax) Then
        SeekFrame 0
    Else
        SeekFrame
    End If
End Sub
