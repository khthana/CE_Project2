Public Class flightdetails
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents grdOnewayDetails2 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblDetailsHead As System.Web.UI.WebControls.Label
    Protected WithEvents btnClose As System.Web.UI.WebControls.Button

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If IsPostBack = False Then
            If Request("FID3") = "null" Then
                '++++For 1-stop======
                lblDetailsHead.Text = "Flight Details for " & Request("FID") & " / " & Request("FID2")

                Dim QueryString As String = "SELECT * FROM flight fl,available av,city c1,city c2 WHERE fl.flightid=av.flightid AND fl.flightid='" & Request("FID") & "' AND av.mdy='" & Request("MDY") & "' AND fl.dept_airport=c1.aircode AND fl.arr_airport=c2.aircode"
                Dim FlightDetails As DataSet = Airline.Query(QueryString)
                QueryString = "SELECT * FROM flight fl,available av,city c1,city c2 WHERE fl.flightid=av.flightid AND fl.flightid='" & Request("FID2") & "' AND av.mdy='" & Request("MDY2") & "' AND fl.dept_airport=c1.aircode AND fl.arr_airport=c2.aircode"
                FlightDetails.Tables(0).ImportRow(Airline.Query(QueryString).Tables(0).Rows(0))

                grdOnewayDetails2.DataSource = FlightDetails
                grdOnewayDetails2.DataBind()
            Else
                '++++For 2-stop======
                lblDetailsHead.Text = "Flight Details for " & Request("FID") & " / " & Request("FID2") & " / " & Request("FID3")

                Dim QueryString As String = "SELECT * FROM flight fl,available av,city c1,city c2 WHERE fl.flightid=av.flightid AND fl.flightid='" & Request("FID") & "' AND av.mdy='" & Request("MDY") & "' AND fl.dept_airport=c1.aircode AND fl.arr_airport=c2.aircode"
                Dim FlightDetails As DataSet = Airline.Query(QueryString)
                QueryString = "SELECT * FROM flight fl,available av,city c1,city c2 WHERE fl.flightid=av.flightid AND fl.flightid='" & Request("FID2") & "' AND av.mdy='" & Request("MDY2") & "' AND fl.dept_airport=c1.aircode AND fl.arr_airport=c2.aircode"
                FlightDetails.Tables(0).ImportRow(Airline.Query(QueryString).Tables(0).Rows(0))
                QueryString = "SELECT * FROM flight fl,available av,city c1,city c2 WHERE fl.flightid=av.flightid AND fl.flightid='" & Request("FID3") & "' AND av.mdy='" & Request("MDY3") & "' AND fl.dept_airport=c1.aircode AND fl.arr_airport=c2.aircode"
                FlightDetails.Tables(0).ImportRow(Airline.Query(QueryString).Tables(0).Rows(0))

                grdOnewayDetails2.DataSource = FlightDetails
                grdOnewayDetails2.DataBind()
            End If
        End If        
    End Sub

    Function CheckSeat(ByVal SeatAvailable As Integer, ByVal Adult As Integer, ByVal Child As Integer) As String

        If SeatAvailable = -1 Then
            '++++Not have this cabin class=====
            Return "X"
        ElseIf SeatAvailable = 0 Then
            '++++Seat is full========
            Return "F"
        ElseIf SeatAvailable < (Adult + Child) Then
            '++++Have not enough======
            Return "NE"
        Else
            '++++Have enough seat=====
            Return CStr(SeatAvailable)
        End If

    End Function

    Function GetAllDuration(ByVal Minute1 As Integer) As String

        Dim Duration As TimeSpan
        Dim DurationString As String = Duration.FromMinutes(Minute1).ToString
        DurationString = Mid(DurationString, 1, 2) & "hr " & Mid(DurationString, 4, 2) & "min"

        Return DurationString
    End Function

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click

    End Sub
End Class
