Attribute VB_Name = "modStereopsis"
Option Explicit

' ====================================================================== TYPES

Public Type STR_WORLDCOOR
    X As Double
    Y As Double
    Z As Double
    dx As Double
    dy As Double
    dz As Double
End Type

Public Type STR_WORLDDATA
    count As Integer
    coor() As STR_WORLDCOOR
End Type

Public Type STR_WORLDFRAME
    Motion() As STR_WORLDDATA
End Type

Public Type STR_IMAGECOOR
    X As Long
    Y As Long
End Type

Public Type STR_IMAGESIZE
    width As Long
    height As Long
End Type

Public Type STR_CAMERA
    X As Double         ' Camera position (metres)
    Y As Double
    Z As Double
    focus As Double     ' Focal length (metres)
    iwidth As Double    ' Image plane size (metres)
    iheight As Double
End Type

' ====================================================================== EXTERNAL FUNCTIONS

Public Declare Function STR_GetCamera1 Lib "Stereopsis.dll" () As STR_CAMERA
Public Declare Function STR_GetCamera2 Lib "Stereopsis.dll" () As STR_CAMERA
Public Declare Function STR_GetCamera3 Lib "Stereopsis.dll" () As STR_CAMERA
Public Declare Function STR_GetCamera4 Lib "Stereopsis.dll" () As STR_CAMERA

Public Declare Sub STR_SetCamera1 Lib "Stereopsis.dll" (cam1 As STR_CAMERA)
Public Declare Sub STR_SetCamera2 Lib "Stereopsis.dll" (cam2 As STR_CAMERA)
Public Declare Sub STR_SetCamera3 Lib "Stereopsis.dll" (cam3 As STR_CAMERA)
Public Declare Sub STR_SetCamera4 Lib "Stereopsis.dll" (cam4 As STR_CAMERA)

Public Declare Function STR_GetWorldCoordinate Lib "Stereopsis.dll" (coorLeft As STR_IMAGECOOR, szLeft As STR_IMAGESIZE, coorRight As STR_IMAGECOOR, szRight As STR_IMAGESIZE) As STR_WORLDCOOR
Public Declare Function STR_GetCam1ImageCoordinate Lib "Stereopsis.dll" (coorWorld As STR_WORLDCOOR, szLeft As STR_IMAGESIZE) As STR_IMAGECOOR
Public Declare Function STR_GetCam2ImageCoordinate Lib "Stereopsis.dll" (coorWorld As STR_WORLDCOOR, szRight As STR_IMAGESIZE) As STR_IMAGECOOR
Public Declare Function STR_GetCam3ImageCoordinate Lib "Stereopsis.dll" (coorWorld As STR_WORLDCOOR, szLeft As STR_IMAGESIZE) As STR_IMAGECOOR
Public Declare Function STR_GetCam4ImageCoordinate Lib "Stereopsis.dll" (coorWorld As STR_WORLDCOOR, szRight As STR_IMAGESIZE) As STR_IMAGECOOR

Public Declare Sub STR_SetZOffset Lib "Stereopsis.dll" (ByVal Offset As Double)
Public Declare Function STR_GetZOffset Lib "Stereopsis.dll" () As Double
