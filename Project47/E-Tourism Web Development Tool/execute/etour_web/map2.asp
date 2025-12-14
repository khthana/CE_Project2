<html>

 <script language="vbscript" runat="server">
 
 	DIM Template
 	DIM Text_font
 	DIM Text_size
 	DIM Text_color
 	DIM Back_color
 
 	DIM topic(10)
 	DIM CulNum
 	DIM DisNum
 	DIM FirNum
 	DIM HosNum
 	DIM LocNum
 	DIM PlaNum
 	DIM PolNum
 	DIM ResNum
 	DIM StaNum
 	DIM VenNum
 	
 	DIM Cul_name(1000)
	DIM Cul_x(1000)
	DIM Cul_y(1000)
	DIM Cul_info(1000)
	DIM Cul_time(1000)
 	
 	DIM Dis_name(1000)
	DIM Dis_x(1000)
	DIM Dis_y(1000)
 	
 	DIM Fir_name(1000)
	DIM Fir_x(1000)
	DIM Fir_y(1000)
	DIM Fir_addr(1000)
	DIM Fir_tel(1000)	
 	
 	DIM Hos_name(1000)
	DIM Hos_x(1000)
	DIM Hos_y(1000)
	DIM Hos_addr(1000)
	DIM Hos_tel(1000)
	
	DIM Loc_name(1000)
	DIM Loc_x(1000)
	DIM Loc_y(1000)
	
	DIM Pla_name(1000)
	DIM Pla_x(1000)
	DIM Pla_y(1000)
	DIM Pla_info(1000)
	DIM Pla_addr(1000)
	
	DIM Pol_name(1000)
	DIM Pol_x(1000)
	DIM Pol_y(1000)
	DIM Pol_addr(1000)
	DIM Pol_tel(1000)
	
	DIM Res_name(1000)
	DIM Res_x(1000)
	DIM Res_y(1000)
	DIM Res_info(1000)
	DIM Res_star(1000)
	DIM Res_addr(1000)
	DIM Res_mail(1000)
 	
 	DIM Sta_name(1000)
	DIM Sta_x(1000)
	DIM Sta_y(1000)
	DIM Sta_info(1000)
	DIM Sta_addr(1000)
	
	
	DIM Ven_name(1000)
	DIM Ven_x(1000)
	DIM Ven_y(1000)	
	DIM Ven_info(1000)
	DIM Ven_addr(1000)
 	
 	Response.write"<head>"
	Response.write"<meta http-equiv='content-type' content='text/html;charset=window-874'>"
	Response.write"</head>"
	
	
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
'************
For i=0 To 9
	topic(i)=0
Next

