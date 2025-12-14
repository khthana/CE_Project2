<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>



<!--#INCLUDE FILE="include/Manager.asp" -->
<%
If Request("Reload").Count <> 0 then
    ReloadSite
    Response.redirect Request("URL")
End IF

If Request("Status").Count <> 0 then
    ToggleSiteStatus
    Response.redirect Request("URL")
End IF

Call GetStatus(Status, RevStatus)
PCFFiles = GetPCFFiles
%>

<% REM   header: %>
<% pageTitle = "Site Manager: " & MSCSSite.DisplayName %>

<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>
<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<%= Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<FONT FACE="AngsanaUPC, sans-serif">


<!- กรณีที่หนึ่ง ->
<%If Request.Form("usermane") = "" And  Request.Form("password") = "" Then %>
<BR>
<H3><P ALIGN="CENTER" >ยินดีต้อนรับเข้าสู่ส่วนการจัดการข้อมูล<BR>	กรุณากรอกชื่อและรหัสผ่าน</P></H3>
<form action ="default.asp" method =post >
<table ALIGN="CENTER"  border="0" WIDTH="300">
<tr>
		<td align=right WIDTH="80">ผู้ใช้ : </td>
		<td><input type=text name="username" ></td>
</tr>
<tr>
		<td align=right>รหัสผ่าน : </td>
		<td><input type=password name="password" ></td>
</tr>
<tr>
		<td align=right></td>
		<td><input type="submit" value="  ตกลง  "> &nbsp &nbsp &nbsp
				 <input type="reset"		value="  ยกเลิก  ">
		</td>
</tr>
</table>
</form>
<!- กรณีที่สอง ->
<%ElseIf Request.Form("username") = "manager" And Request.Form("password") = "aaa" Then%>
<!- รหัสผ่านถูกต้อง จะทำ->

<TABLE BORDER="0" CELLPADDING="3" CELLSPACING="0" WIDTH="100%">
<TR>
    <TD COLSPAN="" BGCOLOR="#000000">
        <FONT SIZE="+1" COLOR="#FFFFFF">
			<FONT SIZE="+2">Site Manager: </FONT>
			<%=  MSCSSite.DisplayName %>
		</FONT>
    </TD>
</TR>
</TABLE>

<% REM   body: %>
<BR>
<TABLE BORDER="1" CELLPADDING="3" CELLSPACING="0" BORDERCOLOR="#000000">
    <TR>
        <TD ALIGN="CENTER" WIDTH="200">
            <FONT FACE="Arial, sans-serif" COLOR="black" SIZE="+1" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 14pt}"><FONT SIZE="+2" STYLE="{font-size: 18pt}">M</FONT>ERCHANDISING</FONT>
        </TD>
        <TD ALIGN="CENTER">

<TABLE BORDER="0" CELLPADDING="3">
    <TR>
        <FORM METHOD="POST" 
              ACTION="<% = tmplDept %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplDept %>"><IMG SRC="MSCS_images/admin/depts.gif" WIDTH="51" HEIGHT="41" BORDER="0" ALT="Departments"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Departments"
                     VALUE="   Plan    ">
        </TD>
        </FORM>
        <FORM METHOD="POST" 
              ACTION="<% = tmplProduct %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplProduct %>"><IMG SRC="MSCS_images/admin/home.gif" WIDTH="51" HEIGHT="41" BORDER="0" ALT="Products"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Products"
                    VALUE="  Home  ">
        </TD>
        </FORM>


        <FORM METHOD="POST" 
              ACTION="<% = tmplAttr %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplAttr %>"><IMG SRC="MSCS_images/admin/events.gif" WIDTH="51" HEIGHT="41" BORDER="0" ALT="Attributes"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Attributes"
                    VALUE=" Accessories ">
        </TD>
        </FORM>


    </TR>
</TABLE>

        </TD>
    </TR>

    <TR>
        <TD ALIGN="CENTER" WIDTH="200">
            <FONT FACE="Arial, sans-serif" COLOR="black" SIZE="+1" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 14pt}"><FONT SIZE="+2" STYLE="{font-size: 18pt}">T</FONT>RANSACTIONS</FONT>
        </TD>
        <TD ALIGN="CENTER">

<TABLE BORDER="0" CELLPADDING="3">
    <TR>
        <FORM METHOD="POST" 
              ACTION="<% = tmplOrder %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplOrder %>"><IMG SRC="MSCS_images/admin/orders.gif" WIDTH=51 HEIGHT=41 BORDER=0 ALT="Orders"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Orders"
                    VALUE=" Reserve ">
        </TD>
        </FORM>

		<FORM METHOD="POST" 
              ACTION="<% = tmplShopper %>">
		<TD ALIGN="CENTER" WIDTH="100">
			<A HREF="<% = tmplShopper %>"><IMG SRC="MSCS_images/admin/shoppers.gif" WIDTH=51 HEIGHT=41 BORDER=0 ALT="Shoppers"></A>
			<BR>
				<INPUT TYPE="SUBMIT"
					NAME="Shoppers"
					VALUE="  Shoppers  ">
		</TD>
		</FORM>

    </TR>
