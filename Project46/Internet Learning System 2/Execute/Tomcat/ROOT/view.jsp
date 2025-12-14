<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK href="css/default.css" type=text/css rel=stylesheet>
</head>

<body background="images/bg.jpg">
<%
//step1	loading Driver class
			Class.forName("org.gjt.mm.mysql.Driver");
		//step2 connecting database
			Connection mycon=DriverManager.getConnection("jdbc:mysql://localhost/info?user=root");
		//step3 connecting database with sql
			Statement stmt=mycon.createStatement();
		    String submit=request.getParameter("submit"),name=" ",email=" ",comment=" ",ip=" ",sql=" ";
			int error=0, myresult=0;
			ResultSet result=null;
		// reply chicked 
		if(submit!=null)
		{	
			//get values from form
			name=request.getParameter("name");
			email=request.getParameter("email");
			comment=request.getParameter("comment");
			ip=request.getRemoteAddr();
		//checking values from form
		if(name.equals(""))
		{
			error=1;
			out.println("<center><font color=red>Name error!<font><center>");
		} 
		if(email.equals(""))
		{
			error=1;
			out.println("<center><font color=red>Email error!<font><center>");
		}
	   //if values are true then recorded in database
		if(error==0)
		{
			 sql= "INSERT INTO board_ans VALUES('','"+request.getParameter("id")+"','"+name+"','"+email+"','"+comment+"','"+ip+"',NOW())";
			 myresult=stmt.executeUpdate(sql);
			if(myresult!=0)
			{
			//reply complete that will add number of reply
			 sql= "UPDATE board_ques  SET ans=ans+1,lastpost=NOW(),lastname='"+name+"' WHERE id="+request.getParameter("id");
			stmt.executeUpdate(sql);
			//
			response.sendRedirect("view.jsp?id="+request.getParameter("id"));			
			return;
        	}
		    else
			  out.println("database error");
	    }
	}
//display topic
 sql="UPDATE board_ques SET view=view+1 WHERE id="+request.getParameter("id");
	stmt.executeUpdate(sql);
  sql="SELECT ip,topic,name,email,detail,DATE_FORMAT(datepost,'%e %b %Y, %T') AS datepost FROM board_ques WHERE id="+ request.getParameter("id");				
  result=stmt.executeQuery(sql);
  while(result.next())
  {
%>
	<table border="0" cellpadding="2" cellspacing="1" width="90%" align="center">
		<tr  bgcolor="#5971AF"><td>&nbsp;Post By</td><td><% 
	String topic=new String(result.getString("topic").getBytes("ISO8859_1"),"MS874");
			out.println(topic); %></td></tr>
		<tr  bgcolor="#E1E9FC">
		<td width="30%" valign="top">
			<font face="MS Serif" size="2">
			
			<b>&nbsp;Name</b>:<% 
				String name1=new String(result.getString("name").getBytes("ISO8859_1"),"MS874");
			out.println(name1);  %><br>
			<b>&nbsp;Email</b>:<%=result.getString("email")%><br>
			<b>&nbsp;IP</b>:<%=result.getString("ip")%><br>
			<b>&nbsp;Time</b>:<%=result.getString("datepost")%>
			<br>70:<br>
			</font>
		</td>
		<td width="70%">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr><td width="1">&nbsp;</td><td><br>
				<% String detail = new String(result.getString("detail").getBytes("ISO8859_1"),"MS874");
			out.println(detail);  %>
				</td></tr></table>
		</td>
		</tr>
<%
	}		
//all display		
	sql="SELECT ip,name,email,detail,DATE_FORMAT(datepost,'%e %b %Y, %T') AS datepost FROM  board_ans WHERE id_ques="+ request.getParameter("id");				
  result=stmt.executeQuery(sql);
     while(result.next())
     {
%>
		
		<tr bgcolor="#E1E9FC">
		<td>
		<font face="MS Serif" size="2">
			<b>&nbsp;Name</b>:<%
			String name1=new String(result.getString("name").getBytes("ISO8859_1"),"MS874");
			out.println(name1);  %><br>
			<b>&nbsp;Email</b>:<%=result.getString("email")%><br>
			<b>&nbsp;IP</b>:<%=result.getString("ip")%><br>
			<b>&nbsp;Time</b>:<%=result.getString("datepost")%>
			<br><br>
		</font>	
		</td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr><td width="1">&nbsp;</td><td><br>
				<% String detail = new String(result.getString("detail").getBytes("ISO8859_1"),"MS874");
			out.println(detail);  %>
				</td></tr></table>
		</td>
		</tr>
<%
	}
			result.close();
			stmt.close();
			mycon.close();
%>
	</table>
	<p>

	<form action="view.jsp?id=<%=request.getParameter("id")%>"  method="post">
		<table border="0" cellpadding="2" cellspacing="1" width="75%" align="center">
			<tr  bgcolor="#5971AF"><td colspan="2" align="center">New reply</td></tr>
			<tr bgcolor="#E1E9FC">
		      	<td align="center"><b>Nmae</b></td>
		      	<td><input type="text" name="name" size="35" value=""/></td></tr>
	        <tr bgcolor="#E1E9FC">
		       	<td align="center"><b>Email</b></td>
				<td><input type="text" name="email" size="35" value=""/></td></tr>
			<tr bgcolor="#E1E9FC">
				<td align="center"><b>Comment</b></td>
				<td><textarea cols="50" rows="8" name="comment"></textarea></td></tr>	
			<tr bgcolor="#E1E9FC">
		    	<td colspan="2" align="center"><input type="submit" name="submit" value="Reply">
				&nbsp;<input type="reset" name="reset" value="Cancel"></td></tr>
		</table>
	</form>	
	</p>
</body>
</html>
