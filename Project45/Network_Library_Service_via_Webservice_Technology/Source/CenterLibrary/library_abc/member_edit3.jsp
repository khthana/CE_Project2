<%@ page contentType="text/html; charset=windows-874" language="java"  errorPage="" %>
<%@ page import="weblogic.jws.proxies.*"%>

<%

	GetMemberData_Impl proxy = new GetMemberData_Impl(); 
	GetMemberDataSoap soapProxy = proxy.getGetMemberDataSoap();
	

	String username=new String(request.getParameter("username").getBytes("iso8859-1"),"tis-620");
	String name=new String( request.getParameter("name").getBytes("iso8859-1"),"tis-620");
	String lastname=new String( request.getParameter("last_name").getBytes("iso8859-1"),"tis-620");
	String sex=new String( request.getParameter("sex").getBytes("iso8859-1"),"tis-620");
	String status=new String(request.getParameter("status").getBytes("iso8859-1"),"tis-620");
	String work_address=new String(request.getParameter("work_address").getBytes("iso8859-1"),"tis-620");
	String id=new String();
	String select2=new String();
	
	 id=new String( request.getParameter("id2").getBytes("iso8859-1"),"tis-620");
	 try{
	 select2=new String( request.getParameter("select2").getBytes("iso8859-1"),"tis-620");
	}catch(Exception e){System.out.println(e);}

	try{
		soapProxy.edit_data(username, null,name ,lastname ,sex , status,work_address, id	,select2	, 
		 new String(request.getParameter("home_number").getBytes("iso8859-1"),"tis-620"), 
		 new String(request.getParameter("lane").getBytes("iso8859-1"),"tis-620"), 
		new String( request.getParameter("village").getBytes("iso8859-1"),"tis-620"),
		new String( request.getParameter("moo").getBytes("iso8859-1"),"tis-620"),
		new String(  request.getParameter("road").getBytes("iso8859-1"),"tis-620"),
		new String( request.getParameter("district").getBytes("iso8859-1"),"tis-620"),
		new String(  request.getParameter("amphur").getBytes("iso8859-1"),"tis-620"),
		 new String( request.getParameter("province").getBytes("iso8859-1"),"tis-620"), 
		new String( request.getParameter("zip_code").getBytes("iso8859-1"),"tis-620"), 
		 new String(request.getParameter("phone").getBytes("iso8859-1"),"tis-620"), null,
		new String( request.getParameter("email").getBytes("iso8859-1"),"tis-620"), 
		"gk", "1000", "0000", request.getParameter("level"));
	}catch(Exception e){System.out.println(e);}
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
ok?
</body>
</html>
