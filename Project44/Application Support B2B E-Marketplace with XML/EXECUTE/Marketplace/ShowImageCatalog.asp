
<%
id = CInt(Request.Querystring("id"))

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

sql = "Select ItemImage From Catalog Where ItemID="&id
Set rs = conn.Execute(sql)
'Response.ContentType = rs("contenttype")

'Response.ContentType="image/gif"
size = rs("ItemImage").Actualsize
picture = rs("ItemImage").GetChunk(size)
Response.BinaryWrite(picture)

%>