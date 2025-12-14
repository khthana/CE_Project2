<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<html>
<head>
<script runat=server>
Sub Page_Load()
   Dim myRow As DataRow
   Dim ratio1 As String = Request.QueryString("ratio1")
   Dim relation1 As String = Request.QueryString("relation1")
   
   Dim ratio2 As String = Request.QueryString("ratio2")
   Dim relation2 As String = Request.QueryString("relation2")


	  '+++++++++database1
	If Not(ratio1="0") then
      Dim connectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myConnection As OleDbConnection = New OleDbConnection(connectionString)
      myConnection.Open()
      Dim selectStatement As String = "SELECT rule2.*, * FROM rule2 WHERE (((rule2.ratio)="
      selectStatement &= ratio1 
      selectStatement &= ") AND ((rule2.relation)="
      selectStatement &= relation1 
      selectStatement &= "));"
      Dim myAdapter As OleDbDataAdapter = New OleDbDataAdapter(selectStatement, myConnection)
      Dim myDataSet As New DataSet("subject")
      myAdapter.Fill(myDataSet, "subject")
      myConnection.Close
      For Each myRow In myDataSet.Tables("subject").Rows
		method1.Text = myRow("explainword")
      Next
	End If
      
     If Not(ratio2="0") then
      Dim connectionString2 As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\inetpub\wwwroot\ES.mdb"
      Dim myConnection2 As OleDbConnection = New OleDbConnection(connectionString2)
      myConnection2.Open()
      Dim selectStatement2 As String = "SELECT rule2.*, * FROM rule2 WHERE (((rule2.ratio)="
      selectStatement2 &= ratio2 
      selectStatement2 &= ") AND ((rule2.relation)="
      selectStatement2 &= relation2
      selectStatement2 &= "));"
      Dim myAdapter2 As OleDbDataAdapter = New OleDbDataAdapter(selectStatement2, myConnection2)
      Dim myDataSet2 As New DataSet("subject")
      myAdapter2.Fill(myDataSet2, "subject")
      myConnection2.Close
      For Each myRow In myDataSet2.Tables("subject").Rows
		method2.Text = myRow("explainword")
      Next
	End If
End Sub
</script>
<title>
	ระบบผู้เชี่ยวชาญสรุปความความน่าลงทุน
</title></head>
<body>
	<form runat=server method=post>


	<table width=80% align=cente border=1>
		<tr><td align=center bgcolor=#0000FF><font color=#FFFF66><b>
					ระบบผู้เชี่ยวชาญแนะนำการลงทุน
		</font></b></td></tr>
		<tr><td bgcolor=#FFCC99>
			&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="method1" Runat=server></asp:Label>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="method2" Runat=server></asp:Label>
		</td></tr>
	</table>
	</form>
</body>
</html>