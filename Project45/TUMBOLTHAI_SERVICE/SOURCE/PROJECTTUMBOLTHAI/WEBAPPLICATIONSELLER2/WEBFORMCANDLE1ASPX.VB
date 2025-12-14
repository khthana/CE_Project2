Public Class WebForm1
    Inherits System.Web.UI.Page
    Protected WithEvents txtUsername As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnLogout As System.Web.UI.WebControls.Button
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents Button3 As System.Web.UI.WebControls.Button
    Protected WithEvents Button4 As System.Web.UI.WebControls.Button
    Protected WithEvents Button2 As System.Web.UI.WebControls.Button
    Protected WithEvents Button1 As System.Web.UI.WebControls.Button
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Button5 As System.Web.UI.WebControls.Button
    Protected WithEvents Button6 As System.Web.UI.WebControls.Button
    Protected WithEvents txtNameSearch As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSearch As System.Web.UI.WebControls.Button
    Protected WithEvents ddlFrom As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Button7 As System.Web.UI.WebControls.Button
    Protected WithEvents Button8 As System.Web.UI.WebControls.Button
    Protected WithEvents Button9 As System.Web.UI.WebControls.Button
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents txtDetail As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents txtPrice As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents lblShowLogin As System.Web.UI.WebControls.Label

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
    Dim srvAuthen As ServiceAuthens.ServiceAuthen = New ServiceAuthens.ServiceAuthen()
    Dim DataUser As ServiceAuthens.ReturnUser
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        DataUser = srvAuthen.Passport(Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID <> -1 Then
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Black
            lblShowLogin.Text = "สวัสดีคับ คุณ " & DataUser.Name
        Else
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Red
            lblShowLogin.Text = "ข้ออภัยครับ<br>คุณต้องทำการเข้าสู่ระบบก่อนทำรายการสินค้า"
        End If
    End Sub
    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim Temp As String
        'Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text
        Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text & "&Detail=" & txtDetail.Text & "&Price=" & txtPrice.Text
        Response.Redirect("webformSearch.aspx" & Temp)
    End Sub

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        DataUser = srvAuthen.Login(txtUsername.Text, txtPassword.Text, Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID <> -1 Then
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Black
            lblShowLogin.Text = "สวัสดีคับ คุณ " & DataUser.Name
            txtUsername.Text = ""
            txtPassword.Text = ""
        Else
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Red
            lblShowLogin.Text = "ข้ออภัยครับ<br>คุณไม่สามารถเข้าสู่ระบบได้"
        End If
    End Sub

    Private Sub btnLogout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogout.Click
        srvAuthen.Logout(Request.ServerVariables("REMOTE_HOST"))
        lblShowLogin.ForeColor = lblShowLogin.ForeColor.Pink
        lblShowLogin.Text = "ขอบคุณที่ใช้บริการครับ"
    End Sub

    Private Sub txtNameSearch_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtNameSearch.TextChanged

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        ' Link = "webformPutIn.aspx?Product=" & DataProduct2(i).ID & "&Seller=" & DataProduct2(i).IDSeller
        Response.Redirect("webformPutIn.aspx?Product=3&Seller=2")
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("webformPutIn.aspx?Product=4&Seller=2")
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Response.Redirect("webformPutIn.aspx?Product=5&Seller=2")
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Response.Redirect("webformPutIn.aspx?Product=6&Seller=2")
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        Response.Redirect("webformPutIn.aspx?Product=7&Seller=2")
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        Response.Redirect("webformPutIn.aspx?Product=8&Seller=2")
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        Response.Redirect("webformPutIn.aspx?Product=9&Seller=2")
    End Sub

    Private Sub Button9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button9.Click
        Response.Redirect("webformPutIn.aspx?Product=10&Seller=2")
    End Sub

    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        Response.Redirect("webformPutIn.aspx?Product=11&Seller=2")
    End Sub
End Class
