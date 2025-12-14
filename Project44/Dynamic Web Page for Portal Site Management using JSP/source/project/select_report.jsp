<%@ page import = "oracle.portal.provider.v1.*, oracle.portal.provider.v1.http.*, java.sql.*, java.lang.*, java.util.Date"  session="false" %>
<%    PortletRenderRequest portletRequest = (PortletRenderRequest)request.getAttribute(HttpProvider.PORTLET_RENDER_REQUEST);%>

<BODY>
<FONT CLASS="PortletText1">
<form name="browses" method="POST" action="<%= HttpPortletRendererUtil.htmlFormActionLink(request,PortletRendererUtil.PAGE_LINK) %>">
<br>
<%= HttpPortletRendererUtil.htmlFormHiddenFields(request,PortletRendererUtil.PAGE_LINK) %>
<input type="RADIO" name="browsing" value="webdata" checked>Browse webpage data report<BR>
<%
	String uname = new String(portletRequest.getUser().getName().toUpperCase());
	int adminflag = 0;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM WWSEC_MEMBER_GROUPS WHERE GROUP_NAME='PORTAL_ADMINISTRATORS' and USER_NAME='"+uname+"'");
		if (rs.next()) { adminflag = 1; }
		rs.close();
		stmt.close();
		conn.close();
	}
	catch(SQLException e)
	{
		while (e != null) 
		{
			out.println("SQLException:<br>");
			out.println("Message:   " + e.getMessage() + "<br>");
			out.println("SQLState:  " + e.getSQLState() + "<br>");
			out.println("ErrorCode: " + e.getErrorCode() + "<br>");
			e = e.getNextException();
		}
	}
	if (adminflag==1)
	{
%>
<input type="RADIO" name="browsing" value="logindata">Browse login data report<BR>
<input type="RADIO" name="browsing" value="eventdata">Browse event data report<BR>
<%
	}
%>
<BR>
<center><input type=submit name="submit" value="selected" > </center>
</form>
</FONT>
</BODY>

