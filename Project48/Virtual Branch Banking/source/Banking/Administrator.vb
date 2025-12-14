'************************************************************************************
'Class Administrator  : Definition Class for new admin who maintenance the system   *
'************************************************************************************
Public Class Administrator
    Private adminID As Integer
    Private username As String
    Private password As String
    '************************************
    'Constructor
    '************************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As Integer)
        adminID = id
        username = ""
        password = ""
    End Sub
    Public Sub New(ByVal user As String, ByVal pass As String)
        adminID = 0
        username = user
        password = pass
    End Sub
    Public Sub New(ByVal id As Integer, ByVal user As String, ByVal pass As String)
        adminID = id
        username = user
        password = pass
    End Sub
    '************************************
    'Class Interface
    '************************************
    Public Function SetAdminID(ByVal id As Integer)
        adminID = id
    End Function
    Public Function SetUsername(ByVal user As String)
        username = user
    End Function
    Public Function SetPassword(ByVal pass As String)
        password = pass
    End Function
    Public Function GetAdminID() As Integer
        Return adminID
    End Function
    Public Function GetUsername() As String
        Return username
    End Function
    Public Function GetPassword() As String
        Return password
    End Function
    '******************************************
    'Class Method
    '******************************************
    Public Function Save(ByVal admin As Administrator) As Integer
        Dim adminDA As New AdminDA
        If (adminDA.adminInsert(admin)) = -1 Then
            Return -1 ' admin had already exist in database
        Else
            Return 1 ' Save successed...
        End If
    End Function
    Public Function Check(ByVal admin As Administrator) As Administrator
        Dim adminDA As New AdminDA
        Dim adminChecked As New Administrator
        adminChecked = adminDA.adminSelect(admin)
        Return adminChecked
    End Function

End Class
