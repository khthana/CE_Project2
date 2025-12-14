<%	response.Buffer = true ' เพราะจะใช้ Response.redirect%>



<%	Set Conn = Server.CreateObject("ADODB.Connection")
		conn.Open="Driver={sql server}; server=market; database=marketplace;"

		if (request.querystring("status")="ok") then   'กรณีมีการกดปุ่ม Summit แล้ว จะทำส่วนนี้  คือเอาข้อมูลใน Form ลง Database

		'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

		Set upload = Server.CreateObject("Dundas.Upload.2")
		upload.SaveToMemory


Set file = upload.Files("fItemImage")



Set rs = Server.CreateObject("ADODB.Recordset") 
sql = "Select  *  From Catalog"
rs.Open sql,conn,1,3

sql="select  max(ItemID) from Catalog"
set rs1=conn.execute(sql,,cmdText)
ItemID=rs1(0)+1


rs.addnew

rs("ItemID")=ItemID
rs("SellerID")=upload.form("fSellerID")
rs("SellerItemID")=upload.form("fSellerItemID")
rs("ItemName")=upload.form("fItemName")
rs("CatID")=upload.form("fCategory")
rs("ItemDetail")=upload.form("fItemDetail")
rs("ItemDescription")=upload.form("fDescription")
rs("ItemUnit")=upload.form("fItemUnit")
rs("ItemPrice")=upload.form("fPrice")
rs("Available")=upload.form("fAvailable")

rs("DaySent")=upload.form("fSent")
rs("DayFedEx")=upload.form("fFedEx")
rs("DayEMS")=upload.form("fEms")
rs("stop")=false
rs("MinOrder")=upload.form("fmin")
Weigh=upload.form("fWeigh")
rs("ItemWeigh")=Weigh
rs("ShipPrice")=upload.form("fShip")

sql5="Select  max(Price) From Ems Where Weigh<"&Weigh
set rsEms=conn.execute(sql5,,cmdText)
	EmsPrice=rsEms(0)
rsEms.close
rs("EmsPrice")=EmsPrice
rs("FedExPrice")=EmsPrice+(0.15*EmsPrice)




for each file in upload.Files 
rs("ItemImage")=file.Binary
next
rs("ItemAdd")=now
rs("ItemUpdate")=now
rs.Update
rs.Close
rs1.close
conn.Close

response.redirect("ManageCatalog.asp")
				
		
		else	
' Show Form เพื่อรับข้อมูลของสินค้าที่เพิ่มเข้ามา	
'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

<html>
<head>
<title>Add Item</title>
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
<body bgcolor="#FFFFFF" background="images/bg17.jpg" onload=" document.AddNew.fSellerItemID.focus()">
<div id="Layer1" style="position:absolute; left:684px; top:167px; width:275px; height:88px; z-index:1"> 
  <p><font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#993366"><%=session("BizName")%></font><br>
    <font color="993366">จำนวนสินค้าที่มีในปัจจุบัน 
    <%
	sql1="Select Count(*) From Catalog Where SellerID="&session("SellerID")
	Set rsNumber = Server.CreateObject("ADODB.Recordset") 
	rsNumber.Open sql1,conn
	response.write rsNumber(0)
	rsNumber.close
	
	
	sql2="Select  EMS,FedEx,Sent From Member Where ID="&session("SellerID")
	set rsSent=conn.execute(sql2,,CmdText)
	%>
    รายการ</font></b><br>
    </font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> </font></p>
</div>
<p>&nbsp;</p>
<img src="images/AddItem.gif" width="1003" height="110" usemap="#Map" border="0"> 
<map name="Map">
  <area shape="rect" coords="607,93,659,113" href="home.asp">
  <area shape="rect" coords="676,92,759,113" href="MainMenu.asp">
  <area shape="rect" coords="771,91,897,115" href="ManageCatalog.asp">
  <area shape="rect" coords="913,90,988,113" href="SignOut.asp">
</map>
<br>
<br>
<table width="780" border="0">
  <tr> 
    <td width="80">&nbsp;</td>
    <td width="674"><b><font face="MS Sans Serif, Microsoft Sans Serif"><img src="images/next.gif" width="11" height="11"><img src="images/next.gif" width="11" height="11">ใส่รายละเอียดของสินค้าที่ต้องการเพิ่มลงใน 
      Catalog </font></b></td>
    <td width="12">&nbsp;</td>
  </tr>
