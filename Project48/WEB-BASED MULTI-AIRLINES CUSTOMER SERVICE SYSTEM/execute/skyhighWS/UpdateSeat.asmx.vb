Imports System.EnterpriseServices
Imports System.Web.Services

<System.Web.Services.WebService(Namespace:="http://tempuri.org/skyhighWS/Service1")> _
Public Class Seat
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

    <WebMethod(Description:="SkyHigh service for update seat available", TransactionOption:=TransactionOption.Required)> _
    Public Function UpdateSeat(ByVal UpdateSeatSet As DataSet) As String

        Dim Result As String = "OK"

        Select Case UpdateSeatSet.Tables(0).Rows.Count
            Case 1
                Result = SkyHigh.InsertUpdate(UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 2
                Result = SkyHigh.InsertUpdate(UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 3
                Result = SkyHigh.InsertUpdate(UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 4
                Result = SkyHigh.InsertUpdate(UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(3).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 5
                Result = SkyHigh.InsertUpdate(UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(3).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(4).Item("SeatString"))
                If Result = "OK" Then
                    ContextUtil.SetComplete()
                Else
                    ContextUtil.SetAbort()
                End If
                Return Result

            Case 6
                Result = SkyHigh.InsertUpdate(UpdateSeatSet.Tables(0).Rows(0).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(1).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(2).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(3).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(4).Item("SeatString"), UpdateSeatSet.Tables(0).Rows(5).Item("SeatString"))
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
