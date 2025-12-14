<HTML>
<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<BR><BR><BR>
<%
	Set Upload = Server.CreateObject("Persits.Upload.1")
	Count = Upload.Save("d:\InetPub\wwwroot\tranika\assets\product_images")
%>
<TABLE BORDER="0" WIDTH="500" ALIGN="CENTER">
<%	if Count <> 0 then	%>
		<TR>
					<TD ALIGN="CENTER"><BR>Upload
					<% = Count %> File complete		</TD>
		</TR>

<% End if	%>
<% if Count = 0 then	%>
		<TR>
					<TD ALIGN="CENTER"><BR>NO Upload File	</TD>
		</TR>
<%	End if	%>
<%
	'If Upload.Expires <> CDate("9/9/9999") Then Response.Write "<HR>AspUpload expires on " & Upload.Expires
%>
		<TR>
					<TD ALIGN="CENTER"><A HREF="dept_list.asp"><BR>Click ! Come Back Plan</A><BR></TD>
		</TR>
</BODY>
</HTML>