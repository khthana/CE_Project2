<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" -->
<% '  เป็นส่วนของ link ต่าง ๆ ด้านซ้ายมือ		%>
<!--#INCLUDE FILE = "main.htm" -->
<HTML>
    <TITLE><%= displayName %> : List </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>
<% '	เป็นส่วนของการแสดงผลข้อมูลที่ได้จากการค้นหา	%>
<TABLE BORDER="0" WIDTH="80%" ALIGN="center" >
			<TD  VALIGN=TOP >
			<TABLE WIDTH="100%" BORDER="0">
			<TR>
			<TD BGCOLOR="#6699CC">
			<H1><P ALIGN=CENTER>Search</P></H1>
			<H3>&nbsp Select home from the list below</H3>
			</TD>
			</TR>
			</TABLE>
<%'------------------xxxxxx---------- เป็นการรับค่าจากตัวแปรจาก select box ของ search.asp ----------------------%>
				<%	
				deptFindSpec = mscsPage.RequestNumber("dept") 
				modelFindSpec = mscsPage.RequestString("model")
				areaFindSpec = mscsPage.RequestString("area_num")
				bedFindSpec = mscsPage.RequestString("bedroom")
				bathFindSpec = mscsPage.RequestString("bathroom")
				priceFindSpec = mscsPage.RequestString("price")
								
				%>
<%'------------------------------xxxxxx---------------------- เป็นการค้นหาข้อมูลโดยใช้ SQL  ---------------------------------------------------------------%>
				<%
				sqlText = ( "SELECT prod.name , prod.image_file , prod.pf_id , prod.area , prod.bedroom , prod.bathroom , prod.model , prod.description , prod.list_price , d.dept_name , d.dept_id FROM tranika_product prod, tranika_dept_prod dept  , tranika_dept d WHERE   prod.pf_id = dept.pf_id  AND dept.dept_id  :1 AND dept.dept_id = d.dept_id   AND prod.model : 2 AND prod.area : 3  AND prod.bedroom : 4 AND prod.bathroom : 5  AND prod.list_price : 6 "  )
				
				 '----------------------xxxxxx----		ส่วนของการตรวจสอบว่า ข้อมูลมีการระบุหรือไม่	 	 ----------------------------------------
				'	ส่วนของการเลือกทำเล
				if deptFindSpec = "0" then
					sqlText = Replace(sqlText , " :1" , "<>" & deptFindSpec)
				else
					sqlText = Replace(sqlText," :1", "=" & deptFindSpec)
				end if
				'  ส่วนของการเลือกประเภทบ้าน
				if modelFindSpec = "0" then
					sqlText = Replace(sqlText , " : 2 " , "<>"& "'"&modelFindSpec& "'")	
				else
					sqlText = Replace(sqlText , " : 2 " ,  "=" & "'"&modelFindSpec&"'"  )
				end if
				'	ส่วนของการเลือกเนื้อที่บ้าน
				Select Case areaFindSpec
						Case  0 
									sqlText = Replace(sqlText , " : 3 " , " <> 0 " )
						Case 1  
									sqlText = Replace(sqlText , " : 3 " , " < 60 " )
						Case 2
									sqlText = Replace(sqlText , " : 3 " , " BETWEEN 60 AND 80  " )
						Case 3
									sqlText = Replace(sqlText , " : 3 " , " BETWEEN 80 AND 100 " )
						Case 4
									sqlText = Replace(sqlText , " : 3 " , " > 100 " )
				End Select
				'	ส่วนของการเลือกห้องนอน
				if bedFindSpec = "0" then
					sqlText = Replace(sqlText , " : 4" , "<>" & bedFindSpec)
				else
					sqlText = Replace(sqlText," : 4", "=" & bedFindSpec)
				end if
				'	ส่วนของการเลือกห้องน้ำ
				if bathFindSpec = "0" then
					sqlText = Replace(sqlText , " : 5" , "<>" & bathFindSpec)
				else
					sqlText = Replace(sqlText," : 5", "=" & bathFindSpec)
				end if
				'	ส่วนของการเลือกงบประมาณ
				Select Case priceFindSpec
						Case  0 
									sqlText = Replace(sqlText , " : 6 " , " <> 0 " )
						Case 1  
									sqlText = Replace(sqlText , " : 6 " , " < 100000000 " )
						Case 2
									sqlText = Replace(sqlText , " : 6 " , " BETWEEN 100000000 AND 200000000  " )
						Case 3
									sqlText = Replace(sqlText , " : 6 " , " BETWEEN 200000000 AND 300000000 " )
						Case 4
									sqlText = Replace(sqlText , " : 6 " , " > 300000000 " )
				End Select				
				' --------------------------------------------------------  
				cmdTemp.CommandText = sqlText
		        Set rsProductsFindSpec = Server.CreateObject("ADODB.Recordset")
				rsProductsFindSpec.Open cmdTemp, , adOpenStatic, adLockReadOnly
				%>
