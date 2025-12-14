
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
<title>Purchase Order</title>
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
<img src="images/POStatus.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="642,85,685,111" href="PRStatus.asp">
  <area shape="rect" coords="707,86,776,121" href="InvoiceStatus.asp">
  <area shape="rect" coords="801,85,890,124" href="MainMenu.asp">
  <area shape="rect" coords="916,85,989,117" href="Signout.asp">
</map>
<br>
<%

PONo=request("fPONo")
if PONo="" then
		PONo=request.querystring("PONo")
else
SearchResult="P.O.No ='"&PONO&"'"
end if

POStatus=request("fPOStatus")

if POStatus="" then
		POStatus=request.querystring("POStatus")
end if

PODate=request("fDate")

' ถ้าไม่ได้กด submit ให้เอา Date month year จาก querystring
if PODate="" then
		PODate=request.querystring("PODate")
end if

POMonth=request("fMonth")
if POMonth="" then
		POMonth=request.querystring("POMonth")
end if

POYear=request("fYear")
if POYear="" then
		POYear=request.querystring("POYear")
end if

order=request.querystring("order") 'ดูว่าจะเรียงตามอะไร
if order="" then
order="POFullDate"
end if

sql="Select  * From PO,PR  Where   PO.PRID=PR.PRID  AND PONo Like '%"&PONO&"%'  AND BuyerID="&session("BuyerID")
	
if POStatus<>"all" then   'search Status
		if POStatus="a" then
			sql=sql&" AND POStatus='accepted'"
			SearchResult=SearchResult&" Status='accepted' "
		end if

		if POStatus="rej" then
			sql=sql&" AND POStatus='rejected'"
			SearchResult=SearchResult&" Status='rejected' "
		end if
		
		if POStatus="s" then
			sql=sql&" AND POStatus='sent'"
			SearchResult=SearchResult&" Status='sent' "
		end if

		if POStatus="rec" then
			sql=sql&" AND POStatus='received'"
			SearchResult=SearchResult&" Status='received' "
		end if

		if POStatus="d" then
			sql=sql&" AND POStatus='delivered'"
			SearchResult=SearchResult&" Status='delivered' "
		end if
			if POStatus="pd" then 'เลือก open&confirm
			sql=sql&" AND  POStatus ='partially delivered'  "
			SearchResult=SearchResult&" Status='partially received' "
		end if
			if POStatus="ar" then ' เลือก accept&reject
			sql=sql&" AND  POStatus in('accepted' ,'rejected')"
			SearchResult=SearchResult&" Status='accepted' or 'rejected' "
		end if
else
		SearchResult=SearchResult&" Status='All' "
end if


if PODate="" then
		PODate=0
end if

if PODate<>0 then 'กรณีที่ใส่ Date เข้ามาด้วย
		sql=sql&"  AND  day(POFullDate)="&POdate
		SearchResult=SearchResult&" Open Date= '"&POdate&"'"
end if

if POMonth="" then
		POMonth=0
end if

if POMonth<>0 then 'กรณีที่ใส่ Month เข้ามาด้วย
		sql=sql&"  AND  Month(POFullDate)="&POMonth
		SearchResult=SearchResult&" Open Month= '"&mapMonth(POMonth)&"'"
end if

if POYear="" then
		POYear=0
end if
if POYear<>0 then 'กรณีที่ใส่ year เข้ามาด้วย
		sql=sql&"  AND  year(POFullDate)="&POYear
		SearchResult=SearchResult&" Open Year= '"&POYear&"'"
end if
sql=sql&" order by "&order


Set rsPO=conn.Execute(sql,,CmdText)

if rsPO.EOF then ' ยังไม่เคยมีใบ PO ในระบบ

%>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000">ไม่มีใบ 
  Purchase Order</font></b> <br>
  <br>
  <input type="button" value=" BACK " onClick="history.go(-1)" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 9pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px" name="button">
