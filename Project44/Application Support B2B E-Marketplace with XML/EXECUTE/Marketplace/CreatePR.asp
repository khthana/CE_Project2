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
%>
<html>
<head>
<title>Open Purchase Request</title>
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
<img src="images/PUrchaseRequest.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map"> 
  <area shape="rect" coords="689,91,781,109" href="<%=session("history")%>">
  <area shape="rect" coords="807,89,895,112" href="MainMenu.asp">
  <area shape="rect" coords="920,90,991,115" href="Signout.asp">
  <area shape="rect" coords="565,90,664,114" href="OrderStatus.asp">
</map>
<br>

<form name="form1" method="post" action="UpdateBasket.asp">
  <%

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

sql="Select  ID,BizName,DefaultTerm,Ems,Sent,FedEx From Member Where  ID  in ( Select supplierID from Basket  Where   UserSessionID='"&session.sessionID&"') order By ID"

Set rsSupplier= Server.CreateObject("ADODB.Recordset") 
rsSupplier.Open sql,conn,1,3
NoSupplier=rsSupplier.recordCount

if  not rsSupplier.EOF  then  ' กรณีที่มีสินค้า ให้ แสดงออกมา





FinalItemPrice=0
FinalShipPrice=0
kk=1  
sql1 = "Select Term From Term Where SellerID="&rsSupplier("ID")&" AND BuyerID="&session("BuyerID")

		Set rsTerm= Server.CreateObject("ADODB.Recordset") 
		rsTerm.Open sql1,conn
		
		if (rsTerm.EOF ) then
			Term=rsSupplier("DefaultTerm")
		else
			Term=rsTerm("Term")
		end if
		rsTerm.close
 

Do While not rsSupplier.EOF  ' วนแสดงทีละ Supplier %>
  <table width="798" border="0">
    <tr> 
      <td width="91" height="30">&nbsp;</td>
      <td colspan="5" height="30"> 
        <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif">ใบขอสั่งซื้อ<br>
          <font size="-1">PURCHASE ORDER</font></font></b> </div><hr>
      </td>
    </tr>
    <tr> 
      <td width="91" height="36"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"></font></td>
      <td width="77" height="36"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>ถึง<br>
        </b><font size="-2"><b>SENT TO :</b></font><br>
        </font></td>
      <td colspan="2" height="36"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"></font> 
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="97%"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b><%=rsSupplier("BizName")%></b></font></td>
          </tr>
        </table>
        
      </td>
      <td width="93" height="36"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"><b>วันที่เปิด<br>
        <font size="-2">OPEN DATE</font></b></font></td>
      <td width="164" height="36"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>:</b>&nbsp;&nbsp;<b><%=date%></b></font></td>
    </tr>
    <tr> 
      <td width="91" rowspan="2"><font size="-1"></font></td>
      <td width="77" rowspan="2"> 
        <p><font size="-1"><b>สถานที่ส่ง<br>
          </b><font size="-2"><b>SHIP TO&nbsp; :</b></font><br>
          <br>
          <br>
          <%' 
		 		sql="Select BizAddress,ProvinceName From  Member,Province where Member.ProvinceID=Province.ProvinceID AND ID="&session("BuyerID")
				Set rs=conn.Execute(sql,,CmdText)
				DefaultAddress=rs("BizAddress")&" จังหวัด"&rs("ProvinceName")
				rs.close
			%>
          <input type="hidden" name="hiddenAddress<%=rsSupplier("ID")%>" value="<%=DefaultAddress%>" >
          </font></p>
      </td>
      <td width="176" rowspan="2"><font size="-1"> 
        <%sql1 = "Select ReceiveAddress From Basket Where SupplierID="&rsSupplier("ID")&" AND UserSessionID='"&session.sessionID&"'"
		Set rs2= Server.CreateObject("ADODB.Recordset") 
		rs2.Open sql1,conn
		add= rs2(0)
		rs2.close
		%>
        <textarea name="fAddress<%=rsSupplier("ID")%>" rows="3" cols="25"><%=add%></textarea>
        </font></td>
      <td width="171" rowspan="2"><font size="-1"> 
        <input type="button" name="Submit4" value="Default Address" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 9pt; 
				BACKGROUND: #9b9b9b; BORDER-LEFT:#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 20px"
				onClick=DefaultAddress(<%=rsSupplier("ID")%>);>
        <br>
        (ที่อยู่ตามที่ลงทะเบียนไว้)<br>
        <br>
        </font></td>
      <td width="93" height="26"><font size="-1"><b>กำหนดชำระ<br>
        <font size="-2">TERMS</font></b></font></td>
      <td width="164" height="26"><font size="-1"><b>: </b><b>&nbsp;<%=term%></b> 
        <input type="hidden" name="fTerm<%=rsSupplier("ID")%>" value="<%=term%>">
        <b>วัน </b></font></td>
    </tr>
    <tr> 
      <td width="93" height="48"><font face="Microsoft Sans Serif"><b><font size="-1">วิธีการส่งของ</font></b></font></td>
      <td width="164" height="48"> <b>:</b> 
        <select name="ship<%=rsSupplier("ID")%>" onchange=sent(<%=rsSupplier("ID")%>); >
          <%
		  sent=false
		  ems=false
		  fedEx=false
		  
		  sql7="Select ShipMethod From Basket where  ShipMethod is not null And SupplierID="&rsSupplier("ID")&" AND UserSessionID='"&session.sessionID&"'"
		  set rs7=conn.execute(sql7,,cmdText)
		
		 Set rs7 = Server.CreateObject("ADODB.Recordset") 
		rs7.Open sql7,conn,1,3

		 if not rs7.eof then
		
					if  rs7(0)="Sent" then
								sent=true
								%>
          <option value="Sent">ส่งโดยผู้ขาย</option>
          <%
					end if
					if  rs7(0)="Ems" then
								ems=true
								%>
          <option value="Ems">บริการจาก กสท.</option>
          <%
					end if
					if  rs7(0)="FedEx" then
							fedEx=true
							%>
          <option value="FedEx">บริการจาก FedEx</option>
          <%
					
					end if
					
		  end if
		  
		  if (rsSupplier("Sent")=true and sent=false )then
		  %>
          <option value="Sent">ส่งโดยผู้ขาย</option>
          <%
		  end if
		  %>
          <%
		  if ( rsSupplier("Ems")=true and ems=false ) then
		  %>
          <option value="Ems">บริการจาก กสท.</option>
          <%
		  end if
		  %>
          <%
		  if (rsSupplier("FedEx")=true  and fedEx=false) then
		  %>
          <option value="FedEx">บริการจาก FedEx</option>
          <%
		  end if
		  %>
        </select>
      </td>
    </tr>
  </table>
  <%
