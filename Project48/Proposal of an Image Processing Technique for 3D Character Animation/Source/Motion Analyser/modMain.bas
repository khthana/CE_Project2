Attribute VB_Name = "modMain"
Option Explicit

' ====================================================================== CONSTANTS
Public Const EPALETTE_FILE As String = "EPalette.exe"  ' EPallete filename
Public Const COLOR_FILE As String = "Color.dat" ' Color config data file
Public Const STEREOPSIS_FILE As String = "Stereosis.dat"    ' Stereopsis data

' ====================================================================== EXTERNAL FUNCTIONS
Public Declare Function WinExec Lib "KERNEL32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long

'Public capmax As Integer
'Public genmode As Boolean
'Public Framemax As Long        ' Max frame number

' ====================================================================== ENTRY POINT

Public Sub Main()   ' Program entry point
    If (App.PrevInstance) Then End  'Allow only 1 program instance
    ChDir App.Path
    
    ' Init main
    INIT_VIDEO
    INIT_MOTION
    
    ' Init stereopsis (Default)
    Dim cam1 As STR_CAMERA, cam2 As STR_CAMERA, cam3 As STR_CAMERA, cam4 As STR_CAMERA
    
    cam1.X = -8.89
    cam1.Y = -8.89
    cam1.Z = 0
    cam1.focus = 0.005
    cam1.iwidth = 0.0032
    cam1.iheight = 0.0024
    
    cam2.X = 8.89
    cam2.Y = -8.89
    cam2.Z = 0
    cam2.focus = 0.005
    cam2.iwidth = 0.0032
    cam2.iheight = 0.0024
    
    cam3.X = 8.89
    cam3.Y = 8.89
    cam3.Z = 0
    cam3.focus = 0.005
    cam3.iwidth = 0.0032
    cam3.iheight = 0.0024
    
    cam4.X = -8.89
    cam4.Y = 8.89
    cam4.Z = 0
    cam4.focus = 0.005
    cam4.iwidth = 0.0032
    cam4.iheight = 0.0024
    
    STR_SetCamera1 cam1
    STR_SetCamera2 cam2
    STR_SetCamera3 cam3
    STR_SetCamera4 cam4
    STR_SetZOffset 1.27
    
    frmMain.Show
End Sub

' ====================================================================== PUBLIC FUNCTIONS

