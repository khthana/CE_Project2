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
<P>&nbsp;<P>&nbsp;<form action="login_mon.jsp" method="post">		    
<TABLE align="CENTER" cellpadding="3" bordercolor="#66669A" border="1" width="250" cellspacing="0">
    <TR bgcolor="#66669A" height="24">
	<TD colspan="2" align="left"><FONT COLOR="#F1F0FF"><B>Login เข้าสู่ระบบ</B></FONT></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100"> รหัสสมาชิก</TD>
	<TD bgcolor="#F1F0FF" ><input type="text" name="username" size="15" maxlength="20"></TD>
</TR>
<TR>
	<TD  bgcolor="#FFFFFF" width="100">รหัสผ่าน</TD>
	<TD bgcolor="#F1F0FF" ><input type="password" name="passwd" size="15" maxlength="15"></TD>
</TR>
<TR>
<TD colspan="2" bgcolor="#F1F0FF" height="35" >
	<CENTER><INPUT TYPE="submit" value="ตกลง">&nbsp;&nbsp; <INPUT TYPE="reset" value="เริ่มใหม่"></CENTER>	
 </TD>
 </TR>	
</table>
<CENTER><a href="forgetpw.jsp">ลืมรหัสผ่าน</a> |  <a href="register.jsp">ลงทะเบียน</a></CENTER>
</form>
<%
			   }else{//login แล้ว

					 try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");

				 Statement stmt2= con.createStatement();
				String query2="SELECT * FROM PR WHERE (STAUS<'5') AND (EMP#='"+emp+"')" ;
				System.out.println(query2);		
				ResultSet tmp2= stmt2.executeQuery(query2);
		
				if(tmp2.next()){			//ถ้ามี PR ของคนนี้

                Statement stmt = con.createStatement();
				String query="SELECT * FROM PR WHERE (STAUS<'5') AND (EMP#='"+emp+"')" ;
				System.out.println(query);		
				ResultSet tmp = stmt.executeQuery(query) ;
				
				while(tmp.next()){  
						String prnum = tmp.getString("PR#");
						String  id_of_req=tmp.getString("EMP#");
						String  status=tmp.getString("STATUS");
						//String wfnum=tmp.getString("WF#");
					%>
						<P>&nbsp;<P>&nbsp;
					    <TABLE cellpadding="3" cellspacing="0" border="1" bordercolor="#FFFFFF" width="95%" valign="middle" align="center">
					    <CAPTION align="left"><B><FONT  COLOR="#3F8640">PR เลขที่&nbsp;<%=prnum%></FONT></B></CAPTION>
						<TR bgcolor="#3F8640">
						<TD><FONT  COLOR="#E4F7E4"><B>No.</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>รหัสสินค้า</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ประเภท</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ตรา</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ราคา/หน่วย</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>จำนวน</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>วันที่ต้องการ</B></FONT>
						 </TR>
					
					<%
					    
						String q ="SELECT * FROM PR_LINE,PR WHERE (PR.PR#='"+prnum+"') AND (PR_LINE.PR#=PR.PR#) AND (PR.STATUS< '3')";
						Statement stm= con.createStatement();
						ResultSet res=stm.executeQuery(q);
						while(res.next()){
							   String  prline=res.getString("LINE#");
							   String  code=res.getString("PRD#");
							   String  price=res.getString("PRICE");
							   String  qty=res.getString("QTY");
							   String  req_date=res.getString("REQ_DATE");
							   String  tablename=res.getString("TABLE_NAME");
							   String  date=res.getString("DATE");
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
							<TD><%=price%>
							<TD><%=qty%>
							<TD><%=req_date%>
						</TR>
					               
						<% rs.close();
							 st.close();
						}//while
						%>
									<TR>
							<TD>
							<TD>
							<TD>
							<TD>
							<TD>
							<TD>
							<TD> <%=date%>

							</TR>
						<TR>
							<TD colspan="7" align="center" valign="middle">
								  
							<% 
								String status_word = new String();
								if (status.equals("0")){
											status_word="Wait For Viewer Approve";
								}
								if (status.equals("1")){
											status_word="Wait For First Approver";
								} 
								if (status.equals("2")){
											status_word="Wait For Second Approver";
								}
								if (status.equals("3")){
											status_word="ได้รับอนุมัติแล้ว อยู่ระหว่างการออก PO";
								}
								if (status.equals("4")){
											status_word="Reject";
								}
								
							%>
																	<B><%=staus_word%></B>
							</TD>
						</TR>
						</TABLE>
		<%		}//while
				

				 tmp.close();
				 stmt.close();
		       

				 }else{//if
							%><P>&nbsp;<P>&nbsp;
								<CENTER><B>ไม่มี PR ที่งของคุณ</B></CENTER>
							
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
	
		
		}%>
	
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
