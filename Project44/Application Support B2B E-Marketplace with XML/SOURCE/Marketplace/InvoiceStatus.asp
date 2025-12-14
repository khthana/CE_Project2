<%
session("flag")=true
Function MapMonth(month) ' ใช้เปลี่ยนค่าเดือนเป็นตัวอักษร
						
						select Case month
									Case 1	text="ม.ค."
									Case 2	text="ก.พ."
									Case 3	text="มี.ค."
									Case 4	text="เม.ย."
									Case 5	text="พ.ค."
									Case 6	text="มิ.ย."
									Case 7	text="ก.ค."
									Case 8	text="ส.ค."
									Case 9	text="ก.ย."
									Case 10	text="ต.ค."
									Case 11	text="พ.ย."
									Case 12	text="ธ.ค."
										
						end Select
						MapMonth= text			
end Function

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"
%>

<html>
<head>
<title>Invoice</title>
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
<body bgcolor="#FFFFFF" background="images/bg17.jpg">
<p>&nbsp;</p>
<img src="images/InvoiceStatus.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="693,84,736,126" href="PRStatus.asp">
  <area shape="rect" coords="756,83,801,109" href="POStatus.asp">
  <area shape="rect" coords="815,85,898,120" href="MainMenu.asp">
  <area shape="rect" coords="915,83,989,128" href="SignOut.asp">
</map>
<br>
<br>
<%

InvoiceNo=request("fInvoiceNo")
if InvoiceNo="" then
		InvoiceNo=request.querystring("fInvoiceNo")
else

		SearchResult="Invoice No. ='"&InvoiceNO&"'"

end if

InvoiceStatus=request("fInvoiceStatus")

if InvoiceStatus="" then
		InvoiceStatus=request.querystring("InvoiceStatus")
end if

InvoiceDate=request("fDate")
' ถ้าไม่ได้กด submit ให้เอา Date month year จาก querystring
if InvoiceDate="" then
		InvoiceDate=request.querystring("InvoiceDate")
end if

InvoiceMonth=request("fMonth")
if InvoiceMonth="" then
		InvoiceMonth=request.querystring("InvoiceMonth")
end if

InvoiceYear=request("fYear")
if InvoiceYear="" then
		InvoiceYear=request.querystring("InvoiceYear")
end if

order=request.querystring("order") 'ดูว่าจะเรียงตามอะไร

if order="" then
order="InvoiceDate"
end if

sql="Select  * From Invoice,PO,PR Where   Invoice.POID=PO.POID AND PO.PRID=PR.PRID AND InvoiceNo Like '%"&InvoiceNO&"%'  AND BuyerID="&session("BuyerID")

if InvoiceStatus<>"all" then   'search Status

		if InvoiceStatus="a" then
			sql=sql&" AND  InvoiceState='accepted'"
			SearchResult=SearchResult&" Status='accepted' "
		end if
		
		if InvoiceStatus="r" then
			sql=sql&" AND  InvoiceState='rejected'"
			SearchResult=SearchResult&" Status='rejected' "
		end if
		
		if InvoiceStatus="s" then
			sql=sql&" AND  InvoiceState='sent'"
			SearchResult=SearchResult&" Status='sent' "
		end if
		
		if InvoiceStatus="rec" then
			sql=sql&" AND  InvoiceState='received'"
			SearchResult=SearchResult&" Status='received' "
		end if
		
		if InvoiceStatus="p" then
			sql=sql&" AND  InvoiceState='paid'"
			SearchResult=SearchResult&" Status='paid' "
		end if
		
		if InvoiceStatus="f" then ' ------------------------------  เลือก open&confirm
			sql=sql&" AND   InvoiceState ='fail') "
			SearchResult=SearchResult&" Status='opened' and 'confirmed' "
		end if
		
		if InvoiceStatus="ar" then 
			sql=sql&" AND  InvoiceState in('accepted' ,'rejected')"
			SearchResult=SearchResult&" Status='accepted' and 'rejected' "
		end if
		
		if InvoiceStatus="sr" then 
			sql=sql&" AND  InvoiceState in('sent' ,'received')"
			SearchResult=SearchResult&" Status='sent' and 'received' "
		end if
		
		if InvoiceStatus="pf" then 
			sql=sql&" AND  InvoiceState in('paid' ,'fail')"
			SearchResult=SearchResult&" Status='paid' and 'fail' "
		end if
		
