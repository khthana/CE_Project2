package proj_lib.db;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import com.oreilly.servlet.MultipartRequest;

import org.apache.xerces.parsers.DOMParser;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.NamedNodeMap;

public class InsertFilePDF extends HttpServlet
{
	//
	private String dbTable1 = "LIBRARY_ITEM" ;	
	private String dbTable2 = "CREATOR" ;	
	private String dbTable3 = "KEYWORD" ;	
	private String dbTable4 = "LIBRARY_ITEM_CREATOR" ;	
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

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		 //String filepath = "/home/stdproj/proj_lib/public_html/data/"+request.getParameter("Thesis_Thai_Name")+".xml";
		// writeFile(filepath,request, response );
		 //parsefile_toObjectData(filepath,request, response);
		//MultipartRequest multi = new MultipartRequest(request, "/home/stdproj/proj_lib/public_html/upload");
		doGet( request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		String htmlOutput;
		String title = CharsetConverter.MS874ToUnicode("ระบบการป้อนข้อมูลวิทยานิพนธ์") ;

		response.setContentType("text/html;  charset=windows-874");
		PrintWriter out=response.getWriter();

		htmlOutput = ServletUtilities.headWithTitle( title ) +
								"<BODY BGCOLOR=\"#FDF5E6\">\n" +
								"<H1 ALIGN=\"CENTER\">" + title + "</H1>\n";
		htmlOutput += "<br><br>";
		//htmlOutput += "Test add data to DB";

			if( !(connectDB()) ){
					//htmlOutput += "connect DB Success";
					if( !(dataToDB(request,response)) ){
								htmlOutput +="<center>ป้อนไฟล์ PDF ของวิทยานิพนธ์</center>";
								htmlOutput += "<center>"+PageAddPDF()+"</center>";
								closeConnectionDB();
					}
					else{
								htmlOutput += "<br><br>";
								 htmlOutput +="<center>***********************************************</center><br>";
								htmlOutput +="<H2 ALIGN=\"CENTER\">ผลการป้อนข้อมูลวิทยานิพนธ์ไม่สมบูรณ์</H2>\n";	
								htmlOutput += "<center>***********************************************</center>";
								htmlOutput += "<br><br>";
								htmlOutput += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.InsertThesis\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปหน้าเดิม  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";								
					}
			}
			else{
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
						htmlOutput = "<center>"+CharsetConverter.MS874ToUnicode("ติดต่อกับฐานข้อมูลไม่สำเร็จ")+"</center>";
						htmlOutput = "<br><br>";
						htmlOutput = "<center>***********************************************</center><br>";
								htmlOutput += "<br><br>";
								htmlOutput += "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.InsertThesis\">"+
																"<table width=\"8%\" border=\"0\" align=\"center\">"+
																	"<tr>"+
																		"<td>"+
																			"<input type=\"submit\" name=\"Submit\" value=\"  กลับไปหน้าเดิม  \">"+
																		"</td>"+
																	"</tr>"+
																"</table>"+
															"</form>";								
			}
			
			htmlOutput += "<BODY></HTML>" ;
			out.println( htmlOutput );		
	  }//End doget

public String PageAddPDF(){
				String htmlO;

htmlO =   "<br><br>"+ 
  "<form name=\"form1\" method=\"post\" action=\"/servlet/proj_lib.db.ResultInsertThesisData\" enctype=\"multipart/form-data\">"+
    "<center><table width=\"56%\" border=\"0\">"+
      "<tr>"+ 
        "<td width=\"11%\">"+ 
          "<div align=\"right\"><font face=\"Browallia New, BrowalliaUPC\" size=\"4\">PDF "+
            ":</font></div>"+
        "</td>"+
        "<td width=\"51%\">"+ 
          "<input type=\"file\" name=\"pdf\" size=\"30\" maxlength=\"70\">"+
        "</td>"+
        "<td width=\"38%\">"+ 
          "<input type=\"submit\" name=\"Submit\" value=\"Submit\">"+
        "</td>"+
      "</tr>"+
    "</table></center>"+
  "</form>";
				return htmlO;
}


//****************************Add to data to DB**************************************
boolean addInThesis(String dt1,String dt2, String dt3, String dt4, String dt5, int dt6, int dt7) throws IOException 
	{		
		boolean error = false;
		try 
		{
			 //FileInputStream fis = new FileInputStream ("/home/stdproj/proj_lib/public_html/upload/" + multipart.getFilesystemName("PDF"));
	         PreparedStatement pstmt = dbConnection.prepareStatement("INSERT INTO "+dbTable1+
				 " (THAI_TITLE, ENGLISH_TITLE, THAI_ABSTRACT, ENGLISH_ABSTRACT,"+
				 " YEAR, SUB_MAJOR_ID, PUBLISHER_ID"+		
		         ")"  + "VALUES (?,?,?,?,?,?,?)");
         		 
	         pstmt.setString (1, dt1);
			 pstmt.setString(2, dt2);
			 pstmt.setString(3, dt3);
			 pstmt.setString(4, dt4 );			
			 pstmt.setString (5, dt5); 
			 pstmt.setInt(6, dt6 );
			 pstmt.setInt(7, dt7);
			 				        
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
	} // funtion add


//*****************************Add in Author******************************************
boolean addInAuthor(String dt1, String dt2) throws IOException 
	{		
		boolean error = false;
		try 
		{
	         PreparedStatement pstmt = dbConnection.prepareStatement("INSERT INTO "+dbTable2+
				 " (FIRST_NAME, LAST_NAME )   VALUES (?,?)");
	         pstmt.setString (1,dt1 );
			 pstmt.setString(2,dt2 );
						
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
	} // funtion add


//*****************************Add in Keyword****************************************
boolean addInKeyword(String dt1, int dt2) throws IOException 
	{		
		boolean error = false;
		try 
		{
	         PreparedStatement pstmt = dbConnection.prepareStatement("INSERT INTO "+dbTable3+
				 " (KEYWORD, LIBRARY_ITEM_ID)   VALUES (?,?)");
	         pstmt.setString(1,dt1 );
			 pstmt.setInt(2,dt2 );			 	
			
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
	} // funtion add


boolean addInLIB_IT_Creator(int dt1, int dt2) throws IOException 
	{		
		boolean error = false;
		try 
		{
	         PreparedStatement pstmt = dbConnection.prepareStatement("INSERT INTO "+dbTable4+
				 " (CREATOR_ID, LIBRARY_ITEM_ID)   VALUES (?,?)");
		              		 
	         pstmt.setInt(1,dt1 );
			 pstmt.setInt(2,dt2 );			 	
			
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
	} // funtion add	
	
	public int IDFromData(String Sfrom, String Name, String Swhere){
		int majorID =0;
		//if( !(connectDB()) ){
				try 
				{
					// retrieve data from the database
					Statement stmt = dbConnection.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT *  FROM  "+Sfrom+ " WHERE "+Name+" = '"+Swhere+"'");	       					
					rs.next();
					majorID = rs.getInt(1);
					rs.close();
					stmt.close();			
				}
				catch ( SQLException excp ) {}	
		//}
		
		return majorID;
	} //end return ID


	boolean dataToDB(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{					
				String htmlOutput;		
				response.setContentType("text/html;  charset=windows-874");
				PrintWriter out=response.getWriter();
				int idSubM = 0;
				int idPublisher = 0;
				
				boolean error = false;
				
					String temp[] = new String[30];
					for(int i=0; i<29; i++)
						temp[i] = null;

					temp[0] = CharsetConverter.MS874ToUnicode( request.getParameter( "Thesis_Thai_Name"));					
					temp[1] = CharsetConverter.MS874ToUnicode( request.getParameter( "Thesis_English_Name" )) ;
					temp[2] = CharsetConverter.MS874ToUnicode( request.getParameter( "Thai_Abstract" )) ;
					temp[3] = CharsetConverter.MS874ToUnicode( request.getParameter( "English_Abstract" ))  ;
					temp[4] = CharsetConverter.MS874ToUnicode( request.getParameter( "year" ))  ;
					
					
							 idSubM = IDFromData("SUB_MAJOR", "SUB_MAJOR_THAI_NAME",  CharsetConverter.MS874ToUnicode( request.getParameter( "select_SubMajor"))   );
							 idPublisher = IDFromData("PUBLISHER", "PUBLISHER_THAI_NAME",  CharsetConverter.MS874ToUnicode( request.getParameter( "select_Pub"))  );
					

					//out.println("ID in db23 = "+idSubM+"  "+ idPublisher);
					
					//insert LIBRARY_ITEM
					if( !(addInThesis(temp[0], temp[1], temp[2], temp[3], temp[4], idSubM, idPublisher) )){
							;//htmlOutput = "Complete to add data to DB";
					}else{
							error = true;
							;//htmlOutput = "Not Complete to add data to DB";
					}						

					//INSERT KEYWORD
					temp[5] = 	 request.getParameter( "key1") ;
					temp[6] =  request.getParameter( "key2") ;
					temp[7] =  request.getParameter( "key3" ) ;
					temp[8] =  request.getParameter( "key4" )  ;	
					temp[9] = request.getParameter( "key5" )  ;	
					int idLibItem =  IDFromData("LIBRARY_ITEM", "THAI_TITLE", CharsetConverter.MS874ToUnicode(request.getParameter( "Thesis_Thai_Name")) );
					
					int i = 5;
					while(temp[i] != null){
							addInKeyword(CharsetConverter.MS874ToUnicode(temp[i]), idLibItem);
							i+=1;
					}

							//INSERT  CREATOR AND LIBRARY_ITEM_CREATOR
							temp[10] = 	 request.getParameter( "FirstName1" ) ;
							temp[11] = 	 request.getParameter( "LastName1" ) ;
							temp[12] = 	 request.getParameter( "FirstName2" ) ;
							temp[13] = 	 request.getParameter( "LastName2" ) ;
							temp[14] = 	 request.getParameter( "FirstName3" ) ;
							temp[15] = 	 request.getParameter( "LastName3" ) ;

							i = 10;
							while(temp[i] != null){
								try 
								{
										// retrieve data from the database
										Statement stmt = dbConnection.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT *  FROM  CREATOR  WHERE FIRST_NAME = '"+CharsetConverter.MS874ToUnicode(temp[i])+
																																										        "' AND LAST_NAME = '"+CharsetConverter.MS874ToUnicode(temp[i+1]) +"'");	       					
										//เจอผู้แต่งในตารางแล้ว
										if(rs.next()){// ADD LIBRARY_ITEM_CREATOR 
												int CreaID = rs.getInt(1);
												addInLIB_IT_Creator(CreaID, idLibItem);
										}//ยังไม่เจอผู้แต่งในตาราง
										else{// ADD CREATOR & LIBRARY_ITEM_CREATOR
													addInAuthor(CharsetConverter.MS874ToUnicode(temp[i]), CharsetConverter.MS874ToUnicode(temp[i+1]) );
													int idCreator =  IDFromData("CREATOR", "FIRST_NAME", CharsetConverter.MS874ToUnicode(temp[i]) );
													addInLIB_IT_Creator(idCreator, idLibItem);
										}
							 													
										rs.close();
										stmt.close();			
									}
									catch ( SQLException excp ) {}	
								i+=2;
							}							
		//out.println( htmlOutput );		
		return (error);
	}//end function add


//***************************** Connect Database ***********************************
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
	}//close connection	


        public void parsefile_toObjectData(String filetoParse,HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

				PrintWriter out = response.getWriter();
                 try{
                      DOMParser parser = new DOMParser();
                      parser.setIncludeIgnorableWhitespace(false);
                      parser.setFeature("http://apache.org/xml/features/allow-java-encodings",true);
                      parser.parse(filetoParse);
                      Document doc = parser.getDocument();

                      //put data to Array
                      //dataToDB(doc,request,response);
                      out.println("pass pass add data DB");
                  }
                  catch(Exception e){
                       out.println("\nError in Parsing : " + e.getMessage());
                  }
              //}
        }//End parsefile_toObjectData
			
	public void writeFile(String path,HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {   
		
        			PrintWriter out = response.getWriter();
						out.println(path);   	
		   try{
              outputfile = new RandomAccessFile(path,"rw");             
              outputfile.writeBytes("<?xml version=\"1.0\" encoding=\"windows-874\"?>\r\n");              
              //--------------DTD-----------------------------
              outputfile.writeBytes("<!DOCTYPE LIBRARY_ITEM  [\r\n");
              outputfile.writeBytes("<!ELEMENT LIBRARY_ITEM (TITLES,MAJOR,SUB_MAJOR,YEAR,CREATORS,PUBLISHER,ABSTRACT_CONTENT,KEYWORDS)>\r\n");
              outputfile.writeBytes("<!ELEMENT TITLES (THAI_TITLE,ENGLISH_TITLE)>\r\n");
              outputfile.writeBytes("<!ELEMENT THAI_TITLE (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT ENGLISH_TITLE (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT MAJOR (MAJOR_THAI_NAME,MAJOR_ENGLISH_NAME)>\r\n");            
              outputfile.writeBytes("<!ELEMENT MAJOR_THAI_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT MAJOR_ENGLISH_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT SUB_MAJOR (SUB_MAJOR_THAI_NAME,SUB_MAJOR_ENGLISH_NAME)>\r\n");
              outputfile.writeBytes("<!ELEMENT SUB_MAJOR_THAI_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT SUB_MAJOR_ENGLISH_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT YEAR (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT CREATORS (CREATOR+)>\r\n");
              outputfile.writeBytes("<!ELEMENT CREATOR (FIRST_NAME,LAST_NAME)>\r\n");   
			  outputfile.writeBytes("<!ELEMENT FIRST_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT LAST_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT PUBLISHER (PUBLISHER_THAI_NAME,PUBLISHER_ENGLISH_NAME)>\r\n");   
			  outputfile.writeBytes("<!ELEMENT PUBLISHER_THAI_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT PUBLISHER_ENGLISH_NAME (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT ABSTRACT_CONTENT (THAI_ABSTRACT,ENGLISH_ABSTRACT)>\r\n");   
			  outputfile.writeBytes("<!ELEMENT THAI_ABSTRACT (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT ENGLISH_ABSTRACT (#PCDATA)>\r\n");
              outputfile.writeBytes("<!ELEMENT KEYWORDS (KEYWORD+)>\r\n");   
			  outputfile.writeBytes("<!ELEMENT KEYWORD (#PCDATA)>\r\n");   
              outputfile.writeBytes("]>\r\n");
              //--------------End DTD-----------------------------//

              outputfile.writeBytes("<LIBRARY_ITEM>\r\n");
              outputfile.writeBytes(" <TITLES>\r\n");
              outputfile.writeBytes("   <THAI_TITLE>"+request.getParameter( "Thesis_Thai_Name" )+"</THAI_TITLE>\r\n");
              outputfile.writeBytes("   <ENGLISH_TITLE>"+ request.getParameter( "Thesis_English_Name" )+"</ENGLISH_TITLE>\r\n");
              outputfile.writeBytes(" </TITLES>\r\n");
              outputfile.writeBytes(" <MAJOR>\r\n");
              outputfile.writeBytes("   <MAJOR_THAI_NAME>"+request.getParameter( "select_Major" )+"</MAJOR_THAI_NAME>\r\n");
              outputfile.writeBytes("   <MAJOR_ENGLISH_NAME>"+ request.getParameter( "Thesis_English_Name" )+"</MAJOR_ENGLISH_NAME>\r\n");
              outputfile.writeBytes(" </MAJOR>\r\n");
              outputfile.writeBytes(" <SUB_MAJOR>\r\n");
              outputfile.writeBytes("   <SUB_MAJOR_THAI_NAME>"+request.getParameter( "select_SubMajor" )+"</SUB_MAJOR_THAI_NAME>\r\n");
              outputfile.writeBytes("   <SUB_MAJOR_ENGLISH_NAME>"+ request.getParameter( "Thesis_English_Name" )+"</SUB_MAJOR_ENGLISH_NAME>\r\n");
              outputfile.writeBytes(" </SUB_MAJOR>\r\n");
			  outputfile.writeBytes(" <YEAR>"+request.getParameter("year")+"</YEAR>\r\n");
              outputfile.writeBytes(" <CREATORS>\r\n");
			  outputfile.writeBytes("	<CREATOR>\r\n");
              outputfile.writeBytes("		<FIRST_NAME>"+request.getParameter( "FirstName1")+"</FIRST_NAME>\r\n");
              outputfile.writeBytes("		<LAST_NAME>"+request.getParameter( "LastName1")+"</LAST_NAME>\r\n");
			  outputfile.writeBytes("	</CREATOR>\r\n");
			  outputfile.writeBytes("	<CREATOR>\r\n");
              outputfile.writeBytes("		<FIRST_NAME>"+request.getParameter( "FirstName2")+"</FIRST_NAME>\r\n");
              outputfile.writeBytes("		<LAST_NAME>"+request.getParameter( "LastName2")+"</LAST_NAME>\r\n");
			  outputfile.writeBytes("	</CREATOR>\r\n");
			  outputfile.writeBytes("	<CREATOR>\r\n");
              outputfile.writeBytes("		<FIRST_NAME>"+request.getParameter( "FirstName3")+"</FIRST_NAME>\r\n");
              outputfile.writeBytes("		<LAST_NAME>"+request.getParameter( "LastName3")+"</LAST_NAME>\r\n");
			  outputfile.writeBytes("	</CREATOR>\r\n");
			  outputfile.writeBytes(" </CREATORS>\r\n");
			  outputfile.writeBytes("<PUBLISHER>\r\n");
              outputfile.writeBytes("	<PUBLISHER_THAI_NAME>"+request.getParameter( "select_Pub")+"</PUBLISHER_THAI_NAME>\r\n");
              outputfile.writeBytes("	<PUBLISHER_ENGLISH_NAME>"+request.getParameter( "LastName1")+"</PUBLISHER_ENGLISH_NAME>\r\n");
			  outputfile.writeBytes("</PUBLISHER>\r\n");
              outputfile.writeBytes(" <ABSTRACT_CONTENT>\r\n");
              outputfile.writeBytes("   <THAI_ABSTRACT>"+request.getParameter("Thai_Abstract" )+"</THAI_ABSTRACT>\r\n");
              outputfile.writeBytes("   <ENGLISH_ABSTRACT>"+request.getParameter( "English_Abstract")+"</ENGLISH_ABSTRACT>\r\n");
              outputfile.writeBytes(" </ABSTRACT_CONTENT>\r\n");
              outputfile.writeBytes(" <KEYWORDS>\r\n");
              outputfile.writeBytes("   <KEYWORD>"+request.getParameter("key1" )+"</KEYWORD>\r\n");
              outputfile.writeBytes("   <KEYWORD>"+request.getParameter( "key2")+"</KEYWORD>\r\n");
              outputfile.writeBytes("   <KEYWORD>"+request.getParameter("key3" )+"</KEYWORD>\r\n");
              outputfile.writeBytes("   <KEYWORD>"+request.getParameter( "key4")+"</KEYWORD>\r\n");
              outputfile.writeBytes("   <KEYWORD>"+request.getParameter("key5" )+"</KEYWORD>\r\n");
              outputfile.writeBytes(" </KEYWORDS>\r\n");
			  outputfile.writeBytes("</LIBRARY_ITEM>\r\n");

              outputfile.close();
            }
            catch(IOException e1){
				out.println("File can't write :"+e1.toString());
            }
      }//Write File



}//End class