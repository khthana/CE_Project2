import common.GlobalVariables;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.rmi.Naming;
public class WAPFileTransfer extends HttpServlet
{
	static String EOL = "\r\n";
	static final String url = GlobalVariables.RMI_URL;
	String gWAPName=null;
	String gWAPPswd=null;
	String gTransferType=null;
	String gPCName=null;
	String gRequest=null;
	String gFileNames=null;
	String gCurrentPath=null;
	String gDirectory=null;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out=res.getWriter();
		gWAPName = req.getParameter("wapname");
		gWAPPswd = req.getParameter("wappswd");
		gTransferType = req.getParameter("transfertype");
		gPCName = req.getParameter("pcname");
		gRequest = req.getParameter("request");
		gFileNames = req.getParameter("filenames");
		gCurrentPath = req.getParameter("currentpath");
		gDirectory = req.getParameter("directory");
		WriteResponseHeaders(res);
		WriteDeckHeader(out);
		if (gPCName==null)
		{
			showPCList(out, gWAPName);
		}else if (gRequest!=null)
		{
			if (gRequest.equals("true")){addNewPC(out);}
		}else if (gFileNames==null)
		{
			select_files(out);
		}else{
			transfer(out);
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
				out.print("<go href=\"http://" +GlobalVariables.WEB_SERVER_NAME+ "/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<setvar name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
				out.print("<setvar name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
				out.print("<setvar name=\"transfertype\" value=\"" + gTransferType + "\"/>" + EOL);
				out.print("<setvar name=\"pcname\" value=\"" + PC_name + "\"/>" + EOL);
				out.print("<postfield name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
				out.print("<postfield name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
				out.print("<postfield name=\"transfertype\" value=\"" + gTransferType + "\"/>" + EOL);
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
	out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
	out.print("<setvar name=\"wapname\" value=\"" + WAP_name + "\"/>" + EOL);
	out.print("<setvar name=\"wappswd\" value=\"" + gWAPPswd + "\"/>" + EOL);
	out.print("<setvar name=\"transfertype\" value=\"" + gTransferType + "\"/>" + EOL);
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
		out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
		out.print("<setvar name=\"wapname\" value=\"$wapname\"/>" + EOL);
		out.print("<setvar name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
		out.print("<setvar name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
		out.print("<postfield name=\"wapname\" value=\"$wapname\"/>" + EOL);
		out.print("<postfield name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
		out.print("<postfield name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
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
	void select_files(PrintWriter out)
	{
		if (gTransferType.equals("topc"))
		{
			out.print("<card id=\"filetopc\">");
			String path = GlobalVariables.WAP_USER_PATH + gWAPName + "\\file";
			File pathFile = new File(path);
			if (!(pathFile.exists()) || pathFile.list().length == 0)
			{
				out.print("<p>No file was found.</p>");
			}else
			{
				String[] list_files = pathFile.list();

				out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
				out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<setvar name=\"wapname\" value=\"$wapname\"/>" + EOL);
				out.print("<setvar name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
				out.print("<setvar name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
				out.print("<setvar name=\"pcname\" value=\"$pcname\"/>" + EOL);
				out.print("<postfield name=\"wapname\" value=\"$wapname\"/>" + EOL);
				out.print("<postfield name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
				out.print("<postfield name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
				out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
				out.print("<postfield name=\"filenames\" value=\"$filenames\"/>" + EOL);
				out.print("</go>" + EOL);
				out.print("</do>" + EOL);

				out.print("<p mode=\"nowrap\"><i>Select file</i>" + EOL);
				out.print("<select name=\"filenames\" multiple=\"true\">" + EOL);
				for (int i=0; i<list_files.length; i++)
				{
					out.print("<option value=\""+list_files[i]+"\">" + list_files[i] + "</option>" + EOL);
				}
				out.print("</select>" + EOL);
				out.print("</p>" + EOL);
			}
			out.print("</card>" + EOL);
		}else if (gTransferType.equals("frompc"))
		{
			Vector vector = new Vector();
			String cur_path="";
			String dir="";
			if (gCurrentPath!=null)
			{
				cur_path=gCurrentPath;
			}
			if (gDirectory!=null)
			{
				dir=gDirectory;
			}
			try{
				ServerInterface server = (ServerInterface)Naming.lookup(url);
				vector = server.getPCListFile(cur_path, dir, gPCName);
			}catch(Exception e){e.printStackTrace();}
			if (vector==null)
			{
				out.print("<card id=\"newdrive\">" + EOL);
				out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
				out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<setvar name=\"wapname\" value=\"$wapname\"/>" + EOL);
				out.print("<setvar name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
				out.print("<setvar name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
				out.print("<setvar name=\"pcname\" value=\"$pcname\"/>" + EOL);
				out.print("<postfield name=\"wapname\" value=\"$wapname\"/>" + EOL);
				out.print("<postfield name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
				out.print("<postfield name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
				out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
				out.print("<postfield name=\"currentpath\" value=\"$newdrive\"/>" + EOL);
				out.print("<postfield name=\"directory\" value=\"\"/>" + EOL);
				out.print("</go>" + EOL);
				out.print("</do>" + EOL);
				out.print("<p>Enter new drive.<br/>(<i>eg.</i> D:\\)<br/>" + EOL);
				out.print("<input name=\"newdrive\" maxlength=\"3\" type=\"text\" emptyok=\"false\"/>" + EOL);
				out.print("</p>" + EOL);
				out.print("</card>" + EOL);
				return;
			}
			out.print("<card id=\"filefrompc\">"+EOL);
			out.print("<p mode=\"nowrap\">");
			String[] list_dirs = (String[])vector.elementAt(0);
			String[] list_files = (String[])vector.elementAt(1);
			String current_path = (String)vector.elementAt(2);
			out.print(current_path + "<br/>");

			out.print("<anchor title=\"Parent Directory\">");
			out.print("..up" + EOL);
			out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
			out.print("<setvar name=\"wapname\" value=\"$wapname\"/>" + EOL);
			out.print("<setvar name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
			out.print("<setvar name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
			out.print("<setvar name=\"pcname\" value=\"$pcname\"/>" + EOL);
			out.print("<postfield name=\"wapname\" value=\"$wapname\"/>" + EOL);
			out.print("<postfield name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
			out.print("<postfield name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
			out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
			out.print("<postfield name=\"currentpath\" value=\"" + current_path + "\"/>" + EOL);
			out.print("<postfield name=\"directory\" value=\"..\"/>" + EOL);
			out.print("</go>" + EOL);
			out.print("</anchor>" + EOL);
			for (int i=0; i < list_dirs.length; i++)
			{
				out.print("<anchor title=\"Directory\">");
				out.print(list_dirs[i] + EOL);
				out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<postfield name=\"wapname\" value=\"$wapname\"/>" + EOL);
				out.print("<postfield name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
				out.print("<postfield name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
				out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
				out.print("<postfield name=\"currentpath\" value=\"" + current_path + "\"/>" + EOL);
				out.print("<postfield name=\"directory\" value=\"" + list_dirs[i] + "\"/>" + EOL);
				out.print("</go>" + EOL);
				out.print("</anchor>" + EOL);
			}
			if (list_files.length > 0)
			{
				out.print("<select name=\"filenames\" multiple=\"true\">" + EOL);
			}
			for (int i=0; i<list_files.length; i++)
			{
				out.print("<option value=\""+list_files[i]+"\">" + list_files[i] + "</option>" + EOL);
			}
			if (list_files.length > 0)
			{
				out.print("</select>");
			}
			out.print("</p>");
				out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
				out.print("<go href=\"http://"+GlobalVariables.WEB_SERVER_NAME+"/servlet/WAPFileTransfer\" method=\"post\" sendreferer=\"false\">" + EOL);
				out.print("<postfield name=\"wapname\" value=\"$wapname\"/>" + EOL);
				out.print("<postfield name=\"wappswd\" value=\"$wappswd\"/>" + EOL);
				out.print("<postfield name=\"transfertype\" value=\"$transfertype\"/>" + EOL);
				out.print("<postfield name=\"pcname\" value=\"$pcname\"/>" + EOL);
				out.print("<postfield name=\"currentpath\" value=\"" + current_path + "\"/>" + EOL);
				out.print("<postfield name=\"filenames\" value=\"$filenames\"/>" + EOL);
				out.print("</go>" + EOL);
				out.print("</do>" + EOL);
			out.print("</card>");
		}
	}

	void transfer(PrintWriter out)
	{
		if (gFileNames.equals(""))
		{
			out.print("<card id=\"nofile\">" + EOL);
			out.print("<p>No file selected.</p>" + EOL);
			out.print("</card>" + EOL);
			return;
		}
		Vector vector = new Vector();
		String transfer_result=new String("");
		int count=0;
		int start_index=0;
		int collon_index=0;
		while (collon_index!=-1)
		{
			collon_index = gFileNames.indexOf(';',start_index);
			if (collon_index!=-1)
			{
				vector.addElement(gFileNames.substring(start_index, collon_index));
				start_index = collon_index + 1;
			}else{
				vector.addElement(gFileNames.substring(start_index));
			}
			count=count+1;
		}

		String[] filenames = new String[vector.size()];
		vector.copyInto(filenames);
		Hashtable PCTable=null;
		try{
			ServerInterface server = (ServerInterface)Naming.lookup(url);
			PCTable = server.getPCList();
		}catch(Exception e){e.printStackTrace();}	

		// Check wether PC online now
		if (PCTable.containsKey(gPCName))
		{
			try{
				ServerInterface server = (ServerInterface)Naming.lookup(url);
				transfer_result = server.transferFile(gCurrentPath, filenames, gTransferType, gWAPName, gPCName, gWAPPswd);
			}catch(Exception e){e.printStackTrace();}
			out.print("<card id=\"status\">" + EOL);
			out.print("<do type=\"accept\" label=\"OK\" optional=\"false\">" + EOL);
			out.print("<go href=\"http://" +GlobalVariables.WEB_SERVER_NAME+ "/servlet/WAPLogin\" method=\"post\" sendreferer=\"false\">" + EOL);
			out.print("<postfield name=\"login\" value=\"" + gWAPName + "\"/>" + EOL);
			out.print("<postfield name=\"passwd\" value=\"" + gWAPPswd + "\"/>" + EOL);
			out.print("</go>" + EOL);
			out.print("</do>" + EOL);
			out.print("<p>" + transfer_result + "</p>" + EOL);
			out.print("</card>");
			
		}else{
		// PC is offline
			out.print("<card id=\"offline\">" + EOL);
			out.print("<p><b>"+gPCName+"</b> is not online." + EOL);
			out.print("<br/>Transfer File is canceled.</p>" + EOL);
			out.print("</card>");
		}
	}
}