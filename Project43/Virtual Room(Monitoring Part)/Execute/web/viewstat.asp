<html>
<head><title>View Computer Stats-<<ดูข้อมูลการใช้งานเครื่อง>></title>
<META http-equiv=Refresh content=240>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<META http-equiv=PRAGMA content=NO-CACHE>
<META http-equiv=expires content=0>
<META http-equiv=Cache-Control content=no-cache>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>
</head>
<body bgcolor = #ffffff>
<div id="com" style="position:absolute; left:20px; top:50px; width:640px; height:60px; z-index:1">
<%
'อ่าน status
FilePath2 = server.mappath("\profile.txt")
ForReading=1
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.OpenTextFile(FilePath2,ForReading) 
status = a.readLine()
ip = a.readLine()
a.Close
logonip = Request.ServerVariables("REMOTE_ADDR")
if ((status="Logon") and (ip = logonip)) then
%>
<a class = mylink  href="aspview.asp">ข้อมูลเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="printer.asp">ข้อมูลเครื่องพิมพ์</a><font class=bluefont> | </font>
<font class = blackfont>สถิติการใช้งานเครื่อง</font></a><font class=bluefont> | </font><a class = mylink  href="edit.asp">แก้ไข</a><font class=bluefont> | </font>
<a class = mylink  href="shutdown.asp">ปิดเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="index.asp">หน้าแรก</a><font class=bluefont> | </font>
<a class = mylink href="stat.asp">ก่อนหน้า</a><font class=bluefont> | </font>
<a class = mylink href="logout.asp">จบการทำงาน</a>
<%
else
%>
<a class = mylink  href="aspview.asp">ข้อมูลเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="printer.asp">ข้อมูลเครื่องพิมพ์</a><font class=bluefont> | </font>
<font class = blackfont>สถิติการใช้งานเครื่อง</font></a><font class=bluefont> | </font>
<a class = mylink href="index.asp">หน้าแรก</a><font class=bluefont> | </font>
<a class = mylink href="stat.asp">ก่อนหน้า</a>
<%
end if
%>
</div>

<div id="com" style="position:absolute; left:650px; top:20px; width:60px; height:60px; z-index:1">
<img src="tv3.gif" width="60" height="60"></img>
</div>

<div id="ping" style="position:absolute; left:50px; top:100px; width:300px; height:300px; z-index:1">
<%
'กำหนดตัวแปรเพื่อใช้ในการคำนวณ
  intTime = 0
  intHour = 0
  intMin = 0
'ข้อมูลจากตาราง ping
  myid=Request.QueryString("thisid")
  mysql = "SELECT id,ip,date,usagetime FROM ping t1 where id =" & myid & " and 6 >= (SELECT count(*) FROM ping  t2 WHERE id =" & myid & " and (t1.date<t2.date)) ORDER BY date DESC"
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.open "data"," "," "
  Set RS = Conn.Execute(mysql)
  if (RS.EOF = TRUE ) then
%>
<center>
<font class = blackfont>ไม่มีข้อมูล เวลาเปิดเครื่อง</font>
</center>
<%
   else
   RS.MoveFirst
%>
<font><b>ข้อมูลเวลาเปิดเครื่อง</b></font><br>
<table border = 0 cellpadding = 2 cellspacing = 2>
<%Do While Not RS.EOF%>
<%intTime = RS(3)
	  intMin = intTime mod 60
	  intHour = (intTime - intMin)/60
%>
<tr>
<td><font class = beauty1font><%Response.Write RS(2)%></font></td><td><font class = blackfont> เวลาเปิดเครื่อง</font></td> 
<%if (intHour > 0) then%>
<td align = right><font class = beauty2font><%Response.Write intHour%></font></td><td><font class = blackfont> ชั่วโมง</font></td>
<%else%>
<td><font class = beauty2font></font></td><td><font class = blackfont></font></td>
<%end if%>
<td align = right><font class = beauty2font><%Response.Write intMin%></font></td><td><font class = blackfont> นาที</font></td>
</tr>
<%
RS.MoveNext
Loop
%>
</table>
<hr>
<%
RS.Close
%>

