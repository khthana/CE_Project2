<Html>
<Head>
<Title>Shutdown Computer-<<ปิดเครื่อง>></Title>
<META http-equiv=Refresh content=240>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<META http-equiv=PRAGMA content=NO-CACHE>
<META http-equiv=expires content=0>
<META http-equiv=Cache-Control content=no-cache>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>

</head>
<body  bgcolor =#ffffff>
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
if ((status<>"Logon") or (ip <> logonip)) then
%>
<center>
<br>
<font class = blackfont>คุณไม่สามารถอ่านหน้านี้ได้ โปรดทำการล็อกอินก่อน!!!</font><br><br>
<a class = mylink  href="aspview.asp">ข้อมูลเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="printer.asp">ข้อมูลเครื่องพิมพ์</a><font class=bluefont> | </font>
<a class = mylink  href="stat.asp">สถิติการใช้งานเครื่อง</a><font class=bluefont> | </font>
<a class = mylink href="index.asp">หน้าแรก</a><br><br>
<img src="tv3.gif" width="60" height="60"></img>
</center>
<%
else
	if Request.Form("sql")<>"" then
		mysql = "Select ID,Xposition,Yposition,Status,Command from details"
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "data"," "," "
		Set RS = Server.CreateObject("ADODB.Recordset")
		RS.Open mysql,Conn,1,2
		RS.MoveFirst
		Do While not RS.EOF 
		myid = RS("ID")
		mycheck = "Check" & myid
		if (RS("Status")) = 2 then 'ล็อก
				if (Request.Form(mycheck))="LOGIN" then 'มีคำสั่งปิด
				RS("Command") = "Shutdown"
				RS("Status") = "1"
				end if
		end if
		RS.MoveNext 
		Loop
		RS.Close
		Conn.Close
	end if
	mysql = "Select ID,Xposition,Yposition,Status from details"
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.open "data"," "," "
	Set RS = Conn.Execute(mysql)
	RS.MoveFirst
	%>
	<form action="shutdown.asp" method="post">
	<div id="pic" style="position:absolute; left:650px; top:20px; width:60px; height:60px; z-index:1">
	<img src="tv3.gif" width="60" height="60"></img>
	</div>
	<div id="menu" style="position:absolute; left:20px; top:400px; width:580px; height:30px; z-index:1">
	<a class = mylink  href="aspview.asp">ข้อมูลเครื่อง</a><font class=bluefont> | </font>
	<a class = mylink  href="printer.asp">ข้อมูลเครื่องพิมพ์</a><font class=bluefont> | </font>
	<a class = mylink  href="stat.asp">สถิติการใช้งานเครื่อง</a><font class=bluefont> | </font>
	<a class = mylink  href="edit.asp">แก้ไข</a><font class=bluefont> | </font>
	<font class = blackfont>ปิดเครื่อง</font><font class=bluefont> | </font>
	<a class = mylink  href="index.asp">หน้าแรก</a><font class=bluefont> | </font>
	<a class = mylink href="logout.asp">จบการทำงาน</a>
	</div>
	<div id="bshutdown" style="position:absolute; left:615px; top:100px; z-index:1"><input type="submit" name="shutdown" value="SHUTDOWN"></div>
	
	<table border="1" width="540"  height="380" cellpadding = 1 cellspacing = 1>
	<tr><td>
	<% Do While not RS.EOF %>	
	<div id=<% =RS("ID") %> style="position:absolute; left:<% =RS("XPosition") %>px; top:<% =RS("YPosition") %>px; width:30px; height:30px; z-index:1"><img src=<% =Select_Status(RS("Status")) %> width="30" height="30"></div> 		
	
	<% if RS("Status")=2 then %>
	
	<div id=<% =RS("ID") %> style="position:absolute; left:<% =RS("XPosition")+18 %>px; top:<% =RS("YPosition") %>px;z-index:1">
	<input type="CheckBox" name="Check<% =RS("ID") %>"  value="<% =Checkval(RS("Status")) %>" <% =Checkme(RS("Status")) %>></div> 		
	
	<% end if %>
	
	<%	
	RS.MoveNext 
	Loop
	RS.Close
	Conn.Close
	%>

	</td></tr>
	</table>	
	<input type="hidden" name="sql" value="change">
	</Form>
	<%
	end if
	%>

</Body>
</Html>

<Script Language="VBScript" RunAT ="Server">
Function Select_Status(a) 'Show Picture Computer Status
		if a=0 then  Select_Status="open.gif"     'Open
  		if a=1 then  Select_Status="close.gif"    'Close
		if a=2 then  Select_Status="login.gif"     'Boring		
End Function

Function Checkme(sta)
	if sta = 0 then Checkme= ""
	if sta = 1 then Checkme= ""
	if sta = 2 then Checkme= "checked"
End Function

Function Checkval(sta)
	if sta = 0 then Checkval= "ON"
	if sta = 1 then Checkval= "OFF"
	if sta = 2 then Checkval= "LOGIN"
End Function
</script>