<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import = "java.util.Date" import ="java.text.*"%>
<%
	SimpleDateFormat tdate1 = new SimpleDateFormat("MM.dd HH.mm");
	Date n = new Date();
	n = tdate1.parse("01.01 11.10");
%>
