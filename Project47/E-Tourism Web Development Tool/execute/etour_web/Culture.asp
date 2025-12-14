<HTML>
<script language="vbscript" runat="server">

	Response.write"<head>"
	Response.write"<meta http-equiv='content-type' content='text/html;charset=window-874'>"
	Response.write"</head>"
	
 DIM strHTML
 DIM Row1
 DIM Row2
 DIM LinkPlate2
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 
 DIM Cul_name(1000)
 DIM Cul_info(1000)
 DIM Cul_time(1000)
 DIM Cul_pic(1000)
 DIM Cul_moreinfo(1000)
 DIM Cul_pic2(1000)  'CULTURE table
 DIM CulNum
 
 DIM Cul_name2(1000)
 DIM Dis_name2(1000) 'CULTURE_DISTRICT table
 DIM CulDisNum

 
 											strHTML=strHTML&"<form  name=""Chose"" method=post action=Culture.asp>"
 
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
											strHTML=strHTML&"<tr bgcolor="&Backcolor&">"
											strHTML=strHTML&"<td Width=70% align=CENTER>"
											strHTML=strHTML&"<font size="&Text_size2&"font color="&Text_color&" face="&Text_font&">"
											strHTML=strHTML&"ข้อมูลเทศกาลและงานประเพณี"&"</font>"
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
												strHTML=strHTML&"<br>"	
										end if
										end if
										
										if objRS2("Topic")=2 then	

											strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & " -อาณาเขตของจังหวัด -"&"</font></font></font></a>"
											if(Template=2)then 
												strHTML=strHTML&"<br>" 
											end if
										end if
										
										if objRS2("Topic")=3 then
											strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-ประเพณีวัฒนธรรม- "&"</font></font></font></a>"
											if(Template=2)then 
												strHTML=strHTML&"<br>" 
											end if
										end if
										
										if objRS2("Topic")=4 then
											strHTML=strHTML & "<a href=" & "OTOP.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"&"-สินค้า OTOP-"&"</font></font></font></a>"
											if(Template=2)then 
												strHTML=strHTML&"<br>" 
											end if
										end if
										
										if objRS2("Topic")=5 then
											strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" &"-ข้อมูลการเดินทาง-"&"</font></font></font></a>"
											if(Template=2)then 
												strHTML=strHTML&"<br>" 
											end if
										end if
										
										if objRS2("Topic")=6 then
											strHTML=strHTML & "<a href=" & "Travel.asp" & ">" &"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">"&  "-ข้อมูลสถานที่ท่องเที่ยว-"&"</font></font></font></a>"
											if(Template=2)then 
												strHTML=strHTML&"<br>" 
											end if
										end if
										
										if objRS2("Topic")=7 then
											strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-ข้อมูลที่พักแรม-"&"</font></font></font></a>"
											if(Template=2)then 
												strHTML=strHTML&"<br>" 
											end if
										end if
										
										if objRS2("Topic")=8 then
											strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "-ข้อมูลสายการบิน-"&"</font></font></font></a>"
											if(Template=2)then 
												strHTML=strHTML&"<br>" 
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
'**************************************   Keep All in array   *****************************************************
strSql="Select * From CULTURE"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
									
									strHTML=strHTML&" ค้นหาข้อมูล <br><br>"
									strHTML=strHTML&" ชื่องานประเพณี    "
									strHTML=strHTML&"<Select Name = ""Combo1"" Size=""1""  onchange=Chose.submit()>"
									strHTML=strHTML&"<Option Value=""None"">"&"None"&"</Option>"
									count=0
									
									Do While Not objRS.Eof
										if Request("Combo1")= objRS("Cul_name") then
												strHTML=strHTML&"<Option selected Value="&objRS("Cul_name")&">"&objRS("Cul_name")&"</Option>"
										else
											strHTML=strHTML&"<Option  Value="&objRS("Cul_name")&">"&objRS("Cul_name")&"</Option>"
										end if
										
										Cul_name(count)= objRS("Cul_name")
										Cul_info(count)= objRS("Cul_info")
 										Cul_time(count)= objRS("Cul_time")
  										Cul_pic(count)= objRS("Cul_pic")
  										Cul_moreinfo(count)= objRS("Cul_moreinfo")
  										Cul_pic2(count)= objRS("Cul_pic2")
										count=count+1

									objRS.MoveNext
									Loop
									strHTML=strHTML&"</Select>"	
