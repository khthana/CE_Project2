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
           <p>
&nbsp;<P>&nbsp;
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
<table  border="1" bordercolor="#9E755F"cellspacing="0" cellpadding="3">
    <tr border="0" bgcolor="9E755F">

      <td width="100"><b><font color="#FFF7BE" ><div align="center">ชื่อ workflow</div></font></b></td>
<!--       <td width="80"><b><font  color="#FFF7BE" ><div align="center">Categories</div></font></b></td> -->
      <td width="100"><b><font color="#FFF7BE" ><div align="center">ผู้ตรวจสอบ</div></font></b></td>
      <td width="100"><b><font color="#FFF7BE" ><div align="center">ผู้อนุมัติคนที่ 1</div></font></b></td>
       <td width="100"><b><font color="#FFF7BE" ><div align="center">ผู้อนุมัติคนที่ 2</div></font></b></td> 
	   <td  width="150"><b><font color="#FFF7BE" ><div align="center">รายละเอียด</div></font></b></td>
	   <td><b><font color="#FFF7BE" ><div align="center">แก้ไข</div></font></b></td>
	   <td><b><font color="#FFF7BE" ><div align="center">ลบ</div></font></b></td>
    </tr>

<%try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT * FROM WF_TABLE";
		 ResultSet rs=stmt.executeQuery(query);
		 //rs.next(); 
      	while(rs.next()){
		 String wf_name=rs.getString("WF_TYPE");
	//	 if (wf_name==null){ wf_name="-";}
//		 String cat=rs.getString("CAT#");
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
	  
      <td align="center" valign="center"><%=wf_name%></td>
<!--       <td ></td> -->
      <td align="center" valign="center"><%=viewer%></td>
      <td align="center" valign="center"><%=app1%></td>
		 <td align="center" valign="center"><%=app2%></td>
      <td align="center" valign="center"><%=detail%></td>
       <td align="center" valign="center">
		   <A HREF="wf-edit.jsp?wf_name=<%=wf_name%>">แก้ไข</A>
		</td>
		  <td align="center" valign="center">
		  <A HREF="wf-delete.jsp?wf_name=<%=wf_name%>">ลบ</A>
	</td>
    </tr>

	<%
		}
	   	 rs.close();
	     con.close();
	     stmt.close();
            }
            catch (Exception E) {
                out.println("An Error Occured:");
                out.println(E);
			
            }

					}
					}%>
</table>
</p>
</div>


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
