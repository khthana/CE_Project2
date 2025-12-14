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
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPnews.jsp");%>

<%id=request.getParameter("id"); %>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<% sb.delete(0,sb.length());%>
<%rset= sessionBeanHP.setRset("select","SELECT id,date_post,headnews,author,detail FROM  home_webnews  WHERE id="+id+" ORDER BY 1 DESC");   %>
<%rset.next();
      date_post=rset.getString(2);
      headnews=rset.getString(3);
      auther=rset.getString(4);
      sb.append(rset.getString(5));
      detail=rset.getString(5);
      %>
<% sb2.delete(0,sb2.length());%>
<% for(int i=0;i<sb.length();i++)
	{  if(sb.charAt(i)=='\n')
		 sb2.append("<BR>");
	    else
		 sb2.append(sb.charAt(i));
	}
%>
<html>
<head>
<title><%=headnews%></title>
</head>

<body bgcolor="#FFFFFF">
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
</div>
<table width="85%" border="0" align="center">
  <tr> 
    <td height="26" width="15%" bgcolor="#CCFFFF"><font face="MS Sans Serif" size="2">ข่าวอสังหาริมทรัพย์ 
      </font></td>
    <td height="26" width="50%" bgcolor="#FFCCCC"><font face="MS Sans Serif" size="2"><%=headnews%> 
      </font></td>
    <td height="26" width="35%" bgcolor="#CCCCCC"><font face="MS Sans Serif" size="2">ประจำวันที่ 
      :<%=date_post%> </font></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td colspan="3"> 
      <blockquote> 
        <p><font face="MS Sans Serif" size="1"><%=sb2%></font></p>
      </blockquote>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#CCFFFF"> 
      <div align="center"><font face="MS Sans Serif" size="2">ที่มา:</font></div>
    </td>
    <td bgcolor="#FFCCCC" colspan="2"><font face="MS Sans Serif" size="2"><%=auther%></font></td>
  </tr>
</table>
<div align="center"><a href="<%=webstatus.getPrevious()%>"><img src="/www/picture/logo/back1.gif" width="104" height="82" border="0"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>
