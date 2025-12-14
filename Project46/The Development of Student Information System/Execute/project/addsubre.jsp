<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import="java.sql.*" import ="sql_code.sqlCom" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean class="insert.add_sub" id="adds"></jsp:useBean>
<% 
	adds.setSubid(request.getParameter("subid"));
	adds.setTname(request.getParameter("tname"));
	adds.setEname(request.getParameter("ename"));
	adds.setFacid(request.getParameter("facid"));
	adds.setLevel(request.getParameter("level"));
	adds.setLecture(request.getParameter("lecture"));
	adds.setLab(request.getParameter("lab"));
	adds.setPsubid(request.getParameterValues("psubid"));
	adds.setNote11(request.getParameterValues("note11"));	adds.setNote12(request.getParameterValues("note12"));	adds.setNote13(request.getParameterValues("note13"));
	adds.setNote21(request.getParameterValues("note21"));adds.setNote22(request.getParameterValues("note22"));adds.setNote23(request.getParameterValues("note23"));
	adds.setS1(request.getParameterValues("s1"));	adds.setS2(request.getParameterValues("s2"));	adds.setS3(request.getParameterValues("s3"));
	adds.setM1(request.getParameterValues("m1"));adds.setM2(request.getParameterValues("m2"));adds.setM3(request.getParameterValues("m3"));	
	adds.setTerm1(request.getParameter("term1"));			adds.setTerm2(request.getParameter("term2"));			adds.setTerm3(request.getParameter("term3"));
	adds.setTday1_1(request.getParameter("tday1_1"));			adds.setTday1_2(request.getParameter("tday1_2"));			adds.setTday1_3(request.getParameter("tday1_3"));
	adds.setTday2_1(request.getParameter("tday2_1"));			adds.setTday2_2(request.getParameter("tday2_2"));			adds.setTday2_3(request.getParameter("tday2_3"));
	adds.setTday3_1(request.getParameter("tday3_1"));			adds.setTday3_2(request.getParameter("tday3_2"));			adds.setTday3_3(request.getParameter("tday3_3"));	
	adds.setTmon1_1(request.getParameter("tmon1_1"));		adds.setTmon1_2(request.getParameter("tmon1_2"));		adds.setTmon1_3(request.getParameter("tmon1_3"));
	adds.setTmon2_1(request.getParameter("tmon2_1"));		adds.setTmon2_2(request.getParameter("tmon2_2"));		adds.setTmon2_3(request.getParameter("tmon2_3"));	
	adds.setTmon3_1(request.getParameter("tmon3_1"));		adds.setTmon3_2(request.getParameter("tmon3_2"));		adds.setTmon3_3(request.getParameter("tmon3_3"));
	adds.setTstart1_1(request.getParameter("tstart1_1"));		adds.setTstart1_2(request.getParameter("tstart1_2"));		adds.setTstart1_3(request.getParameter("tstart1_3"));
	adds.setTstart2_1(request.getParameter("tstart2_1"));		adds.setTstart2_2(request.getParameter("tstart2_2"));		adds.setTstart2_3(request.getParameter("tstart2_3"));	
	adds.setTstart3_1(request.getParameter("tstart3_1"));		adds.setTstart3_2(request.getParameter("tstart3_2"));		adds.setTstart3_3(request.getParameter("tstart3_3"));
	adds.setTend1_1(request.getParameter("tend1_1"));		adds.setTend1_2(request.getParameter("tend1_2"));		adds.setTend1_3(request.getParameter("tend1_3"));		
	adds.setTend2_1(request.getParameter("tend2_1"));		adds.setTend2_2(request.getParameter("tend2_2"));		adds.setTend2_3(request.getParameter("tend2_3"));		
	adds.setTend3_1(request.getParameter("tend3_1"));		adds.setTend3_2(request.getParameter("tend3_2"));		adds.setTend3_3(request.getParameter("tend3_3"));				
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
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
  	<td colspan="2"> รายวิชา <a href="addsub.jsp">add</a> | <a href="editsub.jsp">edit</a> | <a href="delete.jsp">delete</a></td>
  </tr>  
  <tr valign="top">
  	<td colspan="2"><%= adds.getAdd() %></td>
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
