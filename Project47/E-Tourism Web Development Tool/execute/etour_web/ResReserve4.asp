<html>
		<head>
		<meta http-equiv='content-type' content='text/html;charset=window-874'>
		</head>
		
	<script language="vbscript" runat="server"> 
DIM Stuff, myFSO, WriteStuff, source, number, description


Stuff =Stuff&"<RESERVESSS>"
Stuff =Stuff&"<RESERVESS TYPE=""RESIDENCE"">"
Stuff =Stuff&"<RES_NAME>"
Stuff =Stuff&Request.QueryString("Res_name")
Stuff =Stuff&"</RES_NAME>"
Stuff =Stuff&"<CHECKIN>"
Stuff =Stuff&Request.QueryString("Din")&"/"
Stuff =Stuff&Request.QueryString("Min")&"/"
Stuff =Stuff&Request.QueryString("Yin")
Stuff =Stuff&"</CHECKIN>"
Stuff =Stuff&"<CHECKOUT>"
Stuff =Stuff&Request.QueryString("Dout")&"/"
Stuff =Stuff&Request.QueryString("Mout")&"/"
Stuff =Stuff&Request.QueryString("Yout")
Stuff =Stuff&"</CHECKOUT>"
Stuff =Stuff&"<ROOM_TYPE>"
Stuff =Stuff&Request.QueryString("Roo_type")
Stuff =Stuff&"</ROOM_TYPE>"
Stuff =Stuff&"<QUANTITY>"
Stuff =Stuff&Request.QueryString("Rev")
Stuff =Stuff&"</QUANTITY>"
Stuff =Stuff&"</RESERVESS>"
Stuff =Stuff&"</RESERVESSS>"


SET myFSO = CreateObject("Scripting.FileSystemObject") 
SET WriteStuff = myFSO.OpenTextFile(Server.MapPath("ResReserve.xml"), 8, True)
WriteStuff.WriteLine(Stuff) 
WriteStuff.Close 
response.write "<H2>All Data already generate into XML file</H2>"
SET WriteStuff = NOTHING 
SET myFSO = NOTHING 

        </script>
</html>