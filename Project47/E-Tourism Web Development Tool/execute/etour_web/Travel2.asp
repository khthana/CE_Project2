<HTML>
<script language="vbscript" runat="server">
 DIM strHTML
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 
 									strHTML=strHTML&"<form  name=""Chose"" method=post action=Travel2.asp>"
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
									
									if (Template=1) then
									strHTML2=strHTML2&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
									strHTML2=strHTML2&"<tr>"	
									strHTML2=strHTML2&"<br><td width=""30%"">"
									end if
											strHTML2=strHTML2&"<IMG src="&Request.QueryString("pic")&" width=200 height=200></IMG>"&"<br><br>"										
									
									if (Template=1) then
									strHTML2=strHTML2&"</td>"
											
									strHTML2=strHTML2&"<br><td width=""70%"">"
									end if
											strHTML2=strHTML2&"<font size="&Text_size2&" font color="&Text_color&" face="&Text_font&">"&Request.QueryString("name")&"<br><br>"&"</font>"		
											strHTML2=strHTML2&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&Request.QueryString("info")&"</font>"	
											'strHTML2=strHTML2& "<br><CENTER><a href=" & "Travel.asp?"&"pic="&Request.QueryString("pic")&"&info="&Request.QueryString("info")&"&name="&Request.QueryString("name")& ">"&"<font size=+1><font color="&TxtClr&">"&"<font face=""Comic Sans MS"">" & " << Back "&" </font></font></font></a></CENTER>"					
											
									if Request.QueryString("case")=1 then
										strHTML2=strHTML2& "<br><CENTER><a href=" & "Travel.asp?"&"case="&Request.QueryString("case")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " << กลับไปหน้าหลัก "&" </font></font></font></a></CENTER>"	
									end if		
										if Request.QueryString("case")=2 then
											strHTML2=strHTML2& "<br><CENTER><a href=" & "Travel.asp?"&"case="&Request.QueryString("case")&"&district="&Request.QueryString("district")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " <<กลับไปหน้าหลัก "&" </font></font></font></a></CENTER>"	
										end if		
											if Request.QueryString("case")=3 then
												strHTML2=strHTML2& "<br><CENTER><a href=" & "Travel.asp?"&"case="&Request.QueryString("case")&"&type="&Request.QueryString("type")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " << กลับไปหน้าหลัก"&" </font></font></font></a></CENTER>"	
											end if
												if Request.QueryString("case")=4 then
													strHTML2=strHTML2& "<br><CENTER><a href=" & "Travel.asp?"&"case="&Request.QueryString("case")&"&district="&Request.QueryString("district")&"&type="&Request.QueryString("type")& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " << กลับไปหน้าหลัก"&" </font></font></font></a></CENTER>"	
												end if
											
									'strHTML2=strHTML2& "<br><CENTER><a href=" & "Travel.asp?"&"case="&Request.QueryString("case")& ">"&"<font size=+1><font color="&TxtClr&">"&"<font face=""Comic Sans MS"">" & " << Back "&" </font></font></font></a></CENTER>"
									
									if (Template=1) then
									strHTML2=strHTML2&"</td></tr></table>"
									Response.Write(strHTML2)
									end if

									if (Template=2) then
										str=str&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse; font-family: Comic Sans MS"" bordercolor=""#111111"" width=""100%"">"
										str=str&"<tr>"	
										str=str&"<br><td width=""20%"">"
										str=str&LinkPlate2
										str=str&"</td>"
										str=str&"<br><td width=""80%"">"
										str=str&strHTML2
										str=str&"</td></tr></table>"
										Response.Write(str)
									end if
</script>
</HTML>