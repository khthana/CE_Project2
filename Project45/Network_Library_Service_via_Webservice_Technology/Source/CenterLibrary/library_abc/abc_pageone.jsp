<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="login.library.com.*"%>
<%@ page import="com.ora.jsp.util.*" %>

<html>
<head>
<title>เข้าสู่ระบบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<% Login_Impl proxy = new Login_Impl(); %>
<% LoginSoap soapProxy = proxy.getloginSoap(); %>

<%String user_name = new String();;%>
<% String password = new String();%>
<% String library = new String();%>
<% String ip = request.getRemoteAddr();%>
<% String ms = new String(); %>
<% String temp= new String(); %>
<% UserProfile user = new UserProfile(); %>
<% user = soapProxy.check_ip(ip);  %>


<%	
		user_name = new String(request.getParameter("useranme").getBytes("iso-8859-1"), "tis-620");
		library = "abc";
		password = new String(request.getParameter("password").getBytes("iso-8859-1"), "tis-620");
		user = soapProxy.check_id(user_name, password, library ,ip); 
		if (user == null){
%>		<%--สร้าง errorMessage--%>
			<jsp:useBean id="errorMessages" scope="request" class="java.util.Vector" />
			<% errorMessages.addElement(" !! รหัสผ่านผิดพลาด !!"); %>	
		<%--ทำการส่งกลับไปหน้าแรก--%>
		<jsp:forward page="abc_index.jsp"/> 
<% 		 ;}else {

String name = user.getName();
String last_name = user.getLastname();
String status_temp = user.getStatus();
String status = new String(); 
if (status_temp.equals("under_graduate"))status = "นักศึกษาปริญญาตรี";
	else if(status_temp.equals("graduate"))status = "นักศึกษาปริญาโท-เอก";
	else status = "อาจารย์";
String work_add = user.getWorkAddress();
String id_temp = user.getId();
String home_num= user.getHomeNumber();
	/*System.out.println(home_num);
	if (!home_num.equals(null)) home_num="บ้านเลขที่ "+home_num;
	else home_num="";*/
String village = user.getVillage();
String amphur = user.getAmphur();
String district = user.getDistrict();
String province = user.getProvince();
String zib_code_temp = user.getZipCode();
String email = user.getEmail();
String address= "บ้านเลขที่ "+home_num+"  "+village+"  "+"ตำบล "+district+"  อำเภอ  "+amphur+"  จังหวัด  "+province+"   "+zib_code_temp;
String phone_temp = user.getPhone1();
//String level = Integer.parseInt(user.getLevel());
int level = Integer.parseInt(user.getLevel());
String category = user.getCategory();

	session.setAttribute("s_name",name);
	session.setAttribute("s_last_name",last_name);
	session.setAttribute("s_status",status);
	session.setAttribute("s_work_add",work_add);
	session.setAttribute("s_id",id_temp);
	session.setAttribute("s_address",address);
	session.setAttribute("s_province",province);
	session.setAttribute("s_phone",phone_temp);
	session.setAttribute("s_email",email);
	session.setAttribute("s_library",library);
	session.setAttribute("s_username",user_name);
	session.setAttribute("s_category",category);
	if(level<3){
%><jsp:forward page="catalog_menu.jsp"/>
<%;}else%>
%>
<jsp:forward page="/my_web/page_one.jsp"/>
	
<%	
	;}
%> 
<body>

</body>

</html>
