'*************************************************************************
'Class Cheque  : Definition Class for new cheque as current account type *
'*************************************************************************
Public Class Cheque
    Private chequeNo As Integer
    Private chequeType As String
    Private accountUsed As Account
    Private cheque_status As String
    '**********************
    'Constructor
    '**********************
    Public Sub New()
    End Sub
    Public Sub New(ByVal no As Integer)
        chequeNo = no
        chequeType = ""
        accountUsed = New Account(0)
        cheque_status = ""
    End Sub
    Public Sub New(ByVal no As Integer, ByVal type As String, ByVal acc As Account, ByVal status As String)
        chequeNo = no
        chequeType = type
        accountUsed = acc
        cheque_status = status
    End Sub
    '**********************
    'Class Interface
    '**********************
    Public Function GetCheckNo() As Integer
        Return chequeNo
    End Function
    Public Function SetCheckNo(ByVal no As Integer)
        chequeNo = no
    End Function
    Public Function GetAccount() As Account
        Return accountUsed
    End Function
    Public Function SetAccNo(ByVal acc As Account)
        accountUsed = acc
    End Function
    Public Function GetCheckType() As String
        Return chequeType
    End Function
    Public Function SetCheckType(ByVal type As String)
        chequeType = type
    End Function
    Public Function GetCheckStatus() As String
        Return cheque_status
    End Function
    Public Function SetCheckStatus(ByVal status As String)
        cheque_status = status
    End Function
    '********************************
    'Class Method
    '********************************
    Public Function Check(ByVal cheq As Cheque) As Cheque
        Dim cheqDA As New ChequeDA
        Dim chequeChecked As New Cheque
        chequeChecked = cheqDA.Check(cheq)
        Return chequeChecked
    End Function
    '********************************
    Public Function Exchange(ByVal cheq As Cheque, ByVal amt As Double) As Integer
        Dim i As Integer = 0
        Dim oldAccAval1 As Integer = 0
        Dim newAccAval1 As Integer = 0
        Dim oldAccCur1 As Integer = 0
        Dim newAccCur1 As Integer = 0

        oldAccCur1 = cheq.GetAccount.GetCurrentBalance
        oldAccAval1 = cheq.GetAccount.GetAvalBalance
        newAccCur1 = oldAccCur1 - amt
        newAccAval1 = oldAccAval1 - amt

        Dim accUpdate1 As New Account(cheq.GetAccount.GetAccNo, cheq.GetAccount.GetAccType, _
                newAccCur1, newAccAval1, cheq.GetAccount.GetOwner, cheq.GetAccount.GetOpenDate, cheq.GetAccount.GetCloseDate)
        If (accUpdate1.accUpdate(accUpdate1) = -1) Then
            Return -1
        Else
            Dim accHis1 As New AccountHis(0, accUpdate1, Date.Today.Date, amt, 0, 0, newAccAval1)
            Dim accHisDA1 As New AccountHisDA
            If (accHisDA1.accountHisInsert(accHis1) = -1) Then
                Return -1
            Else
                Dim cheqDA As New ChequeDA
                If (cheqDA.Update(cheq) = -1) Then
                    Return -1
                Else : Return 1
                End If
                Return 1
            End If
        End If
    End Function
End Class


