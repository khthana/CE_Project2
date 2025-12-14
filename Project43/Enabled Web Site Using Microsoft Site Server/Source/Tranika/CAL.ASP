<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>

<!--#INCLUDE FILE="i_shop.asp" --> 

<%
    pf_id = mscsPage.RequestString("pf_id")
	quoted_pf_id = "'" & Replace(pf_id,"'","''") & "'"     
	REM - add quotes

    REM -- retrieve product:
	sqlText = MSCSQueryMap.product_by_id.SQLCommand
    sqlText = Replace(sqlText, ":1", quoted_pf_id)
    sqlText = Replace(sqlText, ":2", Request("dept_id"))
    cmdTemp.CommandText = sqlText
    Set rsProduct = Server.CreateObject("ADODB.Recordset")
    rsProduct.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
    
    if rsProduct.EOF then
        product_exists = false
    else
        product_exists = true

        REM -- get fields from recordset
        name = rsProduct("name").value
		description = rsProduct("description").value
        dept_name = rsProduct("dept_name").value
		model = rsProduct("model").value
		area = rsProduct("area").value
		body = rsProduct("body").value
		bedroom = rsProduct("bedroom").value
		bathroom = rsProduct("bathroom").value
        list_price = rsProduct("list_price").value
        image_file = rsProduct("image_file").value
        image_first = rsProduct("image_first").value
        image_second = rsProduct("image_second").value
        
        rsProduct.Close

        REM -- Log department and product for UA
        Response.AppendToLog "&" & mscsPage.URLArgs("MSS.Request.Category Name", dept_name, "MSS.Request.SKU", pf_id, "MSS.Request.Product Name", name)
        
    end if
%>

		<%		'	ส่วนของคำสั่ง sql ในการ ดึงราคาของบ้านและอุปกรณ์มาทำการคำนวณ
					sqlText = " SELECT ad.door_price, ad2.door2_price , af.floor_price , at.toilet_price  FROM tranika_attr_door ad , tranika_attr_door2 ad2, tranika_attr_toilet  at, tranika_attr_floor af   WHERE ad.door_id = : 1 AND af.floor_id = : 2 AND at.toilet_id = : 3 AND ad2.door2_id = : 4 "
					sqlText = Replace(sqlText ," : 1 " , Request("door_id"))
					sqlText = Replace(sqlText ," : 2 ", Request("floor_id"))
					sqlText = Replace(sqlText ," : 3 ", Request("toilet_id"))
					sqlText = Replace(sqlText ," : 4 " , Request("door2_id"))
					cmdTemp.CommandText = sqlText
					Set rsAttr = Server.CreateObject("ADODB.Recordset")
					rsAttr.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
					set doorFieldPrice = rsAttr("door_price")
					set door2FieldPrice = rsAttr("door2_price")
					set floorFieldPrice = rsAttr("floor_price")
					set toiletFieldPrice = rsAttr("toilet_price")
					home_price = Clng(MSCSDataFunctions.Money(list_price) )
					door_price = Clng(MSCSDataFunctions.Money(doorFieldPrice))
					door2_price = Clng(MSCSDataFunctions.Money(door2FieldPrice))
					floor_price = Clng(MSCSDataFunctions.Money(floorFieldPrice))
					toilet_price = Clng(MSCSDataFunctions.Money(toiletFieldPrice))
					door_x =Request("door_x")
					door2_x = Request("door2_x")
					floor_x = Request("floor_x")
					toilet_x = Request("toilet_x")
					dept_id = Request("dept_id")
					door_id = Request("door_id")
					door2_id = Request("door2_id")
					floor_id = Request("floor_id")
					toilet_id = Request("toilet_id")
					slacken_year = Request("slacken_year")	
					%>
<HTML>
<HEAD>
    <TITLE><%= displayName %>: Product<% if product_exists then %>: '<%= mscsPage.HTMLEncode(name) %>'<% end if %></TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>

<BODY BACKGROUND="<%' = Application("background") %>"  TEXT= "#000000" LINK= "#FF0000" VLINK= "#FF0000" ALINK=  "#FF0000" >

