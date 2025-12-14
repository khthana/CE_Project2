<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>










<% Response.ExpiresAbsolute=DateAdd("yyyy", -10, Date) %>

<HTML>

<HEAD>
    <TITLE><%= Application("MSCSSite").DisplayName %>: Closed</TITLE>
</HEAD>

<BODY
    BGCOLOR="#FFFFFF"
    TEXT=   "#000000"
    LINK=   "#FF0000"
    VLINK=  "#FF0000"
    ALINK=  "#FF0000"
>
<FONT FACE="">
    <H1>We are sorry, but <%= Application("MSCSSite").DisplayName %> is currently closed. Please come again soon.</H1>
</FONT>
</BODY>

</HTML>
