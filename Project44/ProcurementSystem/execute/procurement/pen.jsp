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

 <TABLE>
<TR>
	<TD>
	<TABLE>
	<TR>
		<TD colspan="2"><IMG SRC="picture/pen_head.gif" WIDTH="260" HEIGHT="24" BORDER=0 ></TD>
	</TR>
	<TR>
		            <TD WIDTH="155"> <A HREF="pen.jsp?type=ปากกาลูกลื่น"> ปากกาลูกลื่น</A> 
                      <BR>
                      <A HREF="pen.jsp?type=ปากกาโรลเลอร์บอล"> ปากกาโรลเลอร์บอล</A> 
                      <BR>
                      <A HREF="pen.jsp?type=ปากกาหมึกเจล">ปากกาหมึกเจล</A>
			  <BR><A HREF="pen.jsp?type=ปากกาหัวเข็ม">ปากกาหัวเข็ม</A>
			  <BR><A HREF="pen.jsp?type=ปากกาเน้นข้อความ">ปากกาเน้นข้อความ</A>
			   <BR><A HREF="pen.jsp?type=ปากกามาร์คเกอร์">ปากกามาร์คเกอร์</A>
			  <BR><A HREF="pen.jsp?type=ปากกาไวท์บอร์ด">ปากกาไวท์บอร์ด</A>
			  <BR><A HREF="pen.jsp?type=ปากกาเขียนแผ่นใส">ปากกาเขียนแผ่นใส</A>
		</TD>
			        <TD width="101"> <A HREF="pen.jsp?type=ปากกาเพ้นท์">ปากกาเพ้นท์</A> 
                      <BR>
                      <A HREF="pen.jsp?type=น้ำยาลบคำผิด">น้ำยาลบคำผิด</A>
			  <BR><A HREF="pen.jsp?type=เทปลบคำผิด">เทปลบคำผิด</A>
			  <BR><A HREF="pen.jsp?type=ดินสอกด">ดินสอกด</A>
			  <BR><A HREF="pen.jsp?type=ยางลบ">ยางลบ</A>
			  <BR><A HREF="pen.jsp?type=ไส้ดินสอ">ไส้ดินสอ</A>
			  <BR><A HREF="pen.jsp?type=เครื่องเหลาดินสอ">เครื่องเหลาดินสอ</A>
			  </TD>
	</TR>
	</TABLE></TD>
	<TD width="200" align="center"><IMG SRC="picture/pen.gif" WIDTH="120" HEIGHT="205" BORDER=0></TD>
</TR>
</TABLE>
<%
	String  type=new String(request.getParameter("type"));
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT COUNT(*) FROM WRITING_PRODUCTS WHERE TYPE='"+type+"'";
		 ResultSet res=stmt.executeQuery(query);
		 res.next();
		 int num=res.getInt("COUNT(*)");
		 query="SELECT * FROM WRITING_PRODUCTS WHERE TYPE='"+type+"'";
         ResultSet rs=stmt.executeQuery(query);

		 	int i=1;
		while(i<=num){
		 rs.next();
		 String code=rs.getString("CODE");
         String color=rs.getString("COLOR");
		           if(color.equals("0")){color="ไม่ระบุสี";};
		 String brand=rs.getString("BRAND");
		 String  cat=rs.getString("CAT#");
		 String head_size=rs.getString("HEAD_SIZE");  
		          if (head_size==null){ head_size="-";}
		 String detail=rs.getString("DETAIL");
		          if (detail==null){ detail="-";}
		 int bl=i%2;
%>&nbsp;<P>
<TABLE valign="top" <%if(bl==1){%>border=1 bordercolor="#9E755F"<%}else{%>border="0"<%}%> cellpadding="3"cellspacing="0" width="500">
<TR>
	<TD>
	            <TABLE align="left" width="495" >
                  <TR>
		            <TD width="157"><B>รหัสสินค้า &nbsp;: &nbsp;</B><%=code%><BR>
				  <B>ตรา 	 &nbsp;: &nbsp;</B><%=brand%><BR>
				<B>ขนาดหัว &nbsp;: &nbsp;</B><%=head_size%>&nbsp; มม.<BR>
					<B>สีหมึก&nbsp;: &nbsp;</B><%=color%><BR>
			
</TD>
	                <TD width="124" valign="top"><B>รายละเอียด :</B><BR>
                      <%=detail%>
	</TD>
                    <TD width="198" valign="bottom" align="right"> 
                      <FORM METHOD=POST ACTION="servlet/AddToCartServlet">
	<INPUT TYPE="hidden" NAME="code" VALUE="<%=code%>">
<INPUT TYPE="hidden" NAME="type" VALUE="<%=type%>">
<INPUT TYPE="hidden" NAME="catNo" VALUE="1">
<INPUT TYPE="hidden" NAME="tablename" VALUE="WRITING_PRODUCTS">

                          จำนวน&nbsp; : &nbsp;
<INPUT TYPE="text" NAME="num" SIZE="3"> &nbsp;  แท่ง &nbsp;  <INPUT TYPE="image" SRC="picture/shoppingcart.gif">

		</FORM></TD>
	</TR>
	</TABLE></TD>
</TR>
</TABLE>

	 <%

		 i=i+1;}

		 res.close();
		 rs.close();
		 stmt.close();
		 con.close();

	 } catch(SQLException e) 
      {
	      while (e != null) 
         {
            out.println("SQLException:<br>");
  		      out.println("Message:   " + e.getMessage() + "<br>");
		      out.println("SQLState:  " + e.getSQLState() + "<br>");
		      out.println("ErrorCode: " + e.getErrorCode() + "<br>");
		      e = e.getNextException();
         }
	   }
%>
           </TD>
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