</table>
<form name="AddNew"  enctype="multipart/form-data" method="post" action="AddNewItem.asp?status=ok">
  <table width="780" border="0">
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">รหัสสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="40" width="431"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fSellerItemID" 	
		>
        </font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">ชื่อสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="40" width="431"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fItemName" 	
		>
        </font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">ประเภทสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="40" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <select name="fCategory" style="  FONT-SIZE: 9pt; WIDTH: 120px;  FONT-FAMILY: MS Sans Serif" >
          <option></option>
          <%' แสดง List  ของ Category
					  sql = "Select  *  From Category "
					  Set rsCategory=conn.Execute(sql,,CmdText)
					  Do Until  rsCategory.EOF  
                      response.write "<option value="&rsCategory("CatID")&">"&rsCategory("CatName")&"</option>"
                      rsCategory.movenext
					  Loop
					  rsCategory.close
					  %>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">รายละเอียดสินค้า<br>
        </font></b><font face="MS Sans Serif, Microsoft Sans Serif"><font size="-1">(สี,ขนาด,รูปแบบ)</font></font></td>
      <td height="40" width="431"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 120px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fItemDetail" 	
		>
        </font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">คำโฆษณาสินค้า</font></b></td>
      <td height="40" width="431"> 
        <textarea name="fDescription" wrap="VIRTUAL" style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 180px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif;HEIGHT: 75px"></textarea>
      </td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">รูปภาพสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif"></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><br>
        </font></b></td>
      <td height="40" width="431"> 
        <input type="File" name="fItemImage">
      </td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">หน่วยของสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="40" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fItemUnit" 	
		>
        </font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">ราคาสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif"></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="40" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fPrice" 	
		>
        <font size="-1"> บาท/หน่วย</font></font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">น้ำหนักสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="40" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fweigh" 	
		>
        <font size="-1">กรัม</font> </font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif">จำนวนสินค้าที่มี</font><font face="MS Sans Serif, Microsoft Sans Serif"></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="40" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fAvailable" 	
		>
        <font size="-1">หน่วย</font></font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="50"><b><font face="MS Sans Serif, Microsoft Sans Serif">จำนวนสินค้าขั้นต่ำ<br>
        ที่อนุญาตให้สั่ง</font><font face="MS Sans Serif, Microsoft Sans Serif"></font><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></td>
      <td height="50" width="431"> <font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fmin" 	
		>
        </font><font face="Microsoft Sans Serif" size="-1">หน่วย </font></td>
      <%
	if rsSent("EMS")=true then
	%>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="50"><font face="Microsoft Sans Serif"><b>จำนวนวันที่สินค้าจะไปถึง<br>
        ลูกค้าโดยใช้บริการ กสท.</b></font><font face="Microsoft Sans Serif" color="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></font></td>
      <td height="50" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fEms" 	
		>
        <font size="-1">วัน</font></font></td>
    </tr>
    <%
	end if

	if rsSent("FedEx")=true then
	%>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="50"><font face="Microsoft Sans Serif"><b>จำนวนวันที่สินค้าจะไปถึง<br>
        ลูกค้าโดยใช้บริการ FedEx</b></font><font face="Microsoft Sans Serif" color="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></font></td>
      <td height="50" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fFedEx" 	
		>
        <font size="-1">วัน</font></font></td>
    </tr>
    <%
	end if

	if rsSent("Sent")=true then
	%>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="50"><font face="Microsoft Sans Serif"><b>จำนวนวันที่สินค้าจะไปถึง<br>
        ลูกค้าโดยผู้ขายส่งเอง</b></font><font face="Microsoft Sans Serif" color="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></font></td>
      <td height="50" width="431"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fSent" 	
		>
        <font size="-1">วัน</font></font></td>
    </tr>
    <tr> 
      <td width="143" height="40">&nbsp;</td>
      <td width="192" height="50"><font face="Microsoft Sans Serif"><b>ระบุค่าขนส่ง<font face="Microsoft Sans Serif" color="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><font color="#FF0000">*</font></font></b></font></b></font></td>
      <td height="50" width="431"> 
        <p><font face="MS Sans Serif, Microsoft Sans Serif"> 
          <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fShip" 	
		>
          </font><font face="Microsoft Sans Serif" size="-1">บาท &nbsp;&nbsp;(ในกรณีที่ส่งฟรีให้ใส่ 
          0 )</font></p>
      </td>
    </tr>
    <%
	end if
	%>
  </table>
  <div align="center">
    <hr>
    <b><br>
    <input type="reset" name="Submit2" value=" Clear " style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px">
    &nbsp; </b> 
    <input type="submit" name="Submit" value="Submit" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px">
    <br>
    <!--อ่านค่า Seller ID มาซ่อนไว้-->
    <input type="hidden" name="fSellerID"  value="<%=session("sellerID")%>" >
  </div>
</form>
<p>&nbsp;</p>
</body>
</html><%
rsSent.close
conn.close
end if
%>
