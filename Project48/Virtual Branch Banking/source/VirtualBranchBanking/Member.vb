'***************************************************************
'Class Member  : Definition Class for the customer registered  * 
'***************************************************************
Public Class Member : Inherits Customer
    Private memberID As String
    Private username As String
    Private password As String
    Private member_exp_date As Date
    Private member_status As String
    '******************************
    'Constructor
    '******************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As String)
        memberID = id
        username = ""
        password = ""
        member_exp_date = Date.Today
        member_status = "active"
    End Sub
    Public Sub New(ByVal user As String, ByVal pass As String)
        memberID = 0
        username = user
        password = pass
        member_exp_date = Date.Today
        member_status = "active"
    End Sub
    Public Sub New(ByVal id As String, ByVal user As String, _
        ByVal pass As String, ByVal expDate As Date, ByVal status As String)
        memberID = id
        username = user
        password = pass
        member_exp_date = expDate
        member_status = status
    End Sub
    Public Sub New(ByVal id As String, ByVal user As String, _
        ByVal pass As String, ByVal expDate As Date, ByVal status As String, ByVal cus As Customer)
        memberID = id
        username = user
        password = pass
        member_exp_date = expDate
        member_status = status
        Me.SetCusID(cus.GetcusID)
    End Sub
    '******************************
    'Class Interface
    '******************************
    Public Function GetMemberID() As String
        Return memberID
    End Function
    Public Function SetMemberID(ByVal id As String)
        memberID = id
    End Function
    Public Function GetUsername() As String
        Return username
    End Function
    Public Function SetUsername(ByVal user As String)
        username = user
    End Function
    Public Function GetPassword() As String
        Return password
    End Function
    Public Function SetPassword(ByVal pass As String)
        password = pass
    End Function
    Public Function GetMemExpDate() As Date
        Return member_exp_date
    End Function
    Public Function SetMemExpDate(ByVal dat As Date)
        member_exp_date = dat
    End Function
    Public Function GetMemStatus() As String
        Return member_status
    End Function
    Public Function SetMemStatus(ByVal status As String)
        member_status = status
    End Function
    '***********************************
    'Class Method
    '***********************************
    Public Overloads Function Save(ByVal mem As Member) As Integer
        Dim memDA As New MemberDA
        If (memDA.MemberInsert(mem)) = -1 Then
            Return -1 ' Member had already exist in database
        Else
            Return 1 ' Save successed...
        End If
    End Function
    Public Overloads Function Check(ByVal mem As Member) As Member
        Dim memDA As New MemberDA
        Dim memChecked As New Member
        memChecked = memDA.MemberSelect(mem)
        Return memChecked
    End Function
    Public Function UpdateUser(ByVal mem As Member) As Integer
        Dim memDA As New MemberDA
        If (memDA.MemberUpdateUser(mem) = -1) Then
            Return -1
        Else : Return 1
        End If
    End Function
    Public Function UpdatePass(ByVal mem As Member) As Integer
        Dim memDA As New MemberDA
        If (memDA.MemberUpdatePass(mem) = -1) Then
            Return -1
        Else : Return 1
        End If
    End Function
End Class