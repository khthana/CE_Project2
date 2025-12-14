<HTML>
<script language="vbscript" runat="server">
 DIM strHTML
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 DIM LinkPlate2
 DIM Row2
 DIM count
									strHTML=strHTML&"<form  name=""Chose"" method=post action=Travel.asp>"
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
											strHTML=strHTML&"<font size="&Text_size2&" font color="&Text_color&" face="&Text_font&">"
											strHTML=strHTML&"ข้อมูลสถานที่ท่องเที่ยว"&"</font>"
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

											strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--ประเพณีวัฒนธรรม--</font></font></font></a>"
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

											strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--ข้อมูลการเดินทาง--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=6 then

											strHTML=strHTML & "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "--ข้อมูลสถานที่ท่องเที่ยว--</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=7 then

											strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--ข้อมูลที่พักแรม--</font></font></font></a>"
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
									'Response.Write(strHTML)
									LinkPlate2=strHTML
									end if
									strHTML=""

objRS2.Close
Set objRS2=Nothing
'*******************************  Put all of record into Array ******************************************************
DIM Pla_order(1000)
DIM Pla_type(1000)		
DIM Pla_num1 	'PLACE TYPE

DIM Pla_name(1000)		
DIM Pla_order2(1000)
DIM Pla_info(1000)
DIM Dis_name(1000)
DIM Pla_addr(1000)
DIM Pla_tel(1000)
DIM Pla_mail(1000)
DIM Pla_price(1000)
DIM Pla_pic(1000)
DIM Pla_moreinfo(1000)
DIM Pla_pic2(1000)		
DIM Pla_num2		'PLACE

count=0
														strHTML3=strHTML3&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"ประเภทสถานที่ท่องเที่ยว<br> "&"<Select Name = ""Combo1"" Size=""1""  onchange=Chose.submit()>"

strSql3="Select * From PLACE_TYPE"
Set  objRS3=Server.CreateObject("ADODB.Recordset")
objRS3.Open strSql3,ObjConn				


				
																strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
														Do While Not objRS3.Eof
															if Request("Combo1")= objRS3("Pla_type")then										
																	strHTML3=strHTML3&"<Option selected Value="&objRS3("Pla_type")&">"&objRS3("Pla_type")&"</Option>"									
															else										
																		strHTML3=strHTML3&"<Option  Value="&objRS3("Pla_type")&">"&objRS3("Pla_type")&"</Option>"
															end if
																
																	Pla_order(count)=objRS3("Pla_order") 
																	Pla_type(count)=objRS3("Pla_type")									
																					
															count=count+1
															objRS3.MoveNext
														Loop
														strHTML3=strHTML3&"</Select><br><br>"
objRS3.Close
Set objRS3=Nothing
Pla_num1=count
count=0

'*************************													
strSql4="Select * From PLACE"
Set  objRS4=Server.CreateObject("ADODB.Recordset")
objRS4.Open strSql4,ObjConn							
											
														Do While Not objRS4.Eof

																	Pla_name(count)=objRS4("Pla_name")
																	Pla_order2(count)=objRS4("Pla_order")
																	Pla_info(count)=objRS4("Pla_info")
																	Dis_name(count)=objRS4("Dis_name")
																	Pla_addr(count)=objRS4("Pla_addr")
																	Pla_tel(count)=objRS4("Pla_tel")
																	Pla_mail(count)=objRS4("Pla_mail")
																	Pla_price(count)=objRS4("Pla_price")
																	Pla_pic(count)=objRS4("Pla_pic")
																	Pla_moreinfo(count)=objRS4("Pla_moreinfo")
																	Pla_pic2(count)=objRS4("Pla_pic2")									
																					
															count=count+1
															objRS4.MoveNext
															Loop
objRS4.Close
Set objRS4=Nothing
Pla_num2=count
count=0

