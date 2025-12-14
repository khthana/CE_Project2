Imports System.EnterpriseServices
Imports System.Web.Services

<System.Web.Services.WebService(Namespace:="http://tempuri.org/skyhighWS/skyhighbooking")> _
Public Class TwoPhaseWS
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
    '<WebMethod(Description:="SkyHigh service for booking alliance flight", TransactionOption:=TransactionOption.Required)> _
    'Public Function HelloWorld() As String
    '   Return "Hello World"
    'End Function

    <WebMethod(Description:="Booking by using Two-Phase Commit", TransactionOption:=TransactionOption.Required)> _
    Public Function Booking(ByVal BookedFlightSet As DataSet, ByVal BookedDetailsString As String) As Boolean
        Try
            '++++Instance of web service====
            Dim serviceSkyHigh As New SkyHighServices
            Dim serviceTG As New Thaiairway.TGServices
            Dim serviceLH As New Lufthansa.LHServices
            Dim serviceSQ As New Singapore.SQServices
            Dim serviceSK As New Scandinavian.SKServices

            Dim ResultSkyHigh As String = "OK"
            Dim ResultTG As String = "OK"
            Dim ResultLH As String = "OK"
            Dim ResultSQ As String = "OK"
            Dim ResultSK As String = "OK"

            '++++To set each airline booking dataset=============
            Dim TGDataSet As New DataSet
            Dim LHDataSet As New DataSet
            Dim SQDataSet As New DataSet
            Dim SKDataSet As New DataSet

            Dim TGDataTable As New DataTable
            Dim LHDataTable As New DataTable
            Dim SQDataTable As New DataTable
            Dim SKDataTable As New DataTable

            Dim TGRow As DataRow
            Dim LHRow As DataRow
            Dim SQRow As DataRow
            Dim SKRow As DataRow

            '++++Add column to each airline table===================================
            TGDataTable.Columns.Add(New DataColumn("BookString", GetType(String)))
            LHDataTable.Columns.Add(New DataColumn("BookString", GetType(String)))
            SQDataTable.Columns.Add(New DataColumn("BookString", GetType(String)))
            SKDataTable.Columns.Add(New DataColumn("BookString", GetType(String)))

            '++++Select bookingstring for each airline=========
            Dim i As Integer
            Dim AirlineCode As String

            For i = 0 To (BookedFlightSet.Tables(0).Rows.Count - 1)
                AirlineCode = Mid(BookedFlightSet.Tables(0).Rows(i).Item("BookString"), 55, 2)
                If AirlineCode = "TG" Then
                    TGRow = TGDataTable.NewRow()
                    TGRow.Item("BookString") = BookedFlightSet.Tables(0).Rows(i).Item("BookString")
                    TGDataTable.Rows.Add(TGRow)
                ElseIf AirlineCode = "LH" Then
                    LHRow = LHDataTable.NewRow()
                    LHRow.Item("BookString") = BookedFlightSet.Tables(0).Rows(i).Item("BookString")
                    LHDataTable.Rows.Add(LHRow)
                ElseIf AirlineCode = "SK" Then
                    SKRow = SKDataTable.NewRow()
                    SKRow.Item("BookString") = BookedFlightSet.Tables(0).Rows(i).Item("BookString")
                    SKDataTable.Rows.Add(SKRow)
                ElseIf AirlineCode = "SQ" Then
                    SQRow = SQDataTable.NewRow()
                    SQRow.Item("BookString") = BookedFlightSet.Tables(0).Rows(i).Item("BookString")
                    SQDataTable.Rows.Add(SQRow)
                End If
            Next

            '++++Add table to dataset============
            TGDataSet.Tables.Add(TGDataTable)
            LHDataSet.Tables.Add(LHDataTable)
            SKDataSet.Tables.Add(SKDataTable)
            SQDataSet.Tables.Add(SQDataTable)

            '++++Alway do ...or skyhigh==========
            ResultSkyHigh = serviceSkyHigh.Booking(BookedFlightSet, BookedDetailsString)

            '++++Part of alliance airlines=======
            If TGDataSet.Tables(0).Rows.Count <> 0 Then
                ResultTG = serviceTG.Booking(TGDataSet, BookedDetailsString)
            End If
            If LHDataSet.Tables(0).Rows.Count <> 0 Then
                ResultLH = serviceLH.Booking(LHDataSet, BookedDetailsString)
            End If
            If SQDataSet.Tables(0).Rows.Count <> 0 Then
                ResultSQ = serviceSQ.Booking(SQDataSet, BookedDetailsString)
            End If
            If SKDataSet.Tables(0).Rows.Count <> 0 Then
                ResultSK = serviceSK.Booking(SKDataSet, BookedDetailsString)
            End If

            '+++Return resource====
            serviceTG.Dispose()
            serviceLH.Dispose()
            serviceSQ.Dispose()
            serviceSK.Dispose()

            '++++Check is it Global Commit or Global Abort=====================
            If (ResultSkyHigh <> "OK") Or (ResultTG <> "OK") Or (ResultLH <> "OK") Or (ResultSQ <> "OK") Or (ResultSK <> "OK") Then
                ContextUtil.SetAbort()
                Return False
            Else
                ContextUtil.SetComplete()
                Return True
            End If

        Catch ex As Exception
            Throw ex
        End Try

    End Function

    <WebMethod(Description:="Cancel flight by using Two-Phase Commit", TransactionOption:=TransactionOption.Required)> _
    Public Function Cancel(ByVal BookRef As String, ByVal CancelType As String, ByVal Reason As String) As Boolean
        Try
            Dim QueryString As String = "SELECT DISTINCT SUBSTR(bf.flightid,1,2) airlinecode FROM bookedflight bf,bookeddetails bd WHERE bf.bookref=bd.bookref AND bd.bookref='" & BookRef & "' AND bf.isvalid='0' AND bd.isvalid='0'"
            Dim AirlineCodeSet As DataSet = SkyHigh.Query(QueryString)

            '++++Instance of web service====
            Dim serviceSkyHigh As New SkyHighServices
            Dim serviceTG As New Thaiairway.TGServices
            Dim serviceLH As New Lufthansa.LHServices
            Dim serviceSQ As New Singapore.SQServices
            Dim serviceSK As New Scandinavian.SKServices

            Dim ResultSkyHigh As String = "OK"
            Dim ResultTG As String = "OK"
            Dim ResultLH As String = "OK"
            Dim ResultSQ As String = "OK"
            Dim ResultSK As String = "OK"

            '++++Alway do ...or skyhigh==========
            ResultSkyHigh = serviceSkyHigh.Cancel(BookRef, CancelType, Reason)

            '++++Part of alliance airlines=======
            Dim i As Integer

            For i = 0 To AirlineCodeSet.Tables(0).Rows.Count - 1
                Dim AirlineCode As String = AirlineCodeSet.Tables(0).Rows(i).Item("airlinecode")

                If AirlineCode = "TG" Then
                    ResultTG = serviceTG.CancelFlight(BookRef)
                ElseIf AirlineCode = "LH" Then
                    ResultLH = serviceLH.CancelFlight(BookRef)
                ElseIf AirlineCode = "SK" Then
                    ResultSK = serviceSK.CancelFlight(BookRef)
                ElseIf AirlineCode = "SQ" Then
                    ResultSQ = serviceSQ.CancelFlight(BookRef)
                End If
            Next

            '+++Return resource====
            serviceTG.Dispose()
            serviceLH.Dispose()
            serviceSQ.Dispose()
            serviceSK.Dispose()

            '++++Check is it Global Commit or Global Abort=====================
            If (ResultSkyHigh <> "OK") Or (ResultTG <> "OK") Or (ResultLH <> "OK") Or (ResultSQ <> "OK") Or (ResultSK <> "OK") Then
                ContextUtil.SetAbort()
                Return False
            Else
                ContextUtil.SetComplete()
                Return True
            End If

        Catch ex As Exception
            Throw ex
        End Try

    End Function

    <WebMethod(Description:="Change flight by using Two-Phase Commit", TransactionOption:=TransactionOption.Required)> _
    Public Function Changing(ByVal BookRef As String, ByVal NewBookedFlightSet As DataSet, ByVal NewBookedDetailsString As String) As Boolean
        Try
            Dim QueryString As String = "SELECT DISTINCT SUBSTR(bf.flightid,1,2) airlinecode FROM bookedflight bf,bookeddetails bd WHERE bf.bookref=bd.bookref AND bd.bookref='" & BookRef & "' AND bf.isvalid='0' AND bd.isvalid='0'"
            Dim AirlineCodeSet As DataSet = SkyHigh.Query(QueryString)

            '++++Instance of web service====
            Dim serviceSkyHigh As New sky.SkyHighServices
            Dim serviceTG As New Thaiairway.TGServices
            Dim serviceLH As New Lufthansa.LHServices
            Dim serviceSQ As New Singapore.SQServices
            Dim serviceSK As New Scandinavian.SKServices

            Dim ResultSkyHigh As String = "OK"
            Dim ResultTG As String = "OK"
            Dim ResultLH As String = "OK"
            Dim ResultSQ As String = "OK"
            Dim ResultSK As String = "OK"
            '++++Alway do ...or skyhigh==========
            ResultSkyHigh = serviceSkyHigh.ChangeFlight(BookRef)

            '++++Part of alliance airlines=======
            Dim i As Integer

            For i = 0 To AirlineCodeSet.Tables(0).Rows.Count - 1
                Dim AirlineCode As String = AirlineCodeSet.Tables(0).Rows(i).Item("airlinecode")

                If AirlineCode = "TG" Then
                    ResultTG = serviceTG.ChangeFlight(BookRef)
                ElseIf AirlineCode = "LH" Then
                    ResultLH = serviceLH.ChangeFlight(BookRef)
                ElseIf AirlineCode = "SK" Then
                    ResultSK = serviceSK.ChangeFlight(BookRef)
                ElseIf AirlineCode = "SQ" Then
                    ResultSQ = serviceSQ.ChangeFlight(BookRef)
                End If
            Next

            '++++Check is it Global Commit or Global Abort=====================
            If (ResultSkyHigh <> "OK") Or (ResultTG <> "OK") Or (ResultLH <> "OK") Or (ResultSQ <> "OK") Or (ResultSK <> "OK") Then
                ContextUtil.SetAbort()
                Return False
            Else
                '++++Booking new flight=====================
                Dim AllBooking As New TwoPhaseWS
                If AllBooking.Booking(NewBookedFlightSet, NewBookedDetailsString) = True Then
                    ContextUtil.SetComplete()
                    Return True
                Else
                    ContextUtil.SetAbort()
                    Return False
                End If
            End If

        Catch ex As Exception
            Throw ex
        End Try

    End Function

    <WebMethod(Description:="Paying by using Two-Phase Commit", TransactionOption:=TransactionOption.Required)> _
    Public Function Paying(ByVal BookRef As String) As Boolean
        Try
            Dim QueryString As String = "SELECT DISTINCT SUBSTR(flightid,1,2) airlinecode FROM bookedflight bf,bookeddetails bd WHERE bf.bookref=bd.bookref AND bd.bookref='" & BookRef & "' AND bf.isvalid='0' AND bd.isvalid='0'"
            Dim AirlineCodeSet As DataSet = SkyHigh.Query(QueryString)

            '++++Instance of web service====
            Dim serviceSkyHigh As New SkyHighServices
            Dim serviceTG As New Thaiairway.TGServices
            Dim serviceLH As New Lufthansa.LHServices
            Dim serviceSQ As New Singapore.SQServices
            Dim serviceSK As New Scandinavian.SKServices

            Dim ResultSkyHigh As String = "OK"
            Dim ResultTG As String = "OK"
            Dim ResultLH As String = "OK"
            Dim ResultSQ As String = "OK"
            Dim ResultSK As String = "OK"

            '++++Alway do ...or skyhigh==========
            ResultSkyHigh = serviceSkyHigh.Payment(BookRef)

            '++++Part of alliance airlines=======
            Dim i As Integer

            For i = 0 To AirlineCodeSet.Tables(0).Rows.Count - 1
                Dim AirlineCode As String = AirlineCodeSet.Tables(0).Rows(i).Item("airlinecode")

                If AirlineCode = "TG" Then
                    ResultTG = serviceTG.PaymentUpdate(BookRef)
                ElseIf AirlineCode = "LH" Then
                    ResultLH = serviceLH.PaymentUpdate(BookRef)
                ElseIf AirlineCode = "SK" Then
                    ResultSK = serviceSK.PaymentUpdate(BookRef)
                ElseIf AirlineCode = "SQ" Then
                    ResultSQ = serviceSQ.PaymentUpdate(BookRef)
                End If
            Next

            '++++Check is it Global Commit or Global Abort=====================
            If (ResultSkyHigh <> "OK") Or (ResultTG <> "OK") Or (ResultLH <> "OK") Or (ResultSQ <> "OK") Or (ResultSK <> "OK") Then
                ContextUtil.SetAbort()
                Return False
            Else
                ContextUtil.SetComplete()
                Return True
            End If

        Catch ex As Exception
            Throw ex
        End Try

    End Function

End Class
