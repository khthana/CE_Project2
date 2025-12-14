Public Class WebFormInbasket
    Inherits System.Web.UI.Page
    Protected WithEvents btnContinue As System.Web.UI.WebControls.Button
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents lblSum As System.Web.UI.WebControls.Label
    Protected WithEvents btnCheckOut As System.Web.UI.WebControls.Button
    Protected WithEvents DataSet1 As System.Data.DataSet
    Protected WithEvents DataTable1 As System.Data.DataTable
    Protected WithEvents DataColumn1 As System.Data.DataColumn
    Protected WithEvents DataColumn2 As System.Data.DataColumn
    Protected WithEvents DataColumn3 As System.Data.DataColumn
    Protected WithEvents DataColumn4 As System.Data.DataColumn
    Protected WithEvents DataColumn5 As System.Data.DataColumn
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid

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
        Me.DataTable1.Columns.AddRange(New System.Data.DataColumn() {Me.DataColumn1, Me.DataColumn2, Me.DataColumn3, Me.DataColumn4, Me.DataColumn5})
        Me.DataTable1.TableName = "Table1"
        '
        'DataColumn1
        '
        Me.DataColumn1.ColumnName = "รูปภาพ"
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
        Me.DataColumn5.ColumnName = "แก้ไข"
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataTable1, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
    Dim srvSell As ServiceSellCenter.ServiceSell = New ServiceSellCenter.ServiceSell()
    Dim DataInBasket() As ServiceSellCenter.ReturnInfoBasket
    Dim DataProduct As ServiceSellCenter.ReturnInfoProduct
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here

        DataInBasket = srvSell.GetInBasket(Request.ServerVariables("REMOTE_HOST"))
        Dim count As Integer = DataInBasket.Length
        DataSet1.Tables("table1").Clear()
        Dim a As DataTable = DataSet1.Tables("table1")
        Dim i As Integer
        Dim Link As String
        Dim mul As Decimal

        For i = 0 To count - 1
            If DataInBasket(i).IDProduct > -1 Then
                DataProduct = srvSell.SearchProductByID(DataInBasket(i).IDProduct, DataInBasket(i).IDSeller)
                If DataProduct.IDSeller > -1 Then
                    Dim rc As DataRow = a.NewRow()
                    rc("รูปภาพ") = "<center><a href=" + DataProduct.Picture + " target=_blank> <img src =" + DataProduct.Picture + " hight=50 width=50></center>"
                    rc("ชื่อสินค้า") = DataProduct.Name
                    rc("จำนวน") = DataInBasket(i).Quantity
                    mul = (CDec(DataProduct.Price) * CInt(DataInBasket(i).Quantity))
                    rc("ราคา") = CStr(mul) + "บาท"
                    rc("แก้ไข") = "<a href=webformEditInBasket.aspx?Product=" & DataInBasket(i).IDProduct & "&Quantity=" & DataInBasket(i).Quantity & _
                                "&Seller=" & DataInBasket(i).IDSeller & ">" & "แก้ไข" & "</a>"
                    a.Rows.Add(rc)
                End If
            End If
        Next
        DataGrid1.DataBind()
        lblSum.Text = srvSell.SumBasket(Request.ServerVariables("REMOTE_HOST"))
       
    End Sub
    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Response.Redirect("webformbag1.aspx")
    End Sub

    Private Sub btnCheckOut_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCheckOut.Click
        Response.Redirect("webformCheckout.aspx")
    End Sub

End Class
