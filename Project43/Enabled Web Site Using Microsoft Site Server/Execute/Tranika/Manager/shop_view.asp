<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>

<!--#INCLUDE FILE="include/Manager.asp" -->
<%
		shopper_id = mscsPage.RequestString("shopper_id")
		sqlText = ("SELECT name , address , country , phone FROM tranika_shopper WHERE shopper_id = : 1 ")
		sqlText = Replace(sqlText ," : 1 ", "'"&Request("shopper_id")&"'")
		cmdTemp.CommandText = sqlText
		Set rsShop = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsShop.Open cmdTemp, , adOpenStatic, adLockOptimistic

		set name = rsShop("name")
		set address = rsShop("address")
		set country = rsShop("country")
		set phone = rsShop("phone")
		
%>
<% REM -- header:  %>
<% pageTitle = "Shopper" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<% REM -- body:  %>
<BR>
<TABLE>
    <TR>
        <% REM basic:  %>
        <TD VALIGN="TOP">
            <B><% =name %></B>

            <BR>
            <% = address %>
            <BR>
            <% = country %>
            <BR>
            <% = phone %>
            <BR>
             </TD>
    </TR>
</TABLE>

<BR>
<FORM METHOD=POST ACTION="shopper_delete.asp">
    <INPUT TYPE="HIDDEN" NAME="shopper_name" VALUE="<% = name %>">
    <INPUT TYPE="HIDDEN" NAME="shopper_id" VALUE="<% = shopper_id %>">

    <INPUT TYPE="SUBMIT" VALUE="Delete Shopper...">

</FORM>
<% rsShop.Close %>
<BR>


<% REM display shopper's basket:  %>

    <%
'	 
    REM -- Create a storage object for the order forms (shopper's basket) 
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

		set reserve_id =rsOrder("reserve_id")
		set dept_name =rsOrder("dept_name")
		set pf_name =rsOrder("name")
		set zone =rsOrder("zone")
		set date_start =rsOrder("date_start")
		set date_end =rsOrder("date_end")
'		set price =rsOrder("price")
		set status =rsOrder("status")
  
		if not isnull (rsOrder) then
%>
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
<% else	%>
<H3> NO. Order </H3>
<%' rsOrder.Close %>
<% end if %>
        <% REM column headers:  %>
</TABLE>

<% REM -- footer:  %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
