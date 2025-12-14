<%response.Buffer = true ' เพราะจะใช้ Response.redirect
session("flag")=true
%>

<html>
<head>
<title>Sent Purchase Request</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>

</head>
<body  background="images/bg17.jpg">
<p>&nbsp;</p>
<img src="images/SentPR.gif" usemap="#Map" border="0"> 
<map name="Map"> 
  <area shape="rect" coords="610,92,676,111" href="CreatePR.asp">
  <area shape="rect" coords="694,91,800,114" href="OrderStatus.asp">
  <area shape="rect" coords="818,89,903,119" href="MainMenu.asp">
  <area shape="rect" coords="923,90,999,113" href="SignOut.asp">
</map>
<%

		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Set rs = Server.CreateObject("ADODB.Recordset") 
		conn.Open="Driver={sql server}; server=market; database=marketplace;"
		sql="Select *  from Basket where UserSessionID='"&Session.SessionID&"'"
		
		rs.Open sql,conn,1,3

		Do While not rs.EOF  ' -------------- เก็บรายละเอียดต่างๆ ลงในตระกร้า
				
				rs("QTY")=request("itemQty"&rs("BasketID"))
				if request("fAddress"&rs("SupplierID"))<>"" then
								rs("ReceiveAddress")=request("fAddress"&rs("SupplierID"))
				end if
				NeedDay=request("date"&rs("BasketID"))
				NeedMonth=request("month"&rs("BasketID"))
				NeedYear=request("year"&rs("BasketID"))+2001   ' ค่า 1 หมายถึง 2545,2002   , ค่า 2 หมายถึง 2546,2003
				
				rs("ShipMethod")=request("ship"&rs("SupplierID"))
				rs("NeedDate")=dateSerial(NeedYear,NeedMonth,NeedDay)
			
				rs.update
				rs.moveNext
		
		Loop
		
		session("TotalPrice")=request("FinalPrice")
		
		rs.close
		
		

		instruction= request("Instruction")
		if instruction="Back" then  ' กรณีที่จะไปซื้อของต่อยังไม่ต้องการส่ง
				
					conn.close
					set conn=Nothing
					response.clear
					response.redirect (session("history"))'กลับไปหน้าเดิม

		else ' จะส่งใบ PR
				
					if  instruction="Send" then 'กรณีจะส่งใบ PR ต้องมีการ Check Password
						
							Set rsPass = Server.CreateObject("ADODB.Recordset") 
							sql="Select Password  from  Member  where ID="&session("BuyerID")
							rsPass.Open sql,conn
							Password=rsPass("Password")
							rsPass.close


							if  request("passphase")=Password then'Password ถูกต้อง
		
										Set rsSupplierID = Server.CreateObject("ADODB.Recordset") 
										sql="Select SupplierID  from  Basket  where UserSessionID='"&session.sessionID&"' Group by SupplierID"
										rsSupplierID.Open sql,conn,1,1
										ii=0
										
										Do while not rsSupplierID.EOF  ' สร้าง PR ทีละใบ  
											
											if request ("A"&rsSupplierID("SupplierID"))="check" then ' จะสร้าง PR  เฉพาะใบที่ที่มีการเลือก Check  Box 
												
												Set rsPR = Server.CreateObject("ADODB.Recordset") 
												rsPR.Open "PR",Conn,1,3
				
												SellerID=rsSupplierID("SupplierID")
												BuyerID=session("BuyerID")
												Term=request("fTerm"&rsSupplierID("SupplierID"))
												Address=request("fAddress"&rsSupplierID("SupplierID"))
											
												PRStatus="opened"
												ShipMethod=request("Ship"&rsSupplierID("SupplierID"))
												
												sql1="Select max(prid) from pr"
												set rs1=conn.execute(sql1,,cmdText)
												PRID=rs1(0)+1
												rs1.close
												
												rsPR.addnew
												rsPR("PRID")=PRID
												rsPR("PRNo")="N/A"
												rsPR("BuyerID")=BuyerID
												rsPR("SellerID")=SellerID
												rsPR("ShipMethod")=ShipMethod
											

											
												rsPR("PRFullDate")=now
												rsPR("UpdateFullDate")=now
												rsPR("PRTerm")=Term
												rsPR("PRAddress")=Address
												rsPR("PRStatus")=PRStatus
											
											
										
												
												' ราคาสินค้ารวม
												sql="Select SUM(QTY*ItemPrice) From  Basket,Catalog where Basket.ItemID=Catalog.ItemID AND UserSessionID='"&session.sessionID&"' AND SupplierID="&rsSupplierID("SupplierID")
												Set rs=conn.Execute(sql,,CmdText)
												rsPR("PRItemPrice")=rs(0)
												i=rs(0)
												rs.close
												
												' ราคาขนส่งรวม
												if ShipMethod="Sent" then
												sql="Select SUM(QTY*ShipPrice) From  Basket,Catalog where Basket.ItemID=Catalog.ItemID AND UserSessionID='"&session.sessionID&"' AND SupplierID="&rsSupplierID("SupplierID")
												end if
												if ShipMethod="Ems" then
												sql="Select SUM(QTY*EMSPrice) From  Basket,Catalog where Basket.ItemID=Catalog.ItemID AND UserSessionID='"&session.sessionID&"' AND SupplierID="&rsSupplierID("SupplierID")
												end if
												if ShipMethod="FedEx" then
												sql="Select SUM(QTY*FedExPrice) From  Basket,Catalog where Basket.ItemID=Catalog.ItemID AND UserSessionID='"&session.sessionID&"' AND SupplierID="&rsSupplierID("SupplierID")
												end if
												
												Set rs=conn.Execute(sql,,CmdText)
												rsPR("PRShipPrice")=rs(0)
												s=rs(0)
												rs.close
												
												rsPR("PRTotal")=i+s
												rsPR.update
				
												if rsPR("BuyerID")=2  and rsPR("SellerID")=4 then
												
												
												sql5="Select max(QID) From Queue"
												set rs5=conn.execute(sql5,,cmdtext)
										 		if   isnull(rs5(0) )then
													QID=1
												else
													QID=rs5(0)+1
												end if
												rs5.close
												
												Set rs = Server.CreateObject("ADODB.Recordset") 
												rs.Open "Queue",conn,1,3
												rs.addNew

												rs("QID")=QID
												rs("Type")=1
												rs("item")=PRID
												rs.update
												rs.close
												end if	
												
												rsPR.close
										
												'ส่วน insert ตาราง OrderDetail 
												sql="Select * From  Basket  where UserSessionID='"&session.sessionID&"' AND SupplierID="&rsSupplierID("SupplierID")
												Set rsItem = Server.CreateObject("ADODB.Recordset") 
												rsItem.open sql,Conn,1,1
												LineNo=1
												
												
												Do While not rsItem.EOF  'สร้างทีละ Row ในตาราง OrderDetail ของ 1 ใบ PR
		
															sql1="Select max(orderid) from orderDetail"
															set rs1=conn.execute(sql1,,cmdText)
															orderID=rs1(0)+1
															
															
															
															ItemID=rsItem("ItemID")
				
															sql="select * From Catalog Where ItemID="&ItemID
															Set rsCatalog = Server.CreateObject("ADODB.Recordset") 
															rsCatalog.Open sql,Conn,1,3
				
															ItemName=rsCatalog("ItemName")
															Unit=rsCatalog("ItemUnit")
															
															ItemPrice=rsCatalog("ItemPrice")
																							
															
															QTY=rsItem("QTY")
															
															SellerItemID=rsCatalog("SellerItemID")
														
														
															if ShipMethod="Sent" then
																		ShipPrice=rsCatalog("ShipPrice")
																		'response.write ShipMethod
															end if
															
															if ShipMethod="Ems" then
																		ShipPrice=rsCatalog("EmsPrice")
															end if
															
															if ShipMethod="FedEx" then
																		ShipPrice=rsCatalog("FedExPrice")
															end if
															
													
															NeedDate=rsItem("NeedDate")
															
															rsCatalog.close
															
															sql1="Select max(orderID) from OrderDetail"
															set rs1=conn.execute(sql1,,cmdText)
															orderID=rs1(0)+1
															rs1.close
				
															InsertSql="INSERT INTO OrderDetail(OrderID,PRID,ItemID,Line,OrderItemPrice,OrderQTY,OrderSellerItemID,OrderShipPrice)"&_
																				" VALUES ("&OrderID&","&PRID&","&ItemID&","&LineNo&","&ItemPrice&","&QTY&",'"&SellerItemID&"',"&ShipPrice&")"
				
				
															conn.Execute InsertSql,,adCmdText
															
															sql="Select OrderUnit,OrderName,NeedDate From OrderDetail Where OrderID="&orderID
															Set rsOR = Server.CreateObject("ADODB.Recordset") 
															rsOR.Open sql,Conn,1,3
															rsOR(0)=Unit
															rsOR(1)=ItemName
															rsOR(2)=NeedDate
															rsOR.update
															rsOR.close
												
															' Item ใน Basket ที่ลง OrderDetail แล้วให้ลบทิ้ง
															sql ="DELETE FROM  Basket  WHERE BasketID="&rsItem("BasketID")
															conn.execute sql,,adCmdText
				
															LineNo=LineNo+1
															rsItem.movenext
												Loop
	
												rsItem.close
												ii=ii+1%>
