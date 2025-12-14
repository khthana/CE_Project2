<HTML>

		<head>
		<meta http-equiv='content-type' content='text/html;charset=window-874'>
		</head>
		
	<script language="vbscript" runat="server"> 

DIM strHTML
DIM str
DIM LinkPlate2
DIM Col2
DIM Col3

'DIM TxtClr
'DIM BgClr(2)
DIM Template
DIM Text_font
DIM Text_size
DIM Text_color
DIM Back_color
DIM Pic(2)

DIM Pol_name(1000)
DIM Pol_addr(1000)
DIM Pol_tel(1000)
DIM police_road(1000)
DIM police_district(1000)
DIM PolMax

DIM Hos_name(1000)
DIM Hos_addr(1000)
DIM Hos_tel(1000)
DIM hospital_road(1000)
DIM hospital_district(1000)
DIM HosMax

DIM Fir_name(1000)
DIM Fir_addr(1000)
DIM Fir_tel(1000)
DIM fire_road(1000)
DIM fire_district(1000)
DIM FirMAx
DIM count


	Set  objConn=Server.CreateObject("ADODB.Connection")
	objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("/PROJECT_NEW.mdb")	
	
		'***************  To Find Text Color and Background Color  ****************************
	strSql7="Select * From TEMPLATE"
	Set  objRS7=Server.CreateObject("ADODB.Recordset")
	objRS7.Open strSql7,ObjConn
									Do While Not objRS7.Eof
											Template=objRS7("Template")
											Text_font=objRS7("Text_font")
											Text_size=objRS7("Text_size")
											Text_size2=Text_size/3
											Text_size=Text_size/6
											Text_color=objRS7("Text_color")
											Back_color=objRS7("Back_color")
									objRS7.MoveNext
									Loop
	objRS7.Close
	Set objRS7=Nothing

	Response.Write("<body bgcolor ="&Back_color&">")

	strSql6="Select * From MAIN"
	Set  objRS6=Server.CreateObject("ADODB.Recordset")
	objRS6.Open strSql6,ObjConn
									
									Do While Not objRS6.Eof

										if objRS6("Main_part")="1" then
										
											strHTML=strHTML&"<RIGHT><table border=2>"
											strHTML=strHTML&"<td Width=100% align=LEFT>"
											strHTML=strHTML&"<IMG src="&objRS6("Main_pic")&" width=500 height=200></IMG>"
											strHTML=strHTML&"</td></RIGHT>"
											strHTML=strHTML&"</table>"
											
													if template=2 then
														str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
													str=str&"<tr>"
													str=str&"<td width=""30%"">"
													str=str&strHTML
													str=str&"</td>"
													end if

										end if 'picture in Header
										
										if objRS6("Main_part")="2" then
										
											strHTML=strHTML&"<br><br>"&"<CENTER><table border=5>"
											strHTML=strHTML&"<tr bgcolor="&Back_color&">"
											strHTML=strHTML&"<td Width=70% align=CENTER>"
											strHTML=strHTML&"<font size="&Text_size2&" font color="&Text_color&"  face="&Text_font&">"
											strHTML=strHTML&objRS6("Main_msg")&"</font>"
											strHTML=strHTML&"</td></tr>"
											strHTML=strHTML&"</table></CENTER>"
											
											if template=2 then
											
               								str=str&"<td width=""70%"">"
               								
											str=str&"<br><br>"&"<CENTER><table border=5>"
											str=str&"<tr bgcolor="&Back_color&">"
											str=str&"<td Width=70% align=CENTER>"
											str=str&"<font size="&Text_size2&"font color="&Text_color&"  face="&Text_font&">"
											str=str&objRS6("Main_msg")&"</font>"
											str=str&"</td></tr>"
											str=str&"</table></CENTER>"
											
               								str=str&"</td>"
              									str=str&"</tr>"
            									str=str&"</table>"
            									Response.Write(str)
            									str=""
            									
											end if
										
										end if 'Topic name
											
											

										if objRS6("Main_part")="3" then
											'strHTML=strHTML&"	<table border=""1"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
											'strHTML=strHTML&"<tr>"
											'strHTML=strHTML&"<td width=""15%"">"
											'strHTML=strHTML&"</td>"
											'strHTML=strHTML&"<td width=""70%"">"
											'strHTML=strHTML&"<br><br><font size=+2"&"font color="&Text_color&"  face="&Text_font&">"
											'strHTML=strHTML&objRS6("Main_msg")&"</font><br><br>"
											'strHTML=strHTML&"</td>"
											'strHTML=strHTML&"<td width=""15%"">"
											'strHTML=strHTML&"</td>"
											
											
											strHTML=strHTML&"<br><br><font size="&Text_size&"font color="&Text_color&"  face="&Text_font&">"
											strHTML=strHTML&objRS6("Main_msg")&"</font><br><br>"	
											
											if Template=2 then
											
											str=str&"	<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
             									str=str&"<tr>"
               								str=str&"<td width=""15%"">"
               								'str=str&"<br><br><font size=+2"&"font color="&Text_color&"  face="&Text_font&">"
											'str=str&objRS6("Main_msg")&"</font><br><br>"
											str=str&"</td>"
											str=str&"<td width=""70%"">"
											str=str&"<br><br><font size="&Text_size&"font color="&Text_color&"  face="&Text_font&">"
											str=str&objRS6("Main_msg")&"</font><br><br>"
               								str=str&"</td>"
               								str=str&"<td width=""15%"">"
               								str=str&"</td>"
            	 								str=str&"</tr>"
           									str=str&"</table>"
           									Response.Write(str)
            									str=""

											end if	
																
										end if 'Information
										
										if objRS6("Main_part")="4" then
											pic(0)="<IMG src="&objRS6("Main_pic")&" width=200 height=200></IMG>"
										end if 'logo
										
										if objRS6("Main_part")="5" then
											pic(1)="<IMG src="&objRS6("Main_pic")&" width=200 height=200></IMG>"
										end if 'picture inside
										
										objRS6.MoveNext
									Loop	
									
									if Template=1 then
										Response.Write(strHTML)
									end if
									strHTML=""
										
	objRS6.Close
	Set objRS6=Nothing				

	'******************************* Create Internal Link  *****************************************************************
