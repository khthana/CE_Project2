<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" --> 
<%
    pf_id = mscsPage.RequestString("pf_id")
    quoted_pf_id = "'" & Replace(pf_id,"'","''") & "'"    
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
		pf_id_ = rsProduct("pf_id").value
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
		pf_id = pf_id
        rsProduct.Close
        REM -- Log department and product for UA
        Response.AppendToLog "&" & mscsPage.URLArgs("MSS.Request.Category Name", dept_name, "MSS.Request.SKU", pf_id, "MSS.Request.Product Name", name)
    end if
'	--------------------------------	เก็บสถิติของแบบบ้าน ----------------------------------------------
		sqlText = ("SELECT pf_chart  FROM tranika_product WHERE pf_id = : 1 ")
		sqlText = Replace(sqlText ," : 1 ", "'"&pf_id&"'")
		cmdTemp.CommandText = sqlText
		Set rsChart = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsChart.Open cmdTemp, , adOpenStatic, adLockOptimistic

		set pf_chart = rsChart("pf_chart")
		pf_chart = pf_chart
		if isnull(pf_chart) then
			pf_chart = 1
		else
			pf_chart = pf_chart + 1
		End if
		
		Response.Write price_chart
		rsChart("pf_chart").value = pf_chart
		rsChart.Update
		rsChart.Close
'	---------------------------------------------------------------------------------------------------------------
%>
<HTML>
<HEAD>
    <TITLE><%= displayName %> : Home <% if product_exists then %>: '<%= mscsPage.HTMLEncode(name) %>'<% end if %></TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>
<% '  เป็นส่วนของ link ต่าง ๆ ด้านบน		%>
<!--#INCLUDE FILE = "main.htm" -->
<% ' ---------------------------------------	เป็นส่วนของ รายละเอียดด้านล่าง	----------------------------------------------	%> 	
<TABLE WIDTH="80%" BORDER="0" ALIGN="center">
<TR>
<BR>
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
<FORM METHOD=POST ACTION="cal.asp">
    <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<%= mscsPage.HTMLEncode(pf_id) %>">
    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id") %>">
	<BR>
        <FONT SIZE="4"><P ALIGN=CENTER><B>Plan : <% = mscsPage.HTMLEncode(dept_name) %></B></P></FONT>
		<FONT SIZE="3"><B><%= mscsPage.HTMLEncode(name) %></B></FONT><% ' ชื่อบ้าน	 %>&nbsp
		Home have &nbsp<% = mscsPage.HTMLEncode(model) %><FONT SIZE="2">&nbsp
		and &nbsp <% = mscsPage.HTMLEncode(area) %>&nbsp land of home<BR>
		<% = mscsPage.HTMLEncode(bedroom) %>&nbsp bedroom	 &nbsp
		<% = mscsPage.HTMLEncode(bathroom)	%>&nbsp bathroom &nbsp
		<%= mscsPage.HTMLEncode(description) %><BR>
		</FONT>

		<% if on_sale then %>
        <P><FONT SIZE="4"><B>ON SALE! <%= MSCSDataFunctions.Money(sale_price) %></B></FONT>
        <P>Regular Price: <%= MSCSDataFunctions.Money(list_price) %>
        <% else %>
        <P ALIGN=CENTER><FONT SIZE="2"><B>price&nbsp<%= MSCSDataFunctions.Money(list_price) %>&nbsp Bath</B></P></FONT><% ' ราคาบ้าน %>
        <% end if %>
		</TD>
<%	' -----------------------------------		ส่วนของการแสดงรูปบ้าน	----------------------------------- %>
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
<%	' ---------------------------------		ส่วนของการแสดงภาพแปลนชั้น 1	--------------------------%>
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
<%	' --------------------------------------------	ส่วนของการแสดงภาพแปลนชั้น 2 --------------------------------------	%>
	<TD WIDTH="50%" 	COLSPAN="2">	
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
	<%  '	ส่วนของการแสดงตัวเลือกของสุขภัณฑ์		%>
	<TR><TD WIDTH="100%" COLSPAN="3"  >&nbsp <%	'		เป็นการเว้นช่องว่างระหว่างบรรทัด		%>	</TD></TR>
	<TR>
		<TD WIDTH="20%" ALIGN=RIGHT  VALIGN="MIDDLE" BGCOLOR="#6699CC">		Home door  : </TD>
		<TD WIDTH="2%" BGCOLOR="#6699CC">	 	</TD>
        <TD WIDTH="15%"  VALIGN=MIDDLE BGCOLOR="#6699CC">
        <SELECT NAME="door_id">
