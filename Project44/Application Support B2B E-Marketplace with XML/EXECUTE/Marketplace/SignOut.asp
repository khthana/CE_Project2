
<%response.Buffer = true ' เพราะจะใช้ Response.redirect%>
<%

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"
		
		Conn.Execute "Delete  From Basket Where UserSessionID='"&Session.SessionID&"'"
		Conn.Close
session.abandon
response.redirect  "home.asp"

%>
		

