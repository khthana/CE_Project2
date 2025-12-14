<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date,java.util.*"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<HTML><HEAD><TITLE>:: Online e-Procurement ::</TITLE>
<LINK href="picture/cssomo1.css" rel=stylesheet type=text/css>
<META content="text/html; charset=windows-874" http-equiv=Content-Type>
<LINK href="picture/cssomo1.css" rel=stylesheet type=text/css>
<META content="MSHTML 5.00.2920.0" name=GENERATOR>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Sirirporn J.">
<META NAME="Description" CONTENT="First page for e-Procurement system">
</HEAD>
<BODY  leftMargin=0 topMargin=0 vLink=#0077ff marginheight="0" 
marginwidth="0"><FONT color=#000000></FONT>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=760 bgcolor="#FFFFFF" align="center">
  <TBODY > 
  <TR>
    <TD align=left height=75 vAlign=bottom>
      <%@include file="topmenu.html"%></TD></TR>
  
  <TR>
    <TD height=10 bgcolor="#B6B6B6"> 
    </TD>
  </TR>
    <TR>
    <TD height=30 bgcolor="white"> 
   <div align="right">  <FONT  COLOR="#658dc1"><B><%@include file="date.txt"%></B></FONT></div>
    </TD>
  </TR>
   <TR>
    <TD height=1 bgcolor="#B6B6B6"> 
    </TD>
  </TR>
  <TR colspan="2">
    <TD bgColor=#bfbfbf height=1 width=760></TD>
	</TR></TBODY></TABLE>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=760 align="center">
  <TBODY> 
  <TR> 
    <TD align=middle vAlign=top> 
      <TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
        <TR>
		  <TD bgColor="#bfbfbf" width="27%">
            <%@include file="directory.html"%>
             <%@include file="shopping.html"%><P><P><BR><BR>
          </TD>
		  <TD bgColor="#ffffff" width="73%" valign="top"> 
            <CENTER>

<%  String id=(String)session.getAttribute("emp");
	  String name=(String)session.getAttribute("name");
	  String sname=(String)session.getAttribute("sname");
	  String dept=(String)session.getAttribute("dept");
	  String passwd=(String)session.getAttribute("passwd");
	  
	  if ((id!=null) && (passwd!=null)){
		  response.sendRedirect("edit.jsp?id="+id+"&passwd="+passwd);
	  }else{
	  
	  %>
<P>&nbsp;<BR><form action="edit.jsp" method="post">		    
<TABLE align="CENTER" cellpadding="3" bordercolor="#66669A" border="1" width="250" cellspacing="0">
    <TR bgcolor="66669A" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#F1F0FF"><B>Login เข้าสู่ระบบ</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100"> รหัสสมาชิก</TD>
	<TD bgcolor="#F1F0FF" ><input type="text" name="id" size="15" maxlength="20"></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100">รหัสผ่าน</TD>
	<TD bgcolor="#F1F0FF" ><input type="password" name="passwd" size="15" maxlength="15"></TD>
</TR>
<TR>
<TD colspan="2" bgcolor="#F1F0FF" height="35" >
	<CENTER><INPUT TYPE="submit" value="ตกลง">&nbsp;&nbsp; <INPUT TYPE="reset" value="เริ่มใหม่"></CENTER>	
 </TD>
 </TR>	
</table>
<CENTER><a href="forgetpw.jsp">ลืมรหัสผ่าน</a> |  <a href="register.jsp">ลงทะเบียน</a></CENTER>
</form>		<%}%>
			</CENTER></TD>
	</TR>
	</TABLE>
    </TD>
  </TR>
  <TR>
                <%@include file="bottommenu.html"%>
                    </TR>

  </TBODY> 
</TABLE>
</BODY></HTML>
