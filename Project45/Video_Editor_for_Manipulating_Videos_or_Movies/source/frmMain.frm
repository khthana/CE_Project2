VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MPEG_Editor"
   ClientHeight    =   8505
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   6555
   DrawMode        =   1  'Blackness
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MousePointer    =   99  'Custom
   ScaleHeight     =   8505
   ScaleWidth      =   6555
   Begin VB.CommandButton cmdCut 
      Caption         =   "cut"
      Height          =   375
      Left            =   4320
      TabIndex        =   23
      Top             =   7440
      Width           =   855
   End
   Begin VB.CommandButton cmdTrimStop 
      Caption         =   "Trim Stop"
      Height          =   615
      Left            =   5280
      TabIndex        =   22
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton cmdTrimStart 
      Caption         =   "Trim Start"
      Height          =   615
      Left            =   3960
      TabIndex        =   21
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton cmdFwdFrame 
      Caption         =   ">"
      Height          =   375
      Left            =   3480
      TabIndex        =   20
      Top             =   7440
      Width           =   735
   End
   Begin VB.CommandButton cmdBackFrame 
      Caption         =   "<"
      Height          =   375
      Left            =   2640
      TabIndex        =   19
      Top             =   7440
      Width           =   735
   End
   Begin VB.CommandButton cmdCapture 
      Caption         =   "Capture"
      Height          =   615
      Left            =   2640
      TabIndex        =   18
      Top             =   6720
      Width           =   1215
   End
   Begin VB.PictureBox picPreview 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      DrawMode        =   1  'Blackness
      FillStyle       =   0  'Solid
      ForeColor       =   &H80000008&
      HasDC           =   0   'False
      Height          =   5535
      Left            =   0
      MouseIcon       =   "frmMain.frx":0000
      MousePointer    =   99  'Custom
      ScaleHeight     =   5535
      ScaleWidth      =   6555
      TabIndex        =   17
      Top             =   0
      Width           =   6555
   End
   Begin VB.Timer tmrTimer 
      Left            =   1920
      Top             =   8760
   End
   Begin MSComctlLib.Slider ctrlSlider 
      Height          =   375
      Left            =   120
      TabIndex        =   12
      Top             =   8040
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   661
      _Version        =   393216
      SelectRange     =   -1  'True
      TickStyle       =   3
   End
   Begin VB.Frame frameInformation 
      Caption         =   "Information"
      Height          =   1215
      Left            =   0
      TabIndex        =   5
      Top             =   6600
      Width           =   2535
      Begin VB.Label lblFrameCount 
         Caption         =   "0"
         Height          =   255
         Left            =   1920
         TabIndex        =   16
         Top             =   840
         Width           =   375
      End
      Begin VB.Label Label9 
         Caption         =   "/"
         Height          =   255
         Left            =   1440
         TabIndex        =   15
         Top             =   840
         Width           =   255
      End
      Begin VB.Label lblFrameValue 
         Caption         =   "0"
         Height          =   255
         Left            =   960
         TabIndex        =   14
         Top             =   840
         Width           =   615
      End
      Begin VB.Label lblFrame 
         Caption         =   "Frame:"
         Height          =   255
         Left            =   360
         TabIndex        =   13
         Top             =   840
         Width           =   615
      End
      Begin VB.Label lblTimeCount 
         Caption         =   "0"
         Height          =   255
         Left            =   1920
         TabIndex        =   11
         Top             =   600
         Width           =   495
      End
      Begin VB.Label Label5 
         Caption         =   "/"
         Height          =   255
         Left            =   1440
         TabIndex        =   10
         Top             =   600
         Width           =   135
      End
      Begin VB.Label lblTimeValue 
         Caption         =   "0"
         Height          =   255
         Left            =   960
         TabIndex        =   9
         Top             =   600
         Width           =   495
      End
      Begin VB.Label lblTime 
         Caption         =   "Time:"
         Height          =   255
         Left            =   360
         TabIndex        =   8
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblFPSValue 
         Caption         =   "0"
         Height          =   255
         Left            =   960
         TabIndex        =   7
         Top             =   360
         Width           =   495
      End
      Begin VB.Label lblFPS 
         Caption         =   "FPS:"
         Height          =   255
         Left            =   360
         TabIndex        =   6
         Top             =   360
         Width           =   375
      End
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      Height          =   615
      Left            =   5280
      TabIndex        =   3
      Top             =   5760
      Width           =   1215
   End
   Begin VB.CommandButton cmdPause 
      Caption         =   "Pause"
      Height          =   615
      Left            =   3960
      TabIndex        =   2
      Top             =   5760
      Width           =   1215
   End
   Begin VB.CommandButton cmdPlay 
      Caption         =   "Play"
      Height          =   615
      Left            =   2640
      TabIndex        =   1
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Frame frameVolume 
      Caption         =   "Volume"
      Height          =   855
      Left            =   0
      TabIndex        =   0
      Top             =   5640
      Width           =   2535
      Begin MSComctlLib.Slider slVolume 
         Height          =   495
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   873
         _Version        =   393216
         LargeChange     =   400
         SmallChange     =   100
         Min             =   -2000
         Max             =   15
         TickFrequency   =   400
      End
   End
   Begin MSComDlg.CommonDialog ctrlCommonDialog 
      Left            =   2400
      Top             =   8760
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open..."
      End
      Begin VB.Menu MnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Option Base 0
