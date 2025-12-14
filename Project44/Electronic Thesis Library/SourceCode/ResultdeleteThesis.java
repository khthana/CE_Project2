package proj_lib.db;

import java.io.*;
import java.util.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.swing.*;
import java.sql.*;

public class ResultdeleteThesis extends HttpServlet {

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
			String title = CharsetConverter.MS874ToUnicode("ผลการลบวิทยานิพนธ์");

			response.setContentType("text/html;  charset=windows-874");
			PrintWriter out=response.getWriter();		
			
				htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n"+
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";
				htmlOutput += ShowFirst(request, response);
				htmlOutput += ShowName(request, response);
				
				out.println(htmlOutput);
	}

	 String ShowName(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String Result = "";
					Result += "<br><br>";
					Result += "<center><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode("วิทยานิพนธ์ชื่อ")+"</font></center>";
					Result += "<center><font size=\"4\" face=\"Browallia New, BrowalliaUPC\">"+CharsetConverter.MS874ToUnicode(request.getParameter("namethesis"))+"</font></center>";
					Result += "<br><br>";					
					Result += "<H3 ALIGN=\"CENTER\">ได้ถูกลบออกจากระบบเรียบร้อยแล้ว</H3>";
					Result += "<br><br>";
					Result += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.deleteThesis\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปหน้าเดิม  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";
		return(Result);
	 }
	 
	 String ShowFirst(HttpServletRequest request, HttpServletResponse response) throws IOException {
				String returnS = "";
				int ThesisID = 0;
				int CreatorID[] = new int[5];
				int numC;
				
				for(int i=0; i<5; i++)
						CreatorID[i] =0;

				response.setContentType("text/html;  charset=windows-874");
				PrintWriter out=response.getWriter();	
				
				String namethesis = CharsetConverter.MS874ToUnicode(request.getParameter( "namethesis"));
				//String info1 = CharsetConverter.MS874ToUnicode(info);

				if( !(connectDB()) ){
						//Find library_Item_ID
						try 
						    {
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT LIBRARY_ITEM_ID FROM LIBRARY_ITEM WHERE THAI_TITLE = '"+namethesis+"'");
	        			
								rs.next();		
						        ThesisID = rs.getInt(1);		
								
								rs.close();
								stmt.close();
							}
							catch ( SQLException excp ) 
							{ 
									excp.printStackTrace();
									errorMsg =  excp.toString() ;
							}
							
						numC = 0;
						//Find Creator_ID
						try 
						    {	        
								Statement stmt = dbConnection.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT CREATOR_ID FROM LIBRARY_ITEM_CREATOR WHERE LIBRARY_ITEM_ID = "+ThesisID);
	        			
								int i = 0;
								while(rs.next()){		
						        CreatorID[i++] = rs.getInt(1);
								numC++;
								}
								rs.close();
								stmt.close();
							}
							catch ( SQLException excp ) 
							{ 
									excp.printStackTrace();
									errorMsg =  excp.toString() ;
							}

							//Delete library_item_creator
							try {
											Statement statement = dbConnection.createStatement();
											String query =  "DELETE FROM LIBRARY_ITEM_CREATOR"+
																			" WHERE LIBRARY_ITEM_ID = "+ThesisID;
   
											int result = statement.executeUpdate( query );											
											if (result ==0)
											{													
													 ;//returnS += " can't delete LIBRARY_ITEM_CREATOR";
											}

							}
							catch ( SQLException excp ) { 
								
											excp.printStackTrace();
											 returnS +=  excp.toString() ;
						   }							

							
   							//Delete From Keyword	
							try {
											Statement statement = dbConnection.createStatement();
											String query =  "DELETE FROM KEYWORD WHERE LIBRARY_ITEM_ID = "+ThesisID ; 

											int result = statement.executeUpdate( query );											
											if (result ==0)
											{													
													;// returnS += " can't delete KEYWORD";
											}

							}
							catch ( SQLException excp ) { 
								
											excp.printStackTrace();
											 returnS +=  excp.toString() ;
						   }
							
							
							//Delete From Library_Item						
							try {
											Statement statement = dbConnection.createStatement();
											String query =  "DELETE FROM LIBRARY_ITEM WHERE LIBRARY_ITEM_ID = "+ThesisID ; 

											int result = statement.executeUpdate( query );											
											if (result ==0)
											{													
													 ;//returnS += " can't delete LIBRARY_ITEM";
											}

							}
							catch ( SQLException excp ) { 
								
											excp.printStackTrace();
											 returnS +=  excp.toString() ;
						   }
						   							
							//Delete Creator	
						
						for(int i =0; i<numC; i++){	
									try {
											Statement statement = dbConnection.createStatement();
											String query =  "DELETE FROM CREATOR WHERE CREATOR_ID = "+CreatorID[i] ; 

											int result = statement.executeUpdate( query );											
											if (result ==0)
											{													
													 ;//returnS += " can't delete CREATOR_ID";
											}

									}
									catch ( SQLException excp ) { 
								
											excp.printStackTrace();
											 returnS +=  excp.toString() ;
									}						   
						}   

				}
				else{
						 returnS = "<br><br>";
						 returnS = "<center>***********************************************</center><br>";
						 returnS = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						 returnS = "<br><br>";
						 returnS = "<center>***********************************************</center><br>";
								 returnS += "<br><br>";
								 returnS += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.deleteThesis\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปป้อนข้อมูล  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";								
				}
				//out.println("thesis ID = "+ThesisID+"  creator ID =  "+CreatorID);

				closeConnectionDB();
				return( returnS );
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

}//end class 