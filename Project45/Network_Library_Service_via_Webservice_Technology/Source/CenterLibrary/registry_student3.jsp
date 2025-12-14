<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ page import="weblogic.jws.proxies.*" %>

<% Registry_Impl proxy = new Registry_Impl(); %>
<% RegistrySoap soapProxy = proxy.getregistrySoap(); %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<% 
String username=new String(request.getParameter("username").getBytes("iso-8859-1"), "tis-620");
String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"tis-620");
String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"tis-620");
String last_name = new String(request.getParameter("last_name").getBytes("iso-8859-1"),"tis-620");
String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"),"tis-620");	System.out.println("step 1");
String library = new String(request.getParameter("library").getBytes("iso-8859-1"),"tis-620");
String id = new String(request.getParameter("id").getBytes("iso-8859-1"),"tis-620");
String year = new String(request.getParameter("year").getBytes("iso-8859-1"),"tis-620");
String status = new String(request.getParameter("status").getBytes("iso-8859-1"),"tis-620");
String status_temp = new String();
if (status.equals("under_graduate"))status_temp = "นักศึกษาปริญญาตรี";
	else if(status_temp.equals("graduate"))status_temp = "นักศึกษาปริญาโท-เอก";
	else status_temp = "อาจารย์";
String work_adress = new String(request.getParameter("work_adress").getBytes("iso-8859-1"),"tis-620");	System.out.println("step 2");																											
String home_num = new String(request.getParameter("home_num").getBytes("iso-8859-1"),"tis-620");
String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"tis-620");	System.out.println("step 3");																																		
String village = new String(request.getParameter("village").getBytes("iso-8859-1"),"tis-620");	System.out.println("step 4");
String moo = new String(request.getParameter("moo").getBytes("iso-8859-1"),"tis-620");
String lane = new String(request.getParameter("lane").getBytes("iso-8859-1"),"tis-620"); 													
String road = new String(request.getParameter("road").getBytes("iso-8859-1"),"tis-620");	System.out.println("step 5");
String district = new String(request.getParameter("district").getBytes("iso-8859-1"),"tis-620");
String amphur = new String(request.getParameter("amphur").getBytes("iso-8859-1"),"tis-620");
String province = new String(request.getParameter("province").getBytes("iso-8859-1"),"tis-620");	System.out.println("step 6");
String zip_code = new String(request.getParameter("zip_code").getBytes("iso-8859-1"),"tis-620");
String phone1 = new String(request.getParameter("phone1").getBytes("iso-8859-1"),"tis-620");		System.out.println("step6.2");										
String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"tis-620");	System.out.println("step6.3");
String email_way = new String(request.getParameter("email_way").getBytes("iso-8859-1"),"tis-620");		System.out.println("step7");
String category = new String(request.getParameter("category"));	System.out.println("step 8");			
String application_way ="0000";
%>		
<%
boolean answer = soapProxy.add_member
(library, username,password
, name,last_name, sex, status, work_adress, id, year
, home_num, lane, village, moo, road, district, amphur
, province, zip_code, phone1, phone1
, email, category, email_way, application_way);		
%> 
<%		if (answer==true){
		session.setAttribute("s_name",name);
		session.setAttribute("s_last_name",last_name);
		session.setAttribute("s_status",status_temp);
		session.setAttribute("s_work_add",work_adress);
		session.setAttribute("s_id",id);
		session.setAttribute("s_address",address+" "+village);
		session.setAttribute("s_province",province);
		session.setAttribute("s_phone",phone1);
		session.setAttribute("s_email",email);
		session.setAttribute("s_library",library);
		session.setAttribute("s_username",username);		
%>		<jsp:forward page="page_one2.jsp"/> 
<%		;}
%>
		<%--สร้าง errorMessage--%>
		<jsp:useBean id="errorMessages" scope="request" class="java.util.Vector" /> 
			<% errorMessages.addElement(" !! ข้อมูลผิดพลาด usename  หรือ email ของท่าน อาจมีการใช้งานแล้ว !!"); %>	
		<%--ทำการส่งกลับไป.ให้กรอกข้อมูลใหม่่ --%>
		<jsp:forward page="registry_student.jsp"/>
<body>
registry student 3
<%=username%>
<%=answer%>
</body>
</html>