CulNum=count									
count=0
objRS.Close
Set objRS=Nothing

strSql="Select * From CULTURE_DISTRICT"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
									Do While Not objRS.Eof
									
										Cul_name2(count)=objRS("Cul_name")
 										Dis_name2(count)=objRS("Dis_name")
										count=count+1
										
									objRS.MoveNext
									Loop
CulDisNum=count
count=0
objRS.Close
Set objRS=Nothing

strSql="Select * From DISTRICT"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
									strHTML=strHTML&"<br>อำเภอ<br>"
									strHTML=strHTML&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"
									strHTML=strHTML&"<Option Value=""None"">"&"None"&"</Option>"
									
									Do While Not objRS.Eof
									
									For i=0 to CulDisNum-1
										if Dis_name2(i)=objRS("Dis_name") then
											if Request("Combo2")= objRS("Dis_name") then
													strHTML=strHTML&"<Option selected Value="&objRS("Dis_name")&">"&objRS("Dis_name")&"</Option>"
											else
												strHTML=strHTML&"<Option  Value="&objRS("Dis_name")&">"&objRS("Dis_name")&"</Option>"
											end if
										i=CulDisNum
										end if
									
									Next
										
										objRS.MoveNext
									Loop
									strHTML=strHTML&"</Select>"			
objRS.Close
Set objRS=Nothing

									Row2=strHTML
									strHTML=""
'*************************************  Check Select with Array ************************************************
									if Request("Combo1")= "" then
										if Request("Combo2")= "" then
											if Request.QueryString("CulName")="" then
												if Request.QueryString("DisName")="" then
											
											For i=0 To CulNum-1
												Show(i)
												Row1=Row1&strHTML&"<br><br>"
												strHTML=""											
											Next
												end if
											end if
										end if
									end if
									
								
									if Request("Combo1")= "None" then
										if Request("Combo2")= "None" then
											For i=0 To CulNum-1
												Show(i)
												Row1=Row1&strHTML&"<br><br>"
												strHTML=""											
											Next
										else
											For i=0 To CulDisNum-1
												if (Dis_name2(i)=Request("Combo2")) then
													For j=0 To CulNum-1
														if (Cul_name2(i)=Cul_name(j)) then
															Show(j)
															Row1=Row1&strHTML&"<br><br>"
															strHTML=""
														end if
													Next
												end if
											Next
										end if
									else
										if Request("Combo2")= "None" then
											For i=0 To CulNum-1
												if (Request("Combo1")=Cul_name(i)) then
													Show(i)
													Row1=Row1&strHTML&"<br><br>"
													strHTML=""
												end if
											Next
										else
													For i=0 To CulDisNum-1
														if (Request("Combo1")=Cul_name2(i)) then
															if (Request("Combo2")=Dis_name2(i)) then
																For j=0 To CulNum-1
																	if (Cul_name(j)=Cul_name2(i)) then
																		Show(j)
																		Row1=Row1&strHTML&"<br><br>"
																		strHTML=""
																	end if
																Next
															end if
														end if
													Next
										end if
									end if
									
if Request.QueryString("CulName")="None" then
	if Request.QueryString("DisName")="None" then
			For i=0 To CulNum-1
			'strHTML=strHTML&"<font size="&Text_size2&"font color="&Text_color&" face="&Text_font&">"
			Show(i)
			'strHTML=strHTML&"</font>"
			Row1=Row1&strHTML
			strHTML=""
			Next
	else
			For i=0 To CulDisNum-1
				if (Dis_name2(i)=Request.QueryString("DisName")) then
					For j=0 To CulNum-1
						if (Cul_name2(i)=Cul_name(j)) then
							Show(j)
							Row1=Row1&strHTML
							strHTML=""
						end if
					Next
				end if
			Next
	end if