Public Sub SaveColors() ' Save image process data to file
    Dim i As Long
    If (Dir(App.Path + "\" + COLOR_FILE) <> "") Then Kill App.Path + "\" + COLOR_FILE   ' Delete old
    Open App.Path + "\" + COLOR_FILE For Random As #1
        For i = 0 To FRAME_MAX
            Put #1, , ProcessInfo(i).HueOffset
            Put #1, , ProcessInfo(i).Range
            Put #1, , ProcessInfo(i).blob_min
            Put #1, , ProcessInfo(i).blob_max
        Next i
    Close #1
End Sub

Public Sub LoadColors()   ' Load image process data from file
    If (Dir(App.Path + "\" + COLOR_FILE) = "") Then Exit Sub
    
    Dim i As Long
    Open App.Path + "\" + COLOR_FILE For Random As #1
        For i = 0 To FRAME_MAX
            Get #1, , ProcessInfo(i).HueOffset
            Get #1, , ProcessInfo(i).Range
            Get #1, , ProcessInfo(i).blob_min
            Get #1, , ProcessInfo(i).blob_max
        Next i
    Close #1
End Sub

Public Sub SaveStereopsis() ' Save stereopsis data to file
    Dim cam1 As STR_CAMERA, cam2 As STR_CAMERA, cam3 As STR_CAMERA, cam4 As STR_CAMERA
    cam1 = STR_GetCamera1
    cam2 = STR_GetCamera2
    cam3 = STR_GetCamera3
    cam4 = STR_GetCamera4
    
    If (Dir(App.Path + "\" + STEREOPSIS_FILE) <> "") Then Kill App.Path + "\" + STEREOPSIS_FILE   ' Delete old
    Open App.Path + "\" + STEREOPSIS_FILE For Random As #1
        Put #1, , cam1
        Put #1, , cam2
        Put #1, , cam3
        Put #1, , cam4
        Put #1, , STR_GetZOffset
    Close #1
End Sub

Public Sub LoadStereopsis() ' Load stereopsis data from file
    If (Dir(App.Path + "\" + STEREOPSIS_FILE) = "") Then Exit Sub
    
    Dim cam1 As STR_CAMERA, cam2 As STR_CAMERA, cam3 As STR_CAMERA, cam4 As STR_CAMERA
    Dim Zoffset As Double
    Open App.Path + "\" + STEREOPSIS_FILE For Random As #1
        Get #1, , cam1
        Get #1, , cam2
        Get #1, , cam3
        Get #1, , cam4
        Get #1, , Zoffset
    Close #1
    STR_SetCamera1 cam1
    STR_SetCamera2 cam2
    STR_SetCamera3 cam3
    STR_SetCamera4 cam4
    STR_SetZOffset Zoffset
End Sub

Public Function GetMotionData(Frameno As Long, v1 As frmVideo, v2 As frmVideo, MotionData() As STR_WORLDFRAME) ', AvrXYZ() As clsWORLDCOOR)
    'On Error Resume Next    ' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    ' Update motion data from markers
    Dim cam1ImgSize As STR_IMAGESIZE, cam2ImgSize As STR_IMAGESIZE
    Dim cam1Pt As STR_IMAGECOOR, cam2Pt As STR_IMAGECOOR
    Dim WaistWidth As Double, HeadWidth As Double, ClavWidth As Double, StrnWidth As Double, KneeWidth As Double, FootWidth As Double, FootHeight As Double, MTWidth As Double
    Dim point As Integer
    Dim Lastframe As Long
    Dim tmp As Double
    Dim tmpcoor As STR_WORLDCOOR

    If Frameno = 0 Then
        Lastframe = 0
    Else
        Lastframe = Frameno - 1
    End If
    ' Get image size
    cam1ImgSize.width = v1.vdoocxVideo.GetWidth
    cam1ImgSize.height = v1.vdoocxVideo.GetHeight
    cam2ImgSize.width = v2.vdoocxVideo.GetWidth
    cam2ImgSize.height = v2.vdoocxVideo.GetHeight

    HeadWidth = 0.15
    WaistWidth = 0.1
    ClavWidth = 0.05
    StrnWidth = 0.1
    KneeWidth = 0.05
    FootWidth = 0.1
    FootHeight = 0.04
    MTWidth = 0.05

    point = 0
    ' Update values

    If (v1.GetMarker(Frameno, marker.LFHD, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LFHD, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LFHD).count
        MotionData(Frameno).Motion(joint.LFHD).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LFHD).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LFHD).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LFHD).count = MotionData(Frameno).Motion(joint.LFHD).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RFHD, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RFHD, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RFHD).count
        MotionData(Frameno).Motion(joint.RFHD).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RFHD).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RFHD).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RFHD).count = MotionData(Frameno).Motion(joint.RFHD).count + 1
    End If
        'Head on backside ++++
    If (v1.GetMarker(Frameno, marker.LBHD, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LBHD, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LBHD).count
        MotionData(Frameno).Motion(joint.LBHD).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LBHD).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LBHD).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LBHD).count = MotionData(Frameno).Motion(joint.LBHD).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RBHD, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RBHD, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RBHD).count
        MotionData(Frameno).Motion(joint.RBHD).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RBHD).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RBHD).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RBHD).count = MotionData(Frameno).Motion(joint.RBHD).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.CLAV, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.CLAV, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.CLAV).count
        MotionData(Frameno).Motion(joint.CLAV).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.CLAV).coor(point).Y = tmpcoor.Y ' - (ClavWidth / 2)  ' ++++
        MotionData(Frameno).Motion(joint.CLAV).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.CLAV).count = MotionData(Frameno).Motion(joint.CLAV).count + 1
