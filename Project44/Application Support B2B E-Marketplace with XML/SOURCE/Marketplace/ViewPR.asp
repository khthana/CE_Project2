
<%

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
						response.write text			
end Function

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

PRID=request.querystring("prid")

sql="Select * from PR,Member where   SellerID=ID  and PRID="&PRID

Set rsPR= Server.CreateObject("ADODB.Recordset") 
 rsPR.Open sql,conn,1,3


if  not rsPR.EOF then  'ถ้า PR ที่เลือกเข้ามามีใน Database
%>

<html>
<head>
<title>Purchase Order ID.&nbsp;<%=PRID%></title>
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
<body  background="images/bg17.jpg">
<form name="PR" method="post" action="UpdatePR.asp">
  <div align="center"><br>
    <table width="680" border="0" bordercolor="0">
      <tr> 
        <td height="12" colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FF0000">Status 
          :&nbsp;<%=rsPR("PRStatus")%> </font></b> <font face="Microsoft Sans Serif" color="#FF0000"> 
          <b> 
          <%
		  if rsPR("PRStatus")="rejected" then
		 		response.write "&nbsp;เนื่องจาก"& rsPR("PRComment") 
		  end if%>
          </b></font></font><font color="#FF0000"></font></td>
        <td colspan="2" width="32%" height="12"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <%
	sql="Select * From Member,Province  Where Province.ProvinceID=Member.ProvinceID and  ID="&rsPR("BuyerID")
	  Set rs= Server.CreateObject("ADODB.Recordset") 
  	  rs.Open sql,conn,1,3
	'set rs=conn.Execute(sql,,CmdText)
	response.write rs("BizName")
	%>
          </font></b></td>
      </tr>
      <tr> 
        <td height="2" width="7%"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"> 
            <%
		   if rsPR("PRStatus")="accepted" then 
		  sql="select PONO,POID From PO  Where PRID="&PRID
		  set rs1=conn.execute(sql,,cmdText)
		  %>
            <a href="ViewPO.asp?POid=<%=rs1(1)%>"><img src="images/PO.jpg" border="0"></a><br>
