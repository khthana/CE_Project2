Public Class WebForm1
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lbl1 As System.Web.UI.WebControls.Label
    Protected WithEvents lbl2 As System.Web.UI.WebControls.Label
    Protected WithEvents grd1 As System.Web.UI.WebControls.DataGrid

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

        'Dim QueryString As String = "SELECT DISTINCT SUBSTR(bf.flightid,1,2) airlinecode FROM bookedflight bf,bookeddetails bd WHERE bf.bookref=bd.bookref AND bd.bookref='SO80VXT' AND bf.isvalid='0' AND bd.isvalid='0'"
        'grd1.DataSource = SkyHigh.Query(QueryString)
        'lbl1.Text = 
        'grd1.DataBind()
        'lbl2.Text = 

        Dim UpdateString As String = "UPDATE bookeddetails SET isvalid='2' WHERE bookref='YL02KLK' AND isvalid='0'"
        'lbl1.Text = Mid(a, InStr(1, a, "'") + 1, 2)
        lbl1.Text = SkyHigh.InsertUpdate(UpdateString)
        'grd1.DataBind()

    End Sub

End Class
