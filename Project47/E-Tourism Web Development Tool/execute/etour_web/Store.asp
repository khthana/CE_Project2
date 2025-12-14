<HTML>
<script language="vbscript" runat="server">
	Response.write"<head>"
	Response.write"<meta http-equiv='content-type' content='text/html;charset=window-874'>"
	Response.write"</head>"
	
 DIM strHTML	
 DIM strHTML3
 DIM s
 DIM count

 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 DIM LinkPlate2
 
 DIM Ite_name(1000)
 DIM Ite_info(1000)
 DIM Ite_maxprice(1000)
 DIM Ite_minprice(1000)   
 DIM Ite_pic(1000)
 DIM Ite_moreinfo(1000)
 DIM Ite_pic2(1000)
 DIM IteMax						' ITEMS

 DIM Ven_name(1000)
 DIM Ven_info(1000) 
 DIM Ven_addr(1000)
 DIM VenMax						' VENDOR
 
 DIM IV_Iname(1000)
 DIM IV_Vname(1000)          
 DIM IV							'for ITEMS_VENDOR table
 
 DIM VL_Vname(1000)
 DIM VL_Lname(1000)
 DIM VL							'for VENDOR_LOCALITY table
 
 	strHTML=strHTML&"<form  name=""Chose"" method=post action=Store.asp>"

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

											strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "   --ประเพณีวัฒนธรรม--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=4 then

											strHTML=strHTML & "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "   --สินค้า OTOP--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=5 then

											strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "   --ข้อมูลการเดินทาง--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=6 then

											strHTML=strHTML & "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& " --ข้อมูลสถานที่ท่องเที่ยว--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=7 then

											strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "   --ข้อมูลที่พักแรม--</font></font></font></a>"
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
'***************************  Store all in array **********************************************************************
count=0
	strSql3="Select * From ITEMS"
	Set  objRS3=Server.CreateObject("ADODB.Recordset")
	objRS3.Open strSql3,ObjConn

									Do While Not objRS3.Eof
										 Ite_name(count)=objRS3("Ite_name")
										 Ite_info(count)=objRS3("Ite_info")
										 Ite_maxprice(count)=objRS3("Ite_maxprice")
										 Ite_minprice(count)=objRS3("Ite_minprice")
										 Ite_pic(count)=objRS3("Ite_pic")
										 Ite_moreinfo(count)=objRS3("Ite_moreinfo")
										 Ite_pic2(count)=objRS3("Ite_pic2")
										 count=count+1
									objRS3.MoveNext
									Loop
									IteMax=count
	objRS3.Close
	Set objRS3=Nothing
'*******************
count=0
	strSql4="Select * From VENDOR"
	Set  objRS4=Server.CreateObject("ADODB.Recordset")
	objRS4.Open strSql4,ObjConn

									Do While Not objRS4.Eof
										
										 Ven_name(count)=objRS4("Ven_name")
										 Ven_info(count)=objRS4("Ven_info")
										 Ven_addr(count)=objRS4("Ven_addr")
										 count=count+1
										
									objRS4.MoveNext
									Loop
									VenMax=count
	objRS4.Close
	Set objRS4=Nothing
'*******************
count=0								
	strSql4="Select * From ITEMS_VENDOR"
	Set  objRS4=Server.CreateObject("ADODB.Recordset")
	objRS4.Open strSql4,ObjConn
								
									Do While Not objRS4.Eof

										 IV_Iname(count)=objRS4("Ite_name")
										 IV_Vname(count)=objRS4("Ven_name")
										 count=count+1
										
										objRS4.MoveNext
									Loop
									IV=count					
		
	objRS4.Close
	Set objRS=Nothing
	
