Imports System.EnterpriseServices
Imports System.Web.Services

<System.Web.Services.WebService(Namespace:="http://tempuri.org/allianceWS/JLBooking")> _
Public Class LHServices
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

    <WebMethod(Description:="LH service for booking flight", TransactionOption:=TransactionOption.Required)> _
    Public Function Booking(ByVal BookedFlightSet As DataSet, ByVal BookedDetailsString As String) As String
        Dim Result As String = "OK"

        Select Case BookedFlightSet.Tables(0).Rows.Count
            Case 1
                Result = Alliance.InsertUpdate("LH", BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 2
                Result = Alliance.InsertUpdate("LH", BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 3
                Result = Alliance.InsertUpdate("LH", BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 4
                Result = Alliance.InsertUpdate("LH", BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"), BookedFlightSet.Tables(0).Rows(3).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 5
                Result = Alliance.InsertUpdate("LH", BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"), BookedFlightSet.Tables(0).Rows(3).Item("BookString"), BookedFlightSet.Tables(0).Rows(4).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 6
                Result = Alliance.InsertUpdate("LH", BookedDetailsString, BookedFlightSet.Tables(0).Rows(0).Item("BookString"), BookedFlightSet.Tables(0).Rows(1).Item("BookString"), BookedFlightSet.Tables(0).Rows(2).Item("BookString"), BookedFlightSet.Tables(0).Rows(3).Item("BookString"), BookedFlightSet.Tables(0).Rows(4).Item("BookString"), BookedFlightSet.Tables(0).Rows(5).Item("BookString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case Else
                ContextUtil.SetAbort()
                Return Result
        End Select

    End Function

    <WebMethod(Description:="LH service for cancel flight", TransactionOption:=TransactionOption.Required)> _
    Public Function CancelFlight(ByVal BookRef As String) As String
        Dim Result As String = "OK"
        Dim OwnResult As String = "OK"

        '++++Update seat available by using Web Service ***Do before Change isvalid = "1"=======================
        Dim UpDateSeatSet As DataSet = Alliance.MakeSeatString("LH", BookRef, "+")
        Dim eSeatAvai As New skyhighSeat.Seat
        Result = eSeatAvai.UpdateSeat(UpDateSeatSet)
        Dim eSeatOwn As New LHServices
        OwnResult = eSeatOwn.UpdateSeat(UpDateSeatSet)

        If OwnResult = "OK" Then

            Dim UpdateString As String = "UPDATE bookeddetails SET isvalid='1' WHERE BookRef='" & BookRef & "' AND isvalid='0'"
            Dim UpdateString2 As String = "UPDATE bookedflight SET isvalid='1' WHERE BookRef='" & BookRef & "' AND isvalid='0'"
            Result = Alliance.InsertUpdate("LH", UpdateString, UpdateString2)

            If Result = "OK" Then
                ContextUtil.SetComplete()
            Else
                ContextUtil.SetAbort()
            End If
            Return Result
        Else
            ContextUtil.SetAbort()
            Return Result
        End If

    End Function

    <WebMethod(Description:="LH service for change flight", TransactionOption:=TransactionOption.Required)> _
    Public Function ChangeFlight(ByVal BookRef As String) As String
        Dim Result As String = "OK"
        Dim OwnResult As String = "OK"

        '++++Update seat available by using Web Service ***Do before Change isvalid = "2"=======================
        Dim UpDateSeatSet As DataSet = Alliance.MakeSeatString("LH", BookRef, "+")
        Dim eSeatAvai As New skyhighSeat.Seat
        Result = eSeatAvai.UpdateSeat(UpDateSeatSet)
        Dim eSeatOwn As New LHServices
        OwnResult = eSeatOwn.UpdateSeat(UpDateSeatSet)

        If (OwnResult = "OK") And (Result = "OK") Then

            '++++Update old isvalid of BookRef into "2"=====================
            Dim UpdateString As String = "UPDATE bookeddetails SET isvalid ='2' WHERE Bookref = '" & BookRef & "' AND isvalid='0'"
            Dim UpdateString2 As String = "UPDATE bookedflight SET isvalid='2' WHERE Bookref ='" & BookRef & "' AND isvalid='0'"
            Result = Alliance.InsertUpdate("LH", UpdateString, UpdateString2)

            If Result = "OK" Then
                ContextUtil.SetComplete()
            Else
                ContextUtil.SetAbort()
            End If
            Return Result
        Else
            ContextUtil.SetAbort()
            Return Result
        End If

    End Function

    <WebMethod(Description:="LH service for payment update", TransactionOption:=TransactionOption.Required)> _
    Public Function PaymentUpdate(ByVal BookRef As String) As String
        Dim Result As String = "OK"

        Dim UpdateString As String = "UPDATE bookeddetails SET ispay='Y' WHERE Bookref ='" & BookRef & "' AND isvalid='0'"
        Result = Alliance.InsertUpdate("LH", UpdateString)
        If Result = "OK" Then
            ContextUtil.SetComplete()
            Return Result
        Else
            ContextUtil.SetAbort()
            Return Result
        End If
    End Function

    <WebMethod(Description:="LHservice for update seat available", TransactionOption:=TransactionOption.Required)> _
    Public Function UpdateSeat(ByVal UpdateSeatSet As DataSet) As String

        Dim Result As String = "OK"

        Select Case UpdateSeatSet.Tables(0).Rows.Count
            Case 1
                Result = Alliance.InsertUpdate("LH", UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 2
                Result = Alliance.InsertUpdate("LH", UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 3
                Result = Alliance.InsertUpdate("LH", UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 4
                Result = Alliance.InsertUpdate("LH", UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(3).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 5
                Result = Alliance.InsertUpdate("LH", UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(3).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(4).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 6
                Result = Alliance.InsertUpdate("LH", UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(3).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(4).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(5).Item("SeatString"))
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

End Class
