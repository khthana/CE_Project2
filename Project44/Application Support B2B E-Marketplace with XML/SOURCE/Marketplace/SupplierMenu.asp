<%
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"
Set rs = Server.CreateObject("ADODB.Recordset") 

sql = "Select BizAddress,Zip,BizName,ProvinceName From Province ,Member Where  ID="&session("SellerID") &"and  Province.ProvinceID=Member.ProvinceID"

rs.Open sql,conn,1,3
session("BizName")=rs("BizName")
session("BizAddress")=rs("BizAddress")&"<br>จังหวัด"&rs("ProvinceName")&" "&rs("Zip")

%>





<html>
<head>
<title>Supplier Menu</title>
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
<div id="Layer1" style="position:absolute; left:681px; top:178px; width:241px; height:88px; z-index:1"> 
  <p><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="993366"><%=session("BizName")%> 
    </font><br>
    <font color="993366">Last Login : &nbsp;<%=formatdateTime(session("LastLog"),1)%><br>
    </font>&nbsp;</b> </font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    </font></p>
  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    </font></p>
  </div>
<p>&nbsp;</p>
<p><img src="images/SupplierMenu.gif" width="1003" height="110" usemap="#Map" border="0"> 
  <map name="Map"> 
    <area shape="rect" coords="803,85,860,108" href="Home.asp">
    <area shape="rect" coords="892,82,964,113" href="signOut.asp">
  </map>
  <br>
  <br>
  <br>
  <br>
</p>
<br><br>
<br>

<table width="780" border="0">
  <tr> 
    <td height="40" width="254">&nbsp;</td>
    <td height="40" width="516"> <font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;&nbsp;<img src="images/next.gif" width="16" height="16"><a href="SupplierSetting.asp"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2"></font><font color="DF0070"><b>Setting</b></font></a></font></td>
  </tr>
  <tr> 
    <td width="254" height="40">&nbsp;</td>
    <td height="40" width="516"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;&nbsp;<img src="images/next.gif" width="16" height="16"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2"><a href="shopping.asp"><font color="DF0070"><b>Shopping</b></font></a></font></font></td>
  </tr>
  <tr> 
    <td width="254" height="40">&nbsp;</td>
    <td height="40" width="516"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;&nbsp;<img src="images/next.gif" width="16" height="16"><a href="SellerOrderStatus.asp"><font color="DF0070"><b>Order 
      Status</b></font></a> </font></td>
  </tr>
  <tr> 
    <td width="254" height="40">&nbsp;</td>
    <td height="40" width="516"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;&nbsp;<img src="images/next.gif" width="16" height="16"><a href="ManageCatalog.asp"><font color="DF0070"><b>Manage 
      Catalog</b></font></a></font></td>
  </tr>
  <tr>
    <td width="254" height="40">&nbsp;</td>
    <td height="40" width="516"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2"> 
      </font></td>
  </tr>
  <tr> 
    <td width="254" height="15">&nbsp;</td>
    <td height="32" width="516"><font face="MS Sans Serif, Microsoft Sans Serif" size="+2">&nbsp;</font></td>
  </tr>
</table>

</body>
</html>
<%
session("supplierName")=rs("BizName")
rs.close

conn.close
set conn=nothing
%>