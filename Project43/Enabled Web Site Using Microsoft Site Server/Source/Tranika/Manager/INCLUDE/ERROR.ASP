

<%
REM -- error display:
if errorList.count > 0 then
    %><P><FONT FACE="Arial, sans-serif" COLOR="#FF0000" STYLE="{font-family: Arial, sans-serif; font-color: red; font-weight: bold; font-size: 10pt}">
<%  if errorList.count > 1 then 
        %><B>Please correct the following errors:<UL>
<%  else 
        %><B>Please correct the following error:<UL>
<%  end if %>
<%  for each line in errorList %>
        <LI><%= line %>
<%  next 
    %></UL></B></FONT>
<% end if %>
