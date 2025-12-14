
<%
session("flag")=true
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"
%>

<html>
<head>
<title>Buyer Order Status</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
</head>
<body bgcolor="#FFFFFF" background="images/bg17.jpg" vlink="#000000">
<div id="Layer1" style="position:absolute; left:653px; top:177px; width:275px; height:88px; z-index:1"> 
  <p><font face="MS Sans Serif, Microsoft Sans Serif" color="DF0070"><b><font color="993366"><%=session("BizName")%></font></b></font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    </font></p>
  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    </font></p>
</div>
<p>&nbsp;</p>
<img src="images/OrderStatus.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="777,92,871,111" href="Mainmenu.asp">
  <area shape="rect" coords="891,89,962,113" href="Signout.asp">
</map>
<br>
<br>
<br>
<br>
<br>
<br>
<table width="780" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="195" height="69">&nbsp;</td>
    <td width="35" height="69"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="+1"><a href="PRStatus.asp"><font color="DF0070"><img src="images/PR.jpg" width="24" height="28" border="0"></font></a></font></b></td>
    <td height="70" width="536"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="+1"><a href="PRStatus.asp"><font color="DF0070" size="3">Purchase 
      Request</font></a> <font color="DF0070" size="3">( 
      <%
	Set rsNumberPO=conn.Execute("select  Count(*) From PR Where   BuyerID="&session("BuyerID") ,,CmdText)
	response.write  rsNumberPO(0)
	 rsNumberPO.close
	%>
      )</font><font color="DF0070"><br>
      </font></font></b><font face="MS Sans Serif, Microsoft Sans Serif"><font color="DF0070">ใบขอสั่งซื้อที่ออกผ่าน 
      ThaiCatalog.com </font></font></td>
  </tr>
  <tr> 
    <td width="195" height="61">&nbsp;</td>
    <td width="35" height="61"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="+1"><a href="POStatus.asp"><font color="#0000CC"><font color="DF0070"><img src="images/PO.jpg" width="24" height="28" border="0"></font></font></a></font></b></td>
    <td height="70" width="536"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="+1"><a href="POStatus.asp"><font color="#0000CC"><font color="DF0070" size="3">Purchase 
      Order</font></font></a> <font color="DF0070" size="3">( 
      <%
	Set rsNumberPO=conn.Execute("select  Count(*) From PO,PR Where PO.PRID=PR.PRID  AND BuyerID="&session("BuyerID") ,,CmdText)
	response.write  rsNumberPO(0)
	 rsNumberPO.close
	%>
      )</font><font color="DF0070"><br>
      </font></font></b><font face="MS Sans Serif, Microsoft Sans Serif"><font color="DF0070">ใบสั่งซื้อที่สั่งซื้อสินค้าไปยัง 
      Supplier รายต่างๆ</font></font></td>
  </tr>
  <tr> 
    <td width="195" height="15">&nbsp;</td>
    <td width="35" height="15"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="+1"><a href="InvoiceStatus.asp"><font color="#0000CC"><font color="DF0070"><img src="images/Invoice1.jpg" width="24" height="28" border="0"></font></font></a></font></b></td>
    <td height="70" width="536"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="+1"><a href="InvoiceStatus.asp"><font color="#0000CC"><font color="DF0070" size="3">Invoice</font></font></a> 
      <font color="DF0070" size="3">( 
      <%
	Set rsNumberPO=conn.Execute("select  Count(*) From PO,PR,Invoice Where PO.POID=Invoice.POID AND PO.PRID=PR.PRID  AND BuyerID="&session("BuyerID") ,,CmdText)
	response.write  rsNumberPO(0)
	 rsNumberPO.close
	%>
      ) </font><font color="DF0070"><br>
      </font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" color="DF0070">ใบกำกับสินค้าที่ 
      Supplier เรียกเก็บเงินเข้ามา</font></td>
  </tr>
</table>
</body>
</html>

