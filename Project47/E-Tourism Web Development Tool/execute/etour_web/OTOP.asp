<HTML>
<script language="vbscript" runat="server">

	Response.write"<head>"
	Response.write"<meta http-equiv='content-type' content='text/html;charset=window-874'>"
	Response.write"</head>"
	
 DIM strHTML
 DIM strHTML2
 DIM strHTML3
 DIM s

 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 DIM LinkPlate2
 DIM Row2
 
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
 
 DIM Loc_name(1000)   
 DIM LocMax						' LOCALITY
 
 DIM IV_Iname(1000)
 DIM IV_Vname(1000)          
 DIM IV							'for ITEMS_VENDOR table
 
 DIM IL_Iname(1000)
 DIM IL_Lname(1000)
 DIM IL							'for ITEMS_LOCALITY table
 
 DIM VL_Vname(1000)
 DIM VL_Lname(1000)
 DIM VL							'for VENDOR_LOCALITY table
 
 DIM count 
 
									strHTML=strHTML&"<form  name=""Chose"" method=post action=OTOP.asp>"
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

											strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--อาณาเขตของจังหวัด--</font></font></font></a>"
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

											strHTML=strHTML & "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "--สินค้า OTOP--</font></font></font></a>"
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

											strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " --ข้อมูลที่พักแรม--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										

										if objRS2("Topic")=8 then

											strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--ข้อมูลสายการบิน--</font></font></font></a>"
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
'************************  Keep All of data in array And show name's list *********************************************************************
count=0
									strHTML3=strHTML3&" ค้นหาข้อมูล<br><br> "
									strHTML3=strHTML3&" รายละเอียดเกี่ยวกับตำบล :<br>"
									strHTML3=strHTML3&"<Select Name = ""Combo1"" Size=""1""  onchange=Chose.submit()>"
strSql3="Select * From LOCALITY"
Set  objRS3=Server.CreateObject("ADODB.Recordset")
objRS3.Open strSql3,ObjConn
									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS3.Eof
										
										if Request("Combo1")= objRS3("Loc_name")then
										
										strHTML3=strHTML3&"<Option selected Value="&objRS3("Loc_name")&">"&objRS3("Loc_name")&"</Option>"
										else
										
										strHTML3=strHTML3&"<Option  Value="&objRS3("Loc_name")&">"&objRS3("Loc_name")&"</Option>"
										end if
										
										Loc_name(count)= objRS3("Loc_name")
										count=count+1
									objRS3.MoveNext
									Loop
									LocMax=count
									strHTML3=strHTML3&"</Select><br><br>"

objRS3.Close
Set objRS3=Nothing

'*****************
count=0							
									strHTML3=strHTML3&" รายละเอียดเกี่ยวกับร้านค้าในตำบล :<br>"	
									strHTML3=strHTML3&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"
	strSql4="Select * From VENDOR"
	Set  objRS4=Server.CreateObject("ADODB.Recordset")
	objRS4.Open strSql4,ObjConn
								
									
								
									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS4.Eof
										if Request("Combo2")= objRS4("Ven_name")then
										
										strHTML3=strHTML3&"<Option selected Value="&objRS4("Ven_name")&">"&objRS4("Ven_name")&"</Option>"
									
										else
										
										strHTML3=strHTML3&"<Option  Value="&objRS4("Ven_name")&">"&objRS4("Ven_name")&"</Option>"
										end if
										
										 Ven_name(count)=objRS4("Ven_name")
										 Ven_info(count)=objRS4("Ven_info")
										 Ven_addr(count)=objRS4("Ven_addr")
										 count=count+1
										
										objRS4.MoveNext
									Loop
									VenMax=count
									strHTML3=strHTML3&"</Select><br><br>"
		

	objRS4.Close
	Set objRS4=Nothing
'*******************
count=0							
									strHTML3=strHTML3&" รายละเอียดเกี่ยวกับสินค้าขึ้นชื่อ :<br>"	
									strHTML3=strHTML3&"<Select Name = ""Combo3"" Size=""1""  onchange=Chose.submit()>"
	strSql5="Select * From ITEMS"
	Set  objRS5=Server.CreateObject("ADODB.Recordset")
	objRS5.Open strSql5,ObjConn
								
									
								
									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS5.Eof
										if Request("Combo3")= objRS5("Ite_name")then
										
										strHTML3=strHTML3&"<Option selected Value="&objRS5("Ite_name")&">"&objRS5("Ite_name")&"</Option>"
									
										else
										
										strHTML3=strHTML3&"<Option  Value="&objRS5("Ite_name")&">"&objRS5("Ite_name")&"</Option>"
										end if
										
										 Ite_name(count)=objRS5("Ite_name")
										 Ite_info(count)=objRS5("Ite_info")
										 Ite_maxprice(count)=objRS5("Ite_maxprice")
										 Ite_minprice(count)=objRS5("Ite_minprice")
										 Ite_pic(count)=objRS5("Ite_pic")
										 Ite_moreinfo(count)=objRS5("Ite_moreinfo")
										 Ite_pic2(count)=objRS5("Ite_pic2")
										 count=count+1
										
										objRS5.MoveNext
									Loop
									IteMax=count
									strHTML3=strHTML3&"</Select>"
		

	objRS5.Close
	Set objRS5=Nothing
	
	if(Template=2) then
		Row2="<br><br>"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&strHTML3&"</font><br><br>"
	end if
	strHTML3="<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&strHTML3&"</font>"
	DIM s2
								s2=s2&	"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
           						s2=s2&"<tr>"
             						s2=s2&"<td width=""80%"">"
             						s2=s2&"</td>"
             						s2=s2&"<td width=""20%"">"
             						's2=s2&"<CENTER>"&strHTML3&"</CENTER>"
									s2=s2&strHTML3
             						s2=s2&"</td>"
           						s2=s2&"</tr>"
         							s2=s2&"</table>"
         							s=s2
									