Option Compare Text

Private m_nFrameCount As Long                   'evaluates to the number of frames in the current clip
Private m_boolDirty As Boolean                  'evaluates to true if the UI needs repainted,
Private m_bstrFileName As String                'Loaded Filename
Private m_boolLoaded As Boolean                 'evaluates to true if we have anything loaded
Private m_dblRunLength As Double                'Duration in seconds
Private m_dblStartPosition As Double            'Start position in seconds
Private m_boolVideoRunning As Boolean           'Flag used to trigger clock
Private m_dblFPS As Double                      'frames per second
Private m_bstrDot As String

Private m_objMediaDet As MediaDet               'evaluates to a media detector object
Private m_objBasicAudio  As IBasicAudio         'Basic Audio Object
Private m_objBasicVideo As IBasicVideo          'Basic Video Object
Private m_objMediaEvent As IMediaEvent          'MediaEvent Object
Private m_objVideoWindow As IVideoWindow        'VideoWindow Object
Private m_objMediaControl As IMediaControl      'MediaControl Object
Private m_objMediaPosition As IMediaPosition    'MediaPosition Object
Private Const POSTER_FRAME_FILENAME As String = "bitmap.bmp"   ' filename to write out poster frames

            Private Sub cmdBackFrame_Click()
            Dim v As Long
            On Local Error GoTo ErrLine
            
            v = CLng(ctrlSlider.Value)
            v = (v - 1): If v < 0 Then v = 0
            ctrlSlider.Value = v: m_boolDirty = True  'reset to dirty
            lblFrameValue.Caption = CStr(Trim(Str(ctrlSlider.Value)))
            If m_dblFPS <> 0 Then lblTimeValue.Caption = CStr(Trim(Str(Round(ctrlSlider.Value / m_dblFPS, 2))))
            m_objMediaPosition.CurrentPosition = GetCurrentPos
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub cmdCapture_Click()
            On Local Error GoTo ErrLine
            
            'setup the slider
            If ctrlSlider.Value > ctrlSlider.SelStart Then
                ctrlSlider.SelStart = ctrlSlider.Value
                ctrlSlider.SelLength = 0
            Else: ctrlSlider.SelStart = ctrlSlider.Value
            End If
            
            'write bitmap file
            m_objMediaDet.WriteBitmapBits GetCurrentPos, m_objBasicVideo.VideoWidth, m_objBasicVideo.VideoHeight, "caption.bmp" 'GetTempDirectory + POSTER_FRAME_FILENAME
            
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub cmdFwdFrame_Click()
            Dim v As Long
            On Local Error GoTo ErrLine
            
            v = CLng(ctrlSlider.Value): v = (v + 1)
            If v > m_nFrameCount Then v = m_nFrameCount
            ctrlSlider.Value = v: m_boolDirty = True 'reset to dirty
            lblFrameValue.Caption = CStr(Trim(Str(ctrlSlider.Value)))
            If m_dblFPS <> 0 Then lblTimeValue.Caption = CStr(Trim(Str(Round(ctrlSlider.Value / m_dblFPS, 2))))
            m_objMediaPosition.CurrentPosition = GetCurrentPos
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub


            Private Sub cmdTrimStart_Click()
            
            'setup the slider
            If ctrlSlider.Value > ctrlSlider.SelStart Then
                ctrlSlider.SelStart = ctrlSlider.Value
                ctrlSlider.SelLength = 0
            Else: ctrlSlider.SelStart = ctrlSlider.Value
            End If
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub cmdTrimStop_Click()
            
            'setup the slider
            If ctrlSlider.Value < ctrlSlider.SelStart Then
                ctrlSlider.SelStart = ctrlSlider.Value
                ctrlSlider.SelLength = 0
            Else
                ctrlSlider.SelLength = ctrlSlider.Value - ctrlSlider.SelStart
            End If
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub cmdCut_Click()
            
            Dim dblPosition As Double
            Dim dblDuration As Double
            Dim dblStartTime As Double
            Dim dblStopTime As Double
            Dim bstrDot, DotName, bstrCutName As String
            Dim DotPos, LenFileName, NumExtension As Long
            
            Dim objMediaEvent As IMediaEvent
            Dim objMediaPosition As IMediaPosition
            Dim objFilterGraphManager As FilgraphManager
            
            Dim objTimeline As AMTimeline
            Dim objSourceObj As AMTimelineObj
            Dim objTrackObject As AMTimelineObj
            Dim objAudioGroupObj As AMTimelineObj
            Dim objVideoGroupObject As AMTimelineObj
            
            Dim objSource As AMTimelineSrc
            Dim objTrack As AMTimelineTrack
            Dim objAudioGroup As AMTimelineGroup
            Dim objVideoGroup As AMTimelineGroup
            Dim objAudioComposition As AMTimelineComp
            Dim objVideoComposition As AMTimelineComp
            Dim objSmartRenderEngine As New SmartRenderEngine
            On Local Error GoTo ErrLine
                        
            bstrDot = "."
            DotPos = InStrRev(ctrlCommonDialog.FileName, bstrDot, , 1)
            LenFileName = Len(ctrlCommonDialog.FileName)
            NumExtension = LenFileName - DotPos + 1
            DotName = Right(ctrlCommonDialog.FileName, NumExtension)
            bstrCutName = Left$(ctrlCommonDialog.FileName, Len(ctrlCommonDialog.FileName) - 5) + "_Edit" + DotName
            
            'disable the form
            Call DisableEverything
            
            
            'instantiate a timeline
            Set objTimeline = New AMTimeline
            'video
            'create an empty node
            objTimeline.CreateEmptyNode objVideoGroupObject, TIMELINE_MAJOR_TYPE_GROUP
            'derive the video group
            Set objVideoGroup = objVideoGroupObject
            'set the media type
            objVideoGroup.SetMediaTypeForVB 0
            'append the video
            objTimeline.AddGroup objVideoGroup
            
            
            'create an empty node
            objTimeline.CreateEmptyNode objTrackObject, TIMELINE_MAJOR_TYPE_TRACK
            'obtain a composition
            Set objVideoComposition = objVideoGroup
            'inset the track
            objVideoComposition.VTrackInsBefore objTrackObject, -1
            'derive the track object
            Set objTrack = objTrackObject
            
            'create an empty node
            objTimeline.CreateEmptyNode objSourceObj, TIMELINE_MAJOR_TYPE_SOURCE
            'derive the source
            Set objSource = objSourceObj
            
            'duration times
            If m_dblFPS > 0 Then
               dblDuration = ctrlSlider.SelLength / m_dblFPS
               dblStartTime = ctrlSlider.SelStart / m_dblFPS
               dblStopTime = dblStartTime + dblDuration
            End If
            
            'verify start/stop times
            If dblStopTime = 0 Then
               dblStopTime = 1
            ElseIf dblStartTime = dblStopTime Then
               dblStopTime = dblStartTime + 1
            End If
            
            'set the start/stop times
            objSourceObj.SetStartStop2 0, dblDuration
            objSource.SetMediaTimes2 dblStartTime, dblStopTime
            objSource.SetMediaName m_bstrFileName
            'append the source clip
            objTrack.SrcAdd objSourceObj
            
            'audio
            'create an empty
            objTimeline.CreateEmptyNode objAudioGroupObj, TIMELINE_MAJOR_TYPE_GROUP
            'derive the audio
            Set objAudioGroup = objAudioGroupObj
            'set the media type
            objAudioGroup.SetMediaTypeForVB 1
            'append the group
            objTimeline.AddGroup objAudioGroup
              
            'create an empty node
            objTimeline.CreateEmptyNode objTrackObject, TIMELINE_MAJOR_TYPE_TRACK
            'derive a composition
            Set objAudioComposition = objAudioGroup
            'insetr the track
            objAudioComposition.VTrackInsBefore objTrackObject, -1
            'derive a track
            Set objTrack = objTrackObject
              
            'create an empty node
            objTimeline.CreateEmptyNode objSourceObj, TIMELINE_MAJOR_TYPE_SOURCE
            'derive a source
            Set objSource = objSourceObj
            'set the start/stop times
            objSourceObj.SetStartStop2 0, dblDuration
            objSource.SetMediaTimes2 dblStartTime, dblStopTime
            objSource.SetMediaName m_bstrFileName
            'add the source
            objTrack.SrcAdd objSourceObj
            
            
            ' set the recompression format
            objVideoGroup.SetRecompFormatFromSource objSource
            'set the timeline
            objSmartRenderEngine.SetTimelineObject objTimeline
            'connect-up
            objSmartRenderEngine.ConnectFrontEnd
            'obtain a reference
            objSmartRenderEngine.GetFilterGraph objFilterGraphManager
            Dim m_bstr As String
            'm_bstr = Right$(m_bstrFileName, 4)
            AddFileWriterAndMux objFilterGraphManager, bstrCutName
            'render the output pins
            RenderGroupPins objSmartRenderEngine, objTimeline
            'run the graph, create file
            objFilterGraphManager.Run
            'obtain a media event
            Set objMediaEvent = objFilterGraphManager
            'obtain the position
            Set objMediaPosition = objFilterGraphManager
            
            
