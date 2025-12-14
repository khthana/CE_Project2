<HTML>

		<head>
		<meta http-equiv='content-type' content='text/html;charset=window-874'>
		</head>
		
	<script language="vbscript" runat="server"> 
	 DIM Template
 	 DIM Text_font
	 DIM Text_size
	 DIM Text_color
	 DIM Back_color
	
		Set  objConn=Server.CreateObject("ADODB.Connection")
	objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0 ; Data Source=" & Server.MapPath("/PROJECT_NEW.mdb")	
	
	Response.Write("<form  name=""Chose"" method=post action=AirReserve.asp>")	
	
									strHTML=strHTML&"<form  name=""Chose"" method=post action=Airline.asp>"
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
											strHTML=strHTML&"จองที่นั่งบนเครื่องบิน"&"</font>"
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
										end if
										
										if objRS2("Topic")=2 then
											strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--อาณาเขตของจังหวัด--</font></font></font></a>"
										end if
										
										if objRS2("Topic")=3 then
											strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "--ประเพณีวัฒนธรรม--</font></font></font></a>"		
										end if
										
										if objRS2("Topic")=4 then
											strHTML=strHTML & "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& " --สินค้า OTOP--</font></font></font></a>"	
										end if
										
										if objRS2("Topic")=5 then
											strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  --ข้อมูลการเดินทาง--</font></font></font></a>"	
										end if
										
										if objRS2("Topic")=6 then
											strHTML=strHTML & "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& " --ข้อมูลสถานที่ท่องเที่ยว--</font></font></font></a>"									
										end if
										
										if objRS2("Topic")=7 then
											strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  --ข้อมูลที่พักแรม--</font></font></font></a>"
										end if

										if objRS2("Topic")=8 then
											strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " --ข้อมูลสายการบิน--</font></font></font></a>"
										end if

										
									objRS2.MoveNext
									Loop
									
									strHTML=strHTML &"<br><br>"
									strHTML = "<CENTER>"&strHTML&"</CENTER>"
									Response.Write(strHTML)


objRS2.Close
Set objRS2=Nothing	
'***************************  Keep all in array **********************************
									strHTML3=strHTML3&" ชื่อสายการบิน :"&"&nbsp"
									strHTML3=strHTML3&"<Select Name = ""Combo1"" Size=""1""  onchange=Chose.submit()>"
strSql="Select * From  AIRLINE"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
									
									Do While Not objRS.Eof
										
										if Request("Combo1")= objRS("Air_name") then
										
											strHTML3=strHTML3&"<Option selected Value="&objRS("Air_name")&">"&objRS("Air_name")&"</Option>"
										else
										
											strHTML3=strHTML3&"<Option  Value="&objRS("Air_name")&">"&objRS("Air_name")&"</Option>"
										end if

									objRS.MoveNext
									Loop

									strHTML3=strHTML3&"</Select><br><br>"
