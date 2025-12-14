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

			  </TD>
	</TR>
	</TABLE>
<%
			   }else{//login แล้ว

					 try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");

				 Statement stmt2= con.createStatement();
				String query2="SELECT * FROM PR WHERE (STATUS<'5') AND (EMP#='"+emp+"')" ;
				System.out.println(query2);		
				ResultSet tmp2= stmt2.executeQuery(query2);
		
				if(tmp2.next()){			//ถ้ามี PR ของคนนี้

                Statement stmt = con.createStatement();
				String query="SELECT * FROM PR WHERE (STATUS<'5') AND (EMP#='"+emp+"')" ;
				System.out.println(query);		
				ResultSet tmp = stmt.executeQuery(query) ;
				String qu=new String();
				double total_price=0;
				while(tmp.next()){  
						String prnum = tmp.getString("PR#");
						String  id_of_req=tmp.getString("EMP#");
						String  status=tmp.getString("STATUS");
						String date=tmp.getString("DATE1");
						String aname=new String();
						String asname=new String();
						String asn=new String();

						String wfnum=tmp.getString("WF#");
					%>
						<P>&nbsp;<P>&nbsp;
					    <TABLE cellpadding="3" cellspacing="0" border="1" bordercolor="#FFFFFF" width="95%" valign="middle" align="center">
					    <CAPTION align="left"><B><FONT  COLOR="#3F8640">PR เลขที่&nbsp;<%=prnum%>&nbsp;&nbsp;(
							<% 
								String status_word = new String();
								if (status.equals("0")){
											status_word="กำลังรอพิจารณา Spec ของสินค้า";
											qu="SELECT EMPLOYEE.NAME,EMPLOYEE.SNAME FROM EMPLOYEE,WORKFLOW WHERE (EMPLOYEE.EMP#=WORKFLOW.VIEWER) AND (WORKFLOW.WF#='"+wfnum+"')";
											Statement ss = con.createStatement();
											ResultSet rr=ss.executeQuery(qu);
											rr.next();
											aname=rr.getString("NAME");
											asname=rr.getString("SNAME");
											rr.close();
											ss.close();
											asn="จากคุณ"+aname+" "+asname;
								}
								if (status.equals("1")){
											status_word="กำลังรออนุมัติ";
											qu="SELECT EMPLOYEE.NAME,EMPLOYEE.SNAME FROM EMPLOYEE,WORKFLOW WHERE (EMPLOYEE.EMP#=WORKFLOW.APP1) AND (WORKFLOW.WF#='"+wfnum+"')";
											Statement ss = con.createStatement();
											ResultSet rr=ss.executeQuery(qu);
											rr.next();
											aname=rr.getString("NAME");
											asname=rr.getString("SNAME");
											rr.close();
											ss.close();
											asn="จากคุณ"+aname+" "+asname;
								} 
								if (status.equals("2")){
											status_word="กำลังรออนุมัติ";
											qu="SELECT EMPLOYEE.NAME,EMPLOYEE.SNAME FROM EMPLOYEE,WORKFLOW WHERE (EMPLOYEE.EMP#=WORKFLOW.APP2) AND (WORKFLOW.WF#='"+wfnum+"')";
											Statement ss = con.createStatement();
											ResultSet rr=ss.executeQuery(qu);
											rr.next();
											aname=rr.getString("NAME");
											asname=rr.getString("SNAME");
											rr.close();
											ss.close();
											asn="จากคุณ"+aname+" "+asname;
								}
								if (status.equals("3")){
											status_word="ได้รับอนุมัติแล้ว อยู่ระหว่างการออก PO";
											asn="";
								}
								if (status.equals("4")){
											status_word="ไม่อนุมัติ";
										   asn="";
								}
								
							%>
							<B><%=status_word%> &nbsp;<%=asn%></B>		
						)</FONT></B></CAPTION>
						<TR bgcolor="#3F8640">
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>NO.</B></FONT></DIV>
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>รหัสสินค้า</B></FONT></DIV>
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>ประเภทสินค้า</B></FONT></DIV>
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>ตรา</B></FONT></DIV>
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>จำนวน</B></FONT></DIV>
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>ราคา/หน่วย</B></FONT></DIV>
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>ราคารวม</B></FONT></DIV>
						<TD><DIV Align=center><FONT  COLOR="#E4F7E4"><B>ต้องการสินค้าในวันที่</B></FONT></DIV>
						 </TR>
					
					<%
					    
						String q ="SELECT * FROM PR_LINE,PR WHERE (PR.PR#='"+prnum+"') AND (PR_LINE.PR#=PR.PR#)  AND (PR.STATUS<= '4')";
						Statement stm= con.createStatement();
						ResultSet res=stm.executeQuery(q);
						while(res.next()){
							   int   prline=res.getInt("LINE#");
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
                               String required_date = new String();

							if (req_date == null ){
									required_date="ไม่ระบุวันที่";
								}
									 
						%>
                        <TR bgcolor="#E4F7E4">
							<TD><%=prline%>
							<TD><%=code%>
							<TD><%=type%>
							<TD><%=brand%>
							<TD><div align=right><%=qty%></div>
							<TD><div align=right><%=price%></div>
							<TD><%=qty*price%>
							<TD><%=required_date%>
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
							<TD>  วันที่ออก PR
							<TD> <%=date%>

							</TR>
						
						</TABLE>
		<%		}//while
				%>	</TD>
	</TR>
	</TABLE>
							<%

				 tmp.close();
				 stmt.close();
		       

				 }else{//if  ไม่มี pr
							%><P>&nbsp;<P>&nbsp;
								<CENTER><B>ไม่มี PR ของคุณ</B></CENTER>
									</TD>
	</TR>
	</TABLE>
							
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
  <TR><%@include file="bottommenu.html"%>
                   </TR>

  </TBODY> 
</TABLE>
</BODY></HTML>
