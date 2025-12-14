package proj_lib.db;

import java.io.*;
import java.util.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
import java.sql.*;

public class ShowdeleteThesis extends HttpServlet {

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
				htmlOutput +=ShowS(request, response);

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

	public String ShowS(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

			
		  Result  += findData(request.getParameter( "find1"), request.getParameter( "select1"));

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

	public String findData(String find, String select){
		String ReturnS = "";
		//StoreLink temp;		
			//response.setContentType("text/html;  charset=windows-874");
			//PrintWriter out=response.getWriter();	
			//String output="";

			//String Byinfo1 = CharsetConverter.UnicodeToMS874(Byinfo);
			String info1 = CharsetConverter.MS874ToUnicode(find);

			  String temp[] = new String[7];
			  temp[0] =  CharsetConverter.UnicodeToMS874( "ชื่อวิทยานิพนธ์ภาษาไทย");
			  temp[1] =  CharsetConverter.UnicodeToMS874("ชื่อวิทยานิพนธ์ภาษาอังกฤษ");
			  temp[2] =  CharsetConverter.UnicodeToMS874("คำสำคัญ (ไทย และ อังกฤษ)");
			  temp[3] =  CharsetConverter.UnicodeToMS874("ชื่อผู้แต่ง (ไทย และ อังกฤษ)");			 
			  temp[4] =  CharsetConverter.UnicodeToMS874( "สาขา (ไทย และ อังกฤษ)");
			  temp[5] = CharsetConverter.UnicodeToMS874("สาขาย่อย (ไทย และ อังกฤษ)");
			  temp[6] =  CharsetConverter.UnicodeToMS874( "มหาวิทยาลัย, สถานที่ทำงาน");


			if(select.equals(temp[0])){//หาโดย ชื่อวิทยานิพนธ์ภาษาไทย				  
				  if( !(connectDB()) ){	
						try 
						{								
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT THAI_TITLE FROM LIBRARY_ITEM WHERE THAI_TITLE like '%"+info1+"%'");
	        					
								while (rs.next()) {											   
										//templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										//result.addElement( new StoreLink(rs.getString(2), Location) );
										ReturnS += "<option>"+rs.getString(1)+"</option>";
								}
								rs.close();
								stmt.close();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}
				  }		
			}//END ชื่อวิทยานิพนธ์ภาษาไทย

			if( select.equals(temp[1]) ){//หาโดยชื่อวิทยานิพนธ์ภาษาอังกฤษ
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT THAI_TITLE FROM LIBRARY_ITEM WHERE ENGLISH_TITLE like '%"+info1+"%'");
	        			
								while (rs.next()) {				
										//templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										//result.addElement( new StoreLink(rs.getString(2), Location) );
										ReturnS += "<option>"+rs.getString(1)+"</option>";
								}
								rs.close();
								stmt.close();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}
				  }		
			}//END ชื่อวิทยานิพนธ์ภาษาอังกฤษ

			if(select.equals(temp[2]) ){//หาโดย =="คำสำคัญ (ไทย และ อังกฤษ)"
				  //out.println("creator1");
				  if( !(connectDB()) ){							
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
									"SELECT "+ 
											"THAI_TITLE"+ 
											 //"LIBRARY_ITEM.THAI_TITLE"+
									" FROM "+
											"KEYWORD,"+
											"LIBRARY_ITEM"+
									" WHERE"+ 																						
														" KEYWORD.KEYWORD like '%"+info1+"%'"+												
											" AND"+
														" KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"								
								);
	        			
								while (rs.next()) {	
										ReturnS += "<option>"+rs.getString(1)+"</option>";
								}
								rs.close();
								stmt.close();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
				  }
			}//END คำสำคัญ (ไทย และ อังกฤษ)

			
			//************************************* Please Check After This(SQL)**************************
			if(select.equals(temp[3])  ){//หาโดย== "ชื่อผู้แต่ง (ไทย และ อังกฤษ)"
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
											"SELECT "+
													"THAI_TITLE"+
													//"LIBRARY_ITEM.THAI_TITLE"+
											" FROM "+
													"LIBRARY_ITEM, "+
													"LIBRARY_ITEM_CREATOR, "+
													"CREATOR"+
											" WHERE "+																								
															"(LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID)"+													
												" AND "+													
																	"(CREATOR.FIRST_NAME like '%"+info1+"%'"+
															" OR  CREATOR.LAST_NAME like '%"+info1+"%' )"													
										);
																	        		
								while (rs.next()) {				
										//templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										//result.addElement( new StoreLink(rs.getString(2), Location) );
										ReturnS += "<option>"+rs.getString(1)+"</option>";
								}
								rs.close();
								stmt.close();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
				  }
			}//END ชื่อผู้แต่ง (ไทย และ อังกฤษ)


			if(select.equals(temp[4]) ){//หาโดย== "สาขา (ไทย และ อังกฤษ)" 
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
										"SELECT "+
												"THAI_TITLE"+
												//"LIBRARY_ITEM.THAI_TITLE "+
										" FROM "+
												"LIBRARY_ITEM,"+
												"SUB_MAJOR,"+
												"MAJOR"+
										" WHERE "+																									
															"(SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID AND "+
															"MAJOR.MAJOR_ID = SUB_MAJOR.MAJOR_ID)"+														
													" AND "+														
															" (MAJOR.MAJOR_THAI_NAME like '%"+info1+"%' "+
															" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+info1+"%')"																														
										);
	        			
								while (rs.next()) {				
										ReturnS += "<option>"+rs.getString(1)+"</option>";
								}
								rs.close();
								stmt.close();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}
				  }
			}//END สาขา (ไทย และ อังกฤษ)

			if( select.equals(temp[5]) ){//หาโดย =="สาขาย่อย (ไทย และ อังกฤษ)"
 			  if( !(connectDB()) ){	
					try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
										"SELECT "+
												"THAI_TITLE"+
												//"LIBRARY_ITEM.THAI_TITLE" +
										" FROM "+
												"LIBRARY_ITEM,"+
												"SUB_MAJOR"+
										" WHERE "+																							
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+												
												" AND "+													
															"(SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+info1+"%' "+
													" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+info1+"%' )"																																					
								);
	        			
								while (rs.next()) {				
										//templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										//result.addElement( new StoreLink(rs.getString(2), Location) );
										ReturnS += "<option>"+rs.getString(1)+"</option>";
								}
								rs.close();
								stmt.close();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
			   }
			}//END สาขาย่อย (ไทย และ อังกฤษ)

			if(select.equals(temp[6]) ){//หาโดย=="มหาวิทยาลัย, สถานที่ทำงาน"
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
										"SELECT "+
												"THAI_TITLE"+
												//"LIBRARY_ITEM.THAI_TITLE" +
										" FROM "+
												"LIBRARY_ITEM,"+
												"PUBLISHER"+
										" WHERE "+																								
														"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID"+													
												" AND "+													
															"( PUBLISHER.PUBLISHER_THAI_NAME like '%"+info1+"%' "+
													" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+info1+"%') "																																					
								);
	        			
								while (rs.next()) {				
										//templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										//result.addElement( new StoreLink(rs.getString(2), Location) );
										ReturnS += "<option>"+rs.getString(1)+"</option>";
								}
								rs.close();
								stmt.close();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
				  }
			}//END มหาวิทยาลัย, สถานที่ทำงาน
		return( ReturnS );	
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


}