</TABLE>

        </TD>
    </TR>

    <TR>
        <TD ALIGN="CENTER">
            <FONT FACE="Arial, sans-serif" COLOR="black" SIZE="+1" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 14pt}"><FONT SIZE="+2" STYLE="{font-size: 18pt}">S</FONT>YSTEM</FONT>
            <P>
            <FONT FACE="Arial, sans-serif" COLOR="black" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 10pt}">Site status: [<%= status%>]</FONT>
        </TD>
        <TD ALIGN="CENTER">

<TABLE BORDER="0" CELLPADDING="3" WIDTH="100%">
<%
'		<TR>
'		<FORM METHOD="GET" ACTION="MSCS_PipeEdit/default.asp">
'        <TD ALIGN="CENTER" COLSPAN="2">
'        <% if UBound(PCFfiles,1) >= 0 then %>
 <%
'				<SELECT NAME="Filename"> 
 '                   <% For nFile = LBound(PCFfiles,1) To UBound(PCFfiles,1) %>
                        <%'= mscsPage.Option(PCFfiles(nFile),0) %> <%'= PCFfiles(nFile) %>&nbsp;
                    <%' next %>
<%'                </SELECT> 
'                <INPUT TYPE="HIDDEN" 
 '                   NAME="StoreRoot"
  '                  VALUE="<%= mscsPage.SiteRoot %><%'">
 
		'		<INPUT TYPE="SUBMIT"
         '           VALUE=" Edit Pipeline ">
       ' <% else %>
<%'            <FONT SIZE="-2">No PCF files in <%= ConfigDir %><%'<BR>Use PipeEditor.exe to create a new Order Pipeline configuration file.</FONT>%>
        <% 'end if %>
<%
      '  </TD>
       ' </FORM>
'    </TR>
'    <TR>
%>
 <TR>
	   <FORM METHOD="POST" 
             ACTION="http://<% = Request.ServerVariables("SERVER_NAME") & ":" & Request.ServerVariables("SERVER_PORT") %>/<% = mscsPage.SiteRoot %>/default.asp">
        <TD ALIGN="CENTER" COLSPAN="2">
                <INPUT TYPE="SUBMIT"
                    NAME="Shop"
                    VALUE="  Shop Site  ">
        </TD>
        </FORM>
</TR>
    <% if status <> "Invalid" then %>
<TR>
            <FORM METHOD="GET" 
                  ACTION="<%= tmplManager %>">
            <TD ALIGN="CENTER" WIDTH="50%">
                    <INPUT TYPE="SUBMIT"
                        NAME="Status"
                        VALUE="      <%= RevStatus %> Site       ">
            </TD>
            </FORM>
            <FORM METHOD="GET" 
                  ACTION="<%= tmplManager %>">
            <TD ALIGN="CENTER" WIDTH=50%>
                    <INPUT TYPE="SUBMIT"
                        NAME="Reload"
                        VALUE="     Reload Site      ">
            </TD>
            </FORM>
</TR>
    <% end if %>
 
<%
'        <FORM METHOD="GET" 
'            ACTION="MSCS_CommerceSiteBuilderWizard/load_wizard.asp"<% 
'            if status <> "Closed" then %><%' onSubmit="alert('Please close the store before running the wizard.'); return false;"<% end if %><%'>
'        <TD ALIGN="CENTER" WIDTH="50%">
'                <INPUT TYPE="HIDDEN" 
'                    NAME="storeroot"
'                    VALUE="<%= mscsPage.SiteRoot %><%'">
'                <INPUT TYPE="SUBMIT"
'                    NAME="SiteWizard"
'                    VALUE="Site Builder Wizard">
'        </TD>
'        </FORM>
'		<FORM METHOD="GET" 
'              ACTION="MSCS_CommerceSiteBuilderWizard/load_wizard.asp"<% 
'              if status <> "Closed" then %><%' onSubmit="alert('Please close the store before running the wizard.'); return false;"<% end if %><%'>
'        <TD ALIGN="CENTER">
'                <INPUT TYPE="HIDDEN" 
'                    NAME="wizard"
'                    VALUE="promo">
'                <INPUT TYPE="HIDDEN" 
'                    NAME="storeroot"
'                    VALUE="<%= mscsPage.SiteRoot %><%'">
'                <INPUT TYPE="SUBMIT"
'                    NAME="PromoWizard"
'                    VALUE="Promotions Wizard">
'        </TD>
'        </FORM>
%>    
</TABLE>
        </TD>
    </TR>
</TABLE>
<%Else%>
<!- รหัสผ่านไม่ถูกต้อง ->
<title>ใส่รหัสผ่านไม่ถูกต้อง</title>
<br>
<h1>ใส่รหัสผ่านไม่ถูกต้องกรุณาใส่ใหม่ครับ</h1>
<br>
<% End if%>
<% REM   footer: %>
<%'<!--#INCLUDE FILE="include/copyright.asp" -->	%>