<% '  เป็นส่วนของ link ต่าง ๆ ด้านบน		%>
<!--#INCLUDE FILE = "main.htm" -->

<% ' เป็นส่วนของ รายละเอียดด้านล่าง	%> 	
<BR>
<TABLE WIDTH="80%" ALIGN="center" BORDER="0">
<TR>
			<TD WIDTH=750 >
			<TABLE  BORDER="0" WIDTH="100%"  >
			<TR>
			<TD WIDTH=10> &nbsp </TD>
			<TD WIDTH=250 VALIGN=TOP >	

<% if Request("error").Count <> 0 then %>
    <FONT COLOR="#FF0000">We're sorry, but this home is not currently available with the attributes you selected.</FONT>
<% end if %>

<% if not product_exists then %>
    <P>The home you requested is currently not available.
<% else %>
	<%
		
		' คำนวณ ราคารวม
		total =  (home_price  ) + (door_price ) - ( door_x/100  ) + (door2_price * bedroom  ) - ( door2_x/100  ) + (toilet_price * bathroom ) - ( toilet_x  /100) + ( floor_price * body ) - ( floor_x  /100)
		total_price = (total *100)
		' คำนวณอัตราการผ่อนชำระ		
		Select Case slacken_year
						Case 1 
									bank = 0.0886150
						Case 2 
									bank = 0.0468402 
						Case 3
									bank = 0.0329759
						Case 4
									bank = 0.0260890
						Case 5
									bank = 0.0219926
						Case 6
									bank = 0.0192911
						Case 7
									bank = 0.0173864
						Case 8
									bank = 0.0159793
						Case 9
									bank = 0.0149036 
						Case 10
									bank = 0.0140535
						Case 11
									bank = 0.0133835
						Case 12
									bank = 0.0128331
						Case 13
									bank = 0.0123791
						Case 14
									bank = 0.0120005
						Case 15
									bank = 0.0116818
						Case 16
									bank = 0.0114116
						Case 17
									bank = 0.0111809
						Case 18
								bank = 0.0109829
						Case 19
									bank = 0.0108121
						Case 20
									bank = 0.0106642
				End Select
		   	
		reserve = (2000000)		'	วันจอง
		first_contract = ( (total_price \ 100 ) *  6  )	' ทำสัญญาครั้งแรก
		slacken = ( (total_price \100 ) *  8 )		' ผ่อนดาวน์
		transfer	= ( (total_price \ 100  ) *  6)		' ก่อนโอน
		save_money = ( total_price - (first_contract + slacken + transfer + reserve ) )		' ยอดเงินกู้
		slacken_bank = ( save_money * bank  )  	' ผ่อนกับธนาคาร
		multi_slacken = ( first_contract + slacken + transfer + reserve )	'	รวมยอดเงินดาวน์
	%>

	<BR>
        <FONT SIZE="4"><P ALIGN=CENTER><B>Plan : <% = mscsPage.HTMLEncode(dept_name) %></B></P></FONT>
		<FONT SIZE="3"><B><%= mscsPage.HTMLEncode(name) %></B></FONT><FONT SIZE="2"><% ' ชื่อบ้าน	 %>&nbsp
		Home have &nbsp<% = mscsPage.HTMLEncode(model) %>&nbsp
		and &nbsp <% = mscsPage.HTMLEncode(area) %>&nbsp land of home<BR>
		<% = mscsPage.HTMLEncode(bedroom) %>&nbsp bedroom	 &nbsp
		<% = mscsPage.HTMLEncode(bathroom)	%>&nbsp bathroom &nbsp
		<%= mscsPage.HTMLEncode(description) %><BR>
		</FONT>
		
        <% if on_sale then %>
        <P><FONT SIZE="4"><B>ON SALE! <%= MSCSDataFunctions.Money(sale_price) %></B></FONT>
        <P>Regular Price: <%= MSCSDataFunctions.Money(list_price) %>
        <% else %>
        <P ALIGN=CENTER><FONT SIZE="2"><B>price&nbsp<%=MSCSDataFunctions.Money(total_price)%>&nbsp Bath</B></P></FONT><% ' ราคาบ้าน %>
        <% end if %>
        

		</TD>
		<TD>	</TD>
