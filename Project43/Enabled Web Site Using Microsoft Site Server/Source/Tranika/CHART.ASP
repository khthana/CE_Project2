<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" --> 
<%
	sqlText = ("SELECT name , pf_chart  FROM tranika_product ORDER BY pf_chart DESC ")
	cmdTemp.CommandText = sqlText
    Set rsProduct = Server.CreateObject("ADODB.Recordset")
    rsProduct.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly

	sqlText = ("SELECT dept_name , dept_chart  FROM tranika_dept ORDER BY dept_chart DESC ")
	cmdTemp.CommandText = sqlText
    Set rsDept = Server.CreateObject("ADODB.Recordset")
    rsDept.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly	

	chart_1 = rsProduct("pf_chart")
	name_1 = rsProduct("name")
	rsProduct.MoveNext	
	chart_2 = rsProduct("pf_chart")
	name_2 = rsProduct("name")
	rsProduct.MoveNext	
	chart_3 = rsProduct("pf_chart")
	name_3 = rsProduct("name")
	rsProduct.MoveNext	
	chart_4 = rsProduct("pf_chart")
	name_4 = rsProduct("name")
	rsProduct.MoveNext	
	chart_5 = rsProduct("pf_chart")
	name_5 = rsProduct("name")
	sum = (chart_1 + chart_2 + chart_3 + chart_4 + chart_5)
	rsProduct.Close

	deptchart_1 = rsDept("dept_chart")
	deptname_1 = rsDept("dept_name")
	rsDept.MoveNext	
	deptchart_2 = rsDept("dept_chart")
	deptname_2 = rsDept("dept_name")
	rsDept.MoveNext	
	deptchart_3 = rsDept("dept_chart")
	deptname_3 = rsDept("dept_name")
	rsDept.MoveNext	
	deptchart_4 = rsDept("dept_chart")
	deptname_4 = rsDept("dept_name")
	rsDept.MoveNext	
	deptsum = (deptchart_1 + deptchart_2 + deptchart_3 + deptchart_4 )
	rsDept.Close
%>
<HTML>
<HEAD>
<TITLE><%= displayName %> : Chart</TITLE>
</HEAD>
<!--#INCLUDE FILE="main.htm" -->
<P align="center"><Font size="4" color=#FF9966><b>Home Top Hit</b></font></p>
<TABLE WIDTH="80%"  HEIGHT="200" BORDER="1" ALIGN="center">
<TR VALIGN="BOTTOM">
			<TD BGCOLOR="#CCFFFF">
			<TABLE WIDTH="20" BORDER="0" ALIGN="CENTER">
				<TR><% = (chart_1 *100)\sum  %>%</TR>
				<TR>
					<TD WIDTH="10" HEIGHT="<% = (chart_1 *100)\sum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			<TD BGCOLOR="#CCFFFF">
				<TABLE WIDTH="20" BORDER="0" ALIGN="CENTER" >
				<TR><% = (chart_2 *100)\sum  %>%</TR>
				<TR >
					<TD   WIDTH="10" HEIGHT="<% = (chart_2 *100)\sum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			<TD BGCOLOR="#CCFFFF">
				<TABLE WIDTH="20" BORDER="0" ALIGN="CENTER">
				<TR><% = (chart_3 *100)\sum  %>%</TR>
				<TR>
					<TD WIDTH="10" HEIGHT="<% = (chart_3 *100)\sum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			<TD BGCOLOR="#CCFFFF">
				<TABLE WIDTH="20" BORDER="0" ALIGN="CENTER">
				<TR><% = (chart_4 *100)\sum  %>%</TR>
				<TR>
					<TD WIDTH="10" HEIGHT="<% = (chart_4 *100)\sum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			<TD BGCOLOR="#CCFFFF">
				<TABLE WIDTH="20" BORDER="0" ALIGN="CENTER">
				<TR><% = (chart_5 *100)\sum  %>%</TR>
				<TR>
					<TD WIDTH="10" HEIGHT="<% = (chart_5 *100)\sum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			</TD>
</TR>
<TR >
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = name_1 %></font></TD>
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = name_2 %></font></TD>
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = name_3 %></font></TD>
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = name_4 %></font></TD>	
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = name_5 %></font></TD>
</TR>
</TABLE>
<% '	-------------------------------------	dept %><BR><BR>
<P align="center"><Font size="4" color=#FF9966><b>Plan Top Hit</b></font></p>
<TABLE WIDTH="80%"  HEIGHT="200" BORDER="1" ALIGN="center">
<TR VALIGN="BOTTOM">
			<TD BGCOLOR="#CCFFFF">
			<TABLE <%'WIDTH="20" %> BORDER="0" ALIGN="CENTER" >
				<TR><% = (deptchart_1 *100)\deptsum  %>%</TR>
				<TR >
					<TD WIDTH="10" HEIGHT="<% = (deptchart_1 *100)\deptsum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			<TD BGCOLOR="#CCFFFF">
				<TABLE <%'WIDTH="20" %>BORDER="0" ALIGN="CENTER" >
				<TR><% = (deptchart_2 *100)\deptsum  %>%</TR>
				<TR >
					<TD   WIDTH="10" HEIGHT="<% = (deptchart_2 *100)\deptsum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			<TD BGCOLOR="#CCFFFF">
				<TABLE <%'WIDTH="20"%> BORDER="0" ALIGN="CENTER">
				<TR><% = (deptchart_3 *100)\deptsum  %>%</TR>
				<TR>
					<TD WIDTH="10" HEIGHT="<% = (deptchart_3 *100)\deptsum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
			<TD BGCOLOR="#CCFFFF">
				<TABLE <%'WIDTH="20"%> BORDER="0" ALIGN="CENTER">
				<TR><% = (deptchart_4 *100)\deptsum  %>%</TR>
				<TR>
					<TD WIDTH="10" HEIGHT="<% = (deptchart_4 *100)\deptsum  %>" BGCOLOR="#0055FF"></TD>
				</TR>
				</TABLE>
			</TD>
</TR>
<TR >
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = deptname_1 %></font></TD>
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = deptname_2 %></font></TD>
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = deptname_3 %></font></TD>
			<TD ALIGN="CENTER" BGCOLOR="#66CCCC"><font size="1"><% = deptname_4 %></font></TD>			
</TR>
</TABLE><BR>
</BODY>
</HTML>