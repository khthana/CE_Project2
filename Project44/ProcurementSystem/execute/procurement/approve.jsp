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
								out.println("<P>&nbsp;<P>&nbsp;<P><b><div align=\"center\">คุณไม่สามารถ approve PR ได้</div></b>");  
					}else{ //level  พอ
					
				 try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");

				 Statement stmt2= con.createStatement();
				String query2="SELECT * FROM PR,WORKFLOW WHERE (PR.WF#=WORKFLOW.WF#) AND ((VIEWER='"+emp+"') OR (APP1='"+emp+"') OR (APP2='"+emp+"')) AND (STATUS<'3')" ;
				System.out.println(query2);		
				ResultSet tmp2= stmt2.executeQuery(query2);
		
				if(tmp2.next()){			//ถ้ามี PR	 ที่ต้อง request

                Statement stmt = con.createStatement();
				String query="SELECT * FROM PR,WORKFLOW WHERE (PR.WF#=WORKFLOW.WF#) AND ((VIEWER='"+emp+"') OR (APP1='"+emp+"') OR (APP2='"+emp+"')) AND (STATUS<'3')" ;
				System.out.println(query);		
				ResultSet tmp = stmt.executeQuery(query) ;
				double total_price=0;
				while(tmp.next()){  
						int prnum = tmp.getInt("PR#");
						String  id_of_req=tmp.getString("EMP#");
						String  status=tmp.getString("STATUS");
						int  wfnum=tmp.getInt("WF#");
						String  date=tmp.getString("DATE1");

									Statement s1 =con.createStatement();
									String  q1 = "SELECT * FROM EMPLOYEE,PR WHERE EMPLOYEE.EMP#=PR.EMP# AND PR.EMP#='"+id_of_req+"'";
									ResultSet r1 =s1.executeQuery(q1);
									r1.next(); 
									String n1=r1.getString("NAME");
									String sn1=r1.getString("SNAME");
									String d1=r1.getString("DEPT");
									r1.close();
									s1.close();
									Statement s2 = con.createStatement();
									String q2="SELECT * FROM DEPARTMENT WHERE DEPT_NAME='"+d1+"'";
									ResultSet r2=s2.executeQuery(q2);	
									r2.next();
									double remain2=r2.getDouble("REMAIN");
									r2.close();
									s2.close();
											

					%>
						<P>&nbsp;<P>&nbsp;
					    <TABLE cellpadding="3" cellspacing="0" border="1" bordercolor="#FFFFFF" width="98%" valign="middle" align="center">
					    <CAPTION align="left"><B><FONT  COLOR="#3F8640">PR เลขที่&nbsp;<%=prnum%>&nbsp; ( ขอโดยคุณ<%=n1%>&nbsp;<%=sn1%>&nbsp;แผนก<%=d1%>&nbsp;งบคงเหลือ&nbsp;<%=remain2%>&nbsp;บาท)</FONT></B></CAPTION>
						<TR bgcolor="#3F8640">
						<TD><FONT  COLOR="#E4F7E4" ><B>NO.</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" ><B>รหัส</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" width="100"><B>ประเภท</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" width="100"><B>ตรา</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" ><B>จำนวน</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" width="100"><B>ราคา/หน่วย</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" width="100"><B>ราคารวม</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" width="100"><B>วันที่ต้องการ</B></FONT>
						 </TR>
					
					<%
					    
						String q ="SELECT * FROM PR_LINE,PR WHERE (PR.PR#='"+prnum+"') AND (PR_LINE.PR#=PR.PR#) AND (PR.STATUS< '3')";
						System.out.println(q);
						Statement stm= con.createStatement();
						ResultSet res=stm.executeQuery(q);
						while(res.next()){
							   int  prline=res.getInt("LINE#");
							   String  code=res.getString("PRD#");
							   double  price=res.getDouble("PRICE");
							   int  qty=res.getInt("QTY");
							   String  req_date=res.getString("REQ_DATE");
							   String  tablename=res.getString("TABLE_NAME");
							   total_price=res.getDouble("TOTAL_PRICE");
				
							  Statement st=con.createStatement();
							  String qq="SELECT * FROM "+tablename+" WHERE CODE='"+code+"'";
							  ResultSet rs=st.executeQuery(qq);
							 
							  rs.next();
							  String brand=rs.getString("BRAND");
							  String type=rs.getString("TYPE");
									 
						%>
                        <TR bgcolor="#E4F7E4">
							<TD><%=prline%>
							<TD><%=code%>
							<TD><%=type%>
							<TD><%=brand%>
							<TD><%=qty%>
							<TD><%=price%>
							<TD><%=price*qty%>
							<TD><%if (req_date==null){out.println("ไม่ระบุวันที่");} else {out.println(req_date);}%>
						</TR>
					               
						<% rs.close();
							 st.close();
						}//while
						%><TR >
							<TD>
							<TD>
							<TD>
							<TD>
							<TD>
							<TD bgcolor="#3F8640"><FONT  COLOR="#E4F7E4"><B>รวม</B><FONT>
							<TD bgcolor="#3F8640"><FONT  COLOR="#E4F7E4"><B><%=total_price%></B></FONT>
							<TD> 

							</TR>
							<TR>
							<TD>
							<TD>
							<TD>
							<TD>
							<TD>
							<TD>
							<TD>วันที่ขอ PR
							<TD> <%=date%>

							</TR>
						<TR>
							<TD colspan="8" align="center" valign="middle">
							<TABLE>
							<TR>
							<TD>	<FORM METHOD=POST ACTION="approve_ok.jsp">
											<INPUT TYPE="submit" VALUE="Approve">
											<INPUT TYPE="hidden" NAME="prnum" VALUE="<%=prnum%>">
											<INPUT TYPE="hidden" NAME="status" VALUE="<%=status%>">
											<INPUT TYPE="hidden" NAME="wfnum" VALUE="<%=wfnum%>">
											
							</FORM>
							</TD>
							<TD>
							<FORM METHOD=POST ACTION="approve_no.jsp">
											<INPUT TYPE="submit" VALUE="Reject">				
											<INPUT TYPE="hidden" NAME="prnum" VALUE="<%=prnum%>">
											<INPUT TYPE="hidden" NAME="id_of_req" VALUE="<%=id_of_req%>">
							</FORM></TD>
							</TR>
							</TABLE>
							</TD>
						</TR>
						</TABLE>
		<%		}//while
				

				 tmp.close();
				 stmt.close();
		       

				 }else{//if
							%><P>&nbsp;<P>&nbsp;
								<CENTER><B>ไม่มี PR ที่ต้อง APPROVE</B></CENTER>
							
							<%
				 
				 }

				 tmp2.close();
				 stmt2.close();
				   con.close();
		 }//try
      catch(SQLException e) 
      {
	      while (e != null) 
         {
            out.println("SQLException:<br>");
  		      out.println("Message:   " + e.getMessage() + "<br>");
		      out.println("SQLState:  " + e.getSQLState() + "<br>");
		      out.println("ErrorCode: " + e.getErrorCode() + "<br>");
		      e = e.getNextException();
         }//while
	   }//catch
					
					}
			   }	   
		   %>	   
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
