Attribute VB_Name = "mdlDES"
Option Explicit
Public Declare Function DES_Hex Lib "diCryptoSys.dll" (ByVal soutput As String, ByVal sInput As String, ByVal sKey As String, ByVal bEncrypt As Boolean) As Long
Public Declare Function DES_BytesMode Lib "diCryptoSys.dll" (ByRef aResult As Byte, ByRef aData As Byte, ByVal lngDataLen As Long, ByRef aKey As Byte, ByVal bEncrypt As Boolean, ByVal sMode As String, ByRef aInitV As Byte) As Long
