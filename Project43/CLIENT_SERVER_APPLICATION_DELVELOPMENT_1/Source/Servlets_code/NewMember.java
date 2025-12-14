import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class NewMember extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

			Connection conn   = null;
      Connection conx   = null;
			Statement  stmt   = null;
      Statement  stmtx  = null;
      ResultSet	rs = null;
      java.util.Date d1 = new java.util.Date();

			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			String user = req.getParameter("textfield1");
			String password =  req.getParameter("textfield2");
			String passwordc =  req.getParameter("textfield3");
			String cradit_card =  req.getParameter("textfield4");
			String cradit_size = req.getParameter("select4");
			String name =  req.getParameter("textfield5");

			String surname = req.getParameter("textfield6");
			String birth_date =  req.getParameter("select5");
			String birth_month = req.getParameter("select6");
			String birth_year =  req.getParameter("select7");

			String address = req.getParameter("textfield7");
			String road =  req.getParameter("textfield8")+" ";
			String district = req.getParameter("textfield9")+" ";
			String zone = req.getParameter("textfield10");

			String province = req.getParameter("textfield11");
			String country =  req.getParameter("textfield12");
			String zip = req.getParameter("textfield13");
			String hometel =  req.getParameter("textfield14")+" ";

			String officetel = req.getParameter("textfield15")+" ";
			String pager =  req.getParameter("textfield16")+" ";
			String email = req.getParameter("textfield17")+" ";
			String icq =  req.getParameter("textfield18")+" ";

			String birthday = birth_date+"/"+birth_month+"/"+birth_year;
			int cradit_sizex = Integer.parseInt(cradit_size);

			out.println("<HTML><HEAD><TITLE>New Member</TITLE></HEAD>");
			out.println("<BODY><H1>New Member</H1>");

			try
			{
        Class.forName ("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
        conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
				stmt = conn.createStatement();
        stmtx = conx.createStatement();
				boolean err_all=false;
				boolean err_blank_user=false,err_blank_password=false,err_blank_passwordc=false;
				boolean err_blank_name=false,err_blank_surname=false,err_blank_address=false;
				boolean err_blank_zone=false,err_blank_province=false,err_blank_cradit_card=false;
				boolean err_blank_country=false,err_blank_zip=false,err_sameuser=false;

				boolean err_user=false;//check english name
				boolean err_user_num=false;//check number of charecter must more than 6 char
				boolean err_password_num=false;
				boolean err_password_equals=false;

        rs = stmtx.executeQuery("select users from users where users = '"+user+"'");
        if (rs.next()) {
          err_sameuser = true;
          err_all = true;
        }
				//Check blank
				if (user.equals("")){
					err_blank_user = true;
					err_all = true;
				}
				if (password.equals("")){
					err_blank_password = true;
					err_all = true;
				}
				if (passwordc.equals("")){
					err_blank_passwordc = true;
					err_all = true;
				}
				//if (name.equals("")){
				//	err_blank_name = true;
				//	err_all = true;
				//}
				//if (surname.equals("")){
				//	err_blank_surname = true;
				//	err_all = true;
				//}
				//if (address.equals("")){
				//	err_blank_address = true;
				//	err_all = true;
				//}
				//if (zone.equals("")){
				//	err_blank_zone = true;
				//	err_all = true;
				//}
				//if (province.equals("")){
				//	err_blank_province = true;
				//	err_all = true;
				//}
				//if (country.equals("")){
				//	err_blank_country = true;
				//	err_all = true;
				//}
				//if (zip.equals("")){
				//	err_blank_zip = true;
				//	err_all = true;
				//}
				if (cradit_card.equals("")){
					err_blank_cradit_card = true;
					err_all = true;
				}
				//end check blank
				int len = user.length();
				if (len < 6){
					err_user_num=true;
					err_all = true;
				}
				char ch;
				for (int i=0; i<len; i++)
				{
					ch = user.charAt(i);
					if (ch > 127){
						err_user = true;
						err_all = true;
						break;
					}
				}
				if (password.length() < 6)
				{
					err_password_num = true;
					err_all	= true;
				}
				if (!password.equals(passwordc))
				{
					err_password_equals= true;
					err_all	= true;
				}


				if (!err_all){
					stmt.executeUpdate("insert into users (users,password,name,surname,birthday,address,road,district,zone,province,country,zip,hometel,officetel,pager,email,icq,cradit,updatetime) values ('"
					+user+"','"+password+"','"+name+"','"+surname+"','"+birthday+"','"+address+"','"+road+"','"+district+"','"+zone+"','"+province+"','"+country+"','"+zip+"','"+hometel+"','"
					+officetel+"','"+pager+"','"+email+"','"+icq+"',"+cradit_sizex+","+d1.getTime()*1+")");
					out.println("OK");
					out.println("<br><INPUT type=\"button\" name=\"bClose\" value=\"Close window\" onClick=\"self.close()\">");
				}
				else
				{
					int n=0;
					if (err_user)
						out.println("<br> "+(++n)+" User name must in English");
					//begin blank
					if (err_blank_user)
						out.println("<br> "+(++n)+" User name must not blank");
					if (err_blank_password)
						out.println("<br> "+(++n)+" Password must not blank");
					if (err_blank_passwordc)
						out.println("<br> "+(++n)+" Confirm password must not blank");
					if (err_blank_name)
						out.println("<br> "+(++n)+" Name must not blank");
					if (err_blank_surname)
						out.println("<br> "+(++n)+" Surname must not blank");
					if (err_blank_address)
						out.println("<br> "+(++n)+" Address must not blank");
					if (err_blank_zone)
						out.println("<br> "+(++n)+" Zone name must not blank");
					if (err_blank_province)
						out.println("<br> "+(++n)+" Province must not blank");
					if (err_blank_country)
						out.println("<br> "+(++n)+" Country must not blank");
					if (err_blank_zip)
						out.println("<br> "+(++n)+" Zip code must not blank");
					if (err_blank_cradit_card)
						out.println("<br> "+(++n)+" Cradit card number must not blank");
					if (err_user_num && !err_blank_user)
						out.println("<br> "+(++n)+" User name must more than 6 char");
					if (err_password_num && !err_blank_password && !err_blank_passwordc)
						out.println("<br> "+(++n)+" Password must more than 6 char");
					if (err_password_equals)
						out.println("<br> "+(++n)+" Password not equals confirm password");
          if (err_sameuser)
						out.println("<br> "+(++n)+" This user name is already. Please use another");
				}
				out.println("</BODY></HTML>");
			}
			catch ( SQLException e ) {
						System.err.println("Could not establish connection.");
				}
				catch ( ClassNotFoundException e ) {
						System.err.println("Could not load database driver.");
				}

				finally {
						try{
							if (conn != null)
								conn.close();
							}
						catch (SQLException ignored)	{	}
				}
		}
}