Public Class fare
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents grdSelected As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdFare As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblTotal As System.Web.UI.WebControls.Label
    Protected WithEvents lblCondition As System.Web.UI.WebControls.Label
    Protected WithEvents lbl6MonthsHead As System.Web.UI.WebControls.Label
    Protected WithEvents lbl6Months As System.Web.UI.WebControls.Label
    Protected WithEvents lbl1YearHead As System.Web.UI.WebControls.Label
    Protected WithEvents lbl1Year As System.Web.UI.WebControls.Label
    Protected WithEvents chkAck As System.Web.UI.WebControls.CheckBox
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents btnNext As System.Web.UI.WebControls.Button

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
            Dim FareDataSet As DataSet = Airline.ShowItinerary(Session("FID"), Session("FID2"), Session("FID3"), Request("DeptMDY"), Session("DeptMDY2"), Session("DeptMDY3"), Session("ReFID"), Session("ReFID2"), Session("ReFID3"), Request("ReMDY"), Session("ReMDY2"), Session("ReMDY3"), Request("CabinOne"), Request("CabinReturn"), Request("WebFareOne"), Request("WebFareReturn"))

            grdSelected.DataSource = FareDataSet
            grdSelected.DataBind()

            FareDataSet = Airline.ShowFare(FareDataSet, Request("Adult"), Request("Child"), Request("CabinOne"), Request("WebFareOne"), Request("CabinReturn"), Request("WebFareReturn"))
            grdFare.DataSource = FareDataSet
            grdFare.DataBind()

            Session("AllTotal") = FareDataSet.Tables(0).Rows(0).Item("AllTotal")
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

    Private Sub chkAck_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkAck.CheckedChanged
        '++++Enable 'Next' button when checked=============
        If chkAck.Checked Then
            btnNext.Enabled = True
        Else
            btnNext.Enabled = False
        End If
    End Sub

    Private Sub btnNext_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Response.Redirect("passenger.aspx?DeptMDY=" & Request("DeptMDY") & _
                                    "&ReMDY=" & Request("ReMDY") & _
                                    "&Adult=" & Request("Adult") & _
                                    "&Child=" & Request("Child") & _
                                    "&WebFareOne=" & Request("WebFareOne") & _
                                    "&CabinOne=" & Request("CabinOne") & _
                                    "&WebFareReturn=" & Request("WebFareReturn") & _
                                    "&CabinReturn=" & Request("CabinReturn"))
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("searchresult.aspx")
    End Sub
End Class
