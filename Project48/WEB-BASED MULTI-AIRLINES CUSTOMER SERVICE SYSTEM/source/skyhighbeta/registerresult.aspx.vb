Public Class registerresult
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblFail As System.Web.UI.WebControls.Label
    Protected WithEvents lblSuccess As System.Web.UI.WebControls.Label
    Protected WithEvents lblFailReason As System.Web.UI.WebControls.Label
    Protected WithEvents lblBottom1 As System.Web.UI.WebControls.Label
    Protected WithEvents Image2 As System.Web.UI.WebControls.Image
    Protected WithEvents lblBottom2 As System.Web.UI.WebControls.Label
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents btnHome As System.Web.UI.WebControls.Button

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
            Select Case Request("IsRegistered")
                Case "Y"
                    lblSuccess.Visible = True
                    lblBottom1.Text = "Welcome to our member."
                    lblBottom1.Visible = True
                    lblBottom2.Text = "Click Home button."
                    lblBottom2.Visible = True

                Case "N"
                    lblFailReason.Text = Request("FailReason")
                    lblFailReason.Visible = True
                    lblFail.Visible = True
                    lblBottom1.Text = "To register again."
                    lblBottom1.Visible = True
                    lblBottom2.Text = "Click Back button."
                    lblBottom2.Visible = True

            End Select
        End If
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("register.aspx")
    End Sub

    Private Sub btnHome_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHome.Click
        Response.Redirect("index.aspx")
    End Sub
End Class
