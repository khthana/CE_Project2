<%@ page import = "oracle.portal.provider.v1.*, oracle.portal.provider.v1.http.*, java.sql.*, java.lang.*, java.util.Date, PortalUtil"  session="false" %>

<FORM name="Registerdetail" method="POST" action="<%= HttpPortletRendererUtil.htmlFormActionLink(request,PortletRendererUtil.PAGE_LINK) %>" >
<%= HttpPortletRendererUtil.htmlFormHiddenFields(request,PortletRendererUtil.PAGE_LINK) %>

<%

	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
//Query Detail register
		String username = new String(request.getParameter("NewRegister"));
	    if (new String(request.getParameter("submit")).equals("Detail new user")) 
	    {			
			Statement stmt1 = con.createStatement();
			ResultSet rs1 = stmt1.executeQuery("select * from register_data where username='"+username+"'");
			if (rs1.next())
			{	out.println("<TABLE cellpadding=\"10\" align=\"center\" border=\"1\">");
				out.println("<TR>");
				out.println("<TD>");
				out.println(	"<FONT FACE=\"MS Sans Serif\" color=\"000000\" size=1>");
				out.println("<B>Username      : </B>" + rs1.getString(1) + "<BR>");
				out.println("</FONT>");
				out.println("</TD>");
				out.println("<TD>");
				out.println(	"<FONT FACE=\"MS Sans Serif\" color=\"000000\" size=1>");
				out.println("<B>Password      : </B>" + rs1.getString(2) + "<BR>");
				out.println("</FONT>");
				out.println("</TD>");
				out.println("</TR>");
				out.println("<TR>");				
				out.println("<TD>");
				out.println(	"<FONT FACE=\"MS Sans Serif\" color=\"000000\" size=1>");
				out.println("<B>Email         : </B>" + rs1.getString(3) + "<BR>");
				out.println("</FONT>");
				out.println("</TD>");
				out.println("<TD>");
				out.println(	"<FONT FACE=\"MS Sans Serif\" color=\"000000\" size=1>");
				out.println("<B>Register date : </B>" + rs1.getString(4) + "<BR>");
				out.println("</FONT>");
				out.println("</TD>");
				out.println("</TR>");
				out.println("<TR>");
				out.println("<TD colspan=\"2\">");
				out.println(	"<FONT FACE=\"MS Sans Serif\" color=\"000000\" size=1>");
				out.println("<B>Project name  : </B>" + rs1.getString(5) + "<BR>");
				out.println("</FONT>");
				out.println("</TD>");
				out.println("</TR>");
				out.println("<TR>");
				out.println("<TD>");
				out.println(	"<FONT FACE=\"MS Sans Serif\" color=\"000000\" size=1>");
				out.println("<B>Project year  : </B>" + rs1.getString(6) + "<BR>");
				out.println("</FONT>");
				out.println("</TD>");
				out.println("</TR>");
				out.println("</TABLE>");
			}
			rs1.close();
			stmt1.close();
	    }	
		con.close();
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
%>
<TABLE align="CENTER">
<TR>
<TD>
<input type="SUBMIT" name="CLOSEPORTLET" value="Close" > 
</TD>
</TR>
</TABLE>
</FORM>
