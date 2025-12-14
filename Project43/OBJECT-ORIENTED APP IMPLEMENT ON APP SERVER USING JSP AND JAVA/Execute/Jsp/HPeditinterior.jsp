<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page contentType="text/html; charset=Windows-874" %>
<jsp:useBean id="webstatus" class="pop_bean.webstatus" scope="session" />
<jsp:setProperty name="webstatus" property="*"/>
<jsp:useBean id="sessionBeanHP" class="pop_bean.NameBean" scope="session" />
<jsp:setProperty name="sessionBeanHP" property="*"/>
<%! ResultSet rset=null;
	String id="",date_post,headnews,author,detail;
	StringBuffer sb = new StringBuffer();
	StringBuffer sb2 = new StringBuffer();
	String newsid,where,query,action;
%>
<%if(sessionBeanHP.getCount()==0)
		{	sessionBeanHP.setStmt();
			sessionBeanHP.setCount(1);
		}
%>
<%webstatus.setPrevious(webstatus.getCurrent());%>
<%webstatus.setCurrent("HPeditinterior.jsp");%>

<html>
<head>
<title>หัวข้อการตกแต่งบ้านทั้งหมด(แก้ไขหัวข้อ)</title>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  <b><font face="CordiaUPC" size="7" color="#006699">แก้ไขหัวข้อการตกแต่งบ้าน</font></b><br>
</div>
 <%newsid=request.getParameter("newsid");
	action=request.getParameter("SubmitEdit");
	if(newsid==null || newsid.equals(""))	
	   newsid="-";
	if(action==null || action.equals(""))
	   action="none";
%>

<% if(sessionBeanHP.getUserStatus().equals("dba")  ||  sessionBeanHP.getUserStatus().equals("webmaster")  )  
{%>
      <% if(!newsid.equals("-"))      
         {%> <%  query="SELECT headnews,author,detail,date_post FROM  home_interior  WHERE id ="+newsid;
			   rset=sessionBeanHP.setRset("select",query);
			   rset.next();
			   headnews=rset.getString(1);
			   author=rset.getString(2);
			   detail=rset.getString(3);
			   date_post=rset.getString(4);
		%> 
		<form method="post" action="">
		<table width="85%" border="0" align="center">
		   <tr> 
			      <td height="26" width="15%" bgcolor="#CCFFFF"><font face="MS Sans Serif" size="2">หัวข้อการตกแต่งบ้าน
			      </font></td>
			      <td height="26" width="50%" bgcolor="#FFCCCC"><font face="MS Sans Serif" size="2">
		               <input type="text" name="headnews" maxlength="100" size="20" value="<%=headnews%>">
	                      </font></td>
			      <td height="26" width="35%" bgcolor="#CCCCCC"><font face="MS Sans Serif" size="2">วันที่ลงหัวข้อ
			      :<%=date_post%></font></td>
	           </tr>
		   <tr bgcolor="#CCFFCC"> 
			      <td colspan="3"> 
			        <p align="center"><font face="MS Sans Serif" size="1">
			         <textarea name="detail" cols=70 rows=15><%=detail%></textarea>
			          </font></p>
			      </td>
		   </tr>
		   <tr> 
			      <td bgcolor="#CCFFFF"> 
				<div align="center"><font face="MS Sans Serif" size="2">ที่มา:</font></div>
			      </td>
			      <td bgcolor="#FFCCCC" colspan="2"><font face="MS Sans Serif" size="2"> 
			          <input type="text" name="author" maxlength="100" size="20" value="<%=author%>">
				        </font>
				</td>
		   </tr>
		   <tr> 
			      <td bgcolor="#99CCFF" colspan="3"> 
			      <div align="center">
			          <input type="submit" name="SubmitEdit" value="Edit news">
				  <input type="hidden" name="edit_ID" value="<%=newsid%>">
		                   <input type="submit" name="SubmitEdit" value="Cancel">
			      </div>
			      </td>
		   </tr>
		</table>
  <br>
</form>
<%}
else{%> 
<%if(action.equals("Edit news"))
	{%>
	   <% headnews=request.getParameter("headnews");
		  author=request.getParameter("author");
		  detail=request.getParameter("detail");
		  newsid=request.getParameter("edit_ID");
	          query="UPDATE home_interior SET headnews='"+headnews+"',detail='"+detail+"' ,author='"+author+"'   WHERE id="+newsid; 
		   sessionBeanHP.setRset("insert",query);
	    %>
	<%}
%>
<form name="hotnews" method="post"  action="" >
		<table width="85%" border="0" align="center">
		  <tr> 
			    <td height="26" width="5%" bgcolor="#CCFFFF"> 
			      <div align="center"><input type=image name=submit src="/www/picture/edit.jpg" >
			      </div>
			    </td>
				 <td height="26" width="15%" bgcolor="#CCFFFF">
			        <div align="center"><font face="MS Sans Serif" size="2">ที่มา </font></div>
				      </td>
				 <td height="26" width="50%" bgcolor="#FFCCCC"> 
			      <div align="center"><font face="MS Sans Serif" size="2">หัวข้อข่าว </font></div>
			    </td>
			    <td height="26" width="35%" bgcolor="#CCCCCC"><font face="MS Sans Serif" size="2">วันที่ 
			     </font></td>
			      </tr>
			     <%sb.delete(0,sb.length());%> <%rset= sessionBeanHP.setRset("select","SELECT id,date_post,headnews,author,detail FROM  home_interior  ORDER BY 1 DESC");   %> 
			     <%while(rset.next())
			         {%> <%date_post=rset.getString(2);
		                         headnews=rset.getString(3);
		                         author=rset.getString(4);
					     %> 
					  <tr> 
				    <td height="26" width="5%" bgcolor="#CCFFFF">	<input type="radio" name="newsid"  value=" <%=rset.getString(1)%>"> [<%=rset.getString(1)%>]</td>
				    <td height="26" width="30%" bgcolor="#CCFFFF"><font face="MS Sans Serif" size="1"><%=author%></font></td>
				    <td height="26" width="50%" bgcolor="#FFCCCC"><font face="MS Sans Serif" size="1"> <a href="HPinterior.jsp?id=<%=rset.getInt(1)%>"> 
				      <%=headnews%></font></td></a>
				    <td height="26" width="35%" bgcolor="#CCCCCC"><font face="MS Sans Serif" size="1"><%=date_post%></font></td>
					 </tr>
				  <%}
				%> 
				 <tr bgcolor="#0000FF"> 
				 <td height="26" width="30%" colspan="2">&nbsp;</td>
			         <td height="26" width="50%">&nbsp;</td>
				 <td height="26" width="35%">&nbsp;</td>
				  </tr>
				</table>
				</form>
		    <%} 
	%>	
	
	<%} 
	else 
			{%><div align="center"> Access Denine !!! You don't permission to access this page please contact administrator , thank you <BR> 
		                  คุณไม่มีสิทธิในการเข้าใช้หน้าจอนี้   กรุณาติดต่อผู้ดูแลระบบ</div>
		<%}
%>

<div align="center"><a href="HPindex.jsp"><img src="/www/picture/logo/Home_t.gif" width="64" height="87" border="0"></a><br>
  <font face="MS Sans Serif" size="1">ขอขอบคุณ </font><br>
  <img src="/www/picture/thaihousinglogo.gif" width="488" height="71" align="absmiddle"> 
</div>
</body>
</html>