objRS.Close
Set objRS=Nothing
'*****************
									strHTML3=strHTML3&" เลือกสถานีต้นทาง :"&"&nbsp"
									strHTML3=strHTML3&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"

									if (Request("Combo3")<>"ChiangMai" ) then
											if (Request("Combo2")= "ChiangMai" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"ChiangMai"&">"&"ChiangMai"&"</Option>"
											else
											strHTML3=strHTML3&"<Option  Value="&"ChiangMai"&">"&"ChiangMai"&"</Option>"
											end if
									end if	
										
									if (Request("Combo3")<> "KhonKan" ) then
											if (Request("Combo2")= "KhonKan" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"KhonKan"&">"&"KhonKan"&"</Option>"
											else
											strHTML3=strHTML3&"<Option  Value="&"KhonKan"&">"&"KhonKan"&"</Option>"
											end if
									end if	
											
									if (Request("Combo3")<> "HatYai") then								
											if (Request("Combo2")= "HatYai") then										
											strHTML3=strHTML3&"<Option selected Value="&"HatYai"&">"&"HatYai"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"HatYai"&">"&"HatYai"&"</Option>"
											end if
									end if										
										
									if (Request("Combo3")<> "Phuket") then
											if (Request("Combo2")= "Phuket") then										
											strHTML3=strHTML3&"<Option selected Value="&"Phuket"&">"&"Phuket"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"Phuket"&">"&"Phuket"&"</Option>"
											end if	
									end if
									
									if (Request("Combo3")<> "Ubonratchathanee" ) then										
											if (Request("Combo2")= "Ubonratchathanee" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"Ubonratchathanee"&">"&"Ubonratchathanee"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"Ubonratchathanee"&">"&"Ubonratchathanee"&"</Option>"
											end if	
									end if									
										
									if (Request("Combo3")<> "DonMuang" ) then
											if (Request("Combo2")= "DonMuang" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"DonMuang"&">"&"DonMuang"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"DonMuang"&">"&"DonMuang"&"</Option>"
											end if	
									end if								
									
									if (Request("Combo3")<> "NongNguHao" ) then		
											if (Request("Combo2")= "NongNguHao" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"NongNguHao"&">"&"NongNguHao"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"NongNguHao"&">"&"NongNguHao"&"</Option>"
											end if		
									end if							
									
									if (Request("Combo3")<> "Suwannaphum" ) then
											if (Request("Combo2")= "Suwannaphum" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"Suwannaphum"&">"&"Suwannaphum"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"Suwannaphum"&">"&"Suwannaphum"&"</Option>"
											end if	
									end if								
									
									if (Request("Combo3")<> "NongKai" ) then
											if (Request("Combo2")= "NongKai" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"NongKai"&">"&"NongKai"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"NongKai"&">"&"NongKai"&"</Option>"
											end if
									end if
									strHTML3=strHTML3&"</Select><br><br>"
'*****************
									strHTML3=strHTML3&" เลือกสถานีปลายทาง :"&"&nbsp"
									strHTML3=strHTML3&"<Select Name = ""Combo3"" Size=""1""  onchange=Chose.submit()>"

									
									if (Request("Combo2")<>"ChiangMai" ) then
												if (Request("Combo3")= "ChiangMai" ) then
												strHTML3=strHTML3&"<Option selected Value="&"ChiangMai"&">"&"ChiangMai"&"</Option>"
												else
												strHTML3=strHTML3&"<Option  Value="&"ChiangMai"&">"&"ChiangMai"&"</Option>"
												end if
									end if	
										
									if (Request("Combo2")<> "KhonKan" ) then
											if (Request("Combo3")= "KhonKan" ) then
											strHTML3=strHTML3&"<Option selected Value="&"KhonKan"&">"&"KhonKan"&"</Option>"
											else
											strHTML3=strHTML3&"<Option  Value="&"KhonKan"&">"&"KhonKan"&"</Option>"
											end if
									end if	
												
									if (Request("Combo2")<> "HatYai") then							
											if (Request("Combo3")= "HatYai") then										
											strHTML3=strHTML3&"<Option selected Value="&"HatYai"&">"&"HatYai"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"HatYai"&">"&"HatYai"&"</Option>"
											end if	
									end if									
										
									if (Request("Combo2")<> "Phuket" ) then		
											if (Request("Combo3")= "Phuket" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"Phuket"&">"&"Phuket"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"Phuket"&">"&"Phuket"&"</Option>"
											end if	
									end if
										
									if (Request("Combo2")<> "Ubonratchathanee" ) then									
											if (Request("Combo3")= "Ubonratchathanee" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"Ubonratchathanee"&">"&"Ubonratchathanee"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"Ubonratchathanee"&">"&"Ubonratchathanee"&"</Option>"
											end if	
									end if									
										
									if (Request("Combo2")<> "DonMuang" ) then		
											if (Request("Combo3")= "DonMuang" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"DonMuang"&">"&"DonMuang"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"DonMuang"&">"&"DonMuang"&"</Option>"
											end if			
									end if						
									
									if (Request("Combo2")<> "NongNguHao") then
											if (Request("Combo3")= "NongNguHao") then										
											strHTML3=strHTML3&"<Option selected Value="&"NongNguHao"&">"&"NongNguHao"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"NongNguHao"&">"&"NongNguHao"&"</Option>"
											end if		
									end if							
									
									if (Request("Combo2")<> "Suwannaphum" ) then
											if (Request("Combo3")= "Suwannaphum" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"Suwannaphum"&">"&"Suwannaphum"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"Suwannaphum"&">"&"Suwannaphum"&"</Option>"
											end if	
									end if								
									
									if (Request("Combo2")<> "NongKai" ) then
											if (Request("Combo3")= "NongKai" ) then										
											strHTML3=strHTML3&"<Option selected Value="&"NongKai"&">"&"NongKai"&"</Option>"
											else										
											strHTML3=strHTML3&"<Option  Value="&"NongKai"&">"&"NongKai"&"</Option>"
											end if
									end if
									strHTML3=strHTML3&"</Select>"
'*****************

'*****************	
n=""
strHTML3=strHTML3&"<br><br> วันเดินทางไป :"&"&nbsp"&"&nbsp"&"&nbsp"
strHTML3=strHTML3&"D/M/Y"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo4"" Size=""1""  onchange=Chose.submit()>"

For i=1 To 31
		n=i
		n=""&n&""
	if Request("Combo4")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	

Next
strHTML3=strHTML3&"</Select>"
'*********
n=""
strHTML3=strHTML3&"<Select Name = ""Combo5"" Size=""1""  onchange=Chose.submit()>"
'strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 12
		n=i
		n=""&n&""
	if Request("Combo5")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	
Next
strHTML3=strHTML3&"</Select>"
'*********
strHTML3=strHTML3&"<Select Name = ""Combo6"" Size=""1""  onchange=Chose.submit()>"
	if Request("Combo6")="2004" then
		strHTML3=strHTML3&"<Option Selected Value="&"2004"&">"&"2004"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"2004"&">"&"2004"&"</Option>"
	end if	
	
	if Request("Combo6")="2005" then
		strHTML3=strHTML3&"<Option Selected Value="&"2005"&">"&"2005"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"2005"&">"&"2005"&"</Option>"
	end if	
strHTML3=strHTML3&"</Select><br><br>"
'*********	
n=""
strHTML3=strHTML3&" วันเดินทางกลับ :"&"&nbsp"&"&nbsp"&"&nbsp"
strHTML3=strHTML3&"D/M/Y"
strHTML3=strHTML3&"<Select Name = ""Combo7"" Size=""1""  onchange=Chose.submit()>"

For i=1 To 31
		n=i
		n=""&n&""
if (Request("Combo12")="RoundTrip") then
		if Request("Combo7")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
		else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
		end if	
else
	strHTML3=strHTML3&"<Option Value="&"Blank"&">"&"Blank"&"</Option>"
	i=32
end if

Next
strHTML3=strHTML3&"</Select>"
'*********
n=""
strHTML3=strHTML3&"<Select Name = ""Combo8"" Size=""1""  onchange=Chose.submit()>"
'strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 12
		n=i
		n=""&n&""
if (Request("Combo12")="RoundTrip") then
	if Request("Combo8")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	
else
	strHTML3=strHTML3&"<Option Value="&"Blank"&">"&"Blank"&"</Option>"
	i=32
end if
Next
strHTML3=strHTML3&"</Select>"
'*********
strHTML3=strHTML3&"<Select Name = ""Combo9"" Size=""1""  onchange=Chose.submit()>"
if (Request("Combo12")="RoundTrip") then
		if Request("Combo9")="2004" then
		strHTML3=strHTML3&"<Option Selected Value="&"2004"&">"&"2004"&"</Option>"
		else								
		strHTML3=strHTML3&"<Option Value="&"2004"&">"&"2004"&"</Option>"
		end if	
	
		if Request("Combo9")="2005" then
		strHTML3=strHTML3&"<Option Selected Value="&"2005"&">"&"2005"&"</Option>"
		else								
		strHTML3=strHTML3&"<Option Value="&"2005"&">"&"2005"&"</Option>"
		end if	
else
	strHTML3=strHTML3&"<Option Value="&"Blank"&">"&"Blank"&"</Option>"
	i=32
end if
strHTML3=strHTML3&"</Select><br><br>"	
'*********	
strHTML3=strHTML3&" ชั้นที่นั่ง :"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo10"" Size=""1""  onchange=Chose.submit()>"
	if Request("Combo10")="FirstClass" then
		strHTML3=strHTML3&"<Option Selected Value="&"FirstClass"&">"&"FirstClass"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"FirstClass"&">"&"FirstClass"&"</Option>"
	end if	
	
	if Request("Combo10")="SecondClass" then
		strHTML3=strHTML3&"<Option Selected Value="&"SecondClass"&">"&"SecondClass"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"SecondClass"&">"&"SecondClass"&"</Option>"
	end if	
	
	if Request("Combo10")="ThirdClass" then
		strHTML3=strHTML3&"<Option Selected Value="&"ThirdClass"&">"&"ThirdClass"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"ThirdClass"&">"&"ThirdClass"&"</Option>"
	end if
strHTML3=strHTML3&"</Select><br><br>"	
'*********
n=""
strHTML3=strHTML3&"จำนวนที่ต้องการจอง :"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo11"" Size=""1""  onchange=Chose.submit()>"
strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 5
		n=i
		n=""&n&""
	if Request("Combo11")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	
	
Next
strHTML3=strHTML3&"</Select>"
	
'*********	
strHTML3=strHTML3&"<br><br> ลักษณะการเดินทาง :"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo12"" Size=""1""  onchange=Chose.submit()>"
'strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"

	if Request("Combo12")="OneWay" then
		strHTML3=strHTML3&"<Option Selected Value="&"OneWay"&">"&"OneWay"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"OneWay"&">"&"OneWay"&"</Option>"
	end if	
	
	if Request("Combo12")="RoundTrip" then
		strHTML3=strHTML3&"<Option Selected Value="&"RoundTrip"&">"&"RoundTrip"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"RoundTrip"&">"&"RoundTrip"&"</Option>"
	end if	
	
	if Request("Combo12")="Return" then
		strHTML3=strHTML3&"<Option Selected Value="&"Return"&">"&"Return"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"Return"&">"&"Return"&"</Option>"
	end if
	
strHTML3=strHTML3&"</Select>"
'*********
	Response.Write("<CENTER>"&strHTML3&"</CENTER>")
	
	str=str& "Airline=" &Request("Combo1")
	'str=str& "Airline=" &"นกแอร์"
	str=str& "&Flightorigin=" &Request("Combo2")
	'str=str& "&Flightorigin=" &"start"
	str=str& "&Flightdestination=" &Request("Combo3")
	'str=str& "&Flightdestination=" &"End"
	str=str& "&Din="&Request("Combo4")
	str=str& "&Min="&Request("Combo5")
	str=str& "&Yin="&Request("Combo6")
	'str=str& "&Departure=" &Request("Combo4")
	'Request("Combo5")
	'Request("Combo6")
	str=str& "&Flightinfo=" &Request("Combo12")
	'str=str& "&Return=" &Request("Combo7")
	str=str& "&Dout="&Request("Combo7")
	str=str& "&Mout="&Request("Combo8")
	str=str& "&Yout="&Request("Combo9")
	'Request("Combo8")
	'Request("Combo9")
	str=str& "&Class=" &Request("Combo10")
	str=str& "&Quantity=" &Request("Combo11")


	Response.Write( "<CENTER><br><br><a href=" & "AirReserve2.asp?"&str& ">"&"ยืนยันการจอง" & " >></a><br></CENTER>")	
	Set objConn=Nothing
	Response.Write"</form>"

	    </script>
</HTML>