</div>
<%	
else
rsPO.moveFirst
%>
<form name="PO" method="post" action="POStatus.asp" >
  <table width="869" border="0" cellspacing="0" cellpadding="0" height="120">
    <tr> 
      <td width="46" height="147">&nbsp;</td>
      <td width="416" height="147"> 
        <table width="95%" border="0" height="100%" align="center" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="100%"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="993366"><%=session("BizName")%></font><br>
              <br>
              </b></font><b>มีจำนวน P.O. 
              <%
		sql="Select  count(*) From PO,PR  Where  PO.PRID=PR.PRID AND  BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		
		%>
              ใบ </b><font face="MS Sans Serif, Microsoft Sans Serif"><b><font face="m"> 
              &nbsp;&nbsp; </font><font face="m">มีสถานะดังนี้ <br>
              <br>
              </font></b> </font> 
              <table width="101%" border="0" cellspacing="0" cellpadding="0" align="left">
                <tr> 
                  <td width="27%" height="30"><b><font face="Microsoft Sans Serif">Sent 
                    <%
		sql="Select  count(*) From PO,PR  Where  PR.PRID=PO.PRID AND   POStatus='sent' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="28%" height="30"><b><font face="Microsoft Sans Serif">Received 
                    <%
		sql="Select  count(*) From PO,PR  Where  PR.PRID=PO.PRID AND   POStatus='received' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="45%" height="30"><b><font face="Microsoft Sans Serif">Delivered 
                    <%
		sql="Select  count(*) From PO,PR  Where  PR.PRID=PO.PRID AND   POStatus='delivered' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                </tr>
                <tr> 
                  <td width="27%" height="30"><b><font face="Microsoft Sans Serif">Accepted 
                    <%
		sql="Select  count(*) From PO,PR  Where  PR.PRID=PO.PRID AND   POStatus='accepted' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="28%" height="30"><b><font face="Microsoft Sans Serif">Rejected 
                    <%
		sql="Select  count(*) From PO,PR  Where  PR.PRID=PO.PRID AND   POStatus='rejected' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="45%" height="30"><b><font face="Microsoft Sans Serif">Partially 
                    Delivered 
                    <%
		sql="Select  count(*) From PO,PR  Where  PR.PRID=PO.PRID AND   POStatus='partially delivered' AND BuyerID="&session("BuyerID")
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
      <td bgcolor="#FFFAEC" width="424" height="147"> 
        <table width="95%" border="1" height="100%" bordercolor="#FFFAEC">
          <tr> 
            <td height="11"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#DF0070">Purchase 
              Order Search</font><font  face="MS Sans Serif, Microsoft Sans Serif"> 
              </font></b></td>
          </tr>
          <tr> 
            <td height="121" bordercolor="#0000CC" bgcolor="#D5ECFD"> 
              <table width="95%" border="0" cellpadding="0" cellspacing="1" dwcopytype="CopyTableRow" align="center" height="34%" bordercolor="#0000CC">
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="91" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#000066">&nbsp;&nbsp;&nbsp;<b>P.O. 
                    No.</b></font></td>
                  <td width="227" height="32" bgcolor="#D5ECFD"> <font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input type="text" name="fPONo" size="17">
                    </font></td>
                </tr>
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="91" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#000066">&nbsp;&nbsp;&nbsp;</font><font color="#000066"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">Status</font></b></font></td>
                  <td width="227" height="32"> <font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fPOStatus">
                      <option value="all">----------- All ----------</option>
                      <option value="a">Accepted</option>
                      <option value="rej">Rejected</option>
                      <option value="s">Sent</option>
                      <option value="rec">Received</option>
                      <option value="d">Delivered</option>
                      <option value="pd">Partially Delivered</option>
                      <option value="ar">Accepted or Rejected</option>
                    </select>
                    </font></td>
                </tr>
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="91" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#000066">&nbsp;&nbsp;&nbsp;<b>Open 
                    Date</b></font></td>
                  <td width="227" height="32"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;วันที่<font color="#000000"> 
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
                    </font> เดือน <font color="#000000"> 
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
                  <td width="91" height="8"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"></font></td>
                  <td width="227" height="8" bgcolor="#D5ECFD"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
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
  <table width="848" border="0" cellpadding="1" cellspacing="0">
    <tr> 
      <td width="53" height="4"><font face="MS Sans Serif, Microsoft Sans Serif"></font></td>
      <td width="572" height="35"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="993366">Purchase 
        Order</font> <font color="#0000CC"> 
        <%response.write "<br>"&SearchResult%>
        </font></b></font></td>
      <td height="4" width="217"> 
        <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>Arrange 
          By</b></font> <font face="MS Sans Serif, Microsoft Sans Serif"><b> 
          <select name="fArrange" style="  FONT-SIZE: 9pt; WIDTH: 90px;  FONT-FAMILY: MS Sans Serif"   onChange="Arrange()">
            <option>--- Select ---</option>
            <option value="4">P.O. ID</option>
            <option value="1">Open Date</option>
            <option value="2">Supplier</option>
            <option value="3">PO No.</option>
            <option value="7">Total Price</option>
            <option value="6">Status</option>
          </select>
          </b></font> </div>
      </td>
    </tr>
    <tr> 
      <td width="53" height="69">&nbsp;</td>
      <td height="69" colspan="2"> 
        <table width="100%" border="1" cellspacing="0" cellpadding="0">
          <tr bgcolor="#6601C8"> 
            <td width="53"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">P.O. 
                ID</font></b></font></div>
            </td>
            <td width="74"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">P.O. 
                No. </font></b></font></div>
            </td>
            <td width="219" bgcolor="#6601C8"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Supplier 
                Name </font></b></font></div>
            </td>
            <td width="58" height="26"> 
              <div align="center"><font face="Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">No.Line</font></b></font></div>
            </td>
            <td width="66" height="26"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF">Open 
                Date</font></b></font></div>
            </td>
            <td width="74" bgcolor="#6601C8"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Last 
                Update </font></b></font></div>
            </td>
            <td width="78"> 
              <div align="center"><b><font color="#FFFFFF" size="-1" face="MS Sans Serif, Microsoft Sans Serif">Total 
                Price</font></b></div>
            </td>
            <td width="86"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Status</font></b></font></div>
            </td>
            <td width="63"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF">View 
                </font></b></font></div>
            </td>
          </tr>
          <%Do While not rsPO.EOF 
          if rsPO("POStatus")="rejected" then
		  		color="#FF0000"
		else
				color="#000000"
		  end if
		  %>
          <tr> 
            <td width="53" height="28"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=rsPO("POID")%>&nbsp;&nbsp;</font></div>
            </td>
            <td width="74" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-2" color="<%=color%>"> 
                <%

			  			response.write rsPO("PONo")
			  %>
                </font></div>
            </td>
            <td width="219" height="28"> 
              <table width="97%" border="0" align="center">
                <tr> 
                  <td height="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                    <%
			sql="Select BizName From Member Where ID="&rsPO("SellerID")
			Set rs=conn.execute(sql,,cmdText)
			response.write rs(0)
			%>
                    </font></td>
                </tr>
              </table>
            </td>
            <td width="58" height="28"> 
              <div align="center"><font face="Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                <%
			'response.write rsPO("SellerID")
			sql="Select PRID From PO Where POID="&rsPO("POID")
			Set rs3=conn.execute(sql,,cmdText)
			PRID=rs3(0)
			
			sql="Select Count(*) From OrderDetail  Where PRID="&PRID
			'response.write sql
			'response.end
			Set rs2=conn.execute(sql,,cmdText)
			response.write rs2(0)
			rs2.close
			%>
                </font></div>
            </td>
            <td width="66" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=day(rsPO("POFullDate"))%>/<%=month(rsPO("POFullDate"))%>/<%=year(rsPO("POFullDate"))-1957%></font> 
              </div>
            </td>
            <td width="74" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=day(rsPO("UpdateDate"))%>/<%=month(rsPO("UpdateDate"))%>/<%=year(rsPO("UpdateDate"))-1957%></font></div>
            </td>
            <td width="78" height="28"> 
              <div align="right"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="<%=color%>"><%=rsPO("PRTotal")%>&nbsp;฿&nbsp;</font></div>
            </td>
            <td width="86" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=rsPO("POStatus")%></font></div>
            </td>
            <td width="63" height="28"> 
              <div align="center"><b><a target="_blank" href="ViewPO.asp?poid=<%=rsPO("POID")%>"><img src="images/PO.jpg" border="0"></a></b></div>
            </td>
          </tr>
          <%
		  rsPO.moveNext
		  Loop
		  %>
        </table>
      </td>
    </tr>
    <tr> 
      <td width="53" height="22">&nbsp;</td>
      <td height="22" colspan="2">&nbsp; </td>
    </tr>
  </table>
