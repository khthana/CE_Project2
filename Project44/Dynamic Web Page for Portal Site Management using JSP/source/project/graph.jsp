<%@ page import = "oracle.portal.provider.v1.*, oracle.portal.provider.v1.http.*, java.sql.*, java.text.*, java.lang.*, java.util.Date, PortalUtil"  session="false" %>

<HTML>
<BODY>
<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
<%! String[] groups; %>
<%
// Submit Web data report
	String tmp,tmp1,tmp2;

	if (request.getParameter("SUBMITWEBDATA")!=null)
	{
		tmp = new String(request.getParameter("SUBMITWEBDATA"));
	}
	else
	{
		tmp="no";
	}
	if (request.getParameter("SUBMITLOGINDATA")!=null)
	{
		tmp1 = new String(request.getParameter("SUBMITLOGINDATA"));
	}
	else 
	{
		tmp1="no";
	}
	if (request.getParameter("SUBMITEVENTDATA")!=null)
	{
		tmp2 = new String(request.getParameter("SUBMITEVENTDATA"));
	}
	else 
	{
		tmp2="no";
	}

	if (tmp.equals("SUBMIT"))
	{
	  if (request.getParameter("grouplist")!=null)
	 {
//-----
	String fromday		= new String(request.getParameter("from_date"));
	String frommonth	= new String(request.getParameter("from_month"));
	String fromyear		= new String(request.getParameter("from_year"));
	String fromhr		= new String(request.getParameter("from_hh"));
	String frommin		= new String(request.getParameter("from_mm"));
	String today		= new String(request.getParameter("to_date"));
	String tomonth		= new String(request.getParameter("to_month"));
	String toyear		= new String(request.getParameter("to_year"));
	String tohr			= new String(request.getParameter("to_hh"));
	String tomin		= new String(request.getParameter("to_mm"));
	String uname		= new String(request.getParameter("uname"));
	String graph		= new String(request.getParameter("graph"));
	String form			= new String(request.getParameter("form"));
	String fdaterule = new String("to_date('"+fromyear+"-"+frommonth+"-"+fromday+" "+fromhr+":"+frommin+"','YYYY-MM-DD HH24:MI')");
	String tdaterule = new String("to_date('"+toyear+"-"+tomonth+"-"+today+" "+tohr+":"+tomin+"','YYYY-MM-DD HH24:MI')");
	String timesub = new String("select id from wwlog_activity_logs where start_time between "+fdaterule+" and "+tdaterule);

	String mainstmt = new String();

	String datalist[] = new String[10];
	int sectotal[] = {0,0,0,0,0,0,0,0,0,0};
	int datacount = 0;

// webpage data form
	if (form.equals("webform"))
	{
		String pagerule = new String("select distinct name from wwlog_activity_logs where sub_domain='page' and action='edit' and userid='"+uname+"'");

		String pagename = new String(request.getParameter("choosewebpage"));
		String domain = new String(request.getParameter("domain"));

		String glist[];
		StringBuffer userrule = new StringBuffer("select distinct user_name from wwsec_member_groups where");
		if (request.getParameter("grouplist")!=null)
		{
			glist=request.getParameterValues("grouplist");
		    if (glist != null) 
			{
				userrule.append(" group_name='"+glist[0]+"'");
				for (int i = 1; i < glist.length; i++) 
				{
					userrule.append(" or group_name='"+glist[i]+"'");
				}
			}
		}

// view in time domain
		if (domain.equals("time"))
		{
// admin
			if (uname.equals("admin"))
			{
// view all page
				mainstmt = new String("select to_char(start_time,'HH24') from wwlog_activity_logs where id in ("+timesub+") and userid in ("+userrule+") and action='view' and sub_domain='page'");
				if (pagename.equals("ALL"))
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt);
						while (rs1.next())
						{
							if (rs1.getInt(1)<3) { sectotal[0] = sectotal[0] + 1; }
							else if (rs1.getInt(1)<6) { sectotal[1] = sectotal[1] + 1; }
							else if (rs1.getInt(1)<9) { sectotal[2] = sectotal[2] + 1; }
							else if (rs1.getInt(1)<12) { sectotal[3] = sectotal[3] + 1; }
							else if (rs1.getInt(1)<15) { sectotal[4] = sectotal[4] + 1; }
							else if (rs1.getInt(1)<18) { sectotal[5] = sectotal[5] + 1; }
							else if (rs1.getInt(1)<21) { sectotal[6] = sectotal[6] + 1; }
							else { sectotal[7] = sectotal[7] + 1; }
						}
						rs1.close();
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
				else
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt + " and name='PAGE/"+pagename+"/'");
						while (rs1.next())
						{
							if (rs1.getInt(1)<3) { sectotal[0] = sectotal[0] + 1; }
							else if (rs1.getInt(1)<6) { sectotal[1] = sectotal[1] + 1; }
							else if (rs1.getInt(1)<9) { sectotal[2] = sectotal[2] + 1; }
							else if (rs1.getInt(1)<12) { sectotal[3] = sectotal[3] + 1; }
							else if (rs1.getInt(1)<15) { sectotal[4] = sectotal[4] + 1; }
							else if (rs1.getInt(1)<18) { sectotal[5] = sectotal[5] + 1; }
							else if (rs1.getInt(1)<21) { sectotal[6] = sectotal[6] + 1; }
							else { sectotal[7] = sectotal[7] + 1; }
						}
						rs1.close();
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
			}
// normal user
			else
			{
				mainstmt = new String("select to_char(start_time,'HH24') from wwlog_activity_logs where id in ("+timesub+") and userid in ("+userrule+") and action='view' and sub_domain='page' and name in ("+pagerule+")");
				if (pagename.equals("ALL"))
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt);
						while (rs1.next())
						{
							if (rs1.getInt(1)<3) { sectotal[0] = sectotal[0] + 1; }
							else if (rs1.getInt(1)<6) { sectotal[1] = sectotal[1] + 1; }
							else if (rs1.getInt(1)<9) { sectotal[2] = sectotal[2] + 1; }
							else if (rs1.getInt(1)<12) { sectotal[3] = sectotal[3] + 1; }
							else if (rs1.getInt(1)<15) { sectotal[4] = sectotal[4] + 1; }
							else if (rs1.getInt(1)<18) { sectotal[5] = sectotal[5] + 1; }
							else if (rs1.getInt(1)<21) { sectotal[6] = sectotal[6] + 1; }
							else { sectotal[7] = sectotal[7] + 1; }
						}
						rs1.close();
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
				else
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt + " and name='PAGE/"+pagename+"/'");
						while (rs1.next())
						{
							if (rs1.getInt(1)<3) { sectotal[0] = sectotal[0] + 1; }
							else if (rs1.getInt(1)<6) { sectotal[1] = sectotal[1] + 1; }
							else if (rs1.getInt(1)<9) { sectotal[2] = sectotal[2] + 1; }
							else if (rs1.getInt(1)<12) { sectotal[3] = sectotal[3] + 1; }
							else if (rs1.getInt(1)<15) { sectotal[4] = sectotal[4] + 1; }
							else if (rs1.getInt(1)<18) { sectotal[5] = sectotal[5] + 1; }
							else if (rs1.getInt(1)<21) { sectotal[6] = sectotal[6] + 1; }
							else { sectotal[7] = sectotal[7] + 1; }
						}
						rs1.close();
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
			}
