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
String emp = (String) session.getAttribute("emp");
String passwd = (String) session.getAttribute("passwd");
String dept = (String) session.getAttribute("dept");
String name =(String) session.getAttribute("name");
String sname=(String) session.getAttribute("sname");
String level=(String) session.getAttribute("level");


	if ((emp==null) && (passwd==null)){
	 // call protected page
	 %> 

	 <P>&nbsp;<P>&nbsp;<CENTER><B>ยังไม่ได้ Login กรุณา  Login ก่อนเข้าระบบ</B></CENTER>
	
	 <%
	}else{//login แล้ว
                   int lvl =Integer.parseInt(level);
       if ( dept.equals("จัดซื้อ") && (lvl>1)){
              
	  ItemVector itemVec = (ItemVector) session.getAttribute("item_vector");
			  if (itemVec==null)
		   {
				itemVec=new ItemVector();
		   }
		TMP_PO_collection TMP_PoCart = (TMP_PO_collection)session.getAttribute("TMP_PoCart");
		   if ( TMP_PoCart == null) {

			         TMP_PoCart = new TMP_PO_collection();
					 System.out.println("Create new");
		   
		try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "sys", "maimee");

		Statement stmt2= con.createStatement();
		String query2="SELECT * FROM PR WHERE (STATUS='3')";
		System.out.println(query2);		
		ResultSet tmp2= stmt2.executeQuery(query2);
			if(tmp2.next()){ // ้มี PR ที่ต้องการจะออก PO
					Statement stmt1 = con.createStatement();
					query2="SELECT * FROM PR_LINE,PR WHERE (PR.STATUS='3') AND (PR.PR#=PR_LINE.PR#) ORDER BY PR_LINE.PRD#";
						System.out.println(query2);	
					ResultSet res1=stmt1.executeQuery(query2);
						int ii =0;
					while (res1.next()){ 
					            String tablename=res1.getString("TABLE_NAME");
								String code=res1.getString("PRD#");
								int  prline=res1.getInt("LINE#");
							    int prnum= res1.getInt("PR#");
							   double  price=res1.getDouble("PRICE");
							    int  qty=res1.getInt("QTY");
							   String  req_date=res1.getString("REQ_DATE");
						

							
							Statement stmt = con.createStatement();
							query2="SELECT TYPE,BRAND,DETAIL,CAT# FROM "+tablename+" WHERE CODE='"+code+"'";
		//					System.out.println(query2);	
							ResultSet res=stmt.executeQuery(query2);
							res.next(); 
							String brand=res.getString("BRAND");
						//	System.out.println(brand);	
						        String type=res.getString("TYPE");
						//		System.out.println(type);	
								String cat=res.getString("CAT#");
						//		System.out.println(cat);	
									//สร้าง PO COLECTION
									Collection tmpPoItemCollection = TMP_PoCart.getTmp_Po_vector();
									Iterator it = tmpPoItemCollection.iterator();

											boolean exist = false;

										while (it.hasNext() && (!exist)){
												TMP_PO  poitem= (TMP_PO) it.next();
												if (code.equals(poitem.getItemID())) {
													poitem.incrementNumItems(qty);
													exist = true;
												}
											}//while

								 TMP_PO tmppoItem = new TMP_PO(code, type,cat,qty,brand,price,prnum,prline,tablename);									
								    Item item = new Item(code,prnum,prline,0,0);
									System.out.println(code+"  "+prnum+"  "+prline);
									itemVec.add(item);
									


									// ใส่ ItemOrder เข้าไปใน ShoppingCart
									if (!exist) {
													TMP_PoCart.add(tmppoItem);
									}
									// ใส่ ShoppingCart ลงใน Session
							res.close();
							stmt.close();
							ii+=1;
					}//while
					session.setAttribute("TMP_PoCart",TMP_PoCart);	
					session.setAttribute("item_vector",itemVec);
					res1.close();
					stmt1.close();
											%>
						<P>&nbsp;<P>&nbsp;
					    <TABLE cellpadding="3" cellspacing="0" border="1" bordercolor="#FFFFFF" width="95%" valign="middle" align="center">
					    	<TR bgcolor="#3F8640">
						<TD><FONT  COLOR="#E4F7E4"><B>เลือก</B></FONT>
						<!-- <TD><FONT  COLOR="#E4F7E4"><B>PR เลขที่</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>แถว</B></FONT> -->
						<TD><FONT  COLOR="#E4F7E4"><B>รหัส</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ประเภท</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ตรา</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ราคา/หน่วย</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>จำนวน</B></FONT>
						<!-- <TD><FONT  COLOR="#E4F7E4"><B>วันที่ต้องการ</B></FONT> -->
						 </TR>
											<FORM METHOD=POST ACTION="showvendor.jsp">
											
											
											<%	   Collection tmpPoItemCollection = TMP_PoCart.getTmp_Po_vector();
														Iterator it = tmpPoItemCollection.iterator();
												int x=0;
												while (it.hasNext()){
														TMP_PO  poitem= (TMP_PO) it.next();

														%>
															<TR bgcolor="#E4F7E4">
																	<TD><INPUT TYPE="radio" NAME="check" VALUE="<%=x%>" <%if (x==0){out.print("CHECKED");}%>>
																
																	<TD><%=poitem.getItemID()%><INPUT TYPE="hidden" NAME="code<%=x%>" VALUE="<%=poitem.getItemID()%>">
																	<TD><%=poitem.getType()%><INPUT TYPE="hidden" NAME="type<%=x%>" VALUE="<%=poitem.getType()%>">
																	<TD><%=poitem.getBrand()%><INPUT TYPE="hidden" NAME="brand<%=x%>" VALUE="<%=poitem.getBrand()%>">
																	<TD><%=poitem.getPrice()%><INPUT TYPE="hidden" NAME="price<%=x%>" VALUE="<%=poitem.getPrice()%>">
																	<TD><%=poitem.getNumItems()%><INPUT TYPE="hidden" NAME="qty<%=x%>" VALUE="<%=poitem.getNumItems()%>">
																	<!-- <TD>		 -->											
															</TR>
														<%              x+=1;
												}//while
%>                                      </TABLE>
															<TABLE align="center">
															<TR>
																<TD><INPUT TYPE="hidden" NAME="all" VALUE="<%=x%>"><INPUT TYPE="submit" VALUE="หา Vendor"></FORM></TD>
																<TD><FORM METHOD=POST ACTION="acceptpo.jsp">
																			<INPUT TYPE="submit" VALUE=" ออก PO">
																</FORM> </TD>
																<TD><FORM METHOD=POST ACTION="resetpo.jsp">
																			<INPUT TYPE="submit" VALUE="เริ่มใหม่">
																</FORM></TD>
															</TR>
															</TABLE>
											
	<%			
				}else{//if  nno have pr to gen po

			 %>
			 <P>&nbsp;<P>&nbsp; <CENTER><B>ไม่มี PR ที่ยังไม่สร้าง PO</B></CENTER>
			 <%
			}//else

		tmp2.close();
		stmt2.close();
		con.close();
		
	} catch(SQLException e) 
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

		   }  else {
			      session.setAttribute("TMP_PoCart",TMP_PoCart);
				  session.setAttribute("item_vector",itemVec);
			   
			   //show from collection
					
						%>
						<P>&nbsp;<P>&nbsp;
					    <TABLE cellpadding="3" cellspacing="0" border="1" bordercolor="#FFFFFF" width="95%" valign="middle" align="center">
					    	<TR bgcolor="#3F8640">
						<TD><FONT  COLOR="#E4F7E4"><B>เลือก</B></FONT>
						
						<TD><FONT  COLOR="#E4F7E4"><B>รหัส</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ประเภท</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ตรา</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>ราคา/หน่วย</B></FONT>
						<TD><FONT  COLOR="#E4F7E4"><B>จำนวน</B></FONT>
						<!-- <TD><FONT  COLOR="#E4F7E4"><B>วันที่ต้องการ</B></FONT> -->
						 </TR>
											<FORM METHOD=POST ACTION="showvendor.jsp">
											
											
											<%	   Collection tmpPoItemCollection = TMP_PoCart.getTmp_Po_vector();
														Iterator it = tmpPoItemCollection.iterator();
												int x=0;
												while (it.hasNext()){
														TMP_PO  poitem= (TMP_PO) it.next();
														%>
															<TR bgcolor="#E4F7E4">
																	<TD><INPUT TYPE="radio" NAME="check" VALUE="<%=x%>" <%if (x==0){out.print("CHECKED");}%>>
																	
																	<TD><%=poitem.getItemID()%><INPUT TYPE="hidden" NAME="code<%=x%>" VALUE="<%=poitem.getItemID()%>">
																	<TD><%=poitem.getType()%><INPUT TYPE="hidden" NAME="type<%=x%>" VALUE="<%=poitem.getType()%>">
																	<TD><%=poitem.getBrand()%><INPUT TYPE="hidden" NAME="brand<%=x%>" VALUE="<%=poitem.getBrand()%>">
																	<TD><%=poitem.getPrice()%><INPUT TYPE="hidden" NAME="price<%=x%>" VALUE="<%=poitem.getPrice()%>">
																	<TD><%=poitem.getNumItems()%><INPUT TYPE="hidden" NAME="qty<%=x%>" VALUE="<%=poitem.getNumItems()%>">
																	<!-- <TD>		 -->											
															</TR>
														<%  x+=1;
												}//while
%>                                      </TABLE>
															<TABLE align="center" cellpadding="10" cellspacing="10">
															<TR>
																<TD><INPUT TYPE="hidden" NAME="all" VALUE="<%=x%>"><INPUT TYPE="submit" VALUE="เลือกผู้ขาย"></FORM></TD>
																<TD><FORM METHOD=POST ACTION="acceptpo.jsp">
																			<INPUT TYPE="submit" VALUE=" ออก PO">
																</FORM> </TD>
																<TD><FORM METHOD=POST ACTION="resetpo.jsp">
																			<INPUT TYPE="submit" VALUE="เริ่มใหม่">
																</FORM></TD>
															</TR>
															</TABLE>
											</FORM>
	<%				    

			   
		   }

	   }else{
	    %>
											<P>&nbsp;<P>&nbsp;<CENTER><B>คุณไม่สามารถออกใบ PO ได้</B></CENTER>
			<%									
	   }

	}//login
%> </TD>
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
