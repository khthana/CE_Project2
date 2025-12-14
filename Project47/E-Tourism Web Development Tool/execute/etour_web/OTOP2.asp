<HTML>
<script language="vbscript" runat="server">

	Response.write"<head>"
	Response.write"<meta http-equiv='content-type' content='text/html;charset=window-874'>"
	Response.write"</head>"
	
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 DIM LinkPlate2
 DIM Row2
 	

 	strHTML=strHTML&"<form  name=""Chose"" method=post action=OTOP2.asp>"
	
	'******************************* Create Topic  *************************************************************************	
	 Set  objConn=Server.CreateObject("ADODB.Connection")
	 objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("/PROJECT_NEW.mdb")
			
	'***************  To Find Text Color and Background Color  ****************************
	strSql="Select * From TEMPLATE"
	Set  objRS=Server.CreateObject("ADODB.Recordset")
	objRS.Open strSql,ObjConn
									Do While Not objRS.Eof
											Template=objRS("Template")
											Text_font=objRS("Text_font")
											Text_size=objRS("Text_size")
											Text_size2=Text_size/3
											Text_size=Text_size/6
											Text_color=objRS("Text_color")
											Back_color=objRS("Back_color")
										objRS.MoveNext
									Loop
	objRS.Close
	Set objRS=Nothing
'******************************* Create Topic  *************************************************************************
											strHTML=strHTML&"<CENTER><table border=5>"
											strHTML=strHTML&"<tr bgcolor="&Back_color&">"
											strHTML=strHTML&"<td Width=70% align=CENTER>"
											strHTML=strHTML&"<font size="&Text_size2&"font color="&Text_color&" face="&Text_font&">"
											strHTML=strHTML&"ข้อมูลสินค้าพื้นเมือง"&"</font>"
											strHTML=strHTML&"</td></tr>"
											strHTML=strHTML&"</table></CENTER>"

											if(Template=2) then
												Response.Write(strHTML)
												strHTML=""
											end if

Response.Write("<body bgcolor ="&Back_color&">")											
'******************************* Create Internal Link  *****************************************************************
strSql2="Select * From FORM"
Set  objRS2=Server.CreateObject("ADODB.Recordset")
objRS2.Open strSql2,ObjConn
									strHTML=strHTML&"<br>"
									Do While Not objRS2.Eof
										if objRS2("Topic")=1 then

											strHTML=strHTML & "<a href=" & "test12.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--ข้อมูลทั่วไป--</font></font></font></a>"	
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
																		
										end if
										if objRS2("Topic")=2 then	

											strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  --อาณาเขตของจังหวัด--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=3 then

											strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " --ประเพณีวัฒนธรรม--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=4 then

											strHTML=strHTML & "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& " --สินค้า OTOP--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=5 then

											strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " --ข้อมูลการเดินทาง--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=6 then

											strHTML=strHTML & "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "  --ข้อมูลสถานที่ท่องเที่ยว--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=7 then

											strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  --ข้อมูลที่พักแรม--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										

										if objRS2("Topic")=8 then

											strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "   --ข้อมูลสายการบิน--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if


									objRS2.MoveNext
									Loop
									
									strHTML=strHTML &"<br><br>"
									'strHTML = "<CENTER>"&strHTML&"</CENTER>"
									if (Template=1) then
									strHTML = "<CENTER>"&strHTML&"</CENTER>"
									Response.Write(strHTML)
									end if
									if (Template=2) then
									LinkPlate2=strHTML
									end if
									strHTML=""

objRS2.Close
Set objRS2=Nothing

'moreinfo and pic2===>
								'if(Ite_moreinfo(j) <> "") then
								'strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(j)&"&pic2="&Ite_pic2(j)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local& ">"&"<font size=+1><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br> Details of this items >>  </font></font></font></a>"
								'end if
	'*************

'page=1 ==> OTOP
'page=2 ==> Items
'page=3 ==> Store
if (Request.QueryString("page")=1) then
strHTML=strHTML& "<CENTER><a href=" & "OTOP.asp?"&"store="&Request.QueryString("StoreName")&"&tumbon="&Request.QueryString("LocName")&"&items="&Request.QueryString("ItemsName")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<< กลับไปหน้าหลัก"&" </font></font></font></a><CENTER>"
end if
if (Request.QueryString("page")=2) then
strHTML=strHTML& "<CENTER><a href=" & "Items.asp?"&"store="&Request.QueryString("StoreName")&"&tumbon="&Request.QueryString("LocName")&"&items="&Request.QueryString("ItemsName") & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &"<< กลับไปหน้าหลัก "& " </font></font></font></a></CENTER>"	
end if
if (Request.QueryString("page")=3) then
strHTML=strHTML& "<CENTER><a href=" & "Store.asp?"&"store="&Request.QueryString("StoreName")&"&tumbon="&Request.QueryString("LocName")&"&items="&Request.QueryString("ItemsName")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &"<< กลับไปหน้าหลัก "&"</font></font></font></a></CENTER>"
end if
'Response.Write(Request.QueryString("page"))
'Response.Write(Request.QueryString("StoreName"))
'Response.Write(Request.QueryString("LocName"))
'Response.Write(Request.QueryString("ItemsName"))


strHTML=strHTML&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
   	strHTML=strHTML&"<tr>"
	strHTML=strHTML&"<td width=""30%"">"
	if (Template=1) then
	strHTML=strHTML&"<IMG src="&Request.QueryString("pic2")&" width=200 height=200></IMG>"
	strHTML=strHTML&"<br><br>"
	end if
	if (Template=2) then
	strHTML=strHTML&LinkPlate2
	end if
	strHTML=strHTML&"</td>"
	strHTML=strHTML&"<td width=""70%"">"
	if (Template=2) then
	strHTML=strHTML&"<IMG src="&Request.QueryString("pic2")&" width=200 height=200></IMG>"
	strHTML=strHTML&"<br><br>"
	end if
	strHTML=strHTML&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"  
	strHTML=strHTML&Request.QueryString("name")&"<br>"
	strHTML=strHTML&"รายละเอียด : "&Request.QueryString("info")
	strHTML=strHTML&"</font>"
	strHTML=strHTML&"</td>"
   	strHTML=strHTML&"</tr>"
 	strHTML=strHTML&"</table>"
	Response.Write(strHTML)

	Response.Write"</form>"
</script>
</HTML>