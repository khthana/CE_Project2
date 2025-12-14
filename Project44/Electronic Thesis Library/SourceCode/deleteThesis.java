package proj_lib.db;

import java.io.*;
import java.util.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
import java.sql.*;

public class deleteThesis extends HttpServlet {

	//
	private String databaseName = "EThesis5";
	private String user = "proj_lib";
    private String password = "proj_lib2002";
	
	// URL is jdbc:db2:dbname
	private String dbURL = "jdbc:db2://161.246.39.85:3000/"+databaseName; //161.246.39.85   user="proj_lib"  password="proj_lib2002"
	private String dbDriver = "COM.ibm.db2.jdbc.net.DB2Driver";
	private Connection dbConnection;
	private String errorMsg = "";
	//final static int thesisColumn = 11 ;
	//private Vector result = new Vector();
	RandomAccessFile outputfile;

	public void doPost (HttpServletRequest request, HttpServletResponse response)throws IOException 
	{
			doGet( request, response );
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
							FirstPage(request,response);
	}// end doGet

	public void FirstPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String htmlOutput;
			String title = CharsetConverter.MS874ToUnicode("ระบบการลบวิทยานิพนธ์");

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();		
			
				htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n"+
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";
				//htmlOutput +=ShowFirst();
				htmlOutput += ShowS();

			htmlOutput += "<br><br>"+
										"<form name=\"form1\" method=\"post\" action=\"http://161.246.39.79/~proj_lib/ElectronicThesisLibrary1.html\">"+
										"<table width=\"8%\" border=\"0\" align=\"center\">"+
												"<tr>"+
													"<td>"+
															"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปหน้าหลัก  \">"+
													"</td>"+
												"</tr>"+
											"</table>"+
											"</form>";

			htmlOutput += "</BODY></HTML>" ;
			out.println(htmlOutput);
	}


	public String ShowS(){
			String Result = "";
			Result += "<hr>"+
"<form name=\"form2\" method=\"post\" action=\"/servlet/proj_lib.db.ShowdeleteThesis\">"+
  "<table width=\"82%\" border=\"0\" align=\"center\">"+
    "<tr>"+ 
      "<td width=\"12%\">"+ 
        "<div align=\"right\"><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">ค้นหา"+
         " : </font></div>"+
      "</td>"+
      "<td width=\"26%\"> <font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+ 
        "<input type=\"text\" name=\"find1\" size=\"30\" maxlength=\"60\">"+
        "</font></td>"+
      "<td width=\"6%\">"+ 
        "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"4\">ใน"+ 
         " : </font></div>"+
      "</td>"+
      "<td width=\"33%\"> <font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+ 
        "<select name=\"select1\">"+
              "<option>ชื่อวิทยานิพนธ์ภาษาไทย</option>"+
              "<option>ชื่อวิทยานิพนธ์ภาษาอังกฤษ</option>"+
              "<option>คำสำคัญ (ไทย และ อังกฤษ)</option>"+
              "<option>ชื่อผู้แต่ง (ไทย และ อังกฤษ)</option>"+
              "<option>สาขา (ไทย และ อังกฤษ)</option>"+
              "<option>สาขาย่อย (ไทย และ อังกฤษ)</option>"+
              "<option>มหาวิทยาลัย, สถานที่ทำงาน</option>"+
        "</select>"+
        "</font></td>"+
      "<td width=\"23%\">"+ 
        "<div align=\"left\">"+ 
          "<input type=\"submit\" name=\"Submit2\" value=\"  ค้นหา  \">"+
        "</div>"+
      "</td>"+
    "</tr>"+
  "</table>"+
"</form>"+
"<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.ResultdeleteThesis\">"+
  "<table width=\"78%\" border=\"0\" align=\"center\">"+
    "<tr>"+ 
      "<td width=\"65%\">"+ 
        "<div align=\"left\"><font face=\"Browallia New, BrowalliaUPC\" size=\"4\">---------------------เลือกวิทยานิพนธ์ที่ต้องการลบออกจากระบบ"+ 
          "--------------------------</font></div>"+
      "</td>"+
      "<td width=\"35%\">&nbsp;</td>"+
    "</tr>"+
    "<tr>"+ 
      "<td width=\"65%\">"+ 
        "<div align=\"left\"><font face=\"Browallia New, BrowalliaUPC\" size=\"4\">"+ 
          "<select name=\"namethesis\" size=\"15\">"+
            "<option>................................................................................................................................................................</option>";

if( !(connectDB()) ){
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT THAI_TITLE FROM LIBRARY_ITEM ORDER BY THAI_TITLE");
	        			
		    while (rs.next()) {				
					Result  += "<option>"+rs.getString(1)+"</option>";		
			}
			rs.close();
			stmt.close();
			closeConnectionDB();
		}
		catch ( SQLException excp ) 
		{ 
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}	
}
else{
		Result += "connect DB not Success" + errorMsg;
}

          Result  += "</select>"+
          "</font></div>"+
      "</td>"+
      "<td width=\"35%\">"+ 
        "<input type=\"submit\" name=\"Submit\" value=\"ตกลง\">"+
      "</td>"+
    "</tr>"+
  "</table>"+
"<hr>";
	return(Result);
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

}//
