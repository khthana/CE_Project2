<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<link rel="stylesheet" href="css/popupmenu.css" type="text/css">
<style type="text/css" >
	BODY {
		font-size:13px; font-family:"Times New Roman", Times, serif;
	}
	A {text-decoration:none}
</style>
<script language="javascript" src="js/popupmenu.js">
</script>
</head>
<body leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0">
<table width="80%"  height ="40" border="0"  cellpadding="0" cellspacing="0"  >
	<tr valign="top">
		<td  colspan="7"   align="right" valign="top">ผู้ใช้งานในระบบ : <%=session.getAttribute("name") %> | <a href="chpass.jsp" > change password </a> | <a href="auth.jsp" > logout </a></td>
  </tr>
	<tr>
		<td width="100">
		<div class="main" id="mmenu1">
			<a href="javascript:void(0)"
				onMouseOver="showmenu(menu1)";
				onMouseOut="timeout=setTimeout('hidemenu(menu1)',100)">บันทึกข้อมูล
			</a><br>
		</div>
			<div class="menu" id="menu1">
			<a href="viewfac.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu1)',100)">ข้อมูลคณะ
			</a><br>
			<a href="adddep.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu1)',100)">ข้อมูลภาควิชา
			</a><br>
			<a href="addsub.jsp"
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu1)',100)">ข้อมูลรายวิชา
			</a><br>
			<a href="addcur.jsp"
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu1)',100)">ข้อมูลหลักสูตร
			</a><br>
			<a href="addtea.jsp"
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu1)',100)">ข้อมูลอาจารย์
			</a>			
	  		</div>
	  </td>
	  <td width="100">
		<div class="main" id="mmenu2">
			<a href="javascript:void(0)"
				onMouseOver="showmenu(menu2)";
				onMouseOut="timeout=setTimeout('hidemenu(menu2)',100)">นักศึกษา
			</a><br>
		</div>
			<div class="menu" id="menu2">
			<a href="addstd.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu2)',100)">ข้อมูลนักศึกษา
			</a>
			</div>
	  </td>
	  <td width="100">
		<div class="main" id="mmenu3">
			<a href="javascript:void(0)"
				onMouseOver="showmenu(menu3)";
				onMouseOut="timeout=setTimeout('hidemenu(menu3)',100)">การลงทะเบียน
			</a><br>
		</div>
			<div class="menu" id="menu3">
			<a href="regisa.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu3)',100)">ลงทะเบียนเรียน
			</a><br>
			<a href="addrega.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu3)',100)">เพิ่มวิชาเรียน
			</a><br>
			<a href="changerega.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu3)',100)">การเปลี่ยนวิชาเรียน
			</a><br>
			<a href="withdrawrega.jsp" 
				onMouseOver="showmenuconfirm()";
				onMouseOut="timeout=setTimeout('hidemenu(menu3)',100)">การถอนวิชาเรียน
			</a>			
			</div>	
	  </td>
	  <td width="80">&nbsp;</td>
	  <td width="80">&nbsp;</td>
	  <td>&nbsp;</td>
	  <td width="5%">&nbsp;</td>
	</tr>
</table>
</body>
</html>
