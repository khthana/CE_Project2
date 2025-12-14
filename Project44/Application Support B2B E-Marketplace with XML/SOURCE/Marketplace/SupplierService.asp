<%
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

%>
<html>
<head>
<title>Supplier Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #000000; text-decoration: none}
a:visited { color: #000000; text-decoration: none}
a:active { color: #000000; text-decoration: underline}
a:hover { color: #0000ff; text-decoration: underline}
-->
</style>
</head>

<body bgcolor="#FFFFFF" background="images/bg17.jpg">
<div id="Layer1" style="position:absolute; left:682px; top:176px; width:223px; height:88px; z-index:1"> 
  <p><font face="MS Sans Serif, Microsoft Sans Serif" color="993366"><b><%=session("BizName")%></b></font><font face="MS Sans Serif, Microsoft Sans Serif"></font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
    <br>
    </font></p>
</div>
<p>&nbsp;</p>
<img src="images/supplier7.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="823,89,911,111" href="home.asp">
  <area shape="rect" coords="920,86,994,117" href="signout.asp">
</map>
<br>
<br>
<br>
<form name="form1" method="post" action="UpdateTermPayment.asp">

<br>
<table width="843" border="0">
  <tr> 
      <td height="31" width="55">&nbsp;</td>
      <td height="32" width="778"> <font face="MS Sans Serif, Microsoft Sans Serif" size="+1" color="993366"><b>Buyer 
        Information &amp; Term of Payment</b></font></td>
  </tr>
</table>
<table width="843" border="0">
  <tr> 
      <td height="33"> 
        <table width="87%" border="1" cellspacing="0" cellpadding="1" align="center" height="63">
          <tr bgcolor="#6601C8"> 
            <td width="30%"> 
              <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">ชื่อ 
                Buyer</font></b></div>
            </td>
            <td width="16%"> 
              <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">จำนวนครั้ง<br>
                ที่ออกใบ P.O.</font></b></div>
            </td>
            <td width="22%"> 
              <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">จำนวนครั้งในการ 
                <br>
                Reject Invoice</font></b></div>
            </td>
            <td width="17%"> 
              <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">จำนวนครั้งที่<br>
                การโอนเงินไม่สำเร็จ</font></b></div>
            </td>
            <td width="15%"> 
              <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">Term 
                of Payment</font></b></div>
            </td>
          </tr>
          <%
		sql="Select BizName,ID,DefaultTerm  From Member Where MemberType='b'"
		Set rs = Server.CreateObject("ADODB.Recordset") 
		rs.Open sql,conn,1,3
		
		 do while not rs.eof
		%>
          <tr> 
            <td width="30%" height="31"> 
              <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"></font> 
                <table width="95%" border="0" align="center">
                  <tr>
                    <td><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b><%=rs("BizName")%></b></font></td>
                  </tr>
                </table>
              </div>
            </td>
            <td width="16%" height="31"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b> 
                <%
		  sql="Select Count(*)  From  PO,PR  Where PO.PRID=PR.PRID AND BuyerID="&rs(1)
		  Set rs1 = Server.CreateObject("ADODB.Recordset") 
		  rs1.Open sql,conn,1,3
		  response.write rs1(0)
		  rs1.close
		  %>
                </b></font></div>
            </td>
            <td width="22%" height="31"> 
              <div align="center"> 
             <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b> 
                  <%
		  sql="Select Count(*)  From  Invoice,PO,PR  Where Invoice.POID=PO.POID AND  InvoiceState='rejected' AND PO.PRID=PR.PRID AND BuyerID="&rs(1)
		  Set rs1 = Server.CreateObject("ADODB.Recordset") 
		  rs1.Open sql,conn,1,3
		  response.write rs1(0)
		  rs1.close
		  %>
                  </b></font>
              </div>
            </td>
            <td width="17%" height="31"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b> 
                <%
		  sql="Select Count(*)  From  Invoice,PO,PR  Where Invoice.POID=PO.POID AND  InvoiceState='fail' AND PO.PRID=PR.PRID AND BuyerID="&rs(1)
		  Set rs1 = Server.CreateObject("ADODB.Recordset") 
		  rs1.Open sql,conn,1,3
		  response.write rs1(0)
		  rs1.close
		  %>
                </b></font></div>
            </td>
            <td width="15%" height="31"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b> 
                <input type="text" name="term<%=rs("ID")%>" value="<%
sql1 = "Select * From Term Where SellerID="&session("SellerID")&" AND BuyerID="&rs(1)
			Set rsTerm= Server.CreateObject("ADODB.Recordset") 
			rsTerm.Open sql1,conn
		
			if (rsTerm.EOF ) then
					Term=rs(2)
			else
					Term=rsTerm("Term")
			end if
			rsTerm.close
			response.write Term
			  %>" size="3" maxlength="3"  style="TEXT-ALIGN: center">
                </b>วัน<b> </b></font></div>
            </td>
          </tr>
          <%
		rs.movenext
		loop
		rs.close
		%>
        </table>
    </td>
  </tr>
</table>
  <table width="843" border="0">
    <tr> 
      <td height="44"> 
        <div align="center">
          <input type="submit" name="Submit2" value="Update Term of Payment">
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p><br>
</p></form>
<br>
</body>
</html>
