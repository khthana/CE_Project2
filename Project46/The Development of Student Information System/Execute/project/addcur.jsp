<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import="java.sql.*" import="var.VarDB" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
 <jsp:useBean class="insert.add_cur" id="addc" scope="session"></jsp:useBean>
 <%	addc.initval(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript" src="js/chkin.js">
</script>
<script language="javascript">
function adde(page) {
	win3=window.open(page,'fullscreen','toolbar=0,location=0,directories=0,resizeable=0,width=640,height=480');
}
</script>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0" >
<table width="100%"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="40">
    <td colspan="2" ><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">ข้อมูลหลักสูตร</td>
  </tr>  
  <tr valign="top">
  	<td colspan="2"><form name="form1" method="post" action="addcurre.jsp">
		<table border="0" >
			<tr valign="top">
   			  <td colspan="2" width="400">ชื่อ(ท)  <input name="tname" type="text" size="50" maxlength="200"></td>
  			</tr>
  			<tr valign="top">
    			<td colspan="2" >ชื่อ(อ)  <input name="ename" type="text" size="50" maxlength="200"></td>
  			</tr>
  		  	<tr valign="top" >
  			  <td colspan="2" >สังกัด 
		<select name="depid">
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
			String SQL = "select  DEPID,TNAME from department;";
			Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				id = rs.getInt("DEPID");
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
			
  			<tr valign="top">
		 	  <td colspan="2">
			  		จำนวนปี  <input name="eduyear" type="text" onKeyPress="nochar()" value="0" size="3" maxlength="2">
  			      | จำนวนหน่วยกิจรวม <input name="totalcredit" type="text" onKeyPress="nochar()" value="0" size="3" maxlength="3">
			  </td>
		  	</tr>
  		  	<tr valign="top">
  			  <td rowspan="2">ประเภท<br>
			  	<label><input type="radio" name="kind" value="1" checked>ปกติ</label><br>
				<label><input type="radio" name="kind" value="2">สมทบ</label><br>
				<label><input type="radio" name="kind" value="3">เช้า</label><br>
				<label><input type="radio" name="kind" value="4">บ่าย</label><br>
				<label><input type="radio" name="kind" value="5">พิเศษ</label><br>
				<label><input type="radio" name="kind" value="6">เร่งรัด</label><br>
				<label><input type="radio" name="kind" value="6">นานาชาติ</label>
			  </td>			
  			  <td >ระดับ<br>
			  	<label><input type="radio" name="degree" value="1">ตรี</label><br>
				<label><input type="radio" name="degree" value="2" checked>โท</label><br>
				<label><input type="radio" name="degree" value="3">เอก</label><br>
				<label><input type="radio" name="degree" value="4">ป.บัณฑิต</label>
			  </td>
		  	</tr>
  		  	<tr valign="top">
  			  <td >
			  </td>
		 	</tr>
  			<tr valign="top" >
		  	  <td  colspan="2" align="right"><input type="button" name="Submit22" value="expense1" onClick="adde('addexp.jsp')"> | <input type="button" name="Submit22" value="expense2" onClick="adde('addexp2.jsp')"></td>
  			</tr>
   			<tr valign="top" align="right">
  			  <td colspan="2" ><input type="submit" name="Submit" value="add"> <input type="reset" name="Submit2" value="clear"></td>
		  	</tr>			
		</table>
  	</form>
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
</BODY>
</HTML>