<% ' -------------xxxxxx -----------------------  เป็นการดึงข้อมูลมาจากฐานข้อมูลมาเก็บไว้ในตัวแปร	-------------------------- %>
				<%
				set deptField = rsProductsFindSpec("dept_id")
				set nameField = rsProductsFindSpec("name")
				set imageField = rsProductsFindSpec("image_file")
				set pf_idField = rsProductsFindSpec("pf_id")
				set deptName = rsProductsFindSpec("dept_name")
				set areaField = rsProductsFindSpec("area")
				set bedField = rsProductsFindSpec("bedroom")
				set bathField = rsProductsFindSpec("bathroom")
				set modelField = rsProductsFindSpec("model")
				set descriptField = rsProductsFindSpec("description")
				set priceField = rsProductsFindSpec("list_price")
				%>
				<TABLE WIDTH="100%" BORDER="0" >
				<%				do while Not rsProductsFindSpec.EOF				%>	<% ' เป็นส่วนของการวนลูปเพื่อแสดงข้อมูล		%>
				<TR>
						<TD WIDTH=150  ALIGN="CENTER" BGCOLOR="#99CCFF" >
						<A HREF="<%= baseURL("product.asp") & mscsPage.URLShopperArgs("dept_id" , deptField.value , "pf_id", pf_idField.value) %>">
						<IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(imageField) %>"
						WIDTH="128"
						HEIGHT="128">		</A>	
					</TD>
					<TD WIDTH=200  BGCOLOR="#99CCFF">
					<H6>
						<P ALIGN = CENTER BGCOLOR="#99CCFF">Plan : <% = mscsPage.HTMLEncode(deptName.value) %></P><% ' เป็นส่วนของชื่อโครงการ  %>
						&nbsp <% = mscsPage.HTMLEncode(nameField.value) %><% ' เป็นส่วนของชื่อบ้าน	 %>&nbsp
						Home have <% =mscsPage.HTMLEncode(modelField.value)%><% ' รูปแบบบ้าน  %>&nbsp
						and  &nbsp<% = mscsPage.HTMLEncode(areaField.value) %><% ' เป็นส่วนของเนื้อที่บ้าน  %>&nbsp &nbsp land of home<BR>
						&nbsp &nbsp<% = mscsPage.HTMLEncode(bedField.value) %><% ' เป็นส่วนของจำนวนห้องนอน  %>&nbsp  bedroom &nbsp 
						<% = mscsPage.HTMLEncode(bathField.value )%><% ' เป็นส่วนของจำนวนห้องน้ำ  %>&nbsp &nbsp bathroom &nbsp
						<% = mscsPage.HTMLEncode(descriptField.value)%><% ' เป็นส่วนของรายละเอียด  %><BR>
						<P ALIGN=center>price &nbsp<% = MSCSDataFunctions.Money(priceField.value)%>&nbsp Bath</P><% ' เป็นส่วนของราคา  %>
					</H6><BR><BR>
					</TD>
					<%			rsProductsFindSpec.MoveNext
					IF NOT rsProductsFindSpec.EOF THEN
					%>
<% '  -------------------------	 ส่วนที่สอง --------------------------------------	%>
					<TD WIDTH=150  ALIGN="RIGHT" BGCOLOR="#99CCFF">
						<A HREF="<%= baseURL("product.asp") & mscsPage.URLShopperArgs("dept_id" , deptField.value, "pf_id", pf_idField.value) %>">
						<IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(imageField) %>"
						WIDTH="128"
						HEIGHT="128">		</A>	<% ' เป็นส่วนของรูปบ้าน  %>
					</TD>
					<TD WIDTH=200 BGCOLOR="#99CCFF">
					<H6>
						<P ALIGN = CENTER >Plan : <% = mscsPage.HTMLEncode(deptName.value) %></P><% ' เป็นส่วนของชื่อโครงการ  %>
						&nbsp <% = mscsPage.HTMLEncode(nameField.value) %><% ' เป็นส่วนของชื่อบ้าน	 %>&nbsp
						Home have <% =mscsPage.HTMLEncode(modelField.value)%><% ' รูปแบบบ้าน  %>&nbsp
						and &nbsp &nbsp<% = mscsPage.HTMLEncode(areaField.value) %><% ' เป็นส่วนของเนื้อที่บ้าน  %>&nbsp  land of home<BR>
						&nbsp <% = mscsPage.HTMLEncode(bedField.value) %><% ' เป็นส่วนของจำนวนห้องนอน  %>&nbsp bedroom &nbsp 
						&nbsp <% = mscsPage.HTMLEncode(bathField.value )%><% ' เป็นส่วนของจำนวนห้องน้ำ  %>&nbsp bathroom &nbsp
						<% = mscsPage.HTMLEncode(descriptField.value)%><% ' เป็นส่วนของรายละเอียด  %><BR>
						<P ALIGN=center>price &nbsp<% = MSCSDataFunctions.Money(priceField.value)%>&nbsp Bath</P><% ' เป็นส่วนของราคา  %>
					</H6><BR><BR>
					</TD>
			</TR>

				<%				rsProductsFindSpec.MoveNext	 		%>
				<%	End IF
				Loop	    		
									rsProductsFindSpec.Close					%>
				
				
			</TD>
		</TR>
		</TABLE>
<% ' -------------------------------------------------------------------------------------------- %>
</body>
</html>