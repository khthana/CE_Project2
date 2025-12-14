import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;

public class s_e extends HttpServlet
{
	public void doGet (HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException
	{	
		Connection con = null;
		Statement stmt = null;
		ResultSet rs= null;

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		try
		{
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
		catch (java.sql.SQLException ko){ out.println("register error");}

		try
		{
			con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.184:1521:virtual","system", "manager");
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT title,abstract,url,cate FROM tt_describe where cate ='softeng'");
	
			out.println("<HTML><HEAD><TITLE>::<SEARCH RESULT>::</TITLE><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
			out.println("<style><!-- A:link, A:visited { text-decoration: underline; color: #ffffff}  A:hover { text-decoration: underline;  color :  #ccffff} // --> </style></head>");
			out.println("<BODY bgcolor=\"#FFFFFF\" background=\"http://161.246.5.184/back3.gif\">");
			out.println("<div align=\"center\"><img src=\"http://161.246.5.184/se.gif\" width=\"564\" height=\"94\">");
			out.println("<hr> ");
			out.println("<div align =\"left\"><font size=\"+1\" face=\"Courier New, Courier, mono\" color=\"#FFFFFF\"><B>");


			while (rs.next())
			{			
				out.println ("<table width=\"74%\" border=\"0\">");
				/*out.println ("<br><font color=\"#0099ff\" > TITLE    : <font color=\"#ffffff\">"+ rs.getString ("title"));
				out.println ("<BR><font color=\"#0099ff\"> CATEGORY : <font color=\"#ffffff\">"+ rs.getString("cate"));
				out.println ("<BR><font color=\"#0099ff\"> ABSTRACT : <font color=\"#ffffff\">"+ rs.getString("abstract"));
				out.println ("<BR><font color=\"#0099ff\"> URL      : <font color=\"#ffffff\"><A HREF = \"http://161.246.5.184/webapps/servlet/show1?URL="+ rs.getString("url")+"\">"+rs.getString("url")+"</A><BR><br><hr>");*/
				out.println ("<br><tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>TITLE    :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("title") +"</font></b></font></td>");
				out.println ("</tr>");
				out.println ("<tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>CATEGORY :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("cate") +"</font></b></font></td>");
				out.println ("</tr>");
				out.println ("<tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>ABSTRACT :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\">"+ rs.getString("abstract") +"</font></b></font></td>");
				out.println ("</tr>");
				out.println ("<tr>");
				out.println ("<td width=\"25%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b>URL      :<font color=\"#FFFFFF\"></font></b></font></td>");
				out.println ("<td width=\"75%\"><font face=\"Courier New, Courier, mono\" color=\"#0099FF\" size=\"+1\"><b><font color=\"#FFFFFF\"> <A HREF = \"http://161.246.5.184/webapps/servlet/show1?URL="+ rs.getString("url")+"\">"+rs.getString("url")+"</A></font></b></font></td>");
				out.println ("</tr>");

				out.println ("</table><BR><br><hr>");
			}

			out.println("</div></div></BODY></HTML>");
		}
		catch (Exception exx)
		{
			out.println("Couldn't load DB driver : " + exx.getMessage());
		}



		finally
		{
			try
			{
		   if (rs != null)
	    {
	     rs.close();
	    }
	   	if (stmt != null)
	   	{
		  stmt.close();
	   	}
		if (con != null)
		{con.close();
		}

			}
			catch ( SQLException ignored) {}
		}
	}
}