strSql8="Select * From FORM"
Set  objRS8=Server.CreateObject("ADODB.Recordset")
objRS8.Open strSql8,ObjConn
									
									Do While Not objRS8.Eof
	
										
										if objRS8("Topic")=1 then
												strHTML=strHTML & "<a href=" & "test12.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลทั่วไป--</font></font></font></a>"
											
											if Template=2 then
											strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS8("Topic")=2 then
												strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--อาณาเขตของจังหวัด--</font></font></font></a>"
											
											if Template=2 then
											strHTML=strHTML&"<br>"
											end if	
										end if
										
										if objRS8("Topic")=3 then
												strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ประเพณีวัฒนธรรม--</font></font></font></a>"

											if Template=2 then
											strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS8("Topic")=4 then
												strHTML=strHTML & "<a href=" & "OTOP.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--สินค้า OTOP--</font></font></font></a>"
						
											if Template=2 then
											strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS8("Topic")=5 then
												strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลการเดินทาง--</font></font></font></a>"
										
											if Template=2 then
											strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS8("Topic")=6 then
												strHTML=strHTML & "<a href=" & "Travel.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลสถานที่ท่องเที่ยว--</font></font></font></a>"
										
											if Template=2 then
											strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS8("Topic")=7 then
												strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลที่พักแรม--</font></font></font></a>"
										
											if Template=2 then
											strHTML=strHTML&"<br>"
											end if
										end if

										if objRS8("Topic")=8 then
												strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลสายการบิน--</font></font></font></a>"
										
											if Template=2 then
											strHTML=strHTML&"<br>"
											end if
										end if

										
									objRS8.MoveNext
									Loop
									'strHTML="<CENTER>"&strHTML &"</CENTER>"
										if Template=2 then
											LinkPlate2=strHTML
										end if
										
										if Template=1 then
											'Response.Write("You can come in")
											strHTML="<CENTER>"&strHTML &"</CENTER>"
											Response.Write(strHTML )
										end if
										strHTML=""
objRS8.Close
Set objRS8=Nothing		

