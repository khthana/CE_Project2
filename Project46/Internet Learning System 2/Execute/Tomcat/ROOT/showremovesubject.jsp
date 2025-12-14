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
			String key1 = request.getParameter("key1");
				
			int myresult=0;
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			Statement stmt=mycon.createStatement();
			String sqla = "SELECT * FROM subject where original_id='"+key1+"'";
			ResultSet rs = stmt.executeQuery(sqla);
				while(rs.next())
			{
				if (rs.getString("original_id").equals(key1))	
				{		Class.forName("org.gjt.mm.mysql.Driver");		
						Connection mycon2 = 				DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
			            Statement stmt2=mycon2.createStatement();
						String sql2 = "DELETE FROM subject WHERE original_id='"+key1+"'";
						myresult = stmt2.executeUpdate(sql2);
						stmt2.close();
						mycon2.close();
						out.println("Delete subject "+key1+"complete <br>รายละเอียดดู <a href='showafterremovesubject.jsp'  onClick='return popup(this, 'showafterremovesubject')'>ดูได้ที</a>" );
				}
			
			}
			rs.close();
			stmt.close();
			mycon.close();
		}
%>
</body>
</html>