else

		SearchResult=SearchResult&" Status='All' "

end if

if InvoiceDate="" then
		InvoiceDate=0
end if
if InvoiceDate<>0 then 'กรณีที่ใส่ Date เข้ามาด้วย
		sql=sql&"  AND  Day(InvoiceDate)="&InvoiceDate
		SearchResult=SearchResult&" Open Date= '"&InvoiceDate&"'"
end if

if InvoiceMonth="" then
		InvoiceMonth=0
end if
if InvoiceMonth<>0 then 
		sql=sql&"  AND  month(InvoiceDate)="&InvoiceMonth
		SearchResult=SearchResult&" Open Month= '"&mapmonth(Invoicemonth)&"'"
end if

if InvoiceYear="" then
		InvoiceYear=0
end if
if InvoiceYear<>0 then
		sql=sql&"  AND  Year(InvoiceDate)="&InvoiceYear
		SearchResult=SearchResult&" Open Year= '"&Invoiceyear+543&"'"
end if

sql=sql&" order by "&order

Set rsInvoice= Server.CreateObject("ADODB.Recordset") 
rsInvoice.Open sql,conn,1,3

if rsInvoice.EOF then ' ยังไม่เคยมีใบ Invoice ในระบบ%>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000">ไม่มีใบ 
  Invoice</font></b> <br>
  <br>
  <input type="button" value=" BACK " onClick="history.go(-1)" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 9pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px" name="button">
