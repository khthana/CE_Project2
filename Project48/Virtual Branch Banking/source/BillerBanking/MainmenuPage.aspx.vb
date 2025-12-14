Public Class MainmenuPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents accsumLinkButton As System.Web.UI.WebControls.LinkButton
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents payhisLinkButton As System.Web.UI.WebControls.LinkButton
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents loginLabel As System.Web.UI.WebControls.Label

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
        Dim mem1 As New Member(Session("User"), "")
        Dim cusTmp As String = mem1.Check(mem1).GetcusID
        Dim mer1 As New Merchant(cusTmp, "", "", "", "", "")
        userLabel.Text = mer1.Check(mer1).GetMerchantName
        Session("CusID") = mer1.Check(mer1).GetMerchantID
        '*************
    End Sub

    Private Sub accsumLinkButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles accsumLinkButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("accSumPage.aspx")
        End If
    End Sub

    Private Sub payhisLinkButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles payhisLinkButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("PaymentHisPage.aspx")
        End If
    End Sub
End Class