<b><font color="#0000CC" size="-2">
<%=rs1(0)%></font> </b> 
            <%
		  end if
		  		
		  %>
            </font></div>
        </td>
        <td height="2" width="61%">&nbsp;</td>
        <td height="2" colspan="2" width="32%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rs("BizAddress")%><%="<br>จังหวัด"&rs("ProvinceName")&" "&rs("Zip")%></font></b></td>
      </tr>
      <tr> 
        <td width="7%">&nbsp;</td>
        <td width="61%">&nbsp;</td>
        <td colspan="2" width="32%">&nbsp;</td>
      </tr>
      <tr> 
        <td colspan="4"> 
          <div align="center"><font color="993366"><b><font face="MS Sans Serif, Microsoft Sans Serif">ใบขอสั่งซื้อ</font></b></font></div>
        </td>
      </tr>
      <tr> 
        <td colspan="4"> 
          <div align="center"><font color="993366"><b><font face="MS Sans Serif, Microsoft Sans Serif">Purchase 
            Request </font></b></font></div>
        </td>
      </tr>
      <tr> 
        <td colspan="4"> 
          <hr>
        </td>
      </tr>
    </table>
    <table width="680" border="0">
      <tr> 
        <td height="31" width="72"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">ผู้ขาย&nbsp; 
          <br>
          <font size="-2">SUPPLIER</font><br>
          </font></b></td>
        <td width="375" height="31"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b></b>:&nbsp;<%=rsPR("BizName")%></font></td>
        <td width="84" height="31"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">เลขที่ 
          <br>
          <font size="-2">P.R. NO.</font></font></b></td>
        <td width="131" height="31"><font face="MS Sans Serif, Microsoft Sans Serif"><font size="-1"> 
          : 
          <%
			  if rsPR("PRStatus")="opened" then
			  %>
          <font size="-1" color="#FF0000"><%="wait"%></font> 
          <%
				else
					response.write rsPR("PRNo")
				end if
			  %>
          </font></font></td>
      </tr>
      <tr> 
        <td height="58" rowspan="4"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>สถานที่ส่ง<font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <br>
          <font size="-2">SHIP TO</font></font></b></font></td>
        <td rowspan="4" height="58"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <% 
	if rsPR("PRStatus")="opened"  or   rsPR("PRStatus")="confirmed" then%>
          <textarea name="Address" cols="25" rows="3" ><%=rsPR("PRAddress")%></textarea>
          <%
	else
			Address=rsPR("PRAddress")%>
          <input type="hidden" name="Address" value="<%=Address%>">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=": "&address%></font></td>
            </tr>
          </table>
          <%
	end if
	%>
          </font></td>
        <td width="84" height="17"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">วันที่ออก</font> 
          <font size="-1" face="MS Sans Serif, Microsoft Sans Serif"><br>
          <font size="-2">OPEN DATE</font> </font></b></td>
        <td width="131" height="17"><font face="MS Sans Serif, Microsoft Sans Serif"><font size="-1">:</font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <%=formatDateTime(rsPR("PRFullDate"),1)%></font></font></td>
      </tr>
      <tr> 
        <td width="84" height="18"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">กำหนดชำระ 
          <br>
          <font size="-2">TERMS</font></font></b></td>
        <td width="131" height="18"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">: 
          <%=rsPR("PRTerm")%>&nbsp;วัน</font></td>
      </tr>
      <tr> 
        <td width="84" height="8"><b><font face="Microsoft Sans Serif" size="-1">วิธีการขนส่ง<br>
          <font size="-2">SHIP METHOD</font> </font></b></td>
        <td width="131" height="8"><font face="Microsoft Sans Serif" size="-1">: 
          <%
		  if  rsPR("ShipMethod")="Sent" then
		  		response.write  "ส่งโดยผู้ขาย"
		  else
		  		response.write rsPR("ShipMethod")
		  end if
		  %>
          </font></td>
      </tr>
      <tr> 
        <td width="84" height="2">&nbsp;</td>
        <td width="131" height="2">&nbsp;</td>
      </tr>
    </table>
    <%
	if rsPR("PRStatus")="opened"  or  rsPR("PRStatus")="confirmed" then  '----------------------------------   ถ้าสถานะยังเป็น Open และ Confirm  จะสามารถแก้ไขได้%>
    <input type="hidden" name="PRID" value="<%=PRID%>">
    <table width="680" border="1" cellpadding="0" cellspacing="0" height="109">
      <tr bgcolor="#6601C8"> 
        <td width="127" height="35"> 
          <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">รายการ<br>
            <font size="-2">ITEM</font></font></b></div>
        </td>
        <td width="154" height="35"> 
          <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">กำหนดส่งของ<br>
            <font size="-2">NEED DATE</font></font></b></div>
        </td>
        <td width="66" height="35"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">หน่วย<br>
            <font size="-2">UNIT</font></font></b></font></div>
        </td>
        <td width="87" height="35"> 
          <div align="center"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">จำนวนหน่วย<br>
            <font size="-2">QUANTITY</font> </font></b></div>
        </td>
        <td width="71" height="35"> 
          <div align="center"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">หน่วยละ</font><font color="#FFFFFF" size="-2"><br>
            UNIT PRICE</font><font color="#FFFFFF"> </font></b></font></div>
        </td>
        <td width="96" height="35"> 
          <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">จำนวนเงิน</font><font face="MS Sans Serif, Microsoft Sans Serif" size="-2" color="#FFFFFF"><br>
            AMOUNT</font></b></div>
        </td>
        <td width="63" height="35"> 
          <div align="center"><font color="#FFFFFF" face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>ลบ<br>
            <font size="-2">DELETE</font></b></font></div>
        </td>
      </tr>
      <%
  sql="select * From OrderDetail  Where PRID="&rsPR("PRID")
  Set rsDetail= Server.CreateObject("ADODB.Recordset") 
  rsDetail.Open sql,conn,1,3
 NoItem= rsDetail.recordCount
 do while not rsDetail.EOF 
  %>
      <tr> 
        <td width="127" height="36"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;<%=rsDetail("OrderName")%> 
          <input type="hidden" name="ShipPrice<%=rsDetail("Line")%>" value="<%=rsDetail("OrderShipPrice")%>">
          </font></td>
        <td width="154" height="36"> 
          <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            <select name="day<%=rsDetail("Line")%>" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;   HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
              <option value="<%=day(rsDetail("NeedDate"))%>"><%=day(rsDetail("NeedDate"))%></option>
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
            </font> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            <select name="month<%=rsDetail("Line")%>" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;  HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
              <option value="<%=month(rsDetail("NeedDate"))%>"> 
              <%MapMonth(month(rsDetail("NeedDate")))%>
              </option>
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
            </font> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            <select name="year<%=rsDetail("Line")%>" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;   HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
              <option value="<%=year(rsDetail("NeedDate"))-2001%>"><%=year(rsDetail("NeedDate"))-1957%></option>
              <option value="1">45</option>
              <option value="2">46</option>
              <option value="3">47</option>
            </select>
            </font></div>
        </td>
        <td width="66" height="36"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsDetail("OrderUnit")%></font></div>
        </td>
        <td width="87" height="36"> 
          <div align="center"> 
            <input type="text" name="QTY<%=rsDetail("Line")%>" size="7" maxlength="7" value="<%=rsDetail("OrderQTY")%>" 
		  style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff; WIDTH: 45px;  HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif; TEXT-ALIGN: center"
		  onchange=Calculate(<%=rsDetail("Line")%>,<%=NoItem%>);>
          </div>
        </td>
        <td width="71" height="36"> 
          <div align="right"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
            <input type="hidden" name="UnitPrice<%=rsDetail("Line")%>" value="<%=rsDetail("OrderItemPrice")%>">
            <%=rsDetail("OrderItemPrice")%>&nbsp;&nbsp;&nbsp; </font> </div>
        </td>
        <td width="96" height="36"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            <input type="text" name="Price<%=rsDetail("Line")%>" value="<%=rsDetail("OrderQTY")*rsDetail("OrderItemPrice")%>" size="9" maxlength="9" style="BORDER-RIGHT: #FFFAEC 1px solid; BORDER-TOP: #FFFAEC  1px solid;  FONT-SIZE: 9pt; BACKGROUND: #FFFAEC; BORDER-LEFT: 		
				#FFFAEC  1px solid; WIDTH: 55px; COLOR: #333333; BORDER-BOTTOM: #FFFAEC  1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
            </font></div>
        </td>
        <td width="63" height="36"> 
          <div align="center"><font color="#FFFAEC" face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b> 
            <input type="submit" name="Submit3" value="Delete" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 9pt; 
				BACKGROUND: #9b9b9b; BORDER-LEFT:#e8e8e8 1px solid; COLOR: #FFFAEC; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 20px" onClick="document.PR.command.value='<%=rsDetail("Line")%>';return Con(this);">
            </b></font></div>
        </td>
      </tr>
      <%
  rsDetail.movenext
  Loop
  rsDetail.close
  %>
      <tr> 
        <td colspan="4" height="79">&nbsp;</td>
        <td colspan="3" height="79"> 
          <table width="100%" border="1" cellpadding="0" cellspacing="0" height="100%">
            <tr> 
              <td width="69"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ราคาค่าสินค้า</font></td>
              <td width="96"> 
                <div align="center"> 
                  <input type="text" name="TotalItemPrice" value="<%=rsPR("PRItemPrice")%>" size="12"
			  style="BORDER-RIGHT: #FFFAEC 1px solid; BORDER-TOP: #FFFAEC  1px solid;  FONT-SIZE: 9pt; BACKGROUND: #FFFAEC; BORDER-LEFT: 		
				#FFFAEC  1px solid; WIDTH: 55px; COLOR: #333333; BORDER-BOTTOM: #FFFAEC  1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
                </div>
              </td>
              <td width="61"> 
                <div align="center"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">บาท</font></div>
              </td>
            </tr>
            <tr> 
              <td width="69"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ราคาค่าขนส่ง</font></td>
              <td width="96"> 
                <div align="center"> 
                  <input type="text" name="TotalShipPrice" value="<%=rsPR("PRShipPrice")%>" size="12" 
			  style="BORDER-RIGHT: #FFFAEC 1px solid; BORDER-TOP: #FFFAEC  1px solid;  FONT-SIZE: 9pt; BACKGROUND: #FFFAEC; BORDER-LEFT: 		
				#FFFAEC  1px solid; WIDTH: 55px; COLOR: #333333; BORDER-BOTTOM: #FFFAEC  1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
                </div>
              </td>
              <td width="61"> 
                <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">บาท</font> 
                </div>
              </td>
            </tr>
            <tr> 
              <td width="69"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ราคารวม</font></td>
              <td width="96"> 
                <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
                  <input type="text" name="TotalPrice" value="<%=rsPR("PRTotal")%>" size="12" style="BORDER-RIGHT: #FFFAEC 1px solid; BORDER-TOP: #FFFAEC  1px solid;  FONT-SIZE: 9pt; BACKGROUND: #FFFAEC; BORDER-LEFT: 		
				#FFFAEC  1px solid; WIDTH: 55px; COLOR: #333333; BORDER-BOTTOM: #FFFAEC  1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
                  </font></div>
              </td>
              <td width="61"> 
                <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">บาท</font></div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table width="680" border="0">
      <tr> 
        <td height="17"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>Last 
          Update :&nbsp;<%=formatDateTime(rsPR("UpdateFullDate"),1)%>&nbsp;&nbsp;เวลา&nbsp;<%=formatDateTime(rsPR("UpdateFullDate"),4)%></b></font> 
          <br>
          <br>
          <div align="center">
            <input type="hidden" name="command">
            <input type="submit" name="Submit" value="Update P.R." style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onclick=document.PR.command.value="Update">
            <input type="submit" name="Submit2" value="Delete P.R."style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onclick="document.PR.command.value='Delete';return Conf(this);">
            <input type="reset" name="Submit4" value="Reset"style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px">
            <input type="button" name="Submit5" value="Close"style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onClick=window.close() >
          </div>
        </td>
      </tr>
    </table>
  </div>
  <br>
  <%
