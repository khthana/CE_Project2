<HTML>

<script language="vbscript" runat="server">
 DIM strHTML
 DIM Template
 DIM Text_font
 DIM Text_size
 DIM Text_color
 DIM Back_color
 DIM Res_typorder(1000)
 DIM Res_typname(1000)
 DIM typenum
 
 DIM Res_vieorder(1000)
 DIM Res_viename(1000)
 DIM viewnum
 
DIM Res_name(1000)
DIM Res_typorder2(1000)											
DIM Res_vieorder2(1000)
DIM Res_star(1000)
DIM Dis_name(1000)
DIM Res_price(1000)
DIM resnum
DIM ty,view,star,dis,price

			strHTML=strHTML&"<form  name=""Chose"" method=post action=ResReserve.asp>"
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
											strHTML=strHTML&"<font size="&Text_size2&"font color="&Text_color&" face="&Text_font&">"
											strHTML=strHTML&"จองที่พักแรม"&"</font>"
											strHTML=strHTML&"</td></tr>"
											strHTML=strHTML&"</table></CENTER>"
											
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
											
										end if
										
										if objRS8("Topic")=2 then
												strHTML=strHTML & "<a href=" & "Boundary.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--อาณาเขตของจังหวัด--</font></font></font></a>"

										end if
										
										if objRS8("Topic")=3 then
												strHTML=strHTML & "<a href=" & "Culture.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ประเพณีวัฒนธรรม--</font></font></font></a>"

										end if
										
										if objRS8("Topic")=4 then
												strHTML=strHTML & "<a href=" & "OTOP.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--สินค้า OTOP--</font></font></font></a>"

										end if
										
										if objRS8("Topic")=5 then
												strHTML=strHTML & "<a href=" & "Transportation.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลการเดินทาง--</font></font></font></a>"
										

										end if
										
										if objRS8("Topic")=6 then
												strHTML=strHTML & "<a href=" & "Travel.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลสถานที่ท่องเที่ยว--</font></font></font></a>"

										end if
										
										if objRS8("Topic")=7 then
												strHTML=strHTML & "<a href=" & "Residence.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลที่พักแรม--</font></font></font></a>"
										

										end if
										

										if objRS8("Topic")=8 then
												strHTML=strHTML & "<a href=" & "Airline.asp" & ">"&"<font size="&Text_size&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"--ข้อมูลสายการบิน--</font></font></font></a>"
										

										end if

									objRS8.MoveNext
									Loop
									strHTML="<CENTER>"&strHTML &"</CENTER>"
										
											Response.Write(strHTML)
											strHTML=""
objRS8.Close
Set objRS8=Nothing												
'**************************************************************************************************
'***************************  Keep all in array **********************************
count=0
				strHTML3=strHTML3&"<CENTER><font size="&Text_size2&">"&"<font color="&Text_color&">"&"<font face="&Text_font&">"&"<br><br> ค้นหาข้อมูล<br><br> "&"</font></font></font></a></CENTER>"
									strHTML3=strHTML3&"<CENTER> ค้นหาประเภทที่พัก :"&"&nbsp"
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
									strHTML3=strHTML3&"</Select>"&"&nbsp"&"&nbsp"&"&nbsp"

objRS3.Close
Set objRS3=Nothing

'*****************
count=0
									strHTML3=strHTML3&" ค้นหาจากลักษณะทิวทัศน์ :"&"&nbsp"
									strHTML3=strHTML3&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"
strSql4="Select * From RESIDENCE_VIEW"
Set  objRS4=Server.CreateObject("ADODB.Recordset")
objRS4.Open strSql4,ObjConn
									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
									Do While Not objRS4.Eof
										
										if Request("Combo2")= objRS4("Res_viename")then
										
											strHTML3=strHTML3&"<Option selected Value="&objRS4("Res_viename")&">"&objRS4("Res_viename")&"</Option>"
										else
										
											strHTML3=strHTML3&"<Option Value="&objRS4("Res_viename")&">"&objRS4("Res_viename")&"</Option>"
										end if
										
										Res_vieorder(count)= objRS4("Res_vieorder")
										Res_viename(count)= objRS4("Res_viename")
										count=count+1
									objRS4.MoveNext
									Loop
									viewnum=count
									strHTML3=strHTML3&"</Select><br><br></CENTER>"