'        '++++
    End If
    If (v1.GetMarker(Frameno, marker.C7, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.C7, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.C7).count
        MotionData(Frameno).Motion(joint.C7).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.C7).coor(point).Y = tmpcoor.Y ' + (ClavWidth * 2)  ' ++++
        MotionData(Frameno).Motion(joint.C7).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.C7).count = MotionData(Frameno).Motion(joint.C7).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.STRN, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.STRN, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.STRN).count
        MotionData(Frameno).Motion(joint.STRN).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.STRN).coor(point).Y = tmpcoor.Y ' - (StrnWidth / 2)
        MotionData(Frameno).Motion(joint.STRN).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.STRN).count = MotionData(Frameno).Motion(joint.STRN).count + 1
    End If
        '++++
    If (v1.GetMarker(Frameno, marker.T10, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.T10, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.T10).count
        MotionData(Frameno).Motion(joint.T10).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.T10).coor(point).Y = tmpcoor.Y ' + (StrnWidth / 2)
        MotionData(Frameno).Motion(joint.T10).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.T10).count = MotionData(Frameno).Motion(joint.T10).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LSHO, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LSHO, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LSHO).count
        MotionData(Frameno).Motion(joint.LSHO).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LSHO).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LSHO).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LSHO).count = MotionData(Frameno).Motion(joint.LSHO).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LELB, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LELB, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LELB).count
        MotionData(Frameno).Motion(joint.LELB).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LELB).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LELB).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LELB).count = MotionData(Frameno).Motion(joint.LELB).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RSHO, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RSHO, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RSHO).count
        MotionData(Frameno).Motion(joint.RSHO).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RSHO).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RSHO).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RSHO).count = MotionData(Frameno).Motion(joint.RSHO).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RELB, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RELB, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RELB).count
        MotionData(Frameno).Motion(joint.RELB).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RELB).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RELB).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RELB).count = MotionData(Frameno).Motion(joint.RELB).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LWRE, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LWRE, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LWRE).count
        MotionData(Frameno).Motion(joint.LWRE).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LWRE).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LWRE).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LWRE).count = MotionData(Frameno).Motion(joint.LWRE).count + 1
'        '++++
'        point = MotionData(Frameno).Motion(joint.LFIN).Count
        If (tmpcoor.X >= MotionData(Frameno).Motion(joint.LELB).coor(point).X) Then
            MotionData(Frameno).Motion(joint.LFIN).coor(point).X = tmpcoor.X + 0.01
        Else
            MotionData(Frameno).Motion(joint.LFIN).coor(point).X = tmpcoor.X - 0.01
        End If
'
        MotionData(Frameno).Motion(joint.LFIN).coor(point).Y = tmpcoor.Y '((MotionData(JOINT.LELB).Y - MotionData(JOINT.LWRE).Y) / (MotionData(JOINT.LELB).X - MotionData(JOINT.LWRE).X)) * (MotionData(JOINT.LWRE).X - MotionData(JOINT.LFIN).X) + MotionData(JOINT.LWRE).Y
        MotionData(Frameno).Motion(joint.LFIN).coor(point).Z = tmpcoor.Z '((MotionData(JOINT.LELB).Z - MotionData(JOINT.LWRE).Z) / (MotionData(JOINT.LELB).X - MotionData(JOINT.LWRE).X)) * (MotionData(JOINT.LWRE).X - MotionData(JOINT.LFIN).X) + MotionData(JOINT.LWRE).Z
        MotionData(Frameno).Motion(joint.LFIN).count = MotionData(Frameno).Motion(joint.LFIN).count + 1
'
'        point = MotionData(Frameno).Motion(joint.LWRI).Count
        MotionData(Frameno).Motion(joint.LWRI).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LWRI).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LWRI).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LWRI).count = MotionData(Frameno).Motion(joint.LWRI).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RWRE, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RWRE, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RWRE).count
        MotionData(Frameno).Motion(joint.RWRE).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RWRE).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RWRE).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RWRE).count = MotionData(Frameno).Motion(joint.RWRE).count + 1
