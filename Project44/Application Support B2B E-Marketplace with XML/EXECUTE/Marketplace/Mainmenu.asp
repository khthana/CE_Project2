<%response.Buffer = true ' เพราะจะใช้ Response.redirect
if session("type")="seller" then

response.redirect "SupplierMenu.asp"
end if
if session("type")="buyer" then

response.redirect "BuyerMenu.asp"

end if
%>