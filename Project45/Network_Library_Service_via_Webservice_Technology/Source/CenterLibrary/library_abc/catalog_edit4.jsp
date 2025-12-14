<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>

<%	
AddBook_Impl proxy = new AddBook_Impl(); 
AddBookSoap soapProxy = proxy.getaddBookSoap(); 
%>
<% System.out.println("***********************");
String call_number=new String(request.getParameter("call_number").getBytes("iso-8859-1"), "tis-620");	System.out.println("step 1");
String isbn = new String(request.getParameter("isbn").getBytes("iso-8859-1"),"utf-8");
String barcode = new String(request.getParameter("barcode").getBytes("iso-8859-1"),"utf-8");
String author = new String(request.getParameter("author").getBytes("iso-8859-1"),"utf-8");
String alt_author1 = new String(request.getParameter("alt_author1").getBytes("iso-8859-1"),"utf-8");
String alt_author2 = new String(request.getParameter("alt_author2").getBytes("iso-8859-1"),"utf-8"); System.out.println("step 2");
String title = new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
String alt_title = new String(request.getParameter("alt_title").getBytes("iso-8859-1"),"utf-8");
String printing = new String(request.getParameter("printing").getBytes("iso-8859-1"),"utf-8");
String years = new String(request.getParameter("years").getBytes("iso-8859-1"),"utf-8");
String book_page = new String(request.getParameter("book_page").getBytes("iso-8859-1"),"utf-8");
String subject1 = new String(request.getParameter("subject1").getBytes("iso-8859-1"),"utf-8");
String subject2 = new String(request.getParameter("subject2").getBytes("iso-8859-1"),"utf-8"); System.out.println("step 3");
String subject3 = new String(request.getParameter("subject3").getBytes("iso-8859-1"),"utf-8");	
String series = new String(request.getParameter("series").getBytes("iso-8859-1"),"utf-8");
String place = new String(request.getParameter("place").getBytes("iso-8859-1"),"utf-8"); System.out.println("step 3.1");
String status = new String(request.getParameter("status").getBytes("iso-8859-1"),"utf-8");
String detail = new String(request.getParameter("detail").getBytes("iso-8859-1"),"utf-8"); System.out.println("step 3.2");
String username_use = new String(request.getParameter("username_use").getBytes("iso-8859-1"),"utf-8");
String borrow_date = new String(request.getParameter("borrow_date").getBytes("iso-8859-1"),"utf-8");
String return_date = new String(request.getParameter("return_date").getBytes("iso-8859-1"),"utf-8");
String book_record = new String(request.getParameter("book_record").getBytes("iso-8859-1"),"utf-8");
String key = new String(request.getParameter("key").getBytes("iso-8859-1"),"utf-8");;
%>
<%

soapProxy.edit_book
( book_record, call_number, isbn, barcode, author, alt_author1
, alt_author2, title, alt_title, printing, years
, book_page, subject1, subject2, subject3, series
, place, status, detail, username_use, borrow_date, return_date);
%><jsp:forward page="catalog_edit.jsp"/>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<%=book_record%>
 <input name="key" type="hidden" value="<%=book_record%>">
<!--   -->
</body>
</html>