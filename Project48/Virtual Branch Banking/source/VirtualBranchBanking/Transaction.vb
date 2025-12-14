'*******************************************************************************
'Class Transaction : Definition class for transaction when service has occurred
'*******************************************************************************
Public Class Transaction
    Private m_trCode As Integer
    Private m_trDate As Date
    Private m_trTime As TimeSpan
    Private m_trSeq As Integer
    Private m_customerUsed As Customer
    Private m_ServiceUsed As Service
    Private m_atmNo As ATM
    Private m_fromAcc As Account
    Private m_toAcc As Account
    Private m_currency As String
    Private m_chequeUsed As Cheque
    Private m_amount As Double
    Private b_successFlag As String
    '*************************************
    'Constructor
    '*************************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal code As Integer, ByVal dat As Date, ByVal time As TimeSpan, _
        ByVal seq As Integer, ByVal cus As Customer, ByVal ser As Service, ByVal atm As ATM, _
            ByVal fromAcc As Account, ByVal toAcc As Account, ByVal cur As String, _
            ByVal che As Cheque, ByVal amt As Double, ByVal flag As String)
        m_trCode = code
        m_trDate = dat
        m_trTime = time
        m_trSeq = seq
        m_customerUsed = cus
        m_ServiceUsed = ser
        m_atmNo = atm
        m_fromAcc = fromAcc
        m_toAcc = toAcc
        m_currency = cur
        m_chequeUsed = che
        m_amount = amt
        b_successFlag = flag
    End Sub
    '*************************************
    'Class Interface
    '*************************************
    Public Function GetTrCode() As Integer
        Return m_trCode
    End Function
    Public Function SetTrCode(ByVal code As Integer)
        m_trCode = code
    End Function
    Public Function GetTrDate() As Date
        Return m_trDate
    End Function
    Public Function SetTrDate(ByVal dat As Date)
        m_trDate = dat
    End Function
    Public Function GetTrTime() As TimeSpan
        Return m_trTime
    End Function
    Public Function SetTrTime(ByVal time As TimeSpan)
        m_trTime = time
    End Function
    Public Function GetTrSeq() As Integer
        Return m_trSeq
    End Function
    Public Function SetTrSeq(ByVal seq As Integer)
        m_trSeq = seq
    End Function
    Public Function GetCustomerUsed() As Customer
        Return m_customerUsed
    End Function
    Public Function SetCustomerUsed(ByVal cus As Customer)
        m_customerUsed = cus
    End Function
    Public Function GetServiceUsed() As Service
        Return m_ServiceUsed
    End Function
    Public Function SetServiceUsed(ByVal ser As Service)
        m_ServiceUsed = ser
    End Function
    Public Function GetAtmNo() As ATM
        Return m_atmNo
    End Function
    Public Function SetAtmNo(ByVal atm As ATM)
        m_atmNo = atm
    End Function
    Public Function GetFromAccount() As Account
        Return m_fromAcc
    End Function
    Public Function SetFromAccount(ByVal fromAcc As Account)
        m_fromAcc = fromAcc
    End Function
    Public Function GetToAccount() As Account
        Return m_toAcc
    End Function
    Public Function SetToAccount(ByVal toAcc As Account)
        m_toAcc = toAcc
    End Function
    Public Function GetCurrency() As String
        Return m_currency
    End Function
    Public Function SetCurrency(ByVal cur As String)
        m_currency = cur
    End Function
    Public Function GetCheque() As Cheque
        Return m_chequeUsed
    End Function
    Public Function SetCheque(ByVal cheque As Cheque)
        m_chequeUsed = cheque
    End Function
    Public Function GetAmount() As Double
        Return m_amount
    End Function
    Public Function SetAmount(ByVal amt As Double)
        m_amount = amt
    End Function
    Public Function GetSuccessFlag() As String
        Return b_successFlag
    End Function
    Public Function SetSuccessFlag(ByVal flag As String)
        b_successFlag = flag
    End Function
    '***********************************
    'Class Method
    '***********************************
    Public Function beginTransaction()
    End Function
    Public Function Commit()
    End Function
    Public Function Rollback()
    End Function
    '**********************************
    'Do transaction for each service
    '**********************************
    Public Function openNewAccTransaction(ByVal tr As Transaction)
        Dim acc1 As New Account(tr.GetFromAccount.GetAccNo)
        acc1.openNew(tr)
    End Function
    Public Function withdrawTransaction(ByVal tr As Transaction)
        Dim acc1 As New Account(tr.GetFromAccount.GetAccNo)
        acc1.withdraw(tr)
    End Function
    Public Function depositTransaction(ByVal tr As Transaction)
        Dim acc1 As New Account(tr.GetToAccount.GetAccNo)
        acc1.deposit(tr)
    End Function
    Public Function transferTransaction(ByVal tr As Transaction) As Integer
        Dim acc1 As New Account(tr.GetFromAccount.GetAccNo)
        acc1 = acc1.Check(acc1)
        acc1.withdraw(tr)
        Dim acc2 As New Account(tr.GetToAccount.GetAccNo)
        acc2 = acc2.Check(acc2)
        acc2.deposit(tr)
        '****************************************
        Dim transferHis As New TransferHis(0, Date.Today.Date, acc1, acc2, CInt(tr.GetAmount), 0, tr.GetCustomerUsed)
        Dim transferHisDA As New TransferHisDA
        If (transferHisDA.SaveTransfer(transferHis) = -1) Then
            Return -1
            Exit Function
        Else
            Return 1
            Exit Function
        End If
    End Function
    Public Function forexTransaction(ByVal tr As Transaction) As Forex
        Dim forex1 As New Forex(tr.GetCurrency, tr.GetAmount)
        Dim forexConverted As Forex = forex1.exchange(forex1)
        Return forexConverted
        Exit Function
    End Function
    Public Function ChequeVerifyTransaction(ByVal tr As Transaction) As Cheque
        Dim cheque1 As New Cheque(tr.GetCheque.GetCheckNo, tr.GetCheque.GetCheckType, tr.GetFromAccount, tr.GetCheque.GetCheckStatus)
        Dim chequeVerified As New Cheque
        chequeVerified = cheque1.Check(cheque1)
        Return chequeVerified
    End Function
    Public Function ChequeExTransaction(ByVal tr As Transaction) As Integer
        Dim cheque1 As New Cheque(tr.GetCheque.GetCheckNo, tr.GetCheque.GetCheckType, tr.GetFromAccount, tr.GetCheque.GetCheckStatus)
        If (cheque1.Exchange(cheque1, tr.GetAmount) = -1) Then
            Return -1
        Else : Return 1
        End If
    End Function
End Class