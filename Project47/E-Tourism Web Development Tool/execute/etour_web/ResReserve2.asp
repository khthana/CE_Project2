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

			strHTML=strHTML&"<form  name=""Chose"" method=post action=ResReserve2.asp>"
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


'***************************  Keep all in array **********************************
count=0

strSql3="Select * From RESIDENCE_TYPE"
Set  objRS3=Server.CreateObject("ADODB.Recordset")
objRS3.Open strSql3,ObjConn
									Do While Not objRS3.Eof
										Res_typorder(count)=objRS3("Res_typorder")
										Res_typname(count)= objRS3("Res_typname")
										count=count+1
									objRS3.MoveNext
									Loop
									typenum=count

objRS3.Close
Set objRS3=Nothing

'*****************
count=0
strSql4="Select * From RESIDENCE_VIEW"
Set  objRS4=Server.CreateObject("ADODB.Recordset")
objRS4.Open strSql4,ObjConn

									Do While Not objRS4.Eof

										Res_vieorder(count)= objRS4("Res_vieorder")
										Res_viename(count)= objRS4("Res_viename")
										count=count+1
									objRS4.MoveNext
									Loop
									viewnum=count

objRS4.Close
Set objRS4=Nothing
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
										
'**************************************************************************************************

 ty=Request.QueryString("ty")
 view=Request.QueryString("view")
 star=Request.QueryString("star")
 dis=Request.QueryString("dis")
 price=Request.QueryString("price")
 if (price<>"None" and price<>"") then
 price=price+0
end if

if (ty="") then
ty="None"
end if

if (view="") then
view="None"
end if

if (star="") then
star="None"
end if

if (dis="") then
dis="None"
end if

if (price="") then
price="None"
end if

Dim ComeIn
ComeIn=0

Function MakeLink(n)

s=s&"<br><br><table border=""0"" cellpadding=""0"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"" width=""100%"">"
s=s&"<tr>"
s=s&"<td width=""40%"">"

s=s&"</td>"
s=s&"<td width=""60%"">"
s=s&"ข้อมูลของ"&"&nbsp"&"&nbsp"&"&nbsp"	
s=s&"<a href=" & "ResReserve3.asp?"&"name="&n& ">"&n & " >></a><br>"	
s=s&"</td>"
's=s&"<td width=""20%"">"

's=s&"</td>"
s=s&"</tr>"
s=s&"</table>"

'Response.Write( "ข้อมูลของ"&"&nbsp"&"&nbsp"&"&nbsp")	
'Response.Write( "<a href=" & "ResReserve3.asp?"&"name="&n& ">"&n & " >></a><br>")	
Response.Write(s)
ComeIn=1										
End Function


'***************************************************
if ty="None" then
  	if view="None" then
     	if star="None" then
	   		if dis="None" then		
				if price="None" then
				
				For i=0 To resnum-1
					MakeLink(Res_name(i))
				Next
				
				end if
			end if
		end if
	end if
end if		
'***************************************************
if ty="None" then
  	if view="None" then
     	if star="None" then
	   		if dis="None" then		
				if price<>"None" then
				
				For i=0 To resnum-1
					if (Res_price(i)=price) then					
						MakeLink(Res_name(i))
					end if
				Next				
				
				
				end if
			end if
		end if
	end if
end if	

'*******************************************************
						
if ty="None" then
	if view="None" then
		if star="None" then
			if dis<>"None" then
				if price="None" then
				
				For i=0 To resnum-1
					if (Dis_name(i)=dis) then
					MakeLink(Res_name(i))
					end if
				Next
				
				end if
			end if
		end if
	end if
end if
'**********************************************************************************	

if ty="None" then
	if view="None" then
		if star="None" then
			if dis<>"None" then
				if price<>"None" then
				
				For i=0 To resnum-1
					if (Dis_name(i)=dis) then
						if (Res_price(i)=price) then
							MakeLink(Res_name(i))
						end if
					end if
				Next
				
				end if
			end if
		end if
	end if
