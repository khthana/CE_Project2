import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import java.text.*;
import java.lang.Math;

public class aml5 extends HttpServlet {
static String u;
static String p;
static String Knot;
static String Knot2;

public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException{
ServletOutputStream out = res.getOutputStream();
res.setContentType("text/vnd.wap.wml");
HttpSession session=req.getSession(true);
String NoParameter=(String)session.getValue("NoParameter");
String Username=(String)session.getValue("Username");
String Goods=(String)session.getValue("Goods");
String Table=(String)session.getValue("Table");
String Spec=(String)session.getValue("Spec");
String Dyna=(String)session.getValue("Dyna");
String SpecX=(String)session.getValue("SpecX");
String DynaX=(String)session.getValue("DynaX");
int SpecInt = (new Integer(SpecX)).intValue();
int DynaInt = (new Integer(DynaX)).intValue();



String Amount=req.getParameter("Amount");
String Transaction=req.getParameter("Transaction");
String Ssql ="Insert into ";
Ssql = Ssql + Table + "(TransactionDateTime" + Spec + ",InOut" + Dyna + ",Available,Total,Rank)";

if (Transaction.equals("In"))
   {
    java.util.Date d1 = new java.util.Date();
    String a= d1.toString();
    Ssql = Ssql + " values('" + a + "'";

    for (int Count = 0; Count < SpecInt; Count++){
        int pCount = Count + 1;
        String Specn=req.getParameter("Spec" + pCount);
        Ssql = Ssql + ",'" + Specn + "'";
    }
    Ssql = Ssql + ",'" + Amount + "'";

    for (int Count = 0; Count < DynaInt; Count++){
        int pCount = Count + 1;
        String Dynan=req.getParameter("Dyna" + pCount);
        Ssql = Ssql + ",'" + Dynan + "'";    
    }
    Ssql = Ssql + ",'" + Amount + "'";
    
    
    System.out.println("select max(Rank) from " + Table);

    try {performQuery2("select max(Rank) from " + Table,1,1);

    }
    catch (Exception exp){}
    System.out.println("I Got It");
    int RInt = 0;
    try {
    RInt = (new Integer(Knot)).intValue();}
    catch (Exception ead){RInt = 0;}
    
    int AInt = (new Integer(Amount)).intValue();

    System.out.println("select Total from " + Table);
    System.out.println("Second");

    try {performQuery3("select Total from " + Table);}
    catch (Exception exp){}

    int TInt = 0;
    try {
     TInt = (new Integer(Knot)).intValue();
    }
    catch (Exception err){TInt = 0;}

    
    TInt = TInt + AInt;

    String Total = Integer.toString(TInt);
    Ssql = Ssql + ",'" + Total + "'";
    RInt = RInt + 1;
    String Rank = Integer.toString(RInt);
    Ssql = Ssql + ",'" + Rank + "')";
    System.out.println(Ssql);
    System.out.println("Up Is Third");

    try {performQuery2(Ssql,1,1);}
    catch (Exception exp){}
   }

else if (Transaction.equals("Out"))
   {
    java.util.Date d1 = new java.util.Date();
    String a= d1.toString();
    Ssql = Ssql + " values('" + a + "'";
    String CheckNear = "select Alert from " + Username + " where Goods ='" + Goods + "'";
    String SsqlA = "select Available from " + Table + " where ";
    String SsqlB = "select Rank from " + Table + " where ";
    for (int Count = 0; Count < SpecInt; Count++){
        int pCount = Count + 1;
        String SpecXn=(String)session.getValue("SpecX" + pCount);
        String Specn=req.getParameter("Spec" + pCount);
        SsqlA = SsqlA + SpecXn + "='" + Specn + "' and "; 
        SsqlB = SsqlB + SpecXn + "='" + Specn + "' and "; 
        Ssql = Ssql + ",'" + Specn + "'";
    }
    Ssql = Ssql + ",'-" + Amount + "'";

    for (int Count = 0; Count < DynaInt; Count++){
        int pCount = Count + 1;
        String Dynan=req.getParameter("Dyna" + pCount);
        Ssql = Ssql + ",'" + Dynan + "'";    
    }
    

    SsqlA = SsqlA + "InOut <> 'BabyG'";
    SsqlB = SsqlB + "InOut <> 'BabyG'";

    try {performQuery3(SsqlA);}
    catch (Exception exp){}
    int AInt2 = (new Integer(Amount)).intValue();
    int ATInt = (new Integer(Knot)).intValue();
    if (AInt2 <= ATInt)
    {
    String Available = "";
    try {performQuery2("select Sort from " + Username + " where Goods ='" + Goods + "'",1,1);}
    catch (Exception exp){}
        if (Knot.equals("FIFO"))
        {
             String SsqlMin="Select min(Rank) from " + Table + " where Rank not in (select Rank from " + Table + " where Available = '0')";
             try {performQuery2(SsqlMin,1,1);}
             catch (Exception exp){}
             String MinRank = Knot;
             System.out.println("MinRank is " + Knot);
             System.out.println("SsqlB is " + SsqlB);

             try {performQuery3(SsqlB);}
             catch (Exception exp){}

             System.out.println("SsqlB Result is " + Knot);
             String YourRank = Knot;
                if (Knot.equals(MinRank))
                {
                 ATInt = ATInt - AInt2 ;  
                 Available = Integer.toString(ATInt);
                 Ssql = Ssql + ",'" + Available + "'";

                 try {performQuery3("select Total from " + Table);}
                 catch (Exception exp){}
                 System.out.println("Total is " + Knot);

                 int TInt2 = (new Integer(Knot)).intValue();
                  TInt2 = TInt2 - AInt2;
                 String Total2 = Integer.toString(TInt2);
                 Ssql = Ssql + ",'" + Total2 + "'";
                 Ssql = Ssql + ",'" + MinRank + "')";

                 System.out.println("Last Ssql is " + Ssql);
                 try {performQuery2(Ssql,1,1);}
                 catch (Exception exp){}

				 String WmlTmp1=(String)session.getValue("WmlTmp1");
				 String WmlTmp2=(String)session.getValue("WmlTmp2");
				 String WmlTmp3=(String)session.getValue("WmlTmp3");

				 /// BELOW IS CHECK NEAR OUT OF STOCK
				 try {performQuery2(CheckNear,1,1);}
                 catch (Exception exp){}
                 AInt2 = (new Integer(Knot)).intValue();
                 if (TInt2 <= AInt2)
                 {
                 
                                        out.println("<?xml version=\"1.0\"?>");
					out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
					out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
					out.println("<card id=\"CardAlert\" title=\"ALERT\">");
					out.println("<p align=\"center\">");
                                        out.println("Your goods are near out of stock.Please stock in");
                                        out.println(" Click back. ");
                                        out.println("</p></card></wml>");

                                        System.out.println("<?xml version=\"1.0\"?>");
                                        System.out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
                                        System.out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
                                        System.out.println("<card id=\"CardAlert\" title=\"ALERT\">");
                                        System.out.println("<p align=\"center\">");
                                        System.out.println("Your goods are near out of stock.Please stock in");
                                        System.out.println(" Click back. ");
                                        System.out.println("</p></card></wml>");

        			 }

	
				   else
				   {
                                         out.println("<?xml version=\"1.0\"?>");
					 out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
					 out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
					 out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
					 out.println("<do type=\"accept\" label=\"Next\">");
					 out.println("<go href=\"http://localhost:8080/servlet/aml5\">");
					 out.println("<postfield name=\"Transaction\" value=\"$Transaction\" />");
					 out.println("<postfield name=\"Amount\" value=\"$Amount\" />");
					 out.println(WmlTmp1);
 					 out.println("</go></do><p align=\"center\">");
					 out.println("Transaction<select name =\"Transaction\" title = \"Transaction\" multiple=\"false\">");
					 out.println("<option  value=\"In\"> In</option>");
					 out.println("<option value=\"Out\"> Out </option>");
					 out.println("<option value=\"View\"> View </option></select>");
					 out.println("Amount<input name=\"Amount\" />"); 
					 out.println(WmlTmp2);
					 out.println(WmlTmp3);
					 out.println("</p></card></wml>");


                                         System.out.println("<?xml version=\"1.0\"?>");
                                         System.out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
                                         System.out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
                                         System.out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
                                         System.out.println("<do type=\"accept\" label=\"Next\">");
                                         System.out.println("<go href=\"http://localhost:8080/servlet/aml5\">");
                                         System.out.println("<postfield name=\"Transaction\" value=\"$Transaction\" />");
                                         System.out.println("<postfield name=\"Amount\" value=\"$Amount\" />");
                                         System.out.println(WmlTmp1);
                                         System.out.println("</go></do><p align=\"center\">");
                                         System.out.println("Transaction<select name =\"Transaction\" title = \"Transaction\" multiple=\"false\">");
                                         System.out.println("<option  value=\"In\"> In</option>");
                                         System.out.println("<option value=\"Out\"> Out </option>");
                                         System.out.println("<option value=\"View\"> View </option></select>");
                                         System.out.println("Amount<input name=\"Amount\" />"); 
                                         System.out.println(WmlTmp2);
                                         System.out.println(WmlTmp3);
                                         System.out.println("</p></card></wml>");






                		   }
				}
                else
                {
                 ATInt = ATInt - AInt2 ;  
                 Available = Integer.toString(ATInt);
                 Ssql = Ssql + ",'" + Available + "'";

                 try {performQuery3("select Total from " + Table);}
                 catch (Exception exp){}
                 System.out.println("Total is " + Knot);

                 int TInt3 = (new Integer(Knot)).intValue();
                 TInt3 = TInt3 - AInt2;
                 String Total3 = Integer.toString(TInt3);
                 Ssql = Ssql + ",'" + Total3 + "'";
                 Ssql = Ssql + ",'" + YourRank + "')";
                 session.putValue("InsertSql",Ssql);
                 String TInt3S = Integer.toString(TInt3);
				 session.putValue("TInt3S",TInt3S);

				 System.out.println("Last Ssql2 is " + Ssql);
				 out.println("<?xml version=\"1.0\"?>");
				 out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
				 out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
				 out.println("<card id=\"CardAlert\" title=\"ALERT\">");
				 out.println("<do type=\"accept\" label=\"Next\">");
				 out.println("<go href=\"http://localhost:8080/servlet/aml6\">");
				 out.println("</go></do><p align=\"center\">");
				 out.println("You do not choose the first.The First is ");

                 try {performQuery3("select TransactionDateTime" + Spec + ",Available from " + Table + " where Rank ='" + MinRank + "'"); }
                 catch (Exception exp){}
				 out.println(Knot2);
				 out.println(" click back to change or next to do it");
				 out.println("</p></card></wml>");



          }
        {}
        }
		else if (Knot.equals("LIFO"))
{
             String SsqlMax="Select max(Rank) from " + Table + " where Rank not in (select Rank from " + Table + " where Available = '0')";
             try {performQuery2(SsqlMax,1,1);}
             catch (Exception exp){}
             String MaxRank = Knot;
             System.out.println("MaxRank is " + Knot);
             System.out.println("SsqlB is " + SsqlB);

             try {performQuery3(SsqlB);}
             catch (Exception exp){}

             System.out.println("SsqlB Result is " + Knot);
             String YourRank = Knot;
                if (Knot.equals(MaxRank))
                {
                 ATInt = ATInt - AInt2 ;  
                 Available = Integer.toString(ATInt);
                 Ssql = Ssql + ",'" + Available + "'";

                 try {performQuery3("select Total from " + Table);}
                 catch (Exception exp){}
                 System.out.println("Total is " + Knot);

                 int TInt2 = (new Integer(Knot)).intValue();
                  TInt2 = TInt2 - AInt2;
                 String Total2 = Integer.toString(TInt2);
                 Ssql = Ssql + ",'" + Total2 + "'";
                 Ssql = Ssql + ",'" + MaxRank + "')";

                 System.out.println("Last Ssql is " + Ssql);
                 try {performQuery2(Ssql,1,1);}
                 catch (Exception exp){}

String WmlTmp1=(String)session.getValue("WmlTmp1");
String WmlTmp2=(String)session.getValue("WmlTmp2");
String WmlTmp3=(String)session.getValue("WmlTmp3");

try {performQuery2(CheckNear,1,1);}
                 catch (Exception exp){}
                 AInt2 = (new Integer(Knot)).intValue();
                 if (TInt2 <= AInt2)
                 {
                 
	                out.println("<?xml version=\"1.0\"?>");
					out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
					out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
					out.println("<card id=\"CardAlert\" title=\"ALERT\">");
					out.println("<p align=\"center\">");
                                        out.println("Your goods are near out of stock.Please stock in");
                                        out.println(" Click back ");
					out.println("</p></card></wml>");
				 }

	
				   else
				   {








out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
out.println("<do type=\"accept\" label=\"Next\">");
out.println("<go href=\"http://localhost:8080/servlet/aml5\">");
out.println("<postfield name=\"Transaction\" value=\"$Transaction\" />");
out.println("<postfield name=\"Amount\" value=\"$Amount\" />");
out.println(WmlTmp1);
out.println("</go></do><p align=\"center\">");
out.println("Transaction<select name =\"Transaction\" title = \"Transaction\" multiple=\"false\">");
out.println("<option  value=\"In\"> In</option>");
out.println("<option value=\"Out\"> Out </option>");
out.println("<option value=\"View\"> View </option></select>");
out.println("Amount<input name=\"Amount\" />"); 
out.println(WmlTmp2);
out.println(WmlTmp3);
out.println("</p></card></wml>");

				   }
				
				
				
				}
                else
                {
                 ATInt = ATInt - AInt2 ;  
                 Available = Integer.toString(ATInt);
                 Ssql = Ssql + ",'" + Available + "'";

                 try {performQuery3("select Total from " + Table);}
                 catch (Exception exp){}
                 System.out.println("Total is " + Knot);

                 int TInt3 = (new Integer(Knot)).intValue();
                 TInt3 = TInt3 - AInt2;

				 String Total4 = Integer.toString(TInt3);
                 Ssql = Ssql + ",'" + Total4 + "'";
                 Ssql = Ssql + ",'" + YourRank + "')";
                 session.putValue("InsertSql",Ssql);
                 String TInt3S = Integer.toString(TInt3);
				 session.putValue("TInt3S",TInt3S);

				 
				 
				 
				 
				 System.out.println("Last Ssql2 is " + Ssql);
out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"CardAlert\" title=\"ALERT\">");
out.println("<do type=\"accept\" label=\"Next\">");
out.println("<go href=\"http://localhost:8080/servlet/aml6\">");
out.println("</go></do><p align=\"center\">");
out.println("You do not choose the last.The last is ");

System.out.println("<?xml version=\"1.0\"?>");
System.out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
System.out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
System.out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
System.out.println("<do type=\"accept\" label=\"Next\">");
System.out.println("<go href=\"http://localhost:8080/servlet/aml6\">");
System.out.println("</go></do><p align=\"center\">");
System.out.println("You do not choose the last.The last is ");



                 try {performQuery3("select TransactionDateTime" + Spec + ",Available from " + Table + " where Rank ='" + MaxRank + "'"); }
                 catch (Exception exp){}
out.println(Knot2);
out.println(" click back to change or next to do it");
out.println("</p></card></wml>");
System.out.println(Knot2);
System.out.println(" click back to change or next to do it");
System.out.println("</p></card></wml>");



          }
        {}
        }	
	
		else 
		{	
try {performQuery3(SsqlB);}
             catch (Exception exp){}
	    String MaxRank = Knot;
         
                 ATInt = ATInt - AInt2 ;  
                 Available = Integer.toString(ATInt);
                 Ssql = Ssql + ",'" + Available + "'";

                 try {performQuery3("select Total from " + Table);}
                 catch (Exception exp){}
                 System.out.println("Total is " + Knot);

                 int TInt2 = (new Integer(Knot)).intValue();
                  TInt2 = TInt2 - AInt2;
                 String Total2 = Integer.toString(TInt2);
                 Ssql = Ssql + ",'" + Total2 + "'";
                 Ssql = Ssql + ",'" + MaxRank + "')";

                 System.out.println("Last Ssql is " + Ssql);
                 try {performQuery2(Ssql,1,1);}
                 catch (Exception exp){}

String WmlTmp1=(String)session.getValue("WmlTmp1");
String WmlTmp2=(String)session.getValue("WmlTmp2");
String WmlTmp3=(String)session.getValue("WmlTmp3");


try {performQuery2(CheckNear,1,1);}
                 catch (Exception exp){}
                 AInt2 = (new Integer(Knot)).intValue();
                 if (TInt2 <= AInt2)
                 {
                 
	                out.println("<?xml version=\"1.0\"?>");
					out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
					out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
					out.println("<card id=\"CardAlert\" title=\"ALERT\">");
					out.println("<p align=\"center\">");
                                        out.println("Your goods are near out of stock.Please stock in");
                                        out.println(" Click back ");
					out.println("</p></card></wml>");
				 }

	
				   else
				   {
out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
out.println("<do type=\"accept\" label=\"Next\">");
out.println("<go href=\"http://localhost:8080/servlet/aml5\">");
out.println("<postfield name=\"Transaction\" value=\"$Transaction\" />");
out.println("<postfield name=\"Amount\" value=\"$Amount\" />");
out.println(WmlTmp1);
out.println("</go></do><p align=\"center\">");
out.println("Transaction<select name =\"Transaction\" title = \"Transaction\" multiple=\"false\">");
out.println("<option  value=\"In\"> In</option>");
out.println("<option value=\"Out\"> Out </option>");
out.println("<option value=\"View\"> View </option></select>");
out.println("Amount<input name=\"Amount\" />"); 
out.println(WmlTmp2);
out.println(WmlTmp3);
out.println("</p></card></wml>");

				   }
				
				
				
				}

      	
	}
    else
	   {
	//Override
out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"CardAlert\" title=\"ALERT\">");
out.println("<p align=\"center\">");
out.println("You don't have enough goods in your stock");
out.println(" Click back to change ");
out.println("</p></card></wml>");

	
	
	
	
	
	
	
	}


   }// close if out
