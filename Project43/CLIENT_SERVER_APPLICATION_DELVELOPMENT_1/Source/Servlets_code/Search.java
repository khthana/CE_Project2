import java.sql.*;
import java.io.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

	public class Search extends HttpServlet {
		private Connection conn = null;
		public void init( ServletConfig config ) throws ServletException {
		super.init(config);
		try {
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
				//Class.forName ("sun.jdbc.odbc.JdbcOdbcDriver");
				//conn = DriverManager.getConnection("jdbc:odbc:projdb","","");
			}
		catch ( SQLException e ) {
				System.err.println("Could not establish connection.");
			}
		catch ( ClassNotFoundException e ) {
			System.err.println("Could not load database driver.");
			}
		} // init
//-------------------------------Get Method------------------------------
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
	String BOOK_NAME="";
    int i=1,j=0;
	String[] c1 = new String[200];

  //-------------------------------------------------------
    try {
		res.setContentType("text/plain;charset=UTF-8");
    BOOK_NAME=req.getParameter("BOOK_NAME");

		BufferedReader reader2 = new BufferedReader(new InputStreamReader(new StringBufferInputStream(BOOK_NAME), "ISO-8859-1"));
		BOOK_NAME = reader2.readLine();
		BOOK_NAME = toUnicodeEscapeString(BOOK_NAME);


    }
    catch (Exception e) {
      e.printStackTrace();
    }

	 //--------------------------Data Base-------------------------------

 	try {
     // Create a Statement
    Statement stmt = conn.createStatement ();
     // insert row
	ResultSet rset = stmt.executeQuery("select book_name_t from cartoon_details");
 // Get data to variable
	boolean bb;
	bb = rset.next();
	while(bb){
        c1[i]=rset.getString(1);
        bb = rset.next();
        i++;
	}
	rset = stmt.executeQuery("select book_name from cartoon_details");
	bb = rset.next();
	while(bb){
        c1[i]=rset.getString(1);
        bb = rset.next();
        i++;
	}
  j=i-1;
 /*   } catch ( SQLException e ) {
    System.err.println("A database error occurred.");
    }*/
    //---------------------Response User------------
   res.setContentType("text/html");
   PrintWriter out = res.getWriter();
	//String test="";
	 out.println("<HTML><HEAD><TITLE>BookSelect</TITLE></HEAD>");
 	 //out.println("<BR>BOOK_NAME : "+BOOK_NAME+"<BR>");
	 //for (int ii=1;ii<=j ;ii++ )
	 //{
		//test = c1[ii];
		//BufferedReader reader2 = new BufferedReader(new InputStreamReader(new StringBufferInputStream(c1[ii]), "ISO-8859-1"));
		//c1[ii] = reader2.readLine();
		//c1[ii] = toUnicodeEscapeString(c1[ii]);
		//out.println("<BR>c1["+ii+"] = "+c1[ii]);
	 //}
	 //out.println("<P>");
	 out.println("<BODY><h1>Result of searching</h1><br>");
   //--------------------------------------------------------
   String test="",tt=BOOK_NAME,ttt=BOOK_NAME;boolean okflag=false;char  cchh;int kk=0;
   String book_name_eng="",book_desc="",book_descx="";
   int MaxLength=1;
   int CountList = 0;
while ((!okflag) && (kk < MaxLength))
{
	for(i=1;i<=j;i++){

		if (c1[i].length() > MaxLength)
				MaxLength = c1[i].length();

       if((c1[i].indexOf(tt)!=-1)|| (c1[i].indexOf(ttt)!=-1)){
		  rset = stmt.executeQuery("select book_name, book_name_t, book_desc from cartoon_details where book_name_t ='"+c1[i]+"' or book_name ='"+c1[i]+"'");
          bb=false;
          bb = rset.next();
          while(bb){
				book_name_eng = rset.getString(1);
				test = rset.getString(2);
				book_descx = rset.getString(3);
				book_desc = book_descx.substring(0,50);
				book_desc += "....";

				//BufferedReader reader2 = new BufferedReader(new InputStreamReader(new StringBufferInputStream(test), "ISO-8859-1"));
				//test = reader2.readLine();
				//test=toUnicodeEscapeString(test);

				//BufferedReader reader3 = new BufferedReader(new InputStreamReader(new StringBufferInputStream(book_desc), "ISO-8859-1"));
				//book_desc = reader3.readLine();
				//book_desc = toUnicodeEscapeString(book_desc);

				out.println("<br>"+(++CountList)+".&nbsp;<a href=\"http://myproject/jservlets/OpenDemo?book_name="+book_name_eng+"\" target=\"details\" >"+book_name_eng+"&nbsp;&nbsp;&nbsp;&nbsp;"+test+"&nbsp;&nbsp;&nbsp;&nbsp;"+book_desc+"</a>");
				//out.println("<br>"+rset.getString(1)+","+test);
								 //+","+
                                 //rset.getString(4));
              bb = rset.next();
			  okflag = true;
          }
       }
   }
   if ((okflag == false) && (kk < BOOK_NAME.length() ))
   {
		cchh = BOOK_NAME.charAt(kk);
		tt = cchh+"";
    tt = tt.toUpperCase();
    ttt = tt.toLowerCase();
		kk++;
	}
	else okflag = true;
}
//if (!okflag)
//{
	//char cchh;
//	cchh = BOOK_NAME.charAt(0);
//  for(i=1;i<=j;i++){
 //      if(c1[i].indexOf(cchh)!=-1){
 //         rset = stmt.executeQuery("select book_name, book_name_t, book_type from cartoon_details where book_name_t ='"+c1[i]+"' or book_name ='"+c1[i]+"'");
  //        bb=false;
  //        bb = rset.next();
  //        while(bb){

//				test = rset.getString(2);
//				BufferedReader reader2 = new BufferedReader(new InputStreamReader(new StringBufferInputStream(test), "ISO-8859-1"));
//				test = reader2.readLine();
//				test=toUnicodeEscapeString(test);
//				out.println("<br>"+rset.getString(1)+","+test+","+rset.getString(3));
								 //+","+
                                 //rset.getString(4));
//              bb = rset.next();
//          }
 //      }
  // }
//}
   //ch = str.charAt(i);

    out.println("</BODY></HTML>");
  } catch ( SQLException e ) {
    System.err.println("A database error occurred.");
    }
  }
  //-------------------Distroy----------------------
 public void destroy() {
 try {
 // close the database connection
  if ( conn != null) conn.close();
  } catch (SQLException e) {
     System.err.println("Error closing database connection.");
  }
 } // destroy
 //-----------------------------Decode Unicode---------------------------------
    private static String toUnicodeEscapeString(String str) {
    // Modeled after the code in java.util.Properties.save()
    StringBuffer buf = new StringBuffer();
    String uniString="",uniStream="";
    int len = str.length();
    char ch,chCmp;
    for (int i = 0; i < len; i++) {
      ch = str.charAt(i);
      switch (ch) {
        case '\\': uniStream+="\\"; break;
        case '\t': uniStream+="\\t";break;
        case '\n': uniStream+="\\n";break;
        case '\r': uniStream+="\\r";break;
        default:
          if (ch >= ' ' && ch <= 127) {
            uniStream+=ch;
          }
          else {
            uniString="";
            chCmp=(toHex((ch >>  4) & 0xF));
            switch (chCmp) {
               case '0': uniString+="6";break;
               case '1': uniString+="7";break;
               case '2': uniString+="8";break;
               case '3': uniString+="9";break;
               case '4': uniString+="a";break;
               case '5': uniString+="b";break;
               case '6': uniString+="c";break;
               case '7': uniString+="d";break;
               case '8': uniString+="e";break;
               case '9': uniString+="f";break;
               case 'a': uniString+="0";break;
               case 'b': uniString+="1";break;
               case 'c': uniString+="2";break;
               case 'd': uniString+="3";break;
               case 'e': uniString+="4";break;
               case 'f': uniString+="5";break;
               default:{}
            }
            //uniString+=(toHex((ch >>  4) & 0xF)&0x6);
            uniString+=(toHex((ch >>  0) & 0xF));
                if(uniString.equals("01"))uniStream+="\u0e01";
                if(uniString.equals("02"))uniStream+="\u0e02";
                if(uniString.equals("03"))uniStream+="\u0e03";
                if(uniString.equals("04"))uniStream+="\u0e04";
                if(uniString.equals("05"))uniStream+="\u0e05";
                if(uniString.equals("06"))uniStream+="\u0e06";
                if(uniString.equals("07"))uniStream+="\u0e07";
                if(uniString.equals("08"))uniStream+="\u0e08";
                if(uniString.equals("09"))uniStream+="\u0e09";
                if(uniString.equals("0a"))uniStream+="\u0e0a";
                if(uniString.equals("0b"))uniStream+="\u0e0b";
                if(uniString.equals("0c"))uniStream+="\u0e0c";
                if(uniString.equals("0d"))uniStream+="\u0e0d";
                if(uniString.equals("0e"))uniStream+="\u0e0e";
                if(uniString.equals("0f"))uniStream+="\u0e0f";
                if(uniString.equals("10"))uniStream+="\u0e10";
                if(uniString.equals("11"))uniStream+="\u0e11";
                if(uniString.equals("12"))uniStream+="\u0e12";
                if(uniString.equals("13"))uniStream+="\u0e13";
                if(uniString.equals("14"))uniStream+="\u0e14";
                if(uniString.equals("15"))uniStream+="\u0e15";
                if(uniString.equals("16"))uniStream+="\u0e16";
                if(uniString.equals("17"))uniStream+="\u0e17";
                if(uniString.equals("18"))uniStream+="\u0e18";
                if(uniString.equals("19"))uniStream+="\u0e19";
                if(uniString.equals("1a"))uniStream+="\u0e1a";
                if(uniString.equals("1b"))uniStream+="\u0e1b";
                if(uniString.equals("1c"))uniStream+="\u0e1c";
                if(uniString.equals("1d"))uniStream+="\u0e1d";
                if(uniString.equals("1e"))uniStream+="\u0e1e";
                if(uniString.equals("1f"))uniStream+="\u0e1f";
                if(uniString.equals("20"))uniStream+="\u0e20";
                if(uniString.equals("21"))uniStream+="\u0e21";
                if(uniString.equals("22"))uniStream+="\u0e22";
                if(uniString.equals("23"))uniStream+="\u0e23";
                if(uniString.equals("24"))uniStream+="\u0e24";
                if(uniString.equals("25"))uniStream+="\u0e25";
                if(uniString.equals("26"))uniStream+="\u0e26";
                if(uniString.equals("27"))uniStream+="\u0e27";
                if(uniString.equals("28"))uniStream+="\u0e28";
                if(uniString.equals("29"))uniStream+="\u0e29";
                if(uniString.equals("2a"))uniStream+="\u0e2a";
                if(uniString.equals("2b"))uniStream+="\u0e2b";
                if(uniString.equals("2c"))uniStream+="\u0e2c";
                if(uniString.equals("2d"))uniStream+="\u0e2d";
                if(uniString.equals("2e"))uniStream+="\u0e2e";
                if(uniString.equals("2f"))uniStream+="\u0e2f";

                if(uniString.equals("30"))uniStream+="\u0e30";
                if(uniString.equals("31"))uniStream+="\u0e31";
                if(uniString.equals("32"))uniStream+="\u0e32";
                if(uniString.equals("33"))uniStream+="\u0e33";
                if(uniString.equals("34"))uniStream+="\u0e34";
                if(uniString.equals("35"))uniStream+="\u0e35";
                if(uniString.equals("36"))uniStream+="\u0e36";
                if(uniString.equals("37"))uniStream+="\u0e37";
                if(uniString.equals("38"))uniStream+="\u0e38";
                if(uniString.equals("39"))uniStream+="\u0e39";
                if(uniString.equals("3a"))uniStream+="\u0e3a";
                if(uniString.equals("3b"))uniStream+="\u0e3b";
                if(uniString.equals("3c"))uniStream+="\u0e3c";
                if(uniString.equals("3d"))uniStream+="\u0e3d";
                if(uniString.equals("3e"))uniStream+="\u0e3e";
                if(uniString.equals("3f"))uniStream+="\u0e3f";
                if(uniString.equals("40"))uniStream+="\u0e40";
                if(uniString.equals("41"))uniStream+="\u0e41";
                if(uniString.equals("42"))uniStream+="\u0e42";
                if(uniString.equals("43"))uniStream+="\u0e43";
                if(uniString.equals("44"))uniStream+="\u0e44";
                if(uniString.equals("45"))uniStream+="\u0e45";
                if(uniString.equals("46"))uniStream+="\u0e46";
                if(uniString.equals("47"))uniStream+="\u0e47";
                if(uniString.equals("48"))uniStream+="\u0e48";
                if(uniString.equals("49"))uniStream+="\u0e49";
                if(uniString.equals("4a"))uniStream+="\u0e4a";
                if(uniString.equals("4b"))uniStream+="\u0e4b";
                if(uniString.equals("4c"))uniStream+="\u0e4c";
                if(uniString.equals("4d"))uniStream+="\u0e4d";
                if(uniString.equals("4e"))uniStream+="\u0e4e";
                if(uniString.equals("4f"))uniStream+="\u0e4f";
                if(uniString.equals("50"))uniStream+="\u0e50";
                if(uniString.equals("51"))uniStream+="\u0e51";
                if(uniString.equals("52"))uniStream+="\u0e52";
                if(uniString.equals("53"))uniStream+="\u0e53";
                if(uniString.equals("54"))uniStream+="\u0e54";
                if(uniString.equals("55"))uniStream+="\u0e55";
                if(uniString.equals("56"))uniStream+="\u0e56";
                if(uniString.equals("57"))uniStream+="\u0e57";
                if(uniString.equals("58"))uniStream+="\u0e58";
                if(uniString.equals("59"))uniStream+="\u0e59";
                if(uniString.equals("5a"))uniStream+="\u0e5a";
                if(uniString.equals("5b"))uniStream+="\u0e5b";
                if(uniString.equals("5c"))uniStream+="\u0e5c";
                if(uniString.equals("5d"))uniStream+="\u0e5d";
                if(uniString.equals("5e"))uniStream+="\u0e5e";
                if(uniString.equals("5f"))uniStream+="\u0e5f";

                if(uniString.equals("60"))uniStream+="\u0e60";
                if(uniString.equals("61"))uniStream+="\u0e61";
                if(uniString.equals("62"))uniStream+="\u0e62";
                if(uniString.equals("63"))uniStream+="\u0e63";
                if(uniString.equals("64"))uniStream+="\u0e64";
                if(uniString.equals("65"))uniStream+="\u0e65";
                if(uniString.equals("66"))uniStream+="\u0e66";
                if(uniString.equals("67"))uniStream+="\u0e67";
                if(uniString.equals("68"))uniStream+="\u0e68";
                if(uniString.equals("69"))uniStream+="\u0e69";
                if(uniString.equals("6a"))uniStream+="\u0e6a";
                if(uniString.equals("6b"))uniStream+="\u0e6b";
                if(uniString.equals("6c"))uniStream+="\u0e6c";
                if(uniString.equals("6d"))uniStream+="\u0e6d";
                if(uniString.equals("6e"))uniStream+="\u0e6e";
                if(uniString.equals("6f"))uniStream+="\u0e6f";
                if(uniString.equals("70"))uniStream+="\u0e70";
                if(uniString.equals("71"))uniStream+="\u0e71";
                if(uniString.equals("72"))uniStream+="\u0e72";
                if(uniString.equals("73"))uniStream+="\u0e73";
                if(uniString.equals("74"))uniStream+="\u0e74";
                if(uniString.equals("75"))uniStream+="\u0e75";
                if(uniString.equals("76"))uniStream+="\u0e76";
                if(uniString.equals("77"))uniStream+="\u0e77";
                if(uniString.equals("78"))uniStream+="\u0e78";
                if(uniString.equals("79"))uniStream+="\u0e79";
                if(uniString.equals("7a"))uniStream+="\u0e7a";
                if(uniString.equals("7b"))uniStream+="\u0e7b";
                if(uniString.equals("7c"))uniStream+="\u0e7c";
                if(uniString.equals("7d"))uniStream+="\u0e7d";
                if(uniString.equals("7e"))uniStream+="\u0e7e";
                if(uniString.equals("7f"))uniStream+="\u0e7f";

          }
      }
    }
    return uniStream;
  }

  private static char toHex(int nibble) {
    return hexDigit[(nibble & 0xF)];
  }

  private static char[] hexDigit = {
    '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'
  };
}

