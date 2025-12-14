<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<HTML>
<HEAD>
<TITLE>  Show Db of PACKING_PRODUCTS </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">

</HEAD>
<BODY>
<div align="center"><p>

<table width="75%" border="1" bordercolor="#9E755F" frame="above" rules="rhs" cellspacing="0" cellpadding="3">
   <!--  <tr>
			<td>
			<td>
			<td>
			<td>
			<td><div align="center"><a href="new.html" target="_blank"><b>ตั้งกระทู้ใหม่</b></a></div></td>
	</tr>
    --> <tr border="0" bgcolor="9E755F">

      <td width="100"><b><font color="#FFF7BE" ><div align="center">รหัสสินค้า</div></font></b></td>
      <td width="80"><b><font  color="#FFF7BE" ><div align="center">ยี่ห้อ</div></font></b></td>
	    <td width="100"><b><font color="#FFF7BE" ><div align="center">ชนิด</div></font></b></td>
      <td width="80"><b><font color="#FFF7BE" ><div align="center">สี</div></font></b></td>
      <td width="80"><b><font color="#FFF7BE" ><div align="center">ขนาด</div></font></b></td>
	  <td width="80"><b><font color="#FFF7BE" ><div align="center">แกน</div></font></b></td>
	   <td width="80"><b><font color="#FFF7BE" ><div align="center">หนา</div></font></b></td>
	   <td width="120"><b><font color="#FFF7BE" ><div align="center">รายละเอียด</div></font></b></td>

	   <td></td> <td></td>
    </tr>

<%try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT COUNT(*) FROM PACKING_PRODUCTS";
		 ResultSet res=stmt.executeQuery(query);
		 res.next();
		 int num=res.getInt("COUNT(*)");
		 query="SELECT * FROM PACKING_PRODUCTS ORDER BY CODE";
         ResultSet rs=stmt.executeQuery(query);
      	int i=1;
		while(i<=num){
		 rs.next();
		 String code=rs.getString("CODE");
         String color=rs.getString("COLOR");
		 String type=rs.getString("TYPE");
		 String brand=rs.getString("BRAND");
		 String  cat=rs.getString("CAT#");
		  String thick=rs.getString("THICK");
		  if (thick==null){ thick="-";}
		 String ring=rs.getString("RING");
		 if (ring==null){ ring="-";}
		 String tape_size=rs.getString("TAPE_SIZE");  
		 if (tape_size==null){ tape_size="-";}
		 String detail=rs.getString("DETAIL");
		 if (detail==null){ detail="-";}
%>

	 <tr border="0" bgcolor="#FFF7BE">
	  
      <td ><%=code%></td>
      <td ><%=brand%></td>
      <td ><%=type%></td>
      <td ><%=color%></td>
      <td ><%=tape_size%></td>
		<td ><%=ring%></td>
      <td ><%=thick%></td>
	   <td ><%=detail%></td>
	   <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="g-edit.jsp?code=<%=code%>">
		       <INPUT TYPE="submit" VALUE="Edit">
		 </FORM></td>
		  <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="g-delete.jsp?code=<%=code%>">
		       <INPUT TYPE="submit" VALUE="Delete">
		 </FORM></td>
    </tr>

	<%
		i =i+1;
	    }				
		 rs.close();
	   	 res.close();
	     con.close();
	     stmt.close();
            }
            catch (Exception E) {
                out.println("An Error Occured:");
                out.println(E);
			
            }

  %>
</table>
</p>
</div>



</BODY>
</HTML>
