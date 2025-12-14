Public Class paymentresult
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblFail As System.Web.UI.WebControls.Label
    Protected WithEvents lblSuccess As System.Web.UI.WebControls.Label
    Protected WithEvents lblMustPayIn As System.Web.UI.WebControls.Label
    Protected WithEvents lblBottom1 As System.Web.UI.WebControls.Label
    Protected WithEvents Image2 As System.Web.UI.WebControls.Image
    Protected WithEvents lblBottom2 As System.Web.UI.WebControls.Label
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents btnAllTrips As System.Web.UI.WebControls.Button

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
            Select Case Request("IsPay")
                Case "Y"
                    lblBottom1.Text = " To see all your trips"
                    lblBottom2.Text = " Please click on 'See All Trips' button"
                    lblSuccess.Visible = True

                Case "N"
                    Dim QueryString As String = "SELECT bookdatetime FROM bookeddetails WHERE bookref='" & Session("BookRef") & "' ORDER BY bookdatetime"
                    Dim PayTimeDataSet As DataSet = Airline.Query(QueryString)

                    lblMustPayIn.Text = "Note : The ticket needs to be purchased within " _
                                    & CDate(PayTimeDataSet.Tables(0).Rows(0).Item("BookDateTime")).AddDays(5).ToString _
                                    & " otherwise the system will automatically cancel the booking."
                    lblBottom1.Text = " To purchase ticket now"
                    lblBottom2.Text = " Please click on 'Back' button"


                    lblMustPayIn.Visible = True
                    lblFail.Visible = True

            End Select
        End If

    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("payment.aspx")
    End Sub

    Private Sub btnAllTrips_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAllTrips.Click
        Response.Redirect("alltrips.aspx")
    End Sub
End Class
