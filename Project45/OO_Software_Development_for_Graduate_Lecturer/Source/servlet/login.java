
/*
	@jaikla
*/
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import myutil.thaiLanguage;
import myutil.server;

public class login extends HttpServlet{

	private String url = "";
	private String user = "";
	private String passwd = "";
	private Connection con;

//--------------------------------------------------------------------------------------- start connectDB
	public void connectDB(PrintWriter out){
		try{			
			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
			con = DriverManager.getConnection(url,user,passwd);
		}
		catch (ClassNotFoundException e){out.println(e.getMessage());return;}
		catch (SQLException e){out.println(e.getMessage());return;}
		catch (Exception e){out.println(e.getMessage());return;}		
	}
//--------------------------------------------------------------------------------------- end connectDB

//--------------------------------------------------------------------------------------- start closeDB
	public void closeDB(){
		try{
			con.close( );
        }catch (SQLException e){System.err.print(e.getMessage());return;}
	}
//--------------------------------------------------------------------------------------- end closeDB
	//  ###########    doPost       #################
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		
		if(request.getParameter("login") != null){		//  login
			ResultSet rs;
			Statement stmt;
			String guser="";
			String gpassword="";
			guser = request.getParameter("username");
			gpassword = request.getParameter("password");

			// ตรวจสอบข้อมูลวิทยานิพนธ์ว่ามีอยู่หรือไม่
			String sqlCommand = "SELECT * FROM LOGIN WHERE GUSER='"+guser+"' AND GPASSWORD='"+gpassword+"'";
			try{
					connectDB(out);
					stmt = con.createStatement();
					rs = stmt.executeQuery(sqlCommand);
					if(rs.next()){		// password ถูกต้อง
						rs.close();
						stmt.close();
						closeDB();
						session.setAttribute("login","yes");						
						response.sendRedirect("../home.jsp");
					}
					else{				// password ไม่ถูกต้อง
						rs.close();
						stmt.close();
						closeDB();
						session.setAttribute("login","no");
						session.setAttribute("user",guser);
						response.sendRedirect("../index.jsp");
					}
			}
			catch (SQLException e){out.println("login SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("login Exception : "+e.getMessage());return;}	
		}	// end request.getParameter("login")
	}	// end doPost

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		// get database server
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		if(request.getParameter("logout")!=null){
			session.invalidate();
			response.sendRedirect("../index.jsp");
		}
	} // end doGet

}	// end class examThesisWork