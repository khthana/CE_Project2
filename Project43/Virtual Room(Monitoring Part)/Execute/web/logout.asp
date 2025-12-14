<Html>
<Head>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<meta http-equiv="refresh" content="2;URL=index.asp">
<Title>Logout-<<จบการทำงาน>></Title>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>
<Head>
<Body bgcolor=#ffffff>
<%

FilePath2 = server.mappath("\profile.txt")
set fs = CreateObject("Scripting.FileSystemObject")
set a = fs.CreateTextFile(FilePath2,true)
a.WriteLine("Logout")
a.WriteLine("noip")
a.Close
%>

<center>
<br>
<font class = blackfont>ขอขอบคุณ... ขณะนี้คุณจบการทำงาน ในสถานะผู้ดูแลระบบแล้ว</font><br><br>
<a class = mylink href="index.asp">หน้าแรก</a><br><br>
<img src="tv3.gif" width="60" height="60"></img>
</center>
</Body>
</Html>
