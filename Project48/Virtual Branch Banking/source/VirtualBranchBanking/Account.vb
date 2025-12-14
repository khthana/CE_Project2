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
    Private accHis As String
    '******************************
    'Constructor                  *
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
    Public Sub New(ByVal no As Double, ByVal cus As Customer)
        accNo = no
        accType = ""
        curBalance = 0
        avalBalance = 0
        owner = cus
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
    'Class Interface
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

    '************************************************************
    'Class Method                                               *
    '************************************************************
    'Save   : insert the new account in to system               *
    '************************************************************
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
    '************************************************************
    'CheckAccNo   : Verify account and get the account number   *
    '************************************************************
    Public Function CheckAccNo(ByVal acct As Account) As Account
        Dim acctDA As New AccountDA
        Dim acctChecked As New Account
        acctChecked = acctDA.accountSelectAccNo(acct)
        Return acctChecked
    End Function
    '****************************************************************
    'CheckCustomer   : Verify account and get the account's owner   *
    '****************************************************************
    Public Function CheckCustomer(ByVal acct As Account) As Account
        Dim acctDA As New AccountDA
        Dim acctCheckedCus As New Account
        acctCheckedCus = acctDA.accountCheckCus(acct)
        Return acctCheckedCus
    End Function
    '************************************************************
    'accUpdate  : Update the new accoun's value to the database *
    '************************************************************
    Public Function accUpdate(ByVal acct As Account) As Integer
        Dim acctDA As New AccountDA
        If (acctDA.accountUpdate(acct)) = -1 Then
            Return -1 ' Cannot update account...
        Else
            Return 1 ' Update successed...
        End If
    End Function
    '************************************************************
    'openNew  : create the new account                          *
    '************************************************************
    Public Function openNew(ByVal tr As Transaction)
        Dim acct1 As Account = tr.GetFromAccount
        If (acct1.Save(acct1)) = 1 Then ' Add New Account Successed...
        Else ' Account had already exist in database
        End If
    End Function
    '************************************************************
    'withdraw  : withdraw and update the new balance            *
    '************************************************************
    Public Function withdraw(ByVal tr As Transaction)
        Dim i As Integer = 0
        Dim oldAccAval1 As Integer = 0
        Dim newAccAval1 As Integer = 0
        Dim oldAccCur1 As Integer = 0
        Dim newAccCur1 As Integer = 0
        If (tr.GetFromAccount.GetAccNo = 0) Then
            Return -1
        Else
            If (tr.GetFromAccount.GetAvalBalance < tr.GetAmount) Then
                Return -1 'ถอนเงินมากกว่าจำนวนที่มีอยู่ในบัญชี
            Else
                oldAccCur1 = tr.GetFromAccount.GetCurrentBalance
                oldAccAval1 = tr.GetFromAccount.GetAvalBalance
                newAccCur1 = oldAccCur1 - CInt(tr.GetAmount)
                newAccAval1 = oldAccAval1 - CInt(tr.GetAmount)

                Dim accUpdate1 As New Account(tr.GetFromAccount.GetAccNo, tr.GetFromAccount.GetAccType, _
                    newAccCur1, newAccAval1, tr.GetFromAccount.GetOwner, tr.GetFromAccount.GetOpenDate, tr.GetFromAccount.GetCloseDate)
                If (accUpdate1.accUpdate(accUpdate1) = -1) Then '"Cannot update Account..."
                    Return -1
                Else
                    Dim accHis1 As New AccountHis(0, accUpdate1, Date.Today.Date, tr.GetAmount, 0, 0, newAccAval1)
                    Dim accHisDA1 As New AccountHisDA
                    If (accHisDA1.accountHisInsert(accHis1) = -1) Then 'Cannot save account history..."
                        Return -1
                    Else
                        Return 1
                    End If
                End If
            End If
        End If
    End Function
    '************************************************************
    'deposit  : deposit and update then new balance             *
    '************************************************************
    Public Function deposit(ByVal tr As Transaction)
        Dim i As Integer = 0
        Dim oldAccAval1 As Integer = 0
        Dim newAccAval1 As Integer = 0
        Dim oldAccCur1 As Integer = 0
        Dim newAccCur1 As Integer = 0

        If (tr.GetToAccount.GetAccNo = 0) Then
            'showtext.Text = "Invalid Account..."
            Return -1
        Else
            oldAccCur1 = tr.GetToAccount.GetCurrentBalance
            oldAccAval1 = tr.GetToAccount.GetAvalBalance
            newAccCur1 = oldAccCur1 + CInt(tr.GetAmount)
            newAccAval1 = oldAccAval1 + CInt(tr.GetAmount)

            Dim accUpdate1 As New Account(tr.GetToAccount.GetAccNo, tr.GetToAccount.GetAccType, _
                newAccCur1, newAccAval1, tr.GetToAccount.GetOwner, tr.GetToAccount.GetOpenDate, tr.GetToAccount.GetCloseDate)
            If (accUpdate1.accUpdate(accUpdate1) = -1) Then
                Return -1
            Else
                Dim accHis1 As New AccountHis(0, accUpdate1, Date.Today.Date, 0, tr.GetAmount, 0, newAccAval1)
                Dim accHisDA1 As New AccountHisDA
                If (accHisDA1.accountHisInsert(accHis1) = -1) Then
                    Return -1
                Else
                    Return 1
                End If
            End If
        End If
    End Function
End Class
'*********************************************

