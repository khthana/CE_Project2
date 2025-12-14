<HTML>
 <script language="vbscript" runat="server">
 	Response.write"<head>"
	Response.write"<meta http-equiv='content-type' content='text/html;charset=window-874'>"
	Response.write"</head>"
 
 DIM strHTML
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 DIM LinkPlate2
 DIM InfoPlate2
 DIM str
 
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
											strHTML=strHTML&"ข้อมูลแสดงอาณาเขตของจังหวัด"&"</font>"
											strHTML=strHTML&"</td></tr>"
											strHTML=strHTML&"</table></CENTER>"
											
											if Template=2 then
												Response.Write(strHTML)
												strHTML=""
											end if 
Response.Write("<body bgcolor ="&Back_color&">")											
'******************************* Create Internal Link  *****************************************************************
strSql3="Select * From FORM"
Set  objRS3=Server.CreateObject("ADODB.Recordset")
objRS3.Open strSql3,ObjConn
									strHTML=strHTML&"<br>"
									Do While Not objRS3.Eof
	
										if objRS3("Topic")=1 then
										strHTML=strHTML & "<a href=" & "test12.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-   ข้อมูลทั่วไป   -</font></font></font></a>"															
											if Template=2 then
												strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS3("Topic")=2 then	
											strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " -อาณาเขตของจังหวัด  -</font></font></font></a>"									
											if Template=2 then
												'str=str& "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  - อาณาเขตของจังหวัด -  </font></font></font></a>"&"<br>"
												strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS3("Topic")=3 then
												strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  - ประเพณีวัฒนธรรม   -</font></font></font></a>"
											if Template=2 then
												'str=str & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  -ประเพณีวัฒนธรรม -  </font></font></font></a>"&"<br>"
												strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS3("Topic")=4 then
												strHTML=strHTML & "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& " - สินค้า OTOP   -</font></font></font></a>"
											if Template=2 then
												'str=str& "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& " -  สินค้า OTOP  - </font></font></font></a>"&"<br>"
												strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS3("Topic")=5 then
												strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " -  ข้อมูลการเดินทาง   -</font></font></font></a>"
											if Template=2 then
												'str=str& "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " -  ข้อมูลการเดินทาง - </font></font></font></a>"&"<br>"
												strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS3("Topic")=6 then
												strHTML=strHTML & "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "  - ข้อมูลสถานที่ท่องเที่ยว  -</font></font></font></a>"
											if Template=2 then
												'str=str& "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "  - ข้อมูลสถานที่ท่องเที่ยว - </font></font></font></a>"&"<br>"
												strHTML=strHTML&"<br>"
											end if
										end if
										
										if objRS3("Topic")=7 then
												strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  - ข้อมูลที่พักแรม  -</font></font></font></a>"
											if Template=2 then
												'str=str& "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "  - ข้อมูลที่พักแรม  - </font></font></font></a>"&"<br>"
												strHTML=strHTML&"<br>"
											end if
										end if
										if objRS3("Topic")=8 then
												strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"-ข้อมูลสายการบิน- </font></font></font></a>"					
											if Template=2 then
												'str=str& "<a href=" & "Airline.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"& "  - ข้อมูลสายการบิน - </font></font></font></a>"&"<br>"
												strHTML=strHTML&"<br>"
											end if
										end if
										
									objRS3.MoveNext
									Loop
									

									strHTML=strHTML &"<br><br>"
									'strHTML = "<CENTER>"&strHTML&"</CENTER>" 
									
									if Template=1 then 
									strHTML = "<CENTER>"&strHTML&"</CENTER>" 
									Response.Write(strHTML) 
									end if
									
									if Template=2 then 
										str=strHTML
										LinkPlate2=str 
										str="" 
									end if
									strHTML=""

objRS3.Close
Set objRS3=Nothing
'******************************* Show boundary *************************************************************************
strSql2="Select * From MBOUNDARY"
Set  objRS2=Server.CreateObject("ADODB.Recordset")
objRS2.Open strSql2,ObjConn
									Do While Not objRS2.Eof
										strHTML=strHTML&objRS2("Mbo_direction")&" "&"ติดต่อกับ"&" "&objRS2("Mbo_beside")&"<br>"
										if Template=2 then
											InfoPlate2=InfoPlate2&objRS2("Mbo_direction")&" "&"ติดต่อกับ"&" "&objRS2("Mbo_beside")&"<br>"
										end if
									objRS2.MoveNext
									Loop