ItemPrice=0
ShipPrice=0

 rs7.close%>

  <table width="797" border="0">
    <tr> 
      <td width="81" height="156">&nbsp;</td>
      <td width="706" height="156"> 
        <table width="100%" border="1" cellpadding="0" cellspacing="0">
          <tr bgcolor="#6601C8"> 
            <td width="158" height="34"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b><font size="-1">รายการ<br>
                <font size="-2">ITEM </font></font></b></font></div>
            </td>
            <td width="153" height="34"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b><font size="-1">กำหนดส่งของ<br>
                <font size="-2">NEED DATE</font></font></b></font></div>
            </td>
            <td width="67" height="34"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b><font size="-1">หน่วย<br>
                <font size="-2">U/M </font></font></b></font></div>
            </td>
            <td width="80" height="34"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b><font size="-1">จำนวนหน่วย<br>
                <font size="-2">QUANTITY </font></font></b></font></div>
            </td>
            <td width="75" height="34"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b><font size="-1">หน่วยละ<br>
                <font size="-2">UNIT PRICE</font></font></b></font></div>
            </td>
            <td width="89" height="34"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b><font size="-1">จำนวนเงิน<br>
                <font size="-2">AMOUNT</font></font></b></font></div>
            </td>
            <td width="68" height="34"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><b><font size="-1">ลบ&nbsp;<br>
                <font size="-2">DELETE</font> </font></b></font></div>
            </td>
          </tr>
          <%
		  
  sql="Select  *  From Basket,Catalog Where Basket.ItemID=Catalog.ItemID AND UserSessionID='"&session.sessionID&"'  AND SupplierID="&rsSupplier("ID")

  Set rsItem= Server.CreateObject("ADODB.Recordset") 
  rsItem.Open sql,conn,1,3
 NoItem= rsItem.recordCount

 ii=1
  Do While  not rsItem.EOF
   price=rsItem("QTY")*rsItem("ItemPrice")
  
 sql7="Select ShipMethod From Basket where  ShipMethod is not null And SupplierID="&rsSupplier("ID")&" AND UserSessionID='"&session.sessionID&"'"
		 		Set rs7 = Server.CreateObject("ADODB.Recordset") 
				rs7.Open sql7,conn,1,3
				if  not rs7.eof then
					if  rs7(0)="Sent" then
								priceShip=rsItem("ShipPrice")
					end if
					if  rs7(0)="Ems" then
								priceShip=rsItem("EmsPrice")
					end if
					if  rs7(0)="FedEx" then
						
							priceShip=rsItem("FedExPrice")
					end if

				else
				
					  if rsSupplier("Sent")=true then
					  		priceShip=rsItem("ShipPrice")
					  else if  rsSupplier("Ems")=true then
					  		priceShip=rsItem("EmsPrice")
					  else if rsSupplier("FedEx")=true then
					  		priceShip=rsItem("FedExPrice")
					  end if
					  end if
					  end if
				
				end if
				rs7.close
	
  ship=rsItem("QTY")*PriceShip
  
  
  ShipPrice=ShipPrice+ship
  ItemPrice=ItemPrice+price 
  TotalPrice=ShipPrice+ItemPrice

  %>
          <tr> 
            <td width="158" height="28"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000">&nbsp;&nbsp;<%=rsItem("ItemName")%> 
              <input type="hidden" name="hiddenPrice<%=rsItem("BasketID")%>" value="<%=rsItem("ItemPrice")%>">
              <input type="hidden" name="hiddenShipPrice<%=rsItem("BasketID")%>" 
			  value="<%sql7="Select ShipMethod From Basket where  ShipMethod is not null And SupplierID="&rsSupplier("ID")&" AND UserSessionID='"&session.sessionID&"'"
		 		Set rs7 = Server.CreateObject("ADODB.Recordset") 
				rs7.Open sql7,conn,1,3
				if  not rs7.eof then
					if  rs7(0)="Sent" then
								response.write rsItem("ShipPrice")
					end if
					if  rs7(0)="Ems" then
								response.write rsItem("EmsPrice")
					end if
					if  rs7(0)="FedEx" then
						
							response.write rsItem("FedExPrice")
					end if

				else
				
					  if rsSupplier("Sent")=true then
					  		response.write rsItem("ShipPrice")
					  else if  rsSupplier("Ems")=true then
					  		response.write rsItem("EmsPrice")
					  else if rsSupplier("FedEx")=true then
					  		response.write rsItem("FedExPrice")
					  end if
					  end if
					  end if
				
				end if
				rs7.close
				%>" 
			  onChange=Calculate(<%=rsItem("BasketID")%>,<%=NoItem%>,<%=NoSupplier%>,<%=rsSupplier("ID")%>,<%=ii%>,<%=kk%>);>
              <input type="hidden" name="hiddenItemID" value="<%=rsItem("ItemID")%>">
              <input type="hidden" name="hiddenListPrice<%=rsSupplier("ID")%><%=ii%>" value="<%=price%>">
              <input type="hidden" name="hiddenListShipPrice<%=rsSupplier("ID")%><%=ii%>" value="<%=ship%>">
              </font></td>
            <td width="153" height="35"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
              <div align="center"> 
                <select name="date<%=rsItem("BasketID")%>" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;   HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
                  <option value="<%=day(rsItem("NeedDate"))%>"><%=day(rsItem("NeedDate"))%></option>
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
                <select name="month<%=rsItem("BasketID")%>" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;  HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
                  <option value="<%=Month(rsItem("NeedDate"))%>">
                  <%MapMonth(month(rsItem("NeedDate")))%>
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
                <select name="year<%=rsItem("BasketID")%>" style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff;   HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif" >
                  <option value="<%=year(rsItem("NeedDate"))-2001%>"><%=year(rsItem("NeedDate"))-1957%></option>
                  <option value="1">45</option>
                  <option value="2">46</option>
                  <option value="3">47</option>
                </select>
              </div>
              </font></td>
            <td width="67" height="28"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"><%=rsItem("ItemUnit")%></font></div>
            </td>
            <td width="80" height="28"> 
              <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
                <input type="text" name="itemQty<%=rsItem("BasketID")%>" value="<%=rsItem("QTY")%>" 
				onChange=Calculate(<%=rsItem("BasketID")%>,<%=NoItem%>,<%=NoSupplier%>,<%=rsSupplier("ID")%>,<%=ii%>,<%=kk%>);
				style=" FONT-SIZE: 9pt; BACKGROUND: #ffffff; WIDTH: 45px;  HEIGHT: 19px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif; TEXT-ALIGN: center" >
                </font></div>
            </td>
            <td width="75" height="28"> 
              <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"><%=rsItem("ItemPrice")%>&nbsp;&nbsp;&nbsp&nbsp;&nbsp;</font></div>
            </td>
            <td width="89" height="28"> 
              <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
                <input type="text" name="listPrice<%=rsItem("BasketID")%>" value="<%price=rsItem("QTY")*rsItem("ItemPrice")
	 			 response.write price%>" maxlength="15" style="BORDER-RIGHT: #ffffff 1px solid; BORDER-TOP: #ffffff  1px solid;  FONT-SIZE: 9pt; BACKGROUND: FFFAEC; BORDER-LEFT: 		
				#ffffff  1px solid; WIDTH: 70px; COLOR: #333333; BORDER-BOTTOM: #ffffff  1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
                </font></div>
            </td>
            <td width="68" height="28"> 
              <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
                <input type="submit" name="Submit3" value="Delete"onClick=document.form1.instruction.value="Delete";document.form1.deleteField.value="<%=rsItem("BasketID")%>"; style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 9pt; 
				BACKGROUND: #9b9b9b; BORDER-LEFT:#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 20px" >
                </font></div>
            </td>
          </tr>
          <%

  rsItem.moveNext
  ii=ii+1
  Loop
  rsItem.close
  %>
          <tr> 
            <td colspan="4" height="28">&nbsp;&nbsp; <br>
            </td>
            <td colspan="3" height="28"> 
              <table width="100%" border="1" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="74"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ค่าสินค้า</font></td>
                  <td width="88"> 
                    <div align="center"> 
                      <input type="text" name="TotalItemPrice<%=kk%>" value="<%=ItemPrice%>" size="12"
			  style="BORDER-RIGHT: #ffffff 1px solid; BORDER-TOP: #ffffff  1px solid;  FONT-SIZE: 9pt; BACKGROUND: FFFAEC; BORDER-LEFT: 		
				#ffffff  1px solid; WIDTH: 70px; COLOR: #333333; BORDER-BOTTOM: #ffffff  1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
                    </div>
                  </td>
                  <td width="66"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;บาท</font></td>
                </tr>
                <tr> 
                  <td width="74"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;ค่าขนส่ง</font></td>
                  <td width="88"> 
                    <div align="center"> 
                      <input type="text" name="TotalShipPrice<%=kk%>" value="<%=ShipPrice%>" size="12" 
			  style="BORDER-RIGHT: #ffffff 1px solid; BORDER-TOP: #ffffff  1px solid;  FONT-SIZE: 9pt; BACKGROUND: FFFAEC; BORDER-LEFT: 		
				#ffffff  1px solid; WIDTH: 70px; COLOR: #333333; BORDER-BOTTOM: #ffffff  1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
                    </div>
                  </td>
                  <td width="66"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;บาท</font> 
                  </td>
                </tr>
                <tr> 
                  <td width="74"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;รวม</font></td>
                  <td width="88"> 
                    <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
                      <input type="text" name="TotalPrice<%=kk%>" value="<%=TotalPrice%>" size="12" style="BORDER-RIGHT: #ffffff 1px solid; BORDER-TOP: #ffffff  1px solid;  FONT-SIZE: 9pt; BACKGROUND: #FFFAEC; BORDER-LEFT: 		
				#ffffff  1px solid; WIDTH: 70px; COLOR: #333333; BORDER-BOTTOM: #ffffff  1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
                      </font></div>
                  </td>
                  <td width="66"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;บาท</font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr> 
      <td width="81" height="65">&nbsp;</td>
      <td width="706" height="65"> 
        <input type="checkbox" name="A<%=rsSupplier("ID")%>" value="check" onclick=CheckAddress(<%=rsSupplier("ID")%>);>
        <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000">พร้อมสร้างใบ 
        P.R.</font></b> 
        <hr>
        <br>
      </td>
    </tr>
  </table>
  <%
