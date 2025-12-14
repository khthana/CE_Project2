'********************************************
'Class ATM  : Definition Class for new atm  *
'********************************************
Public Class ATM
    Private atmCode As String
    Private bankOwner As Bank
    Private atmLocation As String
    Private atmArea As String
    Private atmCity As String
    Private systemUsed As String
    '*************************************
    'Constructor
    '*************************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal code As String)
        atmCode = code
        bankOwner = New Bank(0)
        atmLocation = ""
        atmArea = ""
        atmCity = ""
        systemUsed = ""
    End Sub
    Public Sub New(ByVal code As String, ByVal bank As Bank, ByVal location As String, _
        ByVal area As String, ByVal city As String, ByVal sys As String)
        atmCode = code
        bankOwner = bank
        atmLocation = location
        atmArea = area
        atmCity = city
        systemUsed = sys
    End Sub
    '*************************************
    'Class Interface
    '*************************************
    Public Function GetAtmCode() As String
        Return atmCode
    End Function
    Public Function SetAtmCode(ByVal code As String)
        atmCode = code
    End Function
    Public Function GetBankCode() As Bank
        Return bankOwner
    End Function
    Public Function SetBankCode(ByVal own As Bank)
        bankOwner = own
    End Function
    Public Function GetAtmLocation() As String
        Return atmLocation
    End Function
    Public Function SetAtmLocation(ByVal location As String)
        atmLocation = location
    End Function
    Public Function GetAtmArea() As String
        Return atmArea
    End Function
    Public Function SetAtmArea(ByVal area As String)
        atmArea = area
    End Function
    Public Function GetAtmCity() As String
        Return atmCity
    End Function
    Public Function SetAtmCity(ByVal city As String)
        atmCity = city
    End Function
    Public Function GetSystemUsed() As String
        Return systemUsed
    End Function
    Public Function SetSystemUsed(ByVal sys As String)
        systemUsed = sys
    End Function
    '*************************************
    'Class Method
    '*************************************
    Public Function Save(ByVal atm As ATM) As Integer
        Dim atmDA As New ATMDA
        If (atmDA.AtmInsert(atm)) = -1 Then
            Return -1 ' ATM had already exist in database
        Else
            Return 1 ' Save successed...
        End If
    End Function
    Public Function Check(ByVal atm As ATM) As ATM
        Dim atmDA As New ATMDA
        Dim atmChecked As New ATM
        atmChecked = atmDA.AtmSelect(atm)
        Return atmChecked
    End Function

End Class
