
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
<title>Purchase Request</title>
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
<img src="images/PRStatus.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="660,92,698,113" href="POStatus.asp">
  <area shape="rect" coords="728,91,795,109" href="InvoiceStatus.asp">
  <area shape="rect" coords="814,88,903,115" href="Mainmenu.asp">
  <area shape="rect" coords="919,87,989,113" href="Signout.asp">
</map>
<%
PRNo=request("fPRNo")
if PRNo="" then
		PRNo=request.querystring("PRNo")
		'SearchResult="P.R.No ='"&PRNO&"'"
else

		SearchResult="P.R.No ='"&PRNO&"'"

end if

PRStatus=request("fPRStatus")

if PRStatus="" then
		PRStatus=request.querystring("PRStatus")
end if

PRDate=request("fDate")
' ถ้าไม่ได้กด submit ให้เอา Date month year จาก querystring
if PRDate="" then
		PRDate=request.querystring("PRDate")
end if

PRMonth=request("fMonth")
if PRMonth="" then
		PRMonth=request.querystring("PRMonth")
end if

PRYear=request("fYear")
if PRYear="" then
		PRYear=request.querystring("PRYear")
end if

order=request.querystring("order") 'ดูว่าจะเรียงตามอะไร
if order="" then
order="PRFullDate"
end if

sql="Select  * From PR Where   PRNo Like '%"&PRNO&"%'  AND BuyerID="&session("BuyerID")

if PRStatus<>"all" then   'search Status
		if PRStatus="a" then
			sql=sql&" AND PRStatus='accepted'"
			SearchResult=SearchResult&" Status='accepted' "

		end if
		if PRStatus="r" then
			sql=sql&" AND PRStatus='rejected'"
			SearchResult=SearchResult&" Status='rejected' "
		end if
		if PRStatus="d" then
			sql=sql&" AND PRStatus='deleted'"
			SearchResult=SearchResult&" Status='deleted' "
		end if
		if PRStatus="c" then
			sql=sql&" AND PRStatus='confirmed'"
			SearchResult=SearchResult&" Status='confirmed' "
		end if
		if PRStatus="o" then
			sql=sql&" AND PRStatus='opened'"
			SearchResult=SearchResult&" Status='opened' "
		end if
			if PRStatus="oc" then 'เลือก open&confirm
			sql=sql&" AND  PRStatus in ('opened' ,'confirmed') "
			SearchResult=SearchResult&" Status='opened' and 'confirmed' "
		end if
			if PRStatus="ar" then ' เลือก accept&reject
			sql=sql&" AND  PRStatus in('accepted' ,'rejected')"
			SearchResult=SearchResult&" Status='accepted' and 'rejected' "
		end if
else
		SearchResult=SearchResult&" Status='All' "
end if

if PRDate="" then
		PRDate=0
end if
if PRDate<>0 then 'กรณีที่ใส่ Date เข้ามาด้วย
		sql=sql&"  AND  Day(PRFullDate)="&PRdate
		SearchResult=SearchResult&" วันที่เปิด= '"&PRdate&"'"
end if

if PRMonth="" then
		PRMonth=0
end if
if PRMonth<>0 then 
		sql=sql&"  AND  month(PRFullDate)="&PRMonth
		SearchResult=SearchResult&" เดือนที่เปิด= '"&mapmonth(PRmonth)&"'"
end if

if PRYear="" then
		PRYear=0
end if
if PRYear<>0 then
		sql=sql&"  AND  Year(PRFullDate)="&PRYear
		SearchResult=SearchResult&" ปีที่เปิด= '"&PRyear+543&"'"
end if

sql=sql&" order by "&order

Set rsPR=conn.Execute(sql,,CmdText)
if rsPR.EOF then ' ยังไม่เคยมีใบ PR ในระบบ%>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center"> <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000">ไม่มีใบ 
  Purchase Request</font></b> <br>
  <br>
  <input type="button" value=" BACK " onClick="history.go(-1)" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 9pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px" name="button">
