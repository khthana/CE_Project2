Attribute VB_Name = "Module1"
Type DifArray
    arr(0 To 31, 0 To 31) As Integer
End Type
Type DifTbl
    arr(0 To 9) As DifArray
    val As Integer
End Type

Global Const size = 10
'Global eliminated_image_array(maxx, maxy) As Integer    ' For new value that eliminated noise already
'Global detected_image_array(maxx, maxy) As Integer
Global represented_array(0 To 31, 0 To 31) As Integer
Global FileName As String
Global Sql_Command As String
Global arr(size - 1, size - 1) As Integer
Global maxx, maxy As Integer
Global color() As Integer
Global OraSession As OraSession
Global OraDatabase As OraDatabase
Global OraDynaset  As OraDynaset
    
