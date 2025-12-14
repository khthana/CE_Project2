Public Class WebForm1
    Inherits System.Web.UI.Page
    Protected WithEvents Button1 As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents Button2 As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents Button3 As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents Button4 As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents Button5 As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents Button6 As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents ddlFrom As System.Web.UI.WebControls.DropDownList
    Protected WithEvents btnSearch As System.Web.UI.WebControls.Button
    Protected WithEvents txtDetail As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtPrice As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents txtNameSearch As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim Temp As String
        'Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text
        Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text & "&Detail=" & txtDetail.Text & "&Price=" & txtPrice.Text
        Response.Redirect("webformSearch.aspx" & Temp)
    End Sub

    Private Sub Button1_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.ServerClick
        Response.Redirect("webformPutIn.aspx?Product=6&Seller=1")
    End Sub

    Private Sub Button2_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.ServerClick
        Response.Redirect("webformPutIn.aspx?Product=7&Seller=1")
    End Sub

    Private Sub Button3_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.ServerClick
        Response.Redirect("webformPutIn.aspx?Product=9&Seller=1")
    End Sub

    Private Sub Button4_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.ServerClick
        Response.Redirect("webformPutIn.aspx?Product=8&Seller=1")
    End Sub

    Private Sub Button5_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.ServerClick
        Response.Redirect("webformPutIn.aspx?Product=10&Seller=1")
    End Sub

    Private Sub Button6_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.ServerClick
        Response.Redirect("webformPutIn.aspx?Product=11&Seller=1")
    End Sub
End Class
