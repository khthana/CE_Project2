Attribute VB_Name = "ModVideo"
Option Explicit

' ====================================================================== CONSTANTS
Public Const MARKER_MAX As Integer = 23   ' Max index of marker
Public MARKER_ACTIVE As Long ' Active marker color
Public MARKER_NORMAL As Long ' Normal marker color
Public Const MARKER_SIZE As Long = 5    ' Marker size in pixels
Public Const FRAME_MAX As Integer = 3   ' Max frame index
Public Const BLOBDETECT_MAX As Integer = 99      ' Max blob index
Public Const MOVEMENT_RADIUS As Long = 40   ' Max movement radius in pixels
Public Const LOSTMARK_MAX As Long = 2   ' Max lost marker in frames

Public MARKER_NAME() As String  ' Marker's name in order
Public FrameMax As Long

' ====================================================================== TYPES

Public Enum marker
    LFHD = 0
    RFHD
    CLAV
    LSHO
    RSHO
    LELB
    RELB
    LWRE
    RWRE
    STRN
    LFWT
    RFWT
    LKNE
    RKNE
    LANK
    RANK
    LBHD        'Back
    RBHD
    C7
    T10
    LBWT
    RBWT
    LKNI
    RKNI
End Enum

Public Enum MARKERCOLOR
    cBlue = 0
    cPink
    cGreen
    cYellow
End Enum

Public Type MARKER_DATA    ' A marker on image
    valid As Boolean
    X As Long
    Y As Long
    near1 As Integer
    near2 As Integer
End Type

Public Type MARKER_GLOBAL       ' A marker data
    detectframe As MARKERCOLOR  ' Which view do it be detected for this marker
    Data() As MARKER_DATA
End Type

Public Type MARKER_DATA2
    Count As Integer
    Data() As MARKER_DATA
End Type

Public Type NO_MARKER
    Color() As MARKER_DATA2
End Type

Public Type F_BLOB_EXT
    detectas As Integer
    dist As Double
End Type

' Color Samples
Public Type PROCESS
    Blobs() As F_BLOB   ' Blob array after threshold
    BlobsExt() As F_BLOB_EXT    ' Extension for F_BLOB
    Blob_count As Long  ' Blob count
End Type

Public Type IMAGEPROCESS_DATA
    Frame() As PROCESS
    Name As String
    Range As F_HSVRANGE
    HueOffset As Long
    blob_min As Long    ' Size of deteced blob
    blob_max As Long
End Type

' ====================================================================== GLOBAL VARIABLES
Public ProcessInfo() As IMAGEPROCESS_DATA
Public MotionDat() As STR_WORLDFRAME

' ====================================================================== FUNCTIONS

Public Sub INIT_VIDEO() ' Init this module
    MARKER_ACTIVE = RGB(0, 0, 255)
    MARKER_NORMAL = RGB(255, 0, 0)
    
    ReDim MARKER_NAME(0 To MARKER_MAX) As String
    ReDim ProcessInfo(0 To 3) As IMAGEPROCESS_DATA
    
    MARKER_NAME(0) = "LFHD"
    MARKER_NAME(1) = "RFHD"
    MARKER_NAME(2) = "CLAV"
    MARKER_NAME(3) = "LSHO"
    MARKER_NAME(4) = "RSHO"
    MARKER_NAME(5) = "LELB"
    MARKER_NAME(6) = "RELB"
    MARKER_NAME(7) = "LWRE"
    MARKER_NAME(8) = "RWRE"
    MARKER_NAME(9) = "STRN"
    MARKER_NAME(10) = "LFWT"
    MARKER_NAME(11) = "RFWT"
    MARKER_NAME(12) = "LKNE"
    MARKER_NAME(13) = "RKNE"
    MARKER_NAME(14) = "LANK"
    MARKER_NAME(15) = "RANK"
    
    MARKER_NAME(16) = "LBHD"
    MARKER_NAME(17) = "RBHD"
    MARKER_NAME(18) = "C7"
    MARKER_NAME(19) = "T10"
    MARKER_NAME(20) = "LBWT"
    MARKER_NAME(21) = "RBWT"
    MARKER_NAME(22) = "LKNI"
    MARKER_NAME(23) = "RKNI"
End Sub


