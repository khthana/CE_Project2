<%@ page contentType="text/html; charset=windows-874" language="java"
import="java.sql.*,java.math.*,java.lang.*" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY bgcolor="#000000">
//<!--<embed height="271"
  // 	src="http://161.246.5.111:5555/" width="307" border="1" controls="imagewindow,ControlPanel"
    //autostart="yes" loop="false"></embed>
//-->
<%
if (session.getAttribute("auth")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	else{
%>
<OBJECT  width="400" height="300"

ID="mediaPlayer"

CLASSID="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95"

CODEBASE="http://activex.microsoft.com/activex/
	controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701"

STANDBY="Loading Microsoft Windows Media Player components..."

TYPE="application/x-oleobject">

<PARAM NAME="fileName"
VALUE="http://161.246.5.132:5555/">

<PARAM NAME="animationatStart" VALUE="true">

<PARAM NAME="transparentatStart" VALUE="true">

<PARAM NAME="autoStart" VALUE="true">

<PARAM NAME="showControls" VALUE="true">

</OBJECT>
<%
	}
%>
</BODY>
</HTML>
