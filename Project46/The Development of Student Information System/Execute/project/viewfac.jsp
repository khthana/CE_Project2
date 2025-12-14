<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import= "var.VarDB" import="java.sql.*"%>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript">
function edit(num) {
	document.form1.fac.value=num;
	document.form1.apply.click();
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
  	<td colspan="2">ข้อมูลหน่วยงาน/คณะ <a href="addfac.jsp">add</a></td>
  </tr>
  <tr valign="top">
    <td  colspan="2"  valign="top">
	    <%
		int i; String str;
		VarDB v = new VarDB();
		try {
			Class.forName(v.JDBCNAME).newInstance();
		}
		catch (Exception ex) {
			out.println("not complete");
		}
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "select FACID,TNAME from faculty;"; //find max  facid
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			out.print("<table width=\"100%\" border=\"0\">" + "\n");
			out.print("<tr>" + "\n");
			out.print("<td width=\"100%\"><div align=\"center\">หน่วยงาน / คณะ</div></td>" + "\n");
			out.print("</tr>" + "\n");
			while(rs.next()) { //http://161.246.6.47:808/project/test.jsp?textfield=asd&Submit=Submit
				out.print("<tr>" + "\n");
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				i = rs.getInt("FACID");
				out.print("<td width=\"100%\"><div align=\"left\"><a onClick=\"edit("+i+")\">"+ i + ".    " + str +"</a></div></td>" + "\n"); 
				out.print("</tr>" + "\n");
			}
			out.print("</table>");
			con.close();
		}
		catch (SQLException ex) {
			out.println("not complete");
		}
		%>
	</td>
  </tr>
  <tr valign="bottom">
    <td height="5%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
<form name="form1" method="post" action="editfac.jsp">
		<input name="fac" type="hidden" value="0">
        <div  style="{visibility:hidden;}">
          <input type="submit" name="apply" >
        </div>
	</form>
</BODY>
</HTML>
