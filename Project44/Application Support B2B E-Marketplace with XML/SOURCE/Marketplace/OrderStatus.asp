<%response.Buffer = true ' เพราะจะใช้ Response.redirect
if session("type")="seller" then

response.redirect "SellerOrderStatus.asp"
end if
if session("type")="buyer" then

response.redirect "BuyerOrderStatus.asp"

end if
%>