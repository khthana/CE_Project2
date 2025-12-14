<%@ page contentType="text/html; charset=windows-874"%>
<%@page import="java.sql.*"%>
<html>
<title>Show Information Registration</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<SCRIPT TYPE="text/javascript">
<!--
function popup(mylink, windowname)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname, 'width=800,scrollbars=yes');
return false;
}
//-->
</SCRIPT>
<body background="images/bg.gif">
<%
	if (session.getAttribute("admin")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt = mycon.createStatement();
	String sql = "SELECT * FROM subject_detail ";
	ResultSet rs=stmt.executeQuery(sql);
	if (rs!=null)
	{
		out.println("<table width='750' cellpadding='0' cellspacing=0  border='0'>");
		out.println("<tr><td height='30' background='images/greenbg.gif'><center>รายชื่อวิชาทั้งหมดก่อนลบ</center></td></tr></table>");
		
		while(rs.next())
		{	
			 String detail = new String(rs.getString("detail").getBytes("ISO8859_1"),"MS874");
			 String detail2 = new String(rs.getString("detail2").getBytes("ISO8859_1"),"MS874");
			 String detail3 = new String(rs.getString("detail3").getBytes("ISO8859_1"),"MS874");
			 String detail4 = new String(rs.getString("detail4").getBytes("ISO8859_1"),"MS874");
			 String time = new String(rs.getString("time").getBytes("ISO8859_1"),"MS874");
			  String teach = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
			  String coteach = new String(rs.getString("co_teacher").getBytes("ISO8859_1"),"MS874");
			out.println("<table width=100% cellSpacing=0 cellPadding=0 align=center border=0 bgcolor=#ffeeff >");
			out.println("<tr align=left><td width='13%' ><font size=2 color='blue'>"+rs.getString("subjectid")+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString("subjectname")+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail2+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail3+"</font></td></tr>");
			out.println("<tr align=left><td width='95%'><font size=2 color='blue'>"+detail4+"</font></td></tr>");
			out.println("<tr align=left><td width='15%' ><font size=2 color='blue'>"+time+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+teach+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+coteach+"</font></td></tr><br>");
		}
		out.println("</table>");	
	}
	rs.close();
	stmt.close();
	mycon.close();
	}
%>	
<br><br>
<%
			int error = 0;
		String subjectid = request.getParameter("subjectid");
		String subjectname= request.getParameter("subjectname");
		String detail= request.getParameter("detail");
		String detail1= request.getParameter("detail1");
		String detail2= request.getParameter("detail2");
		String detail3= request.getParameter("detail3");
		String time= request.getParameter("time");
		String teacher = request.getParameter("teacher");
		String coteacher = request.getParameter("coteacher");
			
			if(subjectid.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบรหัสวิชาให้ถูกต้อง</font></center>");
	}
				if(subjectname.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อวิชาให้ถูกต้อง</font></center>");
	}
				if(detail.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อวิชาให้ถูกต้อง</font></center>");
	}			
				if(detail1.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อวิชาให้ถูกต้อง</font></center>");
	}
					if(detail2.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อวิชาให้ถูกต้อง</font></center>");
	}			
				if(detail3.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อวิชาให้ถูกต้อง</font></center>");
	}			
				if(time.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อวิชาให้ถูกต้อง</font></center>");
	}			
				
				if(teacher.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่ออาจารย์ให้ถูกต้อง</font></center>");
	}
		if( coteacher.equals(""))
	{
		error = 1;
		out.println("<center><font color=red size=2>ตรวจสอบชื่อผู้ช่วยอาจารย์ให้ถูกต้อง</font></center>");
	}
out.println("<center><font color=red size=2>รายละเอียดที่ได้เพิ่มไป <a href='showafteraddtutorial.jsp'  onClick='return popup(this, ''showafteraddtutorial')'>ดูได้ที</a>่</font></center>");
			int myresult=0;
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
	String sqla = "INSERT INTO subject_detail VALUES ('"+subjectid+"','"+subjectname+"','"+detail+"','"+detail1+"','"+detail2+"','"+detail3+"','"+time+"', '"+teacher+"', '"+coteacher+"' )";
			myresult=stmt.executeUpdate(sqla);
			
			stmt.close();
			mycon.close();
%>
</body>
</html>

