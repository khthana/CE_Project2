<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page contentType="text/html; charset=Windows-874" %>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPallhome.jsp");%>
<%! ResultSet rset=null;
	String home_name,type,need,area,stage,bathroom,bedroom,status,project_name,owner,detail;
	int home_id,project_id,price,pid,hid;
	StringBuffer sb = new StringBuffer();
	StringBuffer sb2 = new StringBuffer();
%>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>

<html>
<head>
<title> แสดงทุกโครงการ  </title>
</head>
<body bgcolor="#FFFFFF">

<div align="center">
  <p><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  </p>
  <table width="85%" border="0" height="89">
    <tr> 
      <td width="9%" bgcolor="#CCFFCC"> 
        <div align="center"><font face="MS Sans Serif" size="2">ประเภท</font></div>
      </td>
      <td width="18%" bgcolor="#CCFFCC"> 
        <div align="center"><font face="MS Sans Serif" size="2">ชื่อ</font></div>
      </td>
      <td width="7%" bgcolor="#CCFFCC"> 
        <div align="center"><font face="MS Sans Serif" size="2">ต้องการ</font></div>
      </td>
      <td width="13%" bgcolor="#CCFFCC"> 
        <div align="center"><font face="MS Sans Serif" size="2">เจ้าของโครงการ</font></div>
      </td>
      <td width="19%" bgcolor="#CCFFCC"> 
        <div align="center"><font face="MS Sans Serif" size="2">ราคา</font></div>
      </td>
      <td width="30%" bgcolor="#CCFFCC"> 
        <div align="center"><font face="MS Sans Serif" size="2">รายละเอียดเพิ่มเติม</font></div>
      </td>
    </tr>
<%rset= sessionBeanHP.setRset("select","SELECT home.type, home.home_name, home.home_id, home.need,home_project.project_name,home.owner,home_project.project_id,home.price,home.detail FROM home,home_project WHERE home.project_id=home_project.project_id  AND home.status='empty' ORDER BY home.home_id DESC "); %>
    
    <%while(rset.next()) 
	    {%> <%	type=rset.getString(1);
				home_name=rset.getString(2);
    				hid=rset.getInt(3);
	  		        need=rset.getString(4);
			        project_name=rset.getString(5);
			        owner=rset.getString(6);
			        pid=rset.getInt(7);
			        price=rset.getInt(8);
			        detail=rset.getString(9);
			%> 
    <tr> 
      <td width="9%" bgcolor="#CCCCFF" height="18"><font face="MS Sans Serif" size="1"><%=type%></font></td>
      <td width="18%" bgcolor="#CCCCFF" height="18"><font face="MS Sans Serif" size="1"><a href="HPhome.jsp?Hid=<%=hid%>&Pid=<%=pid%>"><%=home_name%></a></font></td>
      <td width="7%" bgcolor="#CCCCFF" height="18"><font face="MS Sans Serif" size="1"><%=need%></font></td>
      <td width="13%" bgcolor="#CCCCFF" height="18"><font face="MS Sans Serif" size="1"><%=owner%></font></td>
      <td width="19%" bgcolor="#CCCCFF" height="18"><font face="MS Sans Serif" size="1"><%=price%></font></td>
      <td width="30%" bgcolor="#CCCCFF" height="18"><font face="MS Sans Serif" size="1"><%=detail%></font></td>
    </tr>
    <%}
%> 
  <tr> 
      <td colspan="6" bgcolor="#666600" height="10">&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp; </p>
</div>
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>