'        '++++
'        point = MotionData(Frameno).Motion(joint.RFIN).Count
        If (tmpcoor.X >= MotionData(Frameno).Motion(joint.RELB).coor(point).X) Then
            MotionData(Frameno).Motion(joint.RFIN).coor(point).X = tmpcoor.X + 0.01
        Else
            MotionData(Frameno).Motion(joint.RFIN).coor(point).X = tmpcoor.X - 0.01
        End If
'
        MotionData(Frameno).Motion(joint.RFIN).coor(point).Y = tmpcoor.Y '((MotionData(JOINT.LELB).Y - MotionData(JOINT.LWRE).Y) / (MotionData(JOINT.LELB).X - MotionData(JOINT.LWRE).X)) * (MotionData(JOINT.LWRE).X - MotionData(JOINT.LFIN).X) + MotionData(JOINT.LWRE).Y
        MotionData(Frameno).Motion(joint.RFIN).coor(point).Z = tmpcoor.Z '((MotionData(JOINT.LELB).Z - MotionData(JOINT.LWRE).Z) / (MotionData(JOINT.LELB).X - MotionData(JOINT.LWRE).X)) * (MotionData(JOINT.LWRE).X - MotionData(JOINT.LFIN).X) + MotionData(JOINT.LWRE).Z
        MotionData(Frameno).Motion(joint.RFIN).count = MotionData(Frameno).Motion(joint.RFIN).count + 1

