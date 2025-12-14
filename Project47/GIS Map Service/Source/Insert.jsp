<%@ page contentType="text/html; charset=MS874" %>

  <html>
<head>
<title>Web Map Service---&gt;Insert  Row By Row</title>
<jsp:useBean id="EditDB" scope="session" class="project.editDatabase" />

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
String layerName = (String)session.getAttribute("LName");///********** session***********
String level = (String)session.getAttribute("level");///********** session***********
String Update=request.getParameter("Update");
String Delete=request.getParameter("Delete");
String submit=request.getParameter("submit");
String[] col=EditDB.getAllColumnNameNoGID(layerName);

int count=0;
String[][] co=new String[10][col.length];
String[][] co1=new String[10][col.length];
for(int k=0;k<10;k++){
for(int y =0;y<col.length;y++){
  co[k][y]=count+"";
  count++;
}
}


if(submit != null){

for(int k=0;k<10;k++){
for(int y =0;y<col.length;y++){
   co1[k][y] = request.getParameter(co[k][y]);
}


}
if(EditDB.insertGeometryRow(layerName,co1)!=0){
  response.sendRedirect("EditRowByrow.jsp");
}




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
    <td width="100%" height="100%">
<p align="center"><strong><font color="#0000FF" size="+2">m</font></strong> <font size="+2"><strong><font color="#0000FF">y</font><font color="#FF6600">GISMapService</font><font color="#000000">
        || <font color="#FF0000"><u>Insert Row By Row</u></font></font></strong></font></p>
      <p align="center">&nbsp;</p>
      <table width="68%" height="177" border="1" align="center">

        <tr ><td colspan="3">
  <p align="center"><strong><font color="#0000FF" size="+2">m</font></strong> <font size="+2"><strong><font color="#0000FF">y</font><font color="#FF6600">Layer Name:  </font><font color="#000000">
        || <font color="#0000FF"><u><%=layerName%> </u></font></font></strong></font></p>
         <p align="center">&nbsp;</p>
</td>

</tr>
<tr>
                		<%for (int j=0;j< col.length; j++)
                                                            {%>

			<td><h2><%=col[j]%></h2></td>

                                                      	<%}%>
</tr>


        	<tr>



              	<%for (int j=0;j<10; j++)        {%><tr>
                        		<%for(int k=0;k<col.length;k++){%>

        		<td><input name =<%=co[j][k]%> TYPE="TEXT" value=""   ></td>
                          		<%

                                    }%></tr><%}%>
                                </tr>


<tr ><td colspan=3><center>&nbsp;<input type=submit name=submit value=submit>&nbsp;</center></td></tr>

              </table>
            </div></td>

        </tr> <tr><td><font color="red">NOTE :  Data in column  the_geom must be in well known text (WKT ) format<BR>
          EX :  MULTILINESTRING((691755 1518590, 691884 1518404))</font>
          </td>
        </tr>
      </table>

      <p>&nbsp;</p>
      <p>&nbsp; </p></td>
  </tr>

</table>
</form>
</body>
</html>



