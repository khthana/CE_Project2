Public Class WebFormSearch
    Inherits System.Web.UI.Page
    Protected WithEvents txtNameProduct As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents lblerror As System.Web.UI.WebControls.Label
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents DataSet1 As System.Data.DataSet
    Protected WithEvents DataTable1 As System.Data.DataTable
    Protected WithEvents DataColumn1 As System.Data.DataColumn
    Protected WithEvents DataColumn2 As System.Data.DataColumn
    Protected WithEvents DataColumn3 As System.Data.DataColumn
    Protected WithEvents DataColumn4 As System.Data.DataColumn
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents txtPrice As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDetail As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSearch As System.Web.UI.WebControls.Button

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.DataSet1 = New System.Data.DataSet()
        Me.DataTable1 = New System.Data.DataTable()
        Me.DataColumn1 = New System.Data.DataColumn()
        Me.DataColumn2 = New System.Data.DataColumn()
        Me.DataColumn3 = New System.Data.DataColumn()
        Me.DataColumn4 = New System.Data.DataColumn()
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
        Me.DataTable1.Columns.AddRange(New System.Data.DataColumn() {Me.DataColumn1, Me.DataColumn2, Me.DataColumn3, Me.DataColumn4})
        Me.DataTable1.TableName = "Table1"
        '
        'DataColumn1
        '
        Me.DataColumn1.Caption = "ชื่อสินค้า"
        Me.DataColumn1.ColumnName = "ชื่อสินค้า"
        '
        'DataColumn2
        '
        Me.DataColumn2.Caption = "ข้อมูลสินค้า"
        Me.DataColumn2.ColumnName = "ข้อมูลสินค้า"
        '
        'DataColumn3
        '
        Me.DataColumn3.Caption = "ราคา"
        Me.DataColumn3.ColumnName = "ราคาสินค้า"
        '
        'DataColumn4
        '
        Me.DataColumn4.Caption = "รูปภาพสินค้าตัวอย่าง"
        Me.DataColumn4.ColumnName = "รูปภาพสินค้าตัวอย่าง"
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataTable1, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
    Private srvSell As ServiceSellCenter.ServiceSell = New ServiceSellCenter.ServiceSell()
    Private DataProduct() As ServiceSellCenter.ReturnInfoProduct
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        If txtNameProduct.Text = "" Then
            lblerror.Visible = True
            Exit Sub
        Else
            lblerror.Visible = False
        End If
        DataProduct = srvSell.SearchProductByName(txtNameProduct.Text, txtDetail.Text, txtPrice.Text)

        Dim count As Integer = DataProduct.Length
        DataSet1.Tables("table1").Clear()
        Dim a As DataTable = DataSet1.Tables("table1")
        Dim i As Integer
        Dim Link As String
        For i = 0 To count - 1
            If DataProduct(i).ID > -1 Then
                Dim rc As DataRow = a.NewRow()
                Link = "webformPutIn.aspx?Product=" & DataProduct(i).ID & "&Seller=" & DataProduct(i).IDSeller
                rc("ชื่อสินค้า") = "<a href=" & Link & ">" & DataProduct(i).Name & "</a>"
                rc("ข้อมูลสินค้า") = DataProduct(i).Detail
                rc("ราคาสินค้า") = DataProduct(i).Price + "บาท / " + DataProduct(i).Unit
                rc("รูปภาพสินค้าตัวอย่าง") = "<center><a href=" + DataProduct(i).Picture + " target=_blank> <img src =" + DataProduct(i).Picture + " hight=150 width=150></center>"
                'rc("colName") = DataProduct(i).Name
                ' rc["รูปตัวอย่าง"] ="<a href="+picture_large+" target=_blank> <img src ="+gift_info[i].pic_url+">";
                a.Rows.Add(rc)
            End If
        Next
        DataGrid1.DataBind()
    End Sub

  
End Class