<br>

<table width="865" border="0">
  <tr> 
    <td width="128">&nbsp;</td>
    <td width="727"><font face="MS Sans Serif, Microsoft Sans Serif"><b><img src="images/next.gif" width="11" height="11">สร้าง 
      P.R. ID <%=PRID%></b>&nbsp;<b>ส่งไปยัง</b> <b> <%=session("BizName")%></b> 
      &nbsp;<a href="ViewPR.asp?prid=<%=PRID%>" target="_blank"><font size="-1" color="#0000CC">ดูรายละเอียด</font></a></font></td>
  </tr>
</table>
<%
										end if
									
									rsSupplierID.movenext
									
									
									Loop
									
									rsSupplierID.close
									conn.close
									set conn=Nothing%>
<br>
<table width="861" border="0">
  <tr> 
    <td width="130" height="19">&nbsp;</td>
    <td height="19" width="721"> <font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000"><b><font face="MS Sans Serif, Microsoft Sans Serif"><b><img src="images/next.gif" width="11" height="11"></b></font></b></font><font face="MS Sans Serif, Microsoft Sans Serif"><b><img src="images/next.gif" width="11" height="11"></b></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000"><b><font color="#000000">รวมส่ง 
      P.R. ไปทั้งสิ้น <%=ii%>&nbsp;ใบ</font></b></font></td>
  </tr>
