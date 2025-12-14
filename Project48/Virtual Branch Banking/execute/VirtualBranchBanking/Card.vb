'***********************************************************
'Class Card  : Definition Class for create the bank system *
'***********************************************************
Public Class Card
    Private cardNo As String
    Private cardType As String
    Private pin As String
    Private cusOwner As Customer
    Private accOwner As Account
    '********************************
    'Constructor
    '********************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal no As String)
        cardNo = no
        cardType = ""
        pin = ""
        cusOwner = New Customer(0)
        accOwner = New Account(0)
    End Sub
    Public Sub New(ByVal no As String, ByVal p As String)
        cardNo = no
        cardType = ""
        pin = p
        cusOwner = New Customer(0)
        accOwner = New Account(0)
    End Sub
    Public Sub New(ByVal no As String, ByVal type As String, ByVal p As String, _
        ByVal cus As Customer, ByVal acc As Account)
        cardNo = no
        cardType = type
        pin = p
        cusOwner = cus
        accOwner = acc
    End Sub
    '********************************
    'Class Interface
    '********************************
    Public Function GetCardNo() As String
        Return cardNo
    End Function
    Public Function SetCardNo(ByVal no As String)
        cardNo = no
    End Function
    Public Function GetCardType() As String
        Return cardType
    End Function
    Public Function SetCardType(ByVal type As String)
        cardType = type
    End Function
    Public Function GetPIN() As String
        Return pin
    End Function
    Public Function SetPIN(ByVal p As String)
        pin = p
    End Function
    Public Function GetCustomerOwner() As Customer
        Return cusOwner
    End Function
    Public Function SetCustomerOwner(ByVal cus As Customer)
        cusOwner = cus
    End Function
    Public Function GetAccOwner() As Account
        Return accOwner
    End Function
    Public Function SetAccOwner(ByVal acc As Account)
        accOwner = acc
    End Function
    '***********************************
    'Class Method
    '***********************************
    Public Function Save(ByVal card As Card) As Integer
        Dim cardDA As New CardDA
        If (cardDA.CardInsert(card)) = -1 Then
            Return -1 ' Card had already exist in database
        Else
            Return 1 ' Save successed...
        End If
    End Function
    Public Function Check(ByVal card As Card) As Card
        Dim cardDA As New CardDA
        Dim cardChecked As New Card
        cardChecked = cardDA.CardSelect(card)
        Return cardChecked
    End Function
    Public Function CheckPIN(ByVal card As Card) As Card
        Dim cardDA As New CardDA
        Dim cardChecked As New Card
        cardChecked = cardDA.CardCheckPIN(card)
        Return cardChecked
    End Function
End Class
