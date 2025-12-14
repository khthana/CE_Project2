
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

InvoiceID=request.querystring("invoiceid")


sql="Select * from Invoice,PO,PR,Member,Province  where   Province.ProvinceID=Member.ProvinceID AND PO.POID=Invoice.POID AND PO.PRID=PR.PRID AND SellerID=ID AND InvoiceID="&InvoiceID

Set rsInvoice= Server.CreateObject("ADODB.Recordset") 
rsInvoice.Open sql,conn,1,3



if  not rsInvoice.EOF then  'ถ้า Invoice ที่เลือกเข้ามามีใน Database
%>

<html>
<head>
<title><%="Invoice No. " &rsInvoice("InvoiceNo")%></title>
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
        <td height="9">&nbsp;</td>
        <td colspan="2" width="31%" height="9">&nbsp;</td>
      </tr>
      <tr> 
        <td height="19"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FF0000" face="Microsoft Sans Serif">Status 
          :&nbsp;<%=rsInvoice("InvoiceState")%> <b> 
          <%
		  if  rsInvoice("InvoiceState")="rejected" then
		  		response.write " เนื่องจาก"&rsInvoice("InvoiceComment")&"<br><br>"
		  end if
		  
		  %>
          </b></font></b></font></td>
        <td height="19" colspan="2" width="31%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <%
	response.write rsInvoice("BizName")
	%>
          </font></b></td>
      </tr>
      <tr> 
        <td height="43"> 
          <div align="left"> <font face="Microsoft Sans Serif"><b>&nbsp; <a href="ViewPO.asp?POid=<%=rsInvoice("POID")%>" target="_blank"><img src="images/PO.jpg" border="0"></a><font color="#0000CC" size=-2><br>
            <%=rsInvoice("PONO")%></font></b></font></div>
        </td>
        <td colspan="2" width="31%" height="43"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsInvoice("BizAddress")%><%=" จังหวัด"&rsInvoice("ProvinceName")&" "&rsInvoice("Zip")%> 
          </font></td>
      </tr>
      <tr> 
        <td> 
          <div align="left"></div>
        </td>
        <td colspan="2" width="31%"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"></font></td>
      </tr>
      <tr> 
        <td colspan="3" height="44"> 
          <div align="center"><font color="993366"><b><font face="MS Sans Serif, Microsoft Sans Serif"><br>
            ใบแจ้งหนี้</font></b></font></div>
        </td>
      </tr>
      <tr> 
        <td colspan="3"> 
          <div align="center"><font color="993366"><b><font face="MS Sans Serif, Microsoft Sans Serif">Invoice</font></b></font></div>
        </td>
      </tr>
      <tr> 
        <td colspan="3"> 
          <hr>
        </td>
      </tr>
      <tr> 
        <td colspan="3"> 
          <table width="680" border="1" cellspacing="0" cellpadding="0">
            <tr bgcolor="#6601C8"> 
              <td> 
                <div align="center"><b><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">วันที่สั่งซื้อ<br>
                  <font size="-2">DATE</font></font></b></div>
              </td>
              <td> 
                <div align="center"><b><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">เลขที่ใบสั่งซื้อ<br>
                  <font size="-2">P.O. NO.</font></font></b></div>
              </td>
              <td> 
                <div align="center"><b><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">กำหนดชำระ<br>
                  <font size="-2">DUE DATE</font></font></b></div>
              </td>
              <td> 
                <div align="center"><b><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">วันที่ออกเอกสาร<br>
                  <font size="-2">DATE</font></font></b></div>
              </td>
              <td> 
                <div align="center"><b><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">เลขที่เอกสาร<br>
                  <font size="-2">INVOICE No.</font></font></b></div>
              </td>
            </tr>
            <tr> 
              <td height="32"> 
                <div align="center"><font face="Microsoft Sans Serif" size="-1"><%=formatdateTime(rsInvoice("POFullDate"),2)%> 
                  </font> </div>
              </td>
              <td height="32"> 
                <div align="center"><font face="Microsoft Sans Serif" size="-1"><%=rsInvoice("PONo")%> 
                  </font> </div>
              </td>
              <td height="32"> 
                <div align="center"><font face="Microsoft Sans Serif" size="-1"><%=formatdatetime(rsInvoice("DueDate"),2)%> 
                  </font> </div>
              </td>
              <td height="32"> 
                <div align="center"><font face="Microsoft Sans Serif" size="-1"><%=formatdatetime(rsInvoice("InvoiceDate"),2)%> 
                  </font> </div>
              </td>
              <td height="32"> 
                <div align="center"><font face="Microsoft Sans Serif" size="-1"><%=rsInvoice("InvoiceNo")%> 
                  </font> </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <br>
    <table width="680" border="0">
      <tr> 
        <td height="37" width="88"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">ขายให้&nbsp;:<br>
          <font face="Microsoft Sans Serif" size="-2">SOLD TO &nbsp;<b>:</b></font><br>
          </font></b></td>
        <td width="281" height="37"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b></b></font> 
          <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr> 
              <td><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%
			  sql="Select BizName,Zip,ProvinceName,BizAddress From Member,Province  Where Province.ProvinceID=Member.ProvinceID and  ID="&rsInvoice("BuyerID") 
			Set rs= Server.CreateObject("ADODB.Recordset") 
			rs.Open sql,conn,1,3
			response.write rs(0)&"<br>"
			response.write rs(3)
			response.write "จังหวัด "&rs(2)
			response.write " "&rs(1)
			rs.close
			  %> 
                </font></td>
            </tr>
          </table>
        </td>
        <td width="178" height="37">&nbsp;</td>
        <td width="115" height="37">&nbsp;</td>
      </tr>
    </table>
    <br>
    <table width="680" border="1" cellpadding="0" cellspacing="0" height="109">
      <tr bgcolor="#6601C8"> 
        <td width="86" height="31"> 
          <div align="center"><b><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">รหัสสินค้า<br>
            <font size="-2">PRODUCT NO.</font></font></b></div>
        </td>
        <td width="164" height="31"> 
          <div align="center"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">รายการ<br>
            <font size="-2">DESCRIPTION</font></font></b></div>
        </td>
        <td width="87" height="31"> 
          <div align="center"><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF"><b>บรรทัดใน<font size="-2"> 
            P.O. <br>
            P.O. LINE</font></b></font></div>
        </td>
        <td width="57" height="31"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">หน่วย<br>
            <font size="-2">UNIT</font></font></b></font></div>
        </td>
        <td width="72" height="31"> 
          <div align="center"><font face="Microsoft Sans Serif" size="-1"><b><font color="#FFFFFF">จำนวน<br>
            <font size="-2">QUANTITY</font></font></b></font></div>
        </td>
        <td width="75" height="31"> 
          <div align="center"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#FFFFFF">หน่วยละ<br>
            <font size="-2">UNIT PRICE</font></font></b></font></div>
        </td>
        <td height="31" colspan="2"> 
          <div align="center"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">จำนวนเงิน</font><font size="-2" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF"><br>
            AMOUNT</font></b></div>
        </td>
      </tr>
      <%
  sql="select * From OrderDetail,InvoiceDetail,PO,PR  Where  PO.PRID=PR.PRID AND PR.PRID=OrderDetail.PRID AND InvoiceDetail.POID=PO.POID AND InvoiceDetail.Line=OrderDetail.Line AND InvoiceDetail.InvoiceID="&rsInvoice("InvoiceID")

  Set rsDetail= Server.CreateObject("ADODB.Recordset") 
  rsDetail.Open sql,conn,1,3
 NoItem= rsDetail.recordCount
 do while not rsDetail.EOF 
  %>
      <tr> 
        <td width="86" height="32"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;<%=rsDetail("OrderSellerItemID")%> 
          </font></td>
        <td width="164" height="32"> &nbsp;<font face="Microsoft Sans Serif" size="-1">&nbsp;<%=rsDetail("OrderName")%> 
          </font></td>
        <td width="87" height="32"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsDetail("Line")%></font></div>
        </td>
        <td width="57" height="32"> 
          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsDetail("OrderUnit")%></font></div>
        </td>
        <td width="72" height="32"> 
          <div align="center"><font face="Microsoft Sans Serif" size="-1"><%=rsDetail("OrderQTY")%> 
            </font></div>
        </td>
        <td width="75" height="32"> 
          <div align="right"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"> 
            <%=rsDetail("OrderItemPrice")%>&nbsp;&nbsp;&nbsp;&nbsp; </font> </div>
        </td>
        <td width="84" height="32"> 
          <div align="right"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"> 
            <%=rsDetail("OrderQTY")*rsDetail("OrderItemPrice")%>&nbsp;&nbsp;&nbsp;&nbsp;</font></div>
        </td>
        <td width="37" height="32">&nbsp;<font size="-1">บาท</font></td>
      </tr>
      <%
  rsDetail.movenext
  Loop
  rsDetail.close

  %>
      <tr> 
        <td colspan="8" height="83"> 
          <table width="41%" border="1" cellpadding="0" cellspacing="0" height="100%" align="right">
            <tr> 
              <td width="150" height="36"><font face="Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;ค่าขนส่ง<br>
                &nbsp;&nbsp;&nbsp;&nbsp;<font size="-2">SHIP PRICE</font></font></td>
              <td width="84" height="36"> 
                <div align="right"><font face="Microsoft Sans Serif" size="-1"> 
                  <%  
			  sql="select sum(ordershipPrice*orderQTY) From OrderDetail,InvoiceDetail,PO,PR  Where  PO.PRID=PR.PRID AND PR.PRID=OrderDetail.PRID AND InvoiceDetail.POID=PO.POID AND InvoiceDetail.Line=OrderDetail.Line AND InvoiceDetail.InvoiceID="&rsInvoice("InvoiceID")
			Set rs= Server.CreateObject("ADODB.Recordset") 
 			 rs.Open sql,conn,1,3
			 response.write rs(0)
  			rs.close
  			
  %>
                  </font>&nbsp;&nbsp;</div>
              </td>
              <td width="35" height="36">&nbsp;<font face="Microsoft Sans Serif" size="-1">บาท</font></td>
            </tr>
            <tr> 
              <td width="150" height="36"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;รวม<br>
                &nbsp;&nbsp;<font size="-2">&nbsp;&nbsp;SUB TOTAL</font></font></td>
              <td width="84" height="36"> 
                <div align="right"><font face="Microsoft Sans Serif" size="-1"><%=rsInvoice("NetAmount")%>&nbsp;&nbsp;&nbsp; 
                  </font></div>
              </td>
              <td width="35" height="36"><font size="-1" face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;บาท</font></td>
            </tr>
            <tr> 
              <td width="150"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;ภาษีมูลค่าเพิ่ม 
                7%<br>
                &nbsp;&nbsp;&nbsp;&nbsp;<font size="-2">VALUE ADDED TAX</font></font></td>
              <td width="84"> 
                <div align="right"><font face="Microsoft Sans Serif" size="-1"><%=rsInvoice("vat")%>&nbsp;&nbsp;&nbsp; 
                  </font></div>
              </td>
              <td width="35"> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;บาท</font> 
              </td>
            </tr>
            <tr> 
              <td width="150" height="25"> 
                <p><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;&nbsp;&nbsp;รวมทั้งสิ้น<br>
                  <font size="-2">&nbsp;&nbsp;&nbsp;&nbsp;TOTAL</font></font></p>
              </td>
              <td width="84" height="25"> 
                <div align="right"><font face="Microsoft Sans Serif" size="-1"><%=rsInvoice("TotalPrice")%>&nbsp;&nbsp;&nbsp; 
                  </font></div>
              </td>
              <td width="35" height="25"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;บาท</font></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table width="680" border="0">
      <tr> 
        <td> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><b>*ขนส่งโดย <%=rsInvoice("ShipMethod")%>
          <br>
          Last Update :&nbsp;<%=formatDateTime(rsInvoice("UpdateDate"),1)%>&nbsp;&nbsp;เวลา&nbsp;<%=formatDateTime(rsInvoice("UpdateDate"),4)%></b></font> 
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
  <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FF0000">PO 
    ใบนี้ถูกลบไปแล้ว</font></b> <br>
    <br>
    <input type="button" name="Submit5" value="Close Window"style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onClick=window.close() >
	 </div> 
	 
    <%		
end if

rsInvoice.close

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
