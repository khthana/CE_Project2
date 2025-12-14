<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>

<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="include/mgmt_define.asp" -->
<%
		shopper_id = mscsPage.RequestString("shopper_id")
		zone = mscsPage.RequestString("zone")
		
%>

<% REM   header: %>
<% pageTitle = "All Orders" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->
<%
		sqlText = ("SELECT dp.dept_name , pd.name ,re.zone , re.price , d1.door_value , d2.door2_value , toi.toilet_value , fl.floor_value  FROM tranika_reserve re , tranika_variant  va , tranika_attr_door d1 , tranika_attr_door2 d2 , tranika_attr_toilet toi , tranika_attr_floor fl , tranika_product pd , tranika_dept dp WHERE re.shopper_id = : 1 AND re.zone = : 2 AND va.sku = re.sku AND d1.door_id = va.attr_door AND d2.door2_id = va.attr_door2 AND toi.toilet_id = va.attr_toilet AND fl.floor_id = va.attr_floor AND pd.pf_id = re.pf_id AND dp.dept_id = re.dept_id ")
		sqlText = Replace(sqlText ," : 1 ", "'"&shopper_id&"'")
		sqlText = Replace(sqlText ," : 2 ", "'"&zone&"'")
		cmdTemp.CommandText = sqlText
        Set rsReserve = Server.CreateObject("ADODB.Recordset")
        rsReserve.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly

		
		set dept_name = rsReserve("dept_name")
		set name	= rsReserve("name")
		set zone	= rsReserve("zone")
		set door_name	= rsReserve("door_value")
		set door2_name	= rsReserve("door2_value")
		set toilet_name = rsReserve("toilet_value")
		set floor_name	= rsReserve("floor_value")
		set price	= rsReserve("price")


		if rsReserve.EOF then
		Reserve_exists = false 
		else
	    Reserve_exists = true
        End if

%>
<% REM   list vars: %>
<%	'	--------------------------------------	ถ้ามีการจองในโครงการก็จะแสดงข้อมูล	-------------------------------------
	   if  Reserve_exists then 
%>

<TABLE WIDTH="100%" BORDER="1" >
<TR><BR>
			<TD WIDTH="10%" ALIGN="center">Plan</TD>
			<TD WIDTH="10%" ALIGN="center">Home</TD>
			<TD WIDTH="15%" ALIGN="center">Code zone</TD>
			<TD WIDTH="10%" ALIGN="center">Home door</TD>
			<TD WIDTH="10%" ALIGN="center">Room door</TD>
			<TD WIDTH="10%" ALIGN="center">Toilet</TD>
			<TD WIDTH="10%" ALIGN="center">Teil</TD>
			<TD WIDTH="15%" ALIGN="center">Price</TD>
</TR>
<%' do while not rsReserve.EOF %>
<TR>
			<TD WIDTH="15%" ALIGN="center"><% = dept_name%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = name%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = zone %></TD>
			<TD WIDTH="5%" ALIGN="center"><% = door_name%></TD>
			<TD WIDTH="5%" ALIGN="center"><% = door2_name%></TD>
			<TD WIDTH="5%" ALIGN="center"><% = toilet_name%></TD>
			<TD WIDTH="5%" ALIGN="center"><% = floor_name%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = MSCSDataFunctions.Money(price)%> Bath</TD>
			<TD WIDTH="15%" ALIGN="center"><% '= status%></TD>
</TR>
<%	'	rsReserve.MoveNext 
		'	Loop 
			 rsReserve.Close
%>
</TABLE>

<% '	---------------------------------------  ถ้าไม่มีการจองในโครงกานนี้เกิดขึ้น ---------------------------------------------	 
	   else 
   	   Response.Write "no order "
	   end if	
%>
<!--#INCLUDE FILE="include/list.asp" -->

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
