<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import="java.sql.*" import="var.VarDB" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");
%>
<jsp:useBean id="viewd" class="insert.add_dep" />
 	<jsp:setProperty name="viewd" property="dep" />
<% viewd.getView(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript">
function del() {
	document.form2.del.click();
}
</script>
</HEAD>
<BODY leftMargin=0 topMargin=0 off autocompleted marginwidth="0"  marginheight="0">
<table width="100%"  height="100%" border=0   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG">
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="40">
  	<td colspan="2"><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">ข้อมูลภาควิชา <a href="viewdep.jsp">view </a></td>
  </tr>  
  <tr valign="top"> 
  <td>
  <table width="100%" border="0">
  <form name="form1" method="post" action="editdepre.jsp">
  <input name="dep" type="hidden" value="<%=viewd.getDep()%>">
  <tr valign="top">
    <td colspan="3">ภาควิชา</td>
  </tr>
  <tr valign="top">
    <td colspan="3">ชื่อ(ท) <input name="tname" type="text" size="40" maxlength="50" value="<%=viewd.getTname()%>"></td>
  </tr>
  <tr valign="top">
    <td colspan="3">ชื่อ(อ) <input name="ename" type="text" size="40" maxlength="50"value="<%=viewd.getEname()%>"></td>
  </tr>
  <tr valign="top">
    <td colspan="3">สังกัดหน่วยงาน 
		<select name="fac">
		<%
		String str; int id;
		VarDB v = new VarDB();
		try {
			Class.forName(v.JDBCNAME).newInstance();
		}
		catch (Exception ex) {
			out.println("not complete");
		}
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "select  FACID,TNAME from faculty;";
			Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				id = rs.getInt("FACID");
				out.print("<option value=\""+ id+"\">"+str+"</option>" + "\n");
			}
		}
		catch (SQLException ex) {
			out.println("not complete");
		}
		%>
      </select>
	</td>
  </tr>
  <tr>
  <td width="46%" align="left"><input type="button" name="apply3" value="delete" onClick="del()">
    </td>
	<td width="54%" align="right"><input type="submit" name="apply" value="edit" align="right">
	  <input type="reset" name="apply2" value="clear" align="right"></td>
  </tr>
</form>
</table>   	
	</td> 
  </tr>
  <tr valign="bottom">
    <td height="10%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
<form name="form2" method="post" action="deldepre.jsp">
 <input type="hidden" name="dep" value="<%=viewd.getDep()%>">
 <div  style="{visibility:hidden;}"> 
 <input type="submit" name="del" >
 </div>
 </form>
</BODY>
</HTML>
