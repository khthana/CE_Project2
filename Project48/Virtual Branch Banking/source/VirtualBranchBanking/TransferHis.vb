'***************************************************************************
'Class TranferHis : Definition class for transfer history transaction
'***************************************************************************
Public Class TransferHis
    Private transferHisID As Integer
    Private dueDate As Date
    Private fromAccount As Account
    Private fromAccountType As String
    Private toAccount As Account
    Private toAccountType As String
    Private amount As Double
    Private fee As Double
    Private cusUsed As Customer
    '**********************************
    'Constructor
    '**********************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As Integer)
        transferHisID = id
        dueDate = Date.Today.Date
        fromAccount = New Account
        fromAccountType = fromAccount.GetAccType
        toAccount = New Account
        toAccountType = toAccount.GetAccType
        amount = 0
        fee = 0
        cusUsed = New Customer
    End Sub
    Public Sub New(ByVal id As Integer, ByVal cus As Customer)
        transferHisID = id
        dueDate = Date.Today.Date
        fromAccount = New Account
        fromAccountType = fromAccount.GetAccType
        toAccount = New Account
        toAccountType = toAccount.GetAccType
        amount = 0
        fee = 0
        cusUsed = cus
    End Sub
    Public Sub New(ByVal id As Integer, ByVal dat As Date, ByVal fromAcc As Account, _
        ByVal toAcc As Account, ByVal amt As Double, ByVal fe As Double, ByVal cus As Customer)
        transferHisID = id
        dueDate = dat
        fromAccount = fromAcc
        fromAccountType = fromAcc.GetAccType
        toAccount = toAcc
        toAccountType = toAccount.GetAccType
        amount = amt
        fee = fe
        cusUsed = cus
    End Sub
    '**********************************
    'Class Interface
    '**********************************
    Public Function GetTransferHisID() As Integer
        Return transferHisID
    End Function
    Public Function SetTransferHisID(ByVal id As Integer)
        transferHisID = id
    End Function
    Public Function GetDueDate() As Date
        Return dueDate
    End Function
    Public Function SetDueDate(ByVal dat As Date)
        dueDate = dat
    End Function
    Public Function GetFromAccount() As Account
        Return fromAccount
    End Function
    Public Function SetFromAccount(ByVal fromAcc As Account)
        fromAccount = fromAcc
    End Function
    Public Function GetToAccount() As Account
        Return toAccount
    End Function
    Public Function SetToAccount(ByVal toAcc As Account)
        toAccount = toAcc
    End Function
    Public Function GetAmount() As Double
        Return amount
    End Function
    Public Function SetAmount(ByVal amt As Double)
        amount = amt
    End Function
    Public Function GetFee() As Double
        Return fee
    End Function
    Public Function SetFee(ByVal fe As Double)
        fee = fe
    End Function
    Public Function GetCusUsed() As Customer
        Return cusUsed
    End Function
    Public Function SetCusUsed(ByVal cus As Customer)
        cusUsed = cus
    End Function
    '************************************8
End Class
