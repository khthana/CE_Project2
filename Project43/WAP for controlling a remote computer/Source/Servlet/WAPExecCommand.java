import common.GlobalVariables;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.rmi.Naming;
public class WAPExecCommand extends HttpServlet
{
	static String EOL = "\r\n";
	static final String url = GlobalVariables.RMI_URL;
	String gWAPName=null;
	String gWAPPswd=null;
	String gPCName=null;
	String gRequest=null;
	String gCommand=null;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out=res.getWriter();
		gWAPName = req.getParameter("wapname");
		gWAPPswd = req.getParameter("wappswd");
		gPCName = req.getParameter("pcname");
		gRequest = req.getParameter("request");
		gCommand = req.getParameter("command");
		WriteResponseHeaders(res);
		WriteDeckHeader(out);

		if (gPCName==null)
		{
			showPCList(out, gWAPName);
		}else if (gRequest!=null)
		{
			if (gRequest.equals("true")){addNewPC(out);}
		}else if (gCommand==null){
			inputCommand(out);
		}else{
			sendCommand(out);
		}
		out.print("</wml>");
	}
//******************************************************************
// WriteResponseHeaders
//
// Output the HTTP headers for this response.
//******************************************************************
    public void WriteResponseHeaders
    ( 
    HttpServletResponse res
    )
    throws
    IOException
    {
// Output the content type.
	res.setContentType("text/vnd.wap.wml");
// Output the cache control header first.
    res.setHeader ( "Cache-Control", "no-cache" );
 // Output the Date header. 
    java.util.Date now     = new java.util.Date ();
    long nowTime = now.getTime ();
    res.setDateHeader ( "Date", nowTime );
}

//******************************************************************
// WriteDeckheader
//
// Output the beginning of a WML deck.
//******************************************************************
  public void WriteDeckHeader
    ( 
    PrintWriter out
    )
    throws
    IOException
    {

    out.println ( 
      "<?xml version=\"1.0\"?>" + EOL +
      "<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\"" + EOL +
      "\"http://www.wapforum.org/DTD/wml_1.1.xml\">" + EOL +
      "<wml>"
    );      
  }
