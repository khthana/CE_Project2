<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<HTML><HEAD><TITLE>:: Online e-Procurement ::</TITLE>
<LINK href="picture/cssomo1.css" rel=stylesheet type="text/css">
<META content="text/html; charset=windows-874" http-equiv=Content-Type>
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
   <div align="right">  
   <FONT  COLOR="#658dc1"><B>
   <%@include file="date.txt"%></B></FONT></div>
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
      <TABLE width="100%" cellpadding="3" cellspacing="0" border="0">
        <TR>
		  <TD bgColor="#bfbfbf" width="27%" align="center" valign="top">

            <%@include file="directory.html"%>
             <%@include file="shopping.html"%><P><P><BR><BR>

			
          </TD>
		  <TD bgColor="#ffffff" width="73%" align="center" valign="top"> 
            <CENTER>
	<%
    String  id=new String(request.getParameter("id"));
	String name=MS874ToUnicode(new String(request.getParameter("name")));
	String sname=MS874ToUnicode(new String(request.getParameter("sname")));
	String email=new String(request.getParameter("email"));
	String passwd=new String(request.getParameter("passwd"));
    String passwd1=new String(request.getParameter("passwd1"));
    String dept=MS874ToUnicode(new String(request.getParameter("dept")));
	String position=MS874ToUnicode(new String(request.getParameter("position")));
//	String level=MS874ToUnicode(new String(request.getParameter("level")));
	
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
    out.println("<P>&nbsp;<P>&nbsp;<BR><BR><div align=\"center\">ยังกรอกข้อความไม่ครบถ้วน กรุณา<A HREF=\"regis.jsp\">  ย้อนกลับไป 1 หน้า</A>  เพื่อทำการแก้ไข</div>");
	}else{

          if(!checkPW){
		  out.println("<P>&nbsp;<P>&nbsp;<BR><BR><div align=\"center\">รหัสผ่านไม่ตรงกัน กรุณา<A HREF=\"regis.jsp\">  ย้อนกลับไป 1 หน้า</A>  เพื่อทำการตรวจสอบใหม่</div>");	  
		  }else{ %>

  <CENTER>
	  <P><P><BR><BR>
<FORM method="post" action="regis.jsp">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1" width="350" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B>ตรวจสอบข้อมูลก่อนการลงทะเบียน</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">รหัสพนักงาน :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=id%></B></FONT></TD>
<INPUT TYPE="hidden" NAME="id" VALUE="<%=id%>">
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="80">ชื่อ :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=name%></B></FONT></TD>
	<INPUT TYPE="hidden" NAME="name" VALUE="<%=name%>">
</TR>
<TR>
	<TD bgcolor="#FFFFFF">นามสกุล :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=sname%></B></FONT></TD>
	<INPUT TYPE="hidden" NAME="sname" VALUE="<%=sname%>">
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รหัสผ่าน :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><% for(int ii =1; ii<= passwd.length() ; ii++) {out.print("*");} %></B></FONT></TD>
	<INPUT TYPE="hidden" NAME="passwd" VALUE="<%=passwd%>">
</TR>
<TR>
	<TD bgcolor="#FFFFFF">อี-เมลล์ :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=email%></B></FONT></TD>
	<INPUT TYPE="hidden" NAME="email" VALUE="<%=email%>">
</TR>
<TR>
	<TD bgcolor="#FFFFFF">แผนก/ฝ่าย :</TD>
	<TD bgcolor="#FFF0E1" >
	  <FONT COLOR="#DF572D"><B> <%=dept%>
     </B></FONT>
 </TD>
	<INPUT TYPE="hidden" NAME="dept" VALUE="<%=dept%>">
	<TR>
	<TD bgcolor="#FFFFFF">ตำแหน่ง :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=position%></B></FONT></TD>
	<INPUT TYPE="hidden" NAME="position" VALUE="<%=position%>">
</TR>
<!-- <TR>
	<TD bgcolor="#FFFFFF">Level : </TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B></B></FONT></TD>
</TR> -->
</TR>
<TR bgcolor="#FFF0E1" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="ยืนยันการลงทะเบียน"></pre>
 	</TD>
</TR>
</TABLE>
</FORM>
</CENTER>
<%
		  }
	}
%></TD>
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