count=0
strSql="Select * From CULTURE"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Cul_name(count)=objRS("Cul_name")
																Cul_x(count)= objRS("Cul_x")
																Cul_y(count)= objRS("Cul_y")
																Cul_info(count)= objRS("Cul_info")
																Cul_time(count)= objRS("Cul_time")	
																count=count+1							
															objRS.MoveNext
															Loop
															CulNum=count
															if (Cul_name(0)<>"") then
															 topic(0)=1
															end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From DISTRICT"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Dis_name(count)=objRS("Dis_name")
																Dis_x(count)= objRS("Dis_x")
																Dis_y(count)= objRS("Dis_y")	
																count=count+1									
															objRS.MoveNext
															Loop
															DisNum=count
															if (Dis_name(0)<>"") then
															 topic(1)=1
															end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From FIRE"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
														Do While Not objRS.Eof
																Fir_name(count)=objRS("Fir_name")
																Fir_x(count)= objRS("Fir_x")
																Fir_y(count)= objRS("Fir_y")	
																Fir_addr(count)= objRS("Fir_addr")
																Fir_tel(count)= objRS("Fir_tel")
																count=count+1
														objRS.MoveNext															
														Loop
														FirNum=count
														if (Fir_name(0)<>"") then
															 topic(2)=1
														end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From HOSPITAL"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Hos_name(count)=objRS("Hos_name")
																Hos_x(count)= objRS("Hos_x")
																Hos_y(count)= objRS("Hos_y")	
																Hos_addr(count)= objRS("Hos_addr")
																Hos_tel(count)= objRS("Hos_tel")
																count=count+1															
															objRS.MoveNext
														Loop
														HosNum=count
														if (Hos_name(0)<>"") then
															 topic(3)=1
														end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From LOCALITY"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Loc_name(count)=objRS("Loc_name")
																Loc_x(count)= objRS("Loc_x")
																Loc_y(count)= objRS("Loc_y")	
																count=count+1														
															objRS.MoveNext
															Loop
															LocNum=count
															if (Loc_name(0)<>"") then
															 topic(4)=1
															end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From PLACE"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Pla_name(count)=objRS("Pla_name")
																Pla_x(count)= objRS("Pla_x")
																Pla_y(count)= objRS("Pla_y")
																Pla_info(count)= objRS("Pla_info")
																Pla_addr(count)= objRS("Pla_addr")	
																count=count+1											
															objRS.MoveNext
															Loop
															PlaNum=count
															if (Pla_name(0)<>"") then
															 topic(5)=1
															end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From POLICE"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Pol_name(count)=objRS("Pol_name")
																Pol_x(count)= objRS("Pol_x")
																Pol_y(count)= objRS("Pol_y")	
																Pol_addr(count)= objRS("Pol_addr")
																Pol_tel(count)= objRS("Pol_tel")
																count=count+1			
															objRS.MoveNext
															Loop
															PolNum=count
															if (Pol_name(0)<>"") then
															 topic(6)=1
															end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From RESIDENCE"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Res_name(count)=objRS("Res_name")
																Res_x(count)= objRS("Res_x")
																Res_y(count)= objRS("Res_y")	
																Res_info(count)= objRS("Res_info")
																Res_star(count)= objRS("Res_star")
																Res_addr(count)= objRS("Res_addr")
																Res_mail(count)= objRS("Res_mail")
																count=count+1												
															objRS.MoveNext
															Loop
															ResNum=count
															if (Res_name(0)<>"") then
															 topic(7)=1
															end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From STATION"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Sta_name(count)=objRS("Sta_name")
																Sta_x(count)= objRS("Sta_x")
																Sta_y(count)= objRS("Sta_y")	
																Sta_info(count)= objRS("Sta_info")
																Sta_addr(count)= objRS("Sta_addr")
																count=count+1	
															objRS.MoveNext
															Loop
															StaNum=count
															if (Sta_name(0)<>"") then
															 topic(8)=1
															end if
objRS.Close
Set objRS=Nothing	

count=0
strSql="Select * From VENDOR"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
															Do While Not objRS.Eof
																Ven_name(count)=objRS("Ven_name")
																Ven_x(count)= objRS("Ven_x")
																Ven_y(count)= objRS("Ven_y")	
																Ven_info(count)= objRS("Ven_info")
																Ven_addr(count)= objRS("Ven_addr")
																count=count+1	
															objRS.MoveNext
															Loop
															VenNum=count
															if (Sta_name(0)<>"") then
															 topic(9)=1
															end if
objRS.Close
Set objRS=Nothing	