<%   
		cmdTemp.CommandText = Replace(MSCSQueryMap.door_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set door_idField = rsAttrValues("door_id")
        set door_valueField = rsAttrValues("door_value")
        set door_FileField = rsAttrValues("door_file")
		set door_price= rsAttrValues("door_price")
		door_FileField = door_FileField
		Response.Write door_FileField
		door_x = mscsPage.HTMLEncode(door_price)
		do while Not rsAttrValues.EOF %>
          			<OPTION VALUE="<% = door_idField.value %>">&nbsp &nbsp<%= door_valueField.value %>&nbsp &nbsp
				    <% rsAttrValues.MoveNext		
					loop
					 rsAttrValues.Close        	%>
		</SELECT>
		</TD>
<% ' -----------------------------------	เป็นส่วนของการแสดงภาพของประตูที่มีอยู่ในรายการ ------------------------------------	%>
		<TD WIDTH="100%" BGCOLOR="#99CCFF">
		<TABLE WIDTH="100%" BORDER="0" HEIGHT=80>
		<TR>
		<%
		cmdTemp.CommandText = Replace(MSCSQueryMap.door_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set door_valueField = rsAttrValues("door_value")
        set door_FileField = rsAttrValues("door_file")
		do while Not rsAttrValues.EOF %>
		<TD WIDTH=30  ALIGN=LEFT  VALIGN=TOP>
						<IMG WIDTH="60" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door_FileField.value %>">&nbsp<% = door_valueField.value %>
		<%	rsAttrValues.MoveNext	%>
		</TD>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT  VALIGN=TOP >
						<IMG WIDTH="60" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door_FileField.value %>">&nbsp<% = door_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<%	End if	%>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT  VALIGN=TOP>
						<IMG WIDTH="60" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door_FileField.value %>">&nbsp<% = door_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<TR HEIGHT=10>	</TR>
		</TR>
		<%		End if
		Loop	
		rsAttrValues.Close	%>
	</TABLE>
	</TD>
</TR>
<TR><TD WIDTH="100%" COLSPAN="3"  >&nbsp <%	'		เป็นการเว้นช่องว่างระหว่างบรรทัด		%>	</TD></TR>
	<TR>
		<TD WIDTH="20%" ALIGN=RIGHT  VALIGN=MIDDLE BGCOLOR="#6699CC">		Room door  : </TD>
		<TD WIDTH="2%" BGCOLOR="#6699CC">	 	</TD>
        <TD WIDTH="15%"   VALIGN=MIDDLE BGCOLOR="#6699CC">
        <SELECT NAME="door2_id">
        <%
        cmdTemp.CommandText = Replace(MSCSQueryMap.door2_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set door2_idField = rsAttrValues("door2_id")
        set door2_valueField = rsAttrValues("door2_value")
        set door2_FileField = rsAttrValues("door2_file")
		set door2_price= rsAttrValues("door2_price")
		door2_x = mscsPage.HTMLEncode(door2_price)
		do while Not rsAttrValues.EOF %>
          			<OPTION VALUE="<% = door2_idField.value %>">&nbsp &nbsp<%= door2_valueField.value %>&nbsp &nbsp
				    <% rsAttrValues.MoveNext		
					loop
					 rsAttrValues.Close        	%>
		</SELECT>
		</TD>
<% ' ------------------------------------	เป็นส่วนของการแสดงภาพของประตูห้องนอนที่มีอยู่ในรายการ -----------------------------	%>
		<TD WIDTH="100%"  BGCOLOR="#99CCFF">
		<TABLE WIDTH="100%" BORDER="0" HEIGHT=80>
		<TR>
		<%
		cmdTemp.CommandText = Replace(MSCSQueryMap.door2_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set door2_valueField = rsAttrValues("door2_value")
        set door2_FileField = rsAttrValues("door2_file")
		do while Not rsAttrValues.EOF %>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="45" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door2_FileField.value %>">&nbsp<% = door2_valueField.value %>
		<%	rsAttrValues.MoveNext	%>
		</TD>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="45" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door2_FileField.value %>">&nbsp<% = door2_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<%	End if	%>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="45" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = door2_FileField.value %>">&nbsp<% = door2_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<TR HEIGHT=10>	</TR>
		</TR>
		<%		End if
		Loop	
		rsAttrValues.Close	%>
	</TABLE>
	</TD>
</TR>
	<TR><TD WIDTH="100%" COLSPAN="3"  >&nbsp <%	'		เป็นการเว้นช่องว่างระหว่างบรรทัด		%>	</TD></TR>
<% ' ---------------------------------------------	ส่วนของการแสดงตัวเลือกของสุขภัณฑ์	------------------------------ %>
	<TR>
		<TD WIDTH="20%"  ALIGN=RIGHT  VALIGN=MIDDLE BGCOLOR="#6699CC">		Toilet  : </TD>
        <TD WIDTH="2%" BGCOLOR="#6699CC">	 	</TD>
		<TD WIDTH="15%"  VALIGN=MIDDLE BGCOLOR="#6699CC">
        <SELECT NAME="toilet_id">
        <%
        cmdTemp.CommandText = Replace(MSCSQueryMap.toilet_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set toilet_idField = rsAttrValues("toilet_id")
        set toilet_valueField = rsAttrValues("toilet_value")
		set toilet_FileField	= rsAttrValues("toilet_file")
		set toilet_price= rsAttrValues("toilet_price")
		toilet_x = mscsPage.HTMLEncode(toilet_price)
        do while Not rsAttrValues.EOF %>
			    <OPTION VALUE="<%= toilet_idField.value %>">&nbsp &nbsp<%= toilet_valueField.value %>&nbsp &nbsp
				<% rsAttrValues.MoveNext  
				loop
				 rsAttrValues.Close      		%>
        </SELECT>
        </TD>
<% ' ---------------------------------	ส่วนของการแสดงภาพของสุขภัณฑ์ที่มีอยู่ในรายการ --------------------------- %>	
		<TD WIDTH="100%"  BGCOLOR="#99CCFF">
		<TABLE WIDTH="100%" BORDER="0" HEIGHT=80>
		<TR>
		<%
		cmdTemp.CommandText = Replace(MSCSQueryMap.toilet_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set toilet_valueField = rsAttrValues("toilet_value")
		set toilet_FileField	= rsAttrValues("toilet_file")
        do while Not rsAttrValues.EOF %>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="90" HEIGHT="75" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = toilet_FileField.value %>">&nbsp<% = toilet_valueField.value %>
		<%	rsAttrValues.MoveNext	%>
		</TD>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="90" HEIGHT="75" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = toilet_FileField.value %>">&nbsp<% = toilet_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<%	 End if	 %>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="90" HEIGHT="75" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = toilet_FileField.value %>">&nbsp<% = toilet_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<TR HEIGHT=10>	</TR>
		</TR>
		<%		End if
		Loop	
		rsAttrValues.Close	%>
		</TABLE>
		</TD>
	</TR>
	<TR><TD WIDTH="100%" COLSPAN="3"  >&nbsp <%	'		เป็นการเว้นช่องว่างระหว่างบรรทัด		%>	</TD></TR>
	<% ' ------------------------------ ส่วนของการแสดงตัวเลือกของพื้น	 ------------------------- %>
	<TR>
   		<TD WIDTH="20%"  ALIGN=RIGHT  VALIGN=MIDDLE BGCOLOR="#6699CC">		Tile  : </TD>
		<TD WIDTH="2%" BGCOLOR="#6699CC">	 	</TD>
        <TD WIDTH="15%"  VALIGN=MIDDLE BGCOLOR="#6699CC">
        <SELECT NAME="floor_id">
        <%
        cmdTemp.CommandText = Replace(MSCSQueryMap.floor_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set floor_idField = rsAttrValues("floor_id")
        set floor_valueField = rsAttrValues("floor_value")
		set floor_price= rsAttrValues("floor_price")
		floor_x = mscsPage.HTMLEncode(floor_price)
        do while Not rsAttrValues.EOF %>
		        <OPTION VALUE="<%= floor_idField.value %>">&nbsp &nbsp<%= floor_valueField.value %>&nbsp &nbsp
			    <% rsAttrValues.MoveNext
				loop
				rsAttrValues.Close    %>
        </SELECT>
        </TD>
<% ' ------------------	ส่วนของการแสดงรูปภาพของพื้นที่มีอยู่ในรายการ ------------------------------------ %>
		<TD WIDTH="100%"  BGCOLOR="#99CCFF">
		<TABLE WIDTH="100%" BORDER="0" HEIGHT=80>
		<TR>
		<%
				 cmdTemp.CommandText = Replace(MSCSQueryMap.floor_by_family.SQLCommand, ":1", quoted_pf_id)
        Set rsAttrValues = Server.CreateObject("ADODB.Recordset")
        rsAttrValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
        set floor_valueField = rsAttrValues("floor_value")
	    set floor_FileField = rsAttrValues("floor_file")
        do while Not rsAttrValues.EOF %>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="60" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = floor_FileField.value %>">&nbsp<% = floor_valueField.value %><BR>
		<%	rsAttrValues.MoveNext	%>
		</TD>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="60" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = floor_FileField.value %>">&nbsp<% = floor_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<%	End if	%>
		<%		IF NOT rsAttrValues.EOF THEN		%>
		<TD WIDTH=30  ALIGN=LEFT VALIGN=TOP>
						<IMG WIDTH="60" HEIGHT="60" SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = floor_FileField.value %>">&nbsp<% = floor_valueField.value %><BR>
		<% rsAttrValues.MoveNext	 %>
		</TD>
		<TR HEIGHT=10>	</TR>
		</TR>
		<%		End if
		Loop	
		rsAttrValues.Close	%>
	</TABLE>
</TD>
</TR>
		<TR>
		<TD>&nbsp </TD>
		<TD COLSPAN="3" ALIGN="CENTER">
		<BR>
								<INPUT TYPE=HIDDEN NAME="door_x" VALUE="<% = door_x %>">
								<INPUT TYPE=HIDDEN NAME="door2_x" VALUE="<% = door2_x * bedroom%>">
								<INPUT TYPE=HIDDEN NAME="toilet_x" VALUE="<% = toilet_x * bathroom %>">
								<INPUT TYPE=HIDDEN NAME="floor_x" VALUE="<% = floor_x * body %>">
								<INPUT TYPE=HIDDEN NAME="slacken_year" VALUE="20">
								<INPUT TYPE= SUBMIT  VALUE=" calculate ">
			</FORM>
		</TD>
		</TR>
</TABLE>
<% end if %>
			</TD>
		</TR>
</TABLE>
</BODY>
</HTML>