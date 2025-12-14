
<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>

<HTML>
<HEAD>
<TITLE>ตรวจสอบข้อมูล</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Siriporn J.">
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">

</HEAD>
<BODY>
<%
    String  code=new String(request.getParameter("code"));
	String  color=MS874ToUnicode(new String(request.getParameter("color")));
	String  type=MS874ToUnicode(new String(request.getParameter("type")));
	String  brand=MS874ToUnicode(new String(request.getParameter("brand")));
	String  ring=MS874ToUnicode(new String(request.getParameter("ring")));
	String  thick=MS874ToUnicode(new String(request.getParameter("thick")));
	String cat=new String(request.getParameter("cat"));
    String tape_size=MS874ToUnicode(new String(request.getParameter("tape_size")));
  	String  detail=MS874ToUnicode(new String(request.getParameter("detail")));
	
	boolean hasExplicit=false;
	


	if ( code.length()==0 || type.equals("0") || brand.length()==0 ){
	 hasExplicit=false;
	}else { hasExplicit=true;}	
	
	
	 if(!hasExplicit){
    out.println("<b><div align=\"center\">ยังกรอกข้อความไม่ครบถ้วน กรุณาย้อนกลับไป 1 หน้าเพื่อทำการแก้ไข</div></b>");
	}else{

         %>

  <CENTER>
<FORM method="post"action="add-glue.jsp?code=<%=code%>&type=<%=type%>&brand=<%=brand%>&color=<%=color%>&tape_size=<%=tape_size%>&cat=<%=cat%>&detail=<%=detail%>&thick=<%=thick%>&ring=<%=ring%>">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1" frame="above" rules="rhs" width="300" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B>เพิ่มสินค้าประเภทปากกา</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100">รหัสสินค้า :</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=code%></FONT></B></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100">ชนิด :</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=type%></FONT></B></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ยี่ห้อ :</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=brand%></FONT></B></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">สี :</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=color%></FONT></B></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ขนาดเทป:</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=tape_size%></FONT></B></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ความหนา:</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=thick%></FONT></B></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">วงแหวน :</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=ring%></FONT></B></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รายละเอียดอื่นๆ :</TD>
	<TD bgcolor="#FFF0E1" ><B><FONT COLOR="#DF572D"><%=detail%></FONT></B></TD>
</TR>
	<TR bgcolor="#FFF0E1" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="ยืนยัน"></pre>
 	</TD>
</TR>
</TABLE>
</FORM>
</CENTER>
<%
		  
	}
%>
</BODY>
</HTML>