</div>
<%	
else
rsInvoice.moveFirst
%>
<form name="Invoice" method="post" action="InvoiceStatus.asp" >
  <table width="840" border="0" cellspacing="0" cellpadding="0" height="133">
    <tr> 
      <td width="45" height="140">&nbsp;</td>
      <td width="386" height="140"> 
        <table width="95%" border="0" height="59%" align="center">
          <tr> 
            <td><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="993366"><%=session("BizName")%></font><br>
              <br>
              มีจำนวน Invoice 
              <%
		sql="Select  count(*) From Invoice,PO,PR Where   PO.PRID=PR.PRID  AND Invoice.POID=PO.POID AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
              ใบมีสถานะดังนี้</b><b><br>
              <br>
              </b></font> 
              <table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
                <tr> 
                  <td width="30%" height="26"><b><font face="MS Sans Serif, Microsoft Sans Serif">Sent 
                    <%
		sql="Select  count(*) From Invoice,PO,PR Where   PO.PRID=PR.PRID  AND Invoice.POID=PO.POID AND   InvoiceState='sent' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="37%" height="26"><b><font face="MS Sans Serif, Microsoft Sans Serif">Received 
                    <%
		sql="Select  count(*) From Invoice,PO,PR Where   PO.PRID=PR.PRID  AND Invoice.POID=PO.POID AND   InvoiceState='received' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="33%" height="26"><b><font face="MS Sans Serif, Microsoft Sans Serif">Accepted 
                    <%
		sql="Select  count(*) From Invoice,PO,PR Where   PO.PRID=PR.PRID  AND Invoice.POID=PO.POID AND    InvoiceState='accepted' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                </tr>
                <tr> 
                  <td width="30%" height="23"><b><font face="MS Sans Serif, Microsoft Sans Serif">Rejected 
                    <%
		sql="Select  count(*) From Invoice,PO,PR Where   PO.PRID=PR.PRID  AND Invoice.POID=PO.POID AND   InvoiceState='rejected' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="37%" height="23"><b><font face="MS Sans Serif, Microsoft Sans Serif">Paid 
                    <%
		sql="Select  count(*) From Invoice,PO,PR Where   PO.PRID=PR.PRID  AND Invoice.POID=PO.POID AND   InvoiceState='paid' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="33%" height="23"><b><font face="MS Sans Serif, Microsoft Sans Serif">Fail 
                    <%
		sql="Select  count(*) From Invoice,PO,PR Where   PO.PRID=PR.PRID  AND Invoice.POID=PO.POID AND    InvoiceState='fail' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td width="424" height="140"> 
        <table width="100%" border="1" bordercolor="#FFFAEC" height="100%">
          <tr> 
            <td bordercolor="#FFFAEC" height="13"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#DF0070">Invoice 
              Search </font></b> </font></td>
          </tr>
          <tr>
            <td bordercolor="#0000CC" bgcolor="#D5ECFD"> 
              <table width="96%" border="0" cellpadding="0" cellspacing="0" dwcopytype="CopyTableRow" align="center" height="43%" bordercolor="#0000CC">
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="111" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<b>Invoice 
                    No.</b></font></td>
                  <td width="220" height="32" bgcolor="#D5ECFD"> <font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input type="text" name="fInvoiceNo" size="20">
                    </font></td>
                </tr>
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="111" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<b>Invoice 
                    Status</b> </font></td>
                  <td width="220" height="32"> <font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fInvoiceStatus">
                      <option value="all">----------- All ----------</option>
                      <option value="a">Accepted</option>
                      <option value="r">Rejected</option>
                      <option value="s">Sent</option>
                      <option value="rec">Receive</option>
                      <option value="p">Paid</option>
                      <option value="f">Fail</option>
                      <option value="ar">Accepted&amp;Rejected</option>
                      <option value="sr">Sent&amp;Receive</option>
                      <option value="pf">Paid&amp;Fail</option>
                    </select>
                    </font></td>
                </tr>
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="111" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<b>Open 
                    Date</b></font></td>
                  <td width="220" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;วันที่<font color="#000000"> 
                    <select name="fdate" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;   HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
                      <option value="0"></option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                      <option value="13">13</option>
                      <option value="14">14</option>
                      <option value="15">15</option>
                      <option value="16">16</option>
                      <option value="17">17</option>
                      <option value="18">18</option>
                      <option value="19">19</option>
                      <option value="20">20</option>
                      <option value="21">21</option>
                      <option value="22">22</option>
                      <option value="23">23</option>
                      <option value="24">24</option>
                      <option value="25">25</option>
                      <option value="26">26</option>
                      <option value="27">27</option>
                      <option value="28">28</option>
                      <option value="29">29</option>
                      <option value="30">30</option>
                      <option value="31">31</option>
                    </select>
                    </font> เดือน<font color="#000000">