'*******************
count=0								
	strSql5="Select * From VENDOR_LOCALITY"
	Set  objRS5=Server.CreateObject("ADODB.Recordset")
	objRS5.Open strSql5,ObjConn
						
									Do While Not objRS5.Eof

										 VL_Vname(count)=objRS5("Ven_name")
										 VL_Lname(count)=objRS5("Loc_name")
										 count=count+1
										
										objRS5.MoveNext
									Loop
									VL=count
	objRS5.Close
	Set objRS5=Nothing
count=0
	
'**************************************************************************************************************
	'store= Request.QueryString("store")
	'items=Request("Combo3")
	if (local="") then
		local=Request.QueryString("tumbon")
	end if
	if (store="") then
		store=Request.QueryString("store")
	end if
	if (items="") then
		items=Request.QueryString("items")
	end if

		if (Template=1) then
		strHTML2=strHTML2&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
		strHTML2=strHTML2&"<tr>"
		end if
													s=s&"<br>"&"ร้าน "&Request.QueryString("store")&"<br> "
													For i=0 To VenMax-1
														if (Request.QueryString("store")=Ven_name(i)) then
															s=s&"รายละเอียดร้านค้า : "&Ven_info(i)&"<br>"
															s=s&"ที่อยู่ร้าน : "&Ven_addr(i)&"<br>"
														end if
													Next
													s=s&"ร้านนี้ตั้งอยู่ที่ "
													For i=0 To VL-1
														if Request.QueryString("store")=VL_Vname(i) then
															s=s&VL_Lname(i)&" "
														end if
													Next
													s=s&"<br><br>จำหน่ายสินค้าดังนี้"&"<br><br>"
													For j=0 To IV-1
														if IV_Vname(j)=Request.QueryString("store") then														
															For i=0 To IteMax-1
																if Ite_name(i)=IV_Iname(j) then	
																	if (Template=1) then
																	strHTML2=strHTML2&"<td width=""50%"">"
																	end if		
																		if (Template=2) then 
																		strHTML2=strHTML2&"<br><br><hr>" 
																		end if
																		'items=Ite_name(i)
																		strHTML2=strHTML2&"<IMG src="&Ite_pic(i)&" width=200 height=200></IMG>"&"<br><br>"
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	
																	strHTML2=strHTML2&"<td width=""50%"">"
																	end if
																	strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(i)&"<br>"																	
																	strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(i)&"<br>"
																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(i)&" ถึง "
																	strHTML2=strHTML2&Ite_maxprice(i)&"</font>"
																	
																	'**************
																	'moreinfo and pic2===>
																	'if(Ite_moreinfo(i) <> "") then
																	'strHTML2=strHTML2&"<a href=" & '"OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&StoreName="&store&"&ItemsName="&items& ">"&"<font size=+1><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>Detail of this items >>  </font></font></font></a>"
																	'end if
																	'**************
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(i) <> "") then
																	strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"3"&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
																end if																
															Next						
														end if
													Next												
													
													if (Template=1) then
													strHTML2=strHTML2&"</table>"
													end if

													s=s&strHTML2

													
													if (Request.QueryString("items")="None") then
															s=s& "<CENTER><a href=" & "OTOP.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<< BACK  </font></font></font></a><CENTER>"
													else 
															s=s& "<CENTER><a href=" & "OTOP.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<< ดูข้อมูลสินค้าใน : "&Request.QueryString("tumbon") &">>"&" </font></font></font></a><CENTER>"
														s=s& "<CENTER><a href=" & "items.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<< ดูข้อมูลสินค้า : "&Request.QueryString("items")&">>"&"</font></font></font></a><CENTER>"	
													end if												
 	s="<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&s&"</font>"
	if (Template=1) then
 	Response.Write(s)
	end if
	if (Template=2) then
		str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
		str=str&"<tr>"
		str=str&"<td width=""30%"">"
		str=str&LinkPlate2
		str=str&"</td>"
		str=str&"<td width=""70%"">"
		str=str&s
		str=str&"</td>"
		str=str&"</tr>"
		str=str&"</table>"
		Response.Write(str)
	end if
	Response.Write"</form>"
</script>
</HTML>