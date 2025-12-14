<HTML>

<script language="vbscript" runat="server">
 DIM strHTML
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 DIM LinkPlate2
 DIM count
 
 DIM Res_typorder(1000)
 DIM Res_typname(1000)
 DIM typenum
 
 DIM Res_vieorder(1000)
 DIM Res_viename(1000)
 DIM viewnum
 
DIM Res_name(1000)
DIM Res_typorder2(1000)											
DIM Res_vieorder2(1000)
DIM Res_logo(1000)
DIM Res_info(1000)
DIM Res_star(1000)
DIM Dis_name(1000)
DIM Res_addr(1000)
DIM Res_tel(1000)
DIM Res_mail(1000)
DIM Res_price(1000)
DIM Res_pic(1000)
DIM Res_moreinfo(1000)
DIM Res_pic2(1000)
DIM resnum

			strHTML=strHTML&"<form  name=""Chose"" method=post action=Residence.asp>"
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
									'strHTML="<CENTER>"&strHTML &"</CENTER>"
										if Template=2 then
											LinkPlate2=strHTML
										end if
										
										if Template=1 then
											strHTML = "<CENTER>"&strHTML&"</CENTER>"
											Response.Write(strHTML)
										end if
										strHTML=""
objRS8.Close
Set objRS8=Nothing												
'**************************************************************************************************
'***************************  Keep all in array **********************************
count=0
									strHTML3=strHTML3&" <br>ค้นหาข้อมูล<br>"
									strHTML3=strHTML3&" ค้นหาประเภทที่พัก :<br>"
									strHTML3=strHTML3&"<Select Name = ""Combo1"" Size=""1""  onchange=Chose.submit()>"
strSql3="Select * From RESIDENCE_TYPE"
Set  objRS3=Server.CreateObject("ADODB.Recordset")
objRS3.Open strSql3,ObjConn
									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS3.Eof
										
										if Request("Combo1")= objRS3("Res_typname")then
										
											strHTML3=strHTML3&"<Option selected Value="&objRS3("Res_typname")&">"&objRS3("Res_typname")&"</Option>"
										else
										
											strHTML3=strHTML3&"<Option  Value="&objRS3("Res_typname")&">"&objRS3("Res_typname")&"</Option>"
										end if
										
										Res_typorder(count)=objRS3("Res_typorder")
										Res_typname(count)= objRS3("Res_typname")
										count=count+1
									objRS3.MoveNext
									Loop
									typenum=count
									strHTML3=strHTML3&"</Select><br>"

objRS3.Close
Set objRS3=Nothing

'*****************
count=0
									strHTML3=strHTML3&" ค้นหาจากลักษณะทิวทัศน์ :<br>"
									strHTML3=strHTML3&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"
strSql4="Select * From RESIDENCE_VIEW"
Set  objRS4=Server.CreateObject("ADODB.Recordset")
objRS4.Open strSql4,ObjConn
									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS4.Eof
										
										if Request("Combo2")= objRS4("Res_viename")then
										
											strHTML3=strHTML3&"<Option selected Value="&objRS4("Res_viename")&">"&objRS4("Res_viename")&"</Option>"
										else
										
											strHTML3=strHTML3&"<Option  Value="&objRS4("Res_viename")&">"&objRS4("Res_viename")&"</Option>"
										end if
										
										Res_vieorder(count)= objRS4("Res_vieorder")
										Res_viename(count)= objRS4("Res_viename")
										count=count+1
									objRS4.MoveNext
									Loop
									viewnum=count
									strHTML3=strHTML3&"</Select><br><br>"

objRS4.Close
Set objRS4=Nothing
'strHTML3=strHTML3&"<a href="&"ResReserve.asp"&">"&"ต้องการจองที่พักแรม</a>"
strHTML3=strHTML3&"<a href=" & "ResReserve.asp" &"><font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"ต้องการจองที่พักแรม >></font></font></font></a><br>"

'*****************
count=0