FinalItemPrice=FinalItemPrice+ItemPrice
FinalShipPrice=FinalShipPrice+ShipPrice
FinalPrice=FinalItemPrice+FinalShipPrice
kk=kk+1

rsSupplier.moveNext

Loop

'response.write rsSupplier.recordcount
%>
  <table width="793" border="0" cellpadding="0" cellspacing="0">
    <tr> 
      <td width="90" height="32">&nbsp;</td>
      <td width="350" height="32">&nbsp;</td>
      <td width="179" height="32" bgcolor="#AEAEFF" bordercolor="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;ค่าสินค้าทั้งหมด 
        </font></b></td>
      <td width="174" height="32" bgcolor="#AEAEFF" bordercolor="#0000CC"> 
        <input type="text" name="FinalItemPrice" value="<%=FinalItemPrice%>"
		 style="BORDER-RIGHT:#AEAEFF 1px solid; BORDER-TOP: #AEAEFF 1px solid;  FONT-SIZE: 12pt; BACKGROUND: #AEAEFF; BORDER-LEFT: 		
				#AEAEFF  1px solid; WIDTH: 95px; COLOR: #333333; BORDER-BOTTOM:#AEAEFF 1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
        &nbsp; <font face="MS Sans Serif, Microsoft Sans Serif"><b>บาท</b> </font></td>
    </tr>
    <tr> 
      <td width="90" height="32">&nbsp;</td>
      <td width="350" height="32">&nbsp;</td>
      <td width="179" bgcolor="#AEAEFF" height="32" bordercolor="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;ค่าขนส่งทั้งหมด 
        </font></b></td>
      <td width="174" bgcolor="#AEAEFF" height="32" bordercolor="#0000CC"> 
        <input type="text" name="FinalShipPrice" value="<%=FinalShipPrice%>" style="BORDER-RIGHT:#AEAEFF 1px solid; BORDER-TOP: #AEAEFF 1px solid;  FONT-SIZE: 12pt; BACKGROUND: #AEAEFF; BORDER-LEFT: 		
				#AEAEFF  1px solid; WIDTH: 95px; COLOR: #333333; BORDER-BOTTOM:#AEAEFF 1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
        <font face="MS Sans Serif, Microsoft Sans Serif"><b>&nbsp;บาท </b></font></td>
    </tr>
    <tr> 
      <td width="90" height="32">&nbsp;</td>
      <td width="350" height="32">&nbsp;</td>
      <td width="179" bgcolor="#AEAEFF" height="32" bordercolor="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;รวมเงินที่ต้องชำระทั้งหมด</font></b></td>
      <td width="174" bgcolor="#AEAEFF" height="32" bordercolor="#0000CC"> 
        <input type="text" name="FinalPrice" value="<%=FinalPrice%>" style="BORDER-RIGHT:#AEAEFF 1px solid; BORDER-TOP: #AEAEFF 1px solid;  FONT-SIZE: 12pt; BACKGROUND: #AEAEFF; BORDER-LEFT: 		
				#AEAEFF  1px solid; WIDTH: 95px; COLOR: #333333; BORDER-BOTTOM:#AEAEFF 1px solid; FONT-FAMILY: MS Sans Serif ; HEIGHT: 19px ;TEXT-ALIGN: right" readOnly >
        <font face="MS Sans Serif, Microsoft Sans Serif"><b>&nbsp;บาท</b> </font></td>
    </tr>
    <tr> 
      <td width="90">&nbsp;</td>
      <td width="350">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td width="90">&nbsp;</td>
      <td colspan="3">
        <p align="left"><b>สร้างใบ P.R.</b> 
        <b> 
        <hr>
        <font face="MS Sans Serif, Microsoft Sans Serif" size="-1">
        <input type="hidden" name="deleteField">
        Password</font></b>&nbsp; 
        <input type="password" name="passphase" size="12" maxlength="12" >
        &nbsp; 
        <input type="submit" name="Submit" value="Gen P.R. " onClick="return Check(this);" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; 
				BACKGROUND: #9b9b9b; BORDER-LEFT:#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 23px">
        <b><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000">
        <input type="submit" name="Submit2" value="กลับไปเลือกซื้อ" onClick=document.form1.instruction.value="Back";
  style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; 
				BACKGROUND: #9b9b9b; BORDER-LEFT:#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 23px">
        </font></b>
        <input type="hidden" name="supplier">
        <input type="hidden" name="method">
        <br>
        <br>
        <font color="#FF0000" size="-1">เลือกช่อง พร้อมสร้างใบ P.R. ของใบ P.R. 
        ที่พร้อมจะสร้าง และใส่ Password ก่อนกดปุ่ม Gen P.R.</font></td>
    </tr>
  </table>
  <br>
  <input type="hidden" name="instruction">

