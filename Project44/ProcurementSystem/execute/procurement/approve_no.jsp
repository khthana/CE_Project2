<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date, javax.mail.*, javax.mail.internet.*"%>
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
		  int  prnum=Integer.parseInt(request.getParameter("prnum"));
		  String  id_of_req = request.getParameter("id_of_req");
					
				try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
                Statement stmt = con.createStatement();  
				String query="SELECT EMPLOYEE.EMAIL FROM PR,EMPLOYEE WHERE (PR.EMP#=EMPLOYEE.EMP#)  AND (PR.EMP#='"+id_of_req+"')  AND (PR.PR#='"+prnum+"') ";
				System.out.println(query);
				
				ResultSet res=stmt.executeQuery(query);
				res.next();
				String email=res.getString("EMAIL");
					
		Properties props = new Properties();
		props.put("mail.smtp.host", "chaokhun.kmitl.ac.th");
		Session s = Session.getInstance(props,null);

		MimeMessage message = new MimeMessage(s);

		InternetAddress from = new InternetAddress("t3official@yahoo.com");
		message.setFrom(from);
		String toAddresses = email;
		message.addRecipients(Message.RecipientType.TO, toAddresses);
		String subject="PR was Rejected !!! ";
		message.setSubject(subject);
		String mess="Your PR was Rejected !!! ";
		message.setText(mess);

		Transport.send(message);
// อยากได้ว่าส่งเมลล์ ได้ไหมด้วย
       Statement stm = con.createStatement();
	   query="UPDATE PR SET STATUS='4' WHERE PR#='"+prnum+"'";
	
				stm.executeUpdate(query) ;
				res.close();
				stm.close();
				 stmt.close();
		         con.close();
		response.sendRedirect("approve.jsp");
	
	
		   }//try
			    catch (Exception e) {
					    e.printStackTrace();
					}		//catch	
		
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
