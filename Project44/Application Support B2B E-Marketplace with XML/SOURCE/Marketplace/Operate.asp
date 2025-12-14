<%response.Buffer = true ' เพราะจะใช้ Response.redirect%>



<%
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

if request("fOperator")="Delete" then '--------------------------- กรณีลบออกจาก Catalog

		for ii=1 to  request("fRecordCount") 'วน loop  เท่าจำนวนสินค้าเพื่อดูว่าจะลบรายการไหนบ้าง
			
			if  request   ("f"&ii) <>"" then  'ถ้ามีการลบรายการ
					sql ="DELETE FROM Catalog WHERE ItemID="&request("f"&ii)
					conn.execute sql,,adCmdText
			end if
		
		next	
else
		if  request("fOperator")="Off" then  '------------------------ กรณีปิด  Catalog รายการใดๆ ชั่วคราว

					for ii=1 to  request("fRecordCount") 'วน loop  เท่าจำนวนสินค้าเพื่อดูว่าจะลบรายการไหนบ้าง
			
								if  request   ("f"&ii) <>"" then  'ถ้ามีการลบรายการ
										sql ="UPDATE  Catalog SET Stop=1 WHERE ItemID= "& request   ("f"&ii)
										conn.execute sql,,adCmdText
								end if
		
					next	
					
		else   '----------------------------------------------------------------- กรณีเปิด  Catalog รายการใดๆ 
		
							for ii=1 to  request("fRecordCount") 'วน loop  เท่าจำนวนสินค้าเพื่อดูว่าจะลบรายการไหนบ้าง
			
								if  request   ("f"&ii) <>"" then  'ถ้ามีการลบรายการ
										sql ="UPDATE  Catalog SET Stop=0 WHERE ItemID= "& request   ("f"&ii)
										conn.execute sql,,adCmdText
								end if
		
							next	
					
		end if
end if

conn.close
response.redirect("ManageCatalog.asp?category="&request.querystring("category")&"&keyword="&request.querystring("keyword"))%>