</form>
<%
else%>

  <p>&nbsp;</p>
  
<table width="814" border="0">
  <tr>
      
    <td width="90">&nbsp;</td>
      
    <td width="714"> 
      <div align="center"><font color="#FF0000" face="MS Sans Serif, Microsoft Sans Serif"><b><font size="+2"><br>
        <br>
        ไม่มีสินค้าในตระกร้า</font><font size="+1"></font></b></font></div>
    </td>
    </tr>
  </table>
  
<p><font color="#FF0000" face="MS Sans Serif, Microsoft Sans Serif"><b></b></font> 
 
    <%end if
rsSupplier.Close
Conn.close
%>
  </p>

</body>
</html>
<script language="JavaScript">
<!--
function CheckAddress(supID)
{
var FormName="form1"
var AddressName="fAddress"+supID
var CheckName="A"+supID
if (document.forms(FormName).item(CheckName).checked){
		//alert("d"+document.forms(FormName).item(AddressName).value+"sd");
		if (document.forms(FormName).item(AddressName).value=="") {
				alert("กรุณาใส่สถานที่ส่งสินค้า");
				//document.forms(FormName).item(CheckName).value=false;
			//document.form(FormName).item(AddressName).focus();
		}
		
}


}
function Check(object){

		if  (document.form1.passphase.value=="")
		{
				alert("กรุณาใส่ Password ก่อนส่งใบ P.O.");
				document.form1.passphase.focus();
				return false;
		}
		else
		{
				document.form1.instruction.value="Send";		
				return true;
		}
}		