// show graph
			if (graph.equals("bar"))
			{
				PortalUtil.MakeBarJpeg(String.valueOf(sectotal[0]) + "," + String.valueOf(sectotal[1]) + "," + String.valueOf(sectotal[2]) + "," + String.valueOf(sectotal[3]) + "," + String.valueOf(sectotal[4]) + "," + String.valueOf(sectotal[5]) + "," + String.valueOf(sectotal[6]) + "," + String.valueOf(sectotal[7]),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
			}
			else if (graph.equals("line"))
			{
				PortalUtil.MakeLineJpeg(String.valueOf(sectotal[0]) + "," + String.valueOf(sectotal[1]) + "," + String.valueOf(sectotal[2]) + "," + String.valueOf(sectotal[3]) + "," + String.valueOf(sectotal[4]) + "," + String.valueOf(sectotal[5]) + "," + String.valueOf(sectotal[6]) + "," + String.valueOf(sectotal[7]),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
			}
			else
			{
				PortalUtil.MakePieJpeg(String.valueOf(sectotal[0]) + "," + String.valueOf(sectotal[1]) + "," + String.valueOf(sectotal[2]) + "," + String.valueOf(sectotal[3]) + "," + String.valueOf(sectotal[4]) + "," + String.valueOf(sectotal[5]) + "," + String.valueOf(sectotal[6]) + "," + String.valueOf(sectotal[7]),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
			}
%>
	<img src="http://161.246.5.170/graph.jpg" align="LEFT">
<%
	out.println("<FONT CLASS=\"PortletHeading1\">");
	out.println("<BR>&nbsp;&nbsp;&nbsp;&nbsp;<I>Browse Webpage data report</I><BR>");
	out.println("</FONT><BR>");

	out.println("This graph is shown ");
	out.println(pagename+" webpage in time domain.<BR><BR>");
	out.println("from "+frommonth+"/"+fromday+"/"+fromyear+" ");
	out.println(fromhr+":"+frommin);
	out.println(" to "+tomonth+"/"+today+"/"+toyear+" ");
	out.println(tohr+":"+tomin+"<BR><BR>");
	out.println("Grouplist :");
	String glist1[];
	glist1=request.getParameterValues("grouplist");

		for (int i = 1; i < glist1.length; i++) 
		{
			out.println(glist1[i]+", ");
		}
	out.println("<BR><BR>");

	if (graph.equals("pie"))
	{
		DecimalFormat df2 = new DecimalFormat("##0.00");
				
		int secall;
		
		secall=sectotal[0]+sectotal[1]+sectotal[2]+sectotal[3]+sectotal[4]+sectotal[5]+sectotal[6]+sectotal[7];
		double sec0 = ((sectotal[0]*100)/secall);
		double sec1 = ((sectotal[1]*100)/secall);
		double sec2 = ((sectotal[2]*100)/secall);
		double sec3 = ((sectotal[3]*100)/secall);
		double sec4 = ((sectotal[4]*100)/secall);
		double sec5 = ((sectotal[5]*100)/secall);
		double sec6 = ((sectotal[6]*100)/secall);
		double sec7 = ((sectotal[7]*100)/secall);

		out.println("<TABLE align=\"center\">");
		out.println("<IMG src=\"http://161.246.5.170/1.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;0:00 - 2:59 TM ");
		out.println("("+String.valueOf(sectotal[0])+","+df2.format(sec0)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/2.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;3:00 - 5:59 TM ");
		out.println("("+String.valueOf(sectotal[1])+","+df2.format(sec1)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/3.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;6:00 - 8:59 TM ");
		out.println("("+String.valueOf(sectotal[2])+","+df2.format(sec2)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/4.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;9:00 - 11:59 TM ");
		out.println("("+String.valueOf(sectotal[3])+","+df2.format(sec3)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/5.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;12:00 - 14:59 TM ");
		out.println("("+String.valueOf(sectotal[4])+","+df2.format(sec4)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/6.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;15:00 - 17:59 TM ");
		out.println("("+String.valueOf(sectotal[5])+","+df2.format(sec5)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/7.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;18:00 - 20:59 TM ");
		out.println("("+String.valueOf(sectotal[6])+","+df2.format(sec6)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/8.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;21:00 - 23:59 TM ");
		out.println("("+String.valueOf(sectotal[7])+","+df2.format(sec7)+"%)<BR>");
		out.println("</TABLE>	");
	}
	else if (graph.equals("bar"))
	{
			out.println(" Y axis = Times<BR>");
			out.println(" X axis = Period<BR><BR>");
%>
		<TABLE align="center">
		<IMG src="http://161.246.5.170/1.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;0:00 - 2:59 TM<BR>
		<IMG src="http://161.246.5.170/2.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;3:00 - 5:59 TM<BR>
		<IMG src="http://161.246.5.170/3.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;6:00 - 8:59 TM<BR>
		<IMG src="http://161.246.5.170/4.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;9:00 - 11:59 TM<BR>
		<IMG src="http://161.246.5.170/5.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;12:00 - 14:59 TM<BR>
		<IMG src="http://161.246.5.170/6.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;15:00 - 17:59 TM<BR>
		<IMG src="http://161.246.5.170/7.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;18:00 - 20:59 TM<BR>
		<IMG src="http://161.246.5.170/8.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;21:00 - 23:59 TM<BR>
		</TABLE>	
<%
	}
	else // Line graph
	{
			out.println(" Y axis = Times<BR>");
			out.println(" X axis = Period<BR><BR>");
%>
		<TABLE align="center">
		(1)&nbsp;&nbsp;&nbsp;0:00 - 2:59 TM<BR>
		(2)&nbsp;&nbsp;&nbsp;3:00 - 5:59 TM<BR>
		(3)&nbsp;&nbsp;&nbsp;6:00 - 8:59 TM<BR>
		(4)&nbsp;&nbsp;&nbsp;9:00 - 11:59 TM<BR>
		(5)&nbsp;&nbsp;&nbsp;12:00 - 14:59 TM<BR>
		(6)&nbsp;&nbsp;&nbsp;15:00 - 17:59 TM<BR>
		(7)&nbsp;&nbsp;&nbsp;18:00 - 20:59 TM<BR>
		(8)&nbsp;&nbsp;&nbsp;21:00 - 23:59 TM<BR>
		</TABLE>	
<%
	}

		}
// view in user domain
		else
		{
// admin
			mainstmt = new String("select userid,count(*) from wwlog_activity_logs where sub_domain='page' and action='view' and id in ("+timesub+") and userid in ("+userrule+")");
			if (uname.equals("admin"))
			{
// view all page
				if (pagename.equals("ALL"))
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt + " group by userid");
						while (rs1.next())
						{
							if (datacount < 10)
							{
								datalist[datacount] = new String(rs1.getString("userid"));
								sectotal[datacount] = rs1.getInt(2);
								datacount = datacount + 1;
							}
						}
						rs1.close();
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
// view 1 page
				else
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt + " and name='PAGE/"+pagename+"/' group by userid");
						while (rs1.next())
						{
							if (datacount < 10)
							{
								datalist[datacount] = new String(rs1.getString("userid"));
								sectotal[datacount] = rs1.getInt(2);
								datacount = datacount + 1;
							}
						}
						rs1.close();
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
// create graph
				StringBuffer stb1 = new StringBuffer(String.valueOf(sectotal[0]));
				for (int j=2;j<datacount;j++)
				{
					stb1.append(","+String.valueOf(sectotal[j]));
				}
				if (graph.equals("bar"))
				{
					PortalUtil.MakeBarJpeg(stb1.toString(),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
				}
				else if (graph.equals("line"))
				{
					PortalUtil.MakeLineJpeg(stb1.toString(),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
				}
				else
				{
					PortalUtil.MakePieJpeg(stb1.toString(),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
				}
			}
// normal user
			else
			{
// view all page
				if (pagename.equals("ALL"))
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt + " and name in ("+pagerule+") group by userid");
						while (rs1.next())
						{
							if (datacount < 10)
							{
								datalist[datacount] = new String(rs1.getString("userid"));
								sectotal[datacount] = rs1.getInt(2);
								datacount = datacount + 1;
							}
						}
						rs1.close();
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
// view 1 page
				else
				{
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery(mainstmt + " and name='PAGE/"+pagename+"/' group by userid");
						while (rs1.next())
						{
							if (datacount < 10)
							{
								datalist[datacount] = new String(rs1.getString("userid"));
								sectotal[datacount] = rs1.getInt(2);
								datacount = datacount + 1;
							}
						}
						rs1.close();
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
// create graph
				StringBuffer stb2 = new StringBuffer(String.valueOf(sectotal[0]));
				for (int j=2;j<datacount;j++)
				{
					stb2.append(","+String.valueOf(sectotal[j]));
				}
				if (graph.equals("bar"))
				{
					PortalUtil.MakeBarJpeg(stb2.toString(),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
				}
				else if (graph.equals("line"))
				{
					PortalUtil.MakeLineJpeg(stb2.toString(),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
				}
				else
				{
					PortalUtil.MakePieJpeg(stb2.toString(),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
				}
			}
%>
<img src = "http://161.246.5.170/graph.jpg" align="LEFT">
<%
	out.println("<FONT CLASS=\"PortletHeading1\">");
	out.println("<BR>&nbsp;&nbsp;&nbsp;&nbsp;<I>Browse Webpage data report</I><BR>");
	out.println("</FONT><BR>");

	out.println("This graph is shown ");
	out.println(pagename+" webpage in user domain.<BR><BR>");
	out.println("from "+frommonth+"/"+fromday+"/"+fromyear+" ");
	out.println(fromhr+":"+frommin);
	out.println(" to "+tomonth+"/"+today+"/"+toyear+" ");
	out.println(tohr+":"+tomin+"<BR><BR>");
	out.println("Grouplist :");
	String glist2[];
	glist2=request.getParameterValues("grouplist");

		for (int i = 1; i < glist2.length; i++) 
		{
			out.println(glist2[i]+", ");
		}
	out.println("<BR><BR>");
	if (graph.equals("pie"))
	{
		DecimalFormat df2 = new DecimalFormat("##0.00");
				
		int secall=0;
		double sec[] =new double[10];
		for (int i=0 ; i<(datacount-1) ; i++ )
		{
			secall=secall+sectotal[i];
		}
		for (int i=0 ; i<(datacount-1) ; i++ )
		{
			sec[i]=((sectotal[i]*100)/secall);
		}
		out.println("<TABLE align=\"center\">");
		for (int i=0 ; i<(datacount-1) ; i++ )
		{
			out.println("<IMG src=\"http://161.246.5.170/"+(i+1)+".gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp; "+datalist[i]);
			out.println("("+String.valueOf(sectotal[i])+","+df2.format(sec[i])+"%)<BR>");
		}
		out.println("</TABLE>	");
	}
	else if (graph.equals("bar"))
	{
			out.println(" Y axis = Times<BR>");
			out.println(" X axis = User<BR><BR>");

		out.println("<TABLE align=\"center\">");
		for (int i=0 ; i<(datacount-1) ; i++)
		{
			out.println("<IMG src=\"http://161.246.5.170/"+(i+1)+".gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp; "+datalist[i]+"<BR>");
		}
		out.println("</TABLE>	");
	}
	else // Line graph
	{
			out.println(" Y axis = Times<BR>");
			out.println(" X axis = User<BR><BR>");
		out.println("<TABLE align=\"center\">");
		for (int i=0 ; i<(datacount-1) ; i++)
		{
			out.println("("+(i+1)+")&nbsp;&nbsp;&nbsp; "+datalist[i]+"<BR>");
		}
		out.println("</TABLE>	");
	}// end else

		}
	}
//-----
     }// End if check null
	  else
	  {
			out.println("<center><B><BR>Incompletely form! Please try again.</B></center>");
	  }//End else check null
	} // End  web page data report

// Submit Login data report
	if (tmp1.equals("SUBMIT"))
	{
//-----
// Parameter receive
	String fromday		= new String(request.getParameter("from_date"));
	String frommonth	= new String(request.getParameter("from_month"));
	String fromyear		= new String(request.getParameter("from_year"));
	String fromhr		= new String(request.getParameter("from_hh"));
	String frommin		= new String(request.getParameter("from_mm"));
	String today		= new String(request.getParameter("to_date"));
	String tomonth		= new String(request.getParameter("to_month"));
	String toyear		= new String(request.getParameter("to_year"));
	String tohr			= new String(request.getParameter("to_hh"));
	String tomin		= new String(request.getParameter("to_mm"));
	String uname		= new String(request.getParameter("uname"));
	String view			= new String(request.getParameter("loginmode.radio"));
	String username		= new String(request.getParameter("loginmode.select1"));
	String groupname	= new String(request.getParameter("loginmode.select2"));
	String graph		= new String(request.getParameter("graph"));
	String form			= new String(request.getParameter("form"));

	String fdaterule = new String("to_date('"+fromyear+"-"+frommonth+"-"+fromday+" "+fromhr+":"+frommin+"','YYYY-MM-DD HH24:MI')");
	String tdaterule = new String("to_date('"+toyear+"-"+tomonth+"-"+today+" "+tohr+":"+tomin+"','YYYY-MM-DD HH24:MI')");
	String timesub = new String("select id from wwlog_activity_logs where start_time between "+fdaterule+" and "+tdaterule);
	String usersub = new String("select distinct user_name from wwsec_member_groups where group_name='"+groupname+"'");

	String mainstmt = new String();
	int sectotal[] = {0,0,0,0,0,0,0,0};

// check form
	if (form.equals("loginform"))
	{
// admin
		if (uname.equals("admin"))
		{
// view by user
			if (view.equals("user"))
			{
// view all user
				if (username.equals("all"))
				{
					mainstmt = new String("select to_char(start_time,'HH24') from wwlog_activity_logs where action='login' and id in ("+timesub+")");
				}
// view user
				else
				{
					mainstmt = new String("select to_char(start_time,'HH24') from wwlog_activity_logs where userid='"+username+"' and action='login' and id in ("+timesub+")");
				}
			}
// view by group
			else
			{
// view all group
				if (groupname.equals("all"))
				{
					mainstmt = new String("select to_char(start_time,'HH24') from wwlog_activity_logs where action='login' and id in ("+timesub+")");
				}
// view group
				else
				{
					mainstmt = new String("select to_char(start_time,'HH24') from wwlog_activity_logs where action='login' and id in ("+timesub+") and userid in ("+usersub+")");
				}
			}
		}
// normal user
		else
		{
			mainstmt = new String("select to_char(start_time,'HH24') from wwlog_activity_logs where userid='"+uname+"' and action='login' and id in ("+timesub+")");
		}
// generate graph
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
			Statement stmt1 = con.createStatement();
			ResultSet rs1 = stmt1.executeQuery(mainstmt);
			while (rs1.next())
			{
// out.println(rs1.getInt(1) + "<BR>");
				if (rs1.getInt(1)<3) { sectotal[0] = sectotal[0] + 1; }
				else if (rs1.getInt(1)<6) { sectotal[1] = sectotal[1] + 1; }
				else if (rs1.getInt(1)<9) { sectotal[2] = sectotal[2] + 1; }
				else if (rs1.getInt(1)<12) { sectotal[3] = sectotal[3] + 1; }
				else if (rs1.getInt(1)<15) { sectotal[4] = sectotal[4] + 1; }
				else if (rs1.getInt(1)<18) { sectotal[5] = sectotal[5] + 1; }
				else if (rs1.getInt(1)<21) { sectotal[6] = sectotal[6] + 1; }
				else { sectotal[7] = sectotal[7] + 1; }
			}
			rs1.close();
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
		if (graph.equals("bar"))
		{
			PortalUtil.MakeBarJpeg(String.valueOf(sectotal[0]) + "," + String.valueOf(sectotal[1]) + "," + String.valueOf(sectotal[2]) + "," + String.valueOf(sectotal[3]) + "," + String.valueOf(sectotal[4]) + "," + String.valueOf(sectotal[5]) + "," + String.valueOf(sectotal[6]) + "," + String.valueOf(sectotal[7]),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
		}
		else if (graph.equals("line"))
		{
			PortalUtil.MakeLineJpeg(String.valueOf(sectotal[0]) + "," + String.valueOf(sectotal[1]) + "," + String.valueOf(sectotal[2]) + "," + String.valueOf(sectotal[3]) + "," + String.valueOf(sectotal[4]) + "," + String.valueOf(sectotal[5]) + "," + String.valueOf(sectotal[6]) + "," + String.valueOf(sectotal[7]),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
		}
		else
		{
			PortalUtil.MakePieJpeg(String.valueOf(sectotal[0]) + "," + String.valueOf(sectotal[1]) + "," + String.valueOf(sectotal[2]) + "," + String.valueOf(sectotal[3]) + "," + String.valueOf(sectotal[4]) + "," + String.valueOf(sectotal[5]) + "," + String.valueOf(sectotal[6]) + "," + String.valueOf(sectotal[7]),"d:/oracle/ora9ias/apache/apache/htdocs/graph.jpg");
		}
	}
//-----
%>
	<img src = "http://161.246.5.170/graph.jpg" align="LEFT">
<%
	out.println("<FONT CLASS=\"PortletHeading1\">");
	out.println("<BR>&nbsp;&nbsp;&nbsp;&nbsp;<I>Browse login data report</I><BR>");
	out.println("</FONT><BR>");

	out.println("This graph is shown ");
	if (view.equals("user"))
	{
		out.println(username+" ");
	}
	else
	{
		out.println(groupname+" ");
	}
	out.println(view+" <BR><BR>");
	out.println("from "+frommonth+"/"+fromday+"/"+fromyear+" ");
	out.println(fromhr+":"+frommin);
	out.println(" to "+tomonth+"/"+today+"/"+toyear+" ");
	out.println(tohr+":"+tomin+"<BR><BR>");

	if (graph.equals("pie"))
	{
		DecimalFormat df2 = new DecimalFormat("##0.00");
				
		int secall;
		
		secall=sectotal[0]+sectotal[1]+sectotal[2]+sectotal[3]+sectotal[4]+sectotal[5]+sectotal[6]+sectotal[7];
		double sec0 = ((sectotal[0]*100)/secall);
		double sec1 = ((sectotal[1]*100)/secall);
		double sec2 = ((sectotal[2]*100)/secall);
		double sec3 = ((sectotal[3]*100)/secall);
		double sec4 = ((sectotal[4]*100)/secall);
		double sec5 = ((sectotal[5]*100)/secall);
		double sec6 = ((sectotal[6]*100)/secall);
		double sec7 = ((sectotal[7]*100)/secall);

		out.println("<TABLE align=\"center\">");
		out.println("<IMG src=\"http://161.246.5.170/1.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;0:00 - 2:59 TM ");
		out.println("("+String.valueOf(sectotal[0])+","+df2.format(sec0)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/2.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;3:00 - 5:59 TM ");
		out.println("("+String.valueOf(sectotal[1])+","+df2.format(sec1)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/3.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;6:00 - 8:59 TM ");
		out.println("("+String.valueOf(sectotal[2])+","+df2.format(sec2)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/4.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;9:00 - 11:59 TM ");
		out.println("("+String.valueOf(sectotal[3])+","+df2.format(sec3)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/5.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;12:00 - 14:59 TM ");
		out.println("("+String.valueOf(sectotal[4])+","+df2.format(sec4)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/6.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;15:00 - 17:59 TM ");
		out.println("("+String.valueOf(sectotal[5])+","+df2.format(sec5)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/7.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;18:00 - 20:59 TM ");
		out.println("("+String.valueOf(sectotal[6])+","+df2.format(sec6)+"%)<BR>");
		out.println("<IMG src=\"http://161.246.5.170/8.gif\" height=\"12\" width=\"25\">&nbsp;&nbsp;&nbsp;21:00 - 23:59 TM ");
		out.println("("+String.valueOf(sectotal[7])+","+df2.format(sec7)+"%)<BR>");
		out.println("</TABLE>	");
	}
	else if (graph.equals("bar"))
	{
			out.println(" Y axis = Times<BR>");
			out.println(" X axis = Period<BR><BR>");
%>
		<TABLE align="center">
		<IMG src="http://161.246.5.170/1.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;0:00 - 2:59 TM<BR>
		<IMG src="http://161.246.5.170/2.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;3:00 - 5:59 TM<BR>
		<IMG src="http://161.246.5.170/3.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;6:00 - 8:59 TM<BR>
		<IMG src="http://161.246.5.170/4.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;9:00 - 11:59 TM<BR>
		<IMG src="http://161.246.5.170/5.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;12:00 - 14:59 TM<BR>
		<IMG src="http://161.246.5.170/6.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;15:00 - 17:59 TM<BR>
		<IMG src="http://161.246.5.170/7.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;18:00 - 20:59 TM<BR>
		<IMG src="http://161.246.5.170/8.gif" height="12" width="25">&nbsp;&nbsp;&nbsp;21:00 - 23:59 TM<BR>
		</TABLE>	
<%
	}
	else // Line graph
	{
			out.println(" Y axis = Times<BR>");
			out.println(" X axis = Period<BR><BR>");
%>
		<TABLE align="center">
		(1)&nbsp;&nbsp;&nbsp;0:00 - 2:59 TM<BR>
		(2)&nbsp;&nbsp;&nbsp;3:00 - 5:59 TM<BR>
		(3)&nbsp;&nbsp;&nbsp;6:00 - 8:59 TM<BR>
		(4)&nbsp;&nbsp;&nbsp;9:00 - 11:59 TM<BR>
		(5)&nbsp;&nbsp;&nbsp;12:00 - 14:59 TM<BR>
		(6)&nbsp;&nbsp;&nbsp;15:00 - 17:59 TM<BR>
		(7)&nbsp;&nbsp;&nbsp;18:00 - 20:59 TM<BR>
		(8)&nbsp;&nbsp;&nbsp;21:00 - 23:59 TM<BR>
		</TABLE>	
<%
	}

	} // End  Login data report

// Submit Event data report
	if (tmp2.equals("SUBMIT"))
	{
	out.println("<FONT CLASS=\"PortletHeading1\">");
	out.println("<BR>&nbsp;&nbsp;&nbsp;&nbsp;<I>Browse event data report</I><BR><BR>");
	out.println("</FONT>");

%>		
		<TABLE align="CENTER" border="1" rules="cols">
			<TR bgcolor="FFFFCC">
				<TD>
					<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
					<B>USERNAME</B>
					</FONT>
				</TD>
				<TD>
					<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
					<B>EVENT</B>
					</FONT>
				</TD>
				<TD>
					<FONT FACE="MS Sans Serif" COLOR="000000" size=1>
					<B>TOTAL TIMES</B>
					</FONT>
				</TD>
			</TR>
<%
			out.println("<TR>");
			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");

			out.println(request.getParameter("user"));
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("Create");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD align=\"CENTER\">");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT count(*) FROM WWLOG_ACTIVITY_LOGS where action='create' and userid='"+request.getParameter("user")+"'");
				while (rs.next())
				{
					out.println(rs.getString(1));
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
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TR>");
			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("Edit");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD align=\"CENTER\">");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT count(*) FROM WWLOG_ACTIVITY_LOGS where action='edit' and userid='"+request.getParameter("user")+"'");
				while (rs.next())
				{
					out.println(rs.getString(1));
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
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TR>");
			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("Execute");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD align=\"CENTER\">");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT count(*) FROM WWLOG_ACTIVITY_LOGS where action='execute' and userid='"+request.getParameter("user")+"'");
				while (rs.next())
				{
					out.println(rs.getString(1));
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
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TR>");
			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("Add_to_page");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD align=\"CENTER\">");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT count(*) FROM WWLOG_ACTIVITY_LOGS where action='add_to_page' and userid='"+request.getParameter("user")+"'");
				while (rs.next())
				{
					out.println(rs.getString(1));
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
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TR>");
			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD>");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			out.println("Delete_to_page");
			out.println("</FONT>");
			out.println("</TD>");

			out.println("<TD align=\"CENTER\">");
			out.println("<FONT FACE=\"MS Sans Serif\" COLOR=\"000000\" size=1>");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@161.246.5.170:1521:orcl", "portal30", "portal30");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT count(*) FROM WWLOG_ACTIVITY_LOGS where action='delete_from_page' and userid='"+request.getParameter("user")+"'");
				while (rs.next())
				{
					out.println(rs.getString(1));
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
			out.println("</FONT>");
			out.println("</TD>");

			out.println("</TR>");

%>
		</TABLE>
<%				
	}

%>
</FONT>
</BODY>
</HTML>