strSql5="Select * From RESIDENCE"
Set  objRS5=Server.CreateObject("ADODB.Recordset")
objRS5.Open strSql5,ObjConn
																
									Do While Not objRS5.Eof
											Res_name(count)=objRS5("Res_name")
											Res_typorder2(count)=objRS5("Res_typorder")
											Res_vieorder2(count)=objRS5("Res_vieorder")
											Res_logo(count)=objRS5("Res_logo")
											Res_info(count)=objRS5("Res_info")
											Res_star(count)=objRS5("Res_star")
											Dis_name(count)=objRS5("Dis_name")
											Res_addr(count)=objRS5("Res_addr")
											Res_tel(count)=objRS5("Res_tel")
											Res_mail(count)=objRS5("Res_mail")
											Res_price(count)=objRS5("Res_price")
											Res_pic(count)=objRS5("Res_pic")
											Res_moreinfo(count)=objRS5("Res_moreinfo")
											Res_pic2(count)=objRS5("Res_pic2")
										
									count=count+1
									objRS5.MoveNext
									Loop
									resnum=count
objRS5.Close
Set objRS5=Nothing	
'*****************
'************************   Show All of Info     ******************************************************
DIM ty
DIM vi

ty= Request("Combo1")
vi= Request("Combo2")

if (ty="") then
ty=Request.QueryString("type")
end if

if (vi="") then
vi=Request.QueryString("view")
end if

if Request("Combo1")="" then 'type
	if Request("Combo2")="" then 'view
		if Request.QueryString("type")="" then 'type
			if Request.QueryString("view")="" then 'view
				For i=0 To resnum-1
				Show(i)
				Next
			end if
		end if
	end if
end if

if Request("Combo1")="None" then 'type
	if Request("Combo2")="None" then 'view
		For i=0 To resnum-1
			Show(i)
		Next
	else
		For i=0 To resnum-1
			For k=0 To viewnum-1
				if (Res_vieorder2(i)=Res_vieorder(k)) then		
					if (Res_viename(k)=Request("Combo2")) then
						Show(i)
					end if
				end if	
			Next
		Next
	end if
else
	if Request("Combo2")="None" then
	For i=0 To resnum-1
		For k=0 To typenum-1
			if (Res_typorder2(i)=Res_typorder(k)) then
				if (Res_typname(k)=Request("Combo1")) then
					Show(i)
				end if
			end if
		Next
	Next
	else
		For i=0 To resnum-1
			For k=0 To typenum-1
				if (Res_typorder2(i)=Res_typorder(k)) then
					if (Res_typname(k)=Request("Combo1")) then
						For l=0 To viewnum-1
							if (Res_vieorder2(i)=Res_vieorder(l)) then		
								if (Res_viename(l)=Request("Combo2")) then
									Show(i)
								end if
							end if
						Next
					end if
				end if
			Next
		Next
	end if	
end if
'**********
if Request.QueryString("type")="None" then 'type
	if Request.QueryString("view")="None" then 'view
		For i=0 To resnum-1
			Show(i)
		Next
	else
		For i=0 To resnum-1
			For k=0 To viewnum-1
				if (Res_vieorder2(i)=Res_vieorder(k)) then		
					if (Res_viename(k)=Request.QueryString("view")) then
						Show(i)
					end if
				end if	
			Next
		Next
	end if
else
	if Request.QueryString("view")="None" then
	For i=0 To resnum-1
		For k=0 To typenum-1
			if (Res_typorder2(i)=Res_typorder(k)) then
				if (Res_typname(k)=Request.QueryString("type")) then
					Show(i)
				end if
			end if
		Next
	Next
	else
		For i=0 To resnum-1
			For k=0 To typenum-1
				if (Res_typorder2(i)=Res_typorder(k)) then
					if (Res_typname(k)=Request.QueryString("type")) then
						For l=0 To viewnum-1
							if (Res_vieorder2(i)=Res_vieorder(l)) then		
								if (Res_viename(l)=Request.QueryString("view")) then
									Show(i)
								end if
							end if
						Next
					end if
				end if
			Next
		Next
	end if	
end if	
	