<select name="fmonth" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;  HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
                      <option value="0"></option>
                      <option value="1">ม.ค.</option>
                      <option value="2">ก.พ.</option>
                      <option value="3">มี.ค.</option>
                      <option value="4">เม.ย.</option>
                      <option value="5">พ.ค.</option>
                      <option value="6">มิ.ย.</option>
                      <option value="7">ก.ค.</option>
                      <option value="8">ส.ค.</option>
                      <option value="9">ก.ย.</option>
                      <option value="10">ต.ค.</option>
                      <option value="11">พ.ย.</option>
                      <option value="12">ธ.ค.</option>
                    </select>
                    </font>ปี <font color="#000000"> 
                    <select name="fyear" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;   HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
                      <option value="0"></option>
                      <option value="2002">2545</option>
                      <option value="2003">2546</option>
                      <option value="2004">2547</option>
                    </select>
                    </font></font></td>
                </tr>
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="111" height="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"></font></td>
                  <td width="220" height="2" bgcolor="#D5ECFD"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input type="submit" name="Submit" value="Search" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px">
                    </font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <table width="845" border="0" cellpadding="1" cellspacing="0">
    <tr> 
      <td width="49" height="24"><font face="MS Sans Serif, Microsoft Sans Serif"></font></td>
      <td width="611" height="24"><font face="MS Sans Serif, Microsoft Sans Serif"><b> 
        <font color="993366">Invoice</font>&nbsp; <font color="#0000CC"> 
        <%response.write "<br>"&SearchResult%>
        </font></b></font></td>
      <td height="30" width="179"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>Arrange 
        By</b></font> <font face="MS Sans Serif, Microsoft Sans Serif"><b> 
        <select name="fArrange" style="  FONT-SIZE: 9pt; WIDTH: 90px;  FONT-FAMILY: MS Sans Serif"   onChange="Arrange()">
          <option>--- Select ---</option>
          <option value="3">Invoice No.</option>
          <option value="4">Invoice ID</option>
          <option value="1">Open Date</option>
          <option value="2">Supplier</option>
          <option value="5">Due Date</option>
          <option value="7">Total Price</option>
          <option value="6">Status</option>
        </select>
        </b></font></td>
    </tr>
    <tr> 
      <td width="49" height="69">&nbsp;</td>
      <td height="69" colspan="2"> 
        <table width="99%" border="1" cellspacing="0" cellpadding="0">
          <tr bgcolor="#6601C8"> 
            <td width="53" height="38"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Invoice 
                ID</font></b></font></div>
            </td>
            <td width="68" height="38"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Invoice 
                No. </font></b></font></div>
            </td>
            <td width="196" height="38" bgcolor="#6601C8"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Supplier 
                Name </font></b></font></div>
            </td>
            <td width="58" height="38"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF" size="-1">Due 
                Date</font></b></font></div>
            </td>
            <td width="65" height="38"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF">Open 
                Date</font></b></font></div>
            </td>
            <td width="60" height="38"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Last 
                Update </font></b></font></div>
            </td>
            <td width="69" height="38"> 
              <div align="center"><b><font color="#FFFFFF" size="-1" face="MS Sans Serif, Microsoft Sans Serif">Total 
                Price</font></b></div>
            </td>
            <td width="68" height="38"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Status</font></b></font></div>
            </td>
            <td width="66" height="38"> 
              <div align="center"><font face="Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">P.O. 
                No. </font></b></font></div>
            </td>
            <td width="59" height="38"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF">view 
                </font></b></font></div>
            </td>
          </tr>
          <%Do While not rsInvoice.EOF 
          if rsInvoice("InvoiceState")="rejected"  or rsInvoice("InvoiceState")="fail" then
		  		color="#FF0000"
		else
				color="#000000"
		  end if
		  %>
          <tr> 
            <td width="53" height="28"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                <%=rsInvoice("InvoiceID")%>&nbsp;&nbsp;</font></div>
            </td>
            <td width="68" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-2" color="<%=color%>"> 
                <%
			  if rsInvoice("InvoiceNO")<>"" then
			  			response.write rsInvoice("InvoiceNo")
			  else
			  			response.write "N/A"
			  end if
			  %>
                &nbsp; </font></div>
            </td>
            <td width="196" height="28"> 
              <table width="97%" border="0" align="center">
                <tr> 
                  <td height="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                    <%
			sql="Select BizName From Member Where ID="&rsInvoice("SellerID")
			Set rs2=conn.execute(sql,,cmdText)
			response.write rs2(0)
			%>
                    </font></td>
                </tr>
              </table>
            </td>
            <td width="58" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                <%=day(rsInvoice("DueDate"))%>/<%=month(rsInvoice("DueDate"))%>/<%=year(rsInvoice("DueDate"))-1957%></font></div>
            </td>
            <td width="65" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=day(rsInvoice("InvoiceDate"))%>/<%=month(rsInvoice("InvoiceDate"))%>/<%=year(rsInvoice("InvoiceDate"))-1957%></font> 
              </div>
            </td>
            <td width="60" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=day(rsInvoice("UpdateDate"))%>/<%=month(rsInvoice("UpdateDate"))%>/<%=year(rsInvoice("UpdateDate"))-1957%></font></div>
            </td>
            <td width="69" height="28"> 
              <div align="right"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="<%=color%>"><%=rsInvoice("TotalPrice")%>&nbsp;฿&nbsp;</font></div>
            </td>
            <td width="68" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=rsInvoice("InvoiceState")%></font></div>
            </td>
            <td width="66" height="28"> 
              <div align="center"><font face="Microsoft Sans Serif" size="-2"><a href="ViewPO.asp?poid=<%=rsInvoice("POID")%>" target="_blank"><font color="#0033CC"><b><%=rsInvoice("PONO")%></b></font></a></font></div>
            </td>
            <td width="59" height="28"> 
              <div align="center"><a href="ViewInvoice.asp?invoiceid=<%=rsInvoice("InvoiceID")%>" target="_blank"><img src="images/Invoice1.jpg" width="24" height="28" border="0"></a></div>
            </td>
          </tr>
          <%
		  rsInvoice.moveNext
		  Loop
		  %>
        </table>
      </td>
    </tr>
    <tr> 
      <td width="49" height="22">&nbsp;</td>
      <td height="22" colspan="2">&nbsp; </td>
    </tr>
  </table>
