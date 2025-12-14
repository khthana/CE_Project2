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
          <%
 	String  wf_name=MS874ToUnicode(new String(request.getParameter("wf_name")));
//	String  cat=MS874ToUnicode(new String(request.getParameter("cat")));
	String  app1=MS874ToUnicode(new String(request.getParameter("app1")));
	String  viewer=MS874ToUnicode(new String(request.getParameter("viewer")));
	String  detail=MS874ToUnicode(new String(request.getParameter("detail")));
	String  app2=MS874ToUnicode(new String(request.getParameter("app2")));
	
//	String  tb_name=MS874ToUnicode(new String(request.getParameter("tb_name")));
//	String  workflow=MS874ToUnicode(new String(request.getParameter("workflow")));
	boolean hasExplicit=false;
	


	if ( wf_name.length()==0 || app1.length()==0 ){
	 hasExplicit=false;
	}else { hasExplicit=true;}	
	
	
	 if(!hasExplicit){
    out.println("<b><div align=\"center\">ยังกรอกข้อความไม่ครบถ้วน กรุณาย้อนกลับไป 1 หน้าเพื่อทำการแก้ไข</div></b>");
	}else{
         %>
&nbsp;<P>&nbsp;<P>
<FORM method="post" action="create-wf.jsp">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1"  width="400" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B>กำหนดประเภทสินค้าใหม่</B></FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF" width="150">ชื่อ workflow:</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><b><%=wf_name%><INPUT TYPE="hidden" NAME="wf_name" VALUE="<%=wf_name%>"></b></FONT>      
	</TD>
		</TR>

<TR>
	<TD bgcolor="#FFFFFF">ผู้อนุมัติคนที่ 1 :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%=app1%></B></FONT>
		<INPUT TYPE="hidden" NAME="app1" VALUE="<%=app1%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ผู้อนุมัติคนที่ 2 :</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%if (app2.length()==0){out.print("-");}else {out.print(app2);}%></B></FONT>
		<INPUT TYPE="hidden" NAME="app2" VALUE="<%=app2%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ผู้ตรวจสอบ:</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%if (viewer.length()==0){out.print("-");}else {out.print(viewer);}%></B></FONT>
		<INPUT TYPE="hidden" NAME="viewer" VALUE="<%=viewer%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รายละเอียด:</TD>
	<TD bgcolor="#FFF0E1" ><FONT COLOR="#DF572D"><B><%if (detail.length()==0){out.print("-");}else {out.print(detail);}%></B></FONT>
		<INPUT TYPE="hidden" NAME="detail" VALUE="<%=detail%>"></TD>
</TR></TR>
<TR bgcolor="#FFF0E1" valign="center" align="center" height="24">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="ตกลง"></pre>
 	</TD>
</TR>
</TABLE>
</FORM>

	<%}%></TD>
	</TR>
	</TABLE>
    </TD>
  </TR>
  <TR><%@include file="bottommenu.html"%>
              
                    </TR>

  </TBODY> 
</TABLE>
</BODY></HTML>
