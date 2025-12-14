<%response.Buffer = true ' เพราะจะใช้ Response.redirect%>


<% if request.querystring("status")<>"ok" then  'ถ้ายังไม่มีการกดปุ่ม Submit       //ให้ Show ข้อมูลของ สินค้ารายการนั้นออกมา
'-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ItemID=cint(request.queryString("ItemID") )
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

sql = "Select  *  From Catalog Where ItemID="&ItemID'เลือกรายละเอียดต่างๆ ของ Item นั้นออกมา
'Set rs=conn.Execute(sql,,CmdText)
Set rs = Server.CreateObject("ADODB.Recordset") 
'sql = "Select  *  From Catalog Where ItemID="&ItemID'เลือกรายละเอียดต่างๆ ของ Item นั้นออกมา
rs.Open sql,conn,1,3
%>
<html>
<head>
<title>Edit Item</title>
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
<script Language="Javascript">
<!--
function Conf(object) {  
	if (confirm("คุณต้องการที่จะ Reset รายละเอียดทั้งหมดของสินค้าชนิดนี้")==true)
	{
	 return true;
	}
	return false;
}


//-->
</script>



<body bgcolor="#FFFFFF" background="images/bg17.jpg">
<form name="form1"  enctype="multipart/form-data"  method="post" action="EditItem.asp?status=ok">
  <table width="495" border="1" cellspacing="1" bordercolor="#FFFFFF" height="503">
    <tr bordercolor="#000000"> 
      <td height="300" rowspan="9" width="245"> 
        <div align="center"><br>
          <img src="ShowImageCatalog.asp?id=<%=ItemID%>" width="170" height="130"><br>
          <font size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000">หมายเลขอ้างอิงสินค้า</font><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000"></font><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#000000">&nbsp;<%=ItemID%></font></b></font> 
          <br>
          <br>
          <font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><b><font color="#9A2775">รูปภาพ</font></b></font> 
          <input type="File" name="fItemImage" size="15" style=" FONT-FAMILY: MS Sans Serif"   >
          <br>
          <br>
          <textarea name="fDescription" wrap="VIRTUAL" style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 220px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif;HEIGHT: 110px"><%=rs("ItemDescription")%></textarea>
          <font face="MS Sans Serif, Microsoft Sans Serif"> </font> </div>
      </td>
      <td width="93" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">&nbsp;รหัสสินค้า</font></b></td>
      <td width="139" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fSellerItemID" value="<%=rs("SellerItemID")%>" 	
		>
        </font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
        <input type="hidden" name="fItemID" value="<%=ItemID%>">
        </font></td>
    </tr>
    <tr> 
      <td width="93" height="40" bordercolor="#333333"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><b><font color="882267">&nbsp;ชื่อสินค้า</font></b></font></td>
      <td width="139" bordercolor="#333333" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fItemName" value="<%=rs("ItemName")%>" 	
		>
        </font></td>
    </tr>
    <tr> 
      <td width="93" bordercolor="#333333" height="40"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">&nbsp;ประเภทสินค้า</font></b></td>
      <td width="139" bordercolor="#333333" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <select name="fCategory" style="  FONT-SIZE: 9pt; WIDTH: 90px;  FONT-FAMILY: MS Sans Serif" >
          <option value=<%=rs("CatID")%>><font face="MS Sans Serif, Microsoft Sans Serif"> 
          <%
		    sql = "Select  CatName  From Category Where CatID="&rs("CatID")
			Set rsCategory=conn.Execute(sql,,CmdText)
			response.write rsCategory(0)
			%>
          </font></option>
          <%' แสดง List  ของ Category
					  sql = "Select  *  From Category "
					  Set rsCategory=conn.Execute(sql,,CmdText)
					  Do Until  rsCategory.EOF  
                      response.write "<option value="&rsCategory("CatID")&">"&rsCategory("CatName")&"</option>"
                      rsCategory.movenext
					  Loop
					  %>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td width="93" height="40" bordercolor="#333333"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">&nbsp;หน่วย</font></b></td>
      <td width="139" bordercolor="#333333" height="40"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fItemUnit" value="<%=rs("ItemUnit")%>" 	
		>
        </font></td>
    </tr>
    <tr> 
      <td width="93" height="40" bordercolor="#333333"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">&nbsp;ราคา</font></b></td>
      <td width="139" height="40" bordercolor="#333333"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fItemPrice" value="<%=rs("itemPrice")%>" 	
		>
        <font color="#0000CC" size="-1"> <font color="#000000">บาท</font></font></font></td>
    </tr>
    <tr> 
      <td width="93" height="40" bordercolor="#333333"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">&nbsp;รายละเอียด</font></b></td>
      <td width="139" height="40" bordercolor="#333333"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        </font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> &nbsp; 
        <textarea name="fItemDetail" wrap="VIRTUAL"style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif;HEIGHT: 35px"><%=rs("ItemDetail")%></textarea>
        </font></td>
    </tr>
    <tr> 
      <td width="93" height="40" bordercolor="#333333"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC">&nbsp;</font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><font color="882267"><b>จำนวนสินค้า</b></font></font></td>
      <td width="139" height="40" bordercolor="#333333"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fItemAvailable" value="<%=rs("Available")%>" 	
		>
        <font size="-1">หน่วย</font></font></td>
    </tr>
    <tr> 
      <td height="40" bordercolor="#333333"><font face="Microsoft Sans Serif" size="-1" color="#0000CC"><b>&nbsp;</b><font color="882267"><b>น้ำหนักสินค้า</b></font></font></td>
      <td height="40" bordercolor="#333333"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fweigh" value="<%=rs("itemWeigh")%>" 	
		>
        <font size="-1">กรัม</font></font><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; </font></td>
    </tr>
    <tr> 
      <td height="40" bordercolor="#333333"><font color="882267"><b>&nbsp;<font face="Microsoft Sans Serif" size="-1">จำนวนน้อยที่สุด<br>
        &nbsp;ที่าสามารถสั่งได้</font></b></font></td>
      <td height="40" bordercolor="#333333"><font face="MS Sans Serif, Microsoft Sans Serif"> 
        &nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 90px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fmin" value="<%=rs("MinOrder")%>" 	
		>
        <font size="-1">หน่วย</font></font></td>
    </tr>
    <tr bordercolor="#000000"> 
      <td height="165" colspan="3"> <font color="#0000CC" size="-1" face="MS Sans Serif, Microsoft Sans Serif"><b>&nbsp;&nbsp;&nbsp;</b><font color="#882267"><b>จำนวนวันที่ของจะถูกส่งไปยังลูกค้า</b></font></font> 
        <br>
        <br>
        <%
		Sql="Select EMS,FedEx,Sent From Member Where ID="&rs("SellerID")
		set rs1=conn.execute(sql,,cmdText)
				if rs1("EMS")=true then%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font face="Microsoft Sans Serif" color="#0000CC"><font size="-1" color="882267">• 
        โดยใช้บริการ กสท.</font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" color="882267"> 
        </font><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 40px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fEms" value="<%=rs("DayEms")%>" 	
		>
        <font size="-1">วัน&nbsp;</font>&nbsp;<font size="-1"><font color="882267"><b>ค่าขนส่ง</b></font></font> 
        &nbsp; 
        <input  readonly style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 50px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fSent3" value="<%=rs("EmsPrice")%>" 	
		>
        <font size="-1">บาท/หน่วย</font> </font> 
        <%
				end if
				if rs1("FedEx")=true then%>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;<font face="Microsoft Sans Serif" color="#0000CC"><b><font size="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b><font size="-1"><font color="882267"><b>• 
        โดยใช้บริการ FedEx</b></font></font></font><font face="MS Sans Serif, Microsoft Sans Serif" color="882267"> 
        </font><font face="MS Sans Serif, Microsoft Sans Serif"> 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 40px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fFedEx" value="<%=rs("DayFedEx")%>" 	
		>
        <font size="-1">วัน&nbsp;</font>&nbsp;<b><font color="882267" size="-1">ค่าขนส่ง</font></b> 
        &nbsp; 
        <input  readonly style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 50px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fSent2" value="<%=rs("FedExPrice")%>" 	
		>
        <font size="-1">บาท/หน่วย</font> </font> 
        <%
				end if
				if rs1("Sent")=true then%>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;<font face="Microsoft Sans Serif" color="#0000CC"><b><font size="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b><font size="-1"><font color="882267"><b>• 
        โดยผู้ขายส่งเอง</b></font> </font></font><font face="MS Sans Serif, Microsoft Sans Serif" color="882267"> 
        &nbsp;</font><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 40px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fSent" value="<%=rs("DaySent")%>" 	
		>
        <font size="-1">วัน</font>&nbsp; <font color="882267" size="-1"><b>ค่าขนส่ง</b></font>&nbsp; 
        <input style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 50px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif"  name="fShip" value="<%=rs("ShipPrice")%>" 	
		>
        <font size="-1">บาท/หน่วย</font> </font> 
        <%
				end if
		rs1.close
		%>
        <div align="center">
          <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
          <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <input type="button" name="Submit2" value="Close" onClick=window.close() style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px">
          </font></font> 
          <input type="reset" name="Submit3" value="Reset" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px" onClick="return Conf(this)">
          </font></font></font></font> <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <input type="submit" name="Submit" value="Update"style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px">
          </font></font></font></font> </div>
      </td>
    </tr>
    <tr bordercolor="#FFFFFF"> 
      <td height="6" colspan="3"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          </font><font face="MS Sans Serif, Microsoft Sans Serif"> </font><font face="MS Sans Serif, Microsoft Sans Serif"> 
          </font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> </font> 
          </font></font></div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<%