Cleanup:
            cmdCut.Enabled = True: Call EnableEverything
            ctrlSlider.SelLength = 0
            'scrap the render engine
            If Not objSmartRenderEngine Is Nothing Then objSmartRenderEngine.ScrapIt
            'clean-up & dereference quartz object(s)
            If Not objMediaEvent Is Nothing Then Set objMediaEvent = Nothing
            If Not objMediaPosition Is Nothing Then Set objMediaPosition = Nothing
            If Not objFilterGraphManager Is Nothing Then Set objFilterGraphManager = Nothing
            'clean-up & dereference dexter timeline object(s)
            If Not objTimeline Is Nothing Then Set objTimeline = Nothing
            If Not objSourceObj Is Nothing Then Set objSourceObj = Nothing
            If Not objTrackObject Is Nothing Then Set objTrackObject = Nothing
            If Not objSourceObj Is Nothing Then Set objSourceObj = Nothing
            If Not objTrackObject Is Nothing Then Set objTrackObject = Nothing
            If Not objAudioGroupObj Is Nothing Then Set objAudioGroupObj = Nothing
            If Not objVideoGroupObject Is Nothing Then Set objVideoGroupObject = Nothing
            'clean-up & dereference dexter timeline object(s)
            If Not objTrack Is Nothing Then Set objTrack = Nothing
            If Not objSource Is Nothing Then Set objSource = Nothing
            If Not objAudioGroup Is Nothing Then Set objAudioGroup = Nothing
            If Not objVideoGroup Is Nothing Then Set objVideoGroup = Nothing
            If Not objAudioComposition Is Nothing Then Set objAudioComposition = Nothing
            If Not objVideoComposition Is Nothing Then Set objVideoComposition = Nothing
            If Not objSmartRenderEngine Is Nothing Then Set objSmartRenderEngine = Nothing
            Exit Sub
            
