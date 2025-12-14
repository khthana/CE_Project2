Public Class index
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image2 As System.Web.UI.WebControls.Image
    Protected WithEvents cboDeptDay As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboDeptMon As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboFrom As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblReturn As System.Web.UI.WebControls.Label
    Protected WithEvents cboReturnDay As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboReturnMon As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboTo As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboAdult As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboChild As System.Web.UI.WebControls.DropDownList
    Protected WithEvents radIsRound As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents txtChkTrip As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnCheckTrip As System.Web.UI.WebControls.Button
    Protected WithEvents btnSearch As System.Web.UI.WebControls.Button
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents btnRegister As System.Web.UI.WebControls.Button
    Protected WithEvents btnAllTrip As System.Web.UI.WebControls.Button
    Protected WithEvents cboAirport As System.Web.UI.WebControls.DropDownList
    Protected WithEvents radFlightStatus As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents btnFlightStatus As System.Web.UI.WebControls.Button
    Protected WithEvents chkHop As System.Web.UI.WebControls.CheckBoxList
    Protected WithEvents cboGapless As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboGapmost As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboNotAirline As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label

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
            Dim QueryString As String = "SELECT DISTINCT airportcity,airportname,airportcode FROM airport ORDER BY airportcity"
            Dim CityDataSet As DataSet = Airline.Query(QueryString)
            cboFrom.DataSource = CityDataSet.Tables(0)
            cboFrom.DataBind()

            cboTo.DataSource = CityDataSet.Tables(0)
            cboTo.DataBind()

            cboAirport.DataSource = CityDataSet.Tables(0)
            cboAirport.DataBind()

            QueryString = "SELECT airlinecode,airlinename FROM airline"
            Dim AirlineDataSet As DataSet = Airline.Query(QueryString)
            Dim NotSelect As DataRow = AirlineDataSet.Tables(0).NewRow()
            NotSelect.Item("airlinecode") = "null"
            NotSelect.Item("airlinename") = "=Not Select="
            AirlineDataSet.Tables(0).Rows.Add(NotSelect)
            Dim AirlineView As DataView
            AirlineView = AirlineDataSet.Tables(0).DefaultView
            AirlineView.Sort = "airlinename"
            cboNotAirline.DataSource = AirlineView
            cboNotAirline.DataBind()
        End If

    End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click

            Select Case radIsRound.SelectedValue
                Case "0"
                    Response.Redirect("searchresult.aspx?DeptMDY=" & cboDeptMon.Items(cboDeptMon.SelectedIndex).Value & _
                                                    "/" & cboDeptDay.Items(cboDeptDay.SelectedIndex).Value & "/2006" & _
                                                    "&From=" & cboFrom.SelectedValue & _
                                                    "&To=" & cboTo.SelectedValue & _
                                                    "&IsRound=" & radIsRound.Items(radIsRound.SelectedIndex).Value & _
                                                    "&Adult=" & cboAdult.Items(cboAdult.SelectedIndex).Value & _
                                                    "&Child=" & cboChild.Items(cboChild.SelectedIndex).Value & _
                                                    "&NonStop=" & chkHop.Items(0).Selected & _
                                                    "&1Stop=" & chkHop.Items(1).Selected & _
                                                    "&2Stop=" & chkHop.Items(2).Selected & _
                                                    "&Gapless=" & cboGapless.Items(cboGapless.SelectedIndex).Value & _
                                                    "&Gapmost=" & cboGapmost.Items(cboGapmost.SelectedIndex).Value & _
                                                    "&NotAirline=" & cboNotAirline.Items(cboNotAirline.SelectedIndex).Value & _
                                                    "&CabinOne=null")
            Case "1"
                Dim OutBoundDate As New Date(2006, CInt(cboDeptMon.Items(cboDeptMon.SelectedIndex).Value), CInt(cboDeptDay.Items(cboDeptDay.SelectedIndex).Value))
                Dim ReturnDate As New Date(2006, CInt(cboReturnMon.Items(cboReturnMon.SelectedIndex).Value), CInt(cboReturnDay.Items(cboReturnDay.SelectedIndex).Value))
                '++++Check is it exotic select====
                If Date.Compare(OutBoundDate, ReturnDate) = 1 Then
                    lblStatus.Text = "Return date must more than out bound date."
                    lblStatus.Visible = True
                Else
                    Response.Redirect("searchresult.aspx?DeptMDY=" & cboDeptMon.Items(cboDeptMon.SelectedIndex).Value & _
                                                    "/" & cboDeptDay.Items(cboDeptDay.SelectedIndex).Value & "/2006" & _
                                                    "&ReMDY=" & cboReturnMon.Items(cboReturnMon.SelectedIndex).Value & _
                                                    "/" & cboReturnDay.Items(cboReturnDay.SelectedIndex).Value & "/2006" & _
                                                    "&From=" & cboFrom.Items(cboFrom.SelectedIndex).Value & _
                                                    "&To=" & cboTo.Items(cboTo.SelectedIndex).Value & _
                                                    "&IsRound=" & radIsRound.Items(radIsRound.SelectedIndex).Value & _
                                                    "&Adult=" & cboAdult.Items(cboAdult.SelectedIndex).Value & _
                                                    "&Child=" & cboChild.Items(cboChild.SelectedIndex).Value & _
                                                    "&NonStop=" & chkHop.Items(0).Selected & _
                                                    "&1Stop=" & chkHop.Items(1).Selected & _
                                                    "&2Stop=" & chkHop.Items(2).Selected & _
                                                    "&Gapless=" & cboGapless.Items(cboGapless.SelectedIndex).Value & _
                                                    "&Gapmost=" & cboGapmost.Items(cboGapmost.SelectedIndex).Value & _
                                                    "&NotAirline=" & cboNotAirline.Items(cboNotAirline.SelectedIndex).Value & _
                                                    "&CabinOne=null" & _
                                                    "&CabinReturn=null")
                End If
        End Select

        
    End Sub

    Private Sub radIsRound_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles radIsRound.SelectedIndexChanged
        lblStatus.Visible = False
        Select Case radIsRound.SelectedValue
            Case "0"
                cboReturnDay.Visible = False
                cboReturnMon.Visible = False
                lblReturn.Visible = False
            Case "1"
                cboReturnDay.Visible = True
                cboReturnMon.Visible = True
                lblReturn.Visible = True
        End Select
    End Sub

    Private Sub btnCheckTrip_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCheckTrip.Click, txtChkTrip.TextChanged

        Dim QueryString As String = "SELECT * FROM bookeddetails WHERE bookref = '" & txtChkTrip.Text & "' AND isvalid = '0'"

        Dim ChkTripDataSet As New DataSet
        ChkTripDataSet = Airline.Query(QueryString)

        If ChkTripDataSet.Tables(0).Rows.Count <> 0 Then

            Session("BookRef") = txtChkTrip.Text
            Response.Redirect("itinerary.aspx")
        Else
            lblStatus.Text = "Not found " & txtChkTrip.Text & " on our database."
        End If

    End Sub

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Response.Redirect("login.aspx")
    End Sub

    Private Sub btnRegister_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        Response.Redirect("register.aspx")
    End Sub

    Private Sub btnAllTrip_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAllTrip.Click
        Response.Redirect("alltrips.aspx")
    End Sub

    Private Sub btnFlightStatus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnFlightStatus.Click
        Response.Redirect("flightstatus.aspx?FlightStatus=" & cboAirport.Items(cboAirport.SelectedIndex).Value & _
                                            "&LegStatus=" & radFlightStatus.Items(radFlightStatus.SelectedIndex).Value)
    End Sub
End Class
