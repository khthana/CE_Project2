<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<title>Virtual Room Project-<<ห้องเสมือนจริง>></title>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>
</head>
<body bgcolor="#ffffff">
<div id="com" style="position:absolute; left:650px; top:20px; width:60px; height:60px; z-index:1"><img src="tv3.gif" width="60" height="60"></img></div>
<div id="text" style="position:absolute; left:400px; top:20px; z-index:1">
<ul>
<li><a class = mylink href = aspview.asp>ดูข้อมูลเครื่อง</a></li>
<li><a class = mylink href = printer.asp>ดูข้อมูลเครื่องพิมพ์</a></li>
<li><a class = mylink href = stat.asp>ดูสถิติการใช้งาน</a></li>
<li><a class = mylink href = user.html>***ดูการใช้งานของผู้ใช้บริการ(เพิ่มเติม)***</a></li>
<%
FilePath1 = server.mappath("\passwd.txt")
FilePath2 = server.mappath("\profile.txt")
ForReading = 1
'อ่าน password
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.OpenTextFile(FilePath1,ForReading) 
mypasswd = a.readLine()
a.Close
'อ่าน status
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.OpenTextFile(FilePath2,ForReading) 
status = a.readLine()
ip = a.readLine()
a.Close
logonip = Request.ServerVariables("REMOTE_ADDR")
yourpasswd=request.form("passwd")
if (yourpasswd=mypasswd) or ((status="Logon") and (ip = logonip)) then
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.CreateTextFile(FilePath2,true)
ip = Request.ServerVariables("REMOTE_ADDR")
a.WriteLine("Logon")
a.WriteLine(ip)
a.Close
%>
<li><a class = mylink href = edit.asp>แก้ไขข้อมูล</a></li>
<li><a class = mylink href = shutdown.asp>ปิดเครื่อง</a></li>
<%
else
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.CreateTextFile(FilePath2,true)
a.WriteLine("Logout")
a.WriteLine("noip")
a.Close
end if
%>
</ul>
</div>

<div id="text" style="position:absolute; left:50px; top:20px; z-index:1">
<%
FilePath2 = server.mappath("\profile.txt")
ForReading = 1
'อ่าน status
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.OpenTextFile(FilePath2,ForReading) 
status = a.readLine()
ip = a.readLine()
a.Close
logonip = Request.ServerVariables("REMOTE_ADDR")
if ((status="Logon") and (ip = logonip)) then
%>
<a class = mylink href="logout.asp">จบการทำงาน</a>
<%
else
%>
<form action="index.asp" method="post" id=form1 name=form1>
<center>
<font class = normfont> For Administrator</font><br>
<input type="password" name ="passwd" value=""><br>
<input type="submit" name="submit" value="LOGIN">
</center>
</div>
</form>
<%
end if
%>
</body>
</html>