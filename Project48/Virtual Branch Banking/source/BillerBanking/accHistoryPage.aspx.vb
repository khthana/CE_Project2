Public Class accHistoryPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents accNoLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents merNameLabel As System.Web.UI.WebControls.Label

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
        Dim accNoTmp As String = Request.QueryString("accNo")
        Dim acc1 As New Account(CInt(accNoTmp))
        acc1 = acc1.Check(acc1)
        '*************************************************
        Dim mer1 As New Merchant(Session("CusID"), "", "", "", "", "")
        merNameLabel.Text = mer1.Check(mer1).GetMerchantName
        '****************************************
        accNoLabel.Text = acc1.GetAccNo
        '****************************************
        Dim accHisDA1 As New AccountHisDA 'สร้างออบเจ็คที่ติดต่อกับ account database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        Dim accountHisDataset As New DataSet("acct_his_select_dataset")
        accountHisDataset = accHisDA1.SelectDataset(acc1)
        '****************************************
        DataGrid1.DataSource = accountHisDataset.Tables("acct_his_select_dataset")
        DataGrid1.DataBind()
    End Sub

End Class