ErrLine:    Exit Sub
            End Sub

            Private Sub Form_Load()
            On Local Error GoTo ErrLine
        
            fMainForm.ScaleMode = 3
            Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
            Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
            Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
            Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
    
            m_boolVideoRunning = False
            tmrTimer.Interval = 250
            ctrlSlider.Enabled = False
            picPreview.Enabled = False
            cmdPlay.Enabled = False
            cmdPause.Enabled = False
            cmdStop.Enabled = False
            cmdCapture.Enabled = False
            cmdTrimStart.Enabled = False
            cmdTrimStop.Enabled = False
            cmdFwdFrame.Enabled = False
            cmdBackFrame.Enabled = False
            cmdCut.Enabled = False
            Exit Sub
    
ErrLine:
            Err.Clear
            Exit Sub
            End Sub


            Private Sub Form_Unload(Cancel As Integer)
            Dim i As Integer
            On Local Error GoTo ErrLine
        
            'stop playback
            m_boolVideoRunning = False
    
            'cleanup media control
            If Not m_objMediaControl Is Nothing Then
            m_objMediaControl.Stop
            End If
            If Not m_objVideoWindow Is Nothing Then
                m_objVideoWindow.Left = Screen.Width * 8
                m_objVideoWindow.Height = Screen.Height * 8
                m_objVideoWindow.Owner = 0          'sets the Owner to NULL
            End If
    
            'clean-up & dereference
            If Not m_objBasicAudio Is Nothing Then Set m_objBasicAudio = Nothing
            If Not m_objBasicVideo Is Nothing Then Set m_objBasicVideo = Nothing
            If Not m_objMediaControl Is Nothing Then Set m_objMediaControl = Nothing
            If Not m_objVideoWindow Is Nothing Then Set m_objVideoWindow = Nothing
            If Not m_objMediaPosition Is Nothing Then Set m_objMediaPosition = Nothing

            'close all sub forms
            For i = Forms.Count - 1 To 1 Step -1
                Unload Forms(i)
            Next
            If Me.WindowState <> vbMinimized Then
                SaveSetting App.Title, "Settings", "MainLeft", Me.Left
                SaveSetting App.Title, "Settings", "MainTop", Me.Top
                SaveSetting App.Title, "Settings", "MainWidth", Me.Width
                SaveSetting App.Title, "Settings", "MainHeight", Me.Height
            End If
            Exit Sub
        
