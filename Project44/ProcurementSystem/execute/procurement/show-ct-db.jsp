<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date"%> <!-- import  เพื่อใช้ session -->
<%@page session="true"%><!-- default -->
<%@include file="th-db.jsp"%>
<HTML>
<HEAD>

</HEAD>
<BODY>
<div align="center"><p>

<table  border="1" bordercolor="#9E755F"cellspacing="0" cellpadding="3">
    <tr border="0" bgcolor="9E755F">

      <td width="100"><b><font color="#FFF7BE" ><div align="center">ชื่อ workflow</div></font></b></td>
      <td width="80"><b><font  color="#FFF7BE" ><div align="center">Categories</div></font></b></td>
      <td width="100"><b><font color="#FFF7BE" ><div align="center">ผู้ตรวจสอบ</div></font></b></td>
      <td width="100"><b><font color="#FFF7BE" ><div align="center">ผู้อนุมัติคนที่ 1</div></font></b></td>
       <td width="100"><b><font color="#FFF7BE" ><div align="center">ผู้อนุมัติคนที่ 2</div></font></b></td> 
	   <td  width="150"><b><font color="#FFF7BE" ><div align="center">รายละเอียด</div></font></b></td>
	   <td></td>
	   <td></td>
    </tr>

<%try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT * FROM WF_TABLE";
		 ResultSet res=stmt.executeQuery(query);
		 res.next(); 
      	while(res.next()){
		 String wf_name=rs.getString("WF_NAME");
	//	 if (wf_name==null){ wf_name="-";}
		 String cat=rs.getString("CAT#");
//		 if (tb_name==null){ tb_name="-";}
		 String viewer=rs.getString("VIEWER");
		 if (viewer==null){viewer="-";}
		String  app1=rs.getString("APP1");
	//	 if (app1==null){app1="-";}
	String  app2=rs.getString("APP2");
		 if (app2==null){app2="-";}
	 String  adhoc=rs.getString("ADHOC");
		 if (adhoc==null){adhoc="-";} 
		 String  detail=rs.getString("DETAIL");
		 if (detail==null){detail="-";} 
%>

	 <tr border="0" bgcolor="#FFF7BE">
	  
      <td ><%=wf_name%></td>
      <td ><%=cat%></td>
      <td ><%=viewer%></td>
      <td ><%=app1%></td>
		 <td ><%=app2%></td>
      <td ><%=detail%></td>
       <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="ct-edit.jsp">
		  <INPUT TYPE="hidden" NAME="wf_name" VALUE="<%=wf_name%>">
		       <INPUT TYPE="submit" VALUE="Edit">
		 </FORM></td>
		  <td align="center" valign="center">
		 <FORM METHOD=POST ACTION="ct-delete.jsp">
		   <INPUT TYPE="hidden" NAME="wf_name" VALUE="<%=wf_name%>">
		       <INPUT TYPE="submit" VALUE="Delete">
		 </FORM></td>
    </tr>

	<%
		}
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
