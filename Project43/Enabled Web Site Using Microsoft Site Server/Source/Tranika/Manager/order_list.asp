<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>

<!--#INCLUDE FILE="include/Manager.asp" -->



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
		sqlText = ("SELECT  re.shopper_id , pro.name , de.dept_name , re.zone , re.date_start , re.date_end , re.status  FROM tranika_reserve re , tranika_product pro , tranika_dept  de WHERE  de.dept_id = re.dept_id  AND pro.pf_id = re.pf_id  ORDER BY re.reserve_id ")
		cmdTemp.CommandText = sqlText
        Set rsReserve = Server.CreateObject("ADODB.Recordset")
        rsReserve.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly

		set shopper_id	= rsReserve("shopper_id")
		set dept_name = rsReserve("dept_name")
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
<% REM   list vars: %>
<%	'	--------------------------------------	ถ้ามีการจองในโครงการก็จะแสดงข้อมูล	-------------------------------------
	   if  Reserve_exists then 
%>

<TABLE WIDTH="100%" BORDER="1" >
<TR><BR>
			<TD WIDTH="15%" ALIGN="center">ID</TD>
			<TD WIDTH="10%" ALIGN="center">Plan</TD>
			<TD WIDTH="10%" ALIGN="center">Home</TD>
			<TD WIDTH="15%" ALIGN="center">Code zone</TD>
			<TD WIDTH="15%" ALIGN="center">date_start</TD>
			<TD WIDTH="15%" ALIGN="center">date_end</TD>
			<TD WIDTH="15%" ALIGN="center">status</TD>
</TR>
<% do while not rsReserve.EOF %>
<TR>
			<TD WIDTH="15%" ALIGN="left"><A HREF="shop_view.asp?shopper_id=<% = shopper_id%>"><% = shopper_id%></A></TD>
			<TD WIDTH="15%" ALIGN="center"><% = dept_name%></TD>
			<TD WIDTH="15%" ALIGN="center"><A HREF="detail.asp?shopper_id=<% = shopper_id%>&zone=<% = zone %>"><% = name%></A></TD>
			<TD WIDTH="15%" ALIGN="center"><% = zone%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = date_start%></TD>
			<TD WIDTH="15%" ALIGN="center"><% = date_end%></TD>
			<TD WIDTH="15%" ALIGN="center"><%'<A HREF="reserve_edit.asp?shopper_id=%><%' = shopper_id%><%'">%><% = status%></TD>
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
<!--#INCLUDE FILE="include/list.asp" -->

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
