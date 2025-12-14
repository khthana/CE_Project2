<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<HTML>
<HEAD>
<TITLE>  Show Db of user_table </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<LINK REL="stylesheet" HREF="procurement.css" TYPE="text/css">

</HEAD>
<BODY>
<div align="center"><p>

<table width="75%" border="1" bordercolor="#9E755F" frame="above" rules="rhs" cellspacing="0" cellpadding="3">
<tr border="0" bgcolor="9E755F">
      <td width="100"><b><font color="#FFF7BE" ><div align="center">รหัสพนักงาน</div></font></b></td>
      <td width="80"><b><font  color="#FFF7BE" ><div align="center">รหัสผ่าน</div></font></b></td>
      <td width="100"><b><font color="#FFF7BE" ><div align="center">ชื่อ</div></font></b></td>
      <td width="150"><b><font color="#FFF7BE" ><div align="center">นามสกุล</div></font></b></td>
      <td width="120"><b><font color="#FFF7BE" ><div align="center">อี-เมลล์</div></font></b></td>
	   <td width="100"><b><font color="#FFF7BE" ><div align="center">แผนก</div></font></b></td>
	   <td></td> <td></td>
    </tr>

<%try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT COUNT(*) FROM EMPLOYEE";
		 ResultSet res=stmt.executeQuery(query);
		 res.next();
		 int num=res.getInt("COUNT(*)");
		 query="SELECT * FROM EMPLOYEE ";
         ResultSet rs=stmt.executeQuery(query);
      	int i=1;
		while(i<=num){
		 rs.next();
		 String id=rs.getString("EMP#");
         String name=rs.getString("NAME");
		 if (name==null){ name="-";}
		 String sname=rs.getString("SNAME");
		 if (sname==null){ sname="-";}
		 String passwd=rs.getString("PASSWD");
		 String email=rs.getString("EMAIL");
		 if (email==null){ email="-";}
		 String dept=rs.getString("DEPT");
		 if (dept==null){ dept="-";}
%>

	 <tr border="0" bgcolor="#FFF7BE">
	  
      <td ><%=id%></td>
      <td ><%=passwd%></td>
      <td ><%=name%></td>
      <td ><%=sname%></td>
      <td ><%=email%></td>
	   <td ><%=dept%></td>
	   <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="edit.jsp?id=<%=id%>">
		       <INPUT TYPE="submit" VALUE="Edit">
		 </FORM></td>
		  <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="delete.jsp?id=<%=id%>">
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