'******************************************************************************************************	
'******************************  Select Place Type  ********************************************************
	
									Response.Write "<form  name=""ChosePlace"" method=post action=test12.asp>"
									strHTML=strHTML&"<br><br><font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"
									strHTML=strHTML&"ค้นหาข้อมูลทั่วไป <br><br></font>"

										strHTML=strHTML&"<font size="&Text_size&"font color="&Text_color&" face="& Text_font&">"&"ค้นหาจากสถานที่  "&"<Select Name = ""Combo"" Size=""1""  onchange=ChosePlace.submit()>"
									
	
									if Request("Combo")="None" then 
									strHTML=strHTML&"<Option selected Value =""None"" >"&"None"&"</Option>"
									
									else 
									strHTML=strHTML&"<Option Value=""None"">"&"None"&"</Option>"
									
									end if
									
									if Request("Combo")="ข้อมูลสถานีตำรวจ" then 
									strHTML=strHTML&"<Option selected Value =""ข้อมูลสถานีตำรวจ"" >"&"ข้อมูลสถานีตำรวจ"&"</Option>"
									
									else 
									strHTML=strHTML&"<Option Value=""ข้อมูลสถานีตำรวจ"">"&"ข้อมูลสถานีตำรวจ"&"</Option>"
									
									end if
									
									if Request("Combo")="ข้อมูลโรงพยาบาล" then 
									strHTML=strHTML&"<Option selected Value=""ข้อมูลโรงพยาบาล"">"&"ข้อมูลโรงพยาบาล"&"</Option>"
									else 
									strHTML=strHTML&"<Option Value=""ข้อมูลโรงพยาบาล"">"&"ข้อมูลโรงพยาบาล"&"</Option>"
									
									end if		
																
									if Request("Combo")="ข้อมูลสถานีดับเพลิง" then 
									strHTML=strHTML&"<Option selected Value=""ข้อมูลสถานีดับเพลิง"">"&"ข้อมูลสถานีดับเพลิง"&"</Option>"
									
									else 
									strHTML=strHTML&"<Option Value=""ข้อมูลสถานีดับเพลิง"">"&"ข้อมูลสถานีดับเพลิง"&"</Option>"	
									
									end if							
									strHTML=strHTML&"</Select><br>"
													
	'******************************************  Create ComboBox Road and District  *******************************************************
	strSql="Select * From ROAD"
	Set  objRS=Server.CreateObject("ADODB.Recordset")
	objRS.Open strSql,ObjConn

										strHTML=strHTML&"<font size="&Text_size&"font color="&Text_color&" face="& Text_font&">"&"ค้นหาจากชื่อถนน "&"<Select Name = ""Combo2"" Size=""1""  onchange=ChosePlace.submit()>"

									strHTML=strHTML&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS.Eof
										if Request("Combo2")= objRS("Roa_name")then
										strHTML=strHTML&"<Option selected Value="&objRS("Roa_name")&">"&objRS("Roa_name")&"</Option>"
										else
										strHTML=strHTML&"<Option  Value="&objRS("Roa_name")&">"&objRS("Roa_name")&"</Option>"
										end if
										
										objRS.MoveNext
									Loop
    									strHTML=strHTML&"</Select><br>"
								     
objRS.Close
Set objRS=Nothing 


	strSql2="Select * From DISTRICT"
	Set  objRS2=Server.CreateObject("ADODB.Recordset")
	objRS2.Open strSql2,ObjConn

										strHTML=strHTML&"<font size="&Text_size&"font color="&Text_color&" face="& Text_font&">"&"ค้นหาจากชื่ออำเภอ "&"<Select Name = ""Combo3"" Size=""1""  onchange=ChosePlace.submit()>"

									strHTML=strHTML&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS2.Eof
										if Request("Combo3")= objRS2("Dis_name")then
										strHTML=strHTML&"<Option selected Value="&objRS2("Dis_name")&">"&objRS2("Dis_name")&"</Option>"

										else
										strHTML=strHTML&"<Option  Value="&objRS2("Dis_name")&">"&objRS2("Dis_name")&"</Option>"

										end if
										
										objRS2.MoveNext
									Loop
									strHTML=strHTML&"</Select><br><br>"	
										
										if Template=2 then
											Col2=strHTML&"<br>"
											Col3=Pic(0)&"<br><br>"&Pic(1)
										end if
																	
									strHTML=strHTML&"<br><br>"&Pic(0)&"<br><br>"&Pic(1)
			
	objRS2.Close
	Set objRS2=Nothing
	
	'******************	
	DIM strHTML2
	
	strHTML2=strHTML2&"<div align=""left"">"
   		strHTML2=strHTML2&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"" dir=""ltr"">"
     strHTML2=strHTML2&"<tr>"
     strHTML2=strHTML2&"<td width=""50%"">"

     '******************************* Keep All Place in Array ***************************************************************
