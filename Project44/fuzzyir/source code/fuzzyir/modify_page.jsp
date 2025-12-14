<html>
<head>
<title>Untitled Document</title>
<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=">
<Style>
a:link { Color:black; TEXT-DECORATION: none }
a:visited { Color:black; TEXT-DECORATION: none } 
a:hover { Color:black; TEXT-DECORATION: none }
a:active { TEXT-DECORATION: none }

</Style>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sortby(psortby) {
	sort.FieldSortBy.value = psortby;
	sort.submit();
}
//-->

<!--
		function update(temp){
		var mywindow;
		st="update.jsp?choose="+temp;
		mywindow=window.open(st,"displayWindow","width=800,height=500,resizable=no,location=no,menubar=no,scrollbars=no,alwaysRaised=yes");
		}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF">
<%
	String pnumber = new String();
	String pname = new String();
	String author = new String();
	String description = new String();

	pnumber = request.getParameter("pnumber");
	pname = request.getParameter("pname");
	author = request.getParameter("author");
	description = request.getParameter("description");
	
	
		String VarSortBy = new String();		
		VarSortBy = request.getParameter("FieldSortBy");
		if ((VarSortBy==null)||(VarSortBy.length()==0)){
			VarSortBy = "PAPER.PNumber";
		}
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr valign="bottom"> 
    <td height="110"> 
      <div align="center"><img src="pic/Modify%20Paper.jpg" width="397" height="55"></div>
    </td>
  </tr>
</table>
<p>&nbsp;</p><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#009999"> 
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="2%">&nbsp;</td>
                <td width="96%" bgcolor="99ffff">
					<form action="modify_page.jsp" method="get">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><font color="#000000" size="-1"><b>Librarian Search 
                        for Modify</b></font></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="22%"> 
                              <div align="right"><font size="-1">Paper Number 
                                :</font> </div>
                            </td>
                            <td width="78%"> 
				<%if((pnumber!=null)&&(pnumber.length()>0)){%>
					<input type="text" name="pnumber" value=<%="'"+pnumber+"'"%>>
				<%}else{%>
					<input type="text" name="pnumber">
				<%}%>
			    </td>
                          </tr>
                          <tr> 
                            <td width="22%"> 
                              <div align="right"><font size="-1">Title : </font></div>
                            </td>
                            <td width="78%"> 
                                <%if((pname!=null)&&(pname.length()>0)){%>
					<input type="text" name="pname" size="40" value=<%="'"+pname+"'"%>>
				<%}else{%>
					<input type="text" name="pname" size="40">
				<%}%>
			    </td>
                          </tr>
                          <tr> 
                            <td width="22%"> 
                              <div align="right"><font size="-1">Author : </font></div>
                            </td>
                            <td width="78%"> 
                                <%if((author!=null)&&(author.length()>0)){%>
					<input type="text" name="author" size="40" value=<%="'"+author+"'"%>>
				<%}else{%>
					<input type="text" name="author" size="40">
				<%}%>
			    </td>
                          </tr>
                          <tr> 
                            <td width="22%" valign="top"> 
                              <div align="right"><font size="-1">Abstract : </font></div>
                            </td>
                            <td width="78%"> 
                                <%if((description!=null)&&(description.length()>0)){%>
					<textarea name="description" cols="60" row="3"><%=description%></textarea>
				<%}else{%>
					<textarea name="description" cols="60" row="3"></textarea>
				<%}%>
			    </td>
                          </tr>
                          <tr>
                            <td width="22%">&nbsp;</td>
                            <td width="78%"> 
                              <div align="center">
                                <input type="submit" name="Submit" value="Submit">
                              </div>
                            </td>
                          </tr>
                          <tr> 
                            <td width="22%">&nbsp;</td>
                            <td width="78%">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table></form>
                </td>
                <td width="2%">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p>&nbsp;</p>


