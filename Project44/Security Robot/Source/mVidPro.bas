Attribute VB_Name = "mVidProcessing"
Option Explicit

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)


'***********************************************
'TFrameBufferInfo based on Win32 VIDEOHDR STRUCT
'By Ray Mercer Copyright (c) 1997
'***********************************************
'/* video data block header */
'typedef struct videohdr_tag {
'    LPBYTE      lpData;                 /* pointer to locked data buffer */
'    DWORD       dwBufferLength;         /* Length of data buffer */
'    DWORD       dwBytesUsed;            /* Bytes actually used */
'    DWORD       dwTimeCaptured;         /* Milliseconds from start of stream */
'    DWORD       dwUser;                 /* for client's use */
'    DWORD       dwFlags;                /* assorted flags (see defines) */
'    DWORD       dwReserved[4];          /* reserved for driver */
'} VIDEOHDR, NEAR *PVIDEOHDR, FAR * LPVIDEOHDR;
Private Type TFrameBufferInfo
    lpData As Long          'locked pointer to frame buffer bits
    dwBufLen As Long
    dwBytesUsed As Long     ' size of locked pointer in bytes
    dwTimeStamp As Long
    dwUser As Long
    dwFlags As Long
    dwReserved(4) As Long
End Type
''//BITMAP DEFINES (from mmsystem.h)
'Public Type TBITMAPINFOHEADER
'   biSize As Long
'   biWidth As Long
'   biHeight As Long
'   biPlanes As Integer
'   biBitCount As Integer
'   biCompression As Long
'   biSizeImage As Long
'   biXPelsPerMeter As Long
'   biYPelsPerMeter As Long
'   biClrUsed As Long
'   biClrImportant As Long
'End Type
'
'Public Type TBITMAPINFO
'    bmiHeader As TBITMAPINFOHEADER
'    bmiColors() As Long 'array of RGBQUADs
'End Type
'
'Public Type TBITMAP
'        bmType As Long
'        bmWidth As Long
'        bmHeight As Long
'        bmWidthBytes As Long
'        bmPlanes As Integer
'        bmBitsPixel As Integer
'        bmBits As Long
'End Type

Public Sub MessWithVidBits(ByVal lpVHdr As Long)

    Static vidFrameBuffer As TFrameBufferInfo
    
    'copy the VideoHeader data into the VB UDT
    Call CopyMem(vidFrameBuffer, ByVal lpVHdr, Len(vidFrameBuffer))
    
    'Now we can access the members
    Debug.Print "Buffer Length: " & vidFrameBuffer.dwBufLen
    Debug.Print "Bytes Used: " & vidFrameBuffer.dwBytesUsed
    Debug.Print "Flags: " & vidFrameBuffer.dwFlags
    Debug.Print "TimeStamp: " & vidFrameBuffer.dwTimeStamp
    Debug.Print "User Data: " & vidFrameBuffer.dwUser
    Debug.Print "Pointer To Data: " & vidFrameBuffer.lpData
    
    
    'Version 1.00 of the ezVidCap.ocx does not support modifying the
    'dib data before writing to disk / previewing.  Development is
    'underway to support this functionality in a future version of
    'the control.
    
    'In this version of the control, I simply raise an event each time
    'a frame is captured in preview mode or a video buffer is filled in
    'streaming mode and then continue processing.  therefore the data
    'pointer in this event is not guaranteed to be valid by the time
    'you can access it from VB and any changes you make to the data will
    'most likely occur _after_ the callback function has returned and
    'will be too late.  Stay tuned for version 2 :-)
    
    'http://i.am/shrinkwrapvb
    
    
End Sub

