Public Class WebForm1
    Inherits System.Web.UI.Page
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents btnOK As System.Web.UI.WebControls.Button
    Protected WithEvents txtName As System.Web.UI.WebControls.TextBox
    Protected WithEvents DataSet1 As System.Data.DataSet
    Protected WithEvents DataTable1 As System.Data.DataTable
    Protected WithEvents DataColumn1 As System.Data.DataColumn
    Protected WithEvents DataColumn2 As System.Data.DataColumn
    Protected WithEvents DataColumn3 As System.Data.DataColumn
    Protected WithEvents DataColumn4 As System.Data.DataColumn
    Protected WithEvents DataColumn5 As System.Data.DataColumn
    Protected WithEvents DataColumn6 As System.Data.DataColumn
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.DataSet1 = New System.Data.DataSet()
        Me.DataTable1 = New System.Data.DataTable()
        Me.DataColumn1 = New System.Data.DataColumn()
        Me.DataColumn2 = New System.Data.DataColumn()
        Me.DataColumn3 = New System.Data.DataColumn()
        Me.DataColumn4 = New System.Data.DataColumn()
        Me.DataColumn5 = New System.Data.DataColumn()
        Me.DataColumn6 = New System.Data.DataColumn()
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataTable1, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'DataSet1
        '
        Me.DataSet1.DataSetName = "NewDataSet"
        Me.DataSet1.Locale = New System.Globalization.CultureInfo("th-TH")
        Me.DataSet1.Tables.AddRange(New System.Data.DataTable() {Me.DataTable1})
        '
        'DataTable1
        '
        Me.DataTable1.Columns.AddRange(New System.Data.DataColumn() {Me.DataColumn1, Me.DataColumn2, Me.DataColumn3, Me.DataColumn4, Me.DataColumn5, Me.DataColumn6})
        Me.DataTable1.TableName = "Table1"
        '
        'DataColumn1
        '
        Me.DataColumn1.ColumnName = "วันที่"
        '
        'DataColumn2
        '
        Me.DataColumn2.ColumnName = "ชื่อสินค้า"
        '
        'DataColumn3
        '
        Me.DataColumn3.ColumnName = "จำนวน"
        '
        'DataColumn4
        '
        Me.DataColumn4.ColumnName = "ราคา"
        '
        'DataColumn5
        '
        Me.DataColumn5.ColumnName = "ชื่อผู้ซื้อ"
        '
        'DataColumn6
        '
        Me.DataColumn6.ColumnName = "ปรับปรุง"
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataTable1, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
    Dim srvBehide As serviceBehide.ServiceBehide = New serviceBehide.ServiceBehide()
    Dim DataBehide() As serviceBehide.ReturnUpdateOrder
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub

    Private Sub btnOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOK.Click
        DataBehide = srvBehide.SearchOrder(txtName.Text)
        Dim count As Integer = DataBehide.Length
        DataSet1.Tables("table1").Clear()
        Dim a As DataTable = DataSet1.Tables("table1")
        Dim i As Integer
        Dim Link As String
        For i = 0 To count - 1
            Dim rc As DataRow = a.NewRow()
            Link = "webformupdate.aspx?ID=" & DataBehide(i).ID
            rc("วันที่") = DataBehide(i).DateOrder
            rc("ชื่อสินค้า") = DataBehide(i).NameProduct
            rc("จำนวน") = DataBehide(i).Quantity
            rc("ราคา") = DataBehide(i).Price
            rc("ชื่อผู้ซื้อ") = DataBehide(i).NameBuyer
            rc("ปรับปรุง") = "<a href=" & Link & "> ปรับปรุง </a>"
            a.Rows.Add(rc)
        Next
        DataGrid1.DataBind()
    End Sub
End Class
