package proj_lib.db;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.oreilly.servlet.MultipartRequest;

public class ResultInsertThesisData extends HttpServlet
{
	//
	private String dbTable = "LIBRARY_ITEM" ;
	private String databaseName = "Ethesis5";
	private String user = "proj_lib";
    private String password = "proj_lib2002";
	
	// URL is jdbc:db2:dbname
	private String dbURL = "jdbc:db2://161.246.39.85:3000/"+databaseName; //161.246.39.85   user="proj_lib"  password="proj_lib2002"
	private String dbDriver = "COM.ibm.db2.jdbc.net.DB2Driver";
	private Connection dbConnection;
	private String errorMsg = "";
	final static int thesisColumn = 3 ;
	private Vector result = new Vector();
	int MAX_FILE_SIZE = 1048576;		// 1 MB

	int temp = 0;

	public void doPost (HttpServletRequest request, HttpServletResponse response)throws IOException 
	{
	    MultipartRequest multi = new MultipartRequest(request, "/home/stdproj/proj_lib/public_html/upload");
		doGet( request, response, multi );
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response, MultipartRequest multipart)throws IOException 
	{
		String htmlOutput;
		String title = CharsetConverter.MS874ToUnicode("ผลการป้อนข้อมูล และป้อนไฟล์ PDF");

		response.setContentType("text/html;  charset=windows-874");
		PrintWriter out=response.getWriter();
		htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n" +
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";
		try 
		{
			if (!(connectDB() ))
			{
				htmlOutput += manager( request, response,multipart );				
				closeConnectionDB();
			}
			else 
			{
				out.println( "<br><br>");
				out.println("<center>***********************************************</center><br>");
				out.println( "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>");
				out.println("<center>***********************************************</center><br>");
				out.println( "<br><br>");
			}

			htmlOutput += "<BODY></HTML>" ;
			out.println( htmlOutput );

		}catch (Exception e){
			e.printStackTrace(out);
	  }

	}// end doGet
	

	//*************************************************** manager ****************************************
	String manager( HttpServletRequest request, HttpServletResponse response,MultipartRequest multipart ) throws IOException 
	{
		String returnString="",status ;
		status=request.getParameter("operation");

			if (!( addRecord( request, response, multipart ) ))
				{
								returnString += "<br><br>";
								 returnString +="<center>***********************************************</center><br>";
								returnString +="<H2 ALIGN=\"CENTER\">ผลการป้อนข้อมูลวิทยานิพนธ์สมบูรณ์</H2>\n";	
								returnString+= "<center>***********************************************</center>";
								returnString += "<br><br>";
								returnString += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.InsertThesis\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปเพื่อป้อนข้อมูล  \">"+
																		"</td>"+
																	"</tr>"+
															"</table>"+
															"</form>";
				}
				else 
				{
								returnString += "<br><br>";
								 returnString +="<center>***********************************************</center><br>";
								returnString +="<H2 ALIGN=\"CENTER\">ผลการป้อนข้อมูลไม่สมบูรณ์</H2>\n";	
								returnString+= "<center>***********************************************</center>";
								returnString += "<br><br>";
								returnString += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.InsertThesis\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปหน้าเดิม  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";
				} // end if (!( addRecord( request, response ) ))
		return( returnString );

	}

	//**************************************** Connect Database ***************************************
	boolean connectDB() 
	{
		// initial 
		boolean error = false;
		errorMsg="";

		// Set up database connection
		try 
		{     // ส่วนติดต่อกับฐานข้อมูล โดยการใช้ JDBC-ODBC
				Class.forName( dbDriver ).newInstance();
				dbConnection = DriverManager.getConnection( dbURL, user, password );
		}
		catch ( Exception excp ) 
		{    
   			error = true;
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}
		return( error );	
	}// end connectDB();

	boolean closeConnectionDB(){
		boolean success = false;
		errorMsg="";
			try{	
				if(!(dbConnection.isClosed()) ){
							dbConnection.close();
							success = true;
				}
			}
			catch(Exception excp1){
				excp1.printStackTrace();
				errorMsg =  excp1.toString() ;
			}
      return(success);    
	}	



 //find number of item in DB
  public int findID(){
			int numOfItem = 0;
			//if( !(connectDB()) ){
					try 
					{
					// retrieve data from the database
							Statement stmt = dbConnection.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT MAX(LIBRARY_ITEM_ID) FROM LIBRARY_ITEM");
							rs.next();
							numOfItem = rs.getInt(1);
							
							rs.close();
							stmt.close();
					}
					catch ( SQLException excp ) { 
							excp.printStackTrace();
							errorMsg =  excp.toString() ;
					}	
			return numOfItem;
  }
	
	
	//******************************************************** insert record ********************************
	boolean addRecord( HttpServletRequest request, HttpServletResponse response, MultipartRequest multipart ) 
	{		
		boolean error = false;
		try 
		{
	        FileInputStream fis = new FileInputStream ("/home/stdproj/proj_lib/public_html/upload/" + multipart.getFilesystemName("pdf"));
	         PreparedStatement pstmt = dbConnection.prepareStatement("UPDATE LIBRARY_ITEM SET PDF_FILE = ? WHERE ( (LIBRARY_ITEM_ID = "+findID()+" ) )");
		       
		     pstmt.setBinaryStream (1, fis, MAX_FILE_SIZE);
	         pstmt.executeUpdate();
		     pstmt.close();			
		}
        catch ( Exception excp ) 
		{ 
   			error = true;
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}
		return( error );
	} // funtion addRecord()

};