function  Calculate(BasketID,NoItem,NoSupplier,SupplierID,ListNo,SupplierNo){

var FormName="form1"
var  ListPriceName="listPrice"+BasketID
var ListPriceName1="hiddenListPrice"+SupplierID+ListNo
var ListShipPriceName="hiddenListShipPrice"+SupplierID+ListNo
var  ItemQtyName="itemQty"+BasketID
var UnitPriceName="hiddenPrice"+BasketID
var UnitShipPriceName="hiddenShipPrice"+BasketID

var TotalShipPriceName="TotalShipPrice"+SupplierNo
var TotalPriceName="TotalPrice"+SupplierNo
var TotalItemPriceName="TotalItemPrice"+SupplierNo

document.forms(FormName).item(ListPriceName).value=document.forms(FormName).item(ItemQtyName).value*document.forms(FormName).item(UnitPriceName).value;

document.forms(FormName).item(ListPriceName1).value=document.forms(FormName).item(ItemQtyName).value*document.forms(FormName).item(UnitPriceName).value;
document.forms(FormName).item( ListShipPriceName).value=document.forms(FormName).item(ItemQtyName).value*document.forms(FormName).item(UnitShipPriceName).value;

var TotalItemPrice=0
var TotalShipPrice=0

for (ii=1;ii<=NoItem;ii++){
	var ListPrice="hiddenListPrice"+SupplierID+ii
	var ShipPrice="hiddenListShipPrice"+SupplierID+ii
	TotalShipPrice=TotalShipPrice+document.forms(FormName).item(ShipPrice).value*1
	TotalItemPrice=TotalItemPrice+document.forms(FormName).item(ListPrice).value*1
}
document.forms(FormName).item(TotalPriceName).value=TotalItemPrice+TotalShipPrice
document.forms(FormName).item(TotalShipPriceName).value=TotalShipPrice
document.forms(FormName).item(TotalItemPriceName).value=TotalItemPrice

FinalTotalShipPrice=0
FinalTotalPrice=0

for (ii=1;ii<=NoSupplier;ii++){

	var ShipPrice="TotalShipPrice"+ii
	var Price="TotalPrice"+ii
	FinalTotalShipPrice=FinalTotalShipPrice+document.forms(FormName).item(ShipPrice).value*1
	FinalTotalPrice=FinalTotalPrice+document.forms(FormName).item(Price).value*1
}
document.form1.FinalShipPrice.value=FinalTotalShipPrice
document.form1.FinalPrice.value=FinalTotalPrice
document.form1.FinalItemPrice.value=FinalTotalPrice-FinalTotalShipPrice

}

function  Delete(ItemID){

alert(ItemID);
var Link="DeleteItemInBasket.asp?itemID="+ItemID;
alert(Link);
location.href =Link;

}

function  DefaultAddress(SupID){

var FormName="form1";
var hiddenAddress="hiddenAddress"+SupID;
var Address="fAddress"+SupID;

document.forms(FormName).item(Address).value=document.forms(FormName).item(hiddenAddress).value;

}

function sent(SupplierID){

var FormName="form1";
var items="ship"+SupplierID;

document.form1.supplier.value=SupplierID;

document.form1.method.value=document.forms(FormName).item(items).value

document.form1.submit();

}
// -->
</script>