</div>
<%	
else
rsPR.moveFirst
%>
<form name="PR" method="post" action="PRStatus.asp" >
  <table width="853" border="0" cellspacing="0" cellpadding="0" height="140">
    <tr> 
      <td width="44" height="161">&nbsp;</td>
      <td width="404" height="161"> 
        <table width="90%" border="0" align="center" height="100%" cellspacing="0">
          <tr> 
            <td height="149"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="993366"><%=session("BizName")%></font><br>
              <br>
              มีจำนวน P.R. 
              <%
		sql="Select  count(*) From PR Where   BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
              ใบ </b><b> &nbsp;มีสถานะดังนี้<br>
              <br>
              </b></font> 
              <table width="99%" border="0" cellspacing="0" cellpadding="0" align="left">
                <tr> 
                  <td width="30%" height="30"><b><font face="MS Sans Serif, Microsoft Sans Serif">Opened 
                    <%
		sql="Select  count(*) From PR Where   PRStatus='opened' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="37%" height="30"><b><font face="MS Sans Serif, Microsoft Sans Serif">Comfirmed 
                    <%
		sql="Select  count(*) From PR Where   PRStatus='confirmed' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="33%" height="30"><b><font face="MS Sans Serif, Microsoft Sans Serif">Accepted 
                    <%
		sql="Select  count(*) From PR Where   PRStatus='accepted' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                </tr>
                <tr> 
                  <td width="30%" height="30"><b><font face="MS Sans Serif, Microsoft Sans Serif">Rejected 
                    <%
		sql="Select  count(*) From PR Where   PRStatus='rejected' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="37%" height="30"><b><font face="MS Sans Serif, Microsoft Sans Serif">Deleted 
                    <%
		sql="Select  count(*) From PR Where   PRStatus='deleted' AND BuyerID="&session("BuyerID")
		Set rs=conn.Execute(sql,,CmdText)
		response.write(rs(0))
		rs.close
		%>
                    </font></b></td>
                  <td width="33%" height="30"><b></b></td>
                </tr>
              </table>
           
              <div align="left"><br>
                <font face="MS Sans Serif, Microsoft Sans Serif"><b><br>
                </b></font></div>
            </td>
          </tr>
        </table>

      </td>
      <td height="161" width="403"> 
        <table width="96%" border="1" height="166" bordercolor="FFFAEC">
          <tr> 
            <td height="17"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#DF0070">Purches 
              Request Search</font><font color="#000099"> </font></b> </font></td>
          </tr>
          <tr>
            <td height="128" bordercolor="#0000CC" bgcolor="#D5ECFD"> 
              <table width="98%" border="0" cellpadding="0" cellspacing="0" dwcopytype="CopyTableRow" align="center" height="100%" bordercolor="#0000CC">
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="91" height="30"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<b>P.R. 
                    No.</b></font></td>
                  <td width="227" height="30" bgcolor="#D5ECFD"> <font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input type="text" name="fPRNo" size="20">
                    </font></td>
                </tr>
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="91" height="29"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<b>P.R. 
                    Status</b> </font></td>
                  <td width="227" height="29"> <font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fPRStatus">
                      <option value="all">----------- All ----------</option>
                      <option value="a">Accepted</option>
                      <option value="r">Rejected</option>
                      <option value="o">Opened</option>
                      <option value="c">Confirmed</option>
                      <option value="d">Deleted</option>
                      <option value="oc">Opened&amp;Confirmed</option>
                      <option value="ar">Accepted&amp;Rejected</option>
                    </select>
                    </font></td>
                </tr>
                <tr bordercolor="#FFFFFF" bgcolor="#D5ECFD"> 
                  <td width="91" height="30"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;<b>Open 
                    Date</b></font></td>
                  <td width="227" height="30"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;วันที่<font color="#000000"> 
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
                  <td width="91" height="30" bgcolor="#D5ECFD"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"></font></td>
                  <td width="227" height="30" bgcolor="#D5ECFD"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
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
  <table width="867" border="0" cellpadding="1" cellspacing="0">
    <tr> 
      <td width="62" height="24"><font face="MS Sans Serif, Microsoft Sans Serif"></font></td>
      <td width="595" height="24"><font face="MS Sans Serif, Microsoft Sans Serif"><font color="993366"><b>Purchase 
        Request</b></font><b>&nbsp; 
        <%response.write "<br><font color='0000cc'>"&SearchResult%>
        </b></font></td>
      <td height="30" width="204"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font size="-1">Arrange 
        By</font></b></font> <font face="MS Sans Serif, Microsoft Sans Serif"><b> 
        <select name="fArrange" style="  FONT-SIZE: 9pt; WIDTH: 90px;  FONT-FAMILY: MS Sans Serif"   onChange="Arrange()">
          <option>--- Select ---</option>
          <option value="4">P.R. ID</option>
          <option value="1">Open Date</option>
          <option value="2">Supplier</option>
          <option value="3">PR No.</option>
          <option value="7">Total Price</option>
          <option value="6">Status</option>
        </select>
        </b></font></td>
    </tr>
    <tr> 
      <td width="62" height="69">&nbsp;</td>
      <td height="69" colspan="2"> 
        <table width="96%" border="1" cellspacing="0" cellpadding="0">
          <tr bgcolor="#6601C8"> 
            <td width="51"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">P.R. 
                ID</font></b></font></div>
            </td>
            <td width="68"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">P.R. 
                No. </font></b></font></div>
            </td>
            <td width="234" bgcolor="#6601C8"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Supplier 
                Name </font></b></font></div>
            </td>
            <td width="55" height="26"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF" size="-1">No.Line</font></b></font></div>
            </td>
            <td width="73" height="26"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF">Open 
                Date</font></b></font></div>
            </td>
            <td width="74"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Last 
                Update </font></b></font></div>
            </td>
            <td width="79"> 
              <div align="center"><b><font color="#FFFFFF" size="-1" face="MS Sans Serif, Microsoft Sans Serif">Total 
                Price</font></b></div>
            </td>
            <td width="65"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">Status</font></b></font></div>
            </td>
            <td width="50"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF">View</font></b></font></div>
            </td>
          </tr>
          <%Do While not rsPR.EOF 
          if rsPR("PRStatus")="rejected" then
		  		color="#FF0000"
		else
				color="#000000"
		  end if
		  %>
          <tr> 
            <td width="51" height="28"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                <%=rsPR("PRID")%>&nbsp;&nbsp;</font></div>
            </td>
            <td width="68" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-2" color="<%=color%>"> 
                <%
			  if rsPR("PRNO")<>"" then
			  			response.write rsPR("PRNo")
			  else
			  			response.write "N/A"
			  end if
			  %>
                </font></div>
            </td>
            <td width="234" height="28"> 
              <table width="97%" border="0" align="center">
                <tr> 
                  <td height="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                    <%
			sql="Select BizName From Member Where ID="&rsPR("SellerID")
			Set rs2=conn.execute(sql,,cmdText)
			response.write rs2(0)
			%>
                    </font></td>
                </tr>
              </table>
            </td>
            <td width="55" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"> 
                <%
			sql="Select Count(*) From OrderDetail Where PRID="&rsPR("PRID")
			Set rs2=conn.execute(sql,,cmdText)
			response.write rs2(0)
			rs2.close
			%>
                </font></div>
            </td>
            <td width="73" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=day(rsPR("PRFullDate"))%>/<%=month(rsPR("PRFullDate"))%>/<%=year(rsPR("PRFullDate"))-1957%></font> 
              </div>
            </td>
            <td width="74" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=day(rsPR("UpdateFullDate"))%>/<%=month(rsPR("UpdateFullDate"))%>/<%=year(rsPR("UpdateFullDate"))-1957%></font></div>
            </td>
            <td width="79" height="28"> 
              <div align="right"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="<%=color%>"><%=rsPR("PRTotal")%>&nbsp;฿&nbsp;</font></div>
            </td>
            <td width="65" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="<%=color%>"><%=rsPR("PRStatus")%></font></div>
            </td>
            <td width="50" height="28"> 
              <div align="center"><a target="_blank" href="ViewPR.asp?prid=<%=rsPR("PRID")%>"><img src="images/PR.jpg" width="24" height="28" border="0"></a></div>
            </td>
          </tr>
          <%
		  rsPR.moveNext
		  Loop
		  %>
        </table>
      </td>
    </tr>
    <tr> 
      <td width="62" height="22">&nbsp;</td>
      <td height="22" colspan="2">&nbsp; </td>
    </tr>
  </table>