else if (Transaction.equals("View"))
   { 






}//close if view


  }/////close method

public static void performQuery2(String aa,int bb,int cc) throws Exception {
        String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
        String connectionURL = "jdbc:odbc:userp";
        Connection con = null;
        Statement stmt = null;
        String sqlStatement = aa;
        ResultSet rs = null;
        try {
        Class.forName(driverName).newInstance();
        con = DriverManager.getConnection(connectionURL);
        stmt = con.createStatement();
        rs = stmt.executeQuery(sqlStatement);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        String line = "asd";
        for (int ii = 0; ii < bb; ii++)
        {
                rs.next();
        }
                  
         line = rs.getString(cc);//column of answer
         Knot = line;                
          System.out.println(line);
         
        }
         finally {
         if (rs != null) {
         rs.close();
         }
         if (stmt != null) {
         stmt.close();
         }
         if (con != null) {
         con.close();
         }
         }
         }

public static void performQuery3(String aaa) throws Exception {
        String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
        String connectionURL = "jdbc:odbc:userp";
        Connection con = null;
        Statement stmt = null;
        String sqlStatement = aaa;
        ResultSet rs = null;
        try {
        Class.forName(driverName).newInstance();
        con = DriverManager.getConnection(connectionURL);
        stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        rs = stmt.executeQuery(sqlStatement);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
     
         rs.last();
         String line = rs.getString(1);//column of answer
         Knot = line;                
          System.out.println(line);
        line = rs.getString(2) + " ";
        for (int i = 2; i < columnCount; i++)
        {
                
                line = line + rs.getString(i + 1);
                line = line + " ";
        }
        line = line + "Available";         
        Knot2= line;


        }
         finally {
         if (rs != null) {
         rs.close();
         }
         if (stmt != null) {
         stmt.close();
         }
         if (con != null) {
         con.close();
         }
         

         }
         }

}
