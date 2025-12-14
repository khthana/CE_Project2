package proj_lib.db;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
import java.sql.*;

public class InsertThesisAdmin extends HttpServlet {

	//
	private String dbTable =  "Major" ;	
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
	//RandomAccessFile outputfile;

	int temp = 0;

	public void doPost (HttpServletRequest request, HttpServletResponse response)throws IOException 
	{
		doGet( request, response );
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{			
			String htmlOutput= "";			

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();
				
				if( !(connectDB()) ){
						FirstPage(request, response);
						closeConnectionDB();
													
				}
				else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
				}

				
				
		out.println(htmlOutput);
	}// end doGet

	public void FirstPage(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
			
			String htmlOutput= "", major, sub_major, publisher;			
			String title = CharsetConverter.MS874ToUnicode("ระบบการป้อนข้อมูล");

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();

//************************************************** Page of major******************************************//	       
		   major =   "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.ResultInsertMajor\">"+
    "<p><b><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">สาขาวิชา </font></b></p>"+
    "<table width=\"58%\" border=\"0\">"+
      "<tr> "+
        "<td width=\"39%\"> "+
          "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">ชื่อภาษาไทย "+
           " :</font></div>"+
        "</td>"+
        "<td width=\"53%\"><font face=\"Browallia New, BrowalliaUPC\" size=\"4\">"+ 
          "<input type=\"text\" name=\"thai_major\" size=\"30\" maxlength=\"50\">"+
          "</font></td>"+
        "<td width=\"26%\">"+ 
          "<div align=\"center\"></div>"+
        "</td>"+
      "</tr>"+
      "<tr>"+ 
        "<td width=\"39%\" height=\"27\">"+ 
          "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">ชื่อภาษาอังกฤษ "+
           " :</font> </div>"+
        "</td>"+
        "<td width=\"53%\" height=\"27\"><font face=\"Browallia New, BrowalliaUPC\" size=\"4\">"+ 
          "<input type=\"text\" name=\"eng_major\" size=\"30\" maxlength=\"50\">"+
          "</font></td>"+
        "<td width=\"26%\" height=\"27\">"+ 
          "<div align=\"center\"><font face=\"Browallia New, BrowalliaUPC\" size=\"4\">"+ 
           " <input type=\"submit\" name=\"Submit\" value=\"  ป้อน  \">"+
            "</font></div>"+
        "</td>"+
      "</tr>"+
    "</table>"+
   " <p><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+
   "<select name=\"showMajor\" size=\"5\">"+
   "<option>-----------------สาขาิวิชาที่มีในฐานข้อมูล-----------------</option>";

//All Major have been in DB
/*if( !(connectDB()) ){*/
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM MAJOR ORDER BY MAJOR_THAI_NAME");
	        			
		    while (rs.next()) {				
					 major += "<option>"+rs.getString(2)+"</option>";				
			}
			rs.close();
			stmt.close();
		}
		catch ( SQLException excp ) 
		{ 
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}	
/*}
else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
}*/

 major +="</select>"+
      "</font></p>"+
  "</form>"+
  "<hr>";
//**********************************************End  Page of major******************************************//	       
		   

//**********************************************Start Page of Submajor*************************************//		   
		   sub_major =  "<form name=\"form2\" method=\"post\" action=\"/servlet/proj_lib.db.ResultInsertSubMajor\">"+
   " <p><font face=\"Browallia New, BrowalliaUPC\" size=\"4\"><b>สาขาวิชาย่อย</b></font></p>"+
    "<font size=\"3\" face=\"Browallia New, BrowalliaUPC\"> </font> <font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
    "</font> "+
    "<table width=\"83%\" border=\"0\" height=\"65\">"+
      "<tr>"+ 
        "<td width=\"23%\"> "+
         " <div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
           " <select name=\"selectSub_M\" size=\"1\">"+
             " <option selected><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">-----------เลือกสาขาวิชาของสาขาวิชาย่อย-----------"+
             "</font></option>";


//****************************MAJOR IN DB******************************
/*if( !(connectDB()) ){*/
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM MAJOR ORDER BY MAJOR_THAI_NAME");
	        			
		    while (rs.next()) {				
					 sub_major += " <option><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+rs.getString(2)+"</font></option>";
			}
			rs.close();
			stmt.close();
		}
		catch ( SQLException excp ) 
		{ 
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}	
/*}
else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
}*/
            
