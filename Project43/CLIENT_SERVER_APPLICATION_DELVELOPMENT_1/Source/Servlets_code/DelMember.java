import java.util.*;
import java.io.*;
import java.sql.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;

public class DelMember extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
        Statement   stmt1 = null;
        Statement   stmt2 = null;
        Statement   stmt3 = null;
        Statement   stmt4 = null;
        Statement   stmt5 = null;
        ResultSet   rss   = null;
        Connection  conn  = null;
        Connection  conx  = null;
        Date d1 = new Date();
        Date d2 = new Date();
        double temp,temp1;
        long temp2;
        int count=0;
        String removename = "";

        //HttpSession session = req.getSession(true);
        //String buttons = req.getParameter("Submit");


        res.setContentType("text/html");
			  PrintWriter out = res.getWriter();
        out.println("<HTML><HEAD><TITLE>Delete User Expireed</TITLE></HEAD>");
			  out.println("<BODY><H1>Delete User</H1>");

        try
			    {
            Class.forName ("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
            conx = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
            stmt1 = conn.createStatement();
            stmt2 = conn.createStatement();
            stmt3 = conx.createStatement();
            stmt4 = conx.createStatement();
            stmt5 = conn.createStatement();

            //if (!buttons.equals("Remove")){
              temp1 = d1.getTime();
              temp2 = Long.parseLong("7776000000");
              d2.setTime(temp2);
              temp = temp1-temp2;
              rss = stmt1.executeQuery("select users from users where updatetime < "+temp);
              if (rss.next()) {
                out.println("<br>User not use service over 3 months. ");
                removename = rss.getString("users").trim();
                out.println("<br>"+(++count)+": "+removename);
                stmt2.executeUpdate("delete from users where users ='"+removename+"'");
                stmt3.executeUpdate("delete from read where users ='"+removename+"'");
                while (rss.next()){
                  removename = rss.getString("users").trim();
                  out.println("<br>"+(++count)+": "+removename);
                  stmt4.executeUpdate("delete from users where users ='"+removename+"'");
                  stmt5.executeUpdate("delete from read where users ='"+removename+"'");
                }
                out.println("<br>Remove complete");
              }
              else{
                out.println("<br>No Have user not use service over 3 months.");
              }
            //}else{

            //}


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