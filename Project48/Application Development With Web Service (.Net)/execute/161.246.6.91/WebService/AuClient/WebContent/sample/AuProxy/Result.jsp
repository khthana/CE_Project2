<%@page contentType="text/html;charset=UTF-8"%><HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="AuProxyid" scope="session" class="WS.AuProxy" />

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        String useJNDI_0id=  request.getParameter("useJNDI5");
        boolean useJNDI_0idTemp  = Boolean.valueOf(useJNDI_0id).booleanValue();
        AuProxyid.useJNDI(useJNDI_0idTemp);
break;
case 7:
        gotMethod = true;
        java.lang.String getEndpoint7mtemp = AuProxyid.getEndpoint();
if(getEndpoint7mtemp == null){
%>
<%=getEndpoint7mtemp %>
<%
}else{
        String tempResultreturnp8 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(getEndpoint7mtemp));
        %>
        <%= tempResultreturnp8 %>
        <%
}
break;
case 10:
        gotMethod = true;
        String endpoint_1id=  request.getParameter("endpoint13");
        java.lang.String endpoint_1idTemp  = endpoint_1id;
        AuProxyid.setEndpoint(endpoint_1idTemp);
break;
case 15:
        gotMethod = true;
        WS.Au getAu15mtemp = AuProxyid.getAu();
if(getAu15mtemp == null){
%>
<%=getAu15mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">courseAll:</TD>
<TD>
<%
if(getAu15mtemp != null){
java.lang.String typecourseAll18 = getAu15mtemp.getCourseAll();
        String tempResultcourseAll18 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(typecourseAll18));
        %>
        <%= tempResultcourseAll18 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 20:
        gotMethod = true;
        java.lang.String getCourseAll20mtemp = AuProxyid.getCourseAll();
if(getCourseAll20mtemp == null){
%>
<%=getCourseAll20mtemp %>
<%
}else{
        String tempResultreturnp21 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(getCourseAll20mtemp));
        %>
        <%= tempResultreturnp21 %>
        <%
}
break;
case 23:
        gotMethod = true;
        String classID_2id=  request.getParameter("classID26");
        int classID_2idTemp  = Integer.parseInt(classID_2id);
        String email_3id=  request.getParameter("email28");
        java.lang.String email_3idTemp  = email_3id;
        String receiveID_4id=  request.getParameter("receiveID30");
        java.lang.String receiveID_4idTemp  = receiveID_4id;
        boolean buyClass23mtemp = AuProxyid.buyClass(classID_2idTemp,email_3idTemp,receiveID_4idTemp);
        String tempResultreturnp24 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(buyClass23mtemp));
        %>
        <%= tempResultreturnp24 %>
        <%
break;
case 32:
        gotMethod = true;
        String classID_5id=  request.getParameter("classID35");
        int classID_5idTemp  = Integer.parseInt(classID_5id);
        String email_6id=  request.getParameter("email37");
        java.lang.String email_6idTemp  = email_6id;
        String name_7id=  request.getParameter("name39");
        java.lang.String name_7idTemp  = name_7id;
        String surname_8id=  request.getParameter("surname41");
        java.lang.String surname_8idTemp  = surname_8id;
        String phoneNo_9id=  request.getParameter("phoneNo43");
        java.lang.String phoneNo_9idTemp  = phoneNo_9id;
        boolean reservation32mtemp = AuProxyid.reservation(classID_5idTemp,email_6idTemp,name_7idTemp,surname_8idTemp,phoneNo_9idTemp);
        String tempResultreturnp33 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(reservation32mtemp));
        %>
        <%= tempResultreturnp33 %>
        <%
break;
case 45:
        gotMethod = true;
        String subject_10id=  request.getParameter("subject48");
        java.lang.String subject_10idTemp  = subject_10id;
        String period_11id=  request.getParameter("period50");
        int period_11idTemp  = Integer.parseInt(period_11id);
        java.lang.String getCourse45mtemp = AuProxyid.getCourse(subject_10idTemp,period_11idTemp);
if(getCourse45mtemp == null){
%>
<%=getCourse45mtemp %>
<%
}else{
        String tempResultreturnp46 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(getCourse45mtemp));
        %>
        <%= tempResultreturnp46 %>
        <%
}
break;
case 52:
        gotMethod = true;
        String email_12id=  request.getParameter("email55");
        java.lang.String email_12idTemp  = email_12id;
        java.lang.String getCourseFromEmail52mtemp = AuProxyid.getCourseFromEmail(email_12idTemp);
if(getCourseFromEmail52mtemp == null){
%>
<%=getCourseFromEmail52mtemp %>
<%
}else{
        String tempResultreturnp53 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(getCourseFromEmail52mtemp));
        %>
        <%= tempResultreturnp53 %>
        <%
}
break;
case 57:
        gotMethod = true;
        String classID_13id=  request.getParameter("classID60");
        int classID_13idTemp  = Integer.parseInt(classID_13id);
        String email_14id=  request.getParameter("email62");
        java.lang.String email_14idTemp  = email_14id;
        boolean cancel57mtemp = AuProxyid.cancel(classID_13idTemp,email_14idTemp);
        String tempResultreturnp58 = webserviceutils.com.ibm.etools.webservice.util.JspUtils.markup(String.valueOf(cancel57mtemp));
        %>
        <%= tempResultreturnp58 %>
        <%
break;
}
} catch (Exception e) { 
%>
exception: <%= e %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>