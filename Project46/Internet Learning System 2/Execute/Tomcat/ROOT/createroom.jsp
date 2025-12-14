<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<LINK href="css/default.css" type=text/css rel=stylesheet>
</HEAD>

<BODY background="images/bg.gif">
<%
	if (session.getAttribute("admin")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}else{
			String login = request.getParameter("login");
			if(login!= null)
			{
				String id =request.getParameter("id");
				
				Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon2 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt2 = mycon2.createStatement();
			String sql2 = "SELECT * FROM room_online WHERE subject_id='"+id+"'";
			ResultSet rs2 = stmt2.executeQuery(sql2);
			while(rs2.next())
			{
					if(rs2.getString("subject_id").equals(id))
					{
							int myresult1=0;
							Class.forName("org.gjt.mm.mysql.Driver");
							Connection mycon3 = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
							Statement stmt3 = mycon3.createStatement();
							String sql3 = "DELETE  FROM room_online WHERE subject_id='"+id+"'";
							myresult1 = stmt3.executeUpdate(sql3);
							stmt3.close();
							mycon3.close();
					}
			}
			rs2.close();
			stmt2.close();
			mycon2.close();
				
				int myresult=0;
				long time_const=1*60*1000;
				long ts = new java.util.Date().getTime();
				long time_start=ts+time_const;
				long time_end=time_start+(3*60*60*1000);
			//java.util.Date time_start = new java.util.Date();
			//out.println(time_start);
			//java.util.Date time_end = new java.util.Date();
			//out.println(time_end);
				Class.forName("org.gjt.mm.mysql.Driver");
				Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
				Statement stmt = mycon.createStatement();
				String sql = "INSERT INTO room_online VALUES('"+id+"','"+time_start+"','"+time_end+"')";
				myresult=stmt.executeUpdate(sql);
				stmt.close();
				mycon.close();
				out.println("<a href='adminlogin.jsp'><center>การสร้างห้องเสร็จสมบรูณ์</center></a>");
			}
		
		if(login==null)
		{
	%>	
		<form action="createroom.jsp"  name="login" method="post" >
		<table width="700"   border="1" cellpadding="0" cellspacing="0"  >
		<tr class="black"> 
        <table  border="0" cellpadding="0" cellspacing="0" align="center">
          <tr> 
            <td width="593" height="130" valign="top"> <table width="591" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="591" bgcolor="#00CC00"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>โปรดใส่ชื่อวิชาที่จะสร้างห้องเรียน</strong></font></td>
                </tr>
                <tr> 
                  <td width="591" >&nbsp;</td>
                </tr>
              </table>
              <table width="593" border="0" >
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*รหัสวิชาที่จะสร้าง</font></strong></td>
                  <td colspan="3"><input type="text" name="id" size="40" ></td>
                </tr>
                
              </table>
              <br>
			<table width="100%" border="0">
                <tr> 
                  <td><div align="right"> 
                      <input type="submit"  name="login"  value="submit">
                    </div></td>
                  <td><div align="left"> 
                      <input type="reset" name="reset" value="reset">
                    </div></td>
                </tr>
              </table>
    </tr>
  <%
		
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection mycon =DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
		Statement stmt = mycon.createStatement();
		String sql = "select * from subject_detail where time <>'' ";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
			{
				   String time = new String(rs.getString("time").getBytes("ISO8859_1"),"MS874");
					String teach = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
				out.println(" <tr><td >");
				out.println("<table width='750'  border=0 cellpadding=0 cellspacing=0><tr><td width='40'>"+rs.getString("subjectid")+"</td><td align=left width='220'>"+rs.getString("subjectname")+"</td><td align=left width='130'>"+time+"</td><td align=left width='140'>"+teach+"</td></tr></table>");
				out.println("</td></tr> ");
			}	
			rs.close();
			stmt.close();
			mycon.close();
	   }
	}
%>
</table></form>
</BODY>
</HTML>
