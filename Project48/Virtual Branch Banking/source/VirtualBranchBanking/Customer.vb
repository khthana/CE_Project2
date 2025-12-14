'******************************************************************
'Class Customer : Definition Class for customer's information
'******************************************************************
Public Class Customer
    Private cusID As String
    Private enName As String
    Private enSurname As String
    Private thName As String
    Private thSurname As String
    Private dBirth As Integer
    Private mBirth As Integer
    Private yBirth As Integer
    Private age As String
    Private gender As String
    Private email As String
    Private occupation As String
    Private salary As String
    Private homePhone As String
    Private officePhone As String
    Private mobilePhone As String
    Private faxNo As String
    Private cusStatus As String
    '***************************************
    'Constructor
    '***************************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As String)
        cusID = id
        enName = ""
        enSurname = ""
        thName = ""
        thSurname = ""
        dBirth = 0
        mBirth = 0
        yBirth = 0
        age = ""
        gender = ""
        email = ""
        occupation = ""
        salary = ""
        homePhone = ""
        officePhone = ""
        mobilePhone = ""
        faxNo = ""
        cusStatus = ""
    End Sub
    Public Sub New(ByVal id As String, ByVal name As String)
        cusID = id
        enName = name
        enSurname = ""
        thName = ""
        thSurname = ""
        dBirth = 0
        mBirth = 0
        yBirth = 0
        age = ""
        gender = ""
        email = ""
        occupation = ""
        salary = ""
        homePhone = ""
        officePhone = ""
        mobilePhone = ""
        faxNo = ""
        cusStatus = ""
    End Sub
    Public Sub New(ByVal id As String, ByVal eName As String, ByVal eSurname As String, _
        ByVal tName As String, ByVal tSurname As String, ByVal day As Integer, ByVal month As Integer, _
        ByVal year As Integer, ByVal a As String, ByVal gen As String, ByVal em As String, _
        ByVal occu As String, ByVal sal As String, ByVal hPhone As String, ByVal oPhone As String, _
        ByVal mPhone As String, ByVal fax As String, ByVal status As String)
        cusID = id
        enName = eName
        enSurname = eSurname
        thName = tName
        thSurname = tSurname
        dBirth = day
        mBirth = month
        yBirth = year
        age = a
        gender = gen
        email = em
        occupation = occu
        salary = sal
        homePhone = hPhone
        officePhone = oPhone
        mobilePhone = mPhone
        faxNo = fax
        cusStatus = status
    End Sub
    '****************************************
    'Class Interface
    '****************************************
    Public Function GetcusID() As String
        Return cusID
    End Function
    Public Function SetCusID(ByVal id As String)
        cusID = id
    End Function
    Public Function GetEnName() As String
        Return enName
    End Function
    Public Function SetEnName(ByVal name As String)
        enName = name
    End Function
    Public Function GetEnSurname() As String
        Return enSurname
    End Function
    Public Function SetEnSurname(ByVal name As String)
        enSurname = name
    End Function
    Public Function GetThName() As String
        Return thName
    End Function
    Public Function SetThName(ByVal name As String)
        thName = name
    End Function
    Public Function GetThSurname() As String
        Return thSurname
    End Function
    Public Function SetThSurname(ByVal name As String)
        thSurname = name
    End Function
    Public Function GetdBirth() As Integer
        Return dBirth
    End Function
    Public Function SetdBirth(ByVal day As Integer)
        dBirth = day
    End Function
    Public Function GetmBirth() As Integer
        Return mBirth
    End Function
    Public Function SetmBirth(ByVal month As Integer)
        mBirth = month
    End Function
    Public Function GetyBirth() As Integer
        Return yBirth
    End Function
    Public Function SetyBirth(ByVal year As Integer)
        yBirth = year
    End Function
    Public Function GetAge() As String
        Return age
    End Function
    Public Function SetAge(ByVal age As String)
        age = age
    End Function
    Public Function GetGender() As String
        Return gender
    End Function
    Public Function SetGender(ByVal gender As String)
        gender = gender
    End Function
    Public Function GetEmail() As String
        Return email
    End Function
    Public Function SetEmail(ByVal email As String)
        email = email
    End Function
    Public Function GetOccu() As String
        Return occupation
    End Function
    Public Function SetOccu(ByVal occu As String)
        occupation = occu
    End Function
    Public Function GetSalary() As String
        Return salary
    End Function
    Public Function SetSalary(ByVal salary As String)
        salary = salary
    End Function
    Public Function GetHomePhone() As String
        Return homePhone
    End Function
    Public Function SetHomePhone(ByVal hPhone As String)
        homePhone = hPhone
    End Function
    Public Function GetOfficePhone() As String
        Return officePhone
    End Function
    Public Function SetOfficePhone(ByVal oPhone As String)
        officePhone = oPhone
    End Function
    Public Function GetMobilePhone() As String
        Return mobilePhone
    End Function
    Public Function SetMobilePhone(ByVal mPhone As String)
        mobilePhone = mPhone
    End Function
    Public Function GetFaxNo() As String
        Return faxNo
    End Function
    Public Function SetFaxNo(ByVal fax As String)
        faxNo = fax
    End Function
    Public Function GetStatus() As String
        Return cusStatus
    End Function
    Public Function SetStatus(ByVal status As String)
        cusStatus = status
    End Function
    '**************************************
    'Class Method
    '**************************************
    Public Overridable Function Save(ByVal cus As Customer) As Integer
        Dim cusDA As New CustomerDA
        If (cusDA.cusInsert(cus)) = -1 Then
            Return -1 ' Customer had already exist in database
        Else
            Return 1 ' Add New Customer successed...
        End If
    End Function
    Public Overridable Function Check(ByVal cus As Customer) As Customer
        Dim cusDA As New CustomerDA
        Dim cusChecked As New Customer
        cusChecked = cusDA.cusSelect(cus)
        Return cusChecked
    End Function

End Class
'*************************************************************************************

