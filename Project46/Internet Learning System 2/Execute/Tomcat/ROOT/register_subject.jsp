<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY background="images/bg.gif">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  border="0">
    <tr> 
      <td height="13"  colspan="1"><img src="images/coner.gif"/></td>
    </tr>
	<tr>
		<td height="30" align="right" background="images/greenbg.gif"><b><a href ="membersection.jsp">ไปหน้าสมาชิก</a>|<a href="logout.jsp">ออกจากระบบ</a></b></td>
	</tr>
</table>


<form action="checkregister.jsp" method="get" >
		<table width="700"   border="1" cellpadding="0" cellspacing="0"  >
		<tr > 
        <table  border="0" cellpadding="0" cellspacing="0" align="center">
          <tr> 
            <td width="593" height="300" valign="top"> 
			<table width="591" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="591" bgcolor="#00CC00"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>โปรดใส่รหัสรายวิชาที่จะลงทะเบียน</strong></font></td>
                </tr>
                <tr> 
                  <td width="591" >&nbsp;</td>
                </tr>
              </table>
              <table width="700" border="0" >
                 
<%
		if (session.getAttribute("auth")==null)
		{
		response.sendRedirect("main.jsp");
		return;
		}
		else{
	
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection mycon =DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
		Statement stmt = mycon.createStatement();
		String sql = "select * from subject_detail where time <>''&& subjectid not in(select subject_id from login_subject where username='"+session.getAttribute("auth")+"')";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
			{
				 String time = new String(rs.getString("time").getBytes("ISO8859_1"),"MS874");
				String teach = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
				out.println(" <tr><td >");
				out.println("<table width='750'  border=0 cellpadding=0 cellspacing=0><tr><td width='70'>"+rs.getString("subjectid")+"</td><td align=left width='230'>"+rs.getString("subjectname")+"</td><td align=left width='130'>"+time+"</td><td align=left width='100'>"+teach+"</td></tr></table>");
				out.println("</td></tr>");
			}	
			rs.close();
			stmt.close();
			mycon.close();
		}
%>
               <tr>
			   <td align="left" width="100">
			   <tr> 
                  <td width="591" >&nbsp;</td>
                </tr>
			   <table width="591" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="591" bgcolor="#00CC00"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>โปรดใส่รหัสรายวิชาที่จะลงทะเบียน</strong></font></td>
                </tr>
                <tr> 
                  <td width="591" >&nbsp;</td>
                </tr>
              </table>
			   <b>1</b>&nbsp;<input type="checkbok" name="subject1" ><br>
				 <b>2</b>&nbsp;<input type="checkbok" name="subject2" ><br>
				    <b>3</b>&nbsp;<input type="checkbok" name="subject3" ><br>
					<br><input name="register" type="submit"   value="ยืนยัน" border="0">
			     </td></tr>
				 
			  </table>
			</td>
			</tr></table>
	</tr></table>

	</form>
		

</BODY>
</HTML>
