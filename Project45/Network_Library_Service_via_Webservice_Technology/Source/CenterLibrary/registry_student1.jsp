<%@ page contentType="text/html; charset=tis-620" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.ora.jsp.util.*" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<%try{
%>
	<% String username=new String(request.getParameter("username").getBytes("iso-8859-1"), "tis-620");%>
	<% String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"tis-620");%>
	<% String password2 = new String(request.getParameter("password2").getBytes("iso-8859-1"),"tis-620");%>
	<% String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"tis-620");%>
	<% String last_name = new String(request.getParameter("last_name").getBytes("iso-8859-1"),"tis-620");%>
	<% String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"),"tis-620");%>
	<% String library = new String(request.getParameter("library").getBytes("iso-8859-1"),"tis-620");%>
	<% String id = new String(request.getParameter("id").getBytes("iso-8859-1"),"tis-620");%>
	<% String day = new String(request.getParameter("day").getBytes("iso-8859-1"),"tis-620");%>
	<% String month = new String(request.getParameter("mouth").getBytes("iso-8859-1"),"tis-620");%>
	<% String year = new String(request.getParameter("year").getBytes("iso-8859-1"),"tis-620");%>
	<% String status = new String(request.getParameter("status").getBytes("iso-8859-1"),"tis-620");%>
	<% String work_add1 = new String(request.getParameter("work_add1").getBytes("iso-8859-1"),"tis-620");%>
	<% //String work_add2 = new String(request.getParameter("work_add2").getBytes("iso-8859-1"),"tis-620");%>
	<% String home_num = new String(request.getParameter("home_num").getBytes("iso-8859-1"),"tis-620");%>
	<% String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"tis-620");%>
	<% String village = new String(request.getParameter("village").getBytes("iso-8859-1"),"tis-620");%>
	<% String moo = new String(request.getParameter("moo").getBytes("iso-8859-1"),"tis-620");%>
	<% String lane = new String(request.getParameter("lane").getBytes("iso-8859-1"),"tis-620");%>
	<% String road = new String(request.getParameter("road").getBytes("iso-8859-1"),"tis-620");%>
	<% String district = new String(request.getParameter("district").getBytes("iso-8859-1"),"tis-620");%>
	<% String amphur = new String(request.getParameter("amphur").getBytes("iso-8859-1"),"tis-620");%>
	<% String province = new String(request.getParameter("province").getBytes("iso-8859-1"),"tis-620");%>
	<% String zip_code = new String(request.getParameter("zip_code").getBytes("iso-8859-1"),"tis-620");%>
	<% String phone1 = new String(request.getParameter("phone1").getBytes("iso-8859-1"),"tis-620");%>
	<% String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"tis-620");%>
	
	
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
	
	// ตั้งให้ค่า error masg เป็นรายกาสื่อสารนิเทศใหม่ที่เลือกให้แจ้ง	
	if (request.getParameter("category_a")!= null){errorMessages.addElement("GENERAL WORKS (ทั่วไป)");}	
	if (request.getParameter("category_b")!= null){errorMessages.addElement("PHILOSOPHY, PSYCHOLOGY, RELIGION (ปรัชญา,จิตศาสตร์, ศาสนา) "); }
	if (request.getParameter("category_c")!= null){errorMessages.addElement("HISTORY (AUXILIARY SCIENCES: ARCHAEOLOGY, GENEALOGY, etc.) (ประวัติศาสตร์, โบราณคดี, พันธุศาสตร์) ");}
	if (request.getParameter("category_d")!= null){errorMessages.addElement("HISTORY (EXCEPT AMERICA) (ประวัติศาสตร์ ยกแว้นอเมริกา)"); }
	if (request.getParameter("category_e")!= null){errorMessages.addElement("AMERICA AND UNITED STATES (อเมริกา) ");}
	if (request.getParameter("category_g")!= null){errorMessages.addElement("GEOGRAPHY, ANTHROPOLOGY (ภูมิศาสตร์)");}
	if (request.getParameter("category_h")!= null){errorMessages.addElement("SOCIAL SCIENCES (สังคมศาสตร์)");}
	if (request.getParameter("category_j")!= null){errorMessages.addElement("POLITICAL SCIENCE (การเมืองการปกครอง)");}
	if (request.getParameter("category_k")!= null){errorMessages.addElement("LAW (กฎหมาย)");}
	if (request.getParameter("category_l")!= null){errorMessages.addElement("EDUCATION (การศึกษา) ");}
	if (request.getParameter("category_m")!= null){errorMessages.addElement("MUSIC (การดนตรี)");}
	if (request.getParameter("category_n")!= null){errorMessages.addElement("FINE ARTS (ศิลป์ศาสตร์)");}
	if (request.getParameter("category_p")!= null){errorMessages.addElement("LANGUAGE AND LITERATURE (ภาษาศาสตร์, อักขษรศาสตร์, วรรณคดี) ");}
	if (request.getParameter("category_q")!= null){errorMessages.addElement("SCIENCE (วิทยาศาสตร์) ");}
	if (request.getParameter("category_r")!= null){errorMessages.addElement("MEDICINE (แพทย์ศาสตร์)");}
	if (request.getParameter("category_s")!= null){errorMessages.addElement("AGRICULTURE (เกษตรศาสตร์, กสิกรรม)");}
	if (request.getParameter("category_t")!= null){errorMessages.addElement("TECHNOLOGY AND ENGINEERING (เทคโนโลยี, วิศวกรรมศาสตร์) ");}
	if (request.getParameter("category_u")!= null){errorMessages.addElement("MILITARY SCIENCE (การทหาร)");}
	if (request.getParameter("category_v")!= null){errorMessages.addElement("NAVAL SCIENCE (ทหารเรือ)");}
	if (request.getParameter("category_z")!= null){errorMessages.addElement("BIBLIOGRAPHY LIBRARY SCIENCE (ห้องสมุดศาสตร์)");}
// ให้ค่าไปหน้า ต่อไป
	
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
