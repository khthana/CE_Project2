Attribute VB_Name = "modMotionFile"
Option Explicit

' ====================================================================== CONSTANTS
Public Const JOINT_MAX As Long = 35   ' Max index of joint

' ====================================================================== TYPES
Public Enum joint
    LFHD = 0
    LBHD
    RFHD
    RBHD
    C7
    CLAV
    T10
    STRN
    LSHO
    LELB
    LFIN
    RSHO
    RELB
    RFIN
    LFWT
    LBWT
    RFWT
    RBWT
    LKNE
    LANK
    LTOE
    RKNE
    RANK
    RTOE
    LWRE
    LWRI
    RWRE
    RWRI
    LKNI
    LHEL
    LMT5
    LMTI
    RKNI
    RHEL
    RMT5
    RMTI
End Enum

' ---------- EAK ------------------------------------------------------------
Public Type CSM_PARAMETERS
    FileName As String
    Datetime As Date
    Actorname As String
    Comment As String
    Lastframe As Long   ' Last frame number
    Framerate As Long
End Type

' ====================================================================== LOCAL VARIABLES
' Local variables
Private CSM_FileId  As Integer  ' Motion file reference id
Private CSM_FrameNo As Long     ' Current frame number
' ---------------------------------------------------------------------------

' ====================================================================== GLOBAL VARIABLES
' Joint's name in order
Public JOINT_NAME() As String

' ====================================================================== FUNCTIONS

Public Sub INIT_MOTION() ' Must be called when start program
    ReDim JOINT_NAME(0 To JOINT_MAX) As String
    
    JOINT_NAME(0) = "LFHD"
    JOINT_NAME(1) = "LBHD"
    JOINT_NAME(2) = "RFHD"
    JOINT_NAME(3) = "RBHD"
    JOINT_NAME(4) = "C7"
    JOINT_NAME(5) = "CLAV"
    JOINT_NAME(6) = "T10"
    JOINT_NAME(7) = "STRN"
    JOINT_NAME(8) = "LSHO"
    JOINT_NAME(9) = "LELB"
    JOINT_NAME(10) = "LFIN"
    JOINT_NAME(11) = "RSHO"
    JOINT_NAME(12) = "RELB"
    JOINT_NAME(13) = "RFIN"
    JOINT_NAME(14) = "LFWT"
    JOINT_NAME(15) = "LBWT"
    JOINT_NAME(16) = "RFWT"
    JOINT_NAME(17) = "RBWT"
    JOINT_NAME(18) = "LKNE"
    JOINT_NAME(19) = "LANK"
    JOINT_NAME(20) = "LTOE"
    JOINT_NAME(21) = "RKNE"
    JOINT_NAME(22) = "RANK"
    JOINT_NAME(23) = "RTOE"
    JOINT_NAME(24) = "LWRE"
    JOINT_NAME(25) = "LWRI"
    JOINT_NAME(26) = "RWRE"
    JOINT_NAME(27) = "RWRI"
    JOINT_NAME(28) = "LKNI"
    JOINT_NAME(29) = "LHEL"
    JOINT_NAME(30) = "LMT5"
    JOINT_NAME(31) = "LMTI"
    JOINT_NAME(32) = "RKNI"
    JOINT_NAME(33) = "RHEL"
    JOINT_NAME(34) = "RMT5"
    JOINT_NAME(35) = "RMTI"
End Sub

' ---------- EAK ------------------------------------------------------------

Public Sub CSM_Open(FileName As String, FileId As Integer)  ' Open file
    Open FileName For Output As FileId
    CSM_FileId = FileId
    CSM_FrameNo = 1
End Sub

Public Sub CSM_Close()  ' Close
    Close CSM_FileId
End Sub

' Write Motion Data File header
Public Sub CSM_WriteHeader(CSMParam As CSM_PARAMETERS)
    Print #1, "$Date " + Format$(CSMParam.Datetime, "d/mm/yyyy")
    Print #1, "$Time " + Format$(CSMParam.Datetime, "h:mm:ss")
    Print #1, "$Filename " + CSMParam.FileName
    Print #1, "$Actor " + CSMParam.Actorname
    Print #1, ""
    Print #1, "$Comments"
    Print #1, CSMParam.Comment
    Print #1, ""
    Print #1, "$FirstFrame 1"                                   'Started Frame
    Print #1, "$LastFrame " + Trim$(Str$(CSMParam.Lastframe))   'Ended Frame
    Print #1, ""
    Print #1, "$Rate " + Trim$(Str$(CSMParam.Framerate))
    Print #1, ""
    Print #1, "$Order"
    
    ' Print joint names in order
    Dim tmpstr As String
    Dim i As Integer
    tmpstr = ""
    For i = 0 To JOINT_MAX
        tmpstr = tmpstr + JOINT_NAME(i) + " "
    Next i
    Print #1, tmpstr
       
    Print #1, ""
    Print #1, "$Points"
End Sub

' Append Motion Data File frame data
Public Sub CSM_WriteFrame(Avrdata() As clsWORLDCOOR) '(Motiondata() As STR_WORLDFRAME, Frameno As Long)
    Dim RowData As String
    Dim i As Integer
    
    RowData = Trim$(Str$(CSM_FrameNo))
    CSM_FrameNo = CSM_FrameNo + 1
    For i = 0 To JOINT_MAX
        RowData = RowData + "  " + Format$(Avrdata(i).X * 1000, "0.00") + " " + Format$(Avrdata(i).Y * 1000, "0.00") + " " + Format$(Avrdata(i).Z * 1000, "0.00")
'        RowData = RowData + "  " + Format$(MotionDat(Frameno).Motion(i).coor(0).X * 1000, "0.00") + " " + Format$(MotionDat(Frameno).Motion(i).coor(0).Y * 1000, "0.00") + " " + Format$(MotionDat(Frameno).Motion(i).Z * 1000, "0.00")
    Next i
    
    Print #1, RowData
End Sub