//******************************************************************
	void showPCList(PrintWriter out, String WAP_name)throws IOException
	{
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	Hashtable PCTable = new Hashtable();
	try{
		ServerInterface server = (ServerInterface)Naming.lookup(url);
		PCTable = server.getPCList();
	}catch(Exception e){e.printStackTrace();}	

	out.print("<card id=\"showpc\" newcontext=\"false\" ordered=\"true\">" + EOL);
	out.print("<p align=\"left\">Please choose PC" + EOL);
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
		stmt=con.createStatement();
		rs=stmt.executeQuery("SELECT PC_user_name FROM Authorize WHERE WAP_user_name='" + WAP_name.toUpperCase() + "' AND Authorize=TRUE");
		while(rs.next())
		{
			String PC_name = rs.getString("PC_user_name");
			if (PCTable.containsKey(PC_name))
			{
				out.print("<br/>" + EOL);
				out.print("<anchor title=\"Connect to "+ PC_name + "\">" + EOL);
				out.print(PC_name + "" + EOL);
				out.print("<go href=\"http://" +GlobalVariables.WEB_SERVER_NAME+ "/servlet/WAPExecCommand\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<setvar name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
				out.print("<setvar name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
				out.print("<setvar name=\"pcname\" value=\"" + PC_name + "\"/>" + EOL);
				out.print("<postfield name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
				out.print("<postfield name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
				out.print("<postfield name=\"pcname\" value=\""+ PC_name +"\"/>" + EOL);
				out.print("</go>" + EOL);
				out.print("</anchor>" + EOL);
			}
		}

	}catch (ClassNotFoundException e){
		out.println("Could'n load database driver: " + e.getMessage());
	}catch(SQLException e){
		out.println("SQLException caught: " + e.getMessage());
	}finally{
		try{
			if (con!=null) con.close();
		}catch (SQLException ignored){
		}
	}

	out.print("<br/>" + EOL);
	out.print("<a href=\"#request\" title=\"Request new PC\">Request new PC</a>");
	out.print("</p>" + EOL);
	out.print("</card>" + EOL);

	out.print("<card title=\"Request PC\" id=\"request\" newcontext=\"false\" ordered=\"true\">" + EOL);
	out.print("<do type=\"accept\" label=\"submit\" optional=\"false\">" + EOL);
	out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPExecCommand\" method=\"post\" sendreferer=\"false\">" + EOL);
	out.print("<setvar name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
	out.print("<setvar name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
	out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
	out.print("<postfield name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
	out.print("<postfield name=\"request\" value=\"true\"/>" + EOL);
	out.print("</go>" + EOL);
	out.print("</do>" + EOL);
	out.print("<p>Enter PC's name:<br/>" + EOL);
	out.print("<input name=\"pcname\" maxlength=\"15\" type=\"text\" emptyok=\"false\"/>" + EOL);
	out.print("</p>" + EOL);
	out.print("</card>");
  }
//******************************************************************************************************
	void addNewPC(PrintWriter out)
	{
		Connection con=null;
		boolean request_ok = false;

		out.print("<card>");
		out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
		out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPExecCommand\" method=\"post\" sendreferer=\"false\">" + EOL);
		out.print("<setvar name=\"wapname\" value=\"$wapname\"/>" + EOL);
		out.print("<setvar name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
		out.print("<postfield name=\"wapname\" value=\"$wapname\"/>" + EOL);
		out.print("<postfield name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</do>" + EOL);

		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:WAP_DB","user","passwd");
			Statement stmt1=con.createStatement();
			ResultSet rs1=stmt1.executeQuery("SELECT * FROM PC_User WHERE user_name='" + gPCName.toUpperCase() + "'");
			if (rs1.next())	// if there exists PC's name
			{
				Statement stmt2=con.createStatement();
				ResultSet rs2=stmt2.executeQuery("SELECT * FROM Authorize WHERE WAP_user_name='" + gWAPName.toUpperCase() + "' AND PC_user_name='" + gPCName.toUpperCase() + "'");
				if (rs2.next()){ // if WAP has already requested
					out.println("<p>" + gWAPName + " has already requested to " + gPCName+ ".");
				}else {
					Statement stmt3=con.createStatement();
					int count=stmt3.executeUpdate("INSERT INTO Authorize VALUES ('" + gWAPName.toUpperCase() + "','" + gPCName.toUpperCase() + "',FALSE)");
					out.println("<p>Your request to " + gPCName + " is successful.");
					request_ok = true;
				}
			}else {
				out.println("<p>" + gPCName + " does not exists.");
			}
		}
		catch (ClassNotFoundException e){
			out.println("<p>Could'n load database driver: " + e.getMessage());
		}
		catch (SQLException e){
			out.println("<p>SQLException caught: " + e.getMessage());
		}
		finally {
		    out.print("</p>" + EOL);
			try{
				if (con!=null) con.close();
			}
			catch (SQLException ignored){
			}
			if (request_ok)
			{
				try{
					ServerInterface server = (ServerInterface)Naming.lookup(url);
					server.updatePC(gPCName);
				}catch(Exception e){e.printStackTrace();}	
			}
		}
		
		
		out.print("</card>");
	}
//*********************************************************************************************
	void inputCommand(PrintWriter out)
	{
		out.print("<card title=\"Command\" id=\"command\" newcontext=\"false\" ordered=\"true\">" + EOL);
		out.print("<do type=\"accept\" label=\"submit\" optional=\"false\">" + EOL);
		out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPExecCommand\" method=\"post\" sendreferer=\"false\">" + EOL);
		out.print("<setvar name=\"wapname\" value=\"" + gWAPName + "\"/>" + EOL);
		out.print("<setvar name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
		out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
		out.print("<postfield name=\"wapname\" value=\"" + gWAPName + "\"/>" + EOL);
		out.print("<postfield name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
		out.print("<postfield name=\"command\" value=\"$command\"/>" + EOL);
		out.print("</go>" + EOL);
		out.print("</do>" + EOL);
		out.print("<p>Enter Command:<br/>" + EOL);
		out.print("<input name=\"command\" maxlength=\"50\" type=\"text\" emptyok=\"false\"/>" + EOL);
		out.print("</p>" + EOL);
		out.print("</card>");
	}
//*********************************************************************************************
	void sendCommand(PrintWriter out)
	{
		String result="";
		try{
			ServerInterface server = (ServerInterface)Naming.lookup(url);
			result = server.sendCommand(gCommand, gWAPName, gWAPPswd, gPCName);
		}catch(Exception e){e.printStackTrace();}
		MessageScanner scanner = new MessageScanner();
		result = scanner.scan(result);
		out.print("<card id=\"result\">"+EOL);
		out.print("<p>"+result+"</p>");
		out.print("</card>");
	}
}
