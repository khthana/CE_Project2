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
			<TD colspan="2"><IMG SRC="picture/glue_head.gif" WIDTH="260" HEIGHT="24" BORDER=0 ALT="อุปกรณ์เพื่อการนำเสนอและการประชุม"></TD>
		</TR>
		<TR>
			<TD><A HREF="present.jsp?type=overhead">เครื่อง Overhead</A><BR>
      </TD>
		</TR>
		</TABLE></TD>
		<TD align="center"><IMG SRC="picture/present.gif" WIDTH="150" HEIGHT="256" BORDER=0></TD>
	</TR>
	</TABLE>
<%
	String  type=new String(request.getParameter("type"));
try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT COUNT(*) FROM OVERHEAD WHERE TYPE='"+type+"'";
		 ResultSet res=stmt.executeQuery(query);
		 res.next();
		 int num=res.getInt("COUNT(*)");
		 query="SELECT * FROM OVERHEAD WHERE TYPE='"+type+"'";
         ResultSet rs=stmt.executeQuery(query);

		 	int i=1;
		while(i<=num){
		 rs.next();
		 String code=rs.getString("CODE");
		 String brand=rs.getString("BRAND");
		 String  cat=rs.getString("CAT#");
		String desktop=rs.getString("DESKTOP_SIZE");  
		          if (desktop==null){ desktop="-";}
String elu=rs.getString("ELUMINATION");  
		          if (elu==null){ elu="-";}
				  String spare=rs.getString("SPARE_LIGHT");  
		          if (spare==null){ spare="-";}



		 String detail=rs.getString("DETAIL");
		          if (detail==null){ detail="-";}
		 int bl=i%2;
%>&nbsp;<P>
	  <table valign="top" <%if(bl==1){%>border=1 bordercolor="#9E755F"<%}else{%>border="0"<%}%> cellpadding="3"cellspacing="0" width="500">
        <tr> 
          <td> 
            <table align="left" width="495" >
              <tr> 
                <td width="157"><b>รหัสสินค้า &nbsp;: &nbsp;</b><%=code%><br>
                  <b>ตรา &nbsp;: &nbsp;</b><%=brand%><br>
                  <b>ขนาดตั้งโต๊ะ &nbsp;: &nbsp;</b><%=desktop%>&nbsp; <br>
				<b>ความสว่าง &nbsp;: &nbsp;</b><%=elu%>&nbsp;  ลูเมน<br>
				<b>ไฟสำรอง &nbsp;: &nbsp;</b><%= spare %>&nbsp; <br>
                </td>
                <td width="124" valign="top"><b>รายละเอียด :</b><br>
                  <%=detail%> </td>
                <td width="198" valign="bottom" align="right"> 
                  <form method=POST action="servlet/AddToCartServlet">
                    จำนวน&nbsp; : &nbsp; 
                    <input type="text" name="num" size="3">
                    &nbsp; &nbsp; 
                    <input type="image" src="picture/shoppingbox.gif" name="image">
                    <input type="hidden" name="code" value="<%=code%>">
					<input type="hidden" name="code" value="<%=code%>">
					<INPUT TYPE="hidden" NAME="type" VALUE="<%=type%>">
					<INPUT TYPE="hidden" NAME="catNo" VALUE="51">
					<INPUT TYPE="hidden" NAME="tablename" VALUE="OVERHEAD">

                  </form>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
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
