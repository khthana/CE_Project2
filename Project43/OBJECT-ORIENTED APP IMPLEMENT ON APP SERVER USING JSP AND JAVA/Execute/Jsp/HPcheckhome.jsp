<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=Windows-874" %>


<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session"/>
<jsp:setProperty name="webstatus" property="*"/>


<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean"  scope="session"/>
<jsp:setProperty name="sessionBeanHP" property="*"/>


<%! String username,password,status,action,fullname,project_id,home_id,dateString;
	int i=0;
	java.util.Date meetdate = new java.util.Date();
	%>
<%! ResultSet rset=null;%>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPindex.jsp");%>
<html>
<head>
<title>Home Project</title>
</head>

<body bgcolor="#FFFFFF">
<div align="center"><img src="/www/picture/logo/Home_Project.gif" width="554" height="120"><br>
</div>
<br>
<%username=sessionBeanHP.getUsername();%> <%rset=sessionBeanHP.setRset("select","SELECT first_name,last_name FROM home_user WHERE username='"+sessionBeanHP.getUsername()+"'");
      while(rset.next())
      {  fullname=rset.getString(1)+" "+rset.getString(2); }
%>
<table width="85%" border="0" align="center">
  <tr bgcolor="#009999"> 
    <td> 
      <table width="99%" border="1" align="center" bgcolor="#FFFFFF" height="99%">
        <tr bgcolor="#6666FF"> 
          <td> 
            <div align="center"><font face="MS Sans Serif" size="2">โครงการ</font></div>
          </td>
          <td> 
            <div align="center"><font face="MS Sans Serif" size="2">บ้าน</font></div>
          </td>
          <td> 
            <div align="center"><font face="MS Sans Serif" size="2">บุคคลที่ทำการจอง</font></div>
          </td>
          <td> 
            <div align="center"><font face="MS Sans Serif" size="2">วันทำสัญญา</font></div>
          </td>
          <td> 
            <div align="center"><font face="MS Sans Serif" size="2">Email</font></div>
          </td>
          <td> 
            <div align="center"><font face="MS Sans Serif" size="2">โทรศัพท์</font></div>
          </td>
        </tr>
        <%rset=sessionBeanHP.setRset("select","SELECT project_name,home_name,price,first_name,last_name,start_date,email,telephone FROM contract_detail WHERE owner='"+fullname+"'");%> 
        <% i=0;
	    while(rset.next()) 
	{%> <%meetdate=rset.getDate(6);
			dateString=meetdate.toLocaleString();
			dateString=dateString.substring(0,dateString.indexOf(','));
		%> 
        <tr bgcolor="#CCCCFF"> 
          <td height="24">
            <div align="center"><font face="MS Sans Serif" size="1"><%=rset.getString(1)%></font></div>
          </td>
          <td height="24"><font face="MS Sans Serif" size="1"><%=rset.getString(2)%></font></td>
          <td height="24"><font face="MS Sans Serif" size="1"><%=rset.getString(4)+" "+rset.getString(5)%></font></td>
          <td height="24">
            <div align="center"><font face="MS Sans Serif" size="1"><%=dateString%></font></div>
          </td>
          <td height="24">
            <div align="center"><font face="MS Sans Serif" size="1"><%=rset.getString(7)%></font></div>
          </td>
          <td height="24">
            <div align="center"><font face="MS Sans Serif" size="1"><%=rset.getString(8)%></font></div>
          </td>
        </tr>
        <%i++;%> <%} 
	%> <%if(i==0){%> 
        <tr bgcolor="#FF9999"> 
          <td height="15" colspan="6"> 
            <div align="center"><font face="MS Sans Serif" size="1"><b>ไม่พบข้อมูลที่ท่านต้องการ</b></font><font face="MS Sans Serif" size="1"></font></div>
          </td>
        </tr>
	<%} else{%>
		<tr bgcolor="#FF9999"> 
	        <td height="15" colspan="6"> 
	        <div align="center"><font face="MS Sans Serif" size="1"><a href="HPedithome.jsp">แก้ไขข้อมูลบ้าน</a></font></div>
	        </td>
	        </tr>
	    <%}
	%> 
      </table>
    </td>
  </tr>
</table>
<br>
<div align="center"><a href="HPindex.jsp"><br>
  </a> <a href="HPindex.jsp"><br>
  <img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>