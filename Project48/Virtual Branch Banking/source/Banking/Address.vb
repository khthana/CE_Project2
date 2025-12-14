'********************************************************************
'Class Address  : Definition Class for customer's address           *
'********************************************************************
Public Class Address
    Private cusID As New Customer
    Private addType As String
    Private addNo As String
    Private soi As String
    Private street As String
    Private district As String
    Private city As String
    Private state As String
    Private postcode As String

    Public Sub New()
    End Sub
    Public Sub New(ByVal cus As Customer)
        cusID = cus
        addType = ""
        addNo = ""
        soi = ""
        street = ""
        district = ""
        city = ""
        state = ""
        postcode = ""
    End Sub
    Public Sub New(ByVal cus As Customer, ByVal type As String, ByVal no As String, _
        ByVal s As String, ByVal strt As String, ByVal dist As String, ByVal ci As String, _
        ByVal sta As String, ByVal post As String)
        cusID = cus
        addType = type
        addNo = no
        soi = s
        street = strt
        district = dist
        city = ci
        state = sta
        postcode = post
    End Sub
    '************************************
    'Class Interface
    '************************************
    Public Function GetCustomer() As Customer
        Return cusID
    End Function
    Public Function SetCustomer(ByVal cus As Customer)
        cusID = cus
    End Function
    Public Function GetAddType() As String
        Return addType
    End Function
    Public Function SetAddType(ByVal type As String)
        addType = type
    End Function
    Public Function GetAddNo() As String
        Return addNo
    End Function
    Public Function SetAddNo(ByVal no As String)
        addNo = no
    End Function
    Public Function GetSoi() As String
        Return soi
    End Function
    Public Function SetSoi(ByVal soi As String)
        soi = soi
    End Function
    Public Function GetStreet() As String
        Return street
    End Function
    Public Function SetStreet(ByVal street As String)
        street = street
    End Function
    Public Function GetDistrict() As String
        Return district
    End Function
    Public Function SetDistrict(ByVal dist As String)
        district = dist
    End Function
    Public Function GetCity() As String
        Return city
    End Function
    Public Function SetCity(ByVal city As String)
        city = city
    End Function
    Public Function GetState() As String
        Return state
    End Function
    Public Function SetState(ByVal state As String)
        state = state
    End Function
    Public Function GetPostCode() As String
        Return postcode
    End Function
    Public Function SetPostCode(ByVal post As String)
        postcode = post
    End Function
    '************************************
    'Class Method                       *
    '************************************
    Public Function Save(ByVal addr As Address) As Integer
        Dim addrDA As New AddressDA
        If (addrDA.addressInsert(addr)) = -1 Then
            Return -1 ' Address had already exist in database
        Else
            Return 1 ' Save successed...
        End If
    End Function
    Public Function Check(ByVal addr As Address) As Address
        Dim addrDA As New AddressDA
        Dim addrChecked As New Address
        addrChecked = addrDA.addressSelect(addr)
        Return addrChecked
    End Function
End Class