<%
'เวลาเฉลี่ย
  myid=Request.QueryString("thisid")
  mysql = "SELECT avg(usagetime) FROM ping where id =" & myid
  Set RS = Conn.Execute(mysql)
%>
<%intTime = RS(0)
	  intMin = intTime mod 60
	  intHour = (intTime-intMin)/60
%>
<font class = blackfont>  เวลาเปิดเครื่องเฉลี่ย </font>
<%if (intHour > 0) then%>
<font class = beauty1font><%Response.Write Round(intHour)%></font><font class = blackfont> ชั่วโมง</font>
<%end if%> 
<font class = beauty1font><%Response.Write intMin%></font><font class = blackfont> นาที/วัน</font>
<%
RS.Close
end if
%>
</div>

<div id="stat" style="position:absolute; left:400px; top:100px; width:300px; height:300px; z-index:1">
<%
'ข้อมูลจากเอเจนต์
  myid=Request.QueryString("thisid")
  mysql = "SELECT id,ip,date,usagetime FROM stat t1 where id =" & myid & " and 5 >= (SELECT count(*) FROM stat  t2 WHERE id =" & myid & " and (t1.date<t2.date)) ORDER BY date DESC"
  Set RS = Conn.Execute(mysql)
  if (RS.EOF = TRUE ) then
%>
<center>
<font class = blackfont>ไม่มีข้อมูล เวลาใช้งาน</font>
</center>
<%
   else
   RS.MoveFirst
   strDate = Date()
   strDay = day(strDate)
   if  Len(strDay) =1 Then strDay = "0" & strDay
   strMonth = month(strDate)
   if Len(strMonth) = 1 Then strMonth = "0" & strMonth
   strYear = year(strDate)
%>
<font><b>ข้อมูลเวลาใช้งาน</b></font><br>
<table border = 0 cellpadding = 2 cellspacing = 2>
<tr><td><font class = beauty1font><%Response.Write strDay & "/" & strMonth & "/" & strYear%></font></td><td><font class = blackfont> เวลาใช้งาน</font></td><td></td><td></td><td>-</td><td><font class = blackfont> นาที</font></td>
<%Do While Not RS.EOF%>
<%intTime = RS(3)
	  intMin = intTime mod 60
	  intHour = (intTime-intMin)/60
%>
<tr>
<td><font class = beauty1font><%Response.Write RS(2)%></font></td><td><font class = blackfont> เวลาใช้งาน</font></td> 
<%if (intHour > 0) then%>
<td align = right><font class = beauty2font><%Response.Write intHour%></font></td><td><font class = blackfont> ชั่วโมง</font></td>
<%else%>
<td><font class = beauty2font></font></td><td><font class = blackfont></font></td>
<%end if%>
<td align = right><font class = beauty2font><%Response.Write intMin%></font></td><td><font class = blackfont> นาที</font></td>
</tr>
<%
RS.MoveNext
Loop
%>
</table>
<hr>
<%
RS.Close
%>

<%
'เวลาเฉลี่ย
  myid=Request.QueryString("thisid")
  mysql = "SELECT avg(usagetime) FROM stat  where id =" & myid
  Set RS = Conn.Execute(mysql)
%>
<%intTime = RS(0)
	  intMin = intTime mod 60
	  intHour = (intTime-intMin)/60
%>
<font class = blackfont> เวลาใช้งานเฉลี่ย </font>
<%if (intHour > 0) then%>
<font class = beauty1font><%Response.Write Round(intHour)%></font><font class = blackfont> ชั่วโมง</font> 
<%end if%>
<font class = beauty1font><%Response.Write intMin%></font><font class = blackfont> นาที/วัน</font> 
<%
RS.Close
Conn.Close
end if
%>
</div>
</body>  
<html>