<Html>
<Head>
<Title>View Computer Stats-<<สถิติการใช้งานเครื่อง>></Title>
<META http-equiv=Refresh content=240>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<META http-equiv=PRAGMA content=NO-CACHE>
<META http-equiv=expires content=0>
<META http-equiv=Cache-Control content=no-cache>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>

<script language="JavaScript">
<!--
function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
</Head>
<Body bgcolor=#ffffff  link=#ffffff alink=#ffffff vlink=#ffffff>
<div id="menu" style="position:absolute; left:20px; top:400px; width:580px; height:30px; z-index:1">
<%
'อ่าน status
FilePath1 = server.mappath("\passwd.txt")
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
<font class = blackfont>สถิติการใช้งานเครื่อง</font><font class=bluefont> | </font>
<a class = mylink  href="edit.asp">แก้ไข</a><font class=bluefont> | </font>
<a class = mylink  href="shutdown.asp">ปิดเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="index.asp">หน้าแรก</a><font class=bluefont> | </font>
<a class = mylink href="logout.asp">จบการทำงาน</a>
<%
else
%>
<a class = mylink  href="aspview.asp">ข้อมูลเครื่อง</a><font class=bluefont> | </font>
<a class = mylink  href="printer.asp">ข้อมูลเครื่องพิมพ์</a><font class=bluefont> | </font>
<font class = blackfont>สถิติการใช้งานเครื่อง</font><font class=bluefont> | </font>
<a class = mylink href="index.asp">หน้าแรก</a>
<%
end if
%>
</div>

<div id="pic" style="position:absolute; left:650px; top:20px; width:60px; height:60px; z-index:1">
<img src="tv3.gif" width="60" height="60"></img>
</div>

<table border="1" width="540"  height="380" cellpadding = 1 cellspacing = 1>
<tr><td>
<%
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open "data"," "," "
Set RS = Conn.Execute("Select ID,Xposition,Yposition,Status from details")
RS.MoveFirst
%>


<% Do While not RS.EOF %>	
	<div id=<% =RS("ID") %> style="position:absolute; left:<% =RS("XPosition") %>px; top:<% =RS("YPosition") %>px; width:30px; height:30px; z-index:1"><a href=viewstat.asp?thisid=<% =RS("ID")%>><img src=<% =Select_Status(RS("Status")) %> width="30" height="30" onMouseOver="MM_showHideLayers('T<% =RS("ID") %>','','show')" onMouseOut="MM_showHideLayers('T<% =RS("ID") %>','','hide')"></a></div> 		
<% 
RS.MoveNext 
Loop
RS.Close
Conn.Close
%>
	
<%
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open "data"," "," "
'change detail'
Set RS = Conn.Execute("Select ID,IP,CompName,CPU,Speed,Ram,Harddisk,CDRom,Sound,OS,Xposition,Yposition,UserName,FreeC,LoginTime,Status from details")
RS.MoveFirst
Col=RS.fields.count-1
%>
 
<% Do While not RS.EOF %>
 
<div id= T<% =RS("ID") %> style="position:absolute; left:550px; top:80px; width:230px; height:164px; z-index:2; visibility: hidden"> 
  <table width="85%" border="1" height="165" cellpadding = 1 cellspacing = 2>

<tr><td><Font class = boldfont>&nbsp;ID      	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("ID")) %></Font></td></tr>
<tr><td><Font class = boldfont>&nbsp;IP Address      	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("IP")) %></Font></td></tr>
<tr><td><Font class = boldfont>&nbsp;Name	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("CompName")) %></Font></td></tr>
<tr><td><Font class = boldfont>&nbsp;CPU                	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("CPU")) %></Font></td></tr> 
<tr><td><Font class = boldfont>&nbsp;CPU Speed    	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("Speed")) %> MHz</Font></td></tr> 
<tr><td><Font class = boldfont>&nbsp;Ram    	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("Ram")) %> MB</Font></td></tr> 
<tr><td><Font class = boldfont>&nbsp;Harddisk    	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("Harddisk")) %> GB</Font></td></tr> 
<tr><td><Font class = boldfont>&nbsp;CD Rom    	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("CDRom")) %></Font></td></tr> 
<tr><td><Font class = boldfont>&nbsp;Sound Card    	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("Sound")) %></Font></td></tr> 
<tr><td><Font class = boldfont>&nbsp;OS     	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("OS")) %></Font></td></tr>
<tr><td><Font class = boldfont>&nbsp;User Name 	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("UserName")) %></Font></td></tr>
<%if len(rs("FreeC")) > 0 then%>
<tr><td><Font class = boldfont>&nbsp;Drive C Free 	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("FreeC")) %> MB</Font></td></tr>
<%else%>
<tr><td><Font class = boldfont>&nbsp;Drive C Free 	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("FreeC")) %></Font></td></tr>
<%end if%>
<tr><td><Font class = boldfont>&nbsp;Login Time 	</Font></td><td><Font class = smallfont>&nbsp;<% =(RS("LoginTime")) %></Font></td></tr>
<tr><td><Font class = boldfont>&nbsp;Status 	</Font></td><td><Font class = smallfont>&nbsp;<% =Select_S(RS("Status"))%></Font></td></tr>
 
</table>
</div>

<% 
RS.MoveNext
Loop
RS.Close
Conn.Close
%>
</Body>
</Html>


<Script Language="VBScript" RunAT="Server">
Function Select_Status(a) 'Show Picture Computer Status
		if a=0 then  Select_Status="open.gif"     'Open
  		if a=1 then  Select_Status="close.gif"    'Close
		if a=2 then  Select_Status="login.gif"     'Login		
End Function

Function Select_S(ab) 'Select Menu On/Off
		if ab=0 then  Select_S="On"     'Open
  		if ab=1 then  Select_S="Off"	'Close
		if ab=2 then  Select_S="Login"   'Login	
End Function
</Script>

