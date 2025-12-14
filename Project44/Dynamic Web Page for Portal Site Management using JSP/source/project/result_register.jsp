<%@ page import = "oracle.portal.provider.v1.*, oracle.portal.provider.v1.http.*, java.sql.*, java.lang.*, java.util.Date, PortalUtil" %>

<%
	PortletRenderRequest portletRequest = (PortletRenderRequest)request.getAttribute(HttpProvider.PORTLET_RENDER_REQUEST);
%>

<HTML>
<BODY>
<%
// var
	int userflag = 0;
	int passflag = 0;
	int emailflag = 0;
	int cemailflag = 0;
	int pnameflag = 0;
	int pyearflag = 0;
	int dupflag = 0;
	int i;
// receive var
	String puser = new String(request.getParameter("name").trim());
	String ppass = new String(request.getParameter("passwd").trim());
	String pcpass = new String(request.getParameter("pwdrepeat").trim());
	String pemail = new String(request.getParameter("email").trim());
	String ppname = new String(request.getParameter("project").trim());
	String ppyear = new String(request.getParameter("ProjectYear").trim());
// check username
	if (PortalUtil.isUpperChar(puser.toUpperCase().charAt(0))) {}
	else { userflag = 1; }
	if (userflag == 0)
	{
		for (i=0;i<puser.length();i++)
		{
			if ((PortalUtil.isUpperChar(puser.toUpperCase().charAt(i))) || PortalUtil.isNum(puser.charAt(i)) || (puser.charAt(i) == '_')) {}
			else { userflag = 1; }
		}
	}
	if (userflag == 0)
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
			Statement stmt1 = con.createStatement();
			ResultSet rs1 = stmt1.executeQuery("SELECT user_name FROM wwsec_member_groups WHERE user_name='" + puser.toUpperCase() + "'");
			if (rs1.next()) { dupflag = 1; }
			rs1.close();
			ResultSet rs2 = stmt1.executeQuery("SELECT username FROM register_data WHERE username='" + puser.toUpperCase() + "'");
			if (rs2.next()) { dupflag = 1; }
			rs2.close();
			stmt1.close();
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
	}
// check password
	if (ppass.length() != 6) { passflag = 1; }
	if (passflag == 0)
	{
		for (i=0;i<ppass.length();i++)
		{
			if ((PortalUtil.isUpperChar(ppass.toUpperCase().charAt(i))) || PortalUtil.isNum(ppass.charAt(i))) {}
			else { passflag = 1; }
		}
	}
// check confirm password
	if (ppass.equals(pcpass)) 	{}
	else { cemailflag = 1; }
// check email
	int aflag = 0;
	for (i=0;i<pemail.length();i++)
	{
		if (pemail.charAt(i) == '@') { aflag = aflag + 1; }
	}
	if (aflag == 1)
	{
		String tmp;
		StringTokenizer stk = new StringTokenizer(pemail,"@");
		if (stk.hasMoreElements())
		{
			tmp = new String(stk.nextToken());
			for (i=0;i<tmp.length();i++)
			{
				if ((tmp.charAt(i) == '_') || (PortalUtil.isUpperChar(tmp.toUpperCase().charAt(i))) || PortalUtil.isNum(tmp.charAt(i))) {}
				else { emailflag = 1; }
			}
			if (emailflag == 0)
			{
				if (stk.hasMoreElements())
				{
					tmp = new String(stk.nextToken());
					for (i=0;i<tmp.length();i++)
					{
						if ((tmp.charAt(i) == '_') || (tmp.charAt(i) == '.') || (PortalUtil.isUpperChar(tmp.toUpperCase().charAt(i))) || PortalUtil.isNum(tmp.charAt(i))) {}
						else { emailflag = 1; }
					}
				}
				else { emailflag = 1; }
			}
		}
		else { emailflag = 1; }
	}
	else { emailflag = 1; }
// check project name
	if (ppname.length() > 0) {} else { pnameflag = 1; }
// check project year
	for (i=0;i<ppyear.length();i++)
	{
		if (PortalUtil.isNum(ppyear.charAt(i))) {}
		else { pyearflag = 1; }
	}
// check all error
	if ((userflag + passflag + emailflag + pnameflag + pyearflag) == 0)
	{
		if (dupflag == 0)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
				Statement stmt2 = con2.createStatement();
				ResultSet rs2 = stmt2.executeQuery("INSERT INTO register_data VALUES ('"+puser.toUpperCase()+"','"+ppass+"','"+pemail+"',sysdate,'"+ppname+"',"+ppyear+",'wait')");
				rs2.close();
				stmt2.close();
				con2.close();
			}
			catch(SQLException e2)
			{
				while (e2 != null) 
				{
					out.println("SQLException:<br>");
					out.println("Message:   " + e2.getMessage() + "<br>");
					out.println("SQLState:  " + e2.getSQLState() + "<br>");
					out.println("ErrorCode: " + e2.getErrorCode() + "<br>");
					e2 = e2.getNextException();
				}
			}
%>
<% 
	out.println(	"<FONT FACE=\"MS Sans Serif\" color=\"0033FF\" size=2><u><B>");
	out.println(request.getParameter("name"));
	out.println("</B></u></FONT>");
%>
<B>
<FONT FACE="MS Sans Serif" size=2>
User Name's registered.</B><BR>Your account can use after you receive e-mail from Portal admin. <BR>
<%
		}
		else
		{
%>
<B><I>SORRY... </I></B><BR>User name is already.Please change User name and register again. <br>
</FONT>
<%
		}
	}
// show box again
	else
	{
%>
Error : <br>
<%=puser %> userflag = <%=userflag %> <br>
<%=ppass %>  passflag = <%=passflag %> <br>
<%=pemail %>  emailflag = <%=emailflag %> <br>
<%=ppname %>  pnameflag = <%=pnameflag %> <br>
<%=ppyear %>  pyearflag = <%=pyearflag %> <br>
<%
	}
%>
</BODY>
</HTML>
