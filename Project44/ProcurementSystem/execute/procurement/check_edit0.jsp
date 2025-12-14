
<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">

<HTML>
<HEAD>
<TITLE>ตรวจสอบข้อมูลก่อนการงแก้ไข</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Siriporn J.">
</HEAD>
<BODY>
<%
    String  id=new String(request.getParameter("id"));
	String name=MS874ToUnicode(new String(request.getParameter("name")));
	String sname=MS874ToUnicode(new String(request.getParameter("sname")));
	String email=new String(request.getParameter("email"));
	String passwd=new String(request.getParameter("passwd"));
    String passwd1=new String(request.getParameter("passwd1"));
    String dept=MS874ToUnicode(new String(request.getParameter("dept")));
	String  level=new String(request.getParameter("level"));
	String position=MS874ToUnicode(new String(request.getParameter("position")));

	boolean hasExplicit=false;
	boolean checkPW=false;
	
	if ( id.length()==0 || name.length()==0 || sname.length()==0 || email.length()==0 || passwd.length()==0 || passwd1.length()==0 || dept.equals("0")){
	 hasExplicit=false;
	}else { hasExplicit=true;}	
	
	if (hasExplicit){
	   if (passwd.equals(passwd1)) {
           	     checkPW=true; 
	   } else{checkPW=false;}  
	}

	 if(!hasExplicit){
    out.println("<b><div align=\"center\">ยังกรอกข้อความไม่ครบถ้วน กรุณาย้อนกลับไป 1 หน้าเพื่อทำการแก้ไข</div></b>");
	}else{

          if(!checkPW){
		  out.println("<b><div align=\"center\">รหัสผ่านไม่ตรงกัน กรุณาย้อนกลับไป 1 หน้าเพื่อทำการตรวจสอบใหม่</div></b>");	  
		  }else{ %>

  <CENTER>
<FORM method="post" action="edit2.jsp?id=<%=id%>&name=<%=name%>&sname=<%=sname%>&passwd=<%=passwd%>&email=<%=email%>&dept=<%=dept%>&level=<%=level%>&position=<%=position%>">
<TABLE cellpadding="3" bordercolor="#66669A" border="1" frame="above" rules="rsh" width="200" cellspacing="0">
<TR bgcolor="#66669A" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#F1F0FF"><B>ตรวจสอบข้อมูลก่อนการแก้ไข</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">รหัสพนักงาน :</TD>
	<TD bgcolor="#F1F0FF" ><FONT COLOR="#66669A"><B><%=id%></B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">ชื่อ :</TD>
	<TD bgcolor="#F1F0FF" ><FONT COLOR="#66669A"><B><%=name%></B></FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">นามสกุล :</TD>
	<TD bgcolor="#F1F0FF" ><FONT COLOR="#66669A"><B><%=sname%></B></FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รหัสผ่าน :</TD>
	<TD bgcolor="#F1F0FF" ><FONT COLOR="#66669A"><B><% for(int ii =1; ii<= passwd.length() ; ii++) {out.print("*");} %></B></FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">อี-เมลล์ :</TD>
	<TD bgcolor="#F1F0FF" ><FONT COLOR="#66669A"><B><%=email%></B></FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">แผนก/ฝ่าย :</TD>
	<TD bgcolor="#F1F0FF" >
	  <FONT COLOR="#66669A"><B><%=dept%></B></FONT>
 </TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ตำแหน่ง :</TD>
	<TD bgcolor="#F1F0FF" >
	  <FONT COLOR="#66669A"><B><%=position%></B></FONT>
 </TD>
</TR>
<TR bgcolor="#F1F0FF" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="ยืนยันการแก้ไข"></pre>
 	</TD>
</TR>
</TABLE>
</FORM>
</CENTER>
<%
		  }
	}
%>
</BODY>
</HTML>
