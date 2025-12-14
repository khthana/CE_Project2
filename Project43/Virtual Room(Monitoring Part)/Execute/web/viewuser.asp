<html>
<head><title>View User Stats-<<ดูข้อมูลการใช้งานของนักศึกษา>></title>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<META http-equiv=PRAGMA content=NO-CACHE>
<META http-equiv=expires content=0>
<META http-equiv=Cache-Control content=no-cache>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>
</head>
<body bgcolor = #ffffff>
<div id="com" style="position:absolute; left:650px; top:20px; width:60px; height:60px; z-index:1">
<img src="tv3.gif" width="60" height="60"></img>
</div>

<div id="user" style="position:absolute; left:50px; top:20px; width:300px; height:300px; z-index:1">
<%
'ข้อมูลจากตาราง user
  myname=Request.QueryString("name")
  mysql = "SELECT username,date,usagetime FROM user WHERE username = " & "'" & myname & "'" & " ORDER BY date DESC"
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.open "data"," "," "
  Set RS = Conn.Execute(mysql)
  if (RS.EOF = TRUE ) then
%>
<center>
<font class = blackfont>ไม่มีข้อมูล เวลาใช้งาน</font>
</center>
<%
   else
   RS.MoveFirst
%>
<font><b>ข้อมูล เวลาใช้งาน</b></font><br>
<table border = 0 cellpadding = 2 cellspacing = 2>
<%Do While Not RS.EOF%>
<%intTime = RS(2)
	  intHour = Round(intTime/60)
	  intMin = Round(intTime mod 60)
%>
<tr>
<td><font class = beauty1font><%Response.Write RS(1)%></font></td><td><font class = blackfont> เวลาใช้งาน</font></td> 
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
  myname=Request.QueryString("name")
  mysql = "SELECT avg(usagetime) FROM user WHERE username = " & "'" & myname & "'"
  Set RS = Conn.Execute(mysql)
%>
<%intTime = RS(0)
	  intHour = Round(intTime/60)
	  intMin = Round(intTime mod 60)
%>
<font class = blackfont>  เวลาใช้งานเฉลี่ย </font>
<%if (intHour > 0) then%>
<font class = beauty1font><%Response.Write round(RS(0)/60)%></font><font class = blackfont> ชั่วโมง</font>
<%end if%> 
<font class = beauty1font><%Response.Write round(RS(0) mod 60)%></font><font class = blackfont> นาที/วัน</font>
<%
RS.Close
end if
%>
</div>
</body>  
<html>