Attribute VB_Name = "modImgProc"
Option Explicit
' ############################ Falcon Library #################################

' ====================================================================== TYPES
Public Type F_RGBRANGE
    red_min As Byte
    red_max As Byte
    green_min As Byte
    green_max As Byte
    blue_min As Byte
    blue_max As Byte
End Type

Public Type F_HSVRANGE
    hue_min As Long
    hue_max As Long
    sat_min As Long
    sat_max As Long
    val_min As Long
    val_max As Long
End Type

Public Type F_BLOB
    size As Long
    xmin As Long
    ymin As Long
    xmax As Long
    ymax As Long
    ffalse As Long
    
    'detectas As Long
    'dist As Double
End Type

Public Type F_PIXEL
    blue As Byte
    green As Byte
    red As Byte
End Type

' ====================================================================== EXTERNAL FUNCTIONS

Public Declare Sub FAL_CopyImage Lib "Falcon.dll" (ByVal Source As Long, ByVal Target As Long)

Public Declare Sub FAL_SetImageDimension Lib "Falcon.dll" (ByVal ImgWidth As Long, ByVal ImgHeight As Long)
Public Declare Function FAL_RGBThreshold Lib "Falcon.dll" (ByVal Source As Long, ByVal Target As Long, RgbRng As F_RGBRANGE) As Long
Public Declare Function FAL_HSVThreshold Lib "Falcon.dll" (ByVal Source As Long, ByVal Target As Long, HsvRng As F_HSVRANGE, ByVal HueOffset As Long) As Long
Public Declare Function FAL_PutFloodfillBorder Lib "Falcon.dll" (ByVal Target As Long) As Long
Public Declare Function FAL_AnalyseBlob1 Lib "Falcon.dll" (ByVal Source As Long) As Long
Public Declare Function FAL_AnalyseBlob2 Lib "Falcon.dll" (ByVal Source As Long, Blobs As F_BLOB, ByVal size As Long) As Long
Public Declare Sub FAL_BlobMoveFirst Lib "Falcon.dll" ()
Public Declare Function FAL_BlobGetNextS Lib "Falcon.dll" (blob As F_BLOB, ByVal SizeMin As Long, ByVal SizeMax As Long) As Long
Public Declare Function FAL_BlobGetData Lib "Falcon.dll" (blob As F_BLOB, ByVal index As Long) As Long
Public Declare Function FAL_BlobGetDataSNR Lib "Falcon.dll" (blob As F_BLOB, ByVal SizeMin As Long, ByVal SizeMax As Long, ByVal X As Long, ByVal Y As Long, ByVal Radius As Long) As Long
Public Declare Function FAL_BlobGetNextSR Lib "Falcon.dll" (blob As F_BLOB, ByVal SizeMin As Long, ByVal SizeMax As Long, ByVal X As Long, ByVal Y As Long, ByVal Radius As Long) As Long
Public Declare Function FAL_PutBlobMask Lib "Falcon.dll" (ByVal Target As Long, ByVal index As Long, Color As F_PIXEL) As Long
Public Declare Sub FAL_BlobMarkFalse Lib "Falcon.dll" (ByVal index As Long)
Public Declare Sub FAL_SetBlobData Lib "Falcon.dll" (Blobs As F_BLOB, ByVal size As Long)
Public Declare Sub FAL_UnsetBlobData Lib "Falcon.dll" ()

Public Declare Sub FAL_DrawCrosshair Lib "Falcon.dll" (ByVal Target As Long, ByVal ptx As Long, ByVal pty As Long, ByVal size As Long, Color As F_PIXEL)

Public Declare Sub RGBtoHSV Lib "Falcon.dll" (ByVal r As Single, ByVal g As Single, ByVal b As Single, h As Single, s As Single, v As Single)
Public Declare Sub HSVtoRGB Lib "Falcon.dll" (r As Single, g As Single, b As Single, ByVal h As Single, ByVal s As Single, ByVal v As Single)