'******************************************************************************************************	
'******************************  Select Place Type Source ********************************************************
	
									Response.Write "<form  name=""Chose"" method=post action=map2.asp>"
									strHTML=strHTML&"<br><br><font size="&Text_size2&" font color="&Text_color&" face="&Text_font&">"
									strHTML=strHTML&"<tr bgcolor="&Back_color&">"
									strHTML=strHTML&"ค้นหาตำแหน่ง <br><br></font>"

										strHTML=strHTML&"<font size="&Text_size&" font color="&Text_color&" face="& Text_font&">"&"ประเภทของสถานที่<br> "&"<Select Name = ""Combo"" Size=""1""  onchange=Chose.submit()>"
									
	
									if Request("Combo")="None" then 
									strHTML=strHTML&"<Option selected Value =""None"" >"&"None"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""None"">"&"None"&"</Option>"
									end if
									
									if topic(0)=1 then
									if Request("Combo")="เทศกาลงานประเพณี" then 
									strHTML=strHTML&"<Option selected Value =""เทศกาลงานประเพณี"" >"&"เทศกาลงานประเพณี"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""เทศกาลงานประเพณี"">"&"เทศกาลงานประเพณี"&"</Option>"
									end if
									end if
									
									if topic(1)=1 then
									if Request("Combo")="อำเภอ" then 
									strHTML=strHTML&"<Option selected Value =""อำเภอ"" >"&"อำเภอ"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""อำเภอ"">"&"อำเภอ"&"</Option>"
									end if
									end if
									
									if topic(2)=1 then
									if Request("Combo")="สถานีตำรวจดับเพลิง" then 
									strHTML=strHTML&"<Option selected Value =""สถานีตำรวจดับเพลิง"" >"&"สถานีตำรวจดับเพลิง"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""สถานีตำรวจดับเพลิง"">"&"สถานีตำรวจดับเพลิง"&"</Option>"
									end if
									end if
									
									if topic(3)=1 then
									if Request("Combo")="โรงพยาบาล" then 
									strHTML=strHTML&"<Option selected Value =""โรงพยาบาล"" >"&"โรงพยาบาล"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""โรงพยาบาล"">"&"โรงพยาบาล"&"</Option>"
									end if
									end if
									
									if topic(4)=1 then
									if Request("Combo")="ตำบล" then 
									strHTML=strHTML&"<Option selected Value =""ตำบล"" >"&"ตำบล"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""ตำบล"">"&"ตำบล"&"</Option>"
									end if
									end if
									
									if topic(5)=1 then
									if Request("Combo")="สถานที่ท่องเที่ยว" then 
									strHTML=strHTML&"<Option selected Value =""สถานที่ท่องเที่ยว"" >"&"สถานที่ท่องเที่ยว"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""สถานที่ท่องเที่ยว"">"&"สถานที่ท่องเที่ยว"&"</Option>"
									end if
									end if
									
									if topic(6)=1 then
									if Request("Combo")="สถานีตำรวจ" then 
									strHTML=strHTML&"<Option selected Value =""สถานีตำรวจ"" >"&"สถานีตำรวจ"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""สถานีตำรวจ"">"&"สถานีตำรวจ"&"</Option>"
									end if
									end if
									
									if topic(7)=1 then
									if Request("Combo")="ที่พัก" then 
									strHTML=strHTML&"<Option selected Value =""ที่พัก"" >"&"ที่พัก"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""ที่พัก"">"&"ที่พัก"&"</Option>"
									end if
									end if
									
									if topic(8)=1 then
									if Request("Combo")="สถานีขนส่ง" then 
									strHTML=strHTML&"<Option selected Value =""สถานีขนส่ง"" >"&"สถานีขนส่ง"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""สถานีขนส่ง"">"&"สถานีขนส่ง"&"</Option>"
									end if
									end if
									
									if topic(9)=1 then
									if Request("Combo")="ร้านค้า" then 
									strHTML=strHTML&"<Option selected Value =""ร้านค้า"" >"&"ร้านค้า"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""ร้านค้า"">"&"ร้านค้า"&"</Option>"
									end if
									end if
									strHTML=strHTML&"</Select><br><br>"
									