'        point = MotionData(Frameno).Motion(joint.RWRI).Count
        MotionData(Frameno).Motion(joint.RWRI).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RWRI).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RWRI).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RWRI).count = MotionData(Frameno).Motion(joint.RWRI).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LFWT, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LFWT, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LFWT).count
        MotionData(Frameno).Motion(joint.LFWT).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LFWT).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LFWT).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LFWT).count = MotionData(Frameno).Motion(joint.LFWT).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RFWT, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RFWT, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RFWT).count
        MotionData(Frameno).Motion(joint.RFWT).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RFWT).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RFWT).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RFWT).count = MotionData(Frameno).Motion(joint.RFWT).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RBWT, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RBWT, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RBWT).count
        MotionData(Frameno).Motion(joint.RBWT).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RBWT).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RBWT).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RBWT).count = MotionData(Frameno).Motion(joint.RBWT).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LBWT, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LBWT, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LBWT).count
        MotionData(Frameno).Motion(joint.LBWT).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LBWT).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LBWT).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LBWT).count = MotionData(Frameno).Motion(joint.LBWT).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LKNE, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LKNE, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LKNE).count
        MotionData(Frameno).Motion(joint.LKNE).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LKNE).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LKNE).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LKNE).count = MotionData(Frameno).Motion(joint.LKNE).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LKNI, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LKNI, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LKNI).count
        MotionData(Frameno).Motion(joint.LKNI).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LKNI).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LKNI).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LKNI).count = MotionData(Frameno).Motion(joint.LKNI).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.LANK, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.LANK, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.LANK).count
        MotionData(Frameno).Motion(joint.LANK).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LANK).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LANK).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.LANK).count = MotionData(Frameno).Motion(joint.LANK).count + 1
        '+++
        MotionData(Frameno).Motion(joint.LHEL).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LHEL).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.LHEL).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.LHEL).count = MotionData(Frameno).Motion(joint.LHEL).count + 1

        MotionData(Frameno).Motion(joint.LMT5).coor(point).X = tmpcoor.X + (MTWidth / 2)
        MotionData(Frameno).Motion(joint.LMT5).coor(point).Y = tmpcoor.Y - (FootWidth * 0.5)
        MotionData(Frameno).Motion(joint.LMT5).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.LMT5).count = MotionData(Frameno).Motion(joint.LMT5).count + 1

        MotionData(Frameno).Motion(joint.LMTI).coor(point).X = tmpcoor.X - (MTWidth / 2)
        MotionData(Frameno).Motion(joint.LMTI).coor(point).Y = tmpcoor.Y - (FootWidth * 0.5)
        MotionData(Frameno).Motion(joint.LMTI).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.LMTI).count = MotionData(Frameno).Motion(joint.LMTI).count + 1

        MotionData(Frameno).Motion(joint.LTOE).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.LTOE).coor(point).Y = tmpcoor.Y - FootWidth
        MotionData(Frameno).Motion(joint.LTOE).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.LTOE).count = MotionData(Frameno).Motion(joint.LTOE).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RKNE, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RKNE, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RKNE).count
        MotionData(Frameno).Motion(joint.RKNE).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RKNE).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RKNE).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RKNE).count = MotionData(Frameno).Motion(joint.RKNE).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RKNI, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RKNI, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RKNI).count
        MotionData(Frameno).Motion(joint.RKNI).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RKNI).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RKNI).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RKNI).count = MotionData(Frameno).Motion(joint.RKNI).count + 1
    End If
    If (v1.GetMarker(Frameno, marker.RANK, cam1Pt.X, cam1Pt.Y)) And (v2.GetMarker(Frameno, marker.RANK, cam2Pt.X, cam2Pt.Y)) Then
        tmpcoor = STR_GetWorldCoordinate(cam1Pt, cam1ImgSize, cam2Pt, cam2ImgSize)
        If (v1.cams = 3) And (v2.cams = 4) Then
            tmpcoor.X = tmpcoor.X * (-1)
            tmpcoor.Y = tmpcoor.Y * (-1)
        ElseIf (v1.cams = 2) And (v2.cams = 3) Then
            tmp = tmpcoor.Y
            tmpcoor.Y = tmpcoor.X
            tmpcoor.X = tmp * (-1)
        ElseIf (v1.cams = 4) And (v2.cams = 1) Then
            tmp = tmpcoor.X
            tmpcoor.X = tmpcoor.Y
            tmpcoor.Y = tmp * (-1)
        End If
        point = MotionData(Frameno).Motion(joint.RANK).count
        MotionData(Frameno).Motion(joint.RANK).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RANK).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RANK).coor(point).Z = tmpcoor.Z
        MotionData(Frameno).Motion(joint.RANK).count = MotionData(Frameno).Motion(joint.RANK).count + 1

        MotionData(Frameno).Motion(joint.RHEL).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RHEL).coor(point).Y = tmpcoor.Y
        MotionData(Frameno).Motion(joint.RHEL).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.RHEL).count = MotionData(Frameno).Motion(joint.RHEL).count + 1

        MotionData(Frameno).Motion(joint.RMT5).coor(point).X = tmpcoor.X - (MTWidth / 2)
        MotionData(Frameno).Motion(joint.RMT5).coor(point).Y = tmpcoor.Y - (FootWidth * 0.5)
        MotionData(Frameno).Motion(joint.RMT5).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.RMT5).count = MotionData(Frameno).Motion(joint.RMT5).count + 1

        MotionData(Frameno).Motion(joint.RMTI).coor(point).X = tmpcoor.X + (MTWidth / 2)
        MotionData(Frameno).Motion(joint.RMTI).coor(point).Y = tmpcoor.Y - (FootWidth * 0.5)
        MotionData(Frameno).Motion(joint.RMTI).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.RMTI).count = MotionData(Frameno).Motion(joint.RMTI).count + 1

        MotionData(Frameno).Motion(joint.RTOE).coor(point).X = tmpcoor.X
        MotionData(Frameno).Motion(joint.RTOE).coor(point).Y = tmpcoor.Y - FootWidth
        MotionData(Frameno).Motion(joint.RTOE).coor(point).Z = tmpcoor.Z - FootHeight
        MotionData(Frameno).Motion(joint.RTOE).count = MotionData(Frameno).Motion(joint.RTOE).count + 1
    End If

End Function

