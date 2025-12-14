<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page contentType="text/html; charset=Windows-874" %>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>
<%! ResultSet rset=null;
	String id="",date_post,headnews,auther,detail;
	StringBuffer sb = new StringBuffer();
	StringBuffer sb2 = new StringBuffer();
%>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPallinterior.jsp");%>

<html>
<head>
<title>หัวข้อการตกแต่งบ้านทั้งหมด</title>
</head>

<body bgcolor="#FFFFFF">
<%--   
	     C-<%=webstatus.getCurrent()%><br>
	     P-<%=webstatus.getPrevious()%><br>
--%>

<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
</div>
<table width="85%" border="0" align="center">
  <tr> 
    <td height="26" width="15%" bgcolor="#CCFFFF"> 
      <div align="center"><font face="MS Sans Serif" size="1">ที่มา </font></div>
    </td>
    <td height="26" width="50%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="2">หัวข้อการตกแต่งบ้าน</font></div>
    </td>
    <td height="26" width="35%" bgcolor="#CCCCCC"><font face="MS Sans Serif" size="2">วันที่ 
      </font></td>
  </tr>
  <% sb.delete(0,sb.length());%> <%rset= sessionBeanHP.setRset("select","SELECT id,date_post,headnews,author,detail FROM  home_interior  ORDER BY 1 DESC");   %> 
  <%while(rset.next())
         {%> <%date_post=rset.getString(2);
                          headnews=rset.getString(3);
                          auther=rset.getString(4);
		     %> 
  <tr> 
    <td height="26" width="15%" bgcolor="#CCFFFF"><font face="MS Sans Serif" size="1"><%=auther%></font></td>
    <td height="26" width="50%" bgcolor="#FFCCCC"><font face="MS Sans Serif" size="1">
				<a href="HPinterior.jsp?id=<%=rset.getInt(1)%>">
						<%=headnews%></font></td></a>
    <td height="26" width="35%" bgcolor="#CCCCCC"><font face="MS Sans Serif" size="1"><%=date_post%></font></td>
  </tr>
  <%}
%> 
  <tr bgcolor="#0000FF"> 
    <td height="26" width="15%">&nbsp;</td>
    <td height="26" width="50%">&nbsp;</td>
    <td height="26" width="35%">&nbsp;</td>
  </tr>
</table>
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>