sub_major +=  " </select>"+
            "</font></div>"+
       " </td>"+
        "<td width=\"38%\">"+ 
          "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">ชื่อภาษาไทย "+
           " : </font></div>"+
        "</td>"+
        "<td width=\"36%\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
          "<input type=\"text\" name=\"Sub_major_thai\" size=\"30\" maxlength=\"60\">"+
         " </font></td>"+
       " <td width=\"13%\">&nbsp;</td>"+
      "</tr>"+
      "<tr> "+
       " <td width=\"23%\" height=\"25\"> "+
          "<div align=\"center\"> </div>"+
        "</td>"+
       " <td width=\"38%\" height=\"25\"> "+
          "<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">ชื่อภาษาอังกฤษ "+
            ": </font></div>"+
       " </td>"+
        "<td width=\"36%\" height=\"25\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\"> "+
         " <input type=\"text\" name=\"Sub_major_eng\" size=\"30\" maxlength=\"60\">"+
         "</font></td>"+
       " <td width=\"13%\" height=\"25\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
         " <input type=\"submit\" name=\"Submit2\" value=\"  ป้อน  \">"+
          "</font></td>"+
     " </tr>"+
   " </table>"+
    "<p><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+
      "<select name=\"showSubMajor\" size=\"5\">"+
        "<option>---------------สาขาวิชาย่อยที่มีในฐานข้อมูล---------------</option>";

//*************************************Submajor in DB******************************
/*if( !(connectDB()) ){*/
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM SUB_MAJOR ORDER BY SUB_MAJOR_THAI_NAME");
	        			
		    while (rs.next()) {				
				sub_major += "<option>"+rs.getString(3)+"</option>";				
			}
			rs.close();
			stmt.close();
		}
		catch ( SQLException excp ) 
		{ 
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}	
/*}
else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
}*/

sub_major += "</select>"+
      "</font></p>"+
    "</form>"+
  "<hr>";
						
//**********************************************End  Page of Submajor**********************************//

//**********************************************Start Page of Publish*************************************//	
publisher =  "<hr>"+
	"<form name=\"form3\" method=\"post\" action=\"/servlet/proj_lib.db.ResultInsertPublisher\">"+
   "<p><font face=\"Browallia New, BrowalliaUPC\"><b><font size=\"4\">มหาวิทยาลัย, สถานที่ทำงาน</font></b></font> "+
   "</p>"+
   "<table width=\"58%\" border=\"0\">"+
     " <tr> "+
        "<td width=\"39%\" height=\"31\"> "+
         "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\">ชื่อภาษาไทย "+
          "  : </font></div>"+
        "</td>"+
        "<td width=\"48%\" height=\"31\"> "+
         " <input type=\"text\" name=\"bub_thai\" size=\"30\" maxlength=\"60\">"+
        "</td>"+
        "<td width=\"23%\" height=\"31\">&nbsp;</td>"+
      "</tr>"+
      "<tr> "+
       "<td width=\"39%\"> "+
         "<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">ชื่อภาษาอังกฤษ"+ 
            ": </font></div>"+
       " </td>"+
       " <td width=\"48%\"> "+
       "   <input type=\"text\" name=\"pub_eng\" size=\"30\" maxlength=\"60\">"+
        "</td>"+
        "<td width=\"23%\"> "+
          "<input type=\"submit\" name=\"Submit3\" value=\"  ป้อน  \">"+
        "</td>"+
      "</tr>"+
    "</table>"+
    "<p><font size=\"4\" face=\"Browallia New, BrowalliaUPC\"> "+
"<select name=\"showPublisher\" size=\"5\">"+
        "<option>-----มหาวิทยาลัย, สถานที่ทำงานที่มีในฐานข้อมูล-----</option>";

/*if( !(connectDB()) ){*/
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM PUBLISHER ORDER BY PUBLISHER_THAI_NAME");
	        			
		    while (rs.next()) {				
				publisher += "<option>"+rs.getString(2)+"</option>";				
			}
			rs.close();
			stmt.close();
		}
		catch ( SQLException excp ) 
		{ 
			excp.printStackTrace();
			errorMsg =  excp.toString() ;
		}	
/*}
else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
}*/


publisher += "</select>"+
     " </font> </p>"+
  "</form>"+
 "<hr>";
//**********************************************End  Page of Publish************************************//
			
			
			
			htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n" +
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";			

						htmlOutput +=publisher;
						htmlOutput += major;
						htmlOutput +=sub_major;

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

			
			htmlOutput += "<BODY></HTML>" ;
			out.println( htmlOutput );	
	}//end firstpage

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
	
	//function connect DB
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

}//end class TestProj_lib

