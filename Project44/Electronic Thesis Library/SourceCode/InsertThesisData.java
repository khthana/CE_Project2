package proj_lib.db;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
import java.sql.*;

public class InsertThesisData extends HttpServlet {

	
	private String dbTable = "Test" ;	
	private String databaseName = "EThesis5";
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
			
			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();

			String htmlOutput = "";			
			//String title = CharsetConverter.MS874ToUnicode("Insert for administrator");

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
			
			String htmlOutput="", insertUser="";			
			String title = CharsetConverter.MS874ToUnicode("ระบบการป้อนข้อมูลวิทยานิพนธ์");

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();

//************************************************** Page of Insert for User******************************************//	       
		  insertUser =     "<blockquote>"+
    "<hr>"+
  "</blockquote>"+
  "<form name=\"form1\"  method=\"post\" action=\"/servlet/proj_lib.db.InsertPDF\">"+
      "<div align=\"left\">"+ 
      "<blockquote>"+
        "<table width=\"80%\" border=\"0\">"+
          "<tr>"+ 
            "<td width=\"32%\" height=\"2\">"+ 
              "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">ชื่อวิทยานิพนธ์ภาษาไทย "+
               ":</font></div>"+
            "</td>"+
            "<td width=\"68%\" height=\"2\">"+ 
              "<div align=\"left\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">"+ 
                "<input type=\"text\" name=\"Thesis_Thai_Name\" size=\"30\" maxlength=\"60\">"+
                "</font></div>"+
            "</td>"+
          "</tr>"+
          "<tr>"+ 
            "<td width=\"32%\">"+ 
              "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">ชื่อวิทยานิพนธ์ภาษาอังกฤษ "+
                ":</font></div>"+
            "</td>"+
            "<td width=\"68%\">"+ 
              "<div align=\"left\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">"+ 
                "<input type=\"text\" name=\"Thesis_English_Name\" size=\"30\" maxlength=\"60\">"+
                "</font></div>"+
            "</td>"+
          "</tr>"+
          "<tr>"+ 
            "<td width=\"32%\">"+ 
              "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">บทคัดย่อภาษาไทย "+
                ":</font></div>"+
            "</td>"+
            "<td width=\"68%\">"+ 
              "<div align=\"left\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">"+ 
                "<textarea name=\"Thai_Abstract\" cols=\"60\" rows=\"5\"></textarea>"+
                "</font></div>"+
            "</td>"+
          "</tr>"+
          "<tr>"+ 
            "<td width=\"32%\">"+ 
              "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">บทคัดย่อภาษาอังกฤษ "+ 
                ":</font></div>"+
            "</td>"+
            "<td width=\"68%\">"+ 
              "<div align=\"left\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">"+ 
                "<textarea name=\"English_Abstract\" cols=\"60\" rows=\"5\"></textarea>"+
                "</font></div>"+
            "</td>"+
          "</tr>"+
          "<tr>"+ 
            "<td width=\"32%\" height=\"22\">"+ 
              "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">ปีการศึกษา "+
               " : </font></div>"+
            "</td>"+
            "<td width=\"68%\" height=\"22\">"+ 
              "<div align=\"left\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">"+ 
                "<input type=\"text\" name=\"year\" size=\"30\" maxlength=\"15\">"+
                "</font></div>"+
            "</td>"+
          "</tr>"+
        "</table>"+
        "<p>&nbsp;</p>"+
      "</blockquote>"+
    "</div>"+
    "<blockquote>"+ 
      "<table width=\"85%\" border=\"0\">"+
        "<tr>"+ 
          "<td width=\"28%\" height=\"43\">"+ 
            "<div align=\"center\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">ชื่อผู้จัดทำ :</font>"+ 
            "</div>"+
          "</td>"+
          "<td width=\"6%\" height=\"43\">"+ 
            "<div align=\"center\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">1.</font></div>"+
          "</td>"+
          "<td width=\"25%\" height=\"43\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "<input type=\"text\" name=\"FirstName1\" size=\"30\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
          "<td width=\"7%\" height=\"43\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">สกุล :</font>"+ 
            "</div>"+
          "</td>"+
          "<td width=\"34%\" height=\"43\">"+ 
            "<div align=\"center\"> <font face=\"Browallia New, BrowalliaUPC\" size=\"3\">"+ 
              "<input type=\"text\" name=\"LastName1\" size=\"30\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
        "</tr>"+
        "<tr>"+ 
          "<td width=\"28%\">"+ 
            "<div align=\"center\"><font face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\"><font size=\"3\"></font></font></font></div>"+
          "</td>"+
          "<td width=\"6%\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">2.</font></div>"+
          "</td>"+
          "<td width=\"25%\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "<input type=\"text\" name=\"FirstName2\" size=\"30\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
          "<td width=\"7%\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\"><font size=\"3\"></font></font></font>"+ 
              "</font></div>"+
          "</td>"+
          "<td width=\"34%\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "<input type=\"text\" name=\"LastName2\" size=\"30\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
        "</tr>"+
        "<tr>"+ 
          "<td width=\"28%\" height=\"17\">"+ 
            "<div align=\"center\"><font face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\"><font size=\"3\"></font></font></font></div>"+
          "</td>"+
          "<td width=\"6%\" height=\"17\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">3. "+
              "</font></div>"+
          "</td>"+
          "<td width=\"25%\" height=\"17\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "<input type=\"text\" name=\"FirstName3\" size=\"30\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
          "<td width=\"7%\" height=\"17\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\"><font size=\"3\"></font></font></font>"+ 
              "</font></div>"+
          "</td>"+
          "<td width=\"34%\" height=\"17\">"+ 
            "<div align=\"center\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "<input type=\"text\" name=\"LastName3\" size=\"30\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
        "</tr>"+
      "</table>"+
      "<p>&nbsp;</p>"+
	"<table width=\"87%\" border=\"0\">"+
        "<tr>"+ 
          "<td width=\"26%\">"+ 
            "<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">คำสำคัญ"+ 
              ":</font></div>"+
          "</td>"+
          "<td width=\"4%\">"+ 
            "<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "1. </font></div>"+
          "</td>"+
          "<td width=\"29%\"> <font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
            "<input type=\"text\" name=\"key1\" size=\"25\" maxlength=\"60\">"+
            "</font></td>"+
          "<td width=\"10%\">"+
"<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">4. "+
              "</font></div>"+
          "</td>"+
          "<td width=\"31%\">"+ 
            "<div align=\"left\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "<input type=\"text\" name=\"key4\" size=\"25\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
        "</tr>"+
        "<tr>"+ 
          "<td width=\"26%\" height=\"29\">"+ 
            "<div align=\"right\"><font size=\"3\"><font size=\"3\"><font face=\"Browallia New, BrowalliaUPC\"></font></font></font></div>"+
          "</td>"+
          "<td width=\"4%\" height=\"29\">"+ 
            "<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "2. </font></div>"+
          "</td>"+
          "<td width=\"29%\" height=\"29\"> <font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
            "<input type=\"text\" name=\"key2\" size=\"25\" maxlength=\"60\">"+
            "</font></td>"+
          "<td width=\"10%\" height=\"29\">"+ 
            "<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">5."+ 
              "</font></div>"+
          "</td>"+
          "<td width=\"31%\" height=\"29\">"+ 
            "<div align=\"left\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "<input type=\"text\" name=\"key5\" size=\"25\" maxlength=\"60\">"+
              "</font></div>"+
          "</td>"+
        "</tr>"+
        "<tr>"+ 
          "<td width=\"26%\" height=\"29\">&nbsp;</td>"+
          "<td width=\"4%\" height=\"29\">"+ 
            "<div align=\"right\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
              "3. </font></div>"+
          "</td>"+
          "<td width=\"29%\" height=\"29\"><font size=\"3\" face=\"Browallia New, BrowalliaUPC\">"+ 
            "<input type=\"text\" name=\"key3\" size=\"25\" maxlength=\"60\">"+
            "</font></td>"+
          "<td width=\"10%\" height=\"29\">"+ 
            "<div align=\"right\"></div>"+
          "</td>"+
          "<td width=\"31%\" height=\"29\">"+ 
            "<div align=\"left\"></div>"+
          "</td>"+
        "</tr>"+
      "</table>"+
      "<p>&nbsp;</p>"+
      "<table width=\"81%\" border=\"0\">"+
              "<tr>"+ 
          "<td width=\"32%\">"+ 
            "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">มหาวิทยาลัย, สถานที่ทำงาน "+
              ":</font></div>"+
          "</td>"+
          "<td width=\"34%\">"+ 
            "<select name=\"select_Pub\">"+
              "<option>--------------- โปรดเลือก ---------------</option>";

//****************************Publisher in DB************************
//if( !(connectDB()) ){
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM PUBLISHER ORDER BY PUBLISHER_THAI_NAME");
	        			
