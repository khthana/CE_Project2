<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.ora.jsp.util.*" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<%try{
%>
	<% String username=new String(request.getParameter("username").getBytes("iso-8859-1"), "tis-620");%>
	<% String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");%>
	<% String password2 = new String(request.getParameter("password2").getBytes("iso-8859-1"),"utf-8");%>
	<% String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");%>
	<% String last_name = new String(request.getParameter("last_name").getBytes("iso-8859-1"),"utf-8");%>
	<% String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"),"utf-8");%>
	<% String library = new String(request.getParameter("library").getBytes("iso-8859-1"),"utf-8");%>
	<% String id = new String(request.getParameter("id").getBytes("iso-8859-1"),"utf-8");%>
	<% String day = new String(request.getParameter("day").getBytes("iso-8859-1"),"utf-8");%>
	<% String month = new String(request.getParameter("mouth").getBytes("iso-8859-1"),"utf-8");%>
	<% String year = new String(request.getParameter("year").getBytes("iso-8859-1"),"utf-8");%>
	<% String status = new String(request.getParameter("status").getBytes("iso-8859-1"),"utf-8");%>
	<% String work_add1 = new String(request.getParameter("work_add1").getBytes("iso-8859-1"),"utf-8");%>
	<% String work_add2 = new String(request.getParameter("work_add2").getBytes("iso-8859-1"),"utf-8");%>
	<% String home_num = new String(request.getParameter("home_num").getBytes("iso-8859-1"),"utf-8");%>
	<% String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"utf-8");%>
	<% String village = new String(request.getParameter("village").getBytes("iso-8859-1"),"utf-8");%>
	<% String moo = new String(request.getParameter("moo").getBytes("iso-8859-1"),"utf-8");%>
	<% String lane = new String(request.getParameter("lane").getBytes("iso-8859-1"),"utf-8");%>
	<% String road = new String(request.getParameter("road").getBytes("iso-8859-1"),"utf-8");%>
	<% String district = new String(request.getParameter("district").getBytes("iso-8859-1"),"utf-8");%>
	<% String amphur = new String(request.getParameter("amphur").getBytes("iso-8859-1"),"utf-8");%>
	<% String province = new String(request.getParameter("province").getBytes("iso-8859-1"),"utf-8");%>
	<% String zip_code = new String(request.getParameter("zip_code").getBytes("iso-8859-1"),"utf-8");%>
	<% String phone1 = new String(request.getParameter("phone1").getBytes("iso-8859-1"),"utf-8");%>
	<% String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");%>
	
	
	<%--สร้าง errorMessage--%>
	<jsp:useBean id="errorMessages" scope="request" class="java.util.Vector" />
	<%
	if(password.length()==0){
		errorMessages.addElement("กรุณาใส่ password ของท่านลงในช่องที่กำหนด");}
	if(name.length()==0){
		errorMessages.addElement("กรุณาใส่ชื่อของท่านลงในช่องที่กำหนด");}
	if(last_name.length()==0){
		errorMessages.addElement("กรุณาใส่นามสกุลของท่านลงในช่องที่กำหนด");}
	if(id.length()==0){
		errorMessages.addElement("กรุณาใส่รหัสประจำตัวนักศึกษาของท่านลงในช่องที่กำหนด");}
	if(work_add2.length()==0){
		errorMessages.addElement("กรุณาใส่สาขาวิชาที่ท่านกำลังศึกษาอยู่ลงในช่องที่กำหนด");}
	if(home_num.length()==0){
		errorMessages.addElement("กรุณาใส่หมายเลขบ้านเลขที่ลงในช่องที่กำหนด");}
	if(road.length()==0){
		errorMessages.addElement("กรุณาใส่ชื่อถนนตามที่อยู่ในสำเนาทะเบียนบ้านลงในช่องที่กำหนด");}
	if(district.length()==0){
		errorMessages.addElement("กรุณาใสชื่อตำบล/แขวง  ตามที่อยู่ในสำเนาทะเบียนบ้านลงในช่องที่กำหนด");}
	if(amphur.length()==0){
		errorMessages.addElement("กรุณาใสชื่ออำเภอ/เขต ตามที่อยู่ในสำเนาทะเบียนบ้านลงในช่องที่กำหนด");}
	if(errorMessages.size()>0){
	%><jsp:forward page="registry_student.jsp"/>
	<% ;}else {
	%><jsp:forward page="registry_student2.jsp"/> 
	<% ;}
	%>
	
	    
<% }catch(Exception e){System.out.print(e);} 
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>
