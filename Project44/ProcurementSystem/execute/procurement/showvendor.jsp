<%@page contentType="text/html;  charset=windows-874" %>
<%@page import ="java.sql.*,java.lang.*,java.util.Date,java.util.*"%> <!-- import  เพื่อใช้ session -->
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
		
			
			 //String code = request.getParameter("code");
			        int  all= Integer.parseInt(request.getParameter("all"));
					int  a = 0;
					int  at = 0;
   				 String check= request.getParameter("check");
				 String code=new String(); 
				 String brand=new String();
				 String type = new String();
				 int qty = 0;
				 double price= 0;
				 TMP_PO_collection TMP_PoCart = (TMP_PO_collection)session.getAttribute("TMP_PoCart");

				 if (TMP_PoCart==null){
										out.println("<P>&nbsp;<P>&nbsp;<CENTER><B>ไม่มีสินค้าที่ต้องการค้นหา vedor</B></CENTER>");
				 }else{
		/*		boolean found=false;
					while ((a<=all)&&(!found)){
           */                 
					//		 check = request.getParameter("check"+a);
							//	if ( check.equals("")){
								            
								          //get code มาจาก collection
										  code = request.getParameter("code"+check);
										  // type
										   type = MS874ToUnicode(request.getParameter("type"+check));
										  //brand
										   brand= MS874ToUnicode(request.getParameter("brand"+check));
										   qty = Integer.parseInt(request.getParameter("qty"+check));
										   price = Double.parseDouble(request.getParameter("price"+check));

										//	found=true;
									//	 session.setAttribute("TMP_PoCart",TMP_PoCart);
						//		}
					
					      //      a+=1;
			//		}


			try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");
         Statement stmt = con.createStatement();
		 String query="SELECT * FROM VENDOR,VENDOR_VARIETY WHERE (VENDOR.VENDOR#=VENDOR_VARIETY.VENDOR#)  AND (PRD# ='"+code+"')";
		 ResultSet res=stmt.executeQuery(query);
						%>
							
						
						<P>&nbsp;<P>&nbsp;
					    <TABLE cellpadding="3" cellspacing="0" border="1" bordercolor="#FFFFFF" width="95%" valign="middle" align="center">
					    <CAPTION align="left"><B><FONT  COLOR="#3F8640"><%=code%>&nbsp;<%=type%>&nbsp;<%=brand%></FONT></B></CAPTION>
						<TR bgcolor="#3F8640">
						<TD><FONT  COLOR="#E4F7E4"><B>เลือก</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>รหัส</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ชื่อร้านค้า</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ที่อยู่</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>เบอร์โทรศัพท์</B></FONT>
						<TD><FONT  COLOR="#E4F7E4" valign="middle"><B>ราคา</B></FONT>
						</TR>
	<FORM METHOD=POST ACTION="servlet/GenPo">
	

						<%
							int ii=0;
	           while (res.next()){
						String vendor=res.getString("VENDOR#");
						String vname=res.getString("NAME");
						String addr=res.getString("ADDR");
						String tel=res.getString("PHONE");
						double vprice=res.getDouble("PRICE");
						%>
							
						<TR bgcolor="#E4F7E4">
							<TD><INPUT TYPE="radio" NAME="check" VALUE="<%=ii%>">
							<TD><%=vendor%><INPUT TYPE="hidden" NAME="vendor<%=ii%>" VALUE="<%=vendor%>">
							<TD><%=vname%>
							<TD><%=addr%>
							<TD><%=tel%>
							<TD><%=vprice%><INPUT TYPE="hidden" NAME="vprice<%=ii%>" VALUE="<%=vprice%>">
						</TR>
	<%
							ii+=1;
			   }//while
	   	 res.close();
	     con.close();
	     stmt.close();

		 %>
			 </TABLE>
			 <TABLE align="center">
			<TR>
				<TD><INPUT TYPE="hidden" NAME="at" VALUE="<%=check%>"><INPUT TYPE="hidden" NAME="code" VALUE="<%=code%>"><INPUT TYPE="submit" VALUE="เลือกผู้ขาย"></FORM></TD>
			</TR>
			</TABLE>
		 
		 <%
            }
            catch (Exception E) {
                out.println("An Error Occured:");
                out.println(E);
			
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
