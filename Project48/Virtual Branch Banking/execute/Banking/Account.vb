'******************************************************************
'Class Account  : Definition Class for customer's account in bank *
'******************************************************************
Public Class Account
    Private accNo As Double
    Private accType As String
    Private curBalance As Double
    Private avalBalance As Double
    Private owner As Customer
    Private openDate As Date
    Private closeDate As Date

    '******************************
    'Costructor                   *
    '******************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal no As Double)
        accNo = no
        accType = ""
        curBalance = 0
        avalBalance = 0
        owner = New Customer
        openDate = Date.Today
        closeDate = Date.Today
    End Sub
    Public Sub New(ByVal no As Double, ByVal type As String, ByVal curBal As Double, _
        ByVal avalBal As Double, ByVal own As Customer, ByVal open As Date, ByVal close As Date)
        accNo = no
        accType = type
        curBalance = curBal
        avalBalance = avalBal
        owner = own
        openDate = open
        closeDate = close
    End Sub
    '*******************************
    'Class Interface               *
    '*******************************
    Public Function GetAccNo() As Double
        Return accNo
    End Function
    Public Function SetAccNo(ByVal no As Double)
        accNo = no
    End Function
    Public Function GetAccType() As String
        Return accType
    End Function
    Public Function SetAccType(ByVal type As String)
        accType = type
    End Function
    Public Function GetCurrentBalance() As Double
        Return curBalance
    End Function
    Public Function SetCurrentBalance(ByVal curBal As Double)
        curBalance = curBal
    End Function
    Public Function GetAvalBalance() As Double
        Return avalBalance
    End Function
    Public Function SetAvalBalance(ByVal avalBal As Double)
        avalBalance = avalBal
    End Function
    Public Function GetOwner() As Customer
        Return owner
    End Function
    Public Function SetOwner(ByVal own As Customer)
        owner = own
    End Function
    Public Function GetOpenDate() As Date
        Return openDate
    End Function
    Public Function SetOpenDate(ByVal open As Date)
        openDate = open
    End Function
    Public Function GetCloseDate() As Date
        Return closeDate
    End Function
    Public Function SetCloseDate(ByVal close As Date)
        closeDate = close
    End Function

    '***********************************************************
    'Class Method                                              *
    '***********************************************************
    'Save   : insert the new account in to system              *
    '***********************************************************
    Public Function Save(ByVal acct As Account) As Integer
        Dim acctDA As New AccountDA
        If (acctDA.accountInsert(acct)) = -1 Then
            Return -1 ' Account had already exist in database
        Else
            Dim accHis1 As New AccountHis(0, acct, Date.Today.Date, 0, acct.GetAvalBalance, 0, acct.GetAvalBalance)
            Dim accHisDA1 As New AccountHisDA
            If (accHisDA1.accountHisInsert(accHis1) = -1) Then
                Return -1
            Else
                Return 1
            End If
            Return 1 ' Save successed...
        End If
    End Function
    '************************************************************
    'Check   : Verify account and get the account's information *
    '************************************************************
    Public Function Check(ByVal acct As Account) As Account
        Dim acctDA As New AccountDA
        Dim acctChecked As New Account
        acctChecked = acctDA.accountSelect(acct)
        Return acctChecked
    End Function

End Class