<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page contentType="text/html; charset=Windows-874" %>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPhome.jsp");%>



<%! ResultSet rset=null;
	String hid,pid,home_name,type,need,area,stage,bathroom,bedroom,status,project_name,owner,detail,contact,fullname;
	int home_id,project_id,price;
	StringBuffer sb = new StringBuffer();
	StringBuffer sb2 = new StringBuffer();
%>
<%hid=request.getParameter("Hid"); %>
<%pid=request.getParameter("Pid"); %>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%rset= sessionBeanHP.setRset("select","SELECT home_name,type,need,area,price,stage,bathroom,bedroom,home_id,project_id,status,detail,contact,owner FROM  home  WHERE home_id="+hid+" AND project_id="+pid+" ORDER BY home_id DESC"); %>
<%rset.next();
      home_name=rset.getString(1);
      type=rset.getString(2);
      need=rset.getString(3);
      area =rset.getString(4);
      price = rset.getInt(5);
      stage= rset.getString(6);
      bathroom=rset.getString(7);
      bedroom=rset.getString(8);
      home_id=rset.getInt(9);
      project_id=rset.getInt(10);
      status=rset.getString(11);
      detail=rset.getString(12);
      contact=rset.getString(13);
      owner=rset.getString(14);
%>
<%rset= sessionBeanHP.setRset("select","SELECT project_name,owner,project_id  FROM  home_project WHERE project_id="+pid+" ORDER BY project_id DESC"); %>
<%rset.next();
      project_name=rset.getString(1);
 %>
<html>
<head>
<title>บ้าน  <%=home_name%> </title>
</head>
<body bgcolor="#FFFFFF">
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
</div>
<table width="50%" border="0" align="center">
  <tr> 
    <td height="30" colspan="2" bgcolor="#9999FF">&nbsp;</td>
  </tr>
  <tr> 
    <td height="30" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">โครงการ </font></div>
    </td>
    <td height="30" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=project_name%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="30" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">เจ้าของ</font></div>
    </td>
    <td height="30" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=owner%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="30" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ชื่อบ้าน </font></div>
    </td>
    <td height="30" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=home_name%> 
        </font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ประเภท </font></div>
    </td>
    <td height="30" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"> <%=type%> </font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ต้องการ </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=need%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">พื้นที่ </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=area%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ราคา </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=price%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">สถานะบ้าน </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%if(status.equals("empty")){%>ว่าง<%}else if(status.equals("reserve")){%><font color="#FF3333"><b>ถูกจองแล้ว</b></font><%}%></font></div>
    </td>
  </tr>
  <%if(status.equals("reserve")){%> <%rset=sessionBeanHP.setRset("select","SELECT username FROM home_contract  WHERE home_id="+hid+" AND project_id="+pid);
	    if(rset.next()){
	    fullname=rset.getString(1);
	    rset=sessionBeanHP.setRset("select","SELECT first_name,last_name FROM home_user  WHERE username='"+fullname+"'");
	    rset.next();
	    fullname=rset.getString(1)+" "+rset.getString(2);
	    }
	%> 
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ผู้จอง </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=fullname%></font></div>
    </td>
  </tr>
  <%}
    %> 
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ชั้น </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=stage%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ห้องนอน </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=bedroom%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ห้องน้ำ </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=bathroom%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">รายละเอียดเพิ่มเติม</font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=detail%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="26" width="28%" bgcolor="#CCFFFF"> 
      <div align="right"><font face="MS Sans Serif" size="2">ติดต่อ </font></div>
    </td>
    <td height="26" width="72%" bgcolor="#FFCCCC"> 
      <div align="center"><font face="MS Sans Serif" size="1"><%=contact%></font></div>
    </td>
  </tr>
  <tr> 
    <td height="29" colspan="2" bgcolor="#6666FF"> 
      <form name="form1"  action="HPreservation.jsp" method="post">
        <div align="center"> 
          <input type="submit" name="Submit" value="More Detail">
          <input type="hidden" name="project_id" value="<%=project_id%>">
          <input type="hidden" name="home_id" value="<%=home_id%>">
        </div>
      </form>
    </td>
  </tr>
</table>
<div align="center"><a href="<%=webstatus.getPrevious()%>"><img src="/www/picture/logo/back1.gif" width="104" height="82" border="0" title="โชว์รายการทั้งหมด"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>
