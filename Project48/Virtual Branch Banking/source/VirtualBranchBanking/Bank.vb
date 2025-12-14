'***********************************************************
'Class Bank  : Definition Class for create the bank system *
'***********************************************************
Public Class Bank
    Private bankID As String
    Private bankName As String
    Private bankLocation As String
    '**************************************
    'Constructor
    '**************************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As String)
        bankID = id
        bankName = ""
        bankLocation = ""
    End Sub
    Public Sub New(ByVal id As String, ByVal name As String)
        bankID = id
        bankName = name
        bankLocation = ""
    End Sub
    Public Sub New(ByVal id As String, ByVal name As String, ByVal location As String)
        bankID = id
        bankName = name
        bankLocation = location
    End Sub
    '************************************
    'Class Interface
    '************************************
    Public Function GetBankID() As String
        Return bankID
    End Function
    Public Function GetBankName() As String
        Return bankName
    End Function
    Public Function GetBankLocation() As String
        Return bankLocation
    End Function
    Public Function SetBankID(ByVal id As String)
        bankID = id
    End Function
    Public Function SetBankName(ByVal name As String)
        bankName = name
    End Function
    Public Function SetBankLocation(ByVal location As String)
        bankLocation = location
    End Function
    '***************************************
    'Class Method
    '***************************************
    Public Function createSystem()
        Dim BankingSystem As New BankingSystem
        BankingSystem.start_system()
    End Function

End Class

