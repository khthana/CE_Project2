Public Class paymentHisPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents merNameLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid

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
        Dim merChecked As Merchant = mer1.Check(mer1)
        merNameLabel.Text = merChecked.GetMerchantName
        Session("CusID") = mer1.Check(mer1).GetMerchantID
        '****************************************
        Dim payHisDA As New PaymentDA  'สร้างออบเจ็คที่ติดต่อกับ account database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        Dim merPayDataset As New DataSet("pay_his_select_dataset")
        merPayDataset = payHisDA.MerPaySelectDataset(merChecked)
        '****************************************
        DataGrid1.DataSource = merPayDataset.Tables("pay_his_select_dataset")
        DataGrid1.DataBind()
    End Sub

End Class
