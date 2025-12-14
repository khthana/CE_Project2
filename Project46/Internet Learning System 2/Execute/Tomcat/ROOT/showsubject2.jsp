<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
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
<table width="100%" border="0" cellpadding="0" cellspacing="0"  border="0">
    <tr> 
      <td height="13"  colspan="1"><img src="images/coner.gif"/></td>
    </tr>
	<tr>
		<td height="30" align="right" background="images/greenbg.gif"><A 
		 href="main.jsp"> หน้าหลัก </A> |<A 
		 href="be_ourmember.jsp"> สมัครสมาชิก </A>| <A 
		href="whoarewe.jsp"> Who are we ? </A> |<A 
		href="contactus.jsp" > Contact us </A>| <A 
		href="boardlist.jsp" > Help </A></td>
	</tr>
	</table>
	<%
	String sid=request.getParameter("subject_id");
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
	Statement stmt=mycon.createStatement();
	String sql = "SELECT *  FROM subject_detail where subjectid='"+sid+"'";
	ResultSet rs=stmt.executeQuery(sql);
	while(rs.next())
	{
     	out.println(" <table width='100%' border='0' cellspacing='0' cellpadding='5' bordercolor='#CCCCCC' align = 'center'>");
       	out.println(" <tr> ");
        out.println("<td colspan='2' height='30' bgcolor='#336699'> ");
        out.println("<div align='center'><font face='Tahoma' size='3' color='#FFFFFF'>ข้อมูลรายวิชาภาควิชาวิศวกรรมคอมพิวเตอร์</font></div>");
        out.println(" </td>");
       	out.println("</tr>");
       	out.println("<tr> ");
         out.println("<td width='23%' height='25' bgcolor='#336699'> ");
         out.println("<div align='center'><font face='Tahoma' size='2' color='#FFFFFF'>รหัสรายวิชา</font></div>");
       	out.println("</td>");
      	out.println("<td width='600%' height='25' bgcolor='#F4F4F4'><font face='Tahoma' size='2'>"+rs.getString("subjectid")+"&nbsp;</font> ");
        out.println("</td>");
  	    out.println("</tr>");
        out.println("<tr>");
        out.println("<td width='23%' height='25' bgcolor='#336699'> ");
        out.println("<div align='center'><font face='Tahoma' size='2' color='#FFFFFF'>ชื่อวิชาภาษาอังกฤษ</font></div>");
        out.println("</td>");
        out.println(" <td width='600%' height='25' bgcolor='#F4F4F4'><font face='Tahoma' size='2'>"+rs.getString("subjectname")+"&nbsp;</font> ");
        out.println("</td>");
        out.println("</tr>");
        out.println(" <tr>"); 
         out.println(" <td width='23%' height='25' bgcolor='#336699'> ");
         out.println(" <div align='center'><font color='#FFFFFF' size='2' face='Tahoma'>อาจารย์ผู้สอน</font></div>");
         out.println("</td>");
        	String teach = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
			out.println("<td width='600%' height='25' bgcolor='#F4F4F4'><font face='Tahoma' size='2'>"+teach+"&nbsp;</font></td>");
         out.println("</tr>");
         out.println("<tr> ");
         out.println("<td width='23%' height='25' bgcolor='#336699'>"); 
         out.println(" <div align='center'><font color='#FFFFFF' size='2' face='Tahoma'>ผู้ช่วยอาจารย์ผู้สอน</font></div>");
         out.println(" </td>");
		       String coteach = new String(rs.getString("co_teacher").getBytes("ISO8859_1"),"MS874");
		 out.println("<td width='600%' height='25' bgcolor='#F4F4F4'><font face='Tahoma' size='2'>"+coteach+"&nbsp;</font>");
         out.println("</td>");
         out.println("</tr>");
         out.println("<tr > ");
         out.println(" <td bgcolor='#336699' height='25'> ");
         out.println("<div align='center'><font size='2' face='Tahoma' color='#FFFFFF'>เนื้อหารายวิชา</font></div>");
         out.println("</td>");
          String detail = new String(rs.getString("detail").getBytes("ISO8859_1"),"MS874");
			 String detail2 = new String(rs.getString("detail2").getBytes("ISO8859_1"),"MS874");
			 String detail3 = new String(rs.getString("detail3").getBytes("ISO8859_1"),"MS874");
			 String detail4 = new String(rs.getString("detail4").getBytes("ISO8859_1"),"MS874");
		 out.println("<td bgcolor='#F4F4F4' height='25' width='600' ><font face='Tahoma' size='2'>-"+detail+detail2+detail3+detail4+"&nbsp;</font></td>");
         out.println("</tr>");
         out.println("<tr> ");
         out.println("  <td bgcolor='#336699' height='25'>"); 
         out.println("<div align='center'><font size='2' face='Tahoma' color='#FFFFFF'>เวลาเรียน</font></div>");
         out.println("</td>");
            String time = new String(rs.getString("teacher").getBytes("ISO8859_1"),"MS874");
		 out.println("<td bgcolor='#F4F4F4' height='25'><font face='Tahoma' size='2'>"+time+"&nbsp;</font></td>");
        out.println(" </tr>");
        out.println("</table>");
	}	
	
	
	
	rs.close();
	stmt.close();
	mycon.close();
%>
</BODY>
</HTML>