else ' ----------------------------------------- ถ้าสถานะไม่เท่ากับ open หรือ confirm%>
  <input type="hidden" name="PRID" value="<%=PRID%>">
  <table width="680" border="1" cellpadding="0" cellspacing="0" height="109" align="center">
    <tr bgcolor="#6601C8"> 
      <td width="176" height="35"> 
        <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">รายการ<br>
          <font size="-2">ITEM</font></font></b></div>
      </td>
      <td width="83" height="35"> 
        <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">กำหนดส่งของ<br>
          <font size="-2">NEED DATE</font></font></b></div>
      </td>
      <td width="74" height="35"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">หน่วย<br>
          <font size="-2">UNIT</font></font></b></font></div>
      </td>
      <td width="90" height="35"> 
        <div align="center"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">จำนวนหน่วย<br>
          <font size="-2">QUANTITY</font> </font></b></div>
      </td>
      <td width="102" height="35"> 
        <div align="center"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">หน่วยละ</font><font color="#FFFFFF" size="-2"><br>
          UNIT PRICE</font></b></font></div>
      </td>
      <td height="35" colspan="2"> 
        <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">จำนวนเงิน</font><font face="MS Sans Serif, Microsoft Sans Serif" size="-2" color="#FFFFFF"><br>
          AMOUNT</font></b></div>
      </td>
    </tr>
    <%
  sql="select * From OrderDetail  Where PRID="&rsPR("PRID")
  Set rsDetail= Server.CreateObject("ADODB.Recordset") 
  rsDetail.Open sql,conn,1,3
 NoItem= rsDetail.recordCount
 do while not rsDetail.EOF 
  %>
    <tr> 
      <td width="176" height="30"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;<%=rsDetail("OrderName")%> 
        </font></td>
      <td width="83" height="30"> 
        <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
          <%=day(rsDetail("NeedDate"))%> </font> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
          &nbsp; 
          <%MapMonth(month(rsDetail("NeedDate")))%>
          </font> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
          &nbsp;<%=year(rsDetail("NeedDate"))-1957%> </font></div>
      </td>
      <td width="74" height="30"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsDetail("OrderUnit")%></font></div>
      </td>
      <td width="90" height="30"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsDetail("OrderQTY")%> 
          </font></div>
      </td>
      <td width="102" height="30"> 
        <div align="right"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
          <%=rsDetail("OrderItemPrice")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font> 
        </div>
      </td>
      <td width="92" height="30"> 
        <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
          <%=rsDetail("OrderItemPrice")*rsDetail("OrderQTY")%>&nbsp;&nbsp;&nbsp;</font></div>
      </td>
      <td width="47" height="30"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">บาท</font></div>
      </td>
    </tr>
    <%
  rsDetail.movenext
  Loop
  rsDetail.close
  %>
    <tr> 
      <td colspan="4" height="79">&nbsp;</td>
      <td colspan="3" height="79"> 
        <table width="100%" border="1" cellpadding="0" cellspacing="0" height="100%">
          <tr> 
            <td width="100"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ราคาสินค้า</font></td>
            <td width="92"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsPR("PRItemPrice")%>&nbsp;&nbsp;&nbsp;</font></div>
            </td>
            <td width="45">
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">บาท</font></div>
            </td>
          </tr>
          <tr> 
            <td width="100"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ราคาค่าขนส่ง</font></td>
            <td width="92"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsPR("PRShipPrice")%> 
                &nbsp; &nbsp;</font></div>
            </td>
            <td width="45">
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">บาท</font> 
              </div>
            </td>
          </tr>
          <tr> 
            <td width="100"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ราคารวม</font></td>
            <td width="92"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsPR("PRTotal")%>&nbsp;&nbsp;&nbsp;</font></div>
            </td>
            <td width="45">
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">บาท 
                </font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="680" border="0" align="center">
    <tr> 
      <td> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>Last 
        Update :&nbsp;<%=formatDateTime(rsPR("UpdateFullDate"),1)&" เวลา "&formatDateTime(rsPR("UpdateFullDate"),4)%></b></font> 
        <div align="center"> 
          <input type="hidden" name="command">
          <br>
          <input type="button" name="Submit5" value="  Close  "style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onClick=window.close() >
          &nbsp; </div>
      </td>
    </tr>
  </table>
  <br>
  <%
