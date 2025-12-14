Public Class index
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents loginLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents usernameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents passwordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents userloginButton As System.Web.UI.WebControls.Button
    Protected WithEvents showtext As System.Web.UI.WebControls.Label

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
        'Put user code to initialize the page here
    End Sub

    Private Sub userLoginButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles userloginButton.Click
        '********************************
        If (usernameTextBox.Text = "" Or passwordTextBox.Text = "") Then
            showtext.Text = "Please fill out the form..."
            Exit Sub
        End If
        '********************************
        Dim mem1 As New Member(usernameTextBox.Text, passwordTextBox.Text)
        If (mem1.Check(mem1).GetMemberID = 0) Then
            showtext.Text = "Invalid Username or Password..."
            Exit Sub
        Else
            Session("User") = mem1.GetUsername
            Session("loginType") = "username"
            Session("ATMCODE") = Request.UserHostAddress 'สมมุติให้ใช้ IP address ของเครื่องแทน รหัสเครื่อง ATM
            Response.Redirect("mainmenuPage.aspx") '?path=" & Session("User"))
            Exit Sub
        End If
    End Sub
End Class
