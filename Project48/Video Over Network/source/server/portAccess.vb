Imports System
Imports System.Runtime.InteropServices
Public Class portAccess
    Public Declare Function Out32 Lib "inpout32.dll" _
   (ByVal address As Integer, ByVal value As Integer) As Integer
    Public Declare Function Inp32 Lib "inpout32.dll" _
   (ByVal address As Integer) As Integer
End Class