'******************
count=0								
	strSql6="Select * From ITEMS_VENDOR"
	Set  objRS6=Server.CreateObject("ADODB.Recordset")
	objRS6.Open strSql6,ObjConn
								

									Do While Not objRS6.Eof

										 IV_Iname(count)=objRS6("Ite_name")
										 IV_Vname(count)=objRS6("Ven_name")
										 count=count+1
										
										objRS6.MoveNext
									Loop
									IV=count					
		
	objRS6.Close
	Set objRS6=Nothing
'******************
count=0								
	strSql7="Select * From ITEMS_LOCALITY"
	Set  objRS7=Server.CreateObject("ADODB.Recordset")
	objRS7.Open strSql7,ObjConn
								

									Do While Not objRS7.Eof

										 IL_Iname(count)=objRS7("Ite_name")
										 IL_Lname(count)=objRS7("Loc_name")
										 count=count+1
										
										objRS7.MoveNext
									Loop
									IL=count		

	objRS7.Close
	Set objRS7=Nothing
'******************
count=0								
	strSql8="Select * From VENDOR_LOCALITY"
	Set  objRS8=Server.CreateObject("ADODB.Recordset")
	objRS8.Open strSql8,ObjConn
								

									Do While Not objRS8.Eof

										 VL_Vname(count)=objRS8("Ven_name")
										 VL_Lname(count)=objRS8("Loc_name")
										 count=count+1
										
										objRS8.MoveNext
									Loop
									VL=count

	objRS8.Close
	Set objRS8=Nothing