'************************************************************************************************************	
'******************************  Select Place Name  Source********************************************************
	strHTML=strHTML&"<font size="&Text_size&" font color="&Text_color&" face="& Text_font&">"&"ชื่อสถานที่<br> "&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"
									
									if Request("Combo2")="None" then 
									strHTML=strHTML&"<Option selected Value =""None"" >"&"None"&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value=""None"">"&"None"&"</Option>"
									end if
									
									if Request("Combo")="เทศกาลงานประเพณี" then 
										For i=0 To CulNum-1
									If Request("Combo2")=Cul_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Cul_name(i) &">"&Cul_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Cul_name(i)&">"&Cul_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="อำเภอ" then 
										For i=0 To DisNum-1
									If Request("Combo2")=Dis_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Dis_name(i)&" >"&Dis_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Dis_name(i)&">"&Dis_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="สถานีตำรวจดับเพลิง" then 
										For i=0 To FirNum-1
									If Request("Combo2")=Fir_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Fir_name(i)&" >"&Fir_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Fir_name(i)&">"&Fir_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="โรงพยาบาล" then 
										For i=0 To HosNum-1
									If Request("Combo2")=Hos_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Hos_name(i)&" >"&Hos_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Hos_name(i)&">"&Hos_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="ตำบล" then 
										For i=0 To LocNum-1
									If Request("Combo2")=Loc_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Loc_name(i)&" >"&Loc_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Loc_name(i)&">"&Loc_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="สถานที่ท่องเที่ยว" then 
										For i=0 To PlaNum-1
									If Request("Combo2")=Pla_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Pla_name(i) &">"&Pla_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Pla_name(i)&">"&Pla_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="สถานีตำรวจ" then 
										For i=0 To PolNum-1
									If Request("Combo2")=Pol_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Pol_name(i)&" >"&Pol_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Pol_name(i)&">"&Pol_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="ที่พัก" then 
										For i=0 To ResNum-1
									If Request("Combo2")=Res_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Res_name(i)&" >"&Res_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Res_name(i)&">"&Res_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="สถานีขนส่ง" then 
										For i=0 To StaNum-1
									If Request("Combo2")=Sta_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Sta_name(i)&" >"&Sta_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Sta_name(i)&">"&Sta_name(i)&"</Option>"
									end if
										Next
									end if
									
									if Request("Combo")="ร้านค้า" then 
										For i=0 To VenNum-1
									If Request("Combo2")=Ven_name(i) then 
									strHTML=strHTML&"<Option selected Value ="&Ven_name(i)&" >"&Ven_name(i)&"</Option>"		
									else 
									strHTML=strHTML&"<Option Value="&Ven_name(i)&">"&Ven_name(i)&"</Option>"
									end if
										Next
									end if

									strHTML=strHTML&"</Select><br><br>"