<%@ page language="java" errorPage="error.jsp"  import="java.sql.*,java.util.*"%> 
<%@ page contentType = "text/html;charset=MS874" %> 
<%

  // คลาสหลัก
  Connection dbconn;
   String msgout = "";
      // Set up database connection
      try 
      {     // ส่วนติดต่อกับฐาานข้อมูล โดยการใช้ JDBC-ODBC
	   String url = "jdbc:odbc:FUZZYIR";
	   Class.forName( "sun.jdbc.odbc.JdbcOdbcDriver" );
	    dbconn = DriverManager.getConnection(url,"Administrator","fuzzyir");
	    Statement statement = dbconn.createStatement();

	    String query = new String();
	    query = "Select * from PAPER,AUTHOR where ";
	    if(((pnumber!=null)&&(pnumber.length()>0))||((pname!=null)&&(pname.length()>0))||((description!=null)&&(description.length()>0))||((author!=null)&&(author.length()>0))){
		if((pnumber!=null)&&(pnumber.length()>0)){
			query = query+"PAPER.PNumber='"+pnumber+"' and ";
		}
		if((pname!=null)&&(pname.length()>0)){
			query = query+"PName Like '%"+pname+"%' and ";
		}
		if((description!=null)&&(description.length()>0)){
			query = query+"Description Like '%"+description+"%' and ";
		}
		if((author!=null)&&(author.length()>0)){
			query = query+"AuthorName Like '%"+author+"%' and ";
		}
	    }
	    query = query+"PAPER.PNumber=AUTHOR.PNumber Order by ";
	    query = query+VarSortBy+" asc";
	   //out.println("/"+query+"/");
	    ResultSet  resultset = statement.executeQuery(query);
	    int temp_table=0;
	    %>
		<table width="100%" border="0" cellspacing="2" cellpadding="2">
		<%if((pnumber!=null)&&(pname!=null)&&(description!=null)&&(author!=null)){%>
		<%while(resultset.next()){%>
			<%if(temp_table==0){
				temp_table=1;%>
				<tr bgcolor="#009999"><td width="5%"><div align="center"><font size="-1" color="#0000"><b><a HREF='javascript:sortby("PAPER.PNumber");'><u>Paper ID</u></a></b></font></div></td>
					<td width="40%"><div align="center"><font size="-1" color="#0000"><b><a HREF='javascript:sortby("PAPER.PName");'><u>Title</u></a></b></font></div></td>
					<td width="10%"><div align="center"><font size="-1" color="#0000"><b><a HREF='javascript:sortby("AUTHOR.AuthorName");'><u>Author</u></a></b></font></div></td>
					<td width="40%"><div align="center"><font size="-1" color="#0000"><b>Abstract</b></font></div></td>
					<td width="5%"><div align="center"><font size="-1" color="#0000"><b>pdf File</b></font></div></td>
				</tr>
			<%}%>
				<%if(temp_table==1){
					String tmp_num=new String();
					tmp_num = resultset.getString("PNumber");
				%>
				<tr bgcolor="#ccffff">
					<td width="5%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'> <%out.println(tmp_num);%></a></font></div></td>
					<td width="40%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("PName"));%></a></font></div></td>
					<td width="10%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("AuthorName"));%></a></font></div></td>
					<td width="40%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("Description"));%></a></font></div></td>
					<td width="5%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("Location"));%></a></font></div></td>
					
				</tr>
				<%}%>
				<%if(temp_table==2){
					String tmp_num = new String();
					tmp_num = resultset.getString("PNumber");
				%>
				<tr bgcolor="#99ccff">
					<td width="5%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(tmp_num);%></a></font></div></td>
					<td width="40%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("PName"));%></a></font></div></td>
					<td width="10%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("AuthorName"));%></a></font></div></td>
					<td width="40%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("Description"));%></a></font></div></td>
					<td width="5%"><div align="center"><font size="-2"><a  href='javascript:update("<%=tmp_num%>")'><%out.println(resultset.getString("Location"));%></a></font></div></td>
				</tr>
				<%}%>
				<%if(temp_table==1){temp_table=2;}else{temp_table=1;}%>
				
		<%}%>
		<%}%>
		</table>
	<FORM METHOD=POST Name="sort" ACTION="modify_page.jsp">
	<INPUT TYPE="hidden" name="FieldSortBy" value=<%="'"+VarSortBy+"'"%>>
	<INPUT TYPE="hidden" name="pnumber" value=<%="'"+pnumber+"'"%>>
	<INPUT TYPE="hidden" name="pname" value=<%="'"+pname+"'"%>>
	<INPUT TYPE="hidden" name="author" value=<%="'"+author+"'"%>>
	<INPUT TYPE="hidden" name="description" value=<%="'"+description+"'"%>>
	
	</FORM>
		
	<%dbconn.close();
	
 
      }
      catch ( ClassNotFoundException cnfex ) 
      {
            // ดักจับกรณีไม่สามารถเรียกใช้งานคลาสสำหรับติดต่อฐานข้อมูลได้
            cnfex.printStackTrace();
            msgout =  "Connection unsuccessful\n" + cnfex.toString() ;		
      }
      catch ( SQLException sqlex ) 
      {    // ดักจับกรณ๊คำสั่ง SQL ผิดพลาด
            sqlex.printStackTrace();
            msgout = "Connection unsuccessful\n" + sqlex.toString() ;
		   out.println(msgout);
      }
      catch ( Exception excp ) 
      {    // ดักจับกรณ๊ทั่วไป
            excp.printStackTrace();
            msgout = excp.toString() ;
      }
%>

</body>
</html>