Public Function MAnalysis(Frameno As Long, MotionData() As STR_WORLDFRAME, joint As Integer)
    Dim olddx As Double
    Dim olddy As Double
    Dim olddz As Double
    Dim dx As Double
    Dim dy As Double
    Dim dz As Double
    Dim dist() As Double
    Dim mindist As Double
    Dim Min As Long
    Dim Lastframe As Integer
    Dim i As Long

    If Frameno <= 0 Then
        Lastframe = 0
    Else
        Lastframe = Frameno - 1
    End If
    olddx = MotionData(Lastframe).Motion(joint).coor(0).dx
    olddy = MotionData(Lastframe).Motion(joint).coor(0).dy
    olddz = MotionData(Lastframe).Motion(joint).coor(0).dz

    ReDim dist(0 To MotionData(Frameno).Motion(joint).count - 1) As Double
    For i = 0 To MotionData(Frameno).Motion(joint).count - 1
        dx = MotionData(Frameno).Motion(joint).coor(i).dx - olddx
        dy = MotionData(Frameno).Motion(joint).coor(i).dy - olddy
        dz = MotionData(Frameno).Motion(joint).coor(i).dz - olddz
        dist(i) = Sqr((dx * dx) + (dy * dy) + (dz * dz))
    Next i

    For i = 0 To MotionData(Frameno).Motion(joint).count - 1
        If (dist(i) < mindist) Then
            mindist = dist(i)
            Min = i
        End If
    Next i

'    If Frameno = 0 Then
    MotionData(Frameno).Motion(joint).coor(0).dx = MotionData(Frameno).Motion(joint).coor(Min).dx
    MotionData(Frameno).Motion(joint).coor(0).dx = MotionData(Frameno).Motion(joint).coor(Min).dx
    MotionData(Frameno).Motion(joint).coor(0).dx = MotionData(Frameno).Motion(joint).coor(Min).dx
    MotionData(Frameno).Motion(joint).count = 1

End Function

Public Sub Avr(Frameno As Long, MotionData() As STR_WORLDFRAME, AvrXYZ() As clsWORLDCOOR)
    Dim i As Integer
    For i = 0 To JOINT_MAX
      
        AvrXYZ(i).SetXYZ MotionData(Frameno).Motion(i).coor(0).X, MotionData(Frameno).Motion(i).coor(0).Y, MotionData(Frameno).Motion(i).coor(0).Z
        MotionData(Frameno).Motion(i).coor(0).X = AvrXYZ(i).X
        MotionData(Frameno).Motion(i).coor(0).Y = AvrXYZ(i).Y
        MotionData(Frameno).Motion(i).coor(0).Z = AvrXYZ(i).Z
    Next i
End Sub

