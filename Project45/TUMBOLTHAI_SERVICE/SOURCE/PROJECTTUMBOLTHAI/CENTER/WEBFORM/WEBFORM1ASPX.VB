Public Class WebForm1
    Inherits System.Web.UI.Page
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents txthiden As System.Web.UI.WebControls.TextBox
    Protected WithEvents LinkButton2 As System.Web.UI.WebControls.LinkButton
    Protected WithEvents LinkButton1 As System.Web.UI.WebControls.LinkButton
    Protected WithEvents LblName1 As System.Web.UI.WebControls.Label
    Protected WithEvents LblDetail1 As System.Web.UI.WebControls.Label
    Protected WithEvents LblPrice1 As System.Web.UI.WebControls.Label
    Protected WithEvents LblPicture1 As System.Web.UI.WebControls.Label
    Protected WithEvents LblIDProduct As System.Web.UI.WebControls.Label
    Protected WithEvents lblIDSeller As System.Web.UI.WebControls.Label
    Protected WithEvents LinkButton3 As System.Web.UI.WebControls.LinkButton
    Protected WithEvents txtSearchNames As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Submit1 As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents Tr1 As System.Web.UI.HtmlControls.HtmlTableRow

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
    'Dim srvSell As srvSell.ServiceSell = New srvSell.ServiceSell()
    'Dim DataProduct() As srvSell.ReturnInfoProduct
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub

    Private Sub Submit1_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Submit1.ServerClick
        'DataProduct = srvSell.SearchProductByName(txtSearchNames.Value)
        Dim Str As String
        Str = "webformSearch.aspx?TextSerach=" & txtSearchNames.Value
        Response.Redirect(Str)

    End Sub
End Class
