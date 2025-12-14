Imports System.EnterpriseServices
Imports System.Web.Services

<System.Web.Services.WebService(Namespace:="http://tempuri.org/skyhighWS/UpdateStatus1")> _
Public Class Status
    Inherits System.Web.Services.WebService

#Region " Web Services Designer Generated Code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Web Services Designer.
        InitializeComponent()

        'Add your own initialization code after the InitializeComponent() call

    End Sub

    'Required by the Web Services Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Web Services Designer
    'It can be modified using the Web Services Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        components = New System.ComponentModel.Container
    End Sub

    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        'CODEGEN: This procedure is required by the Web Services Designer
        'Do not modify it using the code editor.
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

#End Region

    ' WEB SERVICE EXAMPLE
    ' The HelloWorld() example service returns the string Hello World.
    ' To build, uncomment the following lines then save and build the project.
    ' To test this web service, ensure that the .asmx file is the start page
    ' and press F5.
    '
    '<WebMethod()> _
    'Public Function HelloWorld() As String
    '   Return "Hello World"
    'End Function

    <WebMethod(Description:="SkyHigh service for update flight status", TransactionOption:=TransactionOption.Required)> _
    Public Function UpdateStatus(ByVal FlightID As String, ByVal MDY As String, ByVal Leg As String, ByVal Time As String) As String
        Dim Result As String = "OK"

        Select Case Leg
            Case "0"
                Dim UpdateString As String = "UPDATE available SET dept_actual='" & Time & "' WHERE flightid='" & FlightID & "' AND mdy='" & MDY & "'"
                Result = SkyHigh.InsertUpdate(UpdateString)
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                    Return Result
                Else
                    ContextUtil.SetAbort()
                    Return Result
                End If
            Case "1"
                Dim UpdateString As String = "UPDATE available SET arr_actual='" & Time & "' WHERE flightid='" & FlightID & "' AND day='" & MDY & "'"
                Result = SkyHigh.InsertUpdate(UpdateString)
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                    Return Result
                Else
                    ContextUtil.SetAbort()
                    Return Result
                End If
            Case Else
                Return "Invalid Leg"
        End Select

    End Function
End Class