count=0

strSql3="Select * From POLICE"
Set  objRS3=Server.CreateObject("ADODB.Recordset")
objRS3.Open strSql3,ObjConn		

strSql4="Select * From HOSPITAL"
Set  objRS4=Server.CreateObject("ADODB.Recordset")
objRS4.Open strSql4,ObjConn	

strSql5="Select * From FIRE"
Set  objRS5=Server.CreateObject("ADODB.Recordset")
objRS5.Open strSql5,ObjConn	
										Do While Not objRS3.Eof
											Pol_name(count)=objRS3("Pol_name")
											Pol_addr(count)=objRS3("Pol_addr")
											Pol_tel(count)=objRS3("Pol_tel")
											police_road(count)=objRS3("Roa_name")
											police_district(count)=objRS3("Dis_name")
											count=count+1
										objRS3.MoveNext
										Loop
										PolMax=count
										count=0
										
										Do While Not objRS4.Eof
											Hos_name(count)=objRS4("Hos_name")
											Hos_addr(count)=objRS4("Hos_addr")
											Hos_tel(count)=objRS4("Hos_tel")
											hospital_road(count)=objRS4("Roa_name")
											hospital_district(count)=objRS4("Dis_name")
											count=count+1
										objRS4.MoveNext
										Loop
										HosMax=count
										count=0
										
										Do While Not objRS5.Eof
											Fir_name(count)=objRS5("Fir_name")
											Fir_addr(count)=objRS5("Fir_addr")
											Fir_tel(count)=objRS5("Fir_tel")
											fire_road(count)=objRS5("Roa_name")
											fire_district(count)=objRS5("Dis_name")
											count=count+1
										objRS5.MoveNext
										Loop
										FirMax=count
										count=0
		
objRS3.Close
Set objRS3=Nothing

objRS4.Close
Set objRS4=Nothing

objRS5.Close
Set objRS5=Nothing

Set objConn=Nothing	

DIM i
DIM strHTML3					
'*************************************  Check Select with Array ********************************************
										'strHTML3=strHTML3&"<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&
										'strHTML3=strHTML3&"ที่อยู่ : "&	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&	
										'strHTML3=strHTML3&"ถนน : "&
										'strHTML3=strHTML3&"อำเภอ : "&&"<br>"
