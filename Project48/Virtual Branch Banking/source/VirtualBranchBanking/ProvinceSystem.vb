'***************************************************************************
'Class Province system : Use for ATM in uptown
'***************************************************************************
Public Class ProvinceSystem : Inherits BankingSystem
    '********************************************************
    'Method withdraw service use for withdrawwal transaction.
    '********************************************************
    Public Overrides Function withdrawService(ByVal cusID As String, ByVal fromAcc As String, ByVal amt As Double, ByVal atm As ATM) As Integer
        Dim cus1 As New Customer(cusID)
        Dim cusChecked As Customer = cus1.Check(cus1)
        '***********************************************
        Dim acc1 As New Account(fromAcc)
        Dim acc1Selected As Account = acc1.Check(acc1)
        '***********************************************
        Dim service1 As New Service(0, "withdraw", "Access account")
        '***********************************************
        Dim tr As New Transaction(0, Date.Today.Date, Date.Today.TimeOfDay, 0, cus1, service1, _
            atm, acc1Selected, New Account(0), "THB", New Cheque(0), amt, "true")
        tr.withdrawTransaction(tr)
    End Function
    '**********************************************************************
    'Method open new account service use for open new account transaction.
    '**********************************************************************
    Public Overrides Function openNewAccService(ByVal cusID As String, _
        ByVal newAccNo As String, ByVal newAccType As String, ByVal amt As Double, ByVal atm As ATM)
        '***********************************************
        Dim cus1 As New Customer(cusID)
        Dim cusChecked As Customer = cus1.Check(cus1)
        '***********************************************
        Dim acct1 As New Account(newAccNo, newAccType, amt, amt, cusChecked, Date.Today, Date.Today)
        '***********************************************
        Dim service1 As New Service(0, "openNewAcc", "Access account")
        '***********************************************
        Dim tr As New Transaction(0, Date.Today.Date, Date.Today.TimeOfDay, 0, cus1, service1, _
                atm, acct1, New Account(0), "THB", New Cheque(0), amt, "true")
        tr.openNewAccTransaction(tr)
    End Function
    '********************************************************
    'Method deposit service use for deposit transaction.
    '********************************************************
    Public Overrides Function depositService(ByVal cusID As String, ByVal toAcc As String, ByVal amt As Double, ByVal atm As ATM) As Integer
        Dim cus1 As New Customer(cusID)
        Dim cusChecked As Customer = cus1.Check(cus1)
        '***********************************************
        Dim acc1 As New Account(toAcc)
        Dim acc1Selected As Account = acc1.Check(acc1)
        '***********************************************
        Dim service1 As New Service(0, "deposit", "Access account")
        '***********************************************
        Dim tr As New Transaction(0, Date.Today.Date, Date.Today.TimeOfDay, 0, cus1, service1, _
            atm, New Account(0), acc1Selected, "THB", New Cheque(0), amt, "true")
        tr.depositTransaction(tr)
    End Function
    '************************************************************
    'Method transfer service use for transfer funds transaction.
    '************************************************************
    Public Overrides Function transferService(ByVal cusID As String, ByVal fromAcc As String, ByVal toAcc As String, ByVal amt As Double, ByVal atm As ATM) As Integer
        Dim cus1 As New Customer(cusID)
        Dim cusChecked As Customer = cus1.Check(cus1)
        '***********************************************
        Dim acc1 As New Account(fromAcc)
        Dim acc1Selected As Account = acc1.Check(acc1)
        Dim acc2 As New Account(toAcc)
        Dim acc2Selected As Account = acc2.Check(acc2)
        '***********************************************
        Dim service1 As New Service(0, "transfer", "Access account")
        '***********************************************
        Dim tr As New Transaction(0, Date.Today.Date, Date.Today.TimeOfDay, 0, cus1, service1, _
            atm, acc1Selected, acc2Selected, "THB", New Cheque(0), amt, "true")
        tr.transferTransaction(tr)
    End Function
    '************************************************************
    'Method forex service use for foreign exchange transaction.
    '************************************************************
    Public Overrides Function forexService(ByVal cusID As String, ByVal fromCur As String, ByVal amt As Double, ByVal atm As ATM) As Forex
        Dim cus1 As New Customer(cusID)
        Dim cusChecked As Customer = cus1.Check(cus1)
        '***********************************************
        Dim service1 As New Service(0, "foreign exchange", "Special Service")
        '***********************************************
        Dim tr As New Transaction(0, Date.Today.Date, Date.Today.TimeOfDay, 0, cus1, service1, _
                    atm, New Account(0), New Account(0), fromCur, New Cheque(0), amt, "true")
        Dim forexConverted As Forex = tr.forexTransaction(tr)
        '***********************************************
        Return forexConverted
    End Function
    '*************************************************************
    'Method chequeEx service use for cheque exchange transaction.
    '*************************************************************
    Public Overrides Function chequeExService(ByVal cusID As String, ByVal checkNo As Integer, ByVal accNo As Double, ByVal amt As Double, ByVal atm As ATM) As Integer
        Return 1
    End Function
    '********************************************************
    Public Overrides Function chequeVerifyService(ByVal cusID As String, ByVal checkNo As Integer, ByVal accNo As Double, ByVal atm As ATM) As Cheque
        Dim cus1 As New Customer(cusID)
        Dim cusChecked As Customer = cus1.Check(cus1)
        '***********************************************
        Dim service1 As New Service(0, "cheque verify", "Special Service")
        '***********************************************
        Dim acc1 As New Account(accNo)
        Dim acc1Checked As Account = acc1.Check(acc1)
        '***********************************************
        Dim cheque1 As New Cheque(checkNo, "", acc1Checked, "")
        '***********************************************
        Dim tr As New Transaction(0, Date.Today.Date, Date.Today.TimeOfDay, 0, cus1, service1, _
                    atm, acc1Checked, New Account(0), "", cheque1, 0, "true")
        Dim chequeVerified As Cheque = tr.ChequeVerifyTransaction(tr)
        '***********************************************
        Return chequeVerified
    End Function
End Class
