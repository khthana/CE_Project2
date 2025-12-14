<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<body background="images/bg.gif">
	<table width="100%" border="0" cellpadding="0" cellspacing="0"  border="0">
    <tr> 
      <td height="13" background="images/coner.gif" colspan="1"><b><a href ="membersection.jsp">ไปหน้าสมาชิก</a>
	
	<a href="register_subject.jsp">ลงทะเบียนวิชา</a>
	<a href="logout.jsp">ออกจากระบบ</a></b></td>
    </tr>
	</table>
<%
	if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	out.println("<table width='800' cellpadding='0' cellspacing=0  border='0'>");
	out.println("<tr><td height='30' background='images/greenbg.gif'><center>ยินดีต้อนรับคุณ "+session.getAttribute("auth")+"&nbsp;แก้ไข้ข้อมูลสมาชิกได้ที่นี่</center></td></tr></table>");
	String submit = request.getParameter("submit"),username="",email="";
	int error=0;

	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	
	String sql2 = "SELECT * FROM info WHERE username='"+session.getAttribute("auth")+"'";
	ResultSet rs = stmt.executeQuery(sql2);
	while(rs.next())
	{
		out.println("<form action='updateinfo.jsp' method='post'>");
		out.println("<table cellpadding=2 cellspacing=1 width='800' border='0' align=left>");
		
	%>
	<tr> 
                  <td width="100"  bgcolor="#00CC00"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>แก้ไขข้อมูลสมาชิก</strong></font></td>
                </tr>
	<%
		

		out.println("<tr><td bgcolor=#999999><strong><font color='#FFFFFF' size=2>*Username</font></strong></td>");
		out.println("<td><input type='text' name='username' size=20 value='"+rs.getString("username")+"'></td></tr>");

		out.println("<tr><td bgcolor=#999999><strong><font color=#FFFFFF size=2>*Password</font></strong></td>");
		out.println("<td><input type='text' name='password' size=20 value='"+rs.getString("password")+"'></td></tr>");
	%>
		 <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ชื่อ</font></strong></td>
                  <td colspan="3"><input type="text" name="name" size="20" ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*นามสกุล</font></strong></td>
                  <td colspan="3"><input name="surname" type="text"  size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ชื่อ(ภาษาอังกฤษ)</font></strong></td>
                  <td colspan="3"><input type="text" name="nameeng" size="20" ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*นามสกุล(ภาษาอังกฤษ)</font></strong></td>
                  <td colspan="3"><input name="surnameeng" type="text"  size="20" >
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*วันเดือนปีเกิด</font></strong></td>
                  <td colspan="3"><input type="text" name="birthday" size="20">&nbsp;(e.g. 12/04/2524)</td>
                </tr>
				<tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*อายุ</font></strong></td>
                  <td colspan="3"><input type="text" name="age" size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ส่วนสูง</font></strong></td>
                  <td colspan="3"><input type="text" name="height" size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*น้ำหนัก</font></strong></td>
                  <td colspan="3"><input type="text" name="weight" size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ที่อยู่ที่สามารถติดต่อได้</font></strong></td>
                  <td colspan="3"><input type="text" name="houseid" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ถนน</font></strong></td>
                  <td colspan="3"><input type="text" name="road" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ตำบล/แขวง</font></strong></td>
                  <td colspan="3"><input type="text" name="town" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*อำเภอ/เขต</font></strong></td>
                  <td colspan="3"><input type="text" name="city" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*จังหวัด</strong></font></td>
                  <td colspan="3"><input type="text" name="province" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*รหัสไปรษณีย์</strong></font></td>
                  <td colspan="3"><input type="text" name="postalcode" size=10></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*โทรศัพท์บ้าน</strong></font></td>
                  <td colspan="3"><input type="text" name="homenumber" size=15 ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*โทรศัพท์มือถือ</strong></font></td>
                  <td colspan="3"><input type="text" name="mobilenumber" size=15></td>
                </tr>
<%
		out.println("<tr ><td bgcolor=#999999><strong><font color='#FFFFFF' size=2>*Email</font></strong></td>");
		out.println("<td><input type='text' name='email' size=30 value='"+rs.getString("email")+"'></td></tr>");
		
%>
	<tr> 
                  <td  bgcolor="#FF9900" align="center"><div align="left"><font color="#FFFFFF" size="2"><strong>การศึกษา</strong></font></div></td>
                </tr>
	 <tr> 
                  <td   align="left" bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ระดับ</font></strong></td>
                  <td colspan="3"> <input name="level1" type="text"  >
                  <input name="level2" type="text" ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999" align="left"><strong><font color="#FFFFFF" size="2">*วุฒิการศึกษา</font></strong></td>
                  <td colspan="3"> <input name="degree1" type="text">
                  <input name="degree2" type="text" ></td>
                </tr>
                <tr> 
                  <td  align="left" bgcolor="#999999" width='70'><strong><font color="#FFFFFF" size="2">*สถาบัน</font></strong></td>
                  <td  > <input name="institute1" type="text">
				  <input name="institute2" type="text"></td>
                </tr>
                <tr> 
                  <td  align="left" bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*สาขา</font></strong></td>
                  <td  > <input name="major1" type="text">
				  <input name="major2" type="text"></td>
                </tr>
                <tr> 
                  <td align="left" bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*เกรด</font></strong></td>
                  <td  > <input name="grade1" type="text">
				  <input name="grade2" type="text"></td>
                </tr>

				
		
<%
	out.println("<tr id=color2><td colspan=2 align=left>");
		out.println("<input type='submit' name='submit' value='submit'></td></tr>");
		out.println("</table></form>");
	}
	rs.close();
	stmt.close();
	mycon.close();
%>
</body>
</html>