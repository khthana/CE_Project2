Public Class changeflight
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblDeparture As System.Web.UI.WebControls.Label
    Protected WithEvents cboDeptDay As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboDeptMon As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblReturn As System.Web.UI.WebControls.Label
    Protected WithEvents cboReturnDay As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboReturnMon As System.Web.UI.WebControls.DropDownList
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents btnConfirm As System.Web.UI.WebControls.Button
    Protected WithEvents cboGapless As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboGapmost As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboNotAirline As System.Web.UI.WebControls.DropDownList
    Protected WithEvents chkHop As System.Web.UI.WebControls.CheckBoxList

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
            Dim QueryString As String = "SELECT airlinecode,airlinename FROM airline"
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

            '++++For Out bound **alway do it==========================
            lblDeparture.Text = Request("From") & " - " & Request("To")
            Dim DeptDate As String = Request("DeptMDY")
            cboDeptDay.SelectedValue = Mid(DeptDate, InStr(1, DeptDate, "/") + 1, InStr(InStr(1, DeptDate, "/"), DeptDate, "/") - 1)
            cboDeptMon.SelectedValue = Mid(DeptDate, 1, InStr(1, DeptDate, "/") - 1)

            If Request("ReMDY") <> "null" Then
                lblReturn.Text = Request("To") & " - " & Request("From")
                Dim ReturnDate As String = Request("ReMDY")
                cboReturnDay.SelectedValue = Mid(ReturnDate, InStr(1, ReturnDate, "/") + 1, InStr(InStr(1, ReturnDate, "/"), ReturnDate, "/") - 1)
                cboReturnMon.SelectedValue = Mid(ReturnDate, 1, InStr(1, ReturnDate, "/") - 1)

                lblReturn.Visible = True
                cboReturnDay.Visible = True
                cboReturnMon.Visible = True
            End If
        End If

    End Sub

    Private Sub btnConfirm_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnConfirm.Click

        Dim ReMDY As String = "null"
        If Request("ReMDY") <> "null" Then
            ReMDY = cboReturnMon.Items(cboReturnMon.SelectedIndex).Value & "/" & cboReturnDay.Items(cboReturnDay.SelectedIndex).Value & "/2006"
        End If

        Response.Redirect("selectflight.aspx?DeptMDY=" & cboDeptMon.Items(cboDeptMon.SelectedIndex).Value & _
                                        "/" & cboDeptDay.Items(cboDeptDay.SelectedIndex).Value & "/2006" & _
                                        "&ReMDY=" & ReMDY & _
                                        "&Adult=" & Request("Adult") & _
                                        "&Child=" & Request("Child") & _
                                        "&From=" & Request("From") & _
                                        "&To=" & Request("To") & _
                                        "&CabinOne=" & Request("CabinOne") & _
                                        "&WebFareOne=" & Request("WebFareOne") & _
                                        "&CabinReturn=null" & _
                                        "&WebFareReturn=null" & _
                                        "&NonStop=" & chkHop.Items(0).Selected & _
                                        "&1Stop=" & chkHop.Items(1).Selected & _
                                        "&2Stop=" & chkHop.Items(2).Selected & _
                                        "&Gapless=" & cboGapless.Items(cboGapless.SelectedIndex).Value & _
                                        "&Gapmost=" & cboGapmost.Items(cboGapmost.SelectedIndex).Value & _
                                        "&NotAirline=" & cboNotAirline.Items(cboNotAirline.SelectedIndex).Value)
    End Sub
End Class
