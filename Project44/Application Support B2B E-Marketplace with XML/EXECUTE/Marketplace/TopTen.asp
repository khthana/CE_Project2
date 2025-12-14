<%
Const pageLen=6
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

%>

<html>
<head>
<title>TOP  TEN</title>
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

<script Language="JavaScript">
<!--
function Order(){
	
		document.form2.hidden.ItemID=Operator ;
}

function  call_window(goto_url,w,h){
	
	window.open(goto_url,"","directories=no,location=no,toobar=no,status=no,menubar=no,width="+w+",height="+h+",scrollbar=no,menu=no,resizeable=no,left=200,top=100")
	
}
// -->

</script>
</head>

<body bgcolor="#FFFFFF" background="images/bg17.jpg">
<p>&nbsp;</p>
<img src="images/topten.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="797,82,907,112" href="Shopping.asp">
  <area shape="rect" coords="920,86,999,114" href="Signout.asp">
</map>
<form name="form1" method="post" action="ShowCatalog.asp">
  <table width="890" border="0" height="193">
    <tr> 
      <td width="79" height="221"> </td>
      <td height="221"> 
        <table width="92%" border="0" cellspacing="0" cellpadding="0" align="left" height="204">
          <tr> 
            <td height="15">&nbsp;</td>
          </tr>
          <tr> 
            <td height="10"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#993366"><%=session("BizName")%></font></b></td>
          </tr>
          <tr> 
            <td height="11"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#993366"><%=session("BizAddress")%></font></b></td>
          </tr>
          <tr> 
            <td height="38"><a href="createpr.asp"><img src="images/cart1.gif" width="28" height="22" border="0"> 
              <font color="#0000CC"><b>View Basket</b></font></a></td>
          </tr>
          <tr> 
            <td height="20"><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <%'--------------------------------------  แสดง  สถานะของการสั่งซื้อของ   
 
   '-------------------------------------------  1.จำนวนสินค้าที่อยู่ในตะกร้า						
							sql = "Select  Count(*)  From  Basket  WHERE UserSessionID='" &session.sessionID&"'"
							Set rs = Server.CreateObject("ADODB.Recordset") 
							rs.Open sql,conn
							
							if not rs.EOF then%>
              &nbsp;&nbsp;&nbsp; <img src="images/next.gif" width="11" height="11">จำนวนสินค้าในตระกร้า&nbsp;&nbsp;<%=rs(0)%> &nbsp;รายการ
              <%
							else
				%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">จำนวนสินค้าในตระกร้า&nbsp;&nbsp;0 &nbsp;รายการ
              <%
			  end if			
			rs.close
			%>
              </font></td>
          </tr>
          <tr> 
            <td height="20"><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <% '------------------------------------------- 	2.จำนวน Supplier ที่ถูกสั่งซื้อใน Basket  ของ Buyer
 
   						sql = "Select  Distinct Catalog.SellerID  From Catalog ,Basket  Where Basket.ItemID=Catalog.ItemID AND Basket.UserSessionID='"&Session.SessionID&"' "
							Set rs = Server.CreateObject("ADODB.Recordset") 
							rs.Open sql,conn,1,1
							
							if not rs.EOF then%>
              &nbsp;&nbsp;&nbsp; <img src="images/next.gif" width="11" height="11">จากผู้ขาย&nbsp;<%=rs.recordCount%>&nbsp;ราย 
              <%
						else
						%>
              &nbsp;&nbsp;&nbsp; <img src="images/next.gif" width="11" height="11">จากผู้ขาย&nbsp;0&nbsp;ราย 
              <%
						 end if			
						rs.close
						%>
              </font></td>
          </tr>
          <tr> 
            <td height="20"><font face="MS Sans Serif, Microsoft Sans Serif"><font face="MS Sans Serif, Microsoft Sans Serif"><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <%
		'------------------------------------------- 	3.ราคาสินค้าที่อยู่ในตระก้า	
		
							sql = "Select  QTY,Catalog.ItemPrice,Catalog.ShipPrice  From Basket,Catalog  Where Basket.ItemID=Catalog.ItemID AND UserSessionID='"&Session.SessionID&"' "

							Set rs = Server.CreateObject("ADODB.Recordset") 
							rs.Open sql,conn,1,1
							
							if not rs.EOF then ' กรณีมีสินค้าในตระกร้า คิดเงินรวมออกมา
										sumPrice=0
										rs.movefirst
										Do while not rs.eof
										sumPrice=sumPrice+(rs(0)*(rs(1)+rs(2)))
										rs.movenext
										Loop%>
              &nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11">ราคาสินค้าทั้งหมด 
              <%=sumPrice%> บาท 
              <%else%>
              &nbsp;&nbsp;&nbsp; <img src="images/next.gif" width="11" height="11">ราคาสินค้าทั้งหมด 
              0 บาท<br>
              </font></font></font></td>
            <%end if%>
          </tr>
        </table>
      </td>
      <td width="364" height="221"> <br>
        <table width="87%" border="1" bordercolor="#FFF7E1" height="70%">
          <tr> 
            <td height="28" width="323"> <font face="MS Sans Serif, Microsoft Sans Serif"><font color="#CC3399"><b><font face="Microsoft Sans Serif" size="3" color="#DF0070">Product 
              Search</font></b></font></font></td>
          </tr>
          <tr> 
            <td height="157" bgcolor="#D5ECFD" bordercolor="#0066cc" nowrap width="323"> 
              <table width="314" border="0" height="100%">
                <tr> 
                  <td width="12%" height="33">&nbsp;</td>
                  <td width="30%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#00007d">Key 
                    word</font></b></font></td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input style=" FONT-SIZE: 11pt;  WIDTH: 120px; FONT-FAMILY: MS Sans Serif"  name="fKeyWord" 	>
                    </font></td>
                </tr>
                <tr> 
                  <td width="12%">&nbsp;</td>
                  <td width="30%"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="00007d">Category</font></b></font></td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fCategory" style="  FONT-SIZE: 9pt; WIDTH: 120px;  FONT-FAMILY: MS Sans Serif" >
                      <option value="0">ทั้งหมด</option>
                      <%' แสดง List  ของ Category
					  sql = "Select  *  From Category "
					  Set rsCategory=conn.Execute(sql,,CmdText)
					  Do Until  rsCategory.EOF  
                      response.write "<option value='"&rsCategory("CatID")&"'>"&rsCategory("CatName")&"</option>"
                      rsCategory.movenext
					  Loop
					  %>
                    </select>
                    </font></td>
                </tr>
                <tr> 
                  <td width="12%">&nbsp;</td>
                  <td width="30%"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="00007d">Supplier 
                    in</font></b> </font></td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fSupplier" style="  FONT-SIZE: 9pt; WIDTH: 120px;  FONT-FAMILY: MS Sans Serif" >
                      <option value="0">ทั้งหมด</option>
                      <option value="N">ภาคเหนือ</option>
                      <option value="C">ภาคกลาง</option>
                      <option value="S">ภาคใต้</option>
                      <option value="A">ภาคอีสาน</option>
                      <option value="W">ภาคตะวันตก</option>
                      <option value="E">ภาคตะวันออก</option>
                      <%' แสดง List ชื่อจังหวัด
					  		sql = "Select  ProvinceID,ProvinceName  From Province order by ProvinceName "
							Set rs=conn.Execute(sql,,CmdText)
								Do While not rs.EOF
										response.write  "<option value='"&rs("ProvinceID")&"'>"&rs("ProvinceName")&"</option>"
										rs.moveNext
								Loop
							rs.close
						%>
                    </select>
                    </font></td>
                </tr>
                <tr> 
                  <td width="12%" height="2">&nbsp;</td>
                  <td width="30%" height="2">&nbsp;</td>
                  <td width="58%" height="33"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px"type="Submit" value="search" 
        name="Submit2" >
                    </font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>