rs.close
conn.close
else 'กดปุ่ม Update แล้วจะทำการเก็บข้อมูลใหม่ลง DB
'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Set upload = Server.CreateObject("Dundas.Upload.2")
upload.SaveToMemory


Set file = upload.Files("fItemImage")

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"


Set rs = Server.CreateObject("ADODB.Recordset") 
sql = "Select  *  From Catalog where ItemID="&upload.form("fItemID")
rs.Open sql,conn,1,3


rs("ItemName")=upload.form("fItemName")
rs("ItemDetail")=upload.form("fItemDetail")
rs("SellerItemID")=upload.form("fSellerItemID")
rs("CatID")=upload.form("fCategory")
rs("ItemPrice")=upload.form("fItemPrice")
rs("Available")=upload.form("fItemAvailable")
rs("ItemUnit")=upload.form("fItemUnit")
rs("ItemDescription")=upload.form("fDescription")
rs("ItemUpdate")=now



rs("DaySent")=upload.form("fSent")
rs("DayEms")=upload.form("fEms")
rs("DayFedEx")=upload.form("fFedEx")
rs("itemWeigh")=upload.form("fWeigh")
rs("MinOrder")=upload.form("fmin")
rs("ShipPrice")=upload.form("fship")

sql5="Select  max(Price) From Ems Where Weigh<"&upload.form("fWeigh")
set rsEms=conn.execute(sql5,,cmdText)
	EmsPrice=rsEms(0)
rsEms.close
rs("EmsPrice")=EmsPrice
rs("FedExPrice")=EmsPrice+(0.15*EmsPrice)



for each file in upload.Files 
	rs("ItemImage")=file.Binary
next


rs.Update
rs.Close
conn.Close
response.redirect ("AlreadyUpdate.asp?ItemID="&upload.form("fItemID").value)
end if
%>