</form>
<%
end if
rsInvoice.close
%>
</body>
</html>
<script language="JavaScript">
<!--


function Arrange(){

	arr=document.Invoice.fArrange.value;
	if (arr=="1"){
			location.href ="InvoiceStatus.asp?order=InvoiceDate&InvoiceNo=<%=InvoiceNo%>&InvoiceStatus=<%=InvoiceStatus%>&InvoiceDate=<%=InvoiceDate%>&InvoiceMonth=<%=InvoiceMonth%>&InvoiceYear=<%=InvoiceYear%>"; 
	}
	if (arr=="2"){
			location.href ="InvoiceStatus.asp?order=SellerID&InvoiceNo=<%=InvoiceNo%>&InvoiceStatus=<%=InvoiceStatus%>&InvoiceDate=<%=InvoiceDate%>&InvoiceMonth=<%=InvoiceMonth%>&InvoiceYear=<%=InvoiceYear%>"; 
	
	}
	if (arr=="3"){
			location.href ="InvoiceStatus.asp?order=InvoiceNo&InvoiceNo=<%=InvoiceNo%>&InvoiceStatus=<%=InvoiceStatus%>&InvoiceDate=<%=InvoiceDate%>&InvoiceMonth=<%=InvoiceMonth%>&InvoiceYear=<%=InvoiceYear%>";  
	}
	if (arr=="4"){
			location.href ="InvoiceStatus.asp?order=InvoiceID&InvoiceNo=<%=InvoiceNo%>&InvoiceStatus=<%=InvoiceStatus%>&InvoiceDate=<%=InvoiceDate%>&InvoiceMonth=<%=InvoiceMonth%>&InvoiceYear=<%=InvoiceYear%>"; 
	}
	if (arr=="6"){
		location.href ="InvoiceStatus.asp?order=InvoiceState&InvoiceNo=<%=InvoiceNo%>&InvoiceStatus=<%=InvoiceStatus%>&InvoiceDate=<%=InvoiceDate%>&InvoiceMonth=<%=InvoiceMonth%>&InvoiceYear=<%=InvoiceYear%>"; 
	}
	if (arr=="7"){
	location.href ="InvoiceStatus.asp?order=TotalPrice Desc&InvoiceNo=<%=InvoiceNo%>&InvoiceStatus=<%=InvoiceStatus%>&InvoiceDate=<%=InvoiceDate%>&InvoiceMonth=<%=InvoiceMonth%>&InvoiceYear=<%=InvoiceYear%>"; 
	}
		if (arr=="5"){
	location.href ="InvoiceStatus.asp?order=DueDate&InvoiceNo=<%=InvoiceNo%>&InvoiceStatus=<%=InvoiceStatus%>&InvoiceDate=<%=InvoiceDate%>&InvoiceMonth=<%=InvoiceMonth%>&InvoiceYear=<%=InvoiceYear%>"; 
	}
}
	
function Conf(object){
		if (confirm ("Do you want to delete  selected Item ?")==true)
		{ return true;}
		return false;
}

function  call_window(goto_url,w,h){
	
	window.open(goto_url,"","width="+w+",height="+h+",left=200,top=100")
	
}



// -->
</script>

