package pro_gdl;



import java.io.*;

import java.sql.*;

import java.util.*;

import javax.servlet.*;

import javax.servlet.http.*;



/**

 * Insert the type's description here.

 * Creation date: (1/1/2000 14:04:23)

 * @author: Administrator

 */

public class AddTeacher extends javax.servlet.http.HttpServlet {

	public AddTeacher() {

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

        

        String id 		= request.getParameter("id");

        String domain 	= request.getParameter("domain");

        String password = request.getParameter("password");





// GET PARAMETER FROM WEBPAGE





        String t_code 	= request.getParameter("T_CODE");

//        out.print(t_code+"<br>");

        String fr_t  	= request.getParameter("FR_T");

//        out.print(fr_t+"<br>");

        String name_t	= request.getParameter("NAME_T");

//        out.print(name_t+"<br>");

        String sur_t	= request.getParameter("SUR_T");

//        out.print(sur_t+"<br>");

        String fr_e		= request.getParameter("FR_E");

//        out.print(fr_e+"<br>");

        String name_e	= request.getParameter("NAME_E");

//        out.print(name_e+"<br>");

        String sur_e	= request.getParameter("SUR_E");

//        out.print(sur_e+"<br>");

        String acad_t	= request.getParameter("ACAD_T");

//        out.print(acad_t+"<br>");

        String acad_e	= request.getParameter("ACAD_E");

//        out.print(acad_e+"<br>");

        String date		= request.getParameter("DATE");

//        out.print(date+"<br>");

        String mon		= request.getParameter("MON");

//        out.print(mon+"<br>");

        String year		= request.getParameter("YEAR");

//        out.print(year+"<br>");

//		String b_date	= year+"-"+mon+"-"+date;        

//	    out.print(b_date+"<br>");

        String stat1	= request.getParameter("STAT1");

//        out.print(stat1+"<br>");

        String stat2	= request.getParameter("STAT2");

//        out.print(stat2+"<br>");

        String stat3	= request.getParameter("STAT3");

//        out.print(stat3+"<br>");

        String stat4	= request.getParameter("STAT4");

//        out.print(stat4+"<br>");

        

// Level 1

        String level1	= request.getParameter("LVL1");

//        out.print(level1+"<br>");

        String year1	= request.getParameter("YEAR1");

//        out.print(year1+"<br>");

        String maj1		= request.getParameter("MAJOR1");

//        out.print(maj1+"<br>");

        String dgt1		= request.getParameter("DGT1");

//        out.print(dgt1+"<br>");

        String place1	= request.getParameter("PLACE1");

//        out.print(place1+"<br>");

// Level 2        

        String level2	= request.getParameter("LVL2");

//        out.print(level2+"<br>");

        String year2	= request.getParameter("YEAR2");

//        out.print(year2+"<br>");

        String maj2		= request.getParameter("MAJOR2");

//        out.print(maj2+"<br>");

        String dgt2		= request.getParameter("DGT2");

//        out.print(dgt2+"<br>");

        String place2	= request.getParameter("PLACE2");

//        out.print(place2+"<br>");

// Level 3

        String level3	= request.getParameter("LVL3");

//        out.print(level3+"<br>");

        String year3	= request.getParameter("YEAR3");

//        out.print(year3+"<br>");

        String maj3		= request.getParameter("MAJOR3");

//        out.print(maj3+"<br>");

        String dgt3		= request.getParameter("DGT3");

//        out.print(dgt3+"<br>");

        String place3	= request.getParameter("PLACE3");

//        out.print(place3+"<br>");

// Level 4

        String level4	= request.getParameter("LVL4");

//        out.print(level4+"<br>");

        String year4	= request.getParameter("YEAR4");

///        out.print(year4+"<br>");

        String maj4		= request.getParameter("MAJOR4");

//        out.print(maj4+"<br>");

        String dgt4		= request.getParameter("DGT4");

//        out.print(dgt4+"<br>");

        String place4	= request.getParameter("PLACE4");

//        out.print(place4+"<br>");

// Level 5

        String level5	= request.getParameter("LVL5");

//        out.print(level5+"<br>");

        String year5	= request.getParameter("YEAR5");

//        out.print(year5+"<br>");

        String maj5		= request.getParameter("MAJOR5");

//        out.print(maj5+"<br>");

        String dgt5		= request.getParameter("DGT5");

//        out.print(dgt5+"<br>");

        String place5	= request.getParameter("PLACE5");

//        out.print(place5+"<br>");

// Level 6

        String level6	= request.getParameter("LVL6");

        

        String year6	= request.getParameter("YEAR6");

        String maj6		= request.getParameter("MAJOR6");

        String dgt6		= request.getParameter("DGT6");

        String place6	= request.getParameter("PLACE6");

// Address

        String addr  	= request.getParameter("ADDRESS");

//        out.print(addr+"<br>");

        String state	= request.getParameter("STATE");

//        out.print(state+"<br>");

        String country	= request.getParameter("COUNTRY");

//        out.print(country+"<br>");

        String zip		= request.getParameter("CODE");

//        out.print(zip+"<br>");

        String tel		= request.getParameter("TEL");

//        out.print(tel+"<br>");

        String fax		= request.getParameter("FAX");

//        out.print(fax+"<br>");

        String email	= request.getParameter("EMAIL");

//        out.print(email+"<br>");

        String url		= request.getParameter("URL");

//        out.print(url+"<br>");

// Specail expert

        String spec1	= request.getParameter("SPEC1");

//        out.print(spec1+"<br>");

        String spec2	= request.getParameter("SPEC2");

//        out.print(spec2+"<br>");

        String spec3	= request.getParameter("SPEC3");

//        out.print(spec3+"<br>");

        String spec4	= request.getParameter("SPEC4");

//        out.print(spec4+"<br>");

        String spec5	= request.getParameter("SPEC5");

//        out.print(spec5+"<br>");

		String s_year	= request.getParameter("S_YEAR");

//		out.print(s_year+"<br>");



// Subejct req



        String req1		= request.getParameter("SUB1");

//        out.print(req1+"<br>");

        String req2		= request.getParameter("SUB2");

//        out.print(req2+"<br>");

        String req3		= request.getParameter("SUB3");

//        out.print(req3+"<br>");

        String req4		= request.getParameter("SUB4");

//        out.print(req4+"<br>");

        String req5		= request.getParameter("SUB5");

//        out.print(req5+"<br>");

        

		String dept		= request.getParameter("DEPARTMENT");

//		out.print(dept+"<br>");

		String admin	= request.getParameter("ADMIN");

//		out.print(admin+"<br>");

       

        Connection dbconn;

		String msgout = "";

		String t_id=null;

		String tt_id =null;

		String subj="";

	

	

	try

      {        

			String userid = "proj_gdl";

            String passwd = "proj_gdl2002";

			String urldb = "jdbc:db2://161.246.39.85/EXAMPLE";

			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();

            dbconn = DriverManager.getConnection( urldb, userid, passwd );

			Statement statement = dbconn.createStatement();



			// test if T_CODE is already used //





			String qt = "SELECT T_ID FROM OBJECT.TEACHER_INFO WHERE T_CODE = '"+t_code+"'";



			ResultSet rt = statement.executeQuery(qt);

			while (rt.next())

			{

				tt_id = rt.getString(1);

			}

//			out.print("Check id <br>");



			if  ( name_e.equals("")|| name_t.equals("") || sur_e.equals("") || sur_t.equals("") || (tt_id !=null) ) 

			response.sendRedirect("../demo/error.jsp");



			else {

				

			if (s_year.equals("")) s_year = "0";

			if (date.equals("")) date ="00";

			if (mon.equals("")) mon ="00";

			if (year.equals("")) year ="0000";



			String b_date	= year+"-"+mon+"-"+date;        

			

			String qr1 =  	"INSERT INTO OBJECT.TEACHER_INFO(T_CODE,PRE_NAME_EN,PRE_NAME_TH,"+

							"ACAD_POS_EN,ACAD_POS_TH,NAME_EN,NAME_TH,SURNAME_TH,SURNAME_EN,"+

							"BIRTH_DATE,ADDRESS,STATE,COUNTRY,ZIP,TEL_NUMBER,FAX,EMAIL,"+

							"URL,YEAR_EXP,FAC_MEMBER_STATUS,TEACH_LEVEL,TEST_LEVEL,"+

							"TEACH_CON_LEV,DEPT_ID,ACAD_ADMIN_POS) "+

							"VALUES ('"+t_code+"','"+fr_e+"','"+fr_t+"','"+acad_e+"','"+acad_t+

							"','"+name_e+"','"+name_t+"','"+sur_t+"','"+sur_e+"','"+b_date+

							"','"+addr+"','"+state+"','"+country+"','"+zip+"','"+tel+

							"','"+fax+"','"+email+"','"+url+"',"+s_year+",'"+stat1+"','"+stat2+

							"','"+stat3+"','"+stat4+"',"+dept+",'"+admin+"')";

			

							

			ResultSet  rs = statement.executeQuery(qr1);

//			out.print("Insert <br>");



			if (rs != null ) { // insert complete



			String qr2 = 	"SELECT T_ID FROM OBJECT.TEACHER_INFO WHERE T_CODE = '"+t_code+"'";



			ResultSet rs2 = statement.executeQuery(qr2);

			

			

			while (rs2.next()){



			t_id = rs2.getString(1);

			

			}

			



			if (t_id != null ) {

//1

					if (level1.equals("") || place1.equals("") || dgt1.equals("") || maj1.equals("")||year1.equals("") ){}



					else {

				



			String qr3	=	"INSERT INTO OBJECT.TEACHER_DEGREE (T_ID,DEGREE_KIND,DEGREE_DES,FROM,"+

							"MAJOR,YEAR_FINISH) VALUES ("+t_id+",'"+level1+"','"+dgt1+"','"+place1+

							"','"+maj1+"',"+year1+")";



			ResultSet rs3 = statement.executeQuery(qr3);

			

			};

			

//2

			if ((level2.equals("")) || (place2.equals("")) || (dgt2.equals("")) || (maj2.equals(""))||(year2.equals(""))){

				

				}

			



			else {



//				out.println(" False 2<br>");



			String qr3	=	"INSERT INTO OBJECT.TEACHER_DEGREE (T_ID,DEGREE_KIND,DEGREE_DES,FROM,"+

							"MAJOR,YEAR_FINISH) VALUES ("+t_id+",'"+level2+"','"+dgt2+"','"+place2+

							"','"+maj2+"',"+year2+")";



			ResultSet rs3 = statement.executeQuery(qr3);

				

				

				};



//3



			if (level3.equals("") || place3.equals("") || dgt3.equals("") || maj3.equals("")||year3.equals("") ){}

//				response.sendRedirect("../demo/dataerror.jsp");



			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_DEGREE (T_ID,DEGREE_KIND,DEGREE_DES,FROM,"+

							"MAJOR,YEAR_FINISH) VALUES ("+t_id+",'"+level3+"','"+dgt3+"','"+place3+

							"','"+maj3+"',"+year3+")";



			ResultSet rs3 = statement.executeQuery(qr3);

			};

			

//4

			if (level4.equals("") || place4.equals("") || dgt4.equals("") || maj4.equals("")||year4.equals("") ){}



			else {





			String qr3	=	"INSERT INTO OBJECT.TEACHER_DEGREE (T_ID,DEGREE_KIND,DEGREE_DES,FROM,"+

							"MAJOR,YEAR_FINISH) VALUES ("+t_id+",'"+level4+"','"+dgt4+"','"+place4+

							"','"+maj4+"',"+year4+")";



			ResultSet rs3 = statement.executeQuery(qr3);

			};

			

//5

			if (level5.equals("") || place5.equals("") || dgt5.equals("") || maj5.equals("")||year5.equals("") ){}



			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_DEGREE (T_ID,DEGREE_KIND,DEGREE_DES,FROM,"+

							"MAJOR,YEAR_FINISH) VALUES ("+t_id+",'"+level5+"','"+dgt5+"','"+place5+

							"','"+maj5+"',"+year5+")";



			ResultSet rs3 = statement.executeQuery(qr3);



			};

//6

			if (level6.equals("") || place6.equals("") || dgt6.equals("") || maj6.equals("")||year6.equals("") ){}



			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_DEGREE (T_ID,DEGREE_KIND,DEGREE_DES,FROM,"+

							"MAJOR,YEAR_FINISH) VALUES ("+t_id+",'"+level6+"','"+dgt6+"','"+place6+

							"','"+maj6+"',"+year6+")";



			ResultSet rs3 = statement.executeQuery(qr3);

			};



			

// Spec1



	

			if ( spec1.equals("")) { }



			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_SPEC_EXPERT (T_ID,SPEC_EXP) VALUES ("+

							t_id+",'"+spec1+"')";



			ResultSet rs3 = statement.executeQuery(qr3);

			

			};



// Spec2

	

			if ( spec2.equals("")) { }



			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_SPEC_EXPERT (T_ID,SPEC_EXP) VALUES ("+

							t_id+",'"+spec2+"')";



			ResultSet rs3 = statement.executeQuery(qr3);

			

			};

			

// Spec3

	

			if ( spec3.equals("")) { }



			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_SPEC_EXPERT (T_ID,SPEC_EXP) VALUES ("+

							t_id+",'"+spec3+"')";



			ResultSet rs3 = statement.executeQuery(qr3);

			

			};

						



			if ( spec4.equals("")) { }



			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_SPEC_EXPERT (T_ID,SPEC_EXP) VALUES ("+

							t_id+",'"+spec4+"')";



			ResultSet rs3 = statement.executeQuery(qr3);

			

			};

		

// Spec5

	

			if ( spec5.equals("")) { }

			else {



			String qr3	=	"INSERT INTO OBJECT.TEACHER_SPEC_EXPERT (T_ID,SPEC_EXP) VALUES ("+

							t_id+",'"+spec5+"')";



			ResultSet rs3 = statement.executeQuery(qr3);

			

			};



			

// Subject request 1

	

			if ( req1.equals("")) { }



			else {



				// check if subject are exist can insert ....



				String q4 = "SELECT SUBJECT_ID FROM OBJECT.SUBJECT_INFO "+

							"WHERE SUBJECT_ID = '"+req1+"'";

							

				ResultSet rs4 = statement.executeQuery(q4);



				while(rs4.next()) {



				subj = rs4.getString(1);



				}



				out.print(subj);

				

				if (subj.equals(req1) )	// subject available

				{

					

				String q5	=	"INSERT INTO OBJECT.TEACHER_SUBJECT_REQ (T_ID,SUBJECT_ID) VALUES ("+

								t_id+",'"+req1+"')";



				ResultSet rs5 = statement.executeQuery(q5);



				}





				else { // subject not available

					out.println(" No subject in "+req1+" this course !! <br>");

				}



			

			};





// Subject request 2

	

			if ( req2.equals("")) { }



			else {



				// check if subject are exist can insert ....



				String q4 = "SELECT SUBJECT_ID FROM OBJECT.SUBJECT_INFO "+

							"WHERE SUBJECT_ID = '"+req2+"'";

							

				ResultSet rs4 = statement.executeQuery(q4);





				while(rs4.next()) {



				subj = rs4.getString(1);



				}



				out.print(subj);

				

				if (subj.equals(req2) )	// subject available

				{

					

				String q5	=	"INSERT INTO OBJECT.TEACHER_SUBJECT_REQ (T_ID,SUBJECT_ID) VALUES ("+

								t_id+",'"+req2+"')";



				ResultSet rs5 = statement.executeQuery(q5);



				}





				else { // subject available

					out.println(" No subject in "+req2+" this course !! <br>");

				}



			

			};

// Subject request 3

	

			if ( req3.equals("")) { }



			else {



				// check if subject are exist can insert ....



				String q4 = "SELECT SUBJECT_ID FROM OBJECT.SUBJECT_INFO "+

							"WHERE SUBJECT_ID = '"+req3+"'";

							

				ResultSet rs4 = statement.executeQuery(q4);







				while(rs4.next()) {



				subj = rs4.getString(1);



				}





				if (subj.equals(req3) )	// subject available

				{

					

				String q5	=	"INSERT INTO OBJECT.TEACHER_SUBJECT_REQ (T_ID,SUBJECT_ID) VALUES ("+

								t_id+",'"+req3+"')";



				ResultSet rs5 = statement.executeQuery(q5);



				}





				else { // subject available

					out.println(" No subject in "+req3+" this course !! <br>");

				}



			

			};

// Subject request 4

	

			if ( req4.equals("")) { }

//			response.sendRedirect("../demo/dataerror.jsp");



			else {



				// check if subject are exist can insert ....



				String q4 = "SELECT SUBJECT_ID FROM OBJECT.SUBJECT_INFO "+

							"WHERE SUBJECT_ID = '"+req4+"'";

							

				ResultSet rs4 = statement.executeQuery(q4);







				while(rs4.next()) {



				subj = rs4.getString(1);



				}





				if (subj.equals(req4) )	// subject available

				{

					

				String q5	=	"INSERT INTO OBJECT.TEACHER_SUBJECT_REQ (T_ID,SUBJECT_ID) VALUES ("+

								t_id+",'"+req4+"')";



				ResultSet rs5 = statement.executeQuery(q5);



				}





				else { // subject available

					out.println(" No subject in "+req4+" this course !! <br>");

				}



			

			};



// Subject request 5

	

			if ( req5.equals("")) { }



			else {



				// check if subject are exist can insert ....



				String q4 = "SELECT SUBJECT_ID FROM OBJECT.SUBJECT_INFO "+

							"WHERE SUBJECT_ID = '"+req5+"'";

							

				ResultSet rs4 = statement.executeQuery(q4);





				while(rs4.next()) {



				subj = rs4.getString(1);



				}





				if (subj.equals(req5) )	// subject available

				{

					

				String q5	=	"INSERT INTO OBJECT.TEACHER_SUBJECT_REQ (T_ID,SUBJECT_ID) VALUES ("+

								t_id+",'"+req5+"')";



				ResultSet rs5 = statement.executeQuery(q5);



				}





				else { // subject available

					out.println(" No subject in "+req5+" this course !! <br>");

				}



			

			};

			

			} ;//t_id != null

				

			} ;// if rs == null ........



			} ;// if name_e == null .....



			dbconn.close();

			response.sendRedirect("../demo/pass.jsp");

		

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

 * Insert the method's description here.

 * Creation date: (12/3/2002 3:01:40)

 * @param id java.lang.String

 */

public void insertTdegree(String id,String desT,String place,String maj,String yearfin) {



		if (id !=null && desT != null && place != null && maj != null & yearfin != null)

		

		{String q3 = " aaa";}



	

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