ErrLine:
            Err.Clear
            Exit Sub
            End Sub



            Private Sub mnuFileExit_Click()
            On Local Error GoTo ErrLine
            'unload the form
            Unload Me
            Exit Sub
        
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub mnuFileOpen_Click()
            Dim sFile As String
            Dim objMediaDet As MediaDet
            On Local Error GoTo ErrLine
        
            Call Form_Unload(True)

            With ctrlCommonDialog
                .DialogTitle = "Open"
                .CancelError = False
                'ToDo: set the flags and attributes of the common dialog control
                .Filter = "Movie files (mpeg) (*.mpg;*.mpeg;*.m2v;*.avi)|*.mpg;*.mpeg;*.m2v;*.avi"
                .ShowOpen
                If Len(.FileName) = 0 Then
                    Exit Sub
                End If
                sFile = .FileName
            End With
        
            Set objMediaDet = New MediaDet 'instantiate
            objMediaDet.FileName = ctrlCommonDialog.FileName
            Call SetDuration(objMediaDet.StreamLength, objMediaDet.FrameRate)
            If Not objMediaDet Is Nothing Then Set m_objMediaDet = objMediaDet
            If ctrlCommonDialog.FileName <> vbNullString Then m_bstrFileName = ctrlCommonDialog.FileName
    
            'ToDo: add code to process the opened file
            Set m_objMediaControl = New FilgraphManager
            Call m_objMediaControl.RenderFile(sFile)
            
            
            
            ' Some filter graphs don't render audio
            ' In this sample, skip setting volume property
            Set m_objBasicAudio = m_objMediaControl
            m_objBasicAudio.Volume = slVolume.Value
            
            'Setup the IVideoWindow object
            Set m_objVideoWindow = m_objMediaControl
            Set m_objBasicVideo = m_objMediaControl
            m_objVideoWindow.WindowStyle = CLng(&H6000000)
            m_objVideoWindow.Top = picPreview.Top
            m_objVideoWindow.Left = picPreview.Left
            m_objVideoWindow.Width = picPreview.Width
            m_objVideoWindow.Height = picPreview.Height
        
            'reset the video window owner
            m_objVideoWindow.Owner = picPreview.hWnd
            
            'Setup the IMediaEvent object for the
            'sample toolbar (run, pause, play).
            Set m_objMediaEvent = m_objMediaControl
            
            'Setup the IMediaPosition object
            Set m_objMediaPosition = m_objMediaControl
            
            ' Reset start position to 0
            m_dblRunLength = Round(m_objMediaPosition.Duration, 2)
            m_dblStartPosition = 0
            
            'assign state
            m_boolDirty = True
            m_boolLoaded = True
            
            'reset scrollbar
            ctrlSlider.Value = 0
            lblTimeValue.Caption = 0
            lblFrameValue.Caption = 0
            
            
            
            cmdPlay.Enabled = True
            cmdCapture.Enabled = True
            cmdFwdFrame.Enabled = True
            cmdBackFrame.Enabled = True
            cmdTrimStart.Enabled = True
            cmdTrimStop.Enabled = True
            cmdCut.Enabled = True
            ctrlSlider.Enabled = True
            
            'clean-up & dereference
            If Not objMediaDet Is Nothing Then Set objMediaDet = Nothing
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub slVolume_Change()
            On Local Error GoTo ErrLine
            
            'Set the volume using the slider
            If Not m_objMediaControl Is Nothing Then _
               m_objBasicAudio.Volume = slVolume.Value
            Exit Sub
            
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub
            
            
            
            Private Sub slVolume_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
            On Local Error GoTo ErrLine
            
            'Set the volume using the slider
            If Not m_objMediaControl Is Nothing Then _
               m_objBasicAudio.Volume = slVolume.Value
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub cmdPause_Click()
            On Local Error GoTo ErrLine
            
            Call m_objMediaControl.Pause
            m_boolVideoRunning = False
            ctrlSlider.Enabled = True
            cmdPlay.Enabled = True
            cmdPause.Enabled = False
            cmdStop.Enabled = True
            cmdCapture.Enabled = True
            cmdTrimStart.Enabled = True
            cmdTrimStop.Enabled = True
            cmdFwdFrame.Enabled = True
            cmdBackFrame.Enabled = True
            cmdCut.Enabled = True
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Sub cmdPlay_Click()
            On Local Error GoTo ErrLine
            
            If Not m_objMediaControl Is Nothing Then
                'Invoke the MediaControl Run() method
                'and pause the video that is being
                'displayed through the predefined
                'filter graph.
                  
                'Assign specified starting position dependent on state
                If CLng(m_objMediaPosition.CurrentPosition) < CLng(m_dblStartPosition) Then
                    m_objMediaPosition.CurrentPosition = m_dblStartPosition
                ElseIf CLng(m_objMediaPosition.CurrentPosition) = CLng(m_dblRunLength) Then
                    m_objMediaPosition.CurrentPosition = m_dblStartPosition
                End If
            End If
              
            Call m_objMediaControl.Run
            m_boolVideoRunning = True
            ctrlSlider.Enabled = True
            cmdPlay.Enabled = False
            cmdPause.Enabled = True
            cmdStop.Enabled = True
            cmdCapture.Enabled = True
            cmdFwdFrame.Enabled = False
            cmdBackFrame.Enabled = False
            cmdTrimStart.Enabled = False
            cmdTrimStop.Enabled = False
            cmdCut.Enabled = False
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub


            Private Sub cmdStop_Click()
            On Local Error GoTo ErrLine
            
            Call m_objMediaControl.Pause
            m_boolVideoRunning = False
            
            
            ' reset to the beginning of the video
            m_objMediaPosition.CurrentPosition = 0
            ctrlSlider.Enabled = True
            cmdPlay.Enabled = True
            cmdPause.Enabled = False
            cmdStop.Enabled = False
            cmdCapture.Enabled = True
            cmdFwdFrame.Enabled = True
            cmdBackFrame.Enabled = True
            cmdTrimStart.Enabled = True
            cmdTrimStop.Enabled = True
            cmdCut.Enabled = True
            ctrlSlider.Value = 0
            lblFrameValue.Caption = 0
            lblTimeValue.Caption = 0
            
            Exit Sub

