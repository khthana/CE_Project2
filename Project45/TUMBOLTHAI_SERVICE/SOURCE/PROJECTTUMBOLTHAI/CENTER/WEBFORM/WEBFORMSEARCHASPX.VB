Public Class WebFormSearch
    Inherits System.Web.UI.Page

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
    Dim srvSell As SrvSell.ServiceSell = New SrvSell.ServiceSell()
    Dim DataProduct() As srvSell.ReturnInfoProduct
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        DataProduct = srvSell.SearchProductByName(Request.QueryString("TextSerach"))
        'Response.Write(Request.QueryString("TextSerach"))
        Dim i As Integer
        For i = 0 To DataProduct.Length - 1
            Response.Write(DataProduct(i).Name)
        Next
    End Sub

End Class