end if 

rs.close

else ' ถ้า PR ที่เลือกเข้ามาไม่มีใน Database
	
	response.write "<body  background='images/bg1.jpg'>" %>
  <br>
  <br>
  <br>
  <br>
  <br>
  <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000">P.R. 
    ใบนี้ถูกลบไปแล้ว</font></b> <br>
    <br>
    <input type="button" name="Submit5" value="Close Window"style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onClick=window.close() >
  </div>
  <%		
end if
rsPR.close

%>
</form>
</body>
</html>
<script language="JavaScript">
<!--

function Check(object)
{

}

function Calculate(LineNo,NumItem){


var FormName="PR";
var QtyName="QTY"+LineNo;
var PriceName="Price"+LineNo;
var UnitPriceName="UnitPrice"+LineNo;
var ItemPrice=0;
var ShipPrice=0;

//alert(NumItem);
document.forms(FormName).item(PriceName).value=document.forms(FormName).item(QtyName).value*document.forms(FormName).item(UnitPriceName).value;


for (ii=1;ii<=NumItem;ii++){
QtyName="QTY"+ii
UnitPriceName="UnitPrice"+ii
ShipPriceName="ShipPrice"+ii
ItemPrice=ItemPrice+document.forms(FormName).item(QtyName).value*document.forms(FormName).item(UnitPriceName).value;
ShipPrice=ShipPrice+document.forms(FormName).item(QtyName).value*document.forms(FormName).item(ShipPriceName).value;
	
}

document.PR.TotalItemPrice.value=ItemPrice;
document.PR.TotalShipPrice.value=ShipPrice;
document.PR.TotalPrice.value=ItemPrice*1+ShipPrice*1;


}

function Conf(object){
		if (confirm ("คุณต้องการลบ Purchase Order  ?")==true)
		{ return true;}
		return false;
}

function Con(object){
		if (confirm ("คุณต้องการลบ บรรทัดนี้ใน Purchase Order ?  (ถ้ามีแค่บรรทัดเดียว จะเป็นการลบทั้งใบ)")==true)
		{ return true;}
		return false;
}

//-->
</script>

