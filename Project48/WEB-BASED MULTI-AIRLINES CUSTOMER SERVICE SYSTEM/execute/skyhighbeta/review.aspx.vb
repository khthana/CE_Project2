Public Class review
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents lblName As System.Web.UI.WebControls.Label
    Protected WithEvents lblAge As System.Web.UI.WebControls.Label
    Protected WithEvents lblCountry As System.Web.UI.WebControls.Label
    Protected WithEvents lblMeal As System.Web.UI.WebControls.Label
    Protected WithEvents lblMemberID As System.Web.UI.WebControls.Label
    Protected WithEvents lblName2 As System.Web.UI.WebControls.Label
    Protected WithEvents lblEmail As System.Web.UI.WebControls.Label
    Protected WithEvents lblHome As System.Web.UI.WebControls.Label
    Protected WithEvents lblBusiness As System.Web.UI.WebControls.Label
    Protected WithEvents lblFax As System.Web.UI.WebControls.Label
    Protected WithEvents grdSelected As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdFare As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblTotal As System.Web.UI.WebControls.Label
    Protected WithEvents lblCondition As System.Web.UI.WebControls.Label
    Protected WithEvents lbl6MonthsHead As System.Web.UI.WebControls.Label
    Protected WithEvents lbl6Months As System.Web.UI.WebControls.Label
    Protected WithEvents lbl1YearHead As System.Web.UI.WebControls.Label
    Protected WithEvents lbl1Year As System.Web.UI.WebControls.Label
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents btnPayLater As System.Web.UI.WebControls.Button
    Protected WithEvents btnPayNow As System.Web.UI.WebControls.Button

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
            FillInfo()

            Dim FareDataSet As DataSet = Airline.ShowItinerary(Session("FID"), Session("FID2"), Session("FID3"), Request("DeptMDY"), Session("DeptMDY2"), Session("DeptMDY3"), Session("ReFID"), Session("ReFID2"), Session("ReFID3"), Request("ReMDY"), Session("ReMDY2"), Session("ReMDY3"), Request("CabinOne"), Request("CabinReturn"), Request("WebFareOne"), Request("WebFareReturn"))
            grdSelected.DataSource = FareDataSet
            grdSelected.DataBind()

            FareDataSet = Airline.ShowFare(FareDataSet, Request("Adult"), Request("Child"), Request("CabinOne"), Request("WebFareOne"), Request("CabinReturn"), Request("WebFareReturn"))
            grdFare.DataSource = FareDataSet
            grdFare.DataBind()

            lblTotal.Text = "$ " & Session("AllTotal")

            If Session("ReFID") = "null" Then
                lblCondition.Text = "Ticket is valid for " & Airline.GetWebFare(Request("WebFareOne")) & " from the first flight date."
            Else
                lblCondition.Text = "Ticket is valid for " & Airline.GetWebFare(Request("WebFareOne")) & " (Departure) and " & Airline.GetWebFare(Request("WebFareReturn")) & " (Return) from the first flight date."
            End If

            If (Request("WebFareOne") = "0") Or (Request("WebFareReturn") = "0") Then
                lbl6MonthsHead.Visible = True
                lbl6Months.Visible = True
            End If
            If (Request("WebFareOne") = "1") Or (Request("WebFareReturn") = "1") Then
                lbl1YearHead.Visible = True
                lbl1Year.Visible = True
            End If
        End If

    End Sub

    Private Sub FillInfo()

        Dim QueryString As String
        QueryString = "SELECT * FROM member WHERE memberid='" & Session("MemberID") & "'"
        Dim MemberDataSet As New DataSet
        MemberDataSet = Airline.Query(QueryString)

        Dim MemberRow As DataRow
        MemberRow = MemberDataSet.Tables(0).Rows(0)

        lblMemberID.Text = Session("MemberID")
        lblName.Text = MemberRow.Item("FirstName") & " " & MemberRow.Item("LastName")
        lblName2.Text = lblName.Text
        lblAge.Text = MemberRow.Item("Age")
        lblCountry.Text = MemberRow.Item("Country")
        lblMeal.Text = MemberRow.Item("Meal")

        lblHome.Text = MemberRow.Item("HomePhone")
        lblBusiness.Text = MemberRow.Item("BusinessPhone")
        lblFax.Text = MemberRow.Item("Fax")
        lblEmail.Text = MemberRow.Item("Email")

    End Sub

    Private Sub btnPayNow_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPayNow.Click
        Session("BookRef") = Booking()
        Response.Redirect("payment.aspx")
    End Sub

    Private Sub btnPayLater_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPayLater.Click
        Session("BookRef") = Booking()
        Response.Redirect("itinerary.aspx")
    End Sub

    Private Function Booking() As String

        Dim BookRef As String = Airline.AutoGenBookRef()
        Dim BookDateTime As String = DateTime.Now.ToString
        Dim TxID As String = Airline.GenerateTxID()

        '++++Make set of booking string==========================
        Dim BookedFlightSet As DataSet = Airline.MakeBookingSet(TxID, BookRef, Session("FID"), Session("FID2"), Session("FID3"), Request("DeptMDY"), Session("DeptMDY2"), Session("DeptMDY3"), Session("ReFID"), Session("ReFID2"), Session("ReFID3"), Request("ReMDY"), Session("ReMDY2"), Session("ReMDY3"), Request("CabinOne"), Request("WebFareOne"), Request("CabinReturn"), Request("WebFareReturn"))
        Dim BookedDetailsString As String = "INSERT INTO bookeddetails VALUES ('" & TxID & "','" & BookRef & "','" & Session("MemberID") & "'," & Request("Adult") & "," & Request("Child") & "," & Session("AllTotal") & ",'N','" & BookDateTime & "','0')"

        '++++Send info to each-airline & skyhigh ===============================
        Dim AllBooking As New SkyHighTP.TwoPhaseWS
        If AllBooking.Booking(BookedFlightSet, BookedDetailsString) = False Then
            lblStatus.Text = "Web Service ERROR!!!"
        Else
            '++++Sending e-mail to our customer============================
            Dim Content As String = "Your Booking Reference is " & BookRef & "<br>See your trip at www.skyhigh.com<br>...Thank you for visit us."
            Airline.MailTo(lblEmail.Text, "SkyHigh Booking Flight", Content)

            '++++Update Seat of SkyHigh=========================================
            Dim UpdateSeatSet As DataSet = Airline.MakeUpdateSeatSet(BookRef, "-")
            Dim eSeatAvai As New SkyHighSeat.SeatbySkyHigh
            eSeatAvai.SeatAvai(UpdateSeatSet)

            Return BookRef
        End If

    End Function
End Class

