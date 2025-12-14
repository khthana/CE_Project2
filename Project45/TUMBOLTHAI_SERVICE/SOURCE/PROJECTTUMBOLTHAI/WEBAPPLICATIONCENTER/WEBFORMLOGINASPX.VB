Public Class WebForm1
    Inherits System.Web.UI.Page
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents txtUsername As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents btnLogout As System.Web.UI.WebControls.Button
    Protected WithEvents lblShowLogin As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
    Protected WithEvents lblRegis As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents lblUpdateRegis As System.Web.UI.WebControls.Label
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label

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
    Private srvAuthen As ServiceAuthen.ServiceAuthen = New ServiceAuthen.ServiceAuthen()
    Private DataUser As ServiceAuthen.ReturnUser

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
End Class
