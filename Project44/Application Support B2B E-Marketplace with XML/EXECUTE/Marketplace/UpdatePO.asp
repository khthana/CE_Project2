<%response.Buffer = true ' เพราะจะใช้ Response.redirect%>
<!--include file เพื่อจะได้ใช้ค่า constant ใน global.asp-->
	<%
		Set Conn = Server.CreateObject("ADODB.Connection")
		conn.Open="Driver={sql server}; server=market; database=marketplace;"
	%>

<body  background="images/bg1.jpg">

<%
operate=request("Command")
POID=request("POID")
if operate="Delete" then
		
		sql ="DELETE FROM OrderDetail WHERE POID="&POID
		conn.execute sql,,adCmdText
		sql ="DELETE FROM PO WHERE POID="&POID
		conn.execute sql,,adCmdText
		response.redirect "ViewPO.asp?poid="&POID
		
else 	if operate="Update" then
			
					sql ="UPDATE  PO  SET POAddress='"&request("Address")&"',POTotal="&request("TotalPrice")&",POSendingPrice="&request("TotalShipPrice")&",POItemPrice="&request("TotalItemPrice")&" WHERE POID="&POID
					conn.execute sql,,adCmdText
					sql="Select * From OrderDetail Where POID="&POID
					Set rsDetail = Server.CreateObject("ADODB.Recordset") 
					rsDetail.Open sql,conn,1,3
					rsDetail.moveFirst
					Do while not rsDetail.EOF
					rsDetail("OrderQTY")=request("QTY"&rsDetail("LineNo"))
					rsDetail("NeedDate")=request("day"&rsDetail("LineNo"))

					rsDetail("NeedMonth")=request("month"&rsDetail("LineNo"))
					rsDetail("NeedYear")=request("year"&rsDetail("LineNo"))
					rsDetail.update
					rsDetail.moveNext
					
					Loop
					rsDetail.close
					
					response.redirect "ViewPO.asp?poid="&POID
			else
						sql="select Count(*) From OrderDetail Where POID="&POID
						set rs=conn.execute(sql,,cmdText)
						numberLine=rs(0)
						rs.close
						sql ="DELETE FROM OrderDetail WHERE POID="&POID&" AND LineNo="&operate
						conn.execute sql,,adCmdText
						
						if numberLine=1 then ' ถ้าเหลือแค่ Item เดียวให้ลบทั้งใบ
						
								sql ="DELETE FROM PO WHERE POID="&POID
								conn.execute sql,,adCmdText
						
						end if
					response.redirect "ViewPO.asp?poid="&POID
			end if
end if

%>
</body>
