<%@ page import = "oracle.portal.provider.v1.*, oracle.portal.provider.v1.http.*, java.sql.*, java.lang.*, java.util.Date"  session="false" %>
<form name="browses" method="POST" action="<%= HttpPortletRendererUtil.htmlFormActionLink(request,PortletRendererUtil.PAGE_LINK) %>">
<%= HttpPortletRendererUtil.htmlFormHiddenFields(request,PortletRendererUtil.PAGE_LINK) %>
<%    PortletRenderRequest portletRequest = (PortletRenderRequest)request.getAttribute(HttpProvider.PORTLET_RENDER_REQUEST);%>

<%

	String uname = new String(portletRequest.getUser().getName().toUpperCase());
	int adminflag = 0;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
// Check user if not portal admin
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM WWSEC_MEMBER_GROUPS WHERE GROUP_NAME='PORTAL_ADMINISTRATORS' and USER_NAME='"+uname+"'");
		if (rs.next()) { adminflag = 1; }
		rs.close();
// Query page that permission to view
		if (adminflag == 1)
		{
%>
<input type="hidden" name="uname" value="admin">
<%
		}
		else
		{
%>
<input type="hidden" name="uname" value="<%= uname %>">
<%
		}
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


    if (new String(request.getParameter("submit")).equals("selected")) 
    {
	out.println("<FONT CLASS=\"PortletText1\">");

//Select browse webdata
	if ((new String(request.getParameter("browsing")).equals("webdata"))||(request.getParameter("browsing"))==null)
	{
%>
<input type="hidden" name="form" value="webform">
<%
	out.println("<FONT CLASS=\"PortletHeading1\">");
	out.println("<BR>&nbsp;&nbsp;&nbsp;&nbsp;<I>Browse webpage data report</I><BR>");
	out.println("</FONT>");

	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
		Statement stmt1 = con.createStatement();
// Query page that permission to view
		ResultSet rs1_2;
		if (adminflag == 1)
		{
			rs1_2 = stmt1.executeQuery("SELECT distinct NAME FROM WWLOG_ACTIVITY_LOGS WHERE SUB_DOMAIN='page'");
		}
		else
		{
			rs1_2 = stmt1.executeQuery("SELECT distinct NAME FROM WWLOG_ACTIVITY_LOGS WHERE SUB_DOMAIN='page' and ACTION='edit' and USERID='"+uname+"'");
		}
%>
<BR>
<TABLE>
	<TR>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			Choose webpage 
			</FONT>
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<SELECT name="choosewebpage">
<%
		if (rs1_2.next())
		{
%>
<option>
ALL
</option>
<%
			String pname;
			out.println("<option>");
			pname = new String(rs1_2.getString("NAME"));
			out.println(pname.substring(5,pname.length()-1));
			out.println("</option>");
			while (rs1_2.next())
			{
				out.println("<option>");
				pname = new String(rs1_2.getString("NAME"));
				out.println(pname.substring(5,pname.length()-1));
				out.println("</option>");
			}
		}
		else
		{
%>
<option>
-
</option>
<%
		}
		rs1_2.close();
		stmt1.close();
%>
			</SELECT>
			</FONT>
		</TD>
	</TR>
	<TR>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			View in Domain
			</FONT>
		</TD>
	</TR>
	<TR>
		<TD>
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<input type="RADIO" name="domain" value="user" checked> User domain 
			</FONT>
		</TD>
	</TR>
	<TR>
		<TD>
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<input type="RADIO" name="domain" value="time"> Time domain ( 8 periods per day )
			</FONT>
		</TD>
	</TR>
</TABLE>
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
<CENTER>
<TABLE>
	<TR>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	From 
	</FONT>
	</TD>
	<TD>
			<SELECT name="from_month">
			<OPTION value="01">Jan</OPTION>
			<OPTION value="02">Feb</OPTION>
			<OPTION value="03">Mar</OPTION>
			<OPTION value="04">Apr</OPTION>
			<OPTION value="05">May</OPTION>
			<OPTION value="06">Jun</OPTION>
			<OPTION value="07">Jul</OPTION>
			<OPTION value="08">Aug</OPTION>
			<OPTION value="09">Sep</OPTION>
			<OPTION value="10">Oct</OPTION>
			<OPTION value="11">Nov</OPTION>
			<OPTION value="12">Dec</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="from_date">
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23">23</OPTION>
			<OPTION value="24">24</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="26">26</OPTION>
			<OPTION value="27">27</OPTION>
			<OPTION value="28">28</OPTION>
			<OPTION value="29">29</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="31">31</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="from_year">
			<OPTION value="1993">1993</OPTION>
			<OPTION value="1994">1994</OPTION>
			<OPTION value="1995">1995</OPTION>
			<OPTION value="1996">1996</OPTION>
			<OPTION value="1997">1997</OPTION>
			<OPTION value="1998">1998</OPTION>
			<OPTION value="1999">1999</OPTION>
			<OPTION value="2000">2000</OPTION>
			<OPTION value="2001">2001</OPTION>
			<OPTION value="2002">2002</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		HH :
		</FONT>
	</TD>
	<TD>
			<SELECT name="from_hh">
			<OPTION value="00">00</OPTION>
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23">23</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		MM :
		</FONT>
	</TD>
	<TD>
			<SELECT name="from_mm">
			<OPTION value="00">00</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="35">35</OPTION>
			<OPTION value="40">40</OPTION>
			<OPTION value="45">45</OPTION>
			<OPTION value="50">50</OPTION>
			<OPTION value="55">55</OPTION>
			<OPTION value="59">59</OPTION>
			</SELECT>
	</TD>
	</TR>
	<TR>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		To 
		</FONT>
	</TD>
	<TD>
			<SELECT name="to_month">
			<OPTION value="01">Jan</OPTION>
			<OPTION value="02">Feb</OPTION>
			<OPTION value="03" selected>Mar</OPTION>
			<OPTION value="04">Apr</OPTION>
			<OPTION value="05">May</OPTION>
			<OPTION value="06">Jun</OPTION>
			<OPTION value="07">Jul</OPTION>
			<OPTION value="08">Aug</OPTION>
			<OPTION value="09">Sep</OPTION>
			<OPTION value="10">Oct</OPTION>
			<OPTION value="11">Nov</OPTION>
			<OPTION value="12">Dec</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="to_date">
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20" selected>20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23">23</OPTION>
			<OPTION value="24">24</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="26">26</OPTION>
			<OPTION value="27">27</OPTION>
			<OPTION value="28">28</OPTION>
			<OPTION value="29">29</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="31">31</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="to_year">
			<OPTION value="1993">1993</OPTION>
			<OPTION value="1994">1994</OPTION>
			<OPTION value="1995">1995</OPTION>
			<OPTION value="1996">1996</OPTION>
			<OPTION value="1997">1997</OPTION>
			<OPTION value="1998">1998</OPTION>
			<OPTION value="1999">1999</OPTION>
			<OPTION value="2000">2000</OPTION>
			<OPTION value="2001">2001</OPTION>
			<OPTION value="2002" selected>2002</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		HH :
		</FONT>
	</TD>
	<TD>
			<SELECT name="to_hh">
			<OPTION value="00">00</OPTION>
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23" selected>23</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		MM :
		</FONT>
	</TD>
	<TD>
			<SELECT name="to_mm">
			<OPTION value="00">00</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="35">35</OPTION>
			<OPTION value="40">40</OPTION>
			<OPTION value="45">45</OPTION>
			<OPTION value="50">50</OPTION>
			<OPTION value="55">55</OPTION>
			<OPTION value="59" selected>59</OPTION>
			</SELECT>
	</TD>
	</TR>
</TABLE>
<BR>
<TABLE>
	<TR>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	Group lists<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	<TD>
	</TD>
	</TR>

<%
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery("SELECT distinct GROUP_NAME FROM WWSEC_MEMBER_GROUPS");
		while (rs2.next())
		{
%>
	<TR>
	<TD>
	</TD>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
<%
			out.println("<INPUT type=\"checkbox\" name=\"grouplist\" value=\"" + rs2.getString(1) + "\" CHECKED>" + rs2.getString(1));
%>
	</FONT>
	</TD>
	<TD>
	</TD>
	</TR>
<%
		}
		rs2.close();
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
%>

	<TR>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	Graphs<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	<input type="RADIO" name="graph" value="bar" CHECKED> Bar graph<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	<input type="RADIO" name="graph" value="line"> Line graph<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	<input type="RADIO" name="graph" value="pie"> Pie graph<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	</TD>
	<TD align="right">
		<input type="RESET" name="CLEAR" value="RESET">
		<input type="SUBMIT" name="SUBMITWEBDATA" value="SUBMIT">		
	</TD>
	</TR>

</TABLE>
</CENTER>

</FONT>

<%
	}
//Browse Login data report
	else if (new String(request.getParameter("browsing")).equals("logindata"))
	{
		out.println("<FONT CLASS=\"PortletHeading1\">");
		out.println("<BR>&nbsp;&nbsp;&nbsp;&nbsp;<I>Browse login data report</I><BR>");
		out.println("</FONT><BR>");
		
%>
<input type="hidden" name="form" value="loginform">
<TABLE>
	<TR>
		<TD>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<input type="RADIO" name="loginmode.radio" value="user" checked>User
			</FONT>
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<SELECT name="loginmode.select1">
			<OPTION value="all">ALL</OPTION>
<%
// query user name
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
			Statement stmt1 = con1.createStatement();
			ResultSet rs1 = stmt1.executeQuery("select distinct user_name from wwsec_member_groups");
			while (rs1.next())
			{
%>
<OPTION value="<%= rs1.getString(1) %>"><%= rs1.getString(1) %></OPTION>
<%
			}
			rs1.close();
			stmt1.close();
			con1.close();
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
			</SELECT>
			</FONT>
		</TD>
	</TR>
	<TR>
		<TD>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<input type="RADIO" name="loginmode.radio" value="group">Group
			</FONT>
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<SELECT name="loginmode.select2">
			<OPTION value="all">ALL</OPTION>
<%
// query user name
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
			Statement stmt2 = con2.createStatement();
			ResultSet rs2 = stmt2.executeQuery("select distinct group_name from wwsec_member_groups");
			while (rs2.next())
			{
%>
<OPTION value="<%= rs2.getString(1) %>"><%= rs2.getString(1) %></OPTION>
<%
			}
			rs2.close();
			stmt2.close();
			con2.close();
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
			</SELECT>
			</FONT>
		</TD>
	</TR>
</TABLE>
<BR>
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
<CENTER>
<TABLE>
	<TR>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	From 
	</FONT>
	</TD>
	<TD>
			<SELECT name="from_month">
			<OPTION value="01">Jan</OPTION>
			<OPTION value="02">Feb</OPTION>
			<OPTION value="03">Mar</OPTION>
			<OPTION value="04">Apr</OPTION>
			<OPTION value="05">May</OPTION>
			<OPTION value="06">Jun</OPTION>
			<OPTION value="07">Jul</OPTION>
			<OPTION value="08">Aug</OPTION>
			<OPTION value="09">Sep</OPTION>
			<OPTION value="10">Oct</OPTION>
			<OPTION value="11">Nov</OPTION>
			<OPTION value="12">Dec</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="from_date">
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23">23</OPTION>
			<OPTION value="24">24</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="26">26</OPTION>
			<OPTION value="27">27</OPTION>
			<OPTION value="28">28</OPTION>
			<OPTION value="29">29</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="31">31</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="from_year">
			<OPTION value="1993">1993</OPTION>
			<OPTION value="1994">1994</OPTION>
			<OPTION value="1995">1995</OPTION>
			<OPTION value="1996">1996</OPTION>
			<OPTION value="1997">1997</OPTION>
			<OPTION value="1998">1998</OPTION>
			<OPTION value="1999">1999</OPTION>
			<OPTION value="2000">2000</OPTION>
			<OPTION value="2001">2001</OPTION>
			<OPTION value="2002">2002</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		HH :
		</FONT>
	</TD>
	<TD>
			<SELECT name="from_hh">
			<OPTION value="00">00</OPTION>
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23">23</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		MM :
		</FONT>
	</TD>
	<TD>
			<SELECT name="from_mm">
			<OPTION value="00">00</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="35">35</OPTION>
			<OPTION value="40">40</OPTION>
			<OPTION value="45">45</OPTION>
			<OPTION value="50">50</OPTION>
			<OPTION value="55">55</OPTION>
			<OPTION value="59">59</OPTION>
			</SELECT>
	</TD>
	</TR>
	<TR>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		To 
		</FONT>
	</TD>
	<TD>
			<SELECT name="to_month">
			<OPTION value="01">Jan</OPTION>
			<OPTION value="02">Feb</OPTION>
			<OPTION value="03" selected>Mar</OPTION>
			<OPTION value="04">Apr</OPTION>
			<OPTION value="05">May</OPTION>
			<OPTION value="06">Jun</OPTION>
			<OPTION value="07">Jul</OPTION>
			<OPTION value="08">Aug</OPTION>
			<OPTION value="09">Sep</OPTION>
			<OPTION value="10">Oct</OPTION>
			<OPTION value="11">Nov</OPTION>
			<OPTION value="12">Dec</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="to_date">
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20" selected>20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23">23</OPTION>
			<OPTION value="24">24</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="26">26</OPTION>
			<OPTION value="27">27</OPTION>
			<OPTION value="28">28</OPTION>
			<OPTION value="29">29</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="31">31</OPTION>
			</SELECT>
	</TD>
	<TD>
			<SELECT name="to_year">
			<OPTION value="1993">1993</OPTION>
			<OPTION value="1994">1994</OPTION>
			<OPTION value="1995">1995</OPTION>
			<OPTION value="1996">1996</OPTION>
			<OPTION value="1997">1997</OPTION>
			<OPTION value="1998">1998</OPTION>
			<OPTION value="1999">1999</OPTION>
			<OPTION value="2000">2000</OPTION>
			<OPTION value="2001">2001</OPTION>
			<OPTION value="2002" selected>2002</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		HH :
		</FONT>
	</TD>
	<TD>
			<SELECT name="to_hh">
			<OPTION value="00">00</OPTION>
			<OPTION value="01">01</OPTION>
			<OPTION value="02">02</OPTION>
			<OPTION value="03">03</OPTION>
			<OPTION value="04">04</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="06">06</OPTION>
			<OPTION value="07">07</OPTION>
			<OPTION value="08">08</OPTION>
			<OPTION value="09">09</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="11">11</OPTION>
			<OPTION value="12">12</OPTION>
			<OPTION value="13">13</OPTION>
			<OPTION value="14">14</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="16">16</OPTION>
			<OPTION value="17">17</OPTION>
			<OPTION value="18">18</OPTION>
			<OPTION value="19">19</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="21">21</OPTION>
			<OPTION value="22">22</OPTION>
			<OPTION value="23" selected>23</OPTION>
			</SELECT>
	</TD>
	<TD>
		<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
		MM :
		</FONT>
	</TD>
	<TD>
			<SELECT name="to_mm">
			<OPTION value="00">00</OPTION>
			<OPTION value="05">05</OPTION>
			<OPTION value="10">10</OPTION>
			<OPTION value="15">15</OPTION>
			<OPTION value="20">20</OPTION>
			<OPTION value="25">25</OPTION>
			<OPTION value="30">30</OPTION>
			<OPTION value="35">35</OPTION>
			<OPTION value="40">40</OPTION>
			<OPTION value="45">45</OPTION>
			<OPTION value="50">50</OPTION>
			<OPTION value="55">55</OPTION>
			<OPTION value="59" selected>59</OPTION>
			</SELECT>
	</TD>
	</TR>
</TABLE>
<BR>
<TABLE>
	<TR>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	Graphs<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	<input type="RADIO" name="graph" value="bar" checked> Bar graph<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	<input type="RADIO" name="graph" value="line"> Line graph<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
	<input type="RADIO" name="graph" value="pie"> Pie graph<BR>
	</FONT>
	</TD>
	<TD>
	</TD>
	</TR>

	<TR>
	<TD>
	</TD>
	<TD>
	</TD>
	<TD align="right">
		<input type="RESET" name="CLEAR" value="RESET">
		<input type="SUBMIT" name="SUBMITLOGINDATA" value="SUBMIT">		
	</TD>
	</TR>

</TABLE>
</CENTER>

<%
	}
// Browse event data report
	else if (new String(request.getParameter("browsing")).equals("eventdata"))
	{
	out.println("<FONT CLASS=\"PortletHeading1\">");
	out.println("<BR>&nbsp;&nbsp;&nbsp;&nbsp;<I>Browse event data report</I><BR><BR>");
	out.println("</FONT>");

%>

<TABLE align="CENTER">
	<TR>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			Choose user 
			</FONT>
		</TD>
		<TD>
			<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
			<SELECT name="user">
<%
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT distinct user_name FROM WWSEC_MEMBER_GROUPS");
		while (rs.next())
		{
			out.println("<OPTION value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</OPTION>");
		}
		rs.close();
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
			</SELECT>
			</FONT>
		</TD>
	<TD align="right">
		<input type="SUBMIT" name="SUBMITEVENTDATA" value="SUBMIT">		
	</TD>
	</TR>
</TABLE>
<%
	}
	else
	{
		out.println("Failed!");
	}
	out.println("</FONT>");
    }
   else 
   {
	out.println("<FONT CLASS=\"PortletHeading1\">");
	out.println("<BR><BR><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please select a kind of reports from your left page.");
	out.println("<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<----");
	out.println("</FONT>");
   }
%>
</form>
