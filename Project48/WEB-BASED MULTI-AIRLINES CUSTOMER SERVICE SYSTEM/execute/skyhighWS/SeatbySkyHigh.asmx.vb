Imports System.EnterpriseServices
Imports System.Web.Services

<System.Web.Services.WebService(Namespace := "http://tempuri.org/skyhighWS/SeatbySkyHigh")> _
Public Class SeatbySkyHigh
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

    <WebMethod(Description:="Update seat available from SkyHigh", TransactionOption:=TransactionOption.Required)> _
    Public Function SeatAvai(ByVal UpdateSeatSet As DataSet) As Boolean
        Try
            '++++Instance of web service====
            Dim serviceSkyHigh As New skyhighSeat.Seat
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
            TGDataTable.Columns.Add(New DataColumn("SeatString", GetType(String)))
            LHDataTable.Columns.Add(New DataColumn("SeatString", GetType(String)))
            SQDataTable.Columns.Add(New DataColumn("SeatString", GetType(String)))
            SKDataTable.Columns.Add(New DataColumn("SeatString", GetType(String)))

            '++++Select bookingstring for each airline=========
            Dim i As Integer
            Dim AirlineCode As String

            For i = 0 To (UpdateSeatSet.Tables(0).Rows.Count - 1)
                AirlineCode = Mid(UpdateSeatSet.Tables(0).Rows(i).Item("SeatString"), InStr(1, UpdateSeatSet.Tables(0).Rows(i).Item("SeatString"), "'") + 1, 2)
                If AirlineCode = "TG" Then
                    TGRow = TGDataTable.NewRow()
                    TGRow.Item("SeatString") = UpdateSeatSet.Tables(0).Rows(i).Item("SeatString")
                    TGDataTable.Rows.Add(TGRow)
                ElseIf AirlineCode = "LH" Then
                    LHRow = LHDataTable.NewRow()
                    LHRow.Item("SeatString") = UpdateSeatSet.Tables(0).Rows(i).Item("SeatString")
                    LHDataTable.Rows.Add(LHRow)
                ElseIf AirlineCode = "SK" Then
                    SKRow = SKDataTable.NewRow()
                    SKRow.Item("SeatString") = UpdateSeatSet.Tables(0).Rows(i).Item("SeatString")
                    SKDataTable.Rows.Add(SKRow)
                ElseIf AirlineCode = "SQ" Then
                    SQRow = SQDataTable.NewRow()
                    SQRow.Item("SeatString") = UpdateSeatSet.Tables(0).Rows(i).Item("SeatString")
                    SQDataTable.Rows.Add(SQRow)
                End If
            Next

            '++++Add table to dataset============
            TGDataSet.Tables.Add(TGDataTable)
            LHDataSet.Tables.Add(LHDataTable)
            SKDataSet.Tables.Add(SKDataTable)
            SQDataSet.Tables.Add(SQDataTable)

            '++++Alway do ...or skyhigh==========
            ResultSkyHigh = serviceSkyHigh.UpdateSeat(UpdateSeatSet)

            '++++Part of alliance airlines=======
            If TGDataSet.Tables(0).Rows.Count <> 0 Then
                ResultTG = serviceTG.UpdateSeat(TGDataSet)
            End If
            If LHDataSet.Tables(0).Rows.Count <> 0 Then
                ResultLH = serviceLH.UpdateSeat(LHDataSet)
            End If
            If SQDataSet.Tables(0).Rows.Count <> 0 Then
                ResultSQ = serviceSQ.UpdateSeat(SQDataSet)
            End If
            If SKDataSet.Tables(0).Rows.Count <> 0 Then
                ResultSK = serviceSK.UpdateSeat(SKDataSet)
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

End Class
