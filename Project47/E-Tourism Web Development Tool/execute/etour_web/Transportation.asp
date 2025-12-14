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
 
 DIM Sta_order(1000)
 DIM Sta_type(1000)
 DIM Sta_pic(1000)
 DIM Sta_num1		'Station_type
 
 DIM Sta_name(1000)
 DIM Sta_order2(1000)
 DIM Sta_addr(1000)
 DIM Sta_info(1000)
 DIM Sta_num2	'Station
 
 DIM count
 
									strHTML=strHTML&"<form  name=""Chose"" method=post action=Transportation.asp>"
	'******************************* Create Topic  *************************************************************************	
	 Set  objConn=Server.CreateObject("ADODB.Connection")
	 objConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("/PROJECT_NEW.mdb")
			
	'***************  To Find Text Color and Background Color  ****************************
	strSql="Select * From Template"
	Set  objRS=Server.CreateObject("ADODB.Recordset")
	objRS.Open strSql,ObjConn
									
										Do While Not objRS.Eof
											Template=objRS("Template")
											Text_font=objRS("Text_font")
											Text_size=objRS("Text_size")
											Text_size3=Text_size/4
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
											strHTML=strHTML&"ข้อมูลการเดินทาง"&"</font>"
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

											strHTML=strHTML & "<a href=" & "test12.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-ข้อมูลทั่วไป -</font></font></font></a>"	
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
																		
										end if
										if objRS2("Topic")=2 then	

											strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-อาณาเขตของจังหวัด-</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=3 then

											strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-ประเพณีวัฒนธรรม- </font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=4 then

											strHTML=strHTML & "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "-สินค้า OTOP-</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=5 then

											strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-ข้อมูลการเดินทาง-</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=6 then

											strHTML=strHTML & "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& " -ข้อมูลสถานที่ท่องเที่ยว-</font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										if objRS2("Topic")=7 then

											strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " -ข้อมูลที่พักแรม- </font></font></font></a>"
											if(Template=2) then
												strHTML=strHTMl&"<br>"
											end if
										end if
										
										if objRS2("Topic")=8 then

											strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " -ข้อมูลสายการบิน- </font></font></font></a>"
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
'*******************************  Put all of record into Array ******************************************************
strSql3="Select * From STATION_TYPE"
Set  objRS3=Server.CreateObject("ADODB.Recordset")
objRS3.Open strSql3,ObjConn

		count=0
												Do While Not objRS3.Eof
													Sta_order(count)= objRS3("Sta_order")
													Sta_type(count)= objRS3("Sta_type")
													Sta_pic(count)= objRS3("Sta_pic")
											
													count=count+1
													objRS3.MoveNext
												Loop
objRS3.Close
Set objRS3=Nothing

Sta_num1=count
count=0

'************************
strSql4="Select * From STATION"
Set  objRS4=Server.CreateObject("ADODB.Recordset")
objRS4.Open strSql4,ObjConn
												Do While Not objRS4.Eof
													
													Sta_name(count)= objRS4("Sta_name")
													Sta_order2(count)= objRS4("Sta_order")
													Sta_addr(count)= objRS4("Sta_addr")
													Sta_info(count)= objRS4("Sta_info")
		
													count=count+1
													objRS4.MoveNext
												Loop


objRS4.Close
Set objRS4=Nothing

Sta_num2=count
count=0
'***********************************  Show All of Info *************************************************************
DIM i
DIM j
	strHTML=strHTML&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
	strHTML=strHTML&"<tr>"						

												For i=0 To Sta_num1-1
													strHTML=strHTML&"<td width=""50%"">"
													strHTML=strHTML&"<IMG src="&Sta_pic(i)&" width=200 height=200></IMG><br><br>"
													if (Template=2) then
													Row2=Row2&"<br><br><IMG src="&Sta_pic(i)&" width=200 height=200></IMG><br><br>"
													end if
													strHTML=strHTML&"</td>"
													strHTML=strHTML&"<td width=""50%"">"
														strHTML=strHTML&"<font size="&Text_size2&" font color="&Text_color&" face="&Text_font&">"&Sta_type(i)&"<br>"&"</font>"
														
														if (Template=2) then
														Row2=Row2&"<font size="&Text_size2&" font color="&Text_color&" face="&Text_font&">"&Sta_type(i)&"<br>"&"</font>"
														end if
													
													For j=0 To Sta_num2-1 
														if Sta_order(i)=Sta_order2(j)then
															strHTML=strHTML&"<font size="&Text_size3&" font color="&Text_color&" face="&Text_font&">"
															strHTML=strHTML&Sta_name(j)&"<br></font>"
															strHTML=strHTML&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"
															strHTML=strHTML&Sta_addr(j)&"<br>"
															strHTML=strHTML&Sta_info(j)&"<br><br>"&"</font>"				
															if (Template=2) then
															Row2=Row2&"<font size="&Text_size3&" font color="&Text_color&" face="&Text_font&">"
															Row2=Row2&Sta_name(j)&"<br></font>"
															Row2=Row2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"
															Row2=Row2&Sta_addr(j)&"<br>"
															Row2=Row2&Sta_info(j)&"<br><br>"&"</font>"
															end if
														end if
													Next
													strHTML=strHTML&"</td>"
													strHTML=strHTML&"</tr>"
												Next
												strHTML=strHTML&"</table>"
if (Template=2) then
	str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
	str=str&"<tr>"
	str=str&"<td width=""30%"">"
	str=str&LinkPlate2
	str=str&"</td>"
	str=str&"<td width=""70%"">"
	str=str&Row2
	str=str&"</td>"
	str=str&"</tr>"
	str=str&"</table>"
	Response.Write(str)
end if

'*******************************************************************************************************************
if (Template=1) then
Response.Write(strHTML)
end if
if (Template=2) then
end if
Set objConn=Nothing
</script>
</HTML>