ErrLine:
            Err.Clear
            Exit Sub
            End Sub


            Private Sub SetDuration(dblDuration As Double, dblFPS As Double)
            Dim dblFrame As Double
            On Local Error GoTo ErrLine
            
            'set module-level data
            m_dblFPS = dblFPS
            m_nFrameCount = (dblDuration * dblFPS)
            
            'setup / update the UI
            ctrlSlider.SelStart = 0
            ctrlSlider.SelLength = 0
            ctrlSlider.Min = 0
            ctrlSlider.Max = m_nFrameCount
            ctrlSlider.LargeChange = (m_nFrameCount / 10)
            ctrlSlider.SmallChange = (m_nFrameCount / 100)
            ctrlSlider.TickFrequency = 100
            lblFPSValue.Caption = Trim(Str(Format(dblFPS, "##.##")))
            lblTimeCount.Caption = Trim(Str(Format(dblDuration, "##.##")))
            lblFrameCount.Caption = Trim(Str(Format(m_nFrameCount, "##.##")))
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub
            
            
            Private Sub tmrTimer_Timer()
            Dim nReturnCode As Long
            Dim dblPosition As Double
            Dim dblFrame As Variant
            On Local Error GoTo ErrLine

            'Retrieve the Elapsed Time and
            'display it in the corresponding
            'textbox.
            If m_boolDirty Then
               'reset to not dirty
               m_boolDirty = False
               'write out the current frame to the given bitmap file
               m_objMediaDet.WriteBitmapBits GetCurrentPos, picPreview.Width, picPreview.Height, GetTempDirectory + POSTER_FRAME_FILENAME
               'load the picture into the preview pane
               picPreview.Picture = LoadPicture(GetTempDirectory + POSTER_FRAME_FILENAME)
            End If
            
            
            If m_boolVideoRunning = True Then
            
            'obtain return code
               Call m_objMediaEvent.WaitForCompletion(100, nReturnCode)
               
               
               If nReturnCode = 0 Then
                   'get the current position for display
                   dblPosition = m_objMediaPosition.CurrentPosition
                   dblFrame = m_nFrameCount
                   lblTimeValue.Caption = CStr(Round(dblPosition, 2))
                   dblFrame = CLng(dblPosition * m_dblFPS)
                   lblFrameValue.Caption = CStr(Round(dblFrame, 2))
                   ctrlSlider.Value = CLng(dblFrame)
               Else
                   lblTimeValue.Caption = CStr(Round(m_dblRunLength, 2))
                   lblFrameValue.Caption = CStr(Round(m_nFrameCount, 2))
                   
                   'enable/disable control buttons
                   cmdPlay.Enabled = True
                   cmdPause.Enabled = False
                   cmdStop.Enabled = False
                   cmdCapture.Enabled = True
                   cmdFwdFrame.Enabled = True
                   cmdBackFrame.Enabled = True
                   cmdTrimStart.Enabled = True
                   cmdTrimStop.Enabled = True
                   cmdCut.Enabled = True
                   Call m_objMediaControl.Pause
                   m_boolVideoRunning = False
               End If
            End If
            Exit Sub
            
