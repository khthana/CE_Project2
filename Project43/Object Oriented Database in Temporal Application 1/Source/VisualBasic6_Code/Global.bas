Attribute VB_Name = "Global"
Option Explicit
Public cache As CacheObject.Factory
Public Student As Object
Public SdIdHistory() As Object
Public Reg As Object
Public Subject As Object
Public course As Object


Public Sub ConnectObjects(Address As String)
    ' Connects Cacheobject to the Cacheserver specified in Address
    Dim ok As Boolean
    Set cache = CreateObject("CacheObject.Factory")
    If Address = "" Then
        Address = cache.ConnectDlg
        If Address = "" Then End
    End If
    ok = cache.Connect(Address)
    If Not ok Then
        MsgBox "Failed to Connect to Cache Object Server"
        End
    End If
End Sub

Public Sub VBErrorBox(Title As String)
    ' Produces an error box from the VB Err object, with the specified Title
    Dim msg As String
    msg = ""
    msg = msg & "Error From        : " & Err.Source & vbCr
    msg = msg & "Error Number      : " & Err.Number & vbCr
    msg = msg & "Error Description : " & Err.Description
    MsgBox msg, , Title
End Sub

