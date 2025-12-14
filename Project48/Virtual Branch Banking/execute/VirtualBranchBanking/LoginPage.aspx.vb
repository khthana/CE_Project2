Public Class LoginPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents usernameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents passwordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents userloginButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents activeCardImageButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents nowInsertLabel As System.Web.UI.WebControls.Label
    Protected WithEvents cardNoInsertLabel As System.Web.UI.WebControls.Label
    Protected WithEvents pinLabel As System.Web.UI.WebControls.Label
    Protected WithEvents cardNoInsertTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents pinInsertTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents enterPinButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label

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
    Private Sub userloginButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles userloginButton.Click
        '*************************************************
        'When User log in by username and password
        '*************************************************
        If (usernameTextBox.Text = "" Or passwordTextBox.Text = "") Then
            Response.Redirect("errorPage.aspx?reason=Please fill out the form...")
            Exit Sub
        End If
        '********************************
        Dim mem1 As New Member(usernameTextBox.Text, passwordTextBox.Text)
        If (mem1.Check(mem1).GetMemberID = 0) Then
            Response.Redirect("errorPage.aspx?reason=Invalid Username or Password...")
            Exit Sub
        Else
            Session("User") = mem1.GetUsername
            Session("loginType") = "username"
            Session("ATMCODE") = Request.UserHostAddress 'สมมุติให้ใช้ IP address ของเครื่องแทน รหัสเครื่อง ATM
            Response.Redirect("accSumPage.aspx")
            Exit Sub
        End If
    End Sub

    Private Sub enterPinButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles enterPinButton.Click
        '*************************************************
        'When User log in by atm card and pin
        '*************************************************
        If (cardNoInsertTextBox.Text = "" Or pinInsertTextBox.Text = "") Then
            Response.Redirect("errorPage.aspx?reason=Please fill out the form...")
            nowInsertLabel.Visible = True
            cardNoInsertLabel.Visible = True
            cardNoInsertTextBox.Visible = True
            pinLabel.Visible = True
            pinInsertTextBox.Visible = True
            Exit Sub
        End If
        '***********************************
        Dim card1 As New Card(cardNoInsertTextBox.Text, pinInsertTextBox.Text)
        If (card1.CheckPIN(card1).GetCardNo = 0) Then
            Response.Redirect("errorPage.aspx?reason=Invalid Card No. or PIN...")
            Exit Sub
        Else
            Session("User") = card1.GetCardNo
            Session("loginType") = "atmCard"
            Session("ATMCODE") = Request.UserHostAddress 'สมมุติให้ใช้ IP address ของเครื่องแทน รหัสเครื่อง ATM
            Response.Redirect("accSumPage.aspx") '?path=" & Session("User"))
            Exit Sub
        End If
    End Sub
    Private Sub activeCardImageButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles activeCardImageButton.Click
        nowInsertLabel.Visible = True
        cardNoInsertLabel.Visible = True
        cardNoInsertTextBox.Visible = True
        pinLabel.Visible = True
        pinInsertTextBox.Visible = True
        enterPinButton.Visible = True
    End Sub
End Class