'**********************
	strSql5="Select * From DISTRICT"
	Set  objRS5=Server.CreateObject("ADODB.Recordset")
	objRS5.Open strSql5,ObjConn

										strHTML3=strHTML3&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"ค้นหาจากชื่ออำเภอ<br> "&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"

									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS5.Eof
										if Request("Combo2")= objRS5("Dis_name")then
												strHTML3=strHTML3&"<Option selected Value="&objRS5("Dis_name")&">"&objRS5("Dis_name")&"</Option>"
										else
												strHTML3=strHTML3&"<Option  Value="&objRS5("Dis_name")&">"&objRS5("Dis_name")&"</Option>"

										end if
										
										objRS5.MoveNext
									Loop
									strHTML3=strHTML3&"</Select>"

			
	objRS5.Close
	Set objRS2=Nothing
s=strHTML3
'if (Template=2) then
'Response.Write(strHTML3)
'end if
if (Template=1) then
str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
str=str&"<tr>"
str=str&"<td width=""33%"">"

str=str&"</td>"
str=str&"<td width=""52%"">"

str=str&"</td>"
str=str&"<td width=""15%"">"
str=str&s
str=str&"</td>"
str=str&"</tr>"
str=str&"</table>"
s=str
end if

'************************************     Show All of Info      ******************************************************
DIM i,j,k
DIM strHTML2
	k=0

	if (Template=1) then
	strHTML2=strHTML2&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
	strHTML2=strHTML2&"<tr>"
	end if
										if (Request.QueryString("case")="") then
												if (Request("Combo1")="None" or Request("Combo1")="" )then
													if (Request("Combo2")="None" or Request("Combo2")="") then ' combo1=none combo2=none
														For i=0 To Pla_num1-1
															For j=0 To Pla_num2-1
																s=""
																if Pla_order(i)=Pla_order2(j) then
																	Call Show(i,j,1)							
																end if

																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if

															Next
														Next
														k=0
														if (Template=1) then
														strHTML2=strHTML2&"</table>"
														end if
														s=s&strHTML2
													else ' combo1=none combo2<>none
													
														For j=0 To Pla_num2-1
															if Request("Combo2")=Dis_name(j) then
																	s=""
																	Call Show(i,j,2)
																	
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
															end if
														Next
														k=0
														
														if (Template=1) then
														strHTML2=strHTML2&"</table>"
														end if
														
														s=s&strHTML2
													end if
												else
													if Request("Combo2")="None" then  'combo1<>none combo2=none
														For i=0 To Pla_num1-1
															if Request("Combo1")=Pla_type(i) then
																For j=0 To Pla_num2-1
																	if Pla_order(i)=Pla_order2(j) then
																	s=""
																	Call Show(i,j,3)
																	
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if

																	end if
																Next
															end if
														Next
														k=0

														if (Template=1) then
														strHTML2=strHTML2&"</table>"
														end if
														
														s=s&strHTML2
													else  'combo1<>none combo2<>none


															For i=0 To Pla_num1-1
																if (Request("Combo1")=Pla_type(i)) then
																	For j=0 To Pla_num2-1
																		if(Pla_order(i)=Pla_order2(j)) then
																			if (Dis_name(j)=Request("Combo2")) then
																				s=""
																				Call Show(i,j,4)
																				
																				if (Template=1) then
																				strHTML2=strHTML2&"</td>"
																				strHTML2=strHTML2&"</tr>"
																				end if

																			end if
																		end if
																	Next		
																end if
																k=0
															Next
															if (Template=1) then
															strHTML2=strHTML2&"</table>"
															end if
															s=s&strHTML2
													end if
												end if
										end if
'***************** Function Show **********************
Function Show(i,j,c)
if (Template=1) then
strHTML2=strHTML2&"<td width=""30%"">"
end if

strHTML2=strHTML2&"<br><br><IMG src="&Pla_pic(j)&" width=200 height=200></IMG>"&"<br><br>"

if (Template=1) then
strHTML2=strHTML2&"</td>"
																
strHTML2=strHTML2&"<td width=""50%"">"
end if
																	
strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&"<br><br>ชื่อสถานที่ : "&Pla_name(j)&"<br>"		
strHTML2=strHTML2&"รายละเอียด : "&Pla_info(j)&"<br>"
strHTML2=strHTML2&"อยู่ทีอำเภอ : "&Dis_name(j)&"<br>"
strHTML2=strHTML2&"ที่ตั้ง : "&Pla_addr(j)&"<br>"
strHTML2=strHTML2&"โทรศัพท์ : "&Pla_tel(j)&"<br>"
strHTML2=strHTML2&"Web Site : "&Pla_mail(j)&"<br>"
strHTML2=strHTML2&"อัตราค่าผ่านประตู/ค่าธรรมเนียม : "&Pla_price(j)&"&nbsp"&"</font><br>"
																	
if (Pla_moreinfo(j)<>"") then																																					
strHTML2=strHTML2& "<a href=" & "Travel2.asp?"&"name="&Pla_name(j)&"&info="&Pla_moreinfo(j)&"&pic="&Pla_pic2(j)&"&case="&c&"&district="&Dis_name(j)&"&type="&Pla_type(i)& ">"&"<font size=+1><font color="&Text_color&">"&"<font face="&Text_font&">" & "รายละเอียดเพิ่มเติม >>  </font></font></font></a>"
end if

if (Template=1) then
strHTML2=strHTML2&"</td>"
																
strHTML2=strHTML2&"<td width=""20%"">"
if (k=0) then 
strHTML2=strHTML2&strHTML3
k=1
end if
end if

End Function
'*************************************************************************************************************
									if (Request.QueryString("case")<>"") then
											if (Template=1) then
											strHTML2=strHTML2&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
											strHTML2=strHTML2&"<tr>"
											end if
											
											Select case Request.QueryString("case")
												case 1
												
												'*****************
														For i=0 To Pla_num1-1
															For j=0 To Pla_num2-1
																s=""
																if Pla_order(i)=Pla_order2(j) then
																	Call Show(i,j,1)
																end if
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
															Next
														Next
														k=0
														if (Template=1) then
														strHTML2=strHTML2&"</table>"
														end if
														s=s&strHTML2

												'*****************
												case 2
												
												'*****************
													For j=0 To Pla_num2-1
															if Dis_name(j)=Request.QueryString("district") then
																	s=""
																	Call Show(i,j,2)
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
															end if
														Next
														k=0
														if (Template=1) then
														strHTML2=strHTML2&"</table>"
														end if
														s=s&strHTML2
												'*****************
												case 3
												
												'*****************
														For i=0 To Pla_num1-1
															if Request.QueryString("type")=Pla_type(i) then
																For j=0 To Pla_num2-1
																	if Pla_order(i)=Pla_order2(j) then
																	s=""
																	Call Show(i,j,3)
																	if (Template=1) then
																	strHTML2=strHTML2&"</td>"
																	strHTML2=strHTML2&"</tr>"
																	end if
																	end if
																Next
															end if
														Next
														k=0
														if (Template=1) then
														strHTML2=strHTML2&"</table>"
														end if
														s=s&strHTML2
												
												'*****************
												case 4
														For i=0 To Pla_num1-1
																if (Request.QueryString("type")=Pla_type(i)) then
																	For j=0 To Pla_num2-1
																		if(Pla_order(i)=Pla_order2(j)) then
																			if (Dis_name(j)=Request.QueryString("district")) then
																				s=""
																				Call Show(i,j,4)
																				
																				if (Template=1) then
																				strHTML2=strHTML2&"</td>"
																				strHTML2=strHTML2&"</tr>"
																				end if

																			end if
																		end if
																	Next		
																end if
																k=0
															Next
															if (Template=1) then
															strHTML2=strHTML2&"</table>"
															end if
															s=s&strHTML2
											End Select
											if (Template=1) then
											strHTML2=strHTML2&"</tr></table>"
											end if
									end if

									if (Template=1) then
									Response.Write(s)
									end if

									if (Template=2) then
										str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
										str=str&"<td width=""20%"">"
										str=str&LinkPlate2
										str=str&"</td>"													
										str=str&"<td width=""60%"">"
										str=str&"<br><br>"
										str=str&strHTML3
										str=str&strHTML2
										str=str&"</td>"
										'str=str&"<td width=""20%"">"
										'str=str&strHTML3
										'str=str&"</td>"
										str=str&"</tr></table>"
										Response.Write(str)
									end if
Set objConn=Nothing
</script>
</HTML>