<%
sql="SELECT     COUNT(*) AS Expr1, ItemID   FROM         OrderDetail  GROUP BY ItemID   ORDER BY COUNT(*) DESC"
Set rs7 = Server.CreateObject("ADODB.Recordset") 
rs7.Open sql,conn,1,3




for i=1 to 10 

sql="Select * from catalog,Member  where id=sellerID AND  ItemId="&rs7(1)
Set rsCatalog = Server.CreateObject("ADODB.Recordset") 
rsCatalog.Open sql,conn,1,3


%>
<form name="form2" method="post" action="AddBasket.asp">
  <table width="853" border="0" height="197">
    <tr>
      <td width="90" height="206">&nbsp;</td>
      <td width="690" height="206"> 
        <table width="100%" border="0" height="144" bordercolor="#FFFFFF">
          <tr> 
            <td height="148" rowspan="7" bordercolor="#000000" width="28%"> 
              <div align="center"><a href="javascript:call_window('ItemDetail.asp?ItemID=<%=rsCatalog("ItemID")%>',440,500)"  > 
                <img src="ShowImageCatalog.asp?id=<%=rsCatalog("ItemID")%>" width="176" height="137" border="0"></a><br>
               <font face="MS Sans Serif, Microsoft Sans Serif"><b><br>
                <font color="#993366"><%=rsCatalog("ItemName")%></font></b></font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
                <input type="hidden" name="hiddenItemID" value="<%=RsCatalog("ItemID")%>">
                <input type="hidden" name="hiddenSupplierID" value="<%=RsCatalog("SellerID")%>">
                </font></div>
            </td>
            <td width="36%" height="148" rowspan="7" bordercolor="#0000FF"> 
              <table width="94%" border="1" align="center" cellspacing="10" height="100%" bordercolor="#000000" cellpadding="0">
                <tr>
                  <td bordercolor="#FFF7E6"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rsCatalog("ItemDescription")%></font></td>
                </tr>
              </table>
              <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> </font> 
            </td>
            <td width="9%" height="15" bgcolor="#6601C8"><b>&nbsp;<font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">Code</font></b></td>
            <td width="27%" height="15"><font size="-1">&nbsp;&nbsp;<%=rsCatalog("SellerItemID")%></font></td>
          </tr>
          <tr> 
            <td width="9%" height="9" bgcolor="#6601C8"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">&nbsp;Detail</font></b></td>
            <td width="27%" height="9"><font size="-1">&nbsp;&nbsp;<%=rsCatalog("ItemDetail")%> 
              </font></td>
          </tr>
          <tr> 
            <td width="9%" height="18" bgcolor="#6601C8"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">&nbsp;Unit</font></b></td>
            <td width="27%" height="18"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;<%=rsCatalog("ItemUnit")%> 
              </font></td>
          </tr>
          <tr> 
            <td width="9%" height="2" bgcolor="#6601C8"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">&nbsp;Price</font></b></td>
            <td width="27%" height="2"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;<%=rsCatalog("ItemPrice")%> 
              บาท </font></td>
          </tr>
          <tr> 
            <td width="9%" height="15" bgcolor="#6601C8"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#FFFFFF">&nbsp;Available</font></b></td>
            <td width="27%" height="15"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;&nbsp;<%=rsCatalog("Available")%></font></td>
          </tr>
          <tr> 
            <td width="9%" height="16" bgcolor="#6601C8"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">&nbsp;Supplier</font></b></td>
            <td width="27%" height="16"> 
              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="2" width="4%">&nbsp;</td>
                  <td height="2" width="96%"><font face="MS Sans Serif, Microsoft Sans Serif" size="-2"><%=RsCatalog("BizName")%></font></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td height="24" width="9%" bgcolor="#6601C8"> 
              <div align="left">&nbsp;<a href="javascript:call_window('ItemDetail.asp?ItemID=<%=rsCatalog("ItemID")%>',440,500)"  > 
               <font color="#FFFFFF" face="Microsoft Sans Serif" size="-1"> <b>More...</b></font></a></div>
            </td>
            <td height="24" width="27%"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;<font size="-1"><font size="-1"><font face="MS Sans Serif, Microsoft Sans Serif"><font face="MS Sans Serif, Microsoft Sans Serif"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
              <input type="submit" name="Order" value="  Order  "  style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 24px">
              </font></font></font></font></font> </font></td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <table width="852" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="72">&nbsp;</td>
      <td width="780"> 
        <hr>
      </td>
    </tr>
  </table>
</form>
<%
rsCatalog.close  
rs7.movenext
		
next
session("history")="topten.asp"
rs7.close
conn.close
%>
<br>
<br>
</body>
</html>

