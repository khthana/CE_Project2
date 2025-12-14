
<%
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"
Set rs = Server.CreateObject("ADODB.Recordset") 

sql="Select  BizName,Zip,BizAddress,ProvinceName From Member ,Province Where  Member.ProvinceID=Province.ProvinceID AND  ID="&session("BuyerID")
rs.Open sql,conn
session("BizName")=rs("BizName")
session("BizAddress")=rs("BizAddress")&"<br>จังหวัด"&rs("ProvinceName")&" "&rs("Zip")
rs.close

%>
<html>
<head>
<title>Buyer  Menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">

<!--body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #000000; text-decoration: none}
a:visited { color: #000000; text-decoration: none}
a:active { color: #000000; text-decoration: underline}
a:hover { color: #0000ff; text-decoration: underline}
-->
</style>
<script language="JavaScript">
<!--

// -->
</script>
</head>

<body bgcolor="#FFFFFF" background="images/bg17.jpg">
<div id="Layer1" style="position:absolute; left:635px; top:169px; width:275px; height:88px; z-index:1"> 
  <p><font face="MS Sans Serif, Microsoft Sans Serif" color="993366"><b><%=session("BizName")%><br>
    </b></font><font face="MS Sans Serif, Microsoft Sans Serif" color="993366"><b>Last 
    Login : &nbsp;<%=formatdatetime(session("Lastlog"),1)%></b></font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    </font></p>
  </div>
<p>&nbsp;</p>
<p><img src="images/BuyerMenu.gif" width="1003" height="110" usemap="#Map" border="0"> 
  <map name="Map"> 
    <area shape="rect" coords="806,88,861,112" href="home.asp">
    <area shape="rect" coords="892,90,965,118" href="SignOut.asp">
  </map>
  <br>
  <br>
  <br>
</p>
<br>
  <br>
  <br><br>

<table width="780" border="0">
  <tr> 
    <td height="40" width="254">&nbsp;</td>
    <td height="40" width="591"> <font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;&nbsp;<img src="images/next.gif" width="16" height="16"><a href="BuyerSetting.asp"><font color="DF0070"><b>Setting</b></font></a></font></td>
  </tr>
  <tr> 
    <td width="254" height="40">&nbsp;</td>
    <td height="40" width="591"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;&nbsp;<img src="images/next.gif" width="16" height="16"><a href="Shopping.asp"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2"></font><font color="DF0070"><b>Shopping</b></font></a></font></td>
  </tr>
  <tr> 
    <td width="254" height="40">&nbsp;</td>
    <td height="40" width="591"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;&nbsp;<img src="images/next.gif" width="16" height="16"><a href="BuyerOrderStatus.asp"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2"></font><font color="DF0070"><b>Order 
      Status</b></font></a> </font></td>
  </tr>
</table>

</body>
</html>

