import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class InsertCus extends HttpServlet
implements SingleThreadModel {

private Connection conn = null;
public void init( ServletConfig config ) throws ServletException {
  super.init(config);
  try {
   Class.forName ("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:PROJECT","scott","tiger");
  } catch ( SQLException e ) {
  System.err.println("Could not establish connection.");
  } catch ( ClassNotFoundException e ) {
  System.err.println("Could not load database driver.");
  }
} // init

//-------------------------------Get Method------------------------------
public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


  int i=0;
 	int N_Row=0;
  int Check=0;

  String Col_User="";        //Query Username from table customer
  String User_Cut="";        //Cut space from string Col_User

  int U_Id=0;                //Colum 1
  String U_Fname="";         //Colum 2
	String U_Lname="";         //Colum 3
	String U_Sex="";           //Colum 4
	String U_Bday="";          //Colum 5
	String U_Bmouth="";
	String U_Byear="";
	String U_Birthday="";
	String U_Address="";       //Colum 9
  String U_Province="";      //Colum 10
	String U_Zipcode="";       //Colum 11
	String U_Telephone="";     //Colum 12
  String U_G1="";            //Colum 13
  String U_G2="";
  String U_G3="";
  String U_G4="";
  String U_G5="";
  String U_NumberCard="";
	String U_Email="";         //Colum 19
	String U_Username="";      //Colum 20
	String U_Password="";      //Colum 21
	String U_ConfirmPwd="";
  String U_UserStatus="";    //Colum 22
  boolean CheckError=true;

	//----------------------get Data from TextField --------------------
  ToUnicode t=new ToUnicode();
  U_Fname=t.toUnicode(req.getParameter("Fname"));
	U_Lname=t.toUnicode(req.getParameter("Lname"));
	U_Sex=t.toUnicode(req.getParameter("Sex"));

	U_Bday=t.toUnicode(req.getParameter("Bday"));
	U_Bmouth=t.toUnicode(req.getParameter("Bmouth"));
	U_Byear=t.toUnicode(req.getParameter("Byear"));
	U_Birthday=(U_Bday+"/"+U_Bmouth+"/"+U_Byear);

  U_Address=t.toUnicode(req.getParameter("Address"));
  U_Province=t.toUnicode(req.getParameter("Province"));
  U_Zipcode=t.toUnicode(req.getParameter("Zipcode"));
	U_Telephone=t.toUnicode(req.getParameter("Telephone"));

  U_G1=t.toUnicode(req.getParameter("G1"));
  U_G2=t.toUnicode(req.getParameter("G2"));
  U_G3=t.toUnicode(req.getParameter("G3"));
  U_G4=t.toUnicode(req.getParameter("G4"));
  U_G5=t.toUnicode(req.getParameter("G5"));
  U_NumberCard=(U_G1+"-"+U_G2+"-"+U_G3+"-"+U_G4+"-"+U_G5);

	U_Email=req.getParameter("Email");
	U_Username=req.getParameter("Username");
	U_Password=req.getParameter("Password");
	U_ConfirmPwd=req.getParameter("ConfirmPwd1");
  //--- UserStatus define automatic is CUSTOMER-----//
  U_UserStatus = "Customer";
 //--------------------------Data Base-------------------------------//

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
   	    res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println("<HTML><HEAD><TITLE>HomeProject</TITLE></HEAD>");


		   //---- Check Emtry Textfield -----//
       if( U_Fname.equals("") || U_Lname.equals("")|| U_Address.equals("") || U_Sex.equals("") ||
           U_Province.equals("")|| U_Zipcode.equals("") || U_Telephone.equals("")||
           U_NumberCard.equals("")|| U_Email.equals("") || U_Username.equals("") ||
           U_Password.equals("") || U_ConfirmPwd.equals(""))
          {
            out.println("<BODY><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"6\"> HomeProject </font></b></font></p><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"5\">Error ja <font size=\"6\">!</font></font></b></font></p>"+U_Birthday);
            CheckError=false;
			    }
          else {
                //---- Create ID User ----
	              rset = stmt.executeQuery("SELECT count(*) FROM customer");
	              rset.next();
                N_Row = rset.getInt(1);
                rset = stmt.executeQuery("SELECT Username FROM customer");
                for(i=1;i<=N_Row;i++)
                { //---- Next row ---------
                  rset.next();
				          Col_User=rset.getString(1);
                  User_Cut=Col_User.trim();
                  if (User_Cut.equals(U_Username))
                  {
                    out.println("<p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"6\"> HomeProject </font></b></font></p><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"5\">Error Username already ja <font size=\"6\">!</font></font></b></font></p>");
                    Check++;
                    CheckError=false;
                    i=N_Row;
                  } //if
                }//for
                if (Check == 0) // Check is zero for not check passwoed
                {
                  //---- Compare Password  with Confirm password ----//
                  i = U_Password.length();
                  if (i == 8)
                  {
                    if (U_Password.equals(U_ConfirmPwd))
				            {
                      U_Id = N_Row;//rset.getInt(1);
                      U_Id++;
                      String U_Authorize = "yes";
              	     stmt.executeUpdate("INSERT INTO "+"customer"+" VALUES ("+"'"+U_Id+"'"+",'"+U_Fname+"',"+"'"+U_Lname+"'"+",'"+U_Sex+"'"
                                                                              +",'"+U_Birthday+"'"+",'"+U_Address+"'"+",'"+U_Province+"'"
                                                                              +",'"+U_Zipcode+"'"+",'"+U_Telephone+"'"+",'"+U_NumberCard+"'"
                                                                              +",'"+U_Email+"'"+",'"+U_Username+"'"+",'"+U_Password+"'"+",'"+U_UserStatus+"','"+U_Authorize+"')");


                    }//if
                    else { //---- Display Error Confirm password ----
                           out.println("<BODY><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"6\"> HomeProject</font></b></font></p><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"5\">Error password not equal confirm password ja <font size=\"6\">!</font></font></b></font></p>");
                           CheckError=false;
			    	             }//else
                  }//if
                  else {  //---- Display error password langht
                         out.println("<BODY><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"6\"> HomeProject</font></b></font></p><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"5\">Error password ja <font size=\"6\">!</font></font></b></font></p>");
                         CheckError=false;
                       }//else
                }//if

          }// else

    if (CheckError)
    {
    	out.println("<BODY><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"6\"> HomeProject</font></b></font></p><p><font face=\"AngsanaUPC, MS Sans Serif\" size=\"3\"><b><font size=\"5\">Your registor complete </font></font></b></font></p>");
	    out.println("</BODY></HTML>");
    }
    else  out.println("</BODY></HTML>");

    } catch ( SQLException e ) {
    System.err.println("A database error occurred.");
    }


  } //doGet
  //-------------------Distroy----------------------
 public void destroy() {
 try {
 // close the database connection
  if ( conn != null) conn.close();
  } catch (SQLException e) {
     System.err.println("Error closing database connection.");
  }
 } // destroy
}