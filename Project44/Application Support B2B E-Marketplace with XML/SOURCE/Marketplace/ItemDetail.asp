<html>
<head>
<title>ItemDetail</title>
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
<% 
ItemID=cint(request.queryString("ItemID") )
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

sql = "Select  *  From Catalog Where ItemID="&ItemID'เลือกรายละเอียดต่างๆ ของ Item นั้นออกมา
Set rs = Server.CreateObject("ADODB.Recordset") 
rs.Open sql,conn,1,3

'response.write  rs("ItemUnit")

%>
<form name="form1"  >
  <table width="440" border="1" cellspacing="0" bordercolor="#FFFFFF" height="418" cellpadding="0">
    <tr> 
      <td height="342" width="203" bordercolor="#000000"> 
        <div align="center"><br>
          <img src="ShowImageCatalog.asp?id=<%=ItemID%>" width="170" height="130"></div>
        <br>
        <table border="0" width="199" align="center">
          <tr>
            <td> 
              <p><font color="#0000CC"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">หมายเลขอ้างอิงสินค้า 
                :</font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">&nbsp;</font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"><%=ItemID%></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
                <br>
                <font color="882267">คำอธิบายสินค้า :</font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">&nbsp;</font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font color="#000000"><br>
                <textarea readonly name="fDescription" wrap="VIRTUAL" style="BORDER-RIGHT: #c0c0c0 1px solid; BORDER-TOP: #c0c0c0 1px solid;  FONT-SIZE: 9pt; BACKGROUND: #ffffff; BORDER-LEFT: 		
		#c0c0c0 1px solid; WIDTH: 185px; COLOR: #333333; BORDER-BOTTOM: #c0c0c0 1px solid; FONT-FAMILY: MS Sans Serif;HEIGHT: 95px"><%=rs("ItemDescription")%></textarea>
                </font></font></font><br>
                <b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><br>
                <font color="882267">จำนวนน้อยที่สุดที่สั่งได้ :</font> </font></b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif"><%=rs("MinOrder")%>&nbsp;หน่วย</font><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><br>
                <br>
                <font color="882267">วันที่ลง Catalog&nbsp;:</font></font></b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="882267">&nbsp;</font><font color="#000000"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=formatDateTime(rs("ItemAdd"),1)%></font></font><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#0000CC"><br>
                <br>
                <font color="882267">Last Update :</font></font><font color="882267">&nbsp;</font></b><font color="#000000"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=formatDateTime(rs("ItemUpdate"),1)%></font></font></p>
              </td>
          </tr>
        </table>
        
      </td>
      <td height="342" width="227" bordercolor="#000000"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        &nbsp;&nbsp;<font color="#882267">รหัสสินค้า&nbsp;: </font>&nbsp;</font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><font color="#000000"><%=rs("SellerItemID")%></font></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">ชื่อสินค้า :&nbsp;</font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><font color="#000000"><%=rs("ItemName")%></font></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">ร</font><font color="882267">ายละเอียด&nbsp;:</font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="882267">&nbsp;</font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><font color="#000000"><%=rs("ItemDetail")%></font></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">ประเภทสินค้า : </font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000">
        <%
		    sql = "Select  CatName  From Category Where CatID="&rs("CatID")
			Set rsCategory=conn.Execute(sql,,CmdText)
			response.write rsCategory(0)
			%>
        </font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">หน่วย:&nbsp;</font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><font color="#000000"><%=rs("ItemUnit")%></font></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">ราคา :&nbsp;</font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"><%=rs("itemPrice")%></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"> 
        </font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000">&nbsp;บาท&nbsp;/หน่วย</font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">จำนวนสินค้าที่มี :&nbsp;</font></font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><font color="#000000"><%=rs("Available")%></font></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000">&nbsp;</font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">หน่วย</font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#0000CC"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">น้ำหนักสินค้า&nbsp;: </font>&nbsp;</font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rs("itemWeigh")%></font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#882267">&nbsp;</font></b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1">กรัม</font><b><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#882267"><br>
        <br>
        &nbsp;&nbsp;<font color="882267">จำนวนวันที่ลูกค้าจะได้รับสินค้า</font><br>
        <br>
        <%
		Sql="Select EMS,FedEx,Sent From Member Where ID="&rs("SellerID")
		set rs1=conn.execute(sql,,cmdText)
				if rs1("EMS")=true then
						response.write "&nbsp;&nbsp;&nbsp;&nbsp;•&nbsp;กสท.(EMS)  : &nbsp;</b><font color='#000000'>"&_
														rs("dayEms")&"&nbsp; วัน</font><b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ค่าส่ง&nbsp;</b><font color='#000000'>"&_
														rs("EmsPrice")&"&nbsp;บาท/หน่วย</font><b><br><br>"
				end if
				if rs1("FedEx")=true then
						response.write "&nbsp;&nbsp;&nbsp;&nbsp;•&nbsp;FedEx  : &nbsp;</b><font color='#000000'>"&_
														rs("dayFedEx")&"&nbsp; วัน</font><b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ค่าส่ง&nbsp;</b><font color='#000000'>"&_
														rs("FedExPrice")&"&nbsp;บาท/หน่วย</font><b><br><br>"
				end if
				if rs1("Sent")=true then
						response.write "&nbsp;&nbsp;&nbsp;&nbsp;•&nbsp;ผู้ขายส่งเอง  : &nbsp;</b><font color='#000000'>"&_
														rs("daySent")&"&nbsp; วัน</font><b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ค่าส่ง&nbsp;</b><font color='#000000'>"&_
														rs("ShipPrice")&"&nbsp;บาท/หน่วย</font><b><br><br>"
				end if
		rs1.close
		%>
        </font></b></td>
    </tr>
    <tr> 
      <td height="60" colspan="2"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
          <input type="button" name="Submit2" value="  Close  " onClick=window.close() style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 10pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 22px">
          </font></font><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><br>
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

%>