'DIM set1
'set1=0				
								
								Select case Request("Combo")
								case"None"
								
										if Request("Combo2")="None" and Request("Combo3")="None" then
											strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
											For i=0 To PolMax-1
										'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
										'strHTML3=strHTML3&"<br>ชื่อ  : "&Pol_name(i)&"<br>"
										'strHTML3=strHTML3&Pol_addr(i)&"  "	
										'strHTML3=strHTML3&Pol_tel(i)&"  "	
										'strHTML3=strHTML3&police_road(i)&"  "
										'strHTML3=strHTML3&police_district(i)&"  "
										'strHTML3=strHTML3&"<hr>"
											Pol(i)
											Next																	
										
											strHTML3=strHTML3&"<br><br>ข้อมูลโรงพยาบาล"&"<br>"	
											For i=0 To HosMax-1
										'	strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
										'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
										'strHTML3=strHTML3&"<br>ชื่อ  : "&Hos_name(i)&"<br>"
										'strHTML3=strHTML3&Hos_addr(i)&"  "	
										'strHTML3=strHTML3&Hos_tel(i)&"  "	
										'strHTML3=strHTML3&hospital_road(i)&"  "
										'strHTML3=strHTML3&hospital_district(i)&"  "
										'strHTML3=strHTML3&"<hr>"	
											Hos(i)
											Next
											
											strHTML3=strHTML3&"<br><br>ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
											For i=0 To FirMax-1
											'strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
										'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
										'strHTML3=strHTML3&Fir_addr(i)&"  "	
										'strHTML3=strHTML3&Fir_tel(i)&"  "	
										'strHTML3=strHTML3&fire_road(i)&"  "
										'strHTML3=strHTML3&fire_district(i)&"  "	
										'strHTML3=strHTML3&"<hr>"
											Fir(i)
											Next
										 end if
						
										if Request("Combo2")="None" and Request("Combo3")<>"None" then
											For i=0 To PolMax-1
												if Request("Combo3")=police_district(i) then
											'	strHTML3=strHTML3&Pol_name(i)&" "&Pol_addr(i)&" "&Pol_tel(i)&" "&police_road(i)&" "&police_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&police_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&police_district(i)&"<br>"
												Pol(i)
												end if
											Next
											
											For i=0 To HosMax-1
												if Request("Combo3")=hospital_district(i) then
												'strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&hospital_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&hospital_district(i)&"<br>"
												Hos(i)	
												end if
											Next
											
											For i=0 To FirMax-1
												if Request("Combo3")=fire_district(i) then
												'strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&fire_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&fire_district(i)&"<br>"	
												Fir(i)		
												end if
											Next
										end if
										
										if Request("Combo2")<>"None" and Request("Combo3")="None" then
											For i=0 To PolMax-1
												if Request("Combo2")=police_road(i) then
											'	strHTML3=strHTML3&Pol_name(i)&" "&Pol_addr(i)&" "&Pol_tel(i)&" "&police_road(i)&" "&police_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&police_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&police_district(i)&"<br>"	
												Pol(i)
												end if
											Next	
											
											For i=0 To HosMax-1
												if request("Combo2")=hospital_road(i) then
												'strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&hospital_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&hospital_district(i)&"<br>"
												Hos(i)
												end if
											Next
											
											For i=0 To FirMax-1
												if request("Combo2")=fire_road(i) then
											'	strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&fire_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&fire_district(i)&"<br>"	
												Fir(i)	
												end if
											Next							
		
										end if
										
										if Request("Combo2")<>"None" and Request("Combo3")<>"None" then
											For i=0 To PolMax-1
												if Request("Combo2")=police_road(i) and Request("Combo3")=police_district(i) then
												'strHTML3=strHTML3&Pol_name(i)&" "&Pol_addr(i)&" "&Pol_tel(i)&" "&police_road(i)&" "&police_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&police_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&police_district(i)&"<br>"		
												Pol(i)
												end if
											Next
											
											For i=0 To HosMax-1
												if Request("Combo2")=hospital_road(i)and Request("Combo3")=hospital_district(i) then
											'	strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&hospital_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&hospital_district(i)&"<br>"	
												Hos(i)
												end if
											Next
											
											For i=0 To FirMax-1
												if Request("Combo2")=fire_road(i) and Request("Combo3")=fire_district(i) then
											'	strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
											'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
											'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
											'strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)&"<br>"	
											'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)&"<br>"	
											'strHTML3=strHTML3&"ถนน : "&fire_road(i)&"<br>"
											'strHTML3=strHTML3&"อำเภอ : "&fire_district(i)&"<br>"	
												Fir(i)	
												end if
											Next
											
										end if
										
								
								case"ข้อมูลสถานีตำรวจ"
									For i=0 To PolMax-1
									
										if Request("Combo2")="None" and Request("Combo3")="None" then
											'strHTML3=strHTML3&Pol_name(i)&" "&Pol_addr(i)&" "&Pol_tel(i)&" "&police_road(i)&" "&police_district(i)&"<br>"
										'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
										'strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"<br>"	
										'strHTML3=strHTML3&"ถนน : "&police_road(i)&"<br>"
										'strHTML3=strHTML3&"อำเภอ : "&police_district(i)&"<br>"
											Pol(i)
										end if
											
										if Request("Combo2")="None" and Request("Combo3")<>"None" then
											if Request("Combo3")= police_district(i) then 
											'strHTML3=strHTML3&Pol_name(i)&" "&Pol_addr(i)&" "&Pol_tel(i)&" "&police_road(i)&" "&police_district(i)&"<br>"
										'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
										'strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"<br>"	
										'strHTML3=strHTML3&"ถนน : "&police_road(i)&"<br>"
										'strHTML3=strHTML3&"อำเภอ : "&police_district(i)&"<br>"	
											Pol(i)
											end if
										end if
									
									if Request("Combo2")<>"None" and Request("Combo3")="None" then
											if Request("Combo2")= police_road(i) then 
											'strHTML3=strHTML3&Pol_name(i)&" "&Pol_addr(i)&" "&Pol_tel(i)&" "&police_road(i)&" "&police_district(i)&"<br>"
										'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
										'strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"<br>"	
										'strHTML3=strHTML3&"ถนน : "&police_road(i)&"<br>"
										'strHTML3=strHTML3&"อำเภอ : "&police_district(i)&"<br>"	
											Pol(i)
											end if
									end if
									
									if Request("Combo2")<>"None" and Request("Combo3")<>"None" then
											if Request("Combo2")= police_road(i) and Request("Combo3")= police_district(i) then 
											'strHTML3=strHTML3&Pol_name(i)&" "&Pol_addr(i)&" "&Pol_tel(i)&" "&police_road(i)&" "&police_district(i)&"<br>"
										'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
										'strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"<br>"	
										'strHTML3=strHTML3&"ถนน : "&police_road(i)&"<br>"
										'strHTML3=strHTML3&"อำเภอ : "&police_district(i)&"<br>"	
										Pol(i)
											end if
									end if
											Next
									
								
								case"ข้อมูลโรงพยาบาล"
									For i=0 To HosMax-1

									if Request("Combo2")="None" and Request("Combo3")="None" then
									'strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
								'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
								'strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
								'strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
								'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"<br>"	
								'strHTML3=strHTML3&"ถนน : "&hospital_road(i)&"<br>"
								'strHTML3=strHTML3&"อำเภอ : "&hospital_district(i)&"<br>"	
								Hos(i)
									end if
									
									if Request("Combo2")="None" and Request("Combo3")<>"None" then
									    if Request("Combo3")= hospital_district(i) then 
									    'strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
									'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
									'strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
									'strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
									'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"<br>"	
									'strHTML3=strHTML3&"ถนน : "&hospital_road(i)&"<br>"
									'strHTML3=strHTML3&"อำเภอ : "&hospital_district(i)&"<br>"  
									Hos(i)  
									    end if
									end if
									
									if Request("Combo2")<>"None" and Request("Combo3")="None" then
									    if Request("Combo2")= hospital_road(i) then 
									    'strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
									'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
									'strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
									'strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
									'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"<br>"	
									'strHTML3=strHTML3&"ถนน : "&hospital_road(i)&"<br>"
									'strHTML3=strHTML3&"อำเภอ : "&hospital_district(i)&"<br>"  
									Hos(i)  
									    end if
									end if
									
									if Request("Combo2")<>"None" and Request("Combo3")<>"None" then
									    if Request("Combo2")=hospital_road(i) and Request("Combo3")=hospital_district(i) then 
									    'strHTML3=strHTML3&Hos_name(i)&" "&Hos_addr(i)&" "&Hos_tel(i)&" "&hospital_road(i)&" "&hospital_district(i)&"<br>"
									'strHTML3=strHTML3&"ข้อมูลโรงพยาบาล"&"<br>"
									'strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
									'strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
									'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"<br>"	
									'strHTML3=strHTML3&"ถนน : "&hospital_road(i)&"<br>"
									'strHTML3=strHTML3&"อำเภอ : "&hospital_district(i)&"<br>"    
									Hos(i)
									    end if
									end if
										Next
									
								case"ข้อมูลสถานีดับเพลิง"	
									For i=0 To FirMax-1
									
									if Request("Combo2")="None" and Request("Combo3")="None" then
									'strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
									'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
									'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
									'strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)&"<br>"	
									'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)&"<br>"	
									'strHTML3=strHTML3&"ถนน : "&fire_road(i)&"<br>"
									'strHTML3=strHTML3&"อำเภอ : "&fire_district(i)&"<br>"	
									Fir(i)
									end if
									
									if Request("Combo2")="None" and Request("Combo3")<>"None" then
									    if Request("Combo3")=fire_district(i) then 
									    'strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
									    'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
										'strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)&"<br>"	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)&"<br>"	
										'strHTML3=strHTML3&"ถนน : "&fire_road(i)&"<br>"
										'strHTML3=strHTML3&"อำเภอ : "&fire_district(i)&"<br>"	
										Fir(i)
									    end if
									end if
									
									if Request("Combo2")<>"None" and Request("Combo3")="None" then
									    if Request("Combo2")= fire_road(i) then 
									    'strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
									    	'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
									    	'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
										'strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)&"<br>"	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)&"<br>"	
										'strHTML3=strHTML3&"ถนน : "&fire_road(i)
										'strHTML3=strHTML3&"อำเภอ : "&fire_district(i)&"<br>"	
										Fir(i)
									    end if
									end if
									
									if Request("Combo2")<>"None" and Request("Combo3")<>"None" then
									    if Request("Combo2")=fire_road(i) and Request("Combo3")=fire_district(i) then 
									    'strHTML3=strHTML3&Fir_name(i)&" "&Fir_addr(i)&" "&Fir_tel(i)&" "&fire_road(i)&" "&fire_district(i)&"<br>"
									    	'strHTML3=strHTML3&"ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
										'strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)
										'strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)	
										'strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)	
										'strHTML3=strHTML3&"ถนน : "&fire_road(i)
										'strHTML3=strHTML3&"อำเภอ : "&fire_district(i)&"<br>"	
										Fir(i)
									    end if
									end if
										Next
									
								End Select