end if

'**********************************************************************************						
if ty="None" then
	if view="None" then
		if star<>"None" then
			if dis="None" then
				if price="None" then
			
				For i=0 To resnum-1
					if (Res_star(i)=star) then
					MakeLink(Res_name(i))
					end if
				Next
				
				end if
			end if
		end if
	end if
end if
'**********************************************************************************						
if ty="None" then
	if view="None" then
		if star<>"None" then
			if dis="None" then
				if price<>"None" then
			
				For i=0 To resnum-1
					if (Res_star(i)=star) then
						if (Res_price(i)=price) then
							MakeLink(Res_name(i))
						end if
					end if
				Next
				
				end if
			end if
		end if
	end if
end if
'**********************************************************************************							
if ty="None" then
	if view="None" then
		if star<>"None" then
			if dis<>"None" then	
				if price="None" then					

				For i=0 To resnum-1
					if (Dis_name(i)=dis) then
						if (Res_star(i)=star) then
							MakeLink(Res_name(i))
						end if
					end if
				Next
				
				end if
			end if
		end if
	end if
end if
'**********************************************************************************							
if ty="None" then
	if view="None" then
		if star<>"None" then
			if dis<>"None" then	
				if price<>"None" then					

				For i=0 To resnum-1
					if (Dis_name(i)=dis) then
						if (Res_star(i)=star) then
							if (Res_price(i)=price) then
								MakeLink(Res_name(i))
							end if
						end if
					end if
				Next
				
				end if
			end if
		end if
	end if
end if
'****************************	******************************************					
if ty="None" then
	if view<>"None" then
		if star="None" then
			if dis="None" then
				if price="None" then
				
				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
								MakeLink(Res_name(i))
							end if
						Next
					end if
				Next
	
				end if
			end if
		end if
	end if