Public Function SetNotMarker(Frameno As Long, Color As Integer, v1 As frmVideo, X1 As Long, Y1 As Long, v2 As frmVideo, v3 As frmVideo, MotionData() As STR_WORLDFRAME)
    Dim i As Integer
    Dim j As Integer
    Dim X As Long
    Dim Y As Long
    Dim camImgSize As STR_IMAGESIZE
    Dim tempCoor As STR_WORLDCOOR
    Dim camPT As STR_IMAGECOOR
    Dim tmp As Double
    Dim Min As Double
    Dim dist As Double
    Dim dx As Double
    Dim dy As Double
    Dim marker As Integer

    marker = -1
    camImgSize.width = 320
    camImgSize.height = 240
    Min = 10

    For i = 0 To MARKER_MAX
    If ((Not v1.GetMarker(Frameno, i, X, Y)) And ((v2.GetMarkers(Frameno, i, Color, X, Y)) Or (v3.GetMarkers(Frameno, i, Color, X, Y)))) Then
        MarkerToJoint i, j
        If (v1.cams = 1) And (v2.cams = 2) And (v2.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            camPT = STR_GetCam1ImageCoordinate(tempCoor, camImgSize)
        ElseIf (v1.cams = 1) And (v3.cams = 4) And (v3.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y
            tmp = tempCoor.Y
            tempCoor.Y = tempCoor.X
            tempCoor.X = tmp * (-1)
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            camPT = STR_GetCam2ImageCoordinate(tempCoor, camImgSize)
        ElseIf (v1.cams = 2) And (v2.cams = 1) And (v2.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            camPT = STR_GetCam2ImageCoordinate(tempCoor, camImgSize)
        ElseIf (v1.cams = 2) And (v3.cams = 3) And (v3.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            tmp = tempCoor.X
            tempCoor.X = tempCoor.Y
            tempCoor.Y = tmp * (-1)
            camPT = STR_GetCam1ImageCoordinate(tempCoor, camImgSize)
        ElseIf (v1.cams = 3) And (v2.cams = 2) And (v2.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            tmp = tempCoor.X
            tempCoor.X = tempCoor.Y
            tempCoor.Y = tmp * (-1)
            camPT = STR_GetCam2ImageCoordinate(tempCoor, camImgSize)
        ElseIf (v1.cams = 3) And (v3.cams = 4) And (v3.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X * (-1)
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y * (-1)
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            camPT = STR_GetCam1ImageCoordinate(tempCoor, camImgSize)
        ElseIf (v1.cams = 4) And (v3.cams = 3) And (v3.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X * (-1)
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y * (-1)
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            camPT = STR_GetCam2ImageCoordinate(tempCoor, camImgSize)
        ElseIf (v1.cams = 4) And (v2.cams = 1) And (v2.GetMarker(Frameno, i, X, Y)) Then
            tempCoor.X = MotionData(Frameno).Motion(j).coor(0).X
            tempCoor.Y = MotionData(Frameno).Motion(j).coor(0).Y
            tempCoor.Z = MotionData(Frameno).Motion(j).coor(0).Z
            tmp = tempCoor.Y
            tempCoor.Y = tempCoor.X
            tempCoor.X = tmp * (-1)
            camPT = STR_GetCam1ImageCoordinate(tempCoor, camImgSize)
        End If
        dx = X1 - camPT.X
        dy = Y1 - (camPT.Y + 48)
        dist = Sqr((dx * dx) + (dy * dy))

        If (dist <= Min) Then
            marker = i
        End If
    End If
    Next i

    If marker > -1 Then
        v1.SetNewBlob Frameno, marker, X1, Y1
    End If
    v1.DelNotMarker Frameno, Color

End Function

Public Function JointToMarker(joint As Integer, mark As Integer)
    Select Case joint
        Case 0
            mark = 0
        Case 1
            mark = 16
        Case 2
            mark = 1
        Case 3
            mark = 17
        Case 4
            mark = 18
        Case 5
            mark = 2
        Case 6
            mark = 19
        Case 7
            mark = 9
        Case 8
            mark = 3
        Case 9
            mark = 5
        Case 11
            mark = 4
        Case 12
            mark = 6
        Case 14
            mark = 10
        Case 15
            mark = 20
        Case 16
            mark = 11
        Case 17
            mark = 21
        Case 18
            mark = 12
        Case 19
            mark = 14
        Case 21
            mark = 13
        Case 22
            mark = 15
        Case 24
            mark = 7
        Case 26
            mark = 8
        Case 28
            mark = 22
        Case 32
            mark = 23
        Case Else
            mark = -1
    End Select
End Function

Public Function MarkerToJoint(mark As Integer, joint As Integer)
    Select Case mark
        Case 0
            joint = 0
        Case 1
            joint = 2
        Case 2
            joint = 5
        Case 3
            joint = 8
        Case 4
            joint = 11
        Case 5
            joint = 9
        Case 6
            joint = 12
        Case 7
            joint = 24
        Case 8
            joint = 26
        Case 9
            joint = 7
        Case 10
            joint = 14
        Case 11
            joint = 16
        Case 12
            joint = 18
        Case 13
            joint = 21
        Case 14
            joint = 19
        Case 15
            joint = 22
        Case 16
            joint = 1
        Case 17
            joint = 3
        Case 18
            joint = 4
        Case 19
            joint = 6
        Case 20
            joint = 15
        Case 21
            joint = 17
        Case 22
            joint = 28
        Case 23
            joint = 32
        Case Else
            joint = -1
    End Select
End Function