else
	if Request.QueryString("DisName")="None" then
		For i=0 To CulNum-1
			if (Request.QueryString("CulName")=Cul_name(i)) then
				Show(i)
				Row1=Row1&strHTML
				strHTML=""
			end if
		Next
	else
		For i=0 To CulDisNum-1  
			if (Request.QueryString("CulName")=Cul_name2(i)) then
				if (Request.QueryString("DisName")=Dis_name2(i)) then
					For j=0 To CulNum-1
						if (Cul_name(j)=Cul_name2(i)) then
							Show(j)
							Row1=Row1&strHTML
							strHTML=""
						end if
					Next
				end if
			end if
		Next
	end if
end if

Function Show(i)
DIM Dis
DIM Cul
Cul=Request("Combo1")
Dis=Request("Combo2")
if Dis="" then
Dis=Request.QueryString("DisName")
end if
if Cul="" then
Cul=Request.QueryString("CulName")
end if
	if(Template=1) then
	strHTML=strHTML&"<br><br><table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
	strHTML=strHTML&"<tr>"
	strHTML=strHTML&"<td width=""50%"">"
	end if

	strHTML=strHTML&"<IMG src="&Cul_pic(i)&" width=200 height=200></IMG>"
	
	if(Template=1) then
	strHTML=strHTML&"</td>"
	end if

	if(Template=1) then
	strHTML=strHTML&"<td width=""50%"">"
	end if
		strHTML=strHTML&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
   		strHTML=strHTML&"<tr>"
     	strHTML=strHTML&"<td width=""100%"">"
		strHTML=strHTML&"<font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"
     	strHTML=strHTML&"ชื่อประเพณี :  "&Cul_name(i)&"<br>"
		strHTML=strHTML&"ข้อมูล :  "&Cul_info(i)&"<br>"
 		strHTML=strHTML&"ช่วงเทศกาล :  "&Cul_time(i)&"<br>"
		strHTML=strHTML&"เป็นประเพณีประจำอำเภอ : "
		For j=0 to CulDisNum-1	
			if (Cul_name(i)=Cul_name2(j)) then
				strHTML=strHTML&Dis_name2(j)&"   "
			end if
		Next
		strHTML=strHTML&"</font>"
		if (Cul_moreinfo(i)<>"") then
			strHTML=strHTML&"<a href=" & "Culture2.asp?"&"info="&Cul_moreinfo(i)&"&pic2="&Cul_pic2(i)&"&CulName="&Cul&"&DisName="&Dis& ">"&"<font size="&Text_size&"><font color="&Text_color&">"&"<font face="&Text_font&">" & "<br>รายละเอียดเพิ่มเติม>>  </font></font></font></a>"
		end if
	 
     strHTML=strHTML&"</td>"
   	strHTML=strHTML&"</tr>"
 	strHTML=strHTML&"</table>"

		if(Template=1) then
	     strHTML=strHTML&"</td>"
   	strHTML=strHTML&"</tr>"
 	strHTML=strHTML&"</table>"
		end if
End Function
'*********** Show Output
if (Template=1) then
strHTML=strHTML&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
  strHTML=strHTML&"<tr>"
    strHTML=strHTML&"<td width=""80%"">"
    		strHTML=strHTML&Row1
    strHTML=strHTML&"</td>"
    strHTML=strHTML&"<td width=""20%"">"
			Row2="<font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"&Row2&"</font>"
    		strHTML=strHTML&Row2
    	strHTML=strHTML&"</td>"
  strHTML=strHTML&"</tr>"
strHTML=strHTML&"</table>"
end if

if (Template=2) then
strHTML=strHTML&"<table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
  strHTML=strHTML&"<tr>"
    strHTML=strHTML&"<td width=""30%"">"
	    strHTML=strHTML&LinkPlate2
		strHTML=strHTML&"</td>"
    strHTML=strHTML&"<td width=""70%"">"
		strHTML=strHTML&"<br>"&Row2&"<br><br>"
		strHTML=strHTML&Row1
	strHTML=strHTML&"</td>"
  strHTML=strHTML&"</tr>"
strHTML=strHTML&"</table>"
end if
								strHTML="<font size="&Text_size&"font color="&Text_color&" face="&Text_font&">"&strHTML&"</font>"
								Response.Write(strHTML)
																		
Set objConn=Nothing
Response.Write"</form>"
</script>
</HTML>