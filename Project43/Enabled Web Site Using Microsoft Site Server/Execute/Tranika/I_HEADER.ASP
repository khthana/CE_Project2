<FONT FACE="AngsanaUPC">




<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100">
<TR>
<TD COLSPAN="3">
    <IMG SRC="<%= "/" & siteRoot %>/assets/images/logo.gif" BORDER=0 ALT="<%= displayName %>" ALIGN="LEFT">
</TD>
</TR>
</TABLE>


<% if IsEmpty(flag_navbar) then %>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="LEFT">
<TD VALIGN="TOP">
    <TR> <TD ALIGN="CENTER" VALIGN="RIGHT">
        <A HREF="<%= pageURL("about.asp") %>"><IMG SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/navbar/btnabout.gif" WIDTH="53" HEIGHT="41" BORDER="0" ALT="About" ALIGN="LEFT"></A>
    </TD><TD WIDTH="8" ROWSPAN="5">&nbsp;</TD></TR>

    <TR> <TD ALIGN="LEFT" VALIGN="TOP">
        <A HREF="<%= pageURL("default.asp") %>"><IMG SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/navbar/btnmenu.gif" WIDTH="53" HEIGHT="41" BORDER="0" ALT="Lobby" ALIGN="TOP"></A>
    </TD></TR>
    
    
    <TR> <TD ALIGN="LEFT" VALIGN="TOP">
        <A HREF="<%= pageURL("find.asp") %>"><IMG SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/navbar/btnfind.gif" WIDTH="53" HEIGHT="41" BORDER="0" ALT="Find" ALIGN="TOP"></A>
    </TD></TR>
    

    <TR> <TD ALIGN="LEFT" VALIGN="TOP">
        
        <% if Not IsNull(mscsShopperID) then %>
        
        <A HREF="<%= pageSURL("basket.asp") %>"><IMG SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/navbar/btnbskt.gif" WIDTH="53" HEIGHT="41" BORDER="0" ALT="Basket" ALIGN="TOP"></A>
        
        <% else %>
        <A HREF="<%= baseSURL("shopper_lookup.asp") & mscsPage.URLShopperArgs("target","basket.asp") %>"><IMG SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/navbar/btnbskt.gif" WIDTH="53" HEIGHT="41" BORDER="0" ALT="Basket" ALIGN="TOP"></A>
        <% end if %>
        
    </TD></TR>

    <TR> <TD ALIGN="LEFT" VALIGN="TOP">
        
        <% if Not IsNull(mscsShopperID) then %>
        
        <A HREF="<%= pageSURL("shipping.asp") %>"><IMG SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/navbar/btnpay.gif" WIDTH="53" HEIGHT="41" BORDER="0" ALT="Pay" ALIGN="TOP"></A>
        
        <% else %>
        <A HREF="<%= baseSURL("shopper_lookup.asp") & mscsPage.URLShopperArgs("target","shipping.asp") %>"><IMG SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/navbar/btnpay.gif" WIDTH="53" HEIGHT="41" BORDER="0" ALT="Pay" ALIGN="TOP"></A>
        <% end if %>
        
    </TD></TR>
    <TR><TD  COLSPAN="2" HEIGHT="200">&nbsp;</TD></TR>
</TABLE>
<% end if %>