<%	'		ส่วนของการแสดงรูปบ้าน	 %>
		<TD WIDTH="43%" ALIGN=CENTER VALIGN="MIDDLE" >
		<% if not IsNull(image_file) then %>
            <IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(image_file) %>"
                 WIDTH="350"
                 HEIGHT="300">
        <% else %>
            Image not available
        <% end if %>

	</TD>
</TR>
<%	'	ส่วนของการแสดงภาพแปลนชั้น 1	%>
<TR>
	<TD	WIDTH=300	COLSPAN="2" ALIGN=CENTER>
		<% if not IsNull(image_file) then %>
			<BR>
            <IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(image_first) %>"
                 WIDTH="300"
                 HEIGHT="200"><P ALIGN=CENTER>1'ST</P>
        <% else %>
            Image not available
        <% end if %>
	</TD>
<%	'	ส่วนของการแสดงภาพแปลนชั้น 2	%>
	<TD WIDTH="50%"  COLSPAN="2" ALIGN=CENTER>	
	<% if image_second <> "0" then %>
	<BR>&nbsp &nbsp
	<% if not IsNull(image_second) then %>
	         <IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(image_second) %>"
                 WIDTH="300"
                 HEIGHT="200"><P ALIGN=CENTER>2'ND</P>
		<%End if	%>
        <% else %>
           <%	'	ไม่มีรูปภาพ	 %> 
        <% end if %>
	</TD>
</TR>
</TABLE>
<BR>
<HR>
<%	'	---------------------------------------	ส่วนของการเลือกอุปกรณ์ต่าง ๆ -----------------------------------------------	%>

