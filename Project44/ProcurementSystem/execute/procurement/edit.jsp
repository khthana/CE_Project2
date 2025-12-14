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
		  <TD bgColor="#ffffff" width="73%" align="center" valign="top"> 
            <CENTER>
			<% 

      
	  String id=(String)session.getAttribute("emp");
	  String passwd=(String)session.getAttribute("passwd");

if ((id==null) && (passwd==null)){
 id=request.getParameter("id");   
 passwd=request.getParameter("passwd");  
}try{

         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT * FROM EMPLOYEE WHERE EMP#='"+id+"' AND PASSWD='"+passwd+"'";
         ResultSet rs=stmt.executeQuery(query);
        if (rs.next()){

         String name=rs.getString("NAME");
		 String sname=rs.getString("SNAME");
		 String email=rs.getString("EMAIL");
		 String dept=rs.getString("DEPT");
		 String level=rs.getString("LEVEL#");
		 String position=rs.getString("POSITION");

	
  %>
	  <P>&nbsp;<P>&nbsp;
<FORM method="post" action="check_edit.jsp">
	  
<TABLE align="CENTER" cellpadding="3" bordercolor="#66669A" border="1" width="400" cellspacing="0">
<TR bgcolor="66669A" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#F1F0FF"><B>แก้ไขข้อมูลส่วนตัว</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="140">รหัสพนักงาน :</TD>
	<TD bgcolor="#F1F0FF" ><FONT COLOR="#66669A"><B><%=id%></B></FONT></TD>
	<INPUT TYPE="hidden" NAME="id" VALUE="<%=id%>">
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="140">ชื่อ :</TD>
	<TD bgcolor="#F1F0FF" ><INPUT TYPE="text" NAME="name" size="30" VALUE="<%=name%>"></TD>

</TR>
<TR>
	<TD bgcolor="#FFFFFF" width="140">นามสกุล :</TD>
	<TD bgcolor="#F1F0FF" ><INPUT TYPE="text" NAME="sname" size="30" VALUE="<%=sname%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF" width="140">รหัสผ่าน :</TD>
	<TD bgcolor="#F1F0FF" ><INPUT TYPE="password" NAME="passwd" size="10" VALUE="<%=passwd%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF" width="140">รหัสผ่านอีกครั้ง : </TD>
	<TD bgcolor="#F1F0FF" ><INPUT TYPE="password" NAME="passwd1" size="10" VALUE="<%=passwd%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF" width="140">อี-เมลล์ :</TD>
	<TD bgcolor="#F1F0FF" ><INPUT TYPE="text" NAME="email" size="30" VALUE="<%=email%>"></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF" width="140">แผนก/ฝ่าย :</TD>
	<TD bgcolor="#F1F0FF" ><SELECT NAME="dept">
			  <OPTION VALUE="บุคคล" <% if (dept.equals("บุคคล")) {out.print("SELECTED");}%>>บุคคล
			  <OPTION VALUE="การเงิน" <% if (dept.equals("การเงิน")) {out.print("SELECTED");}%>>การเงิน
			  <OPTION VALUE="การตลาด" <% if (dept.equals("การตลาด")) {out.print("SELECTED");}%>>การตลาด
			  <OPTION VALUE="วางแผนและพัฒนา" <% if (dept.equals("วางแผนและพัฒนา")) {out.print("SELECTED");}%>>วางแผนและพัฒนา
			  <OPTION VALUE="เทคโนโลยีสารสนเทศ" <% if (dept.equals("เทคโนโลยีสารสนเทศ")) {out.print("SELECTED");}%>>เทคโนโลยีสารสนเทศ
			  <OPTION VALUE="ประชาสัมพันธ์" <% if (dept.equals("ประชาสัมพันธ์")) {out.print("SELECTED");}%>>ประชาสัมพันธ์
	           <OPTION VALUE="จัดซื้อ" <% if (dept.equals("จัดซื้อ")) {out.print("SELECTED");}%>>จัดซื้อ
 	           <OPTION VALUE="บัญชี" <% if (dept.equals("บัญชี")) {out.print("SELECTED");}%>>บัญชี
	          </SELECT></TD>
</TR>
<TR>
	<TD bgcolor="#FFFFFF" width="140">ตำแหน่ง : </TD>
	<TD bgcolor="#F1F0FF" ><SELECT NAME="position">
		<OPTION VALUE="ผู้จัดการฝ่าย" <%if (position.equals("ผู้จัดการฝ่าย")) {out.print("SELECTED");}%>>ผู้จัดการฝ่าย
		<OPTION VALUE="ลูกจ้างทั่วไป"  <%if (position.equals("ลูกจ้างทั่วไป")) {out.print("SELECTED");}%>>ลูกจ้างทั่วไป
		</SELECT></TD>
</TR>
<!-- 
<TR>
	<TD bgcolor="#FFFFFF" width="140">Level : </TD>
	<TD bgcolor="#F1F0FF" ><INPUT TYPE="text" NAME="level" size="10" VALUE=""></TD>
</TR>
 -->
<TR bgcolor="#F1F0FF" valign="center" align="center">
	<TD colspan="2">
	<pre> <INPUT TYPE="submit" value="ตกลง"> <INPUT TYPE="reset" value="ข้อมูลก่อนแก้ไข"></pre>
 	</TD>
</TR>
</TABLE>
</FORM>

	 <%}else{%>
		 <P><P><BR>
	 <b><div align="center">รหัสผ่านผิดพลาดกรุณา <A HREF="editinfo.jsp">ย้อนกลับไป 1 หน้า</A> เพื่อตรวจสอบรหัสผ่านอีกครั้ง </div></b>
	 
	 <%}
		 rs.close();
		 stmt.close();
		 con.close();

	 } catch(Exception e) 
      {
	    	  e.printStackTrace();
	   }
%></CENTER></TD>
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
