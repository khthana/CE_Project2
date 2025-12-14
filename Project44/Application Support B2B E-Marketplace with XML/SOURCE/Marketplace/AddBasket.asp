<%response.Buffer = true ' เพราะจะใช้ Response.redirect%>

<%

Set Conn = Server.CreateObject("ADODB.Connection")
conn.Open="Driver={sql server}; server=market; database=marketplace;"

sql="Select Ems,Sent,FedEx,DaySent,DayEms,DayFedEx,MinOrder From Catalog,Member  Where SellerID=ID AND ItemID="&request("hiddenItemID")
set rs=conn.execute(sql,,cmdText)

if rs("Sent")=true then
	NeedDate=date+rs(3)
	'ShipMethod="Sent"
else if rs("Ems")=true then
	NeedDate=date+rs(4)
	'ShipMethod="Ems"
else if  rs("FedEx")=true then
	NeedDate=date+rs(5)
	'ShipMethod="FedEx"
end if
end if
end if
QtY=rs("MinOrder")
rs.close

sql="Select max(basketID) From Basket"
set rs=conn.execute(sql,,cmdText)
BasketID=rs(0)+1

response.write now 


sql="INSERT INTO Basket(BasketID,UserSessionID,ItemID,SupplierID) VALUES ( "&BasketID&","&session.SessionID&","&request("hiddenItemID")&","&request("hiddenSupplierID")&")"

conn.Execute sql,,adCmdText

sql="Select NeedDate,QTY From Basket  Where BasketID="&BasketID
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.Open sql,Conn,1,3

rs(0)=NeedDate
rs(1)=QTY
'rs(2)=shipMethod
rs.update
rs.close

response.redirect  "CreatePR.asp"
%>