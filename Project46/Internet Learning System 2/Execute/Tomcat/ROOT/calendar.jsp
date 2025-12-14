<!doctype html public "-//w3c/dtd HTML 4.0//en">
<html><head><title>Calendar</title>
</head><%@ page         info="Calendar JSP example"        contentType="text/html"%><jsp:useBean id="calendar"   scope="page"  class="examples.intro.CalendarBean"/><jsp:setProperty name="calendar"     property="Color" value="#FFFFCC"/><h1>Today is <jsp:getProperty name="calendar"   property="TodayString"/></h1><p><center><jsp:getProperty name="calendar" property="HtmlMonth" /></center><p><hr><font face="Helvetica"><p>This page executed by <%= application.getServerInfo() %>.
<br>Copyright 1999-2000 &copy; BEA Systems, Inc. All Rights Reserved. 
</body>
</html>
