<%@ page contentType="text/html; charset=MS874" %>
<html>
<head>
<title>
trade
</title>
</head>
<jsp:useBean id="tradeBeanId" scope="session" class="stocktrade.tradeBean" />
<jsp:setProperty name="tradeBeanId" property="*" />
<body>
<h1>
JBuilder Generated JSP
</h1>
<form  action="StockChart.jsp" method="post">
<br>Enter new Stock   :  <input name="type"><br>
<br>Enter new Stock   :  <input name="stock"><br>
<br><br>
<input type="submit" name="Submit" value="Submit">
<input type="reset" value="Reset">
<br>
Value of Bean property is :<jsp:getProperty name="tradeBeanId" property="sample" />
</form>
<applet
    codebase = "/stocktrade/."
    code     = "stocktrade.IntradayApplet.class"
    name     = "TestApplet"
    width=435
    height=240
    align = "middle"
>
</applet>
<br><br>
</body>
</html>
