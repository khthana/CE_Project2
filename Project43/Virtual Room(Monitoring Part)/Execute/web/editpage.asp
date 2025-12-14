<html>
<head><title>Edit Computer Details-<<แก้ไขข้อมูลเครื่อง>></title>
<META http-equiv=Refresh content=240>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<META http-equiv=PRAGMA content=NO-CACHE>
<META http-equiv=expires content=0>
<META http-equiv=Cache-Control content=no-cache>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>

</head>
<body bgcolor = #ffffff>
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
%>
	<div id="com" style="position:absolute; left:650px; top:20px; width:60px; height:60px; z-index:1">
	<img src="tv3.gif" width="60" height="60"></img>
	</div>
	<div id="com" style="position:absolute; left:20px; top:20px; width:640px; height:30px; z-index:1">
	<a class = mylink  href="aspview.asp">ข้อมูลเครื่อง</a><font class=bluefont> | </font>
	<a class = mylink  href="printer.asp">ข้อมูลเครื่องพิมพ์</a><font class=bluefont> | </font>
	<a class = mylink  href="stat.asp">สถิติการใช้งานเครื่อง</a><font class=bluefont> | </font>
	<font class = blackfont>แก้ไข</font><font class=bluefont> | </font>
	<a class = mylink  href="shutdown.asp">ปิดเครื่อง</a><font class=bluefont> | </font>
	<a class = mylink  href="index.asp">หน้าแรก</a><font class=bluefont> | </font>
	<a class = mylink href="edit.asp">ก่อนหน้า</a><font class=bluefont> | </font>
	<a class = mylink href="logout.asp">จบการทำงาน</a>
	</div>
<%
sql=request.form("sql")
if sql<>"" then
  myid=Request.Form("ID")	
  mysql = "Select ID,IP,CompName,CPU,Speed,Ram,Harddisk,CDRom,Sound,OS,Xposition,Yposition from details where ID =" & myid
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.Open "data"," "," "
  Set RS = Server.CreateObject("ADODB.Recordset")
  RS.Open mysql,Conn,1,2
  RS("CPU") = Request.Form("CPU")
  RS("Speed") = Request.Form("Speed")
  RS("Ram") = Request.Form("Ram")
  RS("Harddisk") = Request.Form("Harddisk")
  RS("CDRom") = Request.Form("CDRom")
  RS("Sound") = Request.Form("Sound")
  RS("OS") = Request.Form("OS")
  RS.Update
  set RS = nothing
  Conn.Close
else
  myid=Request.QueryString("thisid")
end if
  mysql = "Select ID,IP,CompName,CPU,Speed,Ram,Harddisk,CDRom,Sound,OS,Xposition,Yposition from details where ID =" & myid
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.open "data"," "," "
  Set RS = Conn.Execute(mysql)
  RS.MoveFirst
%>

<br><br><br><br>
<%Do While Not RS.EOF%>
<center>
<form action="editpage.asp" method="post">
<table border="1" height="165" cellpadding = 1 cellspacing = 2>
<tr><td><Font class = ebbfont >&nbsp;ID                      	
	</Font></td><td><Font class = bbfont >&nbsp;<input type="text" name ="ID" readOnly = "true" value=<% =(RS("ID")) %>></Font></td></tr>
<tr><td><Font class = ebbfont >&nbsp;IP Address      	
	</Font></td><td><Font class = bbfont >&nbsp;<input type="Text" name ="IP" readOnly = "true" value=<% =(RS("IP")) %>></Font></td></tr>
<tr><td><Font class = ebbfont >&nbsp;Computer Name	
	</Font></td><td><Font class = bbfont >&nbsp;<input type="Text" name ="CompName" readOnly = "true" value=<% =(RS("CompName")) %>></Font></td></tr>
<tr><td><Font class = ebbfont >&nbsp;CPU                	
	</Font></td><td><Font class = bbfont >&nbsp;<Select name ="CPU"></Font>
		<option selected value ="<% =(RS("CPU")) %>"><% =(RS("CPU")) %></option>
		<option value ="486">486</option>
		<option value ="Pentium">Pentium</option>
		<option value ="Pentium Pro">Pentium Pro</option>
		<option value ="Pentium MMX">Pentium MMX</option>
		<option value ="Pentium II">Pentium II</option>
		<option value ="Celeron">Celeron</option>
		<option value ="Pentium III">Pentium III</option>
		<option value ="Pentium 4">Pentium 4</option>
		<option value ="K6">K6</option>
		<option value ="K6-2">K6-2</option>
		<option value ="K7">K7</option>
		<option value ="Atlon">Atlon</option>
		<option value ="Duron">Duron</option>
	</select></td></tr>
