<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*" %>
<% 
String library = request.getParameter("library");
String username = request.getParameter("username");
String book_record = request.getParameter("book_record");
String comment = request.getParameter("comment");
String reseive_date = request.getParameter("reseive_date");
int answer ;
%>
<%// ประกาศเซอร์วิส	
	Reservation_Impl proxy = new Reservation_Impl(); 
	ReservationSoap soapProxy = proxy.getreservationSoap(); 
%>
<%// เรียกใช้เซอร์วิส
	answer = soapProxy.add_reservation(library, username,reseive_date, book_record, comment);
	System.out.println("do add reservation= "+answer);
%>
<jsp:useBean id="errorMessages" scope="request" class="java.util.Vector" />
<%// ทำการตรวจสอบผลลัพธ์การจอง
	if(answer== 1 ){errorMessages.addElement(" การจองเสร็จสมบูรณ์ ");}
	else if (answer ==  2 ){errorMessages.addElement("ไม่สามารถทำการจองเพิ่มได้เนื่องจากท่านได้จองหนังสือไว้ครบตามจำนวนที่สามารถทำได้");}
	else {errorMessages.addElement("ไม่สามารถทำการจองได้เนื่องจากหนังสือเล่มนี้มีผู้จองไว้ครบตามจำนวนที่กำหนดแล้ว");}
%>
<jsp:forward page="your_list1.jsp"/>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
</body>
</html>
