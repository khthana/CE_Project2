<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" --> 
<%
	 pf_id = mscsPage.RequestString("pf_id")
    quoted_pf_id = "'" & Replace(pf_id,"'","''") & "'"    
	REM - add quotes
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
        name = rsProduct("name").value
        dept_name = rsProduct("dept_name").value
		area = rsProduct("area").value
        list_price = rsProduct("list_price").value
        image_file = rsProduct("image_file").value
       
        rsProduct.Close

		door_id = mscsPage.RequestString("door_id")
		door2_id = mscsPage.RequestString("door2_id")
		floor_id = mscsPage.RequestString("floor_id")
		toilet_id = mscsPage.RequestString("toilet_id")
		price = mscsPage.RequestNumber("price")

		sqlText = ("SELECT  sku  FROM tranika_variant  WHERE pf_id = : 1 AND attr_door = : 2 AND attr_door2 = : 3 AND attr_toilet = : 4 AND attr_floor = : 5 ")
		sqlText = Replace(sqlText , " : 1 " , "'"&pf_id&"'")
		sqlText = Replace(sqlText , " : 2 " , door_id)
		sqlText = Replace(sqlText , " : 3 " , door2_id)
		sqlText = Replace(sqlText , " : 4 " , toilet_id)
		sqlText = Replace(sqlText , " : 5 " , floor_id)
		cmdTemp.CommandText = sqlText
        Set rsVariant = Server.CreateObject("ADODB.Recordset")
        rsVariant.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
		
		set sku = rsVariant("sku")
		sku = sku
		rsVariant.Close
%>
<HTML>
<HEAD>
    <TITLE><%= displayName %> : Select_zone <% if product_exists then %>: '<%= mscsPage.HTMLEncode(name) %>'<% end if %></TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>
<!--#INCLUDE FILE="main.htm" --> 
<%	 '  -------------------------	ส่วนของการแสดงรูปภาพของบ้าน	--------------------------------	%>
<TABLE WIDTH="80%" BORDER="1" ALIGN="center">
<TR>
		<TD ALIGN="CENTER">
		<IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(image_file) %>"
                 WIDTH="300"
                 HEIGHT="250">
		</TD>
<%  '	-------------------------	ส่วนของการแสดงรูปภาพทำเล	---------------------------- %>
<%
		sqlText = ("SELECT dept_zone  FROM tranika_dept  WHERE dept_id = : 1 ")
		sqlText = Replace(sqlText , " : 1 " , Request("dept_id"))
		cmdTemp.CommandText = sqlText
        Set rsDeptValues = Server.CreateObject("ADODB.Recordset")
        rsDeptValues.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
		set dept_FileField	= rsDeptValues("dept_zone")
%>
		<TD ALIGN="CENTER" VALIGN="MIDDEL" >
		<IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= dept_FileField.value%>"
                 WIDTH="350"
                 HEIGHT="300" >	
<%		rsDeptValues.Close	%>
		</TD>
</TR>
<% '	--------------------------------------------	ส่วนของการแสดงตารางการจอง	---------------------------------	%>
<%
		sqlText = ("SELECT DISTINCT re.shopper_id , pro.name , re.zone , re.date_start , re.date_end , re.status  FROM tranika_reserve re , tranika_product pro  WHERE re.dept_id = : 1 AND pro.pf_id = re.pf_id ")
		sqlText = Replace(sqlText , " : 1 " , Request("dept_id"))
		cmdTemp.CommandText = sqlText
        Set rsReserve = Server.CreateObject("ADODB.Recordset")
        rsReserve.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
		set shopper_id	= rsReserve("shopper_id")
		set name	= rsReserve("name")
		set zone	= rsReserve("zone")
		set date_start	= rsReserve("date_start")
		set date_end	= rsReserve("date_end")
		set status = rsReserve("status")

		if rsReserve.EOF then
		Reserve_exists = false 
		else
	    Reserve_exists = true
        End if
%>
<%	'	--------------------------------------	ถ้ามีการจองในโครงการก็จะแสดงข้อมูล	-------------------------------------
	   if  Reserve_exists then 
%>
<TABLE WIDTH="100%" BORDER="1" >
<TR><BR>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#6699CC">ID</TD>
			<TD WIDTH="10%" ALIGN="center" BGCOLOR="#6699CC">Home</TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#6699CC">Code zone</TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#6699CC">date_start</TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#6699CC">date_end</TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#6699CC">status</TD>
</TR>
<% do while not rsReserve.EOF %>
<TR>
			<TD WIDTH="15%" ALIGN="left" BGCOLOR="#99CCFF"><% = shopper_id%></TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#99CCFF"><% = name%></TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#99CCFF"><% = zone%></TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#99CCFF"><% = date_start%></TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#99CCFF"><% = date_end%></TD>
			<TD WIDTH="15%" ALIGN="center" BGCOLOR="#99CCFF"><% = status%></TD>
</TR>
<%		rsReserve.MoveNext 
			Loop 
			 rsReserve.Close
%>
</TABLE>

<% '	---------------------------------------  ถ้าไม่มีการจองในโครงกานนี้เกิดขึ้น ---------------------------------------------	 
	   else 
   	   Response.Write "no order "
	   end if	
%>
<% '	-------------------------------------- ส่วนของการรับข้อมูลการเลือกทำเล ---------------------------------------------- 

		sqlText = ("SELECT  zone_code , zone_start , zone_end FROM tranika_location   WHERE dept_id = : 1 AND zone_value = : 2  ")
		sqlText = Replace(sqlText , " : 1 " , Request("dept_id"))
		sqlText = Replace(sqlText , " : 2 " , area )
		cmdTemp.CommandText = sqlText
        Set rsLocation = Server.CreateObject("ADODB.Recordset")
        rsLocation.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly

		set code = rsLocation("zone_code")
		set zone_start = rsLocation("zone_start")
		set zone_end = rsLocation("zone_end")
		 x = zone_start
		 code = code

%>
		<FORM METHOD="post" ACTION="shopper.asp">
		 <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">
		 Select zone of home : 	
								<SELECT  NAME="zone"> 
								<%	do while   x  <= zone_end 
								sqlText = ("SELECT  zone  FROM tranika_reserve  WHERE  dept_id  = : 1 AND zone = : 2 ")
								sqlText = Replace(sqlText , " : 1 " , Request("dept_id"))
								sqlText = Replace(sqlText , " : 2 " , "'"&code&x&"'")
								cmdTemp.CommandText = sqlText
						        Set rsCheck = Server.CreateObject("ADODB.Recordset")
								rsCheck.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly	
																						
								if   rsCheck.EOF  then	%>
										<OPTION SIZE="4" VALUE="<%= code %><% = x %>"><% = code %><% = x %>
								<% else	  
								End if	%>
								<%		x = x+1	
											loop
								%>
								</SELECT>
								<INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id")%>">
								<INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% = pf_id %>">
								<INPUT TYPE="HIDDEN" NAME="sku" VALUE="<% = sku %>">
								<INPUT TYPE="HIDDEN" NAME="price" VALUE="<% = price %>">
								<INPUT TYPE="submit"   VALUE="  reserve  ">
</FORM>
<%	rsCheck.Close
		rsLocation.Close %>
<BR><BR>
</BODY>
</HTML>
<% End if %>