count=0
'*************************************  Show search *************************************************************
	DIM i,j,k
	DIM store
	DIM items
	DIM local
	local=Request("Combo1")
	store=Request("Combo2")
	items=Request("Combo3")
	
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

					if (Request.QueryString("store")="") then
						if (Request.QueryString("tumbon")="") then
							if (Request.QueryString("items")="") then
								if (Request("Combo1")= "") then
									if (Request("Combo2")= "") then
										if (Request("Combo3")= "") then									
										
											For i=0 To IteMax-1
													if (Template=1) then 
													strHTML2=strHTML2&"<td width=""40%"">" 
													end if
														
													strHTML2=strHTML2&"<hr><br><IMG src="&Ite_pic(i)&" width=200 height=200></IMG></hr>"&"<br><br>"
													
													if (Template=1) then 
													strHTML2=strHTML2&"</td>" 
													strHTML2=strHTML2&"<td width=""40%"">"
													end if
													
													strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(i)&"<br>"

													strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(i)&"<br>"
													strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(i)&" ถึง "
													strHTML2=strHTML2&Ite_maxprice(i)
													'**************
														'moreinfo and pic2===>
														if(Ite_moreinfo(i) <> "") then
															strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
														end if
													'**************
														strHTML2=strHTML2&"<br> มีจำหน่ายที่ร้าน "
														For j=0 To IV-1
															if IV_Iname(j)=Ite_name(i) then
																strHTML2=strHTML2&"<br>"&IV_Vname(j)
																strHTML2=strHTML2&" ซึ่งตั้งอยู่ที่"
																For k=0 TO VL-1
																 if VL_Vname(k)=IV_Vname(j) then
																 	strHTML2=strHTML2&VL_Lname(k)&" "
																 end if
																Next
															end if
														Next	
														strHTML2=strHTML2&"</font>"
														
														if (Template=1) then 
														strHTML2=strHTML2&"</td>"
														strHTML2=strHTML2&"<td width=""20%"">"
																if (i=0) then strHTML2=strHTML2&strHTML3
														strHTML2=strHTML2&"</td>"
														strHTML2=strHTML2&"</tr>"
														end if
													Next
												if (Template=1) then
												s=""
												s=s&strHTML2
												s=s&"</table>"
												end if

												if (Template=2) then
												Row2=Row2&strHTML2
												end if
										end if
									end if
								end if
							end if
						end if
					end if
					
					
										if Request("Combo1")= "None"  then
											if Request("Combo2")= "None" then
												if Request("Combo3")= "None" then  'combo1=none  combo2=none  combo3=none
												
													For i=0 To IteMax-1
													if (Template=1) then 
													strHTML2=strHTML2&"<td width=""40%"">" 
													end if
														
													strHTML2=strHTML2&"<hr><br><IMG src="&Ite_pic(i)&" width=200 height=200></IMG></hr>"&"<br><br>"
													
													if (Template=1) then 
													strHTML2=strHTML2&"</td>" 
													strHTML2=strHTML2&"<td width=""40%"">"
													end if
													
													strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(i)&"<br>"

													strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(i)&"<br>"
													strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(i)&" ถึง "
													strHTML2=strHTML2&Ite_maxprice(i)
													'**************
														'moreinfo and pic2===>
														if(Ite_moreinfo(i) <> "") then
															strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>รายละเอียดเพิ่มเติม>>  </font></font></font></a>"
														end if
													'**************
														strHTML2=strHTML2&"<br> มีจำหน่ายที่ร้าน "
														For j=0 To IV-1
															if IV_Iname(j)=Ite_name(i) then
																strHTML2=strHTML2&"<br>"&IV_Vname(j)
																strHTML2=strHTML2&" ซึ่งตั้งอยู่ที่"
																For k=0 TO VL-1
																 if VL_Vname(k)=IV_Vname(j) then
																 	strHTML2=strHTML2&VL_Lname(k)&" "
																 end if
																Next
															end if
														Next	
														strHTML2=strHTML2&"</font>"
														
														if (Template=1) then 
														strHTML2=strHTML2&"</td>"
														strHTML2=strHTML2&"<td width=""20%"">"
																if (i=0) then strHTML2=strHTML2&strHTML3
														strHTML2=strHTML2&"</td>"
														strHTML2=strHTML2&"</tr>"
														end if
													Next
												if (Template=1) then
												s=""
												s=s&strHTML2
												s=s&"</table>"
												end if

												if (Template=2) then
												Row2=Row2&strHTML2
												end if

												else 'combo1=none combo2=none combo3<>none
													
													For i=0 To IteMax-1
														if Request("Combo3")=Ite_name(i) then
														if (Template=1) then
														strHTML2=strHTML2&"<td width=""40%"">"
														end if
														strHTML2=strHTML2&"<hr><IMG src="&Ite_pic(i)&" width=200 height=200></IMG></hr>"&"<br><br>"
														if (Template=1) then
														strHTML2=strHTML2&"</td>"
													
														strHTML2=strHTML2&"<td width=""40%"">"
														end if
															strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(i)&"<br>"
														strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(i)&"<br>"
														strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(i)&" ถึง "
														strHTML2=strHTML2&Ite_maxprice(i)
														
														'**************
														'moreinfo and pic2===>
														if(Ite_moreinfo(i) <> "") then
															strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
														end if
														'*************
														end if 
													Next
													
													strHTML2=strHTML2&"<br>มีจำหน่ายที่ร้าน"
													For j=0 To IV-1
															if IV_Iname(j)=Request("Combo3") then
																
																strHTML2=strHTML2&"<br>"&IV_Vname(j)
																strHTML2=strHTML2&" ซึ่งตั้งอยู่ที่"
																
																For k=0 TO VL-1
																 if VL_Vname(k)=IV_Vname(j) then
																 	
																 	strHTML2=strHTML2&VL_Lname(k)&" "
																 end if
																Next
																
															end if
													Next
													strHTML2=strHTML2&"</font>"
													if (Template=1) then
													strHTML2=strHTML2&"</td>"
													strHTML2=strHTML2&"<td width=""20%"">"
													strHTML2=strHTML2&strHTML3
													strHTML2=strHTML2&"</td>"
													strHTML2=strHTML2&"</tr>"
													s=""
													s=s&strHTML2
													s=s&"</table>"
													end if

													if (Template=2) then
													Row2=Row2&strHTML2
													end if
												end if
												
											else  
												if Request("Combo3")= "None" then 'combo1=none combo2<>none combo3=none
													DIM c
													c=0
													s=""
													s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br>"&"ร้าน "&Request("Combo2")&"<br> "
													's=s&"จำหน่ายสินค้าดังนี้"&"<br>"
													
													For i=0 To VenMax-1
														if(Request("Combo2")=Ven_name(i)) then
															s=s&"รายละเอียดร้านค้า : "&Ven_info(i)&"<br>"
															s=s&"ที่อยู่ร้าน : "&Ven_addr(i)&"<br>"
														end if
													Next
													's=s&"จำหน่ายสินค้าดังนี้"&"<br>"
													
													s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br>"&"ร้านนี้ตั้งอยู่ที่ตำบล "
															For i=0 To VL-1
																if Request("Combo2")=VL_Vname(i) then
																	s=s&VL_Lname(i)&" "
																end if
															Next
													s=s&"<br>"
													s=s&"จำหน่ายสินค้าดังนี้"&"<br>"
													s=s&"<br>"

													For j=0 To IV-1
														if IV_Vname(j)=Request("Combo2") then
														
															For i=0 To IteMax-1
																if Ite_name(i)=IV_Iname(j) then
																		if (Template=1) then
																		strHTML2=strHTML2&"<td width=""40%"">"
																		end if
																			strHTML2=strHTML2&"<hr><IMG src="&Ite_pic(i)&" width=200 height=200></IMG></hr>"&"<br><br>"
																		if (Template=1) then
																		strHTML2=strHTML2&"</td>"	
																		strHTML2=strHTML2&"<td width=""40%"">"
																		end if
																		strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(i)&"<br>"
																
																	strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(i)&"<br>"

																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(i)&" ถึง "
																	strHTML2=strHTML2&Ite_maxprice(i)&"</font>"
																	
																	
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(i) <> "") then
																	strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""20%"">"
																	
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
																end if
															Next
														end if	
													Next
													
													s=s&strHTML2
													if (Template=1) then
													s=s&"</table>"
													end if
													's=s&"<font size=+1 font color="&Text_color&" face="&Text_font&">"&"<br>"&"ร้านนี้ตั้งอยู่ที่ตำบล "
															'For i=0 To VL-1
																'if Request("Combo2")=VL_Vname(i) then
																	's=s&VL_Lname(i)&" "
																'end if
															'Next
													s=s&"</font>"

													if (Template=2) then
													Row2=Row2&s
													end if
												
												else'combo1=none combo2<>none combo3<>none
													c=0
													s=""
													s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br><br>ข้อมูลร้านค้า<br>"
													s=s&"<br>"&"ร้าน : "&Request("Combo2")&"<br> "
													For i=0 To VenMax-1
														if(Request("Combo2")=Ven_name(i)) then
															s=s&"รายละเอียดร้านค้า : "&Ven_info(i)&"<br>"
															s=s&"ที่อยู่ร้าน : "&Ven_addr(i)&"<br>"
														end if
													Next
													s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br>"&"ร้านนี้ตั้งอยู่ที่ตำบล "
													
															For i=0 To VL-1
																if Request("Combo2")=VL_Vname(i) then
																	s=s&VL_Lname(i)&" "
																end if
															Next
													s=s&"<br>"
													s=s&"จำหน่ายสินค้าดังนี้"&"<br></font>"
													
													For j=0 To IV-1
														if IV_Vname(j)=Request("Combo2") then															
															For i=0 To IteMax-1
																if Ite_name(i)=IV_Iname(j) then	
																
														if (Template=1) then 
														strHTML2=strHTML2&"<td width=""40%"">" 
														end if															
																	strHTML2=strHTML2&"<hr><IMG src="&Ite_pic(i)&" width=200 height=200></IMG></hr>"&"<br><br>"
													if (Template=1) then				
													strHTML2=strHTML2&"</td>"
													strHTML2=strHTML2&"<td width=""40%"">" 
													end if

																	strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(i)&"<br>"					
																	strHTML2=strHTML2&"รายละเอียดของสินค้า :"&Ite_info(i)&"<br>"	
																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(i)&" ถึง "
																	strHTML2=strHTML2&Ite_maxprice(i)&"</font>"
																	'??????????????????
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(i) <> "") then
																	strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	
																	strHTML2=strHTML2&"<td width=""20%"">"
																	
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if																
																end if															
															Next
														end if
													Next
													s=s&strHTML2
													if (Template=1) then s=s&"</table>" end if
													
													's=s&"<font size=+1 font color="&Text_color&" face="&Text_font&">"&"<br>"&"ร้านนี้ตั้งอยู่ที่ตำบล "
													
															'For i=0 To VL-1
																'if Request("Combo2")=VL_Vname(i) then
																	's=s&VL_Lname(i)&" "
																'end if
															'Next

													s=s&"</font>"	
													flag=0
													
													For j=0 To IV-1
														if IV_Vname(j)=Request("Combo2") then
															if IV_Iname(j)=Request("Combo3") then			
																flag=1
																j=IV
															end if
														end if
													Next
													if flag=0 then
													s=s & "<CENTER><a href=" & "Items.asp?"&"store="&Request("Combo2")&"&tumbon="&Request("Combo1")&"&items="&Request("Combo3") & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของสินค้า "& Request("Combo3")&" >> </font></font></font></a></CENTER>"
													flag=0
													end if
																	if (Template=2) then
																	Row2=Row2&s
																	end if
												end if
											end if
										else
											if Request("Combo2")= "None" and Request("Combo3")= "None" then 'combo1<>none  combo2=none  combo3=none
												c=0
												s=""
												s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br><br>"&"ข้อมูลภายในตำบล"&"    "&Request("Combo1")&"<br><br>"
												s=s&"<br>"&" ร้านค้าในตำบลนี้ ได้แก่ "
												For i=0 TO VL-1				
													if VL_Lname(i)=Request("Combo1") then
														s=s&VL_Vname(i)&" "
													end if
												Next
												
												s=s&"<br>"&" สินค้าขึ้นชื่อในตำบล ได้แก่ "
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														s=s&IL_Iname(i)&" "
													end if
												Next
												s=s&"</font>"
												s=s&"<br>"
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														For j=0 To IteMax-1
															if IL_Iname(i)=Ite_name(j) then
															
																	if (Template=1) then
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<br>"&"<hr><IMG src="&Ite_pic(j)&" width=200 height=200></IMG></hr>"&"<br><br>"
																	
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<font size="&Text_size&"font color="&Text_color&" face="&Text_font &">"&Ite_name(j)&"<br>"
																	strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(i)&"<br>"
																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(j)&" ถึง "
																	strHTML2=strHTML2&Ite_maxprice(j)&"</font>"
																	
																	
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(j) <> "") then
																	strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(j)&"&pic2="&Ite_pic2(j)&"&name="&Ite_name(j)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br> รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""20%"">"
																	
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
															end if
														Next
													end if
												Next
																	s=s&strHTML2
																	if (Template=1) then s=s&"</table>" end if
																	
																	if (Template=2) then
																	Row2=Row2&s
																	end if
											end if
											if Request("Combo2")= "None" and Request("Combo3")<> "None" then 'combo1<>none  combo2=none  combo3<>none
										
										s=""
										c=0
										s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br><br>"&"ข้อมูลภายในตำบล "&Request("Combo1")&"<br><br>"
												s=s&"<br>"&" ร้านค้าในตำบลนี้ ได้แก่ "
												For i=0 TO VL-1				
													if VL_Lname(i)=Request("Combo1") then
														s=s&VL_Vname(i)&" "
													end if
												Next
												
												s=s&"<br>"&" สินค้าขึ้นชื่อในตำบล ได้แก่ "
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														s=s&IL_Iname(i)&" "
													end if
												Next
												
												s=s&"</font>"
												s=s&"<br>"
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														For j=0 To IteMax-1
															if IL_Iname(i)=Ite_name(j) then
																	if (Template=1) then
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<br>"&"<hr><IMG src="&Ite_pic(j)&" width=200 height=200></IMG></hr>"&"<br><br>"

																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font &">"&Ite_name(j)&"<br>"

																	strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(j)&"<br>"
																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(j)&" ถึง "																	
																	strHTML2=strHTML2&Ite_maxprice(j)&"</font>"													
																	
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(j) <> "") then
																	strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(j)&"&pic2="&Ite_pic2(j)&"&name="&Ite_name(j)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br> รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""20%"">"	
																		
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"	
																	strHTML2=strHTML2&"</tr>"
																	end if
															end if
														Next
													end if
												Next
											
												s=s&strHTML2
												if (Template=1) then s=s&"</table>" end if
													flag=0
													
													For j=0 To IL-1
														if IL_Lname(j)=Request("Combo1") then
															if IL_Iname(j)=Request("Combo3") then			
																flag=1
																j=IL
															end if
														end if
													Next
													if flag=0 then
													s=s & "<CENTER><a href=" & "Items.asp?"&"store="&Request("Combo2")&"&tumbon="&Request("Combo1")&"&items="&Request("Combo3") & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของสินค้า "& Request("Combo3")&" >> </font></font></font></a></CENTER>"													
													end if
													if (Template=2) then
													Row2=Row2&s
													end if
											end if
											if Request("Combo2")<> "None" and Request("Combo3")= "None" then 'combo1<>none  combo2<>none  combo3=none
											
												s=""
												
												s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br><br>"&"ข้อมูลภายในตำบล "&Request("Combo1")&"<br><br>"
												s=s&"<br>"&" ร้านค้าในตำบลนี้ ได้แก่ "
												For i=0 TO VL-1				
													if VL_Lname(i)=Request("Combo1") then
														s=s&VL_Vname(i)&" "
													end if
												Next
												
												s=s&"<br>"
												For i=0 TO VL-1				
													if VL_Lname(i)=Request("Combo1") then
														For j=0 To VenMax-1
															if(Ven_name(j)=VL_Vname(i)) then
																s=s&"ชื่อร้าน : "&Ven_name(j)&"<br>"
																s=s&"รายละเอียดร้านค้า : "&Ven_info(j)&"<br>"
																s=s&"ที่อยู่ร้าน : "&Ven_addr(j)&"<br>"
																s=s&"<br>"
															end if
														Next
													end if
												Next
												
												s=s&"<br>"&" สินค้าขึ้นชื่อในตำบล ได้แก่ "
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														s=s&IL_Iname(i)&" "
													end if
												Next
												
												s=s&"</font>"
												s=s&"<br>"
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														For j=0 To IteMax-1
															if IL_Iname(i)=Ite_name(j) then
																	if (Template=1) then
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<br>"&"<hr><IMG src="&Ite_pic(j)&" width=200 height=200></IMG></hr>"&"<br><br>"
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if

																		strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(j)&"<br>"

																	strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(j)&"<br>"
																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(j)&" ถึง "																	
																	strHTML2=strHTML2&Ite_maxprice(j)&"</font>"
																			
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(j) <> "") then
																		strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(j)&"&pic2="&Ite_pic2(j)&"&name="&Ite_name(j)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br> รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""20%"">"
																	
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"	
																	strHTML2=strHTML2&"</tr>"
																	end if						
															end if
														Next
													end if
												Next
																	s=s&strHTML2
																	if (Template=1) then s=s&"</table>" end if
												flag=0
													
													For i=0 TO VL-1
														if VL_Lname(i)=Request("Combo1") then
															if VL_Vname(i)=Request("Combo2") then			
																flag=1
																j=VL
															end if
														end if
													Next
													if flag=0 then
												'??????????????????////
												s=s & "<CENTER><a href=" & "Store.asp?"&"store="&Request("Combo2")&"&tumbon="&Request("Combo1")&"&items="&Request("Combo3")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของร้าน "& Request("Combo2")&" >> </font></font></font></a></CENTER>"	
												'??????????????????////
													end if
													if (Template=2) then
													Row2=Row2&s
													end if
											end if
											if Request("Combo2")<> "None" and Request("Combo3")<> "None" then 'combo1<>none  combo2<>none  combo3<>none
											
												if (Request("Combo1")<>"") then
													if (Request("Combo2")<>"") then
														if (Request("Combo3")<>"") then
										
												s=""		
												s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br><br>"&"ข้อมูลภายในตำบล : "&Request("Combo1")&"<br>"
												s=s&"<br>"&" ร้านค้าในตำบลนี้ ได้แก่ "
												For i=0 TO VL-1				
													if VL_Lname(i)=Request("Combo1") then
														s=s&VL_Vname(i)&" "
													end if
												Next
												
												s=s&"<br>"
												For i=0 TO VL-1				
													if VL_Lname(i)=Request("Combo1") then
														For j=0 To VenMax-1
															if(Ven_name(j)=VL_Vname(i)) then
																s=s&"ชื่อร้าน : "&Ven_name(j)&"<br>"
																s=s&"รายละเอียดร้านค้า: "&Ven_info(j)&"<br>"
																s=s&"ที่อยู่ร้าน : "&Ven_addr(j)&"<br>"
																s=s&"<br>"
															end if
														Next
													end if
												Next

												s=s&"<br>"&" สินค้าขึ้นชื่อในตำบล ได้แก่ "
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														s=s&IL_Iname(i)&" "
													end if
												Next
												
												s=s&"</font>"
												s=s&"<br>"
												For i=0 TO IL-1
													if IL_Lname(i)=Request("Combo1") then
														For j=0 To IteMax-1
															if IL_Iname(i)=Ite_name(j) then
																	if (Template=1) then
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<br>"&"<hr><IMG src="&Ite_pic(j)&" width=200 height=200></IMG></hr>"&"<br><br>"
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(j)&"<br>"

																	strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(j)&"<br>"
																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(j)&" ถึง "																	
																	strHTML2=strHTML2&Ite_maxprice(j)&"</font>"
																			
								
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(j) <> "") then
																		strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(j)&"&pic2="&Ite_pic2(j)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br> รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"<td width=""20%"">"	
																		
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"	
																	strHTML2=strHTML2&"</tr>"
																	end if
															end if
														Next
													end if
												Next
																	
																	s=s&strHTML2
																	if (Template=1) then s=s&"</table>" end if
													flag=0
													
													For i=0 TO VL-1
														if VL_Lname(i)=Request("Combo1") then
															if VL_Vname(i)=Request("Combo2") then			
																flag=1
																j=VL
															end if
														end if
													Next
													if flag=0 then				
													
													s=s & "<CENTER><a href=" & "Store.asp?"&"store="&Request("Combo2")&"&tumbon="&Request("Combo1")&"&items="&Request("Combo3")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของร้าน "& Request("Combo2")&" >> </font></font></font></a></CENTER>"
													end if

													flag=0
													For j=0 To IL-1
														if IL_Lname(j)=Request("Combo1") then
															if IL_Iname(j)=Request("Combo3") then			
																flag=1
																j=IL
															end if
														end if
													Next
													if flag=0 then
													s=s & "<CENTER><a href=" & "Items.asp?"&"store="&Request("Combo2")&"&tumbon="&Request("Combo1")&"&items="&Request("Combo3") & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของสินค้า "& Request("Combo3")&" >> </font></font></font></a></CENTER>"
													end if
													if (Template=2) then
													Row2=Row2&s
													end if
											end if											   
										end if
										end if
										end if
										end if			
																				
	Set objConn=Nothing
	
											if (Request.QueryString("store")<>"") then
												if (Request.QueryString("tumbon")<>"") then
													if (Request.QueryString("items")<>"") then
												
												if (Template=1) then
												strHTML2=strHTML2&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
											strHTML2=strHTML2&"<tr>"
												end if

										 	if (Request.QueryString("tumbon")="None") then

										 			c=0
													s=""
													s=s&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br>"&"ร้าน "&Request.QueryString("store")&"<br> "
													
													For i=0 To VenMax-1
													if (Request.QueryString("store")=Ven_name(i)) then
														s=s&"ชื่อร้าน : "&Ven_name(j)&"<br>"
														s=s&"รายละเอียดร้านค้า : "&Ven_info(j)&"<br>"
														s=s&"ที่อยู่ร้าน : "&Ven_addr(j)&"<br>"
														
													end if
													Next
														
													s=s&"<br>"&"ร้านนี้ตั้งอยู่ที่ตำบล "
															For i=0 To VL-1
																if Request.QueryString("store")=VL_Vname(i) then
																	s=s&VL_Lname(i)&" "
																end if
															Next
													s=s&"<br>"	
													s=s&"จำหน่ายสินค้าดังนี้"&"<br>"
													s=s&"</font>"
													For j=0 To IV-1
														if IV_Vname(j)=Request.QueryString("store") then
														
															For i=0 To IteMax-1
																if Ite_name(i)=IV_Iname(j) then
																
																		if (Template=1) then
																		strHTML2=strHTML2&"<td width=""40%"">"
																		end if
																			strHTML2=strHTML2&"<hr><IMG src="&Ite_pic(i)&" width=200 height=200></IMG></hr>"&"<br><br>"
																		if (Template=1) then
																		strHTML2=strHTML2&"</td>"
																		
																	strHTML2=strHTML2&"<td width=""40%"">"
																		end if
																		strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Ite_name(i)&"<br>"
																
																	
																	strHTML2=strHTML2&"รายละเอียดของสินค้า :  "&Ite_info(i)&"<br>"

																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(i)&" ถึง "

																	strHTML2=strHTML2&Ite_maxprice(i)&"</font>"
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(i) <> "") then
																		strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(i)&"&pic2="&Ite_pic2(i)&"&name="&Ite_name(i)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br> รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	
																	strHTML2=strHTML2&"<td width=""20%"">"
																	
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
																end if
															Next
														end if	
													Next
													
													s=s&strHTML2
													if (Template=1) then s=s&"</table>" end if
													's=s&"<br>"&"ร้านนี้ตั้งอยู่ที่ตำบล "
															'For i=0 To VL-1
																'if Request.QueryString("store")=VL_Vname(i) then
																	's=s&VL_Lname(i)&" "
																'end if
															'Next
												flag=0
													
													For j=0 To IV-1
														if IV_Vname(j)=Request.QueryString("store") then
															if IV_Iname(j)=Request.QueryString("items") then			
																flag=1
																j=IV
															end if
														end if
													Next
												if ((Request.QueryString("store")="None" and Request.QueryString("items")<>"None") or (Request.QueryString("store")<>"None" and Request.QueryString("items")="None")) then
													flag=1
												end if
												if (flag=0) then
												s=s& "<CENTER><a href=" & "items.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดเพิ่มเติม : "& Request.QueryString("items")&" >> </font></font></font></a></CENTER>"
												end if
												if (Template=2) then
												Row2=Row2&s
												end if
											else	'?????????????????/////
												

												c=0
												s=""
												s=s&"<font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"&"<br><br>"&"ข้อมูลภายในตำบล"&"   "&Request.QueryString("tumbon")&"<br>"
												s=s&"<br>"&" ร้านค้าในตำบลนี้ ได้แก่ "
												For i=0 TO VL-1				
													if VL_Lname(i)=Request.QueryString("tumbon") then
														'Response.Write(VL_Lname(i))
														s=s&VL_Vname(i)&" "
													end if
												Next
												
												s=s&"<br>"
												
												if (Request.QueryString("store")<>"None") then
												For i=0 TO VL-1				
													if VL_Lname(i)=Request.QueryString("tumbon") then
														For j=0 To VenMax-1
															if(Ven_name(j)=VL_Vname(i)) then
															'***********************
															s=s&"ชื่อร้าน : "&Ven_name(j)&"<br>"
															s=s&"รายละเอียดร้านค้า : "&Ven_info(j)&"<br>"
															s=s&"ที่อยู่ร้าน : "&Ven_addr(j)&"<br>"
															end if
														Next
													end if
												Next
												end if

												s=s&"<br>"&" สินค้าขึ้นชื่อในตำบล ได้แก่ "
												For i=0 TO IL-1
													if IL_Lname(i)=Request.QueryString("tumbon") then
														s=s&IL_Iname(i)&" "
													end if
												Next
												s=s&"</font>"
												s=s&"<br>"
												For i=0 TO IL-1
													if IL_Lname(i)=Request.QueryString("tumbon") then
														For j=0 To IteMax-1
															if IL_Iname(i)=Ite_name(j) then
																	
																	if (Template=1) then
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<br>"&"<hr><IMG src="&Ite_pic(j)&" width=200 height=200></IMG></hr>"&"<br><br>"
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	
																	strHTML2=strHTML2&"<td width=""40%"">"
																	end if
																		strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font &">"&Ite_name(j)&"<br>"
																	strHTML2=strHTML2&"รายละเอียดของสินค้า : "&Ite_info(j)
																	strHTML2=strHTML2&" ราคาอยู่ในช่วง "&Ite_minprice(j)&" ถึง "
																	strHTML2=strHTML2&Ite_maxprice(j)&"</font>"
																	
																	'**************
																	'moreinfo and pic2===>
																	if(Ite_moreinfo(j) <> "") then
																		strHTML2=strHTML2&"<a href=" & "OTOP2.asp?"&"info="&Ite_moreinfo(j)&"&pic2="&Ite_pic2(j)&"&name="&Ite_name(j)&"&StoreName="&store&"&ItemsName="&items&"&LocName="&local&"&page="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br> รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
																	end if
																	'*************
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	
																	strHTML2=strHTML2&"<td width=""20%"">"
																	
																		
																		if c=0 then 
																		strHTML2=strHTML2&strHTML3 
																		c=1
																		end if
																	
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
															end if
														Next
													end if
												Next
																	s=s&strHTML2
																	if (Template=1) then s=s&"</table>" end if
															
											if (Request.QueryString("items")="None") then
											flag=0
													
													For i=0 TO VL-1
														if VL_Lname(i)=Request.QueryString("tumbon") then
															if VL_Vname(i)=Request.QueryString("store") then			
																flag=1
																j=VL
															end if
														end if
													Next

											if ((Request.QueryString("tumbon")="None" and Request.QueryString("store")<>"None") or (Request.QueryString("tumbon")<>"None" and Request.QueryString("store")="None")) then
												flag=1
											end if

											if flag=0 then
											s=s& "<CENTER><a href=" & "Store.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของร้าน : "& Request.QueryString("store")&" >> </font></font></font></a></CENTER>" 
											end if
											end if

											if (Request.QueryString("store")="None") then 
											For j=0 To IL-1
														if IL_Lname(j)=Request.QueryString("tumbon") then
															if IL_Iname(j)=Request.QueryString("items") then			
																flag=1
																j=IL
															end if
														end if
													Next

											if ((Request.QueryString("tumbon")="None" and Request.QueryString("items")<>"None") or (Request.QueryString("tumbon")<>"None" and Request.QueryString("items")="None")) then
												flag=1
											end if
											if flag=0 then
											s=s& "<CENTER><a href=" & "items.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของสินค้า : "& Request.QueryString("items")&" >> </font></font></font></a></CENTER>" 
											end if
											end if
										
										if (Request.QueryString("items")<>"None") then
											if (Request.QueryString("store")<>"None") then
													flag=0
													For i=0 TO VL-1
														if VL_Lname(i)=Request.QueryString("tumbon") then
															if VL_Vname(i)=Request.QueryString("store") then			
																flag=1
																j=VL
															end if
														end if
													Next
													if flag=0 then	
													s=s& "<CENTER><a href=" & "Store.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของร้าน : "& Request.QueryString("store")&" >> </font></font></font></a></CENTER>"
													end if
													
													flag=0
													For j=0 To IL-1
														if IL_Lname(j)=Request.QueryString("tumbon") then
															if IL_Iname(j)=Request.QueryString("items") then			
																flag=1
																j=IL
															end if
														end if
													Next
													if flag=0 then
													s=s& "<CENTER><a href=" & "items.asp?"&"store="&Request.QueryString("store")&"&tumbon="&Request.QueryString("tumbon")&"&items="&Request.QueryString("items")&">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " รายละเอียดของสินค้า : "& Request.QueryString("items")&" >> </font></font></font></a></CENTER>"
													end if
											end if
										end if	
											if (Template=2) then
											Row2=Row2&s
											end if
										end if
										end if
										end if
										end if

	s="<font size="&Text_size&" font color="&Text_color&"font face="&Text_font&">"&s&"</font>"
	if (Template=1) then Response.Write(s) end if
	if (Template=2) then
		s=""
		s=s&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
		s=s&"<tr>"
		s=s&"<td width=""30%"">"
		s=s&LinkPlate2
		s=s&"</td>"
		s=s&"<td width=""70%"">"
		s=s&Row2
		s=s&"</td>"
		s=s&"</tr>"
		s=s&"</table>"
		Response.Write(s)
	end if
	Response.Write"</form>"
</script>
</HTML>