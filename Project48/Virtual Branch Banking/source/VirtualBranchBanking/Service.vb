'***************************************************************************
'Class Service : Definition class for service in the system
'***************************************************************************
Public Class Service
    Private serviceID As Integer
    Private serviceName As String
    Private serviceType As String ' Access account , Payment , Special service
    '****************************
    'Constructure
    '****************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As Integer)
        serviceID = id
        serviceName = ""
        serviceType = ""
    End Sub
    Public Sub New(ByVal id As Integer, ByVal name As String, ByVal type As String)
        serviceID = id
        serviceName = name
        serviceType = type
    End Sub
    '****************************
    'Class Interface
    '****************************
    Public Function GetServiceID() As Integer
        Return serviceID
    End Function
    Public Function SetServiceID(ByVal id As Integer)
        serviceID = id
    End Function
    Public Function GetServiceName() As String
        Return serviceName
    End Function
    Public Function SetServiceName(ByVal name As String)
        serviceName = name
    End Function
    Public Function GetServiceType() As String
        Return serviceType
    End Function
    Public Function SetServiceType(ByVal type As String)
        serviceType = type
    End Function
    '*****************************
    'Class Method
    '*****************************

End Class
