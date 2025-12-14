<html>
		<head>
		<meta http-equiv='content-type' content='text/html;charset=window-874'>
		</head>
		
	<script language="vbscript" runat="server"> 
DIM Stuff, myFSO, WriteStuff, source, number, description

Stuff =Stuff&"<?xml version='1.0' encoding='UTF-16' standalone='yes'?>"
Stuff =Stuff&"<RESERVESS>"
Stuff =Stuff&"<RESERVESSS TYPE=""FLIGHT"">"

Stuff =Stuff&"<AIRLINE>"
Stuff =Stuff&Request.QueryString("Airline")
response.write(Request.QueryString("Airline"))
Stuff =Stuff&"</AIRLINE>"

Stuff =Stuff&"<FLIGHTORIGIN>"
Stuff =Stuff&Request.QueryString("Flightorigin")
response.write(Request.QueryString("Flightorigin"))
Stuff =Stuff&"</FLIGHTORIGIN>"

Stuff =Stuff&"<FLIGHTDESTINATION>"
response.write(Request.QueryString("Flightdestination"))
Stuff =Stuff&Request.QueryString("Flightdestination")
Stuff =Stuff&"</FLIGHTDESTINATION>"

Stuff =Stuff&"<DEPARTURE>"
response.write(Request.QueryString("Departure"))
'Stuff =Stuff&Request.QueryString("Departure")
Stuff =Stuff&Request.QueryString("Din")&"/"&Request.QueryString("Min")&"/"&Request.QueryString("Yin")
Stuff =Stuff&"</DEPARTURE>"

Stuff =Stuff&"<FLIGHTINFO>"
response.write(Request.QueryString("Flightinfo"))
Stuff =Stuff&Request.QueryString("Flightinfo")
Stuff =Stuff&"</FLIGHTINFO>"

Stuff =Stuff&"<RETURN>"
response.write(Request.QueryString("Return"))
'Stuff =Stuff&Request.QueryString("Return")
Stuff =Stuff&Request.QueryString("Dout")&"/"&Request.QueryString("Mout")&"/"&Request.QueryString("Yout")
Stuff =Stuff&"</RETURN>"

Stuff =Stuff&"<CLASS>"
response.write(Request.QueryString("Class"))
Stuff =Stuff&Request.QueryString("Class")
Stuff =Stuff&"</CLASS>"

Stuff =Stuff&"<QUANTITY>"
response.write(Request.QueryString("Quantity"))
Stuff =Stuff&Request.QueryString("Quantity")
Stuff =Stuff&"</QUANTITY>"

Stuff =Stuff&"</RESERVESSS>"
Stuff =Stuff&"</RESERVESS>"


response.write(Request.QueryString("Airline"))
response.write(Request.QueryString("Flightorigin"))
response.write(Request.QueryString("Flightdestination"))
response.write(Request.QueryString("Departure"))
response.write(Request.QueryString("Flightinfo"))
response.write(Request.QueryString("Return"))
response.write(Request.QueryString("Class"))
response.write(Request.QueryString("Quantity"))


SET myFSO = CreateObject("Scripting.FileSystemObject") 
SET WriteStuff = myFSO.OpenTextFile(Server.MapPath("AirlineReserve.xml"), 8, true)
WriteStuff.WriteLine(Stuff) 
WriteStuff.Close 
response.write "<H2>All Data already generate into XML file</H2>"
SET WriteStuff = NOTHING 
SET myFSO = NOTHING 

        </script>
</html>