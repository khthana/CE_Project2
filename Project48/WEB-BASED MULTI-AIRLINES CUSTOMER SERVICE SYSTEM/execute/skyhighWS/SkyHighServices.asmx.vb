Imports System.EnterpriseServices
Imports System.Web.Services

<System.Web.Services.WebService(Namespace := "http://tempuri.org/skyhighWS/SkyHighServices")> _
Public Class SkyHighServices
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
        components = New System.ComponentModel.Container()
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

    <WebMethod(Description:="SkyHigh Booking...Add record into SkyHigh database", TransactionOption:=TransactionOption.Required)> _
    Public Function Booking(ByVal BookedFlightSet As DataSet, ByVal BookedDetailsString As String) As String

        Dim Result As String = "OK"

        Select Case BookedFlightSet.Tables(0).Rows.Count
            Case 1
                Result = SkyHigh.InsertUpdate(BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 2
                Result = SkyHigh.InsertUpdate(BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 3
                Result = SkyHigh.InsertUpdate(BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 4
                Result = SkyHigh.InsertUpdate(BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"), BookedFlightSet.Tables(0).Rows(3).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 5
                Result = SkyHigh.InsertUpdate(BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"), BookedFlightSet.Tables(0).Rows(3).Item("BookString"), BookedFlightSet.Tables(0).Rows(4).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 6
                Result = SkyHigh.InsertUpdate(BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"), BookedFlightSet.Tables(0).Rows(3).Item("BookString"), BookedFlightSet.Tables(0).Rows(4).Item("BookString"), BookedFlightSet.Tables(0).Rows(5).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case Else
                ContextUtil.SetAbort()
                Return "Invalid case"
        End Select

    End Function

    <WebMethod(Description:="SkyHigh Cancel...update record into SkyHigh database", TransactionOption:=TransactionOption.Required)> _
    Public Function Cancel(ByVal BookRef As String, ByVal CancelType As String, ByVal Reason As String) As String

        Dim UpdateString As String = "UPDATE bookeddetails SET isvalid ='1' WHERE Bookref = '" & BookRef & "' AND isvalid='0'"
        Dim UpdateString2 As String = "UPDATE bookedflight SET isvalid='1' WHERE Bookref ='" & BookRef & "' AND isvalid='0'"
        Dim InsertString As String = "INSERT INTO cancel VALUES ('" & BookRef & "','" & CancelType & "','" & Reason & "')"
        Dim Result As String = SkyHigh.InsertUpdate(UpdateString, UpdateString2, InsertString)

        If Result = "OK" Then
            ContextUtil.SetComplete()
        Else
            ContextUtil.SetAbort()
        End If
        Return Result

    End Function

    <WebMethod(Description:="SkyHigh Changing...update record into SkyHigh database", TransactionOption:=TransactionOption.Required)> _
    Public Function ChangeFlight(ByVal BookRef As String) As String

        '++++Update old isvalid of BookRef into "2"=====================
        Dim UpdateString As String = "UPDATE bookeddetails SET isvalid='2' WHERE bookref='" & BookRef & "' AND isvalid='0'"
        Dim UpdateString2 As String = "UPDATE bookedflight SET isvalid='2' WHERE bookref='" & BookRef & "' AND isvalid='0'"
        Dim Result As String = SkyHigh.InsertUpdate(UpdateString, UpdateString2)

        If Result = "OK" Then
            ContextUtil.SetComplete()
        Else
            ContextUtil.SetAbort()
        End If
        Return Result

    End Function

    <WebMethod(Description:="SkyHigh Payment...update record into SkyHigh database", TransactionOption:=TransactionOption.Required)> _
    Public Function Payment(ByVal BookRef As String) As String

        Dim UpdateString As String = "UPDATE bookeddetails SET ispay='Y' WHERE Bookref ='" & BookRef & "' AND isvalid='0'"
        Dim Result As String = SkyHigh.InsertUpdate(UpdateString)

        If Result = "OK" Then
            ContextUtil.SetComplete()
        Else
            ContextUtil.SetAbort()
        End If
        Return Result

    End Function
End Class