objRS2.Close
Set objRS2=Nothing

									strHTML=strHTML&"<br>"

'****************************** Show District and it's distance ***************************************************
strSql4="Select * From DISTRICT"
Set  objRS4=Server.CreateObject("ADODB.Recordset")
objRS4.Open strSql4,ObjConn
									strHTML=strHTML&"ระยะทางจากอำเภอต่างๆเทียบกับอำเภอเมือง"&"<br>"
									InfoPlate2=InfoPlate2&"ระยะทางจากอำเภอเมืองไปยังอำเภอต่างๆ"&"<br>"
									Do While Not objRS4.Eof
											strHTML=strHTML & objRS4("Dis_name")&" "&"ห่างจากอำเภอเมือง"&"&nbsp"&objRS4("Dis_Distance")&"&nbsp"&"กม."&"<br>"
										if Template=2 then
											InfoPlate2=InfoPlate2&objRS4("Dis_name")&" "&"ห่างจากอำเภอเมือง"&"&nbsp"&objRS4("Dis_Distance")&"&nbsp"&"กม."&"<br>"
										end if
									objRS4.MoveNext
									Loop
objRS4.Close
Set objRS4=Nothing

'***************************** Show map ****************************************************************************
'DIM strHTML2
'strHTML2=strHTML2&"<CENTER>"&"<IMG src=""C:\Inetpub\wwwroot\map.JPG"" width=250 height=220></IMG>"&"</CENTER>"

'if Template=2 then
'InfoPlate2="<CENTER>"&"<IMG src=""C:\Inetpub\wwwroot\map.JPG"" width=250 height=220></IMG>"&"</CENTER>"&"<br><br>"&InfoPlate2
'end if
DIM strHTML2
strHTML2=strHTML2&"<CENTER>"&"<IMG src=""map.JPG"" width=250 height=220></IMG>"&"</CENTER>"
strHTML2=strHTML2&"<CENTER>"&"<a href=" & "map2.asp"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &"คลิกเพื่อขยายขนาด"&"<br><br></font></font></font></a>"&"</CENTER>"

if Template=2 then
tmp=tmp&"<a href=" & "map2.asp"& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &"คลิกเพื่อขยายขนาด"&"<br><br></font></font></font></a>"
InfoPlate2="<CENTER>"&"<IMG src=""map.JPG"" width=250 height=220></IMG>"&"</CENTER>"&"<br><br>"&tmp&InfoPlate2
end if
'*******************************************************************************************************************
DIM strHTML3

strHTML="<font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"&strHTML&"</font>"
strHTML="<CENTER>"&strHTML&"</CENTER>"
									
strHTML3=strHTML3&"<div align=""right"">"
strHTML3=strHTML3&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"" dir=""ltr"">"
strHTML3=strHTML3&"<tr>"
strHTML3=strHTML3&"<td width=""80%"">"
strHTML3=strHTML3&strHTML
strHTML3=strHTML3&"</td>"

strHTML3=strHTML3&"<td width=""20%"">"
strHTML3=strHTML3&strHTML2
strHTML3=strHTML3&"</td>"
strHTML3=strHTML3&"</tr>"
strHTML3=strHTML3&"</table>"
strHTML3=strHTML3&"</div>	"	

									if Template=1 then
										Response.Write(strHTML3)
									end if
									
									if Template=2 then
											str=str&"<br><br>"&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
           								str=str&"<tr>"
             								str=str&"<td width=""50%"">" 
             									str=str&"<font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"&LinkPlate2&"</font>"
             								str=str&"</td>"
             								str=str&"<td width=""50%"">"
             									str=str&"<CENTER>"&"<font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"&InfoPlate2&"</font>"&"</CENTER>"
             								str=str&"</td>"
          	 							str=str&"</tr>"
         									str=str&"</table>"
         									Response.Write(str)
									end if
									

Set objConn=Nothing
 </script>
</HTML>