<TABLE    WIDTH="100%"   BORDER="0" CELLPADDING="0" CELLSPACING="0" >
	<TR>
	
	<%  '	ส่วนของการแสดงภาพของประตูบ้านที่มีอยู่ในรายการ	%>			<BR>
		<%
		sqlText = ("SELECT door_value , door_file FROM tranika_attr_door WHERE door_id = : 1 ")
		sqlText = Replace(sqlText , " : 1 " , Request("door_id"))
		cmdTemp.CommandText = sqlText
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set door_valueField = rsAttrValues("door_value")
		set door_FileField	= rsAttrValues("door_file")
		%>
							<TD WIDTH="10%" ALIGN=CENTER VALIGN=TOP > Home door  :<% = door_valueField.value %> &nbsp
							<IMG WIDTH="80" HEIGHT="100" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door_FileField.value %>">
		<%		rsAttrValues.Close	%>
				</TD>

		<%  '	ส่วนของการแสดงภาพของประตูห้องนอนที่มีอยู่ในรายการ	%>			<BR>
		<%
		sqlText = ("SELECT door2_value , door2_file FROM tranika_attr_door2 WHERE door2_id = : 1 ")
		sqlText = Replace(sqlText , " : 1 " , Request("door2_id"))
		cmdTemp.CommandText = sqlText
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set door2_valueField = rsAttrValues("door2_value")
		set door2_FileField	= rsAttrValues("door2_file")
		%>
							<TD WIDTH="10%" ALIGN=CENTER VALIGN=TOP > Room door  :<% = door2_valueField.value %> &nbsp
							<IMG WIDTH="60" HEIGHT="100" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door2_FileField.value %>">
		<%		rsAttrValues.Close	%>
				</TD>

	<% '	ส่วนของการแสดงภาพของสุขภัณฑ์ที่มีอยู่ในรายการ	%>	
		<%
        sqlText = ("SELECT toilet_value , toilet_file FROM tranika_attr_toilet WHERE toilet_id = : 1 ")
		sqlText = Replace(sqlText , " : 1 " , Request("toilet_id"))
		cmdTemp.CommandText = sqlText
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set toilet_valueField = rsAttrValues("toilet_value")
		set toilet_FileField	= rsAttrValues("toilet_file")
		%>
								<TD WIDTH="10%"  ALIGN=CENTER VALIGN=TOP > Toilet  :<% = toilet_valueField.value %>&nbsp
								<IMG WIDTH="100" HEIGHT="100" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = toilet_FileField.value %>">
		<%		rsAttrValues.Close	%>
		</TD>

	<% '	ส่วนของการแสดงภาพของพื้นที่มีอยู่ในรายการ	%>	
		<%
		sqlText = ("SELECT floor_value , floor_file FROM tranika_attr_floor  WHERE floor_id = : 1 ")
		sqlText = Replace(sqlText , " : 1 " , Request("floor_id"))
		cmdTemp.CommandText = sqlText
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set floor_valueField = rsAttrValues("floor_value")
	    set floor_FileField = rsAttrValues("floor_file")
        %>
						<TD WIDTH="10%"  ALIGN=CENTER VALIGN=TOP  > Tile  :<% = floor_valueField.value %>&nbsp
						<IMG WIDTH="100" HEIGHT="100" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = floor_FileField.value %>">
		<%		rsAttrValues.Close	%>
        </TD>
	</TR>		
	<TR><TD COLSPAN="4"><BR><HR><BR></TD></TR>
	<TR>
			<TD>

			<FORM METHOD=POST ACTION="cal.asp">
					<SELECT NAME="slacken_year">
																				<OPTION VALUE=" 1 ">&nbsp	1	year	&nbsp
																				<OPTION VALUE=" 2 ">&nbsp	2	year	&nbsp
																				<OPTION VALUE=" 3 ">&nbsp	3	year	&nbsp
																				<OPTION VALUE=" 4 ">&nbsp	4	year	&nbsp
																				<OPTION VALUE=" 5 ">&nbsp	5	year	&nbsp
																				<OPTION VALUE=" 6 ">&nbsp	6	year	&nbsp
																				<OPTION VALUE=" 7 ">&nbsp	7	year	&nbsp
																				<OPTION VALUE=" 8 ">&nbsp	8	year	&nbsp
																				<OPTION VALUE=" 9 ">&nbsp	9	year	&nbsp
																				<OPTION VALUE=" 10 ">&nbsp	10	 year	&nbsp
																				<OPTION VALUE=" 11 ">&nbsp	11	 year	&nbsp
																				<OPTION VALUE=" 12 ">&nbsp	12	 year	&nbsp
																				<OPTION VALUE=" 13 ">&nbsp	13	 year	&nbsp
																				<OPTION VALUE=" 14 ">&nbsp	14	 year	&nbsp
																				<OPTION VALUE=" 15 ">&nbsp	15	 year	&nbsp
																				<OPTION VALUE=" 16 ">&nbsp	16	 year	&nbsp
																				<OPTION VALUE=" 17 ">&nbsp	17	 year	&nbsp
																				<OPTION VALUE=" 18 ">&nbsp	18	 year	&nbsp
																				<OPTION VALUE=" 19 ">&nbsp	19	 year	&nbsp
																				<OPTION VALUE=" 20 ">&nbsp	20	 year	&nbsp
													</SELECT>	
								<INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<%= Request("pf_id") %>">
							    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id") %>">
								<INPUT TYPE="HIDDEN" NAME="door_id" VALUE="<%= Request("door_id") %>">
								<INPUT TYPE="HIDDEN" NAME="door2_id" VALUE="<%= Request("door2_id") %>">
								<INPUT TYPE="HIDDEN" NAME="toilet_id" VALUE="<%= Request("toilet_id") %>">
								<INPUT TYPE="HIDDEN" NAME="floor_id" VALUE="<%= Request("floor_id") %>">
								<INPUT TYPE= SUBMIT  VALUE=" year ">
			</FORM>
			</TD>
	</TR>
	<TR>
			<TABLE BORDER="1" WIDTH="100%">
			<TR>	&nbsp </TR>
			<TR>
					<TD WIDTH="30%" BGCOLOR="#6699CC">ราคา</TD><TD BGCOLOR="#99CCFF">	&nbsp <%=MSCSDataFunctions.Money(total_price)%> Bath </TD>
			</TR>
			<TR>
					<TD WIDTH="30%" BGCOLOR="#6699CC">รวมยอดเงินดาวน์</TD><TD BGCOLOR="#99CCFF">	&nbsp <%=MSCSDataFunctions.Money(multi_slacken)%> Bath</TD> 
			</TR>
			<TR>			
					<TD WIDTH="30%" BGCOLOR="#6699CC">วันจอง</TD><TD BGCOLOR="#99CCFF">	&nbsp <% = MSCSDataFunctions.Money(reserve) %> Bath</TD>
			</TR>
			<TR>			
					<TD WIDTH="30%" BGCOLOR="#6699CC">ทำสัญญาครั้งแรก</TD><TD BGCOLOR="#99CCFF">	&nbsp <%= MSCSDataFunctions.Money(first_contract)%> Bath</TD>
			</TR>
			<TR>			
					<TD WIDTH="30%" BGCOLOR="#6699CC">ผ่อนดาวน์ 10 งวด</TD><TD BGCOLOR="#99CCFF">	&nbsp <%= MSCSDataFunctions.Money(slacken)%> Bath </TD>
			</TR>
			<TR>			
					<TD WIDTH="30%" BGCOLOR="#6699CC">ตัดยอดก่อนโอนกรรมสิทธิ์</TD><TD BGCOLOR="#99CCFF">	&nbsp  <%= MSCSDataFunctions.Money(transfer)%> Bath</TD>
			</TR>
			<TR>			
					<TD WIDTH="30%" BGCOLOR="#6699CC">ยอดเงินกู้</TD><TD BGCOLOR="#99CCFF">	&nbsp  <%= MSCSDataFunctions.Money(save_money)%> Bath</TD>
			</TR>
			<TR>			
					<TD WIDTH="30%" BGCOLOR="#6699CC">ผ่อนกับธนาคาร <%= slacken_year * 12 %> เดือน  เดือนละ</TD><TD BGCOLOR="#99CCFF">	&nbsp  <%= MSCSDataFunctions.Money(slacken_bank)%> Bath</TD>
			</TR>
	</TABLE>
			<TR>
					<TD COLSPAN="2" ALIGN=CENTER>
					<TABLE BORDER="0" WIDTH="100%">
					<TR>
					<TD ALIGN="RIGHT" WIDTH="50%">
					<FORM	METHOD="POST" ACTION="product.asp"> 
					<BR>
								<INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<%= Request("pf_id") %>">
							    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id") %>">
								<INPUT TYPE="HIDDEN" NAME="door_id" VALUE="<%= Request("door_id") %>">
								<INPUT TYPE="HIDDEN" NAME="door2_id" VALUE="<%= Request("door2_id") %>">
								<INPUT TYPE="HIDDEN" NAME="toilet_id" VALUE="<%= Request("toilet_id") %>">
								<INPUT TYPE="HIDDEN" NAME="floor_id" VALUE="<%= Request("floor_id") %>">
								<INPUT TYPE= SUBMIT  VALUE=" new calculate ">
				
					</FORM>
					<TD WIDTH="10%">	&nbsp	</TD>
					</TD>
					<TD ALIGN="LEFT">
					<FORM	METHOD=POST ACTION="select_zone.asp"> 
					<BR>
								<INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<%= Request("pf_id") %>">
							    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id") %>">
								<INPUT TYPE="HIDDEN" NAME="door_id" VALUE="<%= Request("door_id") %>">
								<INPUT TYPE="HIDDEN" NAME="door2_id" VALUE="<%= Request("door2_id") %>">
								<INPUT TYPE="HIDDEN" NAME="toilet_id" VALUE="<%= Request("toilet_id") %>">
								<INPUT TYPE="HIDDEN" NAME="floor_id" VALUE="<%= Request("floor_id") %>">
								<INPUT TYPE="HIDDEN" NAME="price" VALUE="<%= total_price %>">
								<INPUT TYPE= SUBMIT  VALUE=" reserve ">
				
					</FORM>
					</TD>
		</TR>
		</TABLE>
</TR>
</TR>
</TD>
</TR>
</TABLE>
<% end if %>
			</TD>
		</TR>
</TABLE>
</BODY>
</HTML>