<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" -->
<%
dept_id = mscsPage.RequestString("dept_id")
sqlText = Replace(MSCSQueryMap.dept_by_id.SQLCommand,":1", dept_id)
Set rsDept = MSCS.Execute (sqlText, nDepts, adCmdText)

if rsDept.EOF then
    dept_exists = false
    dept_name = "Unknown Department"
else
    dept_exists = true
    REM -- get fields:
    dept_name = rsDept("dept_name").value
    dept_description = rsDept("dept_description").value
    dept_map = rsDept("dept_map").value

    REM -- Log department for UA
    Response.AppendToLog "&" & mscsPage.URLArgs("MSS.Request.Category Name", dept_name)
end if
rsDept.Close
'	--------------------------------	เก็บสถิติของโครงการ ----------------------------------------------
		sqlText = ("SELECT dept_chart FROM tranika_dept WHERE dept_id = : 1 ")
		sqlText = Replace(sqlText ," : 1 ", "'"&Request("dept_id")&"'")
		cmdTemp.CommandText = sqlText
		Set rsChart = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsChart.Open cmdTemp, , adOpenStatic, adLockOptimistic

		set dept_chart = rsChart("dept_chart")
		dept_chart = dept_chart 

		if isnull(dept_chart) then
			dept_chart = 1
		else
			dept_chart = dept_chart + 1
		End if

		rsChart("dept_chart").value = dept_chart
		rsChart.Update
		rsChart.Close
'	---------------------------------------------------------------------------------------------------------------
%>
<HTML>
<HEAD>
    <TITLE><%= displayName %> : Plan <%= mscsPage.HTMLEncode(dept_name) %>'</TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>
<BODY    BACKGROUND="<%' = Application("background") %>"    TEXT=   "#000000"    LINK=   "#FF0000"    VLINK=  "#FF0000"    ALINK=  "#FF0000" >
<%
    if dept_exists then
        cmdTemp.CommandText = Replace(MSCSQueryMap.products_by_dept.SQLCommand,":1",dept_id)
        Set rsProducts = Server.CreateObject("ADODB.Recordset")
        rsProducts.Open cmdTemp, , adOpenStatic, adLockReadOnly

		if rsProducts.EOF then
            products_exist = false
        else
            products_exist = true
        end if
    end if
%>
<% '  เป็นส่วนของ link ต่าง ๆ ด้านบน		%>
<!--#INCLUDE FILE = "main.htm" -->
<% ' เป็นส่วนของ รายละเอียดด้านล่าง	%> 	
<TABLE WIDTH="80%" BORDER="1" ALIGN="center">
<TR>
			<TD WIDTH="70%" ALIGN=CENTER VALIGN=TOP BORDER="0" >
			<TABLE WIDTH="100%"  BORDER="1" HEIGHT="100%">
<% if not dept_exists then %>
				        <P>The department you requested is currently not available.
<% else %>
			<TR>
				<TD ALIGN=CENTER VALIGN=TOP BGCOLOR="#6699CC">
		        <H1><%= mscsPage.HTMLEncode(dept_name) %></H1>
				</TD>
			</TR>
			<TR>
				<TD ALIGN=CENTER VALIGN=TOP BGCOLOR="#6699CC">
		    <%= mscsPage.HTMLEncode(dept_description) %>
				</TD>
			</TR>
			
<% if products_exist then %>
			<TR>
				<TD ALIGN=LEFT VALIGN=TOP BGCOLOR="#6699CC"> 
		       &nbsp   &nbsp  &nbsp Select home from the list below:
				</TD>
			 </TR>
			 <TR>
				<TD ALIGN=LEFT VALIGN=TOP BGCOLOR="#99CCFF">
        <UL>
            <% set pf_idField = rsProducts("pf_id")
            set nameField = rsProducts("name")
            do while Not rsProducts.EOF
%>
			<BR>
            <LI><A HREF="<%= baseURL("product.asp") & mscsPage.URLShopperArgs("dept_id" , dept_id, "pf_id", pf_idField.value) %>">
			<%= mscsPage.HTMLEncode(nameField.value) %></A>
            <% rsProducts.MoveNext
            loop
            rsProducts.Close
%>
        </UL>
    <% else %>
        <FONT SIZE="2">No products at this time.</FONT>
    <% end if %>
			</TD>
		</TR>
</TABLE>
<% end if %>
			</TD>
		</TR>
</TABLE><BR>
<TABLE BORDER="1" ALIGN="CENTER" WIDTH="400" HEIGHT="300">
	<TR>
				<TD ALIGN="CENTER" HEIGHT="60%" BGCOLOR="#99CCFF">
					<IMG SRC="<%= "/" & siteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(dept_map) %>"
                 WIDTH="350"
                 HEIGHT="250">
				</TD>
	</TR>
	</TABLE>
	</BODY>
</HTML>