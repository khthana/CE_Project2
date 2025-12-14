Public Class updatestatus
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents cboDay As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboMonth As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboYear As System.Web.UI.WebControls.DropDownList
    Protected WithEvents radLeg As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents txtTime As System.Web.UI.WebControls.TextBox
    Protected WithEvents chkCustom As System.Web.UI.WebControls.CheckBox
    Protected WithEvents cboFlightID As System.Web.UI.WebControls.DropDownList
    Protected WithEvents btnUpdate As System.Web.UI.WebControls.Button
    Protected WithEvents cboAirport As System.Web.UI.WebControls.DropDownList
    Protected WithEvents radFlightStatus As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents btnStatus As System.Web.UI.WebControls.Button

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

            Dim CurrentDate As DateTime = DateTime.Now
            cboDay.SelectedValue = CurrentDate.Day
            cboMonth.SelectedIndex = CurrentDate.Month - 1
            cboYear.SelectedValue = CurrentDate.Year
            txtTime.Text = CurrentDate.ToShortTimeString

            cboFlightID.DataSource = SkyHigh.GetFlightColumn
            cboFlightID.DataBind()
            cboAirport.DataSource = SkyHigh.GetAirportColumn
            cboAirport.DataBind()
        End If

    End Sub

    Private Sub chkCustom_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkCustom.CheckedChanged
        If chkCustom.Checked = True Then
            cboDay.Enabled = True
            cboMonth.Enabled = True
            cboYear.Enabled = True
            txtTime.Enabled = True
        Else
            cboDay.Enabled = False
            cboMonth.Enabled = False
            cboYear.Enabled = False
            txtTime.Enabled = False
        End If
    End Sub

    Private Sub btnStatus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnStatus.Click
        Response.Redirect("http://161.246.5.166/skyhighbeta/flightstatus.aspx?FlightStatus=" & cboAirport.Items(cboAirport.SelectedIndex).Value & _
                                                                                            "&LegStatus=" & radFlightStatus.Items(radFlightStatus.SelectedIndex).Value)
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim Service As New skyhighStatus.Status
        Dim MDY As String = cboDay.Items(cboDay.SelectedIndex).Value & "/" & cboMonth.Items(cboMonth.SelectedIndex).Value & "/" & cboYear.Items(cboYear.SelectedIndex).Value
        lblStatus.Text = Service.UpdateStatus(cboFlightID.Items(cboFlightID.SelectedIndex).Value, MDY, radLeg.Items(radLeg.SelectedIndex).Value, txtTime.Text)
    End Sub
End Class
