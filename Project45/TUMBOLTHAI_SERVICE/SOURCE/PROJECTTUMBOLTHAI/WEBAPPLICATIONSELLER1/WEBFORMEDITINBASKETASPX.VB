Public Class WebFormEditInBasket
    Inherits System.Web.UI.Page
    Protected WithEvents lblError As System.Web.UI.WebControls.Label
    Protected WithEvents btnEdit As System.Web.UI.WebControls.Button
    Protected WithEvents lblPrice As System.Web.UI.WebControls.Label
    Protected WithEvents lblUnit As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents txtQuantity As System.Web.UI.WebControls.TextBox
    Protected WithEvents ImgProduct As System.Web.UI.WebControls.Image
    Protected WithEvents lblDetail As System.Web.UI.WebControls.Label
    Protected WithEvents btnDelete As System.Web.UI.WebControls.Button
    Protected WithEvents lblName As System.Web.UI.WebControls.Label

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        txtQuantity.Text = "1"
    End Sub

#End Region
    Private DataProduct As ServiceSellCenter.ReturnInfoProduct
    Private srvSell As ServiceSellCenter.ServiceSell = New ServiceSellCenter.ServiceSell()
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        DataProduct = srvSell.SearchProductByID(Request.QueryString("Product"), Request.QueryString("seller"))
        If DataProduct.ID > -1 Then
            lblName.Text = DataProduct.Name
            lblDetail.Text = DataProduct.Detail
            lblUnit.Text = DataProduct.Unit
            lblPrice.Text = DataProduct.Price & "บาท / " & DataProduct.Unit
            ImgProduct.ImageUrl = DataProduct.Picture

            lblError.Visible = False
        End If
    End Sub
    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        If srvSell.DeleteInbasket(Request.ServerVariables("REMOTE_HOST"), Request.QueryString("Product"), Request.QueryString("seller")) = False Then
            lblError.Text = "กรุณาเข้าสู่ระบบก่อนทำรายการสินค้าด้วยครับ"
            lblError.Visible = True
        Else
            'lblError.Text = "<font color=#0000ff> ทำการลบ  " & lblName.Text & "เสร็จเรียบร้อย</font>"
            'lblError.Visible = True
            Response.Redirect("webforminbasket.aspx")
        End If

    End Sub
    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click


        If srvSell.CheckStrIsNumAll(txtQuantity.Text) = True And txtQuantity.Text.Length > 0 Then
            If srvSell.UpdateQuantityInbasket(Request.ServerVariables("REMOTE_HOST"), Request.QueryString("Product"), txtQuantity.Text, Request.QueryString("seller")) = False Then
                lblError.Text = "กรุณาเข้าสู่ระบบก่อนทำรายการสินค้าด้วยครับ หรือ อย่าใส่จำนวนเป็น 0"
                lblError.Visible = True
            Else
                'lblError.Text = "<font color=#0000ff> ทำการเปลี่ยนแปลงข้อมูล  " & lblName.Text & "เสร็จเรียบร้อย</font>"
                'lblError.Visible = True
                Response.Redirect("webforminbasket.aspx")
            End If
        Else
            lblError.Text = "กรุณาใส่จำนวนเป็นตัวเลขด้วยครับ"
            lblError.Visible = True
        End If
    End Sub
End Class