ErrLine:
            Err.Clear
            Resume Next
            Exit Sub
            
End Sub


            Private Sub ctrlSlider_Scroll()
            On Local Error GoTo ErrLine
            
            If m_boolLoaded Then
               'reset the label caption's
               lblFrameValue.Caption = CStr(Trim(Str(ctrlSlider.Value)))
               If m_dblFPS <> 0 Then lblTimeValue.Caption = CStr(Trim(Str(Round(ctrlSlider.Value / m_dblFPS, 2))))
               'reset to dirty
               m_boolDirty = True
            End If
            m_objMediaPosition.CurrentPosition = GetCurrentPos
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub

            Private Function GetCurrentPos() As Double
            On Local Error GoTo ErrLine
            
            If m_dblFPS = 0 Then Exit Function
            If IsNumeric(ctrlSlider.Value) Then
               GetCurrentPos = (ctrlSlider.Value / m_dblFPS)
            End If
            Exit Function
            
ErrLine:
            Err.Clear
            Exit Function
            End Function

            Private Sub Form_Initialize()
            On Local Error GoTo ErrLine
            
            'initalize module-level variable(s)
            Set m_objMediaDet = New MediaDet
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub
            
            Private Sub Form_Terminate()
            On Local Error GoTo ErrLine
            
            'terminate module-level object(s)
            If Not m_objMediaDet Is Nothing Then Set m_objMediaDet = Nothing
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub
            
            Private Sub DisableEverything()
            On Local Error GoTo ErrLine
            
            'update ui
            ctrlSlider.Enabled = False
            cmdPlay.Enabled = False
            cmdPause.Enabled = False
            cmdStop.Enabled = False
            cmdCapture.Enabled = False
            cmdCut.Enabled = False
            cmdTrimStart.Enabled = False
            cmdTrimStop.Enabled = False
            cmdBackFrame.Enabled = False
            cmdFwdFrame.Enabled = False
            cmdCut.Enabled = False
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub
            
            Private Sub EnableEverything()
            On Local Error GoTo ErrLine
            
            'update ui
            ctrlSlider.Enabled = True
            cmdPlay.Enabled = True
            cmdPause.Enabled = True
            cmdStop.Enabled = True
            cmdCapture.Enabled = True
            cmdTrimStart.Enabled = True
            cmdTrimStop.Enabled = True
            cmdBackFrame.Enabled = True
            cmdFwdFrame.Enabled = True
            cmdCut.Enabled = True
            Exit Sub
            
ErrLine:
            Err.Clear
            Exit Sub
            End Sub
