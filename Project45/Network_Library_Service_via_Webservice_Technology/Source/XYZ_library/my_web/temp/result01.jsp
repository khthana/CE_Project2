<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*"%>
<html><head><title>ผลลัพท์</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<%
	String key=request.getParameter("key");
	String from=request.getParameter("from");
	int j=0,i=0;
%>
<body>
<% Search_all_Impl proxy = new Search_all_Impl(); %>
<% Search_allSoap soapProxy = proxy.getsearch_allSoap(); %>
<%
	if ("title".equals(from))
	{
		out.print("ค้นหาจาก Title");
		try{
		BookList list[]=soapProxy.searchBookByTitle(key);
		j=list.length;
		j--;
		out.print("<br>");
		for (i=0;i<j;i++)
		{
			out.print(i+". ");
			out.print(list[i].getTitle());
%>
โดย
<%
			out.print(list[i].getAuthor());
			out.print("<br>");
		}
		}catch (Exception e){
			out.print("Error at "+i);
			out.print(e);
		}
	}
%>
<%
	if ("word".equals(from))
	{
		out.print("ค้นหาจาก Word");
		try{
		BookList list[]=soapProxy.selectBookByWord(key);
		j=list.length;
		j--;
		out.print("<br>");
		for (i=0;i<j;i++)
		{
			out.print(i+". ");
			out.print(list[i].getTitle());
%>
โดย
<%
			out.print(list[i].getAuthor());
			out.print("<br>");
		}
		}catch (Exception e){
			out.print("Error at "+i);
			out.print(e);
		}
	}
%>
<%
	if ("subject".equals(from))
	{
		out.print("ค้นหาจาก Subject");
		try{
		BookList list[]=soapProxy.searchBookBySubject(key);
		j=list.length;
		j--;
		out.print("<br>");
		for (i=0;i<j;i++)
		{
			out.print(i+". ");
			out.print(list[i].getTitle());
%>
โดย
<%
			out.print(list[i].getAuthor());
			out.print("<br>");
		}
		}catch (Exception e){
			out.print("Error at "+i);
			out.print(e);
		}
	}
%>
<%
	if ("author".equals(from))
	{
		out.print("ค้นหาจาก Author");
		try{
		BookList list[]=soapProxy.searchBookByAuthor(key);
		j=list.length;
		j--;
		out.print("<br>");
		for (i=0;i<j;i++)
		{
			out.print(i+". ");
			out.print(list[i].getTitle());
%>
โดย
<%
			out.print(list[i].getAuthor());
			out.print("<br>");
		}
		}catch (Exception e){
			out.print("Error at "+i);
			out.print(e);
		}
	}
%>
<%
	if ("isbn".equals(from))
	{
		out.print("ค้นหาจาก ISBN");
		
		try{
		int isbn=Integer.parseInt(key);
		BookList list[]=soapProxy.searchBookByISBN(isbn);
		j=list.length;
		j--;
		out.print("<br>");
		for (i=0;i<j;i++)
		{
			out.print(i+". ");
			out.print(list[i].getTitle());
%>
โดย
<%
			out.print(list[i].getAuthor());
			out.print("<br>");
		}
		}catch (Exception e){
			out.print("Error at "+i);
			out.print(e);
		}
	}
%>
<%
	if ("call_num".equals(from))
	{
		out.print("ค้นหาจาก Call Number ");
		try{
		BookList list[]=soapProxy.searchBookByCall_num(key);
		j=list.length;
		j--;
		out.print("<br>");
		for (i=0;i<j;i++)
		{
			out.print(i+". ");
			out.print(list[i].getTitle());
%>
โดย
<%
			out.print(list[i].getAuthor());
			out.print("<br>");
		}
		}catch (Exception e){
			out.print("Error at "+i);
			out.print(e);
		}
	}
%>
</body>
</html>