<%@ page contentType="text/html; charset=tis-620" language = "java"  import="java.sql.*" import="var.VarDB" pageEncoding="tis-620"%>
<jsp:useBean id="viewf" class="insert.add_fac" />
 	<jsp:setProperty name="viewf" property="fac" />
	<jsp:getProperty name="viewf" property="dele" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<style type="text/css" >
	BODY {
		font-size:13px; font-family:"Times New Roman", Times, serif;
	}
	A {
		text-decoration:none
	}
</style>
<script language="javascript">
function edit(num) {
	document.form1.fac.value=num;
	document.form1.apply.click();
}
</script>
</head>
<body>
<jsp:include page="popup.jsp" flush="false"></jsp:include>
<table width="702" border="0" >
  <tr>
    <td height="30" bgcolor="#99FF99">&#3627;&#3609;&#3656;&#3623;&#3618;&#3591;&#3634;&#3609; / &#3588;&#3603;&#3632; <a href="addfac.jsp">add</a></td>
  </tr>
  <tr>
    <td height="356" bgcolor="#CCFFCC"  valign="top">&nbsp;       
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
			out.print("<table width=\"455\" border=\"0\">" + "\n");
			out.print("<tr>" + "\n");
			out.print("<td width=\"402\"><div align=\"center\">หน่วยงาน / คณะ</div></td>" + "\n");
			out.print("</tr>" + "\n");
			while(rs.next()) { //http://161.246.6.47:808/project/test.jsp?textfield=asd&Submit=Submit
				out.print("<tr>" + "\n");
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				i = rs.getInt("FACID");
				out.print("<td width=\"402\"><div align=\"left\"><a onClick=\"edit("+i+")\">"+ i + ".    " + str +"</a></div></td>" + "\n"); 
				out.print("</tr>" + "\n");
			}
			con.close();
		}
		catch (SQLException ex) {
			out.println("not complete");
		}
		%>
</td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#CCFFCC">
	<form name="form1" method="post" action="editfac.jsp">
		<input name="fac" type="hidden" value="0">
        <div  style="{visibility:hidden;}">
          <input type="submit" name="apply" >
        </div>
	</form>    </td>
  </tr>
</table>   
</body>
</html>
