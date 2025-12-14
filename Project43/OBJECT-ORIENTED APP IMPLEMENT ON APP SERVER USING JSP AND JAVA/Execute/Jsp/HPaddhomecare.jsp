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
	int maxid=0;
	 java.util.Date date1 = new java.util.Date();
	 String dateTemp;
%>
<%id=request.getParameter("id"); %>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPaddhomecare.jsp");%>

<%headnews=request.getParameter("headnews");
       detail=request.getParameter("detail");
       auther=request.getParameter("auther");
	if(headnews==null||headnews.equals(""))
		headnews="-";
	if(detail==null || detail.equals(""))
	        detail="-";
	if(auther==null|| auther.equals(""))
		auther="-";
       rset=sessionBeanHP.setRset("select","SELECT MAX(id) FROM  home_care");
       rset.next();
       maxid=rset.getInt(1);
%>
<html>
<head>
<title>เพิ่มเติมหัวเรื่องดูแลบ้าน</title>
</head>
<body bgcolor="#FFFFFF">
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"> 
  </a><br>
  <font color="#00CCCC"><b><font face="CordiaUPC" size="7">เพิ่มหัวข้อการดูแลรักษาบ้าน 
  </font></b></font><br>
</div>
<%if(sessionBeanHP.getUserStatus().equals("login_fail")) {%> 
	<div align="center"> Access Denine !!! You don't permission to access this page please contact administrator , thank you <BR> 
                  คุณไม่มีสิทธิในการเข้าใช้หน้าจอนี้   กรุณาติดต่อผู้ดูแลระบบ</div>
		<%} 

	else {%>

 <%date1= new java.util.Date();%>
 <%dateTemp=date1.toString();%>
 <%dateTemp=dateTemp.substring(0,11)+dateTemp.substring(dateTemp.length()-4,dateTemp.length())+"<"+dateTemp.substring(11,19)+">";%>
<% if(headnews.equals("-")||detail.equals("-")||auther.equals("-")) 
	{%>		<form method="post" action="">
			<table width="85%" border="0" align="center">
			<tr> 
		        
      <td height="26" width="15%" bgcolor="#CCFFFF"><font face="MS Sans Serif" size="2">หัวข้อดูแลรักษาบ้าน 
        </font></td>
		        <td height="26" width="50%" bgcolor="#FFCCCC"><font face="MS Sans Serif" size="2"><input type="text" name="headnews" maxlength="100" size="20">
		        </font></td>
	                
      <td height="26" width="35%" bgcolor="#CCCCCC"><font face="MS Sans Serif" size="2">วันที่ลงหัวข้อ 
        :<%=dateTemp%></font></td>
			</tr>
		        <tr bgcolor="#CCFFCC"> 
                        <td colspan="3"> 

		        <p align="center"><font face="MS Sans Serif" size="1"><textarea name="detail" cols=70 rows=15></textarea>
		        </font></p>
		         </td>
			 </tr>
			  <tr> 
		          <td bgcolor="#CCFFFF"> 
		          <div align="center"><font face="MS Sans Serif" size="2">ที่มา:</font></div>
			  </td>
			  <td bgcolor="#FFCCCC" colspan="2"><font face="MS Sans Serif" size="2">
			  <input type="text" name="auther" maxlength="100" size="20">
			  </font></td>
			  </tr>
			  <tr> 
			 <td bgcolor="#99CCFF" colspan="3"> 
		         <div align="center"> ++ 
                         
          <input type="submit" name="Submit" value="Add Topic">
          +++ <input type="reset" name="Reset" value="Reset Form">
			     ++</div>
			   </td>
			  </tr>
			  </table>
			  <br>
			</form>
			<%} 
			else
			{%> 
			<%maxid++;%>
			<%sessionBeanHP.setRset("insert","INSERT INTO  home_care(id,headnews,detail,author,date_post) VALUES("+maxid+",'"+headnews+"','"+detail+"','"+auther+"','"+dateTemp+"')");%>	
			<table width="85%" border="0" align="center">
			<tr> 
		        
    <td height="26" width="15%" bgcolor="#CCFFFF"><font face="MS Sans Serif" size="2">หัวข้อดูแลรักษาบ้าน 
      </font></td>
		        <td height="26" width="50%" bgcolor="#FFCCCC"><font face="MS Sans Serif" size="2"><%=headnews%>
		        </font></td>
	                
    <td height="26" width="35%" bgcolor="#CCCCCC">&nbsp;</td>
			</tr>
		        <tr bgcolor="#CCFFCC"> 
                        <td colspan="3"> 

		        <p align="center"><font face="MS Sans Serif" size="1"><%=detail%></textarea>
		        </font></p>
		         </td>
			 </tr>
			  <tr> 
		          <td bgcolor="#CCFFFF"> 
		          <div align="center"><font face="MS Sans Serif" size="2">ที่มา:</font></div>
			  </td>
			  <td bgcolor="#FFCCCC" colspan="2"><font face="MS Sans Serif" size="2">
			  <%=auther%>
			  </font></td>
			  </tr>
			  <tr> 
			 <td bgcolor="#99CCFF" colspan="3"> 
		           </td>
			  </tr>
			  </table>
			<%=sessionBeanHP.getStatus()%>		
			<%}
				%>
<br>
<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
<%}
%>
</body>
</html>
