<HTML>

<script language="vbscript" runat="server">
 DIM strHTML
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color	
		strHTML=strHTML&"<form  name=""Chose"" method=post action=Res.asp>"
	'*************************************************************************************
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
											strHTML=strHTML&"ข้อมูลที่พักแรม"&"</font>"
											strHTML=strHTML&"</td></tr>"
											strHTML=strHTML&"</table></CENTER><br>"
											
											Response.Write(strHTML)
											strHTML=""
Response.Write("<body bgcolor ="&Back_color&">")
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
									strHTML="<CENTER>"&strHTML &"</CENTER>"
										if Template=2 then
											LinkPlate2=strHTML
										end if
										
										if Template=1 then
											Response.Write(strHTML)
										end if
										strHTML=""
objRS8.Close
Set objRS8=Nothing												
'**************************************************************************************************
if (Template=1) then
str=str&"<br><br><table border=""0""  width=""100%"">"
str=str&"<tr>"
str=str&"<td width=""30%"">"
str=str&"<IMG src="&Request.QueryString("pic")&" width=200 height=200>"
str=str&"</td>"
str=str&"<td width=""70%"">"
str=str&"<font>"
str=str&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"
str=str&Request.QueryString("info")&"<br><br>"
str=str& "<a href=" & "Residence.asp?"&"type="&Request.QueryString("type")&"&view="&Request.QueryString("view")& ">" & "<< กลับไปหน้าหลัก </a><br>"
str=str&"</font>"
str=str&"</td>"
str=str&"</tr></table>"
end if


if (Template=2) then
str=str&"<br><br><table border=""0""  width=""100%"">"
str=str&"<tr>"
str=str&"<td width=""50%"">"
str=str&LinkPlate2
str=str&"</td>"
str=str&"<td width=""50%"">"
str=str&"<IMG src="&Request.QueryString("pic")&" width=200 height=200><br><br>"
str=str&Request.QueryString("info")&"<br><br>"
str=str& "<a href=" & "Residence.asp?"&"type="&Request.QueryString("type")&"&view="&Request.QueryString("view")& ">" & "<< กลับไปหน้าหลัก </a><br>"
str=str&"</td>"
str=str&"</tr></table>"
end if
Response.Write(str)
Set objConn=Nothing
</script>
</HTML>