<tr><td><Font class = ebbfont >&nbsp;CPU Speed    	
	</Font></td><td><Font class = bbfont >&nbsp;<Select name ="Speed"></Font>
		<option selected value ="<% =(RS("Speed")) %>"><% =(RS("Speed")) %></option>
		<option value ="33">33</option>
		<option value ="66">66</option>
		<option value ="100">100</option>
		<option value ="133">133</option>
		<option value ="166">166</option>
		<option value ="200">200</option>
		<option value ="233">233</option>
		<option value ="250">250</option>
		<option value ="266">266</option>
		<option value ="300">300</option>
		<option value ="333">333</option>
		<option value ="350">350</option>
		<option value ="366">366</option>
		<option value ="400">400</option>
		<option value ="433">433</option>
		<option value ="450">450</option>
		<option value ="466">466</option>
		<option value ="500">500</option>
		<option value ="533">533</option>
		<option value ="550">550</option>
		<option value ="566">566</option>
		<option value ="600">600</option>
		<option value ="633">633</option>
		<option value ="650">650</option>
		<option value ="666">666</option>
		<option value ="700">700</option>
		<option value ="733">733</option>
		<option value ="750">750</option>
		<option value ="766">766</option>
		<option value ="800">800</option>
		<option value ="833">833</option>
		<option value ="850">850</option>
		<option value ="866">866</option>
	</select></td></tr>
<tr><td><Font class = ebbfont >&nbsp;Ram    		
	</Font></td><td><Font class = bbfont >&nbsp;<Select name ="Ram"></Font>
		<option selected value ="<% =(RS("Ram")) %>"><% =(RS("Ram")) %></option>
		<option value ="16">16</option>
		<option value ="24">24</option>
		<option value ="32">32</option>
		<option value ="48">48</option>
		<option value ="64">64</option>
		<option value ="96">96</option>
		<option value ="128">128</option>
		<option value ="256">256</option>
		<option value ="512">512</option>
	</select></td></tr>
<tr><td><Font class = ebbfont >&nbsp;Harddisk    	
	</Font></td><td><Font class = bbfont >&nbsp;<Select name ="Harddisk"></Font><br>
		<option selected value ="<% =(RS("Harddisk")) %>"><% =(RS("Harddisk")) %></option>
		<option value ="1.2">1.2</option>
		<option value ="2.1">2.1</option>
		<option value ="3.2">3.2</option>
		<option value ="4.8">4.8</option>
		<option value ="6.4">6.4</option>
		<option value ="8.2">8.2</option>
		<option value ="10.2">10.2</option>
		<option value ="20.5">20.5</option>
	</select></td></tr>
<tr><td><Font class = ebbfont >&nbsp;CD Rom    	
	</Font></td><td><Font class = bbfont >&nbsp;<Select name ="CDRom"></Font><br> 
		<option selected value ="<% =(RS("CDRom")) %>"><% =(RS("CDRom")) %></option>
		<option value ="Yes">Yes</option>
		<option value ="No">No</option>
	</select></td></tr>
<tr><td><Font class = ebbfont >&nbsp;Sound Card    	
	</Font></td><td><Font class = bbfont >&nbsp;<Select name ="Sound"></Font><br>
		<option selected value ="<% =(RS("Sound")) %>"><% =(RS("Sound")) %></option>
		<option value ="Yes">Yes</option>
		<option value ="No">No</option>
	</select></td></tr>
<tr><td><Font class = ebbfont >&nbsp;OS     		
	</Font></td><td><Font class = bbfont >&nbsp;<Select name ="OS"></Font><br>
		<option selected value ="<% =(RS("OS")) %>"><% =(RS("OS")) %></option>
		<option value ="Windows 95">Windows 95</option>
		<option value ="Windows 98">Windows 98</option>
		<option value ="Windows ME">Windows ME</option>
		<option value ="Windows NT">Windows NT</option>
		<option value ="Windows 2000">Windows 2000</option>
	</select></td></tr>
</table><br>
<input type="hidden" name="sql" value="change">
<input type="submit" name="submit" value="UPDATE">
<input type="reset" name="reset" value="RESET">
</form>
</center>
<%
RS.MoveNext
Loop
RS.Close
Conn.Close
%>

<%
end if
%>
</body>  
<html>