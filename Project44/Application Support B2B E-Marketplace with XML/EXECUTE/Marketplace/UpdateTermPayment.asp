<% response.Buffer = true ' เพราะจะใช้ Response.redirect

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"


			sql ="DELETE FROM TERM  WHERE sellerID="&session("SellerID")
			conn.execute sql,,adCmdText
		
		
		
		Set rs = Server.CreateObject("ADODB.Recordset") 
		rs.Open "Term",conn,1,3
		
		sql="Select  ID  From Member Where MemberType='b'"
		Set rs1 = Server.CreateObject("ADODB.Recordset") 
		rs1.Open sql,conn,1,3
		
		do while  not rs1.eof
		
		
		Set rs2 = Server.CreateObject("ADODB.Recordset") 
		rs2.Open "TERM",conn,1,3
		
		rs2.addnew
		
		rs2("SellerID")=session("SellerID")
		rs2("BuyerID")=rs1(0)
		rs2("term")=request("term"&rs1(0))
		rs2.update
		rs2.close
		
		
		
		rs1.movenext
		loop
		rs.close
		conn.close
		response.redirect("supplierservice.asp")
		
%>
