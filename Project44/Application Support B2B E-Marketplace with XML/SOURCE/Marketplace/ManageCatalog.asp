<% 'ASP Function
Function Color(FontColor)
						
						response.write "<font face='MS Sans Serif, Microsoft Sans Serif' size='-1' color="&FontColor&">"

end Function
%>

<html>
<head>
<title>Manage Catalog</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #000000; text-decoration: none}
a:visited { color: #000000; text-decoration: none}
a:active { color: #000000; text-decoration: underline}
a:hover { color: #0000ff; text-decoration: underline}
-->
</style>


</head>

<body  background="images/bg17.jpg" text="#000000">
<%
Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

order=request.querystring("arrange")

if order="" then
	order="sellerItemID"
end if

'response.write order

if request("fkeyword")="" then
		keyword=request.querystring("keyword")
else
		keyword=request("fkeyword")
end if

if request("fCategory")="" then
		category=request.querystring("category")
else
		category=request("fCategory")
end if

if category="" then
		category=0
end if

sql = "Select  *  From Catalog Where SellerID="&session("SellerID")&" and (ItemName like  '%"&keyword&"%' or  SellerItemID like  '%"&_
			keyword&"%'  or  ItemDetail like  '%"&keyword&"%' or  ItemUnit  like  '%"&keyword&"%') "
			

if category<>0  then
				sql=sql&" and CatID="&category
end if


sql=sql&" order by "&order
'response.write sql

Set rs = Server.CreateObject("ADODB.Recordset") 
rs.Open sql,conn,1,1

if  not rs.EOF then  ' มีสินค้าใน Catalog อยู่แล้ว%>
<p>&nbsp;</p><form name="form1" method="post" action="ManageCatalog.asp">
  <img src="images/ManageCatalog.gif" width="1003" height="110" usemap="#Map" border="0"> 
  <map name="Map">
    <area shape="rect" coords="818,94,912,111" href="mainmenu.asp">
    <area shape="rect" coords="925,91,992,109" href="Signout.asp">
  </map>
  <table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="72">&nbsp;</td>
      <td width="355"> <br>
        <table width="94%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="21"><b><font face="Microsoft Sans Serif" color="993366"><%=session("BizName")%></font></b></td>
          </tr>
          <tr>
            <td></td>
          </tr>
          <tr> 
            <td height="41"><font face="Microsoft Sans Serif"><b>มีสินค้าใน Cataog 
              : 
              <%
	sql1="Select Count(*) From Catalog Where SellerID="&session("SellerID")
	Set rsNumber = Server.CreateObject("ADODB.Recordset") 
	rsNumber.Open sql1,conn
	response.write rsNumber(0)
	rsNumber.close
	%>
              รายการ</b></font></td>
          </tr>
        </table>
      </td>
      <td width="573"> 
        <table width="488" border="1" bordercolor="#FFFAE8" height="71">
          <tr> 
            <td height="15" width="478" bordercolor="#FFF8EA"> <font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#DF0070"><br>
              Product Search</font></b></font> </td>
          </tr>
          <tr> 
            <td bgcolor="#D5ECFD" bordercolor="#0066cc" nowrap width="478" height="38"><font face="MS Sans Serif, Microsoft Sans Serif"> 
              <table border="0" width="100%" cellspacing="0" cellpadding="0">
                  <tr> 
                    
                  <td width="89" height="52"><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;<b>Key 
                    word</b>&nbsp;</font></td>
                    
                  <td width="120" height="52"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input style=" FONT-SIZE: 11pt; BACKGROUND: #ffffff;  WIDTH: 110px; COLOR: #333333;  FONT-FAMILY: MS Sans Serif"  name="fKeyWord" 	
		>
                      </font></td>
                    
                  <td width="82" height="52"><font face="MS Sans Serif, Microsoft Sans Serif"><b>Category</b></font></td>
                    
                  <td width="119" height="52"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <select name="fCategory" style="  FONT-SIZE: 9pt; WIDTH: 110px;  FONT-FAMILY: MS Sans Serif" >
                        <option value="0"><font face="MS Sans Serif, Microsoft Sans Serif">ทั้งหมด</font></option>
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
                    
                  <td width="68" height="52"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                    <input style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px"type="Submit" value="search" 
        name="Submit" >
                      </font></td>
                  </tr>
                </table>
              </font></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="935" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        <hr>
      </td>
    </tr>
  </table>
  <br>
</form>
<font face="MS Sans Serif, Microsoft Sans Serif"> </font> 
<table width="780" border="0">
  <tr> 
    <td width="65" height="23">&nbsp;</td>
    <td width="705"> <font face="MS Sans Serif, Microsoft Sans Serif"><b><font color="#0000CC"> 
      <%
	  if   keyword<>""  then
      response.write "Key word&nbsp;&quot;"&keyword&"&quot;&nbsp; "
      end if 
      
			
				sql="select  CatName From Category where CatID="&category'cint(request("fCategory"))
				
				Set rsCategory = Server.CreateObject("ADODB.Recordset") 
				rsCategory.Open sql,conn
				if not rsCategory.EOF then
 				response.write "Category&nbsp;&quot;"&rsCategory(0)&"&quot;"
				else
				response.write "All Category"
				end if
				rsCategory.close
				%>
      &nbsp;พบ&nbsp;<%=rs.recordCount%>&nbsp; รายการ</font></b></font> </td>
  </tr>
</table>
<form name="form2" method="post" action="Operate.asp?arrange=ItemName&category=<%=category%>&keyword=<%=keyword%>">
  <table width="900" border="0">
    <tr> 
      <td width="57" height="4">&nbsp;</td>
      <td width="207" height="4"> 
        <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif">Arrange 
          By</font><font face="MS Sans Serif, Microsoft Sans Serif"></font><font face="MS Sans Serif, Microsoft Sans Serif">&nbsp;</font></b> 
          <select name="fArrange" style="  FONT-SIZE: 9pt; WIDTH: 90px;  FONT-FAMILY: MS Sans Serif"   onChange="Arrange();">
            <option>--- Select ---</option>
            <option value="4">Code</option>
            <option value="1">ชื่อสินค้า</option>
            <option value="2">ประเภทสินค้า</option>
            <option value="3">ราคาสินค้า</option>
            <option value="6">วันที่ลงทะเบียนสินค้า</option>
            <option value="5">จำนวนสินค้า</option>
          </select>
        </div>
      </td>
      <td height="4" width="460"> 
        <div align="right"> &nbsp;&nbsp;</div>
      </td>
      <td height="4" width="158">
        <div align="right"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="105" height="21">
            <param name="BASE" value=".">
            <param name="BGCOLOR" value="#FFFFFF">
            <param name=movie value="AddNew.swf">
            <param name=quality value=high>
            <embed src="AddNew.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="105" height="21" bgcolor="#FFFFFF" base=".">
            </embed> 
          </object></div>
      </td>
    </tr>
  </table>
  <table width="902" border="0" height="70">
    <tr> 
      <td width="64" height="108">&nbsp;</td>
      <td height="108"> 
        <table width="100%" border="1" cellspacing="0" cellpadding="1">
          <tr bgcolor="#6601C8"> 
            <td height="28" width="74"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><b><b><b><b></b></b></b></b></font></div>
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">รหัสสินค้า</font></b></font></div>
            </td>
            <td width="139" height="28"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF" face="MS Sans Serif, Microsoft Sans Serif">ชื่อสินค้า</font></b></font></div>
            </td>
            <td width="136" height="28"> 
              <div align="center"><b><font size="-1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">รายละเอียดสินค้า</font></b></div>
            </td>
            <td width="113" height="28" bgcolor="#6601C8"> 
              <div align="center"><font size="-1"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">ประเภทสินค้า</font></b></font></div>
            </td>
            <td width="56" height="28"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                จำนวน<br>
                สินค้า</font></font></b></font></div>
            </td>
            <td width="68" height="28"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF" face="MS Sans Serif, Microsoft Sans Serif">หน่วย</font></b></font></div>
            </td>
            <td width="67" height="28">
              <div align="center"><font size="-1" color="#FFFFFF"><b>จำนวนที่ขายได้</b></font></div>
            </td>
            <td width="67" height="28"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF"><font face="MS Sans Serif, Microsoft Sans Serif">ราคา/หน่วย</font></font></b></font></div>
            </td>
            <td width="81" height="28"> 
              <div align="center"><b><font face="Microsoft Sans Serif" size="-1" color="#FFFFFF">วันที่ลงทะเบียน</font></b></div>
            </td>
            <td width="56" height="28"> 
              <div align="center"><font size="-1"><b><font color="#FFFFFF"><font face="MS Sans Serif, Microsoft Sans Serif">แก้ไข</font></font></b></font></div>
            </td>
          </tr>
          <%
		  Dim ii  'counter ในการวนลูป
		  ii=0
 		  Do Until  rs.EOF  
		  ii=ii+1
		  %>
          <tr> 
            <td width="74" height="32"> 
              <%
			 ' ----- ส่วนที่ระบุสีที่จะแสดงรายการนั้น
			  if  (rs("stop")=False) then
					if rs("available")<>"0" then
							FontColor="#000000" 'Black
					else
						    FontColor="#FF0000" 'Red
				end if	
			else
				FontColor="#0000FF" ' Blue
			end if%>
              <input type="checkbox" name="f<%=ii%>" value="<%=rs("ItemID")%>">
              <a href="javascript:call_window('ItemDetail.asp?ItemID=<%=rs("ItemID")%>',440,500)"> 
              <%color( FontColor)%>
              <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rs("SellerItemID")%></font> 
              </a></td>
            <td width="139" height="32"> 
              <table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr> 
                  <td><a href="javascript:call_window('ItemDetail.asp?ItemID=<%=rs("ItemID")%>',440,500)"  > 
                    <%color( FontColor)%>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rs("ItemName")%></font></a></td>
                </tr>
              </table>
            </td>
            <td width="136" height="32"> 
              <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr> 
                  <td><a href="javascript:call_window('ItemDetail.asp?ItemID=<%=rs("ItemID")%>',440,500)"  > 
                    <%color( FontColor)%>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"><%=rs("ItemDetail")%></font></a></td>
                </tr>
              </table>
            </td>
            <td width="113" height="32"> 
              <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr> 
                  <td><a href="javascript:call_window('ItemDetail.asp?ItemID=<%=rs("ItemID")%>',440,500)"  > 
                    <%color( FontColor)%>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="-1"> 
                    <%Set rs1 = Server.CreateObject("ADODB.Recordset") 
				sql = "Select CatName  From Category  Where CatID="&rs("CatID")
				rs1.Open sql,conn,1,3
			  response.write   rs1("CatName")
			  rs1.close%>
                    </font></a></td>
                </tr>
              </table>
            </td>
            <td width="56" height="32"> 
              <div align="right"><a href="javascript:call_window('ItemDetail.asp?ItemID=<%=rs("ItemID")%>',440,500)"  > 
                <%color( FontColor)%>
                <%=rs("Available")%></a>&nbsp;&nbsp; </div>
            </td>
            <td width="68" height="32"> 
              <div align="center"> 
                <%color( FontColor)%>
                <%=rs("ItemUnit")%> </div>
            </td>
            <td width="67" height="32"> 
              <div align="right"><font face="Microsoft Sans Serif" size="-1"> 
                <%color( FontColor)%><%
			sql="select SUM(OrderQTY) From PO,OrderDetail where  ItemID="&rs("ItemID") &" AND OrderDetail.PRID=PO.PRID AND  POStatus IN ( 'accepted','partially delivered','delivered')"
			Set rs1 = Server.CreateObject("ADODB.Recordset") 
			rs1.Open sql,conn,1,3
			if  isnull(rs1(0)) then
			response.write "0"
			else
			
			response.write rs1(0)
			
			end if
			rs1.close
			%>
                &nbsp;&nbsp;&nbsp; </font></div>
            </td>
            <td width="67" height="32"> 
              <div align="right"> &nbsp; 
                <%color( FontColor)%>
                <%=rs("ItemPrice")%>&nbsp;<font face="Microsoft Sans Serif" size="-1">฿</font>&nbsp;</div>
            </td>
            <td width="81" height="32"> 
              <div align="center"><font face="Microsoft Sans Serif" size="-1"> 
                <%color( FontColor)%>
                <%=day(rs("ItemAdd"))&"/"&month(rs("ItemAdd"))&"/"&year(rs("ItemAdd"))-1957%></font></div>
            </td>
            <td width="56" height="32"> 
              <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="-1" color="#000000"><a href="javascript:call_window('EditItem.asp?ItemID=<%=rs("ItemID")%>',496,532)"><img src="images/EDIT.GIF" border="0"></a></font></div>
            </td>
          </tr>
          <%
		  rs.movenext
		  Loop %>
        </table>
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"> 
          <img src="images/Red.jpg" width="13" height="13">&nbsp;<font size="-1">&nbsp;สินค้าหมด</font>&nbsp;&nbsp;&nbsp;&nbsp;</font><img src="images/Blue.jpg" width="13" height="13">&nbsp;&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="-1">นำสินค้าออกจาก 
          Catalog ชั่วคราว</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="reset" name="Submit5" value="Reset" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px">
          &nbsp; 
          <input type="submit" name="Submit2" value="Delete" onClick="SetOperator('Delete');return Conf(this);" style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px">
          &nbsp; 
          <input type="submit" name="Submit3" value="Deactivate" onClick=SetOperator('Off') style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px ">
          &nbsp; 
          <input type="submit" name="Submit4" value="Activate  " onClick=SetOperator('On') style="BORDER-RIGHT: #4c4c4c 1px solid; BORDER-TOP: #e8e8e8 1px solid; FONT-SIZE: 11pt; BACKGROUND: #9b9b9b; BORDER-LEFT: 
		#e8e8e8 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #4c4c4c 1px solid; FONT-FAMILY: MS Sans Serif; HEIGHT: 21px">
          &nbsp;</div>
      </td>
    </tr>
  </table>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/next.gif" width="11" height="11"><a href="SupplierService.asp"><font color="#993366"><b>Supplier 
  Service</b></font></a><br>
  <input type="hidden" name="fOperator">
  <input type="hidden" name="fRecordCount" value="<%=rs.recordCount%>">
  <br>
</form>
<%
else   'ไม่มีสินค้าใน Catalog   หรือ Not Found เมื่อ Search
	if request("fKeyword")="" then
	response.write "<body  background='images/bg1.jpg' >"
	%>
<p>&nbsp;</p>
<p><img src="images/ManageCatalog.gif" width="1003" height="110"> </p>
<div align="center"> 
  <p><font color="#FF0000"><b><font face="MS Sans Serif, Microsoft Sans Serif"><br>
    <br>
    <br>
    <br>
    ยังไม่มีรายการสินค้าใน Catalog</font></b></font> <br>
    <br>
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="105" height="21">
      <param name="BASE" value=".">
      <param name="BGCOLOR" value="#FFFFFF">
      <param name=movie value="SupplierMenu.swf">
      <param name=quality value=high>
      <embed src="SupplierMenu.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="105" height="21" bgcolor="#FFFFFF" base=".">
      </embed> 
    </object>&nbsp;&nbsp;<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="105" height="21">
      <param name="BASE" value=".">
      <param name="BGCOLOR" value="#FFFFFF">
      <param name=movie value="AddNew.swf">
      <param name=quality value=high>
      <embed src="AddNew.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="105" height="21" bgcolor="#FFFFFF" base=".">
      </embed> 
    </object> 
</div>
<br>
<%else
  %>
<p>&nbsp;</p>
<p><img src="images/ManageCatalog.gif" width="1003" height="110"></p>
<table width="893" border="0" align="left">
  <tr> 
    <td width="17%" height="31">&nbsp;</td>
    <td width="76%" height="31">&nbsp;</td>
    <td width="7%" height="31">&nbsp;</td>
  </tr>
  <tr> 
    <td width="17%" height="31">&nbsp;</td>
    <td width="76%" height="31"> 
      <div align="center"> 
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p><font face="MS Sans Serif, Microsoft Sans Serif" color="#ff0000"><b>Not 
          Found &nbsp;Key word '<%=keyword%>' 
          <%
		  
		  sql="select  CatName From Category where CatID="&category
		  Set rsCategory = Server.CreateObject("ADODB.Recordset") 
				rsCategory.Open sql,conn
				if not rsCategory.EOF then
 				response.write " For Category &quot;"&rsCategory(0)&"&quot;"
				else
				response.write " All Category "
				end if
				rsCategory.close
				%>
          <br>
          <br>
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="105" height="21">
            <param name="BASE" value=".">
            <param name="BGCOLOR" value="#FFFFFF">
            <param name=movie value="SupplierMenu.swf">
            <param name=quality value=high>
            <embed src="SupplierMenu.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="105" height="21" bgcolor="#FFFFFF" base=".">
            </embed> 
          </object> </b></font></p>
      </div>
    </td>
    <td width="7%" height="31">&nbsp;</td>
  </tr>
</table>
<% 
	end if
end if
rs.Close
conn.Close
%>
<script language="JavaScript">
<!--
function Conf(object){
		if (confirm ("Do you want to delete  selected Item ?")==true){ return true;}
		return false;
}

function  call_window(goto_url,w,h){
	
	window.open(goto_url,"","directories=no,location=no,toobar=no,status=no,menubar=no,width="+w+",height="+h+",scrollbar=no,menu=no,resizeable=no,left=200,top=100")
	
}

function  SetOperator(Operator){
	
		//alert(Operator)
		document.form2.fOperator.value=Operator ;
	
}


function Arrange(){
//	alert (document.form2.fArrange.value);

	/*switch(document.form2.fArrange.value){
	case "1" :	location.href ="ManageCatalog.asp?arrange=ItemName&category=<%=category%>&keyword=<%=keyword%>" ;   
						brake;
	case "2":	location.href ="ManageCatalog.asp?arrange=CatID&category=<%=category%>&keyword=<%=keyword%>" ;  
						brake;
	case "3":	location.href ="ManageCatalog.asp?arrange=ItemPrice&category=<%=category%>&keyword=<%=keyword%>" ;  
						brake;
	case "4":	location.href ="ManageCatalog.asp?arrange=SellerItemID&category=<%=category%>&keyword=<%=keyword%>" ;  
						brake; 
	case "5":	location.href ="ManageCatalog.asp?arrange=Available&category=<%=category%>&keyword=<%=keyword%>" ; 
						brake;*/
	if  (document.form2.fArrange.value=="1")
	{
				location.href ="ManageCatalog.asp?arrange=ItemName&category=<%=category%>&keyword=<%=keyword%>" ;   
	}
	
		if  (document.form2.fArrange.value=="2")
	{
				location.href ="ManageCatalog.asp?arrange=CatID&category=<%=category%>&keyword=<%=keyword%>" ;  
	}
	
			if  (document.form2.fArrange.value=="3")
	{
				location.href ="ManageCatalog.asp?arrange=ItemPrice DESC&category=<%=category%>&keyword=<%=keyword%>" ;  
	}
	
			if  (document.form2.fArrange.value=="4")
	{
				location.href ="ManageCatalog.asp?arrange=SellerItemID&category=<%=category%>&keyword=<%=keyword%>" ;  
	}
	
			if  (document.form2.fArrange.value=="5")
	{
				location.href ="ManageCatalog.asp?arrange=Available DESC&category=<%=category%>&keyword=<%=keyword%>" ; 
	}
	
				if  (document.form2.fArrange.value=="6")
	{
				location.href ="ManageCatalog.asp?arrange=ItemAdd DESC&category=<%=category%>&keyword=<%=keyword%>" ; 
	}
		
	}
// -->
</script>

