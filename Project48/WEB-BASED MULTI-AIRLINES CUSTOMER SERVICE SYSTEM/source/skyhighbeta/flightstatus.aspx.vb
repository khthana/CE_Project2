Public Class flightstatus
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents lblArrival As System.Web.UI.WebControls.Label
    Protected WithEvents lblDeparture As System.Web.UI.WebControls.Label
    Protected WithEvents grdDeparture As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdArrival As System.Web.UI.WebControls.DataGrid

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
        '++++Init value for first visit to this page====================
        If IsPostBack = False Then
            Dim MDY As String = "1/1/2006"
            If FillStatus(Request("LegStatus"), Request("FlightStatus"), MDY) <> True Then
                lblStatus.Text = "Error!!! Please try again."
            End If
        End If

    End Sub

    Private Function FillStatus(ByVal Leg As String, ByVal Airport As String, ByVal MDY As String) As Boolean

        Select Case Leg
            Case "0" ' dept
                Dim QueryString As String = "SELECT * FROM flight f,available av,airport a WHERE f.flightid=av.flightid AND a.airportcode=f.arr_airport AND dept_airport='" & Airport & "' AND mdy='" & MDY & "'"
                grdDeparture.DataSource = Airline.Query(QueryString)
                grdDeparture.DataBind()
                grdDeparture.Visible = True
                lblDeparture.Text = "All flight Departure from " & Airport & " on " & MDY
                lblDeparture.Visible = True

                Return True

            Case "1" 'arr
                Dim QueryString As String = "SELECT * FROM flight f,available av,airport a WHERE f.flightid=av.flightid AND a.airportcode=f.dept_airport AND Arr_airport='" & Airport & "' AND mdy='" & MDY & "'"
                grdArrival.DataSource = Airline.Query(QueryString)
                grdArrival.DataBind()
                grdArrival.Visible = True
                lblArrival.Text = "All flight Arriving to " & Airport & " on " & MDY
                lblArrival.Visible = True

                Return True

            Case Else
                Return False

        End Select

    End Function
End Class
