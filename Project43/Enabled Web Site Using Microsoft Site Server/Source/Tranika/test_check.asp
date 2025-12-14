<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" --> 

<%
	Validate = Request("Validate")
	shopper_id = Request("shopper_id")
	password = Request("password")
	if Validate = 1 then	
	
		sqlText = ("SELECT  password  FROM tranika_shopper WHERE shopper_id = : 1 ")
		sqlText = Replace(sqlText , " : 1 " , "'"&shopper_id&"'")
		cmdTemp.CommandText = sqlText
        Set rsShopper = Server.CreateObject("ADODB.Recordset")
        rsShopper.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
	
		set pass_check = rsShopper("password")
		pass_check = pass_check
		
		if not isnull (pass_check) then 
			if password = pass_check then
					
		sqlText = ("SELECT DISTINCT re.shopper_id , pro.name , re.zone , re.date_start , re.date_end , re.status , re.price , dp.dept_name FROM tranika_reserve re , tranika_product pro , tranika_dept dp WHERE re.shopper_id = : 1 AND pro.pf_id = re.pf_id AND dp.dept_id = re.dept_id ")
		sqlText = Replace(sqlText , " : 1 " , "'"&shopper_id&"'")
		cmdTemp.CommandText = sqlText
        Set rsReserve = Server.CreateObject("ADODB.Recordset")
        rsReserve.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
		set shopper_id	= rsReserve("shopper_id")
		set name	= rsReserve("name")
		set dept_name = rsReserve("dept_name")
		set zone	= rsReserve("zone")
		set date_start	= rsReserve("date_start")
		set date_end	= rsReserve("date_end")
		set price = rsReserve("price")
		set status = rsReserve("status")
		
%>
<HTML>
<HEAD>
    <TITLE><%= displayName %>: Product<% if product_exists then %>: '<%= mscsPage.HTMLEncode(name) %>'<% end if %></TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>

<BODY BACKGROUND="<%' = Application("background") %>"  TEXT= "#000000" LINK= "#FF0000" VLINK= "#FF0000" ALINK=  "#FF0000" >
<!--#INCLUDE FILE="main.htm" --> 
<TABLE WIDTH="100%" BORDER="1" >
<TR><BR>
			<TD WIDTH="15%" ALIGN="center">ID</TD>
			<TD WIDTH="10%" ALIGN="center">Plan</TD>
			<TD WIDTH="10%" ALIGN="center">Home</TD>
			<TD WIDTH="15%" ALIGN="center">Code zone</TD>
			<TD WIDTH="15%" ALIGN="center">date_start</TD>
			<TD WIDTH="15%" ALIGN="center">date_end</TD>
			<TD WIDTH="10%" ALIGN="center">price</TD>
			<TD WIDTH="15%" ALIGN="center">status</TD>
</TR>
<% do while not rsReserve.EOF %>
<TR>
			<TD WIDTH="15%" ALIGN="left"><% = shopper_id%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = dept_name%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = name%></TD>
			<TD WIDTH="5%" ALIGN="center"><% = zone%></TD>
			<TD WIDTH="10%" ALIGN="center"><% = date_start%></TD>
			<TD WIDTH="10%" ALIGN="center"><% = date_end%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = MSCSDataFunctions.Money(price)%> Bath</TD>
			<TD WIDTH="15%" ALIGN="center"><% = status%></TD>
</TR>
<%		rsReserve.MoveNext 
			Loop 
			 rsReserve.Close
%>
</TABLE>



<%
			else
			end if
	else	' ไม่มีข้อมูล
				Response.Write "Please come back to Insert again"
	End if 


%>
<BR><BR>
<% 	End if %>
</BODY>
</HTML>