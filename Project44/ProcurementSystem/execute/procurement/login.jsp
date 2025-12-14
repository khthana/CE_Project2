<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
    <%	String passwd=new String(request.getParameter("passwd"));
	String username=new String(request.getParameter("username"));

	
	int zero=0;
	boolean hasExplicit=false;
    boolean checkDB=true;

     if ( username.length()==0 || passwd.length()==0 ){
	 hasExplicit=false;
	}else { hasExplicit=true;}	
	 if(!hasExplicit){
    out.println("<b><div align=\"center\">ยังกรอกข้อความไม่ครบถ้วน กรุณาย้อนกลับไป 1 หน้าเพื่อทำการแก้ไข</div></b>");
	}else{
       
     // ส่วนจัดการ DB ของ Oracle
		 try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
//				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
                java.sql.Statement stmt = con.createStatement();
				ResultSet tmp = stmt.executeQuery("SELECT * FROM EMPLOYEE WHERE EMP#='"+username+"' AND PASSWD='"+passwd+"'" ) ;
				if ( tmp.next() )    { // code html ของหน้าหลักกรณีพาสเวิร์ดถูกต้อง 

	//			ResultSet res = stmt.executeQuery("SELECT ");
				
				String name=MS874ToUnicode(new String(tmp.getString("NAME")));
				String sname=MS874ToUnicode(new String(tmp.getString("SNAME")));
				String dept=MS874ToUnicode(new String(tmp.getString("DEPT")));
				String level=tmp.getString("LEVEL#");

				// String app=tmp.getString("APPROVE");
				  				
				session.setAttribute("emp",username); 
				session.setAttribute("passwd",passwd);
				session.setAttribute("name",name);
				session.setAttribute("sname",sname);
				session.setAttribute("dept",dept);
				session.setAttribute("level",level);

				String referringPage = (String) request.getHeaders("Referer").nextElement();
				response.sendRedirect(referringPage);


				}	else  {out.println("<b><div align=\"center\">รหัสผ่านผิดพลาด กรุณาตรวจสอบรหัสผ่านใหม่ หรือ<A HREF=\"forget.html\"> ลืมรหัสผ่าน</A></div></b>");  }
				//END IF;  
				checkDB=true;
				 tmp.close();
				 stmt.close();
		         con.close();
		 }
      catch(SQLException e) 
      {
	      while (e != null) 
         {
            out.println("SQLException:<br>");
  		      out.println("Message:   " + e.getMessage() + "<br>");
		      out.println("SQLState:  " + e.getSQLState() + "<br>");
		      out.println("ErrorCode: " + e.getErrorCode() + "<br>");
		      e = e.getNextException();
         }
	   }
	}     
		   
		   
		   %>
  