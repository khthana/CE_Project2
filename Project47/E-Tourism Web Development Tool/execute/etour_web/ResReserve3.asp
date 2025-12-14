<HTML>

<script language="vbscript" runat="server">
DIM strHTML
DIM Template
DIM Text_font
DIM Text_size
DIM Text_color
DIM Back_color
DIM Roo_order(1000)
DIM Roo_type(1000)
DIM Roo_info(1000)
DIM Roo_price(1000)
DIM Roo_lowseaprice(1000)
DIM Roo_highseaprice(1000)
DIM Res_name(1000)
DIM Rnum
DIM str


		Response.Write("<form  name=""Chose"" method=post action=ResReserve3.asp>")	
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
count=0

strSql8="Select * From ROOM"
Set  objRS8=Server.CreateObject("ADODB.Recordset")
objRS8.Open strSql8,ObjConn


									Do While Not objRS8.Eof
										Roo_type(count)= objRS8("Roo_type")
										Roo_info(count)= objRS8("Roo_info")
										Roo_price(count)= objRS8("Roo_price")
										Roo_lowseaprice(count)= objRS8("Roo_lowseaprice")
										Roo_highseaprice(count)= objRS8("Roo_highseaprice")
										Res_name(count)	= objRS8("Res_name")

										count=count+1
									objRS8.MoveNext
									Loop
									Rnum=count

count=0
objRS8.Close
Set objRS8=Nothing	


'************************************* Show *************************************************************
Response.Write("<br>")

strHTML3=strHTML3&"<br><br> เลือกประเภทของห้อง :"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo"" Size=""1""  onchange=Chose.submit()>"
strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"


For i=0 To Rnum-1
	'if (Res_name(i)=Request.QueryString("name")) then
	
	if Request("Combo")=Roo_type(i) then	
		strHTML3=strHTML3&"<Option Selected Value="&Roo_type(i)&">"&Roo_type(i)&"</Option>"
	else			
		if (Res_name(i)=Request.QueryString("name")) then						
			strHTML3=strHTML3&"<Option Value="&Roo_type(i)&">"&Roo_type(i)&"</Option>"	
		end if	
	end if
Next

strHTML3=strHTML3&"</Select><br>"&"&nbsp"&"&nbsp"&"&nbsp"
'*********
n=""
strHTML3=strHTML3&"<br>Check in :"&"&nbsp"&"&nbsp"&"&nbsp"&"&nbsp"
strHTML3=strHTML3&"D/M/Y"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo2"" Size=""1""  onchange=Chose.submit()>"
'strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 31
		n=i
		n=""&n&""
	if Request("Combo2")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	

Next
strHTML3=strHTML3&"</Select>"
'*********
n=""
strHTML3=strHTML3&"<Select Name = ""Combo3"" Size=""1""  onchange=Chose.submit()>"
'strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 12
		n=i
		n=""&n&""
	if Request("Combo3")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	
Next
strHTML3=strHTML3&"</Select>"
'*********
strHTML3=strHTML3&"<Select Name = ""Combo4"" Size=""1""  onchange=Chose.submit()>"
	if Request("Combo4")="2004" then
		strHTML3=strHTML3&"<Option Selected Value="&"2004"&">"&"2004"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"2004"&">"&"2004"&"</Option>"
	end if	
	
	if Request("Combo4")="2005" then
		strHTML3=strHTML3&"<Option Selected Value="&"2005"&">"&"2005"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"2005"&">"&"2005"&"</Option>"
	end if	
strHTML3=strHTML3&"</Select><br><br>"
'*********
n=""
strHTML3=strHTML3&"Check out :"&"&nbsp"&"&nbsp"
strHTML3=strHTML3&"D/M/Y"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo5"" Size=""1""  onchange=Chose.submit()>"
'strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 31
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
n=""
strHTML3=strHTML3&"<Select Name = ""Combo6"" Size=""1""  onchange=Chose.submit()>"
'strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 12
		n=i
		n=""&n&""
	if Request("Combo6")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	
Next
strHTML3=strHTML3&"</Select>"
'*********
strHTML3=strHTML3&"<Select Name = ""Combo7"" Size=""1""  onchange=Chose.submit()>"
	if Request("Combo7")="2004" then
		strHTML3=strHTML3&"<Option Selected Value="&"2004"&">"&"2004"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"2004"&">"&"2004"&"</Option>"
	end if	
	
	if Request("Combo7")="2005" then
		strHTML3=strHTML3&"<Option Selected Value="&"2005"&">"&"2005"&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&"2005"&">"&"2005"&"</Option>"
	end if	
strHTML3=strHTML3&"</Select>"
'*********
n=""
strHTML3=strHTML3&"<br><br> จำนวนที่ต้องการจอง :"&"&nbsp"
strHTML3=strHTML3&"<Select Name = ""Combo8"" Size=""1""  onchange=Chose.submit()>"
strHTML3=strHTML3&"<Option Value=""None"">"&"None"&"</Option>"
For i=1 To 5
		n=i
		n=""&n&""
	if Request("Combo8")=n then
		strHTML3=strHTML3&"<Option Selected Value="&n&">"&n&"</Option>"
	else								
		strHTML3=strHTML3&"<Option Value="&n&">"&n&"</Option>"
	end if	
	
Next
strHTML3=strHTML3&"</Select>"
'*********
Response.Write("<CENTER>"&strHTML3&"</CENTER>")

For i=0 To Rnum-1
	if Request("Combo")=Roo_type(i) then
		str=str&"Res_name="&Res_name(i)
		str=str&"&Roo_type="&Roo_type(i)
		str=str&"&Roo_info="&Roo_info(i)
		str=str&"&Roo_price="&Roo_price(i)
		str=str&"&Roo_lowseaprice="&Roo_lowseaprice(i)
		str=str&"&Roo_highseaprice="&Roo_highseaprice(i)							
	end if
Next

str=str&"&Din="&Request("Combo2")
str=str&"&Min="&Request("Combo3")
str=str&"&Yin="&Request("Combo4")
str=str&"&Dout="&Request("Combo5")
str=str&"&Mout="&Request("Combo6")
str=str&"&Yout="&Request("Combo7")
str=str&"&Rev="&Request("Combo8")

Response.Write( "<CENTER><br><br><a href=" & "ResReserve4.asp?"&str& ">"&"ยืนยันการจอง" & " >></a><br></CENTER>")	

Set objConn=Nothing
Response.Write"</form>"
</script>
</HTML>