objRS4.Close
Set objRS4=Nothing
'*****************
strSql="Select * From DISTRICT"
Set  objRS=Server.CreateObject("ADODB.Recordset")
objRS.Open strSql,ObjConn
									strHTML3=strHTML3&"<CENTER>ค้นหาจากชื่ออำเภอ :"&"&nbsp"
									strHTML3=strHTML3&"<Select Name = ""Combo4"" Size=""1"" onchange=Chose.submit()>"
									strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
			
									Do While Not objRS.Eof
									n=n&objRS("Dis_Distance")
									
									if Request("Combo4")= objRS("Dis_name") then
											strHTML3=strHTML3&"<Option selected Value="&objRS("Dis_name")&">"&objRS("Dis_name")&"</Option>"
									else
										strHTML3=strHTML3&"<Option  Value="&objRS("Dis_name")&">"&objRS("Dis_name")&"</Option>"
									end if
									
										objRS.MoveNext
									Loop
									strHTML3=strHTML3&"</Select>"&"&nbsp"&"&nbsp"&"&nbsp"		
objRS.Close
Set objRS=Nothing

'*****************

'*****************
count=0

strSql5="Select * From RESIDENCE"
Set  objRS5=Server.CreateObject("ADODB.Recordset")
objRS5.Open strSql5,ObjConn
															
									Do While Not objRS5.Eof
											Res_name(count)=objRS5("Res_name")
											Res_typorder2(count)=objRS5("Res_typorder")
											Res_vieorder2(count)=objRS5("Res_vieorder")
											Res_star(count)=objRS5("Res_star")
											Dis_name(count)=objRS5("Dis_name")
											Res_price(count)=objRS5("Res_price")

									count=count+1
									objRS5.MoveNext
									Loop
									resnum=count
objRS5.Close
Set objRS5=Nothing	
'*****************
strHTML3=strHTML3&" ค้นหาจากระดับดาว :"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo3"" Size=""1""  onchange=Chose.submit()>"
strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 5
		if (i=1) then
				if Request("Combo3")="1" then
					strHTML3=strHTML3&"<Option selected Value="&"1"&">"&"1"&"</Option>"
				else									
					strHTML3=strHTML3&"<Option  Value="&"1"&">"&"1"&"</Option>"
				end if
		end if
		if (i=2) then
				if Request("Combo3")="2" then
					strHTML3=strHTML3&"<Option selected Value="&"2"&">"&"2"&"</Option>"
				else									
					strHTML3=strHTML3&"<Option  Value="&"2"&">"&"2"&"</Option>"
				end if		
		end if
		if (i=3) then
				if Request("Combo3")="3" then
					strHTML3=strHTML3&"<Option selected Value="&"3"&">"&"3"&"</Option>"
				else									
					strHTML3=strHTML3&"<Option  Value="&"3"&">"&"3"&"</Option>"
				end if		
		end if
		if (i=4) then
				if Request("Combo3")="4" then
					strHTML3=strHTML3&"<Option selected Value="&"4"&">"&"4"&"</Option>"
				else									
					strHTML3=strHTML3&"<Option  Value="&"4"&">"&"4"&"</Option>"
				end if	
		end if
		if (i=5) then
				if Request("Combo3")="5" then
					strHTML3=strHTML3&"<Option selected Value="&"5"&">"&"5"&"</Option>"
				else									
					strHTML3=strHTML3&"<Option  Value="&"5"&">"&"5"&"</Option>"
				end if		
		end if

Next
strHTML3=strHTML3&"</Select>"&"&nbsp"&"&nbsp"&"&nbsp"

'*****************************************************
'Dim txt
strHTML3=strHTML3&" ค้นหาจากราคา :"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo5"" Size=""1""  onchange=Chose.submit()>"

strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
n=""
For i=0 To resnum-1
	n=n&Res_price(i)
	if Request("Combo5")=n then
		strHTML3=strHTML3&"<Option selected Value="&n&">"&n&"</Option>"
	else									
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	
	n=""
Next

strHTML3=strHTML3&"</Select><br><br></CENTER>"

Set objConn=Nothing
'*****************************************************
ty=Request("Combo1")
view=Request("Combo2")
star=Request("Combo3")
dis=Request("Combo4")
price=Request("Combo5")

strHTML3=strHTML3& "<CENTER><a href=" & "ResReserve2.asp?"&"ty="&ty&"&view="&view&"&star="&star&"&dis="&dis&"&price="&price& ">" & "ไปหน้าต่อไป >></a><br></CENTER>"											
Response.Write(strHTML3)
Response.Write"</form>"
</script>
</HTML>