'*******************************************************************************************************
strHTML=strHTML&"<CENTER>"&"<IMG src=""map.JPG"" Style= ""position:absolute;left:300;top:0;width:700;height:600""></IMG>"&"</CENTER>"
'*******************************************************************************************************
if Request("Combo")="เทศกาลงานประเพณี" then
	k=0
	For i=0 To CulNum-1
		if (Request("Combo2")=Cul_name(i)) then
			Call Plot(Cul_x(i),Cul_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"รายละเอียด"&nbsp&":"
			str=str&Cul_info(i)
			str=str&"<br>"
			str=str&"ช่วงเวลาเทศกาล"&nbsp&":"
			str=str&Cul_time(i)                      
               str=str&"</td>"
               str=str&"<td width=""75%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
			'strHTML=strHTML&Cul_info(i)
			'strHTML=strHTML&Cul_time(i)
			k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		k=1
		For i=0 To CulNum-1
			Call Plot(Cul_x(i),Cul_y(i))
			Cul_x(i)=Cul_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Cul_x(i)&"&y_pos="&Cul_y(i)&"&c="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Cul_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

if Request("Combo")="อำเภอ" then 
	k=0
	For i=0 To DisNum-1
	if (Request("Combo2")=Dis_name(i)) then
			Call Plot(Dis_x(i),Dis_y(i))
			k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		k=1
		For i=0 To DisNum-1
			Call Plot(Dis_x(i),Dis_y(i))
			Dis_x(i)=Dis_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Dis_x(i)&"&y_pos="&Dis_y(i)&"&c="&"2"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Dis_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
		
end if

if Request("Combo")="สถานีตำรวจดับเพลิง" then 
	k=0
	For i=0 To FirNum-1
	if (Request("Combo2")=Fir_name(i)) then
			Call Plot(Fir_x(i),Fir_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"ที่อยู่"&nbsp&":"
			str=str&Fir_addr(i)
			str=str&"<br>"
			str=str&"เบอร์โทรศัพท์"&nbsp&":"
			str=str&Fir_tel(i)	                     
               str=str&"</td>"
               str=str&"<td width=""70%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
               k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To FirNum-1
			Call Plot(Fir_x(i),Fir_y(i))
			Fir_x(i)=Fir_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Fir_x(i)&"&y_pos="&Fir_y(i)&"&c="&"3"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Fir_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

if Request("Combo")="โรงพยาบาล" then 
	k=0
	For i=0 To HosNum-1
	if (Request("Combo2")=Hos_name(i)) then
			Call Plot(Hos_x(i),Hos_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"ที่อยู่"&nbsp&":"
			str=str&Hos_addr(i)
			str=str&"<br>"
			str=str&"เบอร์โทรศัพท์"&nbsp&":"
			str=str&Hos_tel(i)	                     
               str=str&"</td>"
               str=str&"<td width=""75%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
               k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To HosNum-1
			Call Plot(Hos_x(i),Hos_y(i))
			Hos_x(i)=Hos_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Hos_x(i)&"&y_pos="&Hos_y(i)&"&c="&"4"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Hos_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

if Request("Combo")="ตำบล" then 
	k=0
	For i=0 To LocNum-1
	if (Request("Combo2")=Loc_name(i)) then
			Call Plot(Loc_x(i),Loc_y(i))
			k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To LocNum-1
			Call Plot(Loc_x(i),Loc_y(i))
			Loc_x(i)=Loc_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Loc_x(i)&"&y_pos="&Loc_y(i)&"&c="&"5"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Loc_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

if Request("Combo")="สถานที่ท่องเที่ยว" then 
	k=0
	For i=0 To PlaNum-1
	if (Request("Combo2")=Pla_name(i)) then
			Call Plot(Pla_x(i),Pla_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"ที่อยู่"&nbsp&":"
			str=str&Pla_addr(i)
			str=str&"<br>"
			str=str&"รายละเอียด"&nbsp&":"
			str=str&Pla_info(i)	                     
               str=str&"</td>"
               str=str&"<td width=""75%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
               k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To PlaNum-1
			Call Plot(Pla_x(i),Pla_y(i))
			Pla_x(i)=Pla_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Pla_x(i)&"&y_pos="&Pla_y(i)&"&c="&"6"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Pla_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

if Request("Combo")="สถานีตำรวจ" then 
	k=0
	For i=0 To PolNum-1
	if (Request("Combo2")=Pol_name(i)) then
			Call Plot(Pol_x(i),Pol_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"ที่อยู่"&nbsp&":"
			str=str&Pla_addr(i)
			str=str&"<br>"
			str=str&"เบอร์โทรศัพท์"&nbsp&":"
			str=str&Pol_tel(i)	                     
               str=str&"</td>"
               str=str&"<td width=""75%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
               k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To PolNum-1
			Call Plot(Pol_x(i),Pol_y(i))
			Pol_x(i)=Pol_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Pol_x(i)&"&y_pos="&Pol_y(i)&"&c="&"7"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Pol_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

if Request("Combo")="ที่พัก" then 
	k=0
	For i=0 To ResNum-1
	if (Request("Combo2")=Res_name(i)) then
			Call Plot(Res_x(i),Res_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"ระดับดาว"&nbsp&":"
			str=str&Res_star(i)
			str=str&"<br>"
			
			str=str&"รายละเอียด"&nbsp&":"
			str=str&Res_info(i)
			str=str&"<br>"
			
			str=str&"ที่อยู่"&nbsp&":"			
			str=str&Res_addr(i)
			str=str&"<br>"
			
			str=str&"Web Site"&nbsp&":"	
			if (Res_mail(i)<>"") then		
					str=str&"<a href=http://" &Res_mail(i)&"><font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Res_mail(i)&"<br><br></font></font></font></a>"
			end if	                     
               str=str&"</td>"
               str=str&"<td width=""75%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
               k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To ResNum-1
			Call Plot(Res_x(i),Res_y(i))
			Res_x(i)=Res_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Res_x(i)&"&y_pos="&Res_y(i)&"&c="&"8"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Res_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

if Request("Combo")="สถานีขนส่ง" then 
	k=0
	For i=0 To StaNum-1
	if (Request("Combo2")=Sta_name(i)) then
			Call Plot(Sta_x(i),Sta_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"ข้อมูล"&nbsp&":"
			str=str&Sta_info(i)
			str=str&"<br>"
			str=str&"ที่อยู่"&nbsp&":"
			str=str&Sta_addr(i)	                     
               str=str&"</td>"
               str=str&"<td width=""75%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
               k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To StaNum-1
			Call Plot(Sta_x(i),Sta_y(i))
			Sta_x(i)=Sta_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Sta_x(i)&"&y_pos="&Sta_y(i)&"&c="&"9"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Sta_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

'********************************************
if Request("Combo")="ร้านค้า" then 
	k=0
	For i=0 To VenNum-1
	if (Request("Combo2")=Ven_name(i)) then
			Call Plot(Ven_x(i),Ven_y(i))
				str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
               str=str&"<tr>"
               str=str&"<td width=""25%"">"
               str=str&"ข้อมูล"&nbsp&":"
			str=str&Ven_info(i)
			str=str&"<br>"
			str=str&"ที่อยู่"&nbsp&":"
			str=str&Ven_addr(i)	                     
               str=str&"</td>"
               str=str&"<td width=""75%"">"
               str=str&"</td>"
               str=str&"</tr>"
               str=str&"</table>"
               k=1
		end if
	Next
	
	if (Request("Combo2")="None" or k=0) then
		For i=0 To VenNum-1
			Call Plot(Ven_x(i),Ven_y(i))
			Ven_x(i)=Ven_x(i)-300
				strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Ven_x(i)&"&y_pos="&Ven_y(i)&"&c="&"10"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Ven_name(i)&">><br><br></font></font></font></a>"
		Next
	end if
end if

Function Plot(x,y)

x=x+300
s=s&"position:absolute;left:"&x&";top:"&y&";width:10"  '=========> OK
strHTML=strHTML&"<img src=""C:\Inetpub\wwwroot\point.JPG"" name=""txtpic"" Style="&s&">"  '============> OK
End Function

Function Plot_Blue(x,y)
x=x+300
s=s&"position:absolute;left:"&x&";top:"&y&";width:10"  '=========> OK
strHTML=strHTML&"<img src=""C:\Inetpub\wwwroot\point_blue.JPG"" name=""txt"" Style="&s&">"  '============> OK
End Function

'*****************
if Request.QueryString("c")="1" then

For i=0 To CulNum-1

		if (Cul_x(i)=Request.QueryString("x_pos") ) and (Cul_y(i)=Request.QueryString("y_pos")) then
				Call Plot_Blue(Cul_x(i),Cul_y(i))
		else
				Call Plot(Cul_x(i),Cul_y(i))
		end if
		Cul_x(i)=Cul_x(i)-300
Next

For i=0 To CulNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Cul_x(i)&"&y_pos="&Cul_y(i)&"&c="&"1"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Cul_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="2" then

For i=0 To DisNum-1
	if ((Dis_x(i)=Request.QueryString("x_pos")) and (Dis_y(i)=Request.QueryString("y_pos"))) then
		Call Plot_Blue(Dis_x(i),Dis_y(i))
	else 
		Call Plot(Dis_x(i),Dis_y(i))
	end if
	Dis_x(i)=Dis_x(i)-300

Next

For i=0 To DisNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Dis_x(i)&"&y_pos="&Dis_y(i)&"&c="&"2"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Dis_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="3" then

For i=0 To FirNum-1
	if ((Fir_x(i)=Request.QueryString("x_pos")) and (Fir_y(i)=Request.QueryString("y_pos"))) then
		Call Plot_Blue(Fir_x(i),Fir_y(i))
	else 
		Call Plot(Fir_x(i),Fir_y(i))
	end if
	Fir_x(i)=Fir_x(i)-300
Next

For i=0 To FirNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Fir_x(i)&"&y_pos="&Fir_y(i)&"&c="&"3"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Fir_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="4" then

For i=0 To HosNum-1
	if ((Hos_x(i)=Request.QueryString("x_pos")) and (Hos_y(i)=Request.QueryString("y_pos"))) then
		Call Plot_Blue(Hos_x(i),Hos_y(i))
	else 
		Call Plot(Hos_x(i),Hos_y(i))
	end if
	Hos_x(i)=Hos_x(i)-300
Next

For i=0 To HosNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Hos_x(i)&"&y_pos="&Hos_y(i)&"&c="&"4"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Hos_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="5" then

For i=0 To LocNum-1
	if ((Loc_x(i)=Request.QueryString("x_pos")) and (Loc_y(i)=Request.QueryString("y_pos"))) then
		Call Plot_Blue(Loc_x(i),Loc_y(i))
	else 
		Call Plot(Loc_x(i),Loc_y(i))
	end if
	Loc_x(i)=Loc_x(i)-300
Next

For i=0 To LocNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Loc_x(i)&"&y_pos="&Loc_y(i)&"&c="&"5"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Loc_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="6" then

For i=0 To PlaNum-1
	if ((Pla_x(i)=Request.QueryString("x_pos")) and (Pla_y(i)=Request.QueryString("y_pos"))) then
		Call Plot_Blue(Pla_x(i),Pla_y(i))
	else 
		Call Plot(Pla_x(i),Pla_y(i))
	end if
	Pla_x(i)=Pla_x(i)-300
Next

For i=0 To PlaNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Pla_x(i)&"&y_pos="&Pla_y(i)&"&c="&"6"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Pla_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="7" then

For i=0 To PolNum-1
	if ((Pol_x(i)=Request.QueryString("x_pos")) and (Pol_y(i)=Request.QueryString("y_pos"))) then
		Call Plot_Blue(Pol_x(i),Pol_y(i))
	else 
		Call Plot(Pol_x(i),Pol_y(i))
	end if
	Pol_x(i)=Pol_x(i)-300
Next

For i=0 To PolNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Pol_x(i)&"&y_pos="&Pol_y(i)&"&c="&"7"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Pol_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="8" then

For i=0 To ResNum-1
	if ((Res_x(i)=Request.QueryString("x_pos")) and (Res_y(i)=Request.QueryString("y_pos"))) then
		Call  Plot_Blue(Res_x(i),Res_y(i))
	else 
		Call Plot(Res_x(i),Res_y(i))
	end if
	Res_x(i)=Res_x(i)-300
Next

For i=0 To ResNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Res_x(i)&"&y_pos="&Res_y(i)&"&c="&"8"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Res_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="9" then

For i=0 To StaNum-1
	if ((Sta_x(i)=Request.QueryString("x_pos")) and (Sta_y(i)=Request.QueryString("y_pos"))) then
		Call  Plot_Blue(Sta_x(i),Sta_y(i))
	else 
		Call Plot(Sta_x(i),Sta_y(i))
	end if
	Sta_x(i)=Sta_x(i)-300
Next

For i=0 To StaNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Sta_x(i)&"&y_pos="&Sta_y(i)&"&c="&"9"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Sta_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
if Request.QueryString("c")="10" then

For i=0 To VenNum-1
	if ((Ven_x(i)=Request.QueryString("x_pos")) and (Ven_y(i)=Request.QueryString("y_pos"))) then
		Call  Plot_Blue(Ven_x(i),Ven_y(i))
	else 
		Call Plot(Ven_x(i),Ven_y(i))
	end if
	Ven_x(i)=Ven_x(i)-300
Next

For i=0 To VenNum-1
strHTML=strHTML&"<a href=" & "map2.asp?"&"x_pos="&Ven_x(i)&"&y_pos="&Ven_y(i)&"&c="&"10"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &Ven_name(i)&">><br><br></font></font></font></a>"
Next
end if
'*******************
Response.Write("<body bgcolor ="&Back_color&">")											
Response.Write(strHTML)
str=str&"<a href=" & "Boundary.asp"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &"<br><< กลับไปหน้าหลัก"&"<br><br></font></font></font></a>"
Response.Write(str)
 </script>
</HTML>