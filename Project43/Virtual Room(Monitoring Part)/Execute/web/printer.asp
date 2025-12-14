<Html>
<Head>
<META name=VI60_defaultClientScript content=JavaScript>
<META http-equiv=Refresh content=20>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<META http-equiv=PRAGMA content=NO-CACHE>
<META http-equiv=expires content=0>
<META http-equiv=Cache-Control content=no-cache>
<Title>View Printer Details-<<ข้อมูลการใช้งานเครื่องพิมพ์>></Title>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>
<Body bgcolor=#ffffff>

<div id="menu" style="position:absolute; left:20px; top:50px; width:580px; height:60px; z-index:1">
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
<font class = blackfont>ข้อมูลเครื่องพิมพ์</font><font class=bluefont> | </font>
<a class = mylink  href="stat.asp">สถิติการใช้งานเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="edit.asp">แก้ไข</a><font class=bluefont> | </font>
<a class = mylink  href="shutdown.asp">ปิดเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="index.asp">หน้าแรก</a><font class=bluefont> | </font>
<a class = mylink href="logout.asp">จบการทำงาน</a>
<%
else
%>
<a class = mylink  href="aspview.asp">ข้อมูลเครื่อง</a><font class=bluefont> | </font>
<font class = blackfont>ข้อมูลเครื่องพิมพ์</font><font class=bluefont> | </font>
<a class = mylink  href="stat.asp">สถิติการใช้งานเครื่อง</a><font class=bluefont> | </font>
<a class = mylink href="index.asp">หน้าแรก</a>
<%
end if
%>
</div>

<div id="pic" style="position:absolute; left:650px; top:20px; width:60px; height:60px; z-index:1">
<img src="tv3.gif" width="60" height="60"></img>
</div>

<div id="table" style="position:absolute; left:100px; top:100px; width:600px; height:200px; z-index:1">
<center>
<table cellpadding = 5 cellspacing =1 border=1>
<tr>
<td align = center><font class = bbfont>ลำดับที่</font></td>
<td align = center><font class = bbfont>พรินเตอร์</font></td>
<td align = center><font class = bbfont>เอกสาร</font></td>
<td align = center><font class = bbfont>สถานะ</font></td>
<td align = center><font class = bbfont>เจ้าของ</font></td></tr>
<%
'อ่านข้อมูล 
FilePath3 = server.mappath("\spool.txt")
ForReading=1
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.OpenTextFile(FilePath3,ForReading) 
do while not a.AtEndOfStream
info = a.readLine()
length = len(info)
pos = instr (info,";")
id = left(info,pos-1)
info = right(info,length-pos)

length = len(info)
pos = instr (info,";")
prnt = left(info,pos-1)
info = right(info,length-pos)

length = len(info)
pos = instr (info,";")
pages = left(info,pos-1)
info = right(info,length-pos)

length = len(info)
pos = instr (info,";")
docname = left(info,pos-1)
info = right(info,length-pos)

length = len(info)
pos = instr (info,";")
status = left(info,pos-1)

owner = right(info,length-pos)

Response.Write("<tr><td><font class = normfont>"&prnt&"</font></td><td><font class = normfont>"&id&"</font></td><td><font class = normfont>"&docname&"</font></td><td><font class = normfont>"&status&"</font></td><td><font class = normfont>"&owner&"</font></td></tr>")
loop
a.Close
%>

</table>
</center>
</div>
</Body>
</Html>