'************ Function Concatination ************
Function Pol(i)
				'set1=1
				strHTML3=strHTML3&"ชื่อ  : "&Pol_name(i)&"<br>"
				strHTML3=strHTML3&"ที่อยู่ : "&Pol_addr(i)&"<br>"	
				strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Pol_tel(i)&"  "	
				'strHTML3=strHTML3&police_road(i)&"  "
				'strHTML3=strHTML3&police_district(i)&"  "
				strHTML3=strHTML3&"<hr>"
End Function

Function Hos(i)
				'set1=1
				strHTML3=strHTML3&"ชื่อ  : "&Hos_name(i)&"<br>"
				strHTML3=strHTML3&"ที่อยู่ : "&Hos_addr(i)&"<br>"	
				strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Hos_tel(i)&"  "	
				'strHTML3=strHTML3&hospital_road(i)&"  "
				'strHTML3=strHTML3&hospital_district(i)&"  "
				strHTML3=strHTML3&"<hr>"	
End Function

Function Fir(i)
				'set1=1
				strHTML3=strHTML3&"ชื่อ  : "&Fir_name(i)&"<br>"
				strHTML3=strHTML3&"ที่อยู่ : "&Fir_addr(i)&"<br>"	
				strHTML3=strHTML3&"เบอร์โทรศัพท์ : "&Fir_tel(i)&"  "	
				'strHTML3=strHTML3&fire_road(i)&"  "
				'strHTML3=strHTML3&fire_district(i)&"  "	
				strHTML3=strHTML3&"<hr>"
