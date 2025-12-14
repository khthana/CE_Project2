<HEAD><TITLE>View Other User Stats-<<สถิติการใช้งานของบุคคลอื่นๆ>></TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
<META http-equiv=PRAGMA content=NO-CACHE>
<META http-equiv=expires content=0>
<META http-equiv=Cache-Control content=no-cache>
<LINK href="vroom.css" type=text/css rel=STYLESHEET>

</HEAD>
<BODY>
<H2>Other users</H2>
<hr>
<%
  mysql = "SELECT distinct username FROM user WHERE username not like 's%' ORDER BY username"
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.open "data"," "," "
  Set RS = Conn.Execute(mysql)
  RS.MoveFirst
%>

<table>
<%Do While Not RS.EOF%>
<tr><td><li><%Response.Write (RS(0))%></li>	</td><td><A href=viewuser.asp?name=<%Response.write (RS(0))%>><%Response.Write (RS(0))%></a></td><td></td></tr>
<%
RS.MoveNext
Loop

RS.Close
%>
</table>
</BODY>
</Html>
