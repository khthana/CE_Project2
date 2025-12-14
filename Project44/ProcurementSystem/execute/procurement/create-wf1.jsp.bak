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
		       String emp = (String) session.getAttribute("emp");
			   String passwd = (String) session.getAttribute("passwd");
			   String dept = (String) session.getAttribute("dept");
			   String name =(String) session.getAttribute("name");
			   String sname=(String) session.getAttribute("sname");
			   String level=(String) session.getAttribute("level");

        if ((emp==null) && (passwd==null)){ %>

			 <P>&nbsp;<P>&nbsp;<CENTER><B>ยังไม่ได้ Login กรุณา  Login ก่อนเข้าระบบ</B></CENTER>

<%
			   }else{//login แล้ว
	
				   int lv=Integer.parseInt(level);
				    if(lv<=1){ //level ไม่พอ
								out.println("<P>&nbsp;<P>&nbsp;<P><b><div align=\"center\">คุณไม่สามารถแก้ไข  Workflow  ได้</div></b>");  
					}else{ //level  พอ
					%>
		  <P>&nbsp;<P>
  <FORM method="post" action="check_wf.jsp">
<TABLE cellpadding="3" bordercolor="#DF5F2D" border="1" width="450" cellspacing="0">
<TR bgcolor="#DF572D" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#FFF0E1"><B> กำหนดและแก้ไข Workflow ให้สินค้าแต่ละประเภท</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="220">ชื่อ Worlflow :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="wf_name" size="5"><FONT COLOR="#DF572D">****</FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ผู้อนุมัติคนที่ 1 :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="app1" size="30"><FONT COLOR="#DF572D">****</FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ผู้อนุมัติคนที่ 2 :</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="app2" size="30"><FONT COLOR="#DF572D">****</FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">ผู้ตรวจสอบ:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="viewer" size="30"><FONT COLOR="#DF572D">****</FONT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF">รายละเอียด:</TD>
	<TD bgcolor="#FFF0E1" ><INPUT TYPE="text" NAME="detail" size="50"></TD>
</TR>
<TR bgcolor="#FFF0E1" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="ตกลง"><INPUT TYPE="reset" value="เริ่มกรอกข้อมูลใหม่"></pre>
 	</TD>
</TR>
</TABLE>
</FORM>
						
			<%} }%>		
</TD>
	</TR>
	</TABLE>
    </TD>
  </TR>
  <TR><%@include file="bottommenu.html"%>
              
                    </TR>

  </TBODY> 
</TABLE>
</BODY></HTML>