		    while (rs.next()) {				
				insertUser  += "<option>"+ rs.getString(2)+"</option>";
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
		htmlOutput += "connect DB not Success" + errorMsg;
}*/
//****************************End Publisher in DB************************

insertUser +="</select>"+
          "</td>"+
          "<td width=\"34%\">"+ 
            "<div align=\"right\"></div>"+
          "</td>"+
        "</tr>"+
        "<tr>"+ 
          "<td width=\"32%\">"+ 
            "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">สาขาวิชา "+
              ":</font></div>"+
          "</td>"+
          "<td width=\"34%\">"+ 
            "<select name=\"select_Major\">"+
              "<option selected>--------------- โปรดเลือก ---------------</option>";

//****************************Major in DB************************
//if( !(connectDB()) ){
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM MAJOR ORDER BY MAJOR_THAI_NAME");
	        			
		    while (rs.next()) {				
				insertUser  += "<option>"+ rs.getString(2)+"</option>";
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
		htmlOutput += "connect DB not Success" + errorMsg;
}*/
//*************************End Major in DB**********************


         insertUser +=   "</select>"+
          "</td>"+
          "<td width=\"34%\">"+ 
            "<div align=\"right\"></div>"+
          "</td>"+
        "</tr>"+
        "<tr>"+ 
          "<td width=\"32%\">"+ 
            "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"3\">สาขาวิชาย่อย "+
              ":</font></div>"+
          "</td>"+
          "<td width=\"34%\">"+ 
            "<select name=\"select_SubMajor\">"+
              "<option>--------------- โปรดเลือก ---------------</option>";

//****************************SubMajor in DB************************
//if( !(connectDB()) ){
		try 
		{
	        // retrieve data from the database
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM SUB_MAJOR ORDER BY SUB_MAJOR_THAI_NAME");
	        			
		    while (rs.next()) {				
				insertUser  += "<option>"+ rs.getString(3)+"</option>";
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
		htmlOutput += "connect DB not Success" + errorMsg;
}*/
//*************************End SubMajor in DB**********************


         insertUser +=   "</select>"+
          "</td>"+
          "<td width=\"34%\">"+ 
            "<div align=\"left\">"+ 
              "<input type=\"submit\" name=\"Submit\" value=\"  ป้อน  \">"+
            "</div>"+
          "</td>"+
        "</tr>"+
      "</table>"+
    "</blockquote>"+
  "</form>"+
"</div>"+
"<blockquote>"+ 
  "<hr>"+
  "<p>&nbsp; </p>"+
"</blockquote>";

	
//************************************End  Page of Insert for User***********************************//	       
		   			
			htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n" +
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";			

			
			
			htmlOutput += insertUser;
			htmlOutput += "<BODY></HTML>" ;
			out.println( htmlOutput );

	
	}//end firstpage

	//*******************************connect DB******************************
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

	//Close Connection
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
	}//close connection	

}//end class TestProj_lib


