<%response.Buffer = true ' เพราะจะใช้ Response.redirect%>
<!--include file เพื่อจะได้ใช้ค่า constant ใน global.asp-->
	<%
		Set Conn = Server.CreateObject("ADODB.Connection")
		conn.Open="Driver={sql server}; server=market; database=marketplace;"
	%>

<body  background="images/bg1.jpg">

<%
operate=request("Command")
PRID=request("PRID")

if operate="Delete" then
		

		sql="select PRStatus,UpdateFullDate From PR Where PRID="&PRID
		Set rs = Server.CreateObject("ADODB.Recordset") 
		rs.Open sql,conn,1,3
											rs(0)="deleted"
											rs(1)=now
		rs.update
		rs.close
		response.redirect "ViewPR.asp?prid="&PRID
		
else 	if operate="Update" then
					
					sql ="UPDATE  PR  SET  PRTotal="&request("TotalPrice")&",PRShipPrice="&_
							request("TotalShipPrice")&",PRItemPrice="&request("TotalItemPrice")&" WHERE PRID="&PRID
					
					conn.execute sql,,adCmdText
					sql="select PRAddress,UpdateFullDate From PR Where PRID="&PRID
					Set rs1 = Server.CreateObject("ADODB.Recordset") 
					rs1.Open sql,conn,1,3
					rs1(0)=request("Address")
					rs1(1)=now
					rs1.update
					rs1.close
					
					sql="Select * From OrderDetail Where PRID="&PRID
					Set rsDetail = Server.CreateObject("ADODB.Recordset") 
					rsDetail.Open sql,conn,1,3
					rsDetail.moveFirst
					
					Do while not rsDetail.EOF
					rsDetail("OrderQTY")=request("QTY"&rsDetail("Line"))
					
					d=request("day"&rsDetail("Line"))
					m=request("month"&rsDetail("Line"))
					y=request("year"&rsDetail("Line"))+2001
					
					rsDetail("NeedDate")=dateserial(y,m,d)

					rsDetail.update
					rsDetail.moveNext
					
					Loop
					rsDetail.close
					
					response.redirect "ViewPR.asp?prid="&PRID
			
			else ' delete บรรทัดเดียว
						sql="select Count(*) From OrderDetail Where PRID="&PRID
						set rs=conn.execute(sql,,cmdText)
						numberLine=rs(0)
						
						
						
						if numberLine=1 then ' ถ้าเหลือแค่ Item เดียวให้ลบทั้งใบ
						
								
									sql="select PRStatus,UpdateFullDate From PR Where PRID="&PRID
									Set rs = Server.CreateObject("ADODB.Recordset") 
									rs.Open sql,conn,1,3
											rs(0)="deleted"
											rs(1)=now
									rs.update
									rs.close
						else
						
								sql ="DELETE FROM OrderDetail WHERE PRID="&PRID&" AND LineNo="&operate
								conn.execute sql,,adCmdText
								
								sql="select PRStatus,UpdateFullDate From PR Where PRID="&PRID
								Set rs = Server.CreateObject("ADODB.Recordset") 
								rs.Open sql,conn,1,3
											'rs(0)="deleted"
											rs(1)=now
								rs.update
								rs.close
						
						end if
					response.redirect "ViewPR.asp?prid="&PrID
			end if
end if

%>
</body>
