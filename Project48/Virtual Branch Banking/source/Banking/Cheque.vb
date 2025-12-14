'*************************************************************************
'Class Cheque  : Definition Class for new cheque as current account type *
'*************************************************************************
Public Class Checque
    Private chequeNo As Integer
    Private chequeType As String
    Private acc_no As Account
    Private cheque_status As String
    '**********************
    'Constructor
    '**********************
    Public Sub New()
    End Sub
    Public Sub New(ByVal no As Integer, ByVal type As String, ByVal acc As Account, ByVal status As String)
        chequeNo = no
        chequeType = type
        acc_no = acc
        cheque_status = status
    End Sub
    '**********************
    'Classinterface
    '**********************
    Public Function GetCheckNo() As Integer
        Return chequeNo
    End Function
    Public Function SetCheckNo(ByVal no As Integer)
        chequeNo = no
    End Function
    Public Function GetAccNo() As Account
        Return acc_no
    End Function
    Public Function SetAccNo(ByVal acc As Account)
        acc_no = acc
    End Function
    Public Function GetCheckType() As String
        Return chequeType
    End Function
    Public Function SetCheckType(ByVal type As String)
        chequeType = type
    End Function
    Public Function GetCheckStatus() As Integer
        Return cheque_status
    End Function
    Public Function SetCheckStatus(ByVal status As String)
        cheque_status = status
    End Function
    '********************************
End Class


