

<HTML>
<HEAD>
    <TITLE>Error</TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
</HEAD>

<BODY
    BGCOLOR="#FFFFFF"
    TEXT=   "#000000"
    LINK=   "#FF0000"
    VLINK=  "#FF0000"
    ALINK=  "#FF0000"
>

<BLOCKQUOTE>
We are sorry, but we are unable to process your request:
<BR>
<UL>
    <FONT COLOR=""#FF0000"">
    <%
    for each errorStr in errorList
        %><LI><%= errorStr %></LI>
        <%
    next
    %>
    </FONT>
</UL>
Please go back and correct the error and try again.
</BLOCKQUOTE>

</BODY>
</HTML>
