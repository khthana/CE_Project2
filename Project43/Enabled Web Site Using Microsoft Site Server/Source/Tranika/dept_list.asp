<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" --> 
<% '  เป็นส่วนของ link ต่าง ๆ ด้านบน		%>

<HTML>
<HEAD>
    <TITLE><%= displayName %> : Plan </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>
<!--#INCLUDE FILE="main.htm" --> 
<% ' เป็นส่วนของ รายละเอียด	%> 	
<TABLE WIDTH="80%" BORDER="1" ALIGN="center">
<TR>
			<TD WIDTH="70%" ALIGN="center"  VALIGN=TOP BGCOLOR="#6699CC" >
					<P>
					<H1>Welcome to TRANIKA HOME</H1>
			</TD>
</TR>
<%
			sqlText = MSCSQueryMap.depts.SQLCommand
			Set rsDepts = MSCS.Execute (sqlText, nDepts, adCmdText)
			if rsDepts.EOF then
%>
    There are currently no departments available.
			<% else %>
<TR>
	<TD BGCOLOR="#99CCFF">
			<P ALIGN="LEFT">
	Please select plan is do you want
			</P>
			<UL>
	
<%
    set dept_idField = rsDepts("dept_id")
    set dept_nameField = rsDepts("dept_name")
    do while Not rsDepts.EOF
%>

			<LI><P ALIGN="left"><A HREF="<%= baseURL("dept.asp") & mscsPage.URLShopperArgs("dept_id", dept_idField.value) %>"><%= dept_nameField.value %></P></A>
        <% rsDepts.MoveNext
    loop
    rsDepts.Close
    MSCS.Close
    %>
    </UL>
<% end if %>
<P>
			</TD>
		</TR>
	</TABLE>
</BODY>
</HTML>