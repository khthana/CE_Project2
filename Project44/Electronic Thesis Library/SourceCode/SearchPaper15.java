package proj_lib.db;

import java.io.*;
import java.util.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
import java.sql.*;

public class SearchPaper15 extends HttpServlet {
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

	public void FirstPage(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
			String htmlOutput;
			String title = CharsetConverter.MS874ToUnicode("ผลการค้นหาวิทยานิพนธ์");

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();		
			
				htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n" +
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";			
			//htmlOutput +="Result of Searching Paper";

			if( !(connectDB()) ){					
					htmlOutput += "<center>"+ShowSearch()+"</center>";
					htmlOutput += MainFind(request,  response);// Result of searching here!

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


					closeConnectionDB();
			}
			else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
								htmlOutput += "<br><br>";
								htmlOutput += "<form name=\"form1\" method=\"post\" action=\"http://161.246.39.79/~proj_lib/searchPage15.html\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปเพื่อค้นหา  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";								
			}

			htmlOutput += "</BODY></HTML>" ;
			out.println( htmlOutput );
	}

	String buildTagLink( String name, String locate ) {
		return( "<A href=\"" + locate + "\" target=\"\">" + name + "</A>\n" );
	}// function buildTagLink

	
	public String ShowSearch(){
			String output = "";
			 output += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.SearchPaper15\">"+
    "<hr width=\"500\" size=\"3\">"+
    "<table width=\"70%\" border=\"0\">"+
      "<tr> "+
        "<td width=\"23%\">"+ 
          "<div align=\"right\"><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">ค้นหา "+
           " : </font></div>"+
        "</td>"+
        "<td width=\"32%\"> "+
          "<div align=\"center\"> "+
            "<input type=\"text\" name=\"find1\" size=\"30\" maxlength=\"60\">"+
          "</div>"+
        "</td>"+
        "<td width=\"33%\">"+ 
          "<div align=\"center\">"+ 
            "<select name=\"select1\">"+
              "<option>ชื่อวิทยานิพนธ์ภาษาไทย</option>"+
              "<option>ชื่อวิทยานิพนธ์ภาษาอังกฤษ</option>"+
              "<option>คำสำคัญ (ไทย และ อังกฤษ)</option>"+
              "<option>ชื่อผู้แต่ง (ไทย และ อังกฤษ)</option>"+
              "<option>สาขา (ไทย และ อังกฤษ)</option>"+
              "<option>สาขาย่อย (ไทย และ อังกฤษ)</option>"+
              "<option>มหาวิทยาลัย, สถานที่ทำงาน</option>"+
              "<option>ปีการศึกษา</option>"+
            "</select>"+
          "</div>"+
        "</td>"+
        "<td width=\"12%\">"+ 
          "<div align=\"center\"></div>"+
        "</td>"+
      "</tr>"+
      "<tr>"+ 
        "<td width=\"23%\">"+ 
          "<div align=\"right\"><font size=\"4\"><font size=\"4\"><font face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\">และค้นหา "+
            ":</font></font></font></font><b><b><b><b><b><b><font size=\"4\"><font size=\"4\"><font face=\"Browallia New, BrowalliaUPC\"><font face=\"Browallia New, BrowalliaUPC\"><b><b><b>"+ 
            "</b></b></b></font></font></font></font></b></b></b></b></b></b></div>"+
        "</td>"+
        "<td width=\"32%\">"+ 
          "<div align=\"center\">"+ 
            "<input type=\"text\" name=\"find2\" size=\"30\" maxlength=\"60\">"+
          "</div>"+
        "</td>"+
        "<td width=\"33%\">"+ 
          "<div align=\"center\">"+ 
            "<select name=\"select2\">"+
              "<option>ชื่อวิทยานิพนธ์ภาษาไทย</option>"+
              "<option>ชื่อวิทยานิพนธ์ภาษาอังกฤษ</option>"+
              "<option>คำสำคัญ (ไทย และ อังกฤษ)</option>"+
              "<option>ชื่อผู้แต่ง (ไทย และ อังกฤษ)</option>"+
              "<option>สาขา (ไทย และ อังกฤษ)</option>"+
              "<option>สาขาย่อย (ไทย และ อังกฤษ)</option>"+
              "<option>มหาวิทยาลัย, สถานที่ทำงาน</option>"+
              "<option>ปีการศึกษา</option>"+
            "</select>"+
          "</div>"+
        "</td>"+
        "<td width=\"12%\">"+ 
          "<div align=\"center\">"+ 
            "<input type=\"submit\" name=\"Submit\" value=\"ค้นหา\">"+
          "</div>"+
        "</td>"+
      "</tr>"+
    "</table>  <hr width=\"500\" size=\"3\">"+
  "</form>";			
	return(output);
	}
	
	public String MainFind(HttpServletRequest request, HttpServletResponse response) throws IOException {
							Vector Result = new Vector();
							String returnString = "";
							StoreLink temp;				

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();	
			String output="";
					
					String info1 = request.getParameter( "find1");
					String info2 = request.getParameter( "find2" );
					String Byinfo1 = request.getParameter( "select1" );
					String Byinfo2 = request.getParameter( "select2" );



					if(info1.equals("")){
								returnString += "<br><br>";
								returnString +="<center>***********************************************</center><br>";
								returnString +="<H3 ALIGN=\"CENTER\">กรุณาป้อนข้อมูลที่ต้องการค้นหา</H3>\n";	
								returnString += "<center>***********************************************</center>";
					}
					
					else if( info2.equals("") ){							
							returnString += "<font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode("ค้นหา : ")+"<b>"+CharsetConverter.MS874ToUnicode(request.getParameter( "find1"))+"</b>"+CharsetConverter.MS874ToUnicode("           ใน : ")+"<b>"+CharsetConverter.MS874ToUnicode(request.getParameter( "select1"))+"</b></font><br>";
							Result =  findFRinfo1(info1, Byinfo1, response);
					}
					else{
							returnString += "<font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode("ค้นหา : ")+"<b>"+CharsetConverter.MS874ToUnicode(request.getParameter( "find1"))+"</b>"+CharsetConverter.MS874ToUnicode("           ใน : ")+"<b>"+CharsetConverter.MS874ToUnicode(request.getParameter( "select1"))+"</b></font><br>";
							returnString += "<font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode("ค้นหา : ")+"<b>"+CharsetConverter.MS874ToUnicode(request.getParameter( "find2"))+"</b>"+CharsetConverter.MS874ToUnicode("           ใน : ")+"<b>"+CharsetConverter.MS874ToUnicode(request.getParameter( "select2"))+"</b></font><br>";
							Result = findFRinfo2(info1, info2, Byinfo1, Byinfo2, response);
					}

					int num = Result.size();
					returnString += "<font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode("พบวิทยานิพนธ์ทั้งหมด :  ")+"<b>"+num+"</b>"+"</font>\n";
					returnString += "<hr width=\"600\" size=\"3\">\n";

					for ( int counter=0; counter<Result.size(); counter++ )
					{
							temp = (StoreLink)Result.elementAt( counter );
							returnString = returnString.concat( "<LI>" +" <font size=\"4\" face=\"Browallia New, BrowalliaUPC\">ชื่อวิทยานิพนธ์  :  </font>"+buildTagLink( temp.getThesisName(), temp.getThesisLocate() ) );
					}

					if(Result.size() == 0){
								returnString += "<br><br>";
								returnString +="<center>***********************************************</center><br>";
								returnString +="<H3 ALIGN=\"CENTER\">ไม่พบวิทยานิพนธ์ตามการค้นหาดังกล่าว</H3>\n";	
								returnString += "<center>***********************************************</center>";
					}

			return(returnString);		
	}//end function find


	public Vector findFRinfo1(String info, String Byinfo, HttpServletResponse response) throws IOException {
		Vector result = new Vector();
		String Location = "http://www.graduate.kmitl.ac.th/servlet/proj_lib.pdf.ReadPDF1?index=";
		String templink;
		//StoreLink temp;		
			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();	
			String output="";

			String Byinfo1 = CharsetConverter.UnicodeToMS874(Byinfo);
			String info1 = CharsetConverter.MS874ToUnicode(info);

			  String temp[] = new String[8];
			  temp[0] =  CharsetConverter.UnicodeToMS874( "ชื่อวิทยานิพนธ์ภาษาไทย");
			  temp[1] =  CharsetConverter.UnicodeToMS874("ชื่อวิทยานิพนธ์ภาษาอังกฤษ");
			  temp[2] =  CharsetConverter.UnicodeToMS874("คำสำคัญ (ไทย และ อังกฤษ)");
			  temp[3] =  CharsetConverter.UnicodeToMS874("ชื่อผู้แต่ง (ไทย และ อังกฤษ)");			 
			  temp[4] =  CharsetConverter.UnicodeToMS874( "สาขา (ไทย และ อังกฤษ)");
			  temp[5] = CharsetConverter.UnicodeToMS874("สาขาย่อย (ไทย และ อังกฤษ)");
			  temp[6] =  CharsetConverter.UnicodeToMS874( "มหาวิทยาลัย, สถานที่ทำงาน");
			  temp[7] =  CharsetConverter.UnicodeToMS874( "ปีการศึกษา");


			if(Byinfo.equals(temp[0])){//หาโดย ชื่อวิทยานิพนธ์ภาษาไทย				  
				  if( !(connectDB()) ){	
						try 
						{								
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT LIBRARY_ITEM_ID, THAI_TITLE FROM LIBRARY_ITEM WHERE THAI_TITLE like '%"+info1+"%'");
	        					
								while (rs.next()) {											   
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}
				  }		
			}//END ชื่อวิทยานิพนธ์ภาษาไทย

			if(Byinfo.equals(temp[7])){//หาโดย ปีการศึกษา				  
				  if( !(connectDB()) ){	
						try 
						{								
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT LIBRARY_ITEM_ID, THAI_TITLE FROM LIBRARY_ITEM WHERE YEAR like '%"+info1+"%'");
	        					
								while (rs.next()) {											   
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}
				  }		
			}//END ปีการศึกษา


			if( Byinfo.equals(temp[1]) ){//หาโดยชื่อวิทยานิพนธ์ภาษาอังกฤษ
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT LIBRARY_ITEM_ID, THAI_TITLE FROM LIBRARY_ITEM WHERE ENGLISH_TITLE like '%"+info1+"%'");
	        			
								while (rs.next()) {				
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}
				  }		
			}//END ชื่อวิทยานิพนธ์ภาษาอังกฤษ

			if(Byinfo.equals(temp[2]) ){//หาโดย =="คำสำคัญ (ไทย และ อังกฤษ)"
				  //out.println("creator1");
				  if( !(connectDB()) ){							
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
									"SELECT "+ 
											"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+ 
											 "LIBRARY_ITEM.THAI_TITLE"+
									" FROM "+
											"KEYWORD,"+
											"LIBRARY_ITEM"+
									" WHERE"+ 																						
														" KEYWORD.KEYWORD like '%"+info1+"%'"+												
											" AND"+
														" KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"								
								);
	        			
								while (rs.next()) {	
									 // out.println("creator2");
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
				  }
			}//END คำสำคัญ (ไทย และ อังกฤษ)

			
			//************************************* Please Check After This(SQL)**************************
			if(Byinfo.equals(temp[3])  ){//หาโดย== "ชื่อผู้แต่ง (ไทย และ อังกฤษ)"
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
											"SELECT "+
													"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													"LIBRARY_ITEM.THAI_TITLE"+
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
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
				  }
			}//END ชื่อผู้แต่ง (ไทย และ อังกฤษ)


			if(Byinfo.equals(temp[4]) ){//หาโดย== "สาขา (ไทย และ อังกฤษ)" 
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
										"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID ,"+
												"LIBRARY_ITEM.THAI_TITLE "+
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
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}
				  }
			}//END สาขา (ไทย และ อังกฤษ)

			if( Byinfo.equals(temp[5]) ){//หาโดย =="สาขาย่อย (ไทย และ อังกฤษ)"
 			  if( !(connectDB()) ){	
					try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
										"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
												"LIBRARY_ITEM.THAI_TITLE" +
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
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
			   }
			}//END สาขาย่อย (ไทย และ อังกฤษ)

			if(Byinfo.equals(temp[6]) ){//หาโดย=="มหาวิทยาลัย, สถานที่ทำงาน"
				  if( !(connectDB()) ){	
						try 
						{
								// retrieve data from the database
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery(
										"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
												"LIBRARY_ITEM.THAI_TITLE" +
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
										templink = String.valueOf( rs.getInt(1) );
										//Location += templink;
										result.addElement( new StoreLink(rs.getString(2), Location+templink) );
								}
								rs.close();
								stmt.close();
								closeConnectionDB();
						}
						catch ( SQLException excp ) { 
								excp.printStackTrace();
								errorMsg =  excp.toString() ;
						}	
				  }
			}//END มหาวิทยาลัย, สถานที่ทำงาน
		return( result );
	}//End function find1			
	
	public Vector findFRinfo2(String info1, String info2, String Byinfo1, String Byinfo2, HttpServletResponse response) throws IOException {
		Vector result = new Vector();
		String Location = "http://www.graduate.kmitl.ac.th/servlet/proj_lib.pdf.ReadPDF?index=";
		String templink;
		//StoreLink temp;		
			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();	
			String output="";

			//String Byinfo1 = CharsetConverter.UnicodeToMS874(Byinfo);
			//String info1 = CharsetConverter.MS874ToUnicode(info);

			String By1 = CharsetConverter.UnicodeToMS874(Byinfo1);
			String By2 = CharsetConverter.UnicodeToMS874(Byinfo2);
			String in1 = CharsetConverter.MS874ToUnicode(info1);
			String in2 = CharsetConverter.MS874ToUnicode(info2);

			  String temp[] = new String[8];
			  temp[0] =  CharsetConverter.UnicodeToMS874( "ชื่อวิทยานิพนธ์ภาษาไทย");
			  temp[1] =  CharsetConverter.UnicodeToMS874("ชื่อวิทยานิพนธ์ภาษาอังกฤษ");
			  temp[2] =  CharsetConverter.UnicodeToMS874("คำสำคัญ (ไทย และ อังกฤษ)");
			  temp[3] =  CharsetConverter.UnicodeToMS874("ชื่อผู้แต่ง (ไทย และ อังกฤษ)");			 
			  temp[4] =  CharsetConverter.UnicodeToMS874( "สาขา (ไทย และ อังกฤษ)");
			  temp[5] = CharsetConverter.UnicodeToMS874("สาขาย่อย (ไทย และ อังกฤษ)");
			  temp[6] =  CharsetConverter.UnicodeToMS874( "มหาวิทยาลัย, สถานที่ทำงาน");
			  temp[7] =  CharsetConverter.UnicodeToMS874( "ปีการศึกษา");


				//	 ปี ไทย
				if(Byinfo1.equals(temp[7]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+ 
														"LIBRARY_ITEM.THAI_TITLE" +
												" FROM "+
														"LIBRARY_ITEM"+
												" WHERE "+													
																 "LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%'" +
																" AND  LIBRARY_ITEM.YEAR like '%"+in1+"%'" 													
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}

				// ปี อังกฤษ
				if(Byinfo1.equals(temp[7]) && Byinfo2.equals(temp[1]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM"+
												" WHERE "+													
													    "LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%'"+ 
													   " AND  LIBRARY_ITEM.YEAR like '%"+in1+"%'" 													
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}


				//คำสำคัญ YEAR
				if(Byinfo1.equals(temp[7]) && Byinfo2.equals(temp[2]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
													"SELECT "+
															"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
															"LIBRARY_ITEM.THAI_TITLE" +
													" FROM "+
															"LIBRARY_ITEM,"+
															"KEYWORD"+
													" WHERE "	+														
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"+															
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in2+"%'" +
																" AND  LIBRARY_ITEM.YEAR like '%"+in1+"%' )"																	
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}

				//ผู้แต่ง YEAR
				if(Byinfo1.equals(temp[7]) && Byinfo2.equals(temp[3]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
													 "LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													 "LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
													"LIBRARY_ITEM,"+
													"CREATOR,"+
													"LIBRARY_ITEM_CREATOR"+
												" WHERE "+													
														"("+
																"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM_CREATOR.CREATOR_ID = CREATOR.CREATOR_ID"+
														 ")"+
													" AND "+
																 "(LIBRARY_ITEM.YEAR like '%"+in1+"%'"+
														" AND ( CREATOR.FIRST_NAME like '%"+in2+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in2+"%' ))"																			
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}

				//สาขา YEAR
				if(Byinfo1.equals(temp[7]) && Byinfo2.equals(temp[4]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
											    "LIBRARY_ITEM.THAI_TITLE"+ 
											" FROM "+
												"LIBRARY_ITEM,"+
												"MAJOR,"+
												"SUB_MAJOR"+
											" WHERE " +
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
											" AND "+
													"( LIBRARY_ITEM.YEAR like '%"+in1+"%'"+
												" AND ( MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'" +
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
  										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}
		
				//สาขาย่อย YEAR
				if(Byinfo1.equals(temp[7]) && Byinfo2.equals(temp[5]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"SUB_MAJOR"+
												" WHERE "+											
															"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+													
													" AND "+
															"( LIBRARY_ITEM.YEAR like '%"+in1+"%'"+ 
															" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
   										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}

				//ที่ทำงาน YEAR
				if(Byinfo1.equals(temp[7]) && Byinfo2.equals(temp[6]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER"+
												" WHERE "+											
															"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID"+													
													" AND "+
															"( LIBRARY_ITEM.YEAR like '%"+in1+"%'"+ 
															" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}


				//******************************ปี*************************//
				
				//	ไทย ไทย
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+ 
														"LIBRARY_ITEM.THAI_TITLE" +
												" FROM "+
														"LIBRARY_ITEM"+
												" WHERE "+													
																 "LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%'" +
																" AND  LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%'" 													
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close();
										closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}
						
				
				//	ไทย ปี
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[7]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+ 
														"LIBRARY_ITEM.THAI_TITLE" +
												" FROM "+
														"LIBRARY_ITEM"+
												" WHERE "+													
																 "LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%'" +
																" AND  LIBRARY_ITEM.YEAR like '%"+in2+"%'" 													
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}

				//ไทย อังกฤษ
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[1])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"PROJ_LIB.LIBRARY_ITEM"+
												" WHERE "+
																 "LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%' "+
															" AND LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%'" 																		
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}				
				
				//ไทย คำสำคัญ
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[2])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
													"SELECT "+
															"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
															"LIBRARY_ITEM.THAI_TITLE" +
													" FROM "+
															"LIBRARY_ITEM,"+
															"KEYWORD"+
													" WHERE "	+														
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"+															
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in2+"%'" +
																" AND  LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%' )"																	
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}		
				
				//ไทย ผูุ้้แต่ง
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[3])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
													 "LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													 "LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
													"LIBRARY_ITEM,"+
													"CREATOR,"+
													"LIBRARY_ITEM_CREATOR"+
												" WHERE "+													
														"("+
																"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM_CREATOR.CREATOR_ID = CREATOR.CREATOR_ID"+
														 ")"+
													" AND "+
																 "(LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%'"+
														" AND ( CREATOR.FIRST_NAME like '%"+in2+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in2+"%' ))"																			
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}				
				
				//ไทย สาขา
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[4]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
											    "LIBRARY_ITEM.THAI_TITLE"+ 
											" FROM "+
												"LIBRARY_ITEM,"+
												"MAJOR,"+
												"SUB_MAJOR"+
											" WHERE " +
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
											" AND "+
													"( LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%'"+
												" AND ( MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'" +
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
  										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}				

				//ไทย สาขาย่อย
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[5]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"SUB_MAJOR"+
												" WHERE "+											
															"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+													
													" AND "+
															"( LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%'"+ 
															" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
   										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}				
				
				//ไทย ที่ทำงาน
				if(Byinfo1.equals(temp[0]) && Byinfo2.equals(temp[6]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER"+
												" WHERE "+											
															"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID"+													
													" AND "+
															"( LIBRARY_ITEM.THAI_TITLE like '%"+in1+"%'"+ 
															" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}				

//เริ่มด้วยเรื่องอังกฤษ					
//*********************************************************************************//
				//อังกฤษ ไทย
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM"+
												" WHERE "+													
													    "LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%'"+ 
													   " AND  LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%'" 													
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}


				//อังกฤษ ปี
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[7]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM"+
												" WHERE "+													
													    "LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%'"+ 
													   " AND  LIBRARY_ITEM.YEAR like '%"+in2+"%'" 													
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}


				//อังกฤษ อังกฤษ
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[1])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM"+
												" WHERE "+													
													    "LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%'"+ 
													   " AND  LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%'" 													
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );												
				}				

				//อังกฤษ คำสำคัญ
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[2])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
													"SELECT "+
															"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
															"LIBRARY_ITEM.THAI_TITLE" +
													" FROM "+
															"LIBRARY_ITEM,"+
															"KEYWORD"+
													" WHERE "	+														
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"+															
														" AND "+
																"( KEYWORD.KEYWORD like '%"+in2+"%'" +
																" AND  LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%' )"																	
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}			

				//.อังกฤษ ผู้แต่ง
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[3])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
													 "LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													 "LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
													"LIBRARY_ITEM,"+
													"CREATOR,"+
													"LIBRARY_ITEM_CREATOR"+
												" WHERE "+													
														"("+
																"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM_CREATOR.CREATOR_ID = CREATOR.CREATOR_ID"+
														 ")"+
													" AND "+
																 "(LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%'"+
														" AND ( CREATOR.FIRST_NAME like '%"+in2+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in2+"%' ))"																			
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );
				}				

				//อังกฤษ สาขา
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[4]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
											    "LIBRARY_ITEM.THAI_TITLE"+ 
											" FROM "+
												"LIBRARY_ITEM,"+
												"MAJOR,"+
												"SUB_MAJOR"+
											" WHERE " +
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
											" AND "+
													"(LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%'"+
												" AND ( MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'" +
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
  										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}				

				//อังกฤษ สาขาย่อย
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[5]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"SUB_MAJOR"+
												" WHERE "+											
															"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+													
													" AND "+
															"(LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%'"+ 
															" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
   										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}				

				//อังกฤษ ที่ทำงาน
				if(Byinfo1.equals(temp[1]) && Byinfo2.equals(temp[6]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER"+
												" WHERE "+											
															"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID"+													
													" AND "+
															"( LIBRARY_ITEM.ENGLISH_TITLE like '%"+in1+"%'"+ 
															" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}		

//เริ่มด้วยคำสำคัญ
//*********************************************************************************//
				//คำสำคัญ ไทย
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
													"SELECT "+
															"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
															"LIBRARY_ITEM.THAI_TITLE" +
													" FROM "+
															"LIBRARY_ITEM,"+
															"KEYWORD"+
													" WHERE "	+														
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"+															
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in1+"%'" +
																" AND  LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%' )"																	
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}


				//คำสำคัญ YEAR
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[7]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
													"SELECT "+
															"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
															"LIBRARY_ITEM.THAI_TITLE" +
													" FROM "+
															"LIBRARY_ITEM,"+
															"KEYWORD"+
													" WHERE "	+														
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"+															
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in1+"%'" +
																" AND  LIBRARY_ITEM.YEAR like '%"+in2+"%' )"																	
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}


				//คำสำคัญ อังกฤษ
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[1])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
													"SELECT "+
															"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
															"LIBRARY_ITEM.THAI_TITLE" +
													" FROM "+
															"LIBRARY_ITEM,"+
															"KEYWORD"+
													" WHERE "	+														
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"+															
														" AND "+
																"( KEYWORD.KEYWORD like '%"+in1+"%'" +
																" AND  LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%' )"																	
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}				

				//คำสำคัญ คำสำคัญ
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[2])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
													"SELECT "+
															"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
															"LIBRARY_ITEM.THAI_TITLE" +
													" FROM "+
															"LIBRARY_ITEM,"+
															"KEYWORD"+
													" WHERE "	+														
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID"+															
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in1+"%'" +
																" AND  KEYWORD.KEYWORD like '%"+in2+"%' )"																	
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}			

				//คำสำคัญ ผู้แต่ง
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[3])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
												"LIBRARY_ITEM.THAI_TITLE"+
											" FROM "+
												"LIBRARY_ITEM,"+
												"KEYWORD,"+
												"LIBRARY_ITEM_CREATOR,"+
												"CREATOR"+
											" WHERE "+												
												"("+
													"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
													"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = KEYWORD.LIBRARY_ITEM_ID AND "+
													"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID"+
												 ")"+
												" AND "+
													"(KEYWORD.KEYWORD like '%"+in1+"%' "+
													" AND (CREATOR.FIRST_NAME like '%"+in2+"%'"+
														" OR  CREATOR.LAST_NAME like '%"+in2+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}				

				//คำสำคัญ สาขา
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[4]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"KEYWORD,"+
														"SUB_MAJOR,"+
														"MAJOR"+
												" WHERE "+
														"("+
															"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"MAJOR.MAJOR_ID = SUB_MAJOR.MAJOR_ID AND "+
															"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
													 " AND "+
															"(KEYWORD.KEYWORD like '%"+in1+"%'"+
															" AND (MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'"+ 
																" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"  									
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );												
				}				

				//คำสำคัญ สาขาย่อย
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[5]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"KEYWORD,"+
														"SUB_MAJOR"+
												" WHERE "+
														"("+
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in1+"%'"+
															" AND (SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+
																" OR SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"  									
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																
				}				

				//คำสำคัญ ที่ทำงาน
				if(Byinfo1.equals(temp[2]) && Byinfo2.equals(temp[6]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"KEYWORD,"+
														"PUBLISHER"+
												" WHERE "+												
														"("+
															"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"LIBRARY_ITEM.PUBLISHER_ID = PUBLISHER.PUBLISHER_ID"+
															")"+
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in1+"%'"+
															" AND (PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'" +
																" OR PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' ))"  								
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																				
				}				

//เริ่มด้วยผู้แต่ง
//*********************************************************************************//
				//ผู้แต่ง ไทย
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
													 "LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													 "LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
													"LIBRARY_ITEM,"+
													"CREATOR,"+
													"LIBRARY_ITEM_CREATOR"+
												" WHERE "+													
														"("+
																"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM_CREATOR.CREATOR_ID = CREATOR.CREATOR_ID"+
														 ")"+
													" AND "+
																 "(LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%'"+
														" AND ( CREATOR.FIRST_NAME like '%"+in1+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in1+"%' ))"																			
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}

				//ผู้แต่ง YEAR
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[7]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
													 "LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													 "LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
													"LIBRARY_ITEM,"+
													"CREATOR,"+
													"LIBRARY_ITEM_CREATOR"+
												" WHERE "+													
														"("+
																"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM_CREATOR.CREATOR_ID = CREATOR.CREATOR_ID"+
														 ")"+
													" AND "+
																 "(LIBRARY_ITEM.YEAR like '%"+in2+"%'"+
														" AND ( CREATOR.FIRST_NAME like '%"+in1+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in1+"%' ))"																			
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}

				//ผ้แต่ง อังกฤษู็็็
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[1])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
													 "LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													 "LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
													"LIBRARY_ITEM,"+
													"CREATOR,"+
													"LIBRARY_ITEM_CREATOR"+
												" WHERE "+													
														"("+
																"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM_CREATOR.CREATOR_ID = CREATOR.CREATOR_ID"+
														 ")"+
													" AND "+
																 "(LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%'"+
														" AND ( CREATOR.FIRST_NAME like '%"+in1+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in1+"%' ))"																			
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}				

				//ผู้แต่ง คำสำคัญ
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[2])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
												"LIBRARY_ITEM.THAI_TITLE"+
											" FROM "+
												"LIBRARY_ITEM,"+
												"KEYWORD,"+
												"LIBRARY_ITEM_CREATOR,"+
												"CREATOR"+
											" WHERE "+												
												"("+
													"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
													"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = KEYWORD.LIBRARY_ITEM_ID AND "+
													"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID"+
												 ")"+
												" AND "+
													"(KEYWORD.KEYWORD like '%"+in2+"%' "+
													" AND (CREATOR.FIRST_NAME like '%"+in1+"%'"+
														" OR  CREATOR.LAST_NAME like '%"+in1+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );												
				}			

				//ผู้แต่ง ผู้แต่ง
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[3])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
													 "LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
													 "LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
													"LIBRARY_ITEM,"+
													"CREATOR,"+
													"LIBRARY_ITEM_CREATOR"+
												" WHERE "+													
														"("+
																"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM_CREATOR.CREATOR_ID = CREATOR.CREATOR_ID"+
														 ")"+
													" AND "+
																 "(( CREATOR.FIRST_NAME like '%"+in1+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in1+"%')"+
														" AND ( CREATOR.FIRST_NAME like '%"+in2+"%'" +
																" OR  CREATOR.LAST_NAME like '%"+in2+"%' ))"																			
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}				

				//ผู้แต่ง สาขา
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[4]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"LIBRARY_ITEM_CREATOR,"+
														"CREATOR,"+
														"SUB_MAJOR,"+
														"MAJOR"+
												" WHERE "+
												"("+     
														"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
														"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID AND "+
														"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID AND "+
														"MAJOR.MAJOR_ID = SUB_MAJOR.MAJOR_ID"+
													")"+
												" AND "+
															"( ( MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'"+ 
															" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' )"+
													" AND ( CREATOR.FIRST_NAME like '%"+in1+"%'"+ 
															" OR  CREATOR.LAST_NAME like '%"+in1+"%') )"
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );														
				}				

				//ผู้แต่ง สาขาย่อย
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[5]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"LIBRARY_ITEM_CREATOR,"+
														"CREATOR,"+
														"SUB_MAJOR"+
												" WHERE "+  
														"("+
															"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID AND "+
															"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
													" AND "+
														"((CREATOR.FIRST_NAME like '%"+in1+"%'"+
															" OR  CREATOR.LAST_NAME like '%"+in1+"%' )"+
													" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+ 
															" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"  			
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );														
				}				

				//ผู้แต่ง ที่ทำงาน
				if(Byinfo1.equals(temp[3]) && Byinfo2.equals(temp[6]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"LIBRARY_ITEM_CREATOR,"+
														"CREATOR,"+
														"PUBLISHER"+
												" WHERE "+  
														"("+
															"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID AND "+
															"LIBRARY_ITEM.PUBLISHER_ID = PUBLISHER.PUBLISHER_ID"+
														")"+
													" AND "+
														"((CREATOR.FIRST_NAME like '%"+in1+"%'"+
															" OR  CREATOR.LAST_NAME like '%"+in1+"%' )"+
													" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'"+ 
															" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' ))"  			
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																		
				}		

//เริ่มด้วย สาขา
//*********************************************************************************//
				//สาขา ไทย
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
											    "LIBRARY_ITEM.THAI_TITLE"+ 
											" FROM "+
												"LIBRARY_ITEM,"+
												"MAJOR,"+
												"SUB_MAJOR"+
											" WHERE " +
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
											" AND "+
													"( LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%'"+
												" AND ( MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'" +
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"
  										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}

				//สาขา YEAR
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[7]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
											    "LIBRARY_ITEM.THAI_TITLE"+ 
											" FROM "+
												"LIBRARY_ITEM,"+
												"MAJOR,"+
												"SUB_MAJOR"+
											" WHERE " +
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
											" AND "+
													"( LIBRARY_ITEM.YEAR like '%"+in2+"%'"+
												" AND ( MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'" +
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"
  										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}



				//สาขา อังกฤษ
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[1])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
											    "LIBRARY_ITEM.THAI_TITLE"+ 
											" FROM "+
												"LIBRARY_ITEM,"+
												"MAJOR,"+
												"SUB_MAJOR"+
											" WHERE " +
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
											" AND "+
													"(LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%'"+
												" AND ( MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'" +
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"
  										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}				

				//สาขา คำสำคัญ
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[2])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"KEYWORD,"+
														"SUB_MAJOR,"+
														"MAJOR"+
												" WHERE "+
														"("+
															"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"MAJOR.MAJOR_ID = SUB_MAJOR.MAJOR_ID AND "+
															"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
													 " AND "+
															"(KEYWORD.KEYWORD like '%"+in2+"%'"+
															" AND (MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'"+ 
																" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"  									
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																
				}			

				//สาขา ผู้แต่ง
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[3])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"LIBRARY_ITEM_CREATOR,"+
														"CREATOR,"+
														"SUB_MAJOR,"+
														"MAJOR"+
												" WHERE "+
												"("+     
														"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
														"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID AND "+
														"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID AND "+
														"MAJOR.MAJOR_ID = SUB_MAJOR.MAJOR_ID"+
													")"+
												" AND "+
															"( ( MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'"+ 
															" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' )"+
													" AND ( CREATOR.FIRST_NAME like '%"+in2+"%'"+ 
															" OR  CREATOR.LAST_NAME like '%"+in2+"%') )"
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );										
				}				

				//สาขา สาขา
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[4]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
											"SELECT "+
												"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
											    "LIBRARY_ITEM.THAI_TITLE"+ 
											" FROM "+
												"LIBRARY_ITEM,"+
												"MAJOR,"+
												"SUB_MAJOR"+
											" WHERE " +
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
											" AND "+
														"((MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'" +
															" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' )"+
												" AND ( MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'" +
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
  										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}				

				//สาขา สาขาย่อย
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[5]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"MAJOR,"+
														"SUB_MAJOR"+
												" WHERE "+ 
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
													" AND "+
														"(( MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'"+ 
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' )"+
													" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+
														" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
     									);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );				
				}				

				//สาขา ที่ทำงาน
				if(Byinfo1.equals(temp[4]) && Byinfo2.equals(temp[6]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"MAJOR,"+
														"SUB_MAJOR,"+
														"PUBLISHER"+
												" WHERE "+ 
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID AND "+
														"LIBRARY_ITEM.PUBLISHER_ID = PUBLISHER.PUBLISHER_ID"+
													")"+
													" AND "+
														"(( MAJOR.MAJOR_THAI_NAME like '%"+in1+"%'"+ 
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in1+"%' )"+
													" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'"+
														" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' ))"
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																						
				}	

	//เริ่มด้วยสาขาย่อย			
//*********************************************************************************//
				//สาขาย่อย ไทย
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"SUB_MAJOR"+
												" WHERE "+											
															"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+													
													" AND "+
															"( LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%'"+ 
															" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"
   										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}

				//สาขาย่อย YEAR
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[7]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"SUB_MAJOR"+
												" WHERE "+											
															"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+													
													" AND "+
															"( LIBRARY_ITEM.YEAR like '%"+in2+"%'"+ 
															" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"
   										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}



				//สาขาย่อย อังกฤษ
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[1])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"SUB_MAJOR"+
												" WHERE "+											
															"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+													
													" AND "+
															"(LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%'"+ 
															" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"
   										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );												
				}				

				//สาขาย่อย คำสำคัญ
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[2])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"KEYWORD,"+
														"SUB_MAJOR"+
												" WHERE "+
														"("+
																"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
																"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in2+"%'"+
															" AND (SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+
																" OR SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"  									
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																				
				}			

				//สาขาย่อย ผู้แต่ง
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[3])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"LIBRARY_ITEM_CREATOR,"+
														"CREATOR,"+
														"SUB_MAJOR"+
												" WHERE "+  
														"("+
															"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID AND "+
															"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
													" AND "+
														"((CREATOR.FIRST_NAME like '%"+in2+"%'"+
															" OR  CREATOR.LAST_NAME like '%"+in2+"%' )"+
													" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+ 
															" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"  			
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																		
				}				

				//สาขาย่อย สาขา
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[4]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"MAJOR,"+
														"SUB_MAJOR"+
												" WHERE "+ 
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+
													")"+
													" AND "+
														"(( MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'"+ 
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' )"+
													" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+
														" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"
     									);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}				

				//สาขาย่อย สาขาย่อย
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[5]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"SUB_MAJOR"+
												" WHERE "+											
															"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID"+													
													" AND "+
															"(( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' )"+
															" AND ( SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"
   										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );												
				}				

				//สาขาย่อย ที่ทำงาน
				if(Byinfo1.equals(temp[5]) && Byinfo2.equals(temp[6]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER,"+
														"SUB_MAJOR"+
												" WHERE "+
														"("+
																"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID AND "+
																"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
														" AND "+
																"((PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' )"+
															" AND (SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in1+"%'"+
																" OR SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in1+"%' ))"  									
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																						
				}				
//เริ่มด้วยที่ทำงาน
//*********************************************************************************//
				//ที่ทำงาน ไทย
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[0]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER"+
												" WHERE "+											
															"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID"+													
													" AND "+
															"( LIBRARY_ITEM.THAI_TITLE like '%"+in2+"%'"+ 
															" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}

				//ที่ทำงาน YEAR
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[7]) ){
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER"+
												" WHERE "+											
															"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID"+													
													" AND "+
															"( LIBRARY_ITEM.YEAR like '%"+in2+"%'"+ 
															" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}


				//ที่ทำงาน อังกฤษ
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[1])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER"+
												" WHERE "+											
															"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID"+													
													" AND "+
															"( LIBRARY_ITEM.ENGLISH_TITLE like '%"+in2+"%'"+ 
															" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' ))"
										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );								
				}				

				//ที่ทำงาน คำสำคัญ
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[2])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"KEYWORD,"+
														"PUBLISHER"+
												" WHERE "+												
														"("+
															"KEYWORD.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"LIBRARY_ITEM.PUBLISHER_ID = PUBLISHER.PUBLISHER_ID"+
															")"+
														" AND "+
																"(KEYWORD.KEYWORD like '%"+in2+"%'"+
															" AND (PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'" +
																" OR PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' ))"  								
											);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																								
				}			

				//ที่ทำงาน ผู้แต่ง
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[3])) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+ 
												" FROM "+
														"LIBRARY_ITEM,"+
														"LIBRARY_ITEM_CREATOR,"+
														"CREATOR,"+
														"PUBLISHER"+
												" WHERE "+  
														"("+
															"LIBRARY_ITEM_CREATOR.LIBRARY_ITEM_ID = LIBRARY_ITEM.LIBRARY_ITEM_ID AND "+
															"CREATOR.CREATOR_ID = LIBRARY_ITEM_CREATOR.CREATOR_ID AND "+
															"LIBRARY_ITEM.PUBLISHER_ID = PUBLISHER.PUBLISHER_ID"+
														")"+
													" AND "+
														"((CREATOR.FIRST_NAME like '%"+in2+"%'"+
															" OR  CREATOR.LAST_NAME like '%"+in2+"%' )"+
													" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'"+ 
															" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' ))"  			
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																		
				}				

				//ที่ทำงาน สาขา
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[4]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID,"+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"MAJOR,"+
														"SUB_MAJOR,"+
														"PUBLISHER"+
												" WHERE "+ 
													"("+
														"SUB_MAJOR.MAJOR_ID = MAJOR.MAJOR_ID AND "+
														"SUB_MAJOR.SUB_MAJOR_ID = LIBRARY_ITEM.SUB_MAJOR_ID AND "+
														"LIBRARY_ITEM.PUBLISHER_ID = PUBLISHER.PUBLISHER_ID"+
													")"+
													" AND "+
														"(( MAJOR.MAJOR_THAI_NAME like '%"+in2+"%'"+ 
														" OR  MAJOR.MAJOR_ENGLISH_NAME like '%"+in2+"%' )"+
													" AND ( PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'"+
														" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' ))"
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																						
				}	

				//ที่ทำงาน สาขาย่อย
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[5]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER,"+
														"SUB_MAJOR"+
												" WHERE "+
														"("+
																"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID AND "+
																"LIBRARY_ITEM.SUB_MAJOR_ID = SUB_MAJOR.SUB_MAJOR_ID"+
														")"+
														" AND "+
																"((PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' )"+
															" AND (SUB_MAJOR.SUB_MAJOR_THAI_NAME like '%"+in2+"%'"+
																" OR SUB_MAJOR.SUB_MAJOR_ENGLISH_NAME like '%"+in2+"%' ))"  									
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																						
				}				

				//ที่ทำงาน ที่ทำงาน
				if(Byinfo1.equals(temp[6]) && Byinfo2.equals(temp[6]) ) {
						if( !(connectDB()) ){	
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery(
												"SELECT "+
														"LIBRARY_ITEM.LIBRARY_ITEM_ID, "+
														"LIBRARY_ITEM.THAI_TITLE"+
												" FROM "+
														"LIBRARY_ITEM,"+
														"PUBLISHER"+														
												" WHERE "+
														"("+
																"PUBLISHER.PUBLISHER_ID = LIBRARY_ITEM.PUBLISHER_ID AND "+																
														")"+
														" AND "+
																"((PUBLISHER.PUBLISHER_THAI_NAME like '%"+in1+"%'"+ 
																	" OR  PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in1+"%' )"+
															" AND (PUBLISHER.PUBLISHER_THAI_NAME like '%"+in2+"%'"+
																" OR PUBLISHER.PUBLISHER_ENGLISH_NAME like '%"+in2+"%' ))"  									
     										);
	        			
										while (rs.next()) {				
												templink = String.valueOf( rs.getInt(1) );
												//Location += templink;
												result.addElement( new StoreLink(rs.getString(2), Location+templink) );
										}
										rs.close();
										stmt.close(); closeConnectionDB();
								}
								catch ( SQLException excp ) { 
											excp.printStackTrace();
											errorMsg =  excp.toString() ;
								}	
						}
				return( result );																						
				}				

		return( result );

	}//End function find2
	
	//Connect DB
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



}//end Search Paper