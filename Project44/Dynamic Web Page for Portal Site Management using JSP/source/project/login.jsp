<%@page import = "oracle.portal.provider.v1.*, oracle.portal.provider.v1.http.*, java.sql.*, java.lang.*, java.util.Date, javax.mail.*, javax.mail.internet.*"%>

<%
	PortletRenderRequest portletRequest = (PortletRenderRequest)request.getAttribute(HttpProvider.PORTLET_RENDER_REQUEST);
%>

<HTML>
<HEAD>
<script language=Javascript>
function regist() { window.open("http://161.246.5.170/pls/portal30/url/page/register",'registform','width=540,height=480,top=30,left=150,status=yes');}
</script>

</HEAD>

<BODY>

<%
	String llogin = new String("-");
	String uname = new String(portletRequest.getUser().getName());
	if (uname.equals("PUBLIC"))
	{
// login box here
%>
  <FORM ACTION="PORTAL30.wwptl_login.login_url" METHOD="POST" name="LoginForm">
    <INPUT TYPE="hidden" NAME="p_requested_url" VALUE="portal30.home">
    <INPUT TYPE="hidden" NAME="p_cancel_url" VALUE="http://161.246.5.170/pls/portal30/url/page/project_page">
    <TABLE WIDTH="90%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
      <TR> 
        <TD> 
        <FONT CLASS="OraHeaderSub"><NOBR></NOBR></FONT> 

	<FONT CLASS="OraInstructionText">
        <FONT class="PortletText1"></FONT></FONT> 
        <TABLE ALIGN="center"> 
          <TR> 
            <TD><FONT class="PortletHeading1">Username</FONT></TD> 
            <TD><INPUT TYPE="text" NAME="ssousername" SIZE="18" MAXLENGTH="80"></TD> 
          </TR>
          <TR>
            <TD><FONT class="PortletHeading1">Password</FONT></TD>
            <TD><INPUT TYPE="password" NAME="password" SIZE="18" MAXLENGTH="255"></TD>
          </TR> 
          <TR>
	    <TD>
	    </TD>
            <TD align="RIGHT">
		<INPUT TYPE="submit" VALUE="login">
		&nbsp;&nbsp;&nbsp;
		<FONT FACE="MS Sans Serif" size=1>
		<A HREF="Javascript:regist()">Register..</A>
		</FONT>
	    </TD>
	  </TR>
        </TABLE> 
        </TD> 
      </TR> 
    </TABLE> 
  </FORM> 
<%
	}
	else
	{	out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
		out.println("Welcome " + uname + "<BR>");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
// find last login
			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();
			ResultSet rs1 = stmt1.executeQuery("SELECT start_time FROM WWLOG_ACTIVITY_LOGS WHERE ACTION = 'login' and USERID ='" + uname + "' ORDER BY START_TIME DESC");
			rs1.next();
			if (rs1.next())
			{
				llogin = new String(rs1.getString(1));
			}
			rs1.close();
// show welcome message
			out.println("Last log in time : " + llogin + "<BR>");
// check if admin
			int adminflag = 0;
			int userflag=0;
			ResultSet rs2 = stmt1.executeQuery("SELECT * FROM WWSEC_MEMBER_GROUPS WHERE GROUP_NAME='PORTAL_ADMINISTRATORS' and USER_NAME='"+uname+"'");
			if (rs2.next()) { adminflag = 1; }
			rs2.close();
			if (adminflag == 1)
			{
				ResultSet rs3 = stmt1.executeQuery("SELECT t1.username,t1.email FROM register_data t1,wwsec_member_groups t2 WHERE t1.username = t2.user_name and t1.flag='wait'");
				while (rs3.next())
				{
					ResultSet rs5 = stmt2.executeQuery("UPDATE register_data SET flag='created' WHERE username='"+rs3.getString("username")+"'");
// mail to created user
					String host = new String("mail.kmitl.ac.th");
					String from = new String("webmaster@portal.ce.kmitl.ac.th");
					Properties props = System.getProperties();
					props.put("mail.smtp.host", host);
					Session s = Session.getDefaultInstance(props, null);
					MimeMessage message = new MimeMessage(s);
					String to = new String(rs3.getString("email"));
					String cc = new String("");
					String bcc = new String("");
					String name= new String(rs3.getString("username"));
					String subject = new String("Confirm Portal username.");
					String text = new String("Your account is created. Username : "+name+". And Your public homepage is"+name+"(Must create new page in this name only). Please change your password at account_info icon after logon. ");
					InternetAddress fromAddress = new InternetAddress(from);
					InternetAddress[] toAddresses = InternetAddress.parse(to,false);
					InternetAddress[] ccAddresses = InternetAddress.parse(cc,false);
					InternetAddress[] bccAddresses = InternetAddress.parse(bcc,false);
					message.setFrom(fromAddress);
					message.addRecipients(Message.RecipientType.TO, toAddresses);
					message.addRecipients(Message.RecipientType.CC, ccAddresses);
					message.addRecipients(Message.RecipientType.BCC, bccAddresses);
					message.setSubject(subject);
					message.setText(text);
					Transport.send(message);
					rs5.close();
				}
				rs3.close();
				ResultSet rs4 = stmt1.executeQuery("SELECT username,regdate FROM register_data WHERE flag='wait' ORDER BY regdate ASC");
// show new register user
%>
				<FORM name="detail" method="POST" action="<%= HttpPortletRendererUtil.htmlFormActionLink(request,PortletRendererUtil.PAGE_LINK) %>" >
				<%= HttpPortletRendererUtil.htmlFormHiddenFields(request,PortletRendererUtil.PAGE_LINK) %>

<%				if (rs4.next())
				{
					userflag=1;
					out.println("<BR><B>New register user : </B><BR>");
					out.println("<input type=\"RADIO\" name=NewRegister value=\""+rs4.getString("username")+"\" checked>");
					out.println(	rs4.getString("username")+" -- "+rs4.getString("regdate"));
					out.println("<BR>");
				}
				while (rs4.next())
				{
					out.println("<input type=\"RADIO\" name=NewRegister value=\""+rs4.getString("username")+"\">");
					out.println(	rs4.getString("username")+" -- "+rs4.getString("regdate"));
					out.println("<BR>");
				}
				if (userflag==1)
				{
					out.println("<center><input type=submit name=\"submit\" value=\"Detail new user\"></center>");
					out.println("</FORM>");
				}
				rs4.close();
			}
// close database connection
			stmt1.close();
			stmt2.close();
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
%>
</FONT>
</BODY>
</HTML>
