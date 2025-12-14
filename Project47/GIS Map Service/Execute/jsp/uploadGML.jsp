<!-- upload.jsp -->
<%@ page contentType="text/html; charset=MS874" %>
<%@page import="java.io.*"%>
<html>
<head>
<title>Web Map Service---&gt;Upload</title>
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

<jsp:useBean id="manageRuntime" scope="session" class="project.manageRuntime" />

<body bgcolor="#FFFFFF" background="Background.JPG">
<%

String level = (String)session.getAttribute("level");//********** session***********
String userName = (String)session.getAttribute("UserName");//********** session***********
String upload=request.getParameter("upload");
String contentType = request.getContentType();
System.out.println("Content type is :: " +contentType);
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {

DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();

byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength) {
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}

String file = new String(dataBytes);
String saveFile = file.substring(file.indexOf("filename=\"") + 10);
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
//out.print("FileName:" + saveFile.toString());

//out.print(dataBytes);

int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
//out.println(boundary);
int pos;
pos = file.indexOf("filename=\"");

pos = file.indexOf("\n", pos) + 1;

pos = file.indexOf("\n", pos) + 1;

pos = file.indexOf("\n", pos) + 1;


int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
saveFile = "C:\\tomcat\\tools\\"+userName + "toSVG.gml"; //+ saveFile;
FileOutputStream fileOut = new FileOutputStream(saveFile);


//fileOut.write(dataBytes);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

out.println("File saved as " +saveFile);
//String text=manage.updateDBFromFile(saveFile);
//out.println(text);
manageRuntime.genSVGFromGML(userName);
Thread.sleep(1000);
manageRuntime.zipSVGFile(userName,true);
response.sendRedirect("downloadConvertSvg.jsp");
}


%>

<form method="post" enctype="multipart/form-data">
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
    <td width="100%" height="100%">
<p align="center"><strong><font color="#0000FF" size="+2">m</font></strong> <font size="+2"><strong><font color="#0000FF">y</font><font color="#FF6600">GISMapService</font><font color="#000000">
        || <font color="#FF0000"><u>Up load</u></font></font></strong></font></p>
      <p align="center">&nbsp;</p>
      <table width="68%" height="177" border="1" align="center">

        <tr>
          <td><div align="center">
              <table width="100%" height="169" border="0">
      	<tr ><td align="center"><font color="blue">Choose GML file that you want to convert </font></td>
       	 </tr>
                <tr>
                  <td align="center">
                                                       <input type="file" name="theFile"><br>

		<input type="submit" >
	</td>
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
</table>
</form>
</body>
</html>
