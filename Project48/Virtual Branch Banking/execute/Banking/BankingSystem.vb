Public Class BankingSystem
    Private session As Integer
    Public Function GetSession() As Integer
        Return session
    End Function
    Public Function SetSession(ByVal sess As Integer)
        session = sess
    End Function
End Class
