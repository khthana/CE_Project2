package pro_gdl;



import java.io.*;

import java.sql.*;

import java.util.*;

import javax.servlet.*;

import javax.servlet.http.*;





/**

 * Insert the type's description here.

 * Creation date: (9/3/2002 23:04:02)

 * @author: Administrator

 */

public class Login extends javax.servlet.http.HttpServlet {

	public Login() {

	super();

	

	}

/**

 * Process incoming HTTP GET requests 

 * 

 * @param request Object that encapsulates the request to the servlet 

 * @param response Object that encapsulates the response from the servlet

 */

public void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {



		performTask(request, response);



	 	response.setContentType("text/html");



        PrintWriter out = response.getWriter();

        HttpSession session= request.getSession(true);

        

        String id = request.getParameter("id");

        String domain = request.getParameter("domain");

        String password = request.getParameter("password");

        

        Connection dbconn;

		String msgout = "";

		String log=null,pass=null,grp=null,effID=null;

		

	try

      {        

			String userid = "proj_gdl";

            String passwd = "proj_gdl2002";

			String url = "jdbc:db2://161.246.39.85/EXAMPLE";

			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();

            dbconn = DriverManager.getConnection( url, userid, passwd );

			Statement statement = dbconn.createStatement();

			String query =  "SELECT LOGIN_NAME,PASSWORD,EFFECTED_ID,GROUP "+

							"FROM  OBJECT.ACCOUNT "+

							"WHERE LOGIN_NAME= '"+id+"'"+"AND PASSWORD = '"+password+"' "+"AND GROUP = '"+domain+"'" ;

			ResultSet  rs = statement.executeQuery(query);

			

			while (rs.next())

		    {

				log   = rs.getString(1);

				pass  = rs.getString(2);

				effID = rs.getString(3);

				grp   = rs.getString(4);

							

			};

		    

    		dbconn.close();

		    

			if (log==null||pass==null) 

				response.sendRedirect("../demo/LoginFail.jsp");

			else 

				{

			//	session.setAttribute("LOGIN",id );

			//	session.setAttribute("PASS", password);

			//	session.setAttribute("GRP",domain);

			//	session.setAttribute("EFFID",effID);

				session.setAttribute("ISLOGIN","true");

				if ( grp.equals("t")) {

					session.setAttribute("GRP",domain);

					session.setAttribute("EFFID",effID);

				response.sendRedirect("../demo/TeacherMainPage.jsp?tid="+effID);

				};

				if (grp.equals("o")){

					session.setAttribute("GRP",domain);

				response.sendRedirect("../demo/OfficerMain.jsp");

				};

				if (grp.equals("a")){

					session.setAttribute("GRP",domain);

					response.sendRedirect("../demo/Admin.jsp");

				};



				

				out.println(" Group Incorect !!");



			};



		

	      }

      

      catch ( ClassNotFoundException cnfex )

      {

            cnfex.printStackTrace();

            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;

      }

      catch ( SQLException sqlex )

      {    

			sqlex.printStackTrace();

            msgout = "Connection unsuccessful\n" + sqlex.toString() ;

		   out.println(sqlex);

      }

      catch ( Exception excp )

      {    

            excp.printStackTrace();

            msgout = excp.toString();

      }

	out.println(msgout);



}

/**

 * Process incoming HTTP POST requests 

 * 

 * @param request Object that encapsulates the request to the servlet 

 * @param response Object that encapsulates the response from the servlet

 */

public void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {



	performTask(request, response);

    doGet(request, response);



}

/**

 * Returns the servlet info string.

 */

public String getServletInfo() {



	return super.getServletInfo();



}

/**

 * Initializes the servlet.

 */

public void init() {

	// insert code to initialize the servlet here



}

/**

 * Process incoming requests for information

 * 

 * @param request Object that encapsulates the request to the servlet 

 * @param response Object that encapsulates the response from the servlet

 */

public void performTask(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) {



	try



	{

		// Insert user code from here.



	}

	catch(Throwable theException)

	{

		// uncomment the following line when unexpected exceptions

		// are occuring to aid in debugging the problem.

		//theException.printStackTrace();

	}

}

}

