'***********************************************************
'Class AccountHis  : Definition Class for account history  *
'***********************************************************
Public Class AccountHis : Inherits Account
    Private accHisID As Integer
    Private accOwner As Account
    Private dueDate As Date
    Private amtWithdraw As Double
    Private amtDeposit As Double
    Private fee As Double
    Private reBalance As Double
    '**********************************
    'Constructor
    '**********************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As Integer)
        accHisID = id
        dueDate = Date.Today
        amtWithdraw = 0
        amtDeposit = 0
        fee = 0
        reBalance = 0
    End Sub
    Public Sub New(ByVal id As Integer, ByVal acc As Account, ByVal dat As Date, ByVal wit As Double, _
        ByVal dep As Double, ByVal fe As Double, ByVal bal As Double)
        accHisID = id
        accOwner = acc
        dueDate = dat
        amtWithdraw = wit
        amtDeposit = dep
        fee = fe
        reBalance = bal
    End Sub
    '**********************************
    'Class Interface
    '**********************************
    Public Function GetAccHisID() As Integer
        Return accHisID
    End Function
    Public Function SetAccHisID(ByVal id As Integer)
        accHisID = id
    End Function
    Public Function GetAccOwner() As Account
        Return accOwner
    End Function
    Public Function SetAccOwner(ByVal acc As Account)
        accOwner = acc
    End Function
    Public Function GetDueDate() As Date
        Return dueDate
    End Function
    Public Function SetDueDate(ByVal dat As Date)
        dueDate = dat
    End Function
    Public Function GetAmtWithdraw() As Double
        Return amtWithdraw
    End Function
    Public Function SetAmtWithdraw(ByVal wit As Double)
        amtWithdraw = wit
    End Function
    Public Function GetAmtDeposit() As Double
        Return amtDeposit
    End Function
    Public Function SetAmtDeposit(ByVal dep As Double)
        amtDeposit = dep
    End Function
    Public Function GetFee() As Double
        Return fee
    End Function
    Public Function SetFee(ByVal fe As Double)
        fee = fe
    End Function
    Public Function GetRemainBalance() As Double
        Return reBalance
    End Function
    Public Function SetRemainBalance(ByVal bal As Double)
        reBalance = bal
    End Function
    '***********************************
End Class
