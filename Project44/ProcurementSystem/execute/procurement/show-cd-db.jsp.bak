<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>


<HTML>
<HEAD>
<TITLE>  Show Db of DATA_KEEPING_PRODUCTS </TITLE>
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
	      <td width="80"><b><font  color="#FFF7BE" ><div align="center">ประเภท</div></font></b></td>   
      <td width="80"><b><font color="#FFF7BE" ><div align="center">ความจุ</div></font></b></td>
		<td width="80"><b><font color="#FFF7BE" ><div align="center">ความเร็วในการบันทึก</div></font></b></td>
	   <td width="120"><b><font color="#FFF7BE" ><div align="center">รายละเอียด</div></font></b></td>

	   <td></td> <td></td>
    </tr>

<%try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT COUNT(*) FROM DATA_KEEPING_PRODUCTS";
		 ResultSet res=stmt.executeQuery(query);
		 res.next();
		 int num=res.getInt("COUNT(*)");
		 query="SELECT * FROM DATA_KEEPING_PRODUCTS ORDER BY CODE";
         ResultSet rs=stmt.executeQuery(query);
      	int i=1;
		while(i<=num){
		 rs.next();
		 String code=rs.getString("CODE");
		 String type=rs.getString("TYPE");
		 String brand=rs.getString("BRAND");
		 String  cat=rs.getString("CAT#");
	
		 String  speed=rs.getString("SPEED");
		 if ((speed==null ) || speed.equals("null")){ speed="-";}
		 String data_size=rs.getString("DATA_SIZE");  
		 if ((data_size==null ) || speed.equals("null")){ data_size="-";}
		 String detail=rs.getString("DETAIL");
		  if ((detail==null ) || detail.equals("null")){ detail="-";}
%>

	 <tr border="0" bgcolor="#FFF7BE">
	  
      <td ><%=code%></td>
      <td ><%=brand%></td>
      <td ><%=cat%></td>
      <td ><%=data_size%></td>
	   <td ><%=speed%></td>
	   <td ><%=detail%></td>
	   <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="cd-edit.jsp?code=<%=code%>">
		       <INPUT TYPE="submit" VALUE="Edit">
		 </FORM></td>
		  <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="cd-delete.jsp?code=<%=code%>">
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
