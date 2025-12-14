<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<html><head><title>Find Book</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
ค้นหา <form action="result01.jsp" method="post">
<input name="key" type="text">
<input name="from" type="radio" value="title">โดย Title
<input name="from" type="radio" value="word">โดย Word
<input name="from" type="radio" value="subject">โดย Subject
<input name="from" type="radio" value="author">โดย Author
<input name="from" type="radio" value="isbn">โดย ISBN
<input name="from" type="radio" value="call_num">โดย Call Number
<input type="submit" value="ค้นหา">
</form>

</body>
</html>
