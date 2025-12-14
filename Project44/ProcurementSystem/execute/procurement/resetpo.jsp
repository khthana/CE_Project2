<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date,java.util.*"%> <!-- import  เพื่อใช้ session -->
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
   
	Vector po_vector=(Vector)session.getAttribute("po_vector");
     
if (po_vector==null) {

out.println("<P>&nbsp;<P>&nbsp;<CENTER><B>ไม่มี TMP PO ที่จะลบ</B></CENTER>");

}else{
	try{
                 
              
				DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");

				    Iterator i1 =po_vector.iterator();
							while (i1.hasNext()){
								int pon=((Integer) i1.next()).intValue(); 
								    Statement stmt = con.createStatement();
									DatabaseMetaData dmd = con.getMetaData();


											String query="DELETE FROM PO WHERE PO#='"+pon+"'";
											stmt.executeUpdate(query);	
												stmt.close();
							}		
												
												}catch(java.sql.SQLException e)  {
															  System.out.println("SQLException:<br>");
															  System.out.println("Message:   " + e.getMessage() + "<br>");
															  System.out.println("SQLState:  " + e.getSQLState() + "<br>");
															  System.out.println("ErrorCode: " + e.getErrorCode() + "<br>");
															  e.printStackTrace();
																	} // catch

				session.removeAttribute("TMP_PoCart");
				session.removeAttribute("PoCart");
				session.removeAttribute("code_vector");
				session.removeAttribute("po_vector");
			//	response.sendRedirect("genpo.jsp");
			%>
						<B><CENTER><P>&nbsp;<P>&nbsp;<P>ยังไม่ได้สร้าง PO ที่ผานมา</CENTER>	</B>
			<%

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