</table>
<br>
<br>
<table width="780" border="0">
  <tr> 
    <td width="90" height="19">&nbsp;</td>
    <td height="19"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000"></font></div>
    </td>
  </tr>
</table>
<br>

<%
							else  ' Password ผิด
										conn.close
										set conn=Nothing
										%>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


<table width="927" border="0">
  <tr> 
    <td width="90">&nbsp;</td>
    <td width="827"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000"><b><font size="+2">Password 
        ไม่ถูกต้อง</font></b></font><br>
        <br>
        <a href="CreatePR.asp"><font color="#0000CC" face="MS Sans Serif, Microsoft Sans Serif"><b>กลับไปแก้ไข</b></font></a> 
      </div>
    </td>
  </tr>
</table>
<%
							end if
							
							
					else
						
							if  instruction="Delete" then ' กรณี Delete
							sql ="Delete FROM Basket WHERE BasketID="&request("deleteField")
							conn.Execute sql,,adCmdText
							conn.close
							set conn=Nothing
							response.redirect ("CreatePR.asp")
							
							else 'กรณีเปลี่ยนวิธีการขนส่ง
							
									response.redirect ("CreatePR.asp?Supplier="&request("Supplier")&"&method="&request("Method"))

							end if
							
					end if		
		
		end if

%>
</body>