end if
'****************************	******************************************					
if ty="None" then
	if view<>"None" then
		if star="None" then
			if dis="None" then
				if price<>"None" then
				
				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
								if (Res_price(i)=price) then
									MakeLink(Res_name(i))
								end if
							end if
						Next
					end if
				Next
	
				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty="None" then
	if view<>"None" then
		if star="None" then
			if dis<>"None" then
				if price="None" then
				
				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
								if (Dis_name(i)=dis) then
									MakeLink(Res_name(i))
								end if
							end if
						Next
					end if
				Next
				
				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty="None" then
	if view<>"None" then
		if star="None" then
			if dis<>"None" then
				if price<>"None" then
				
				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
								if (Dis_name(i)=dis) then
									if (Res_price(i)=price) then
										MakeLink(Res_name(i))
									end if
								end if
							end if
						Next
					end if
				Next
				
				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty="None" then
	if view<>"None" then
		if star<>"None" then
			if dis="None" then
				if price="None" then

				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
									if (Res_star(i)=star) then
										MakeLink(Res_name(i))
									end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty="None" then
	if view<>"None" then
		if star<>"None" then
			if dis="None" then
				if price<>"None" then

				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
									if (Res_star(i)=star) then
										if (Res_price(i)=price) then
											MakeLink(Res_name(i))
										end if
									end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty="None" then
	if view<>"None" then
		if star<>"None" then
			if dis<>"None" then
				if price="None" then
				
				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
								if (Res_star(i)=star) then
									if (Dis_name(i)=dis) then
										MakeLink(Res_name(i))
									end if
								end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty="None" then
	if view<>"None" then
		if star<>"None" then
			if dis<>"None" then
				if price<>"None" then
				
				For j=0 To viewnum-1
					if ( Res_viename(j)=view) then
						For i=0 To resnum-1	
							if (Res_vieorder(j)=Res_vieorder2(i)) then
								if (Res_star(i)=star) then
									if (Dis_name(i)=dis) then
										if (Res_price(i)=price) then
											MakeLink(Res_name(i))
										end if
									end if
								end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star="None" then
			if dis="None" then
				if price="None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								MakeLink(Res_name(i))
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star="None" then
			if dis="None" then
				if price<>"None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								if (Res_price(i)=price) then
									MakeLink(Res_name(i))
								end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star="None" then
			if dis<>"None" then
				if price="None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								if (Dis_name(i)=dis) then
									MakeLink(Res_name(i))
								end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star="None" then
			if dis<>"None" then
				if price<>"None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								if (Dis_name(i)=dis) then
									if (Res_price(i)=price) then
										MakeLink(Res_name(i))
									end if
								end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star<>"None" then
			if dis="None" then
				if price="None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								if (Res_star(i)=star) then
									MakeLink(Res_name(i))
								end if
							end if
						Next
					end if
				Next				
				
				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star<>"None" then
			if dis="None" then
				if price<>"None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								if (Res_star(i)=star) then
									if (Res_price(i)=price) then
										MakeLink(Res_name(i))
									end if
								end if
							end if
						Next
					end if
				Next				
				
				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star<>"None" then
			if dis<>"None" then
				if price="None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								if (Res_star(i)=star) then
									if (Dis_name(i)=dis) then
										MakeLink(Res_name(i))
									end if
								end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view="None" then
		if star<>"None" then
			if dis<>"None" then
				if price<>"None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								if (Res_star(i)=star) then
									if (Dis_name(i)=dis) then
										if (Res_price(i)=price) then
											MakeLink(Res_name(i))
										end if
									end if
								end if
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star="None" then
			if dis="None" then
				if price="None" then
	
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											MakeLink(Res_name(i))
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star="None" then
			if dis="None" then
				if price<>"None" then
	
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											if (Res_price(i)=price) then
												MakeLink(Res_name(i))
											end if
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star="None" then
			if dis<>"None" then
				if price="None" then

				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											if (Dis_name(i)=dis) then
												MakeLink(Res_name(i))
											end if
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star="None" then
			if dis<>"None" then
				if price<>"None" then

				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											if (Dis_name(i)=dis) then
												if (Res_price(i)=price) then
													MakeLink(Res_name(i))
												end if
											end if
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star<>"None" then
			if dis="None" then
				if price="None" then

				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											if (Res_star(i)=star) then
												MakeLink(Res_name(i))
											end if
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star<>"None" then
			if dis="None" then
				if price<>"None" then

				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											if (Res_star(i)=star) then
												if (Res_price(i)=price) then
													MakeLink(Res_name(i))
												end if
											end if
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star<>"None" then
			if dis<>"None" then
				if price="None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											if (Res_star(i)=star) then
												if (Dis_name(i)=dis) then
													MakeLink(Res_name(i))
												end if
											end if
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if

'****************************	******************************************						
if ty<>"None" then
	if view<>"None" then
		if star<>"None" then
			if dis<>"None" then
				if price<>"None" then
				
				For j=0 To typenum-1
					if (Res_typname(j)=ty) then
						For i=0 To resnum-1
							if (Res_typorder(j)=Res_typorder2(i)) then
								For k=0 To viewnum-1
									if ( Res_viename(k)=view) then
										if (Res_vieorder(k)=Res_vieorder2(i)) then
											if (Res_star(i)=star) then
												if (Dis_name(i)=dis) then
													if (Res_price(i)=price) then
														MakeLink(Res_name(i))
													end if
												end if
											end if
										end if
									end if
								Next
							end if
						Next
					end if
				Next

				end if
			end if
		end if
	end if
end if
'****************************	******************************************
Response.Write( "<CENTER><br><br><a href=" & "ResReserve.asp" & " ><< กลับไปหน้าก่อน </a><br><br></CENTER>")	

if (ComeIn=0) then
Response.Write("<CENTER><br><br>ไม่มีข้อมูลใน Scope ที่ท่านได้กำหนด<br><br></CENTER>")
end if
Response.Write"</form>"
</script>
</HTML>