End Function
'*******************************************
if (Request("Combo")="" and Request("Combo2")="" and Request("Combo3")="") then
strHTML3=strHTML3&"ข้อมูลสถานีตำรวจ<br>"
For i=0 To PolMax-1
Pol(i)
Next

strHTML3=strHTML3&"<br><br>ข้อมูลโรงพยาบาล"&"<br>"	
For i=0 To HosMax-1
Hos(i)
Next

strHTML3=strHTML3&"<br><br>ข้อมูลสถานีตำรวจดับเพลิง"&"<br>"
For i=0 To FirMax-1
Fir(i)
Next

end if
								strHTML3 = "<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&StrHTML3&"</font>"
							
							if Template=2 then
								Col2=Col2&strHTML3
							end if

     strHTML2=strHTML2&strHTML3
 
     strHTML2=strHTML2&"</td>"
     
     '*********************
     strHTML2=strHTML2&"<td width=""50%"">"
     strHTML2=strHTML2&"<CENTER>"&strHTML&"</CENTER>"
     strHTML2=strHTML2&"</td>"
     strHTML2=strHTML2&"</tr>"
   	 strHTML2=strHTML2&"</table>"
 	 strHTML2=strHTML2&"</div>"
	'******************		
									if Template=1 then				
									Response.Write(strHTML2)
									strHTML=""
									strHTML2=""	
									end if
									
									if Template=2 then
											str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
            								str=str&"<tr>"
              									str=str&"<td width=""33%"">"
              									str=str&LinkPlate2		
              									str=str&"</td>"
              									str=str&"<td width=""33%"">"
              									str=str&Col2		
              									str=str&"</td>"
              									str=str&"<td width=""34%"">"
              									str=str&"<CENTER>"&Col3&"</CENTER>"			
              									str=str&"</td>"
            								str=str&"</tr>"
          								str=str&"</table>"
          								Response.Write(str)
									end if																	
	Response.Write"</form>"

	                                </script>
</HTML>