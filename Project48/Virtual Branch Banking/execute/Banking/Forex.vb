'*******************************************************************************
'Class Forex  : Definition Class for insert new foreing exchange to the system *
'*******************************************************************************
Public Class Forex
    Private currency As String
    Private rate As Double
    Private amount As Double
    '*******************
    'Constructor
    '*******************
    Public Sub New()
    End Sub
    Public Sub New(ByVal cur As String)
        currency = cur
        rate = 0
        amount = 0
    End Sub
    Public Sub New(ByVal cur As String, ByVal amt As Double)
        currency = cur
        rate = 0
        amount = amt
    End Sub
    Public Sub New(ByVal cur As String, ByVal r As Double, ByVal amt As Double)
        currency = cur
        rate = r
        amount = amt
    End Sub
    '*******************
    'Class Interface
    '*******************
    Public Function GetCurrency() As String
        Return currency
    End Function
    Public Function SetCurrency(ByVal cur As String)
        currency = cur
    End Function
    Public Function GetRate() As Double
        Return rate
    End Function
    Public Function SetRate(ByVal r As Double)
        rate = r
    End Function
    Public Function GetAmount() As Double
        Return amount
    End Function
    Public Function SetAmount(ByVal amt As Double)
        amount = amt
    End Function
    '*******************
    'Class Method
    '*******************
    Public Function Save(ByVal forex As Forex) As Integer
        Dim forexDA As New ForexDA
        If (forexDA.ForexInsert(forex) = -1) Then
            Return -1
        Else
            Return 1
        End If
    End Function
End Class
