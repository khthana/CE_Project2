package proj_lib.db;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
import java.sql.*;

public class ResultInsertSubMajor extends HttpServlet {

	
	private String dbTable = "SUB_MAJOR" ;
	private String databaseName = "Ethesis5";
	private String user = "proj_lib";
    private String password = "proj_lib2002";
	
	// URL is jdbc:db2:dbname
	private String dbURL = "jdbc:db2://161.246.39.85:3000/"+databaseName; //161.246.39.85   user="proj_lib"  password="proj_lib2002"
	private String dbDriver = "COM.ibm.db2.jdbc.net.DB2Driver";
	private Connection dbConnection;
	private String errorMsg = "";
	final static int thesisColumn = 11 ;
	private Vector result = new Vector();
	RandomAccessFile outputfile;

	int temp = 0;

	public void doPost (HttpServletRequest request, HttpServletResponse response)throws IOException 
	{
		doGet( request, response );
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
							FirstPage(request,response);
	}// end doGet

	public void FirstPage(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
			String htmlOutput;
			String title = CharsetConverter.MS874ToUnicode("ผลการป้อนข้อมูลสาขาวิชาย่อย");

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();		
			
				htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n" +
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";			
			//htmlOutput +="Test First Page for add SubMajor to DB88";

			if( !(connectDB()) ){
					//htmlOutput += "connect DB Success";
					if( !(addRecord(request,response)) ){
							    htmlOutput += "<br><br>";
								htmlOutput +="<center><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">ชื่อสาขาวิชาย่อย</font></center><br>";
								htmlOutput += "<center><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode(request.getParameter( "Sub_major_thai"))+"</font></center>\n";
								htmlOutput += "<center><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode(request.getParameter( "Sub_major_eng"))+"</font></center><br><br>";
								htmlOutput +="<H2 ALIGN=\"CENTER\">ได้ถูกป้อนเข้าสู่ระบบเรียบร้อยแล้ว</H2>";	
								htmlOutput += "<br><br>";
								htmlOutput += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.InsertThesisAdmin\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปหน้าเดิม  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";
					}
					else{
								htmlOutput += "<br><br>";
								 htmlOutput +="<center>***********************************************</center><br>";
								htmlOutput +="<H2 ALIGN=\"CENTER\">ผลการป้อนข้อมูลไม่สมบูรณ์</H2>\n";	
								htmlOutput += "<center>***********************************************</center>";
								htmlOutput += "<br><br>";
								htmlOutput += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.InsertThesisAdmin\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปหน้าเดิม  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";								
					}
					closeConnectionDB();
			}
			else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
								htmlOutput += "<br><br>";
								htmlOutput += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.InsertThesisAdmin\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปป้อนข้อมูลอีก  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";								
			}

			htmlOutput += "</BODY></HTML>" ;
			out.println( htmlOutput );
	}

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

//******************************function add data to DB****************************
	boolean addRecord( HttpServletRequest request, HttpServletResponse response ) throws IOException 
	{		
		int majorID =0;
		boolean error = false;
		
		//*********************Find  major_ID of Sub_major**************************
		String MajorSe =   CharsetConverter.MS874ToUnicode(request.getParameter( "selectSub_M" ));
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT *  FROM  MAJOR  WHERE MAJOR_THAI_NAME = '"+MajorSe+"'");	       					
		   rs.next();
			majorID = rs.getInt(1);
			rs.close();
			stmt.close();
		}
		catch ( SQLException excp ) 
		{ 
	   		error = true;
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}

		//PrintWriter out=response.getWriter();		
		//out.println(majorID);
		//************************************End****************************************
				
		//**************************Add data to SubMajor Table**********************
		try 
		{
	         PreparedStatement pstmt = dbConnection.prepareStatement("INSERT INTO "+dbTable+
				 " (MAJOR_ID, SUB_MAJOR_THAI_NAME, SUB_MAJOR_ENGLISH_NAME)"+				 
				"VALUES (?,?,?)");
         //  provide values for prepared statement and execute update 
   	         pstmt.setInt (1,majorID);			
			 pstmt.setString(2,CharsetConverter.MS874ToUnicode( request.getParameter( "Sub_major_thai" ))  );
			 pstmt.setString(3,CharsetConverter.MS874ToUnicode( request.getParameter( "Sub_major_eng" )) );
			 						 
			 pstmt.executeUpdate();
		     pstmt.close();
		}
        catch ( Exception excp ) 
		{ 
   			error = true ;
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}
		return( error );
	} // funtion addRecord()

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


}// end class