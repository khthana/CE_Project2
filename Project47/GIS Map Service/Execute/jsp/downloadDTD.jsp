<%@ page contentType="text/html; charset=MS874" %>
<html>
<head>
<title>Web Map Service---&gt;Home</title>
<style type="text/css">
        #color1{background-color:#5971AF;font-weight:bold; color:#ffffff;}
        #color2{background-color:#E1E9FC;font-weight:bold; color:#000000;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>

<jsp:useBean id="userLoginId" scope="session" class="project.userLogin" />
<body bgcolor="#FFFFFF" background="Background.JPG">
<%
 String userName = (String)session.getAttribute("UserName");//**************session***********
String level = (String)session.getAttribute("level");//********** session***********
String group = (String)session.getAttribute("group");//********** session***********
 String layerName = (String)session.getAttribute("LName");//********** session***********
 String namelink="";
  String upload=request.getParameter("upload");
  if(upload != null){
    response.sendRedirect("upload.jsp");
  }


%>

<form method="post">
<table width="100%" height="100%" border="1" bordercolor="#663300">
  <tr>
    <td width="29%" rowspan="3"> <div align="left">
        <table width="100%" height="100%" border="0" bordercolor="#FFFFCC" bgcolor="#FF6600">
          <tr>
            <td width="100%"><div align="center">
                <p align="left"><font color="#FFFFFF" size="+4">GIS </font></p>
                <p align="left"><font color="#FFFFFF" size="+4">Map</font></p>
                <p align="left"><font color="#FFFFFF" size="+4">Service :.</font></p>
              </div></td>
          </tr>
          <tr>
            <td><div align="center">
                <hr color="#FFFFFF">
              </div></td>
          </tr>
          <tr>
            <td bordercolor="#FFFF99" bgcolor="#FF6600"><div align="center">
                <p>&nbsp;</p>
              </div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+2"><strong>[<font color="#0000FF">my</font></strong></font><strong><font color="#FFFF99" size="+2">GISMapService</font><font size="+2">]</font></strong></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+1"><strong><a href="Login.jsp">Login</a></strong></font></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+1"><strong><a href="LogOut.jsp">Logout</a></strong></font></div></td>
          </tr>
          <%if(level.equals("a") || level.equals("m")){%>
          <tr>
            <td height="21"><div align="center"><font size="+1"><strong><a href= "Change_pw.jsp">Change
                Password</a></strong></font></div></td></tr>
                <%}
                else
                {%>
            	<tr>
            	<td height="21"><div align="center"><font size="+1"><strong>Change
                	Password</a></strong></font></div></td></tr>
              <%}%>

          <tr>
            <td height="21"><div align="center"></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center">
                <p>&nbsp;</p>
              </div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font size="+2"><strong>[<font color="#0000FF">menu</font><font color="#FFCCFF"><font color="#FFFF99">GISMapService</font></font>]</strong></font></div></td>
          </tr>
           <%if(level.equals("a") ){%>
          <tr>
            <td height="21"><div align="center"><font color="#FFCCFF" size="+1"><strong><a href="Edit_DB.jsp">Edit
                Database</a></strong></font></div></td>
          </tr>
             <%}
                else
                {%>
                <tr>
            <td height="21"><div align="center"><font color="#FFCCFF" size="+1"><strong>Edit
                Database</a></strong></font></div></td>
          </tr><%}%>
          <tr>
            <td height="21" bordercolor="#FFFFCC"><div align="center"><font color="#FFCCFF" size="+1"><strong><a href="Display_svgFirst.jsp">View
                Map</a></strong></font></div></td>
          </tr>
          <tr>
            <td height="21"><div align="center"><font color="#FFCCFF" size="+1"><strong><a href="convert.jsp">Convert
                GML to SVG</a></strong></font></div></td>
          </tr>
          <tr>
            <td height="21">&nbsp;</td>
          </tr>
          <tr>
            <td height="21">&nbsp;</td>
          </tr>
          <tr>
            <td height="21">&nbsp;</td>
          </tr>

        </table>
      </div></td>
    <td height="54" valign="top" background="Map.jpg">&nbsp;</td>
  </tr>
   <tr>
    <td  valign="top">
      <p align="center"><strong><font color="#0000FF" size="+2">m</font></strong>
        <font size="+2"><strong><font color="#0000FF">y</font><font color="#FF6600">WebMapServer</font><font color="#000000">
        || <font color="#FF0000"><u>Download</u></font></font></strong></font></p>

          <table width="68%" height="177" border="1" align="center">
        <tr>
          <td><div align="center">
              <table width="100%" height="169" border="0">
                <tr> <% namelink="http://161.246.6.212:8080//"+layerName+"_dtd.zip";%>

                  <td><div align="center"><strong>  <a href=<%=namelink%>>Download File DTD</a></strong></div></td>
                  </tr>

              </table>
            </div></td>
        </tr>
      </table>
     <p>&nbsp;</p>
      <p>&nbsp; </p></td>
  </tr>
  <tr>
    <td height="30"><div align="center"><strong><font color="#663300" size="0"><a href="http://161.246.6.212:8080//WMSgetcapability.zip">
         Download WMS getcapability </a></font></strong>

      </div></td>

  </tr>
  <tr><td><input  type="submit" name="upload " value="Upload XML File"/></td>
  </tr>

</table>
</form>
</body>
</html>


