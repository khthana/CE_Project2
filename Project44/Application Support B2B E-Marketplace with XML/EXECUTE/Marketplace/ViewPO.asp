
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

POID=request.querystring("poid")

	


sql="Select * from PO,PR,Member  where    PO.PRID=PR.PRID AND SellerID=ID AND POID="&POID

Set rsPO= Server.CreateObject("ADODB.Recordset") 
rsPO.Open sql,conn,1,3



if  not rsPO.EOF then  'ถ้า PO ที่เลือกเข้ามามีใน Database
%>

<html>
<head>
<title><%="P.O. No. " &rsPO("PONo")%></title>
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
<form name="PO" method="post" action="UpdatePO.asp">
  <div align="center">
    <table width="680" border="0" bordercolor="0">
      <tr> 
        <td height="9" colspan="2">&nbsp;</td>
        <td colspan="2" width="31%" height="9">&nbsp;</td>
      </tr>
      <tr> 
        <td height="19" colspan="2"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FF0000" face="Microsoft Sans Serif">Status 
          :&nbsp;<%=rsPO("POStatus")%> <b> 
          <%
		  if  rsPO("POStatus")="rejected" then
		  		response.write " เนื่องจาก"&rsPO("POSellerComment")
		  end if
  		  %>
          </b></font></b></font></td>
        <td height="19" colspan="2" width="31%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <%
		'  response.end
	sql="Select BizName,Zip,ProvinceName,BizAddress From Member,Province  Where Province.ProvinceID=Member.ProvinceID and  ID="&rsPO("BuyerID") 'เอาข้อมูลของคนชื้อออกมา
	Set rs= Server.CreateObject("ADODB.Recordset") 
	rs.Open sql,conn,1,3
	response.write rs(0)
	ProvinceName=rs(2)
	Zip=rs(1)
	BizAddress=rs(3)
	rs.close
	%>
          </font></b></td>
      </tr>
      <tr> 
        <td height="49" width="8%"> 
		<%
		if session("flag")<>false then
		%>
          <div align="center"><font face="Microsoft Sans Serif"><b> <a href="ViewPR.asp?Prid=<%=rsPO("PRID")%>"><img src="images/PR.jpg" border="0"></a><font color="#0000CC" size=-2><br>
            <%=rsPO("PRNO")%></font></b></font></div>
		<%
		else
				response.write("&nbsp;")
		end if
		%>
        </td>
        <td height="49" width="61%">&nbsp;</td>
        <td colspan="2" width="31%" height="49"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=BizAddress%> 
          <%="<br>จังหวัด"&ProvinceName&" "&Zip%></font></b></td>
      </tr>
      <tr> 
        <td colspan="2"> 
          <div align="left"></div>
        </td>
        <td colspan="2" width="31%"><b></b></td>
      </tr>
      <tr> 
        <td colspan="4" height="44"> 
          <div align="center"><font color="993366"><b><font face="MS Sans Serif, Microsoft Sans Serif"><br>
            ใบสั่งซื้อ</font></b></font></div>
        </td>
      </tr>
      <tr> 
        <td colspan="4"> 
          <div align="center"><font color="993366"><b><font face="MS Sans Serif, Microsoft Sans Serif">Purchase 
            Order</font></b></font></div>
        </td>
      </tr>
      <tr> 
        <td colspan="4"> 
          <hr>
        </td>
      </tr>
    </table>
    <table width="680" border="0" height="45">
      <tr> 
        <td height="39" rowspan="2" width="87"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">ถึง&nbsp;<br>
          <font size="-2">SEND TO</font></font></b></td>
        <td rowspan="2" width="373"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b></b></font> 
          <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr> 
              <td><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=": "&rsPO("BizName")%> 
                </font></td>
            </tr>
          </table>
        </td>
        <td width="85" height="8"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">เลขที่ใบสั่ง<br>
          <font size="-2">P.O. NO.</font></font></b></td>
        <td width="117" height="8">:<font face="MS Sans Serif, Microsoft Sans Serif"><font size="-1"> 
          <%
		
					response.write rsPO("PONo")
				
			  %>
          </font></font></td>
      </tr>
      <tr> 
        <td width="85" height="19"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">วันที่สั่งซื้อ<br>
          <font size="-2">OPEN DATE</font></font></b></td>
        <td width="117" height="19"><font face="MS Sans Serif, Microsoft Sans Serif"><font size="-1">: 
          </font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=formatdateTime(rsPO("POFullDate"),1)%></font><font size="-1"> 
          </font></font></td>
      </tr>
      <tr> 
        <td width="87" height="35"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>สถานที่ส่ง<font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;<br>
          <font size="-2">SHIP TO</font><b></b></font></b></font></td>
        <td width="373" height="35"> 
          <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr> 
              <td><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=": "&rsPO("PRAddress")%></font></td>
            </tr>
          </table>
        </td>
        <td height="18"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">กำหนดชำระ<br>
          <font size="-2">TERMS </font></font></b><b></b></td>
        <td height="18"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">:&nbsp;<%=rsPO("PRTerm")%>&nbsp;วัน</font></td>
      </tr>
      <tr> 
        <td width="87" height="2"><b><font face="Microsoft Sans Serif" size="-1">วิธีการขนส่ง<br>
          <font size="-2">SHIP METHOD</font></font></b></td>
        <td width="373" height="2"> &nbsp;&nbsp;:<font face="Microsoft Sans Serif" size="-1">
          <%
		  if  rsPO("ShipMethod")="Sent" then
		  		response.write  "ส่งโดยผู้ขาย"
		  else
		  		response.write rsPO("ShipMethod")
		  end if
		  %>
          </font></td>
        <td width="85" height="2"><b><font face="Microsoft Sans Serif" size="-2">ORDER 
          NO. </font></b></td>
        <td width="117" height="2"><font   face="Microsoft Sans Serif" size="-1">:&nbsp;<%=rsPO("SellerOrderNo")%></font></td>
      </tr>
    </table>
    <br>
    <table width="680" border="1" cellpadding="0" cellspacing="0" height="109">
      <tr bgcolor="#6601C8"> 
        <td width="165" height="29"> 
          <div align="center"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">รายการ<br>
            <font size="-2">ITEM </font></font></b></div>
        </td>
        <td width="109" height="29"> 
          <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">กำหนดส่งของ<br>
            <font size="-2">NEED DATE</font></font></b></div>
        </td>
        <td width="72" height="29"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">หน่วย</font><font color="#FFFFFF"><br>
            <font size="-2">U/N</font></font></b></font></div>
        </td>
        <td width="82" height="29"> 
          <div align="center"><font face="Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">จำนวนหน่วย<br>
            <font size="-2">QUANTITY</font></font></b></font></div>
        </td>
        <td width="74" height="29"> 
          <div align="center"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">หน่วยละ<br>
            <font size="-2">UNIT PRICE</font></font></b></font></div>
        </td>
        <td height="29" width="96"> 
          <div align="center"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">จำนวนเงิน<br>
            <font size="-2">AMOUNT</font></font></b></div>
        </td>
        <td height="29" width="66"> 
          <div align="center"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF"><b>ใบแจ้งหนี้<br>
            <font size="-2">INVOICE</font> </b></font></div>
        </td>
      </tr>
      <%
  sql="select * From OrderDetail  Where PRID="&rsPO("PRID")
  Set rsDetail= Server.CreateObject("ADODB.Recordset") 
  rsDetail.Open sql,conn,1,1
 NoItem= rsDetail.recordCount
 do while not rsDetail.EOF 
  %>
      <tr> 
        <td width="165" height="39"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;<%=rsDetail("OrderName")%> 
          </font></td>
        <td width="109" height="39"> 
          <div align="center"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            <%=day(rsDetail("NeedDate"))%> </font> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            &nbsp; 
            <%MapMonth(month(rsDetail("NeedDate")))%>
            </font> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            &nbsp;<%=year(rsDetail("NeedDate"))-1957%> </font></div>
        </td>
        <td width="72" height="39"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsDetail("OrderUnit")%></font></div>
        </td>
        <td width="82" height="39"> 
          <div align="center"><font face="Microsoft Sans Serif" size="-1"><%=rsDetail("OrderQTY")%> 
            </font></div>
        </td>
        <td width="74" height="39"> 
          <div align="right"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
            <%=rsDetail("OrderItemPrice")%>&nbsp;&nbsp;&nbsp;&nbsp; </font> </div>
        </td>
        <td width="96" height="39"> 
          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            <%=rsDetail("OrderQTY")*rsDetail("OrderItemPrice")%>&nbsp;&nbsp;&nbsp;&nbsp;</font></div>
        </td>
        <td width="66" height="39"> 
          <div align="center"><font face="Microsoft Sans Serif" size="-1"> 
            <%
		sql1="select Invoice.InvoiceID,InvoiceNo From Invoice,InvoiceDetail Where invoice.invoiceID=invoiceDetail.InvoiceID AND Line="&rsDetail("Line")&"  AND Invoice.POID="&rsPO("POID")
		set  rsInvoice=conn.execute(sql1,,CmdText)
		if not rsInvoice.EOF then%>
            <a href="ViewInvoice.asp?InvoiceID=<%=rsInvoice(0)%>" target="_blank"><img src="images/Invoice1.jpg" width="24" height="28" border="0"></a> <br>
            <b><font size="-2" color="#0000CC"><%=rsInvoice(1)%></font></b> 
            <%
		else
		%>
            <b><font size="-2">N/A</font></b> 
            <%
		end if
		
		rsInvoice.close
		%>
            </font></div>
        </td>
      </tr>
      <%
  rsDetail.movenext
  Loop
  rsDetail.close
  %>
      <tr> 
        <td colspan="7" height="79"> 
          <table width="36%" border="1" cellpadding="0" cellspacing="0" height="100%" align="right">
            <tr> 
              <td width="75"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;ราคาสินค้า</font></td>
              <td width="97"> 
                <div align="right"><font face="Microsoft Sans Serif" size="-1"><%=rsPO("PRItemPrice")%>&nbsp;&nbsp;&nbsp; 
                  </font></div>
              </td>
              <td width="63"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;บาท</font></td>
            </tr>
            <tr> 
              <td width="75"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;ราคาค่าขนส่ง</font></td>
              <td width="97"> 
                <div align="right"><font face="Microsoft Sans Serif" size="-1"><%=rsPO("PRShipPrice")%>&nbsp;&nbsp;&nbsp; 
                  </font></div>
              </td>
              <td width="63"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;บาท</font> 
              </td>
            </tr>
            <tr> 
              <td width="75"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;ราคารวม</font></td>
              <td width="97"> 
                <div align="right"><font face="Microsoft Sans Serif" size="-1"><%=rsPO("PRTotal")%>&nbsp;&nbsp;&nbsp; 
                  </font></div>
              </td>
              <td width="63"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;บาท</font></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table width="680" border="0">
      <tr> 
        <td> 
         <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>Last 
            Update :&nbsp;<%=formatDateTime(rsPO("UpdateDate"),1)%>&nbsp;&nbsp;เวลา&nbsp;<%=formatDateTime(rsPO("UpdateDate"),4)%></b></font> 
            <br> 
          <div align="center"><br>
            <input type="button" name="Submit5" value=" Close "style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onClick=window.close() >
          </div>
        </td>
      </tr>
    </table>
  </div>
  <br>
  <%


else ' ถ้า PO ที่เลือกเข้ามาไม่มีใน Database
	
	response.write "<body  background='images/bg1.jpg'>" %>
  <br>
  <br>
  <br>
  <br>
  <br>
  <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000">P.O. 
    ใบนี้ถูกลบไปแล้ว</font></b> <br>
    <br>
    <input type="button" name="Submit5" value="Close Window"style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onClick=window.close() >
	 </div> 
	 
    <%		
end if

rsPO.close

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


var FormName="PO";
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

document.PO.TotalItemPrice.value=ItemPrice;
document.PO.TotalShipPrice.value=ShipPrice;
document.PO.TotalPrice.value=ItemPrice*1+ShipPrice*1;


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
