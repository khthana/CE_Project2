
<%
session("flag")=false
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"
%>

<html>
<head>
<title>Seller Order Status</title>
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
<div id="Layer1" style="position:absolute; left:625px; top:162px; width:336px; height:88px; z-index:1"> 
  <p><font face="MS Sans Serif, Microsoft Sans Serif" color="993366"><b><%=session("BizName")%></b></font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    </font></p>
  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    </font></p>
</div>
<p>&nbsp;</p>
<img src="images/OrderStatus.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="778,89,871,115" href="MainMenu.asp">
  <area shape="rect" coords="890,88,963,118" href="Signout.asp">
</map>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table width="871" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="186" height="68">&nbsp;</td>
    <td height="68" width="121"> 
      <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/PO.jpg" width="24" height="28">&nbsp;</font></div>
    </td>
    <td height="68" width="564"><font face="MS Sans Serif, Microsoft Sans Serif"><a href="SellerPOStatus.asp"><font color="#0000CC"><b><font size="3" color="DF0070">Purchase 
      Order</font></b></font></a> <font color="DF0070"><b><font size="3">( 
      <%
	Set rsNumberPO=conn.Execute("select  Count(*) From PO,PR Where PO.PRID=PR.PRID  AND SellerID="&session("SellerID") ,,CmdText)
	response.write  rsNumberPO(0)
	 rsNumberPO.close
	%>
      )<br>
      </font></b><font size="3">ใบสั่งซื้อที่ลูกค้าสั่งเข้ามา</font></font></font></td>
  </tr>
  <tr> 
    <td width="186" height="15">&nbsp;</td>
    <td height="70" width="121"> 
      <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif"><font color="DF0070"><img src="images/Invoice1.jpg" width="24" height="28">&nbsp;</font></font></div>
    </td>
    <td height="70" width="564"><font face="MS Sans Serif, Microsoft Sans Serif"><font color="DF0070"><a href="SellerInvoiceStatus.asp"><b><font size="3" color="DF0070"">Invoice</font></b></a> 
      <b>( 
      <%
	Set rsNumberPO=conn.Execute("select  Count(*) From PO,PR,Invoice Where PO.POID=Invoice.POID  AND PO.PRID=PR.PRID  AND SellerID="&session("SellerID") ,,CmdText)
	response.write  rsNumberPO(0)
	 rsNumberPO.close
	%>
      )</b></font> <br>
      <font color="DF0070">ใบกำกับสินค้าที่เรียกเก็บเงินไปยังลูกค้า</font></font></td>
  </tr>
  <tr> 
    <td width="186" height="15">&nbsp;</td>
    <td height="70">
      <div align="right"><font color="DF0070"><img src="images/next.gif" width="11" height="11"><img src="images/next.gif" width="11" height="11"></font></div>
    </td>
    <td height="70"><a href="BuyerOrderStatus.asp"><font color="DF0070"><b>สถานะการสั่งซื้อของผู้ขาย</b></font></a></td>
  </tr>
</table>
</body>
</html>