</form>
<%
end if
rsPR.close
%>
</body>
</html>
<script language="JavaScript">
<!--


function Arrange(){

	arr=document.PR.fArrange.value;
	if (arr=="1"){
			location.href ="PRStatus.asp?order=PRFullDate&PRNo=<%=PRNo%>&PRStatus=<%=PRStatus%>&PRDate=<%=PRDate%>&PRMonth=<%=PRMonth%>&PRYear=<%=PRYear%>"; 
	}
	if (arr=="2"){
			location.href ="PRStatus.asp?order=SellerID&PRNo=<%=PRNo%>&PRStatus=<%=PRStatus%>&PRDate=<%=PRDate%>&PRMonth=<%=PRMonth%>&PRYear=<%=PRYear%>"; 
	
	}
	if (arr=="3"){
			location.href ="PRStatus.asp?order=PRNo&PRNo=<%=PRNo%>&PRStatus=<%=PRStatus%>&PRDate=<%=PRDate%>&PRMonth=<%=PRMonth%>&PRYear=<%=PRYear%>";  
	}
	if (arr=="4"){
			location.href ="PRStatus.asp?order=PRID&PRNo=<%=PRNo%>&PRStatus=<%=PRStatus%>&PRDate=<%=PRDate%>&PRMonth=<%=PRMonth%>&PRYear=<%=PRYear%>"; 
	}
	if (arr=="6"){
		location.href ="PRStatus.asp?order=PRStatus&PRNo=<%=PRNo%>&PRStatus=<%=PRStatus%>&PRDate=<%=PRDate%>&PRMonth=<%=PRMonth%>&PRYear=<%=PRYear%>"; 
	}
	if (arr=="7"){
	location.href ="PRStatus.asp?order=PRTotal Desc&PRNo=<%=PRNo%>&PRStatus=<%=PRStatus%>&PRDate=<%=PRDate%>&PRMonth=<%=PRMonth%>&PRYear=<%=PRYear%>"; 
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