'**********
Function Show(i)
	For j=0 To resnum-1
		if (i=j) then
			if (Template=1) then
				strHTML=strHTML&"<br><br><table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#FFFFFF"" width=""100%"">"
        		strHTML=strHTML&"<tr>"
          	strHTML=strHTML&"<td width=""50%"">"
          	end if
          	
			if (Res_pic(j)<>"") then
			strHTML=strHTML&"<br><br><IMG src="&Res_pic(j)&" width=200 height=200></IMG>"&"<br><br>"
			end if
			if (Res_logo(j)<>"") then
			strHTML=strHTML&"<br><br><IMG src="&Res_logo(i)&" width=200 height=200></IMG>"&"<br><br>"
			end if
			 
			if (Template=1) then
			strHTML=strHTML&"</td>"
          	strHTML=strHTML&"<td width=""50%"">"
          	end if
          	
			strHTML=strHTML&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"
			strHTML=strHTML&"ชื่อ:"&Res_name(j)&"<br>"
			For k=0 To typenum-1
				if (Res_typorder2(j)=Res_typorder(k)) then
				strHTML=strHTML&"ประเภท:"&Res_typname(k)&"<br>"
				end if
			Next
			For k=0 To viewnum-1
				if (Res_vieorder2(j)=Res_vieorder(k)) then
				strHTML=strHTML&"ลักษณะทิวทัศน์ :"&Res_viename(k)&"<br></font>"
				'strHTML="<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&strHTML&"</font>"
				end if
			Next
			strHTML=strHTML&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"
			strHTML=strHTML&"รายละเอียด :"&Res_info(j)&"<br>"
			strHTML=strHTML&"ระดับดาว :"&Res_star(j)&"<br>"
			strHTML=strHTML&"ที่อยู่ :"&Res_addr(j)&"<br>"
			strHTML=strHTML&"ตั้งอยู่อำเภอ :"&Dis_name(j)&"<br>"
			strHTML=strHTML&"เบอร์โทรศัพท์:"&Res_tel(j)&"<br>"
			strHTML=strHTML&"ราคาโดยประมาณ:"&Res_price(j)&"บาท<br>"
			if (Res_mail(j)<>"") then
				strHTML=strHTML&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"
				strHTML=strHTML&"E-mail Address:</font>"
				'strHTML=strHTML&"<a href=http://" &Res_mail(j)&">" &Res_mail(i)&"</a>"&"<br>"
				strHTML=strHTML & "<a href=http://" & Res_mail(j) & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&Res_mail(i)&"</font></font></font></a><br>"

			end if
			if (Res_moreinfo(j)<>"") then
			'strHTML=strHTML& "<a href=" & "Residence2.asp?"&"type="&ty&"&view="&vi&"&info="&Res_moreinfo(j)&"&pic="&Res_pic2(j)& ">" & "รายละเอียดเพิ่มเติม >></a><br>"											
			'strHTML= "<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&strHTML&"</font>"
			strHTML=strHTML & "<a href=" & "Residence2.asp?" &"type="&ty&"&view="&vi&"&info="&Res_moreinfo(j)&"&pic="&Res_pic2(j)& ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"รายละเอียดเพิ่มเติม >></font></font></font></a><br>"
			end if
			
			if (Template=1) then
			strHTML=strHTML&"</td>"
        		strHTML=strHTML&"</tr>"
      		strHTML=strHTML&"</table>"
      		end if
		end if
		strHTML= "<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&strHTML&"</font>"
	Next
End Function			

if (Template=1) then
str=str&"<table border=""0""  width=""100%"">"
str=str&"<tr>"
str=str&"<td width=""90%"">"
str=str&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">" &strHTML&"</font>"
'strHTML3 = "<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&StrHTML3&"</font>"
'str=str&strHTML
str=str&"</td>"
str=str&"<td width=""10%"">"
str=str&"<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&strHTML3&"</font>"
'str=str&strHTML3
str=str&"</td>"
str=str&"</tr>"
str=str&"</table>"
end if

if (Template=2) then
str=str&"<br><br><table border=""0""  width=""100%"">"
str=str&"<tr>"
str=str&"<td width=""50%"">"
str=str&LinkPlate2
str=str&"</td>"
str=str&"<td width=""50%"">"
strHTML3="<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">" &strHTML3&"</font>"
str=str&strHTML3
str=str&strHTML
'str=str&"</td>"
'str=str&"<td width=""20%"">"
'str=str&strHTML3
str=str&"</td>"
str=str&"</tr>"
str=str&"</table>"
end if
str="<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">" &str&"</font>"
'strHTML3 = "<font size="&Text_size&" font color="&Text_color&" face="&Text_font&">"&StrHTML3&"</font>"
Response.Write(str)	
Set objConn=Nothing
</script>
</HTML>