</form>
<%
end if
rsPO.close
%>
</body>
</html>
<script language="JavaScript">
<!--


function Arrange(){
	
	switch(document.PO.fArrange.value){
	case "1" :	location.href ="POStatus.asp?order=POFullDate&PONo=<%=PONo%>&POStatus=<%=POStatus%>&PODate=<%=PODate%>&POMonth=<%=POMonth%>&POYear=<%=POYear%>";  
	case "2":	location.href ="POStatus.asp?order=SellerID&PONo=<%=PONo%>&POStatus=<%=POStatus%>&PODate=<%=PODate%>&POMonth=<%=POMonth%>&POYear=<%=POYear%>";  
	case "3":	location.href ="POStatus.asp?order=PONo&PONo=<%=PONo%>&POStatus=<%=POStatus%>&PODate=<%=PODate%>&POMonth=<%=POMonth%>&POYear=<%=POYear%>"; 
	case "4":	location.href ="POStatus.asp?order=POID&PONo=<%=PONo%>&POStatus=<%=POStatus%>&PODate=<%=PODate%>&POMonth=<%=POMonth%>&POYear=<%=POYear%>";  
	case "6":	location.href ="POStatus.asp?order=POStatus&PONo=<%=PONo%>&POStatus=<%=POStatus%>&PODate=<%=PODate%>&POMonth=<%=POMonth%>&POYear=<%=POYear%>";  
	case "7":	location.href ="POStatus.asp?order=PRTotal Desc&PONo=<%=PONo%>&POStatus=<%=POStatus%>&PODate=<%=PODate%>&POMonth=<%=POMonth%>&POYear=<%=POYear%>";  
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

