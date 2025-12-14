Public Class WebFormUpdate
    Inherits System.Web.UI.Page
    Protected WithEvents lblDetail As System.Web.UI.WebControls.Label
    Protected WithEvents chkSend As System.Web.UI.WebControls.CheckBox
    Protected WithEvents btnUpdate As System.Web.UI.WebControls.Button
    Protected WithEvents Button1 As System.Web.UI.WebControls.Button
    Protected WithEvents lblOk As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents chkPay As System.Web.UI.WebControls.CheckBox

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        DataBehide = srvBehide.SearchOrderID(Request.QueryString("ID"))
        lblDetail.Text = "ซื้อของวันที่  " & DataBehide.DateOrder & "<br>"
        lblDetail.Text += "สินค้า  " & DataBehide.NameProduct & "  " & DataBehide.Quantity & "  ชิ้น  " & DataBehide.Price & "  บาท<br>"
        lblDetail.Text += "ซื้อโดยคุณ  " & DataBehide.NameBuyer
        chkPay.Checked = DataBehide.Getmoney
        chkSend.Checked = DataBehide.Send

    End Sub

#End Region
    Dim srvBehide As serviceBehide.ServiceBehide = New serviceBehide.ServiceBehide()
    Dim DataBehide As serviceBehide.ReturnUpdateOrder
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        lblOk.Visible = False
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        srvBehide.UpdateOrder(DataBehide.DateOrder, DataBehide.IDProduct, DataBehide.IDBuyer, chkSend.Checked, chkPay.Checked, DataBehide.IDSeller)
        lblOk.Visible = True
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("webformsearch.aspx")
    End Sub
End Class
