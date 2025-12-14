<%@ page contentType="text/html; charset=MS874" %>

<html>
<body bgcolor="#FFFFFF" background="Background.JPG">
<head>
<title>Web Map Service---&gt;Update Or Delete</title>
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

<%
String layerName = (String)session.getAttribute("LName");///********** session***********
String level = (String)session.getAttribute("level");///********** session***********
String name = (String)session.getAttribute("name");///********** session***********
String Coordinate = (String)session.getAttribute("Coordinate");///********** session***********
String Insert=request.getParameter("Insert");
String Update=request.getParameter("Update");
String Delete=request.getParameter("Delete");
String submit=request.getParameter("submit");
String[] col=EditDB.getAllColumnNameNoGID(layerName);
//String[] row=EditDB.getAllGeometryName(layerName);


String[][] valueCol=new String[1][col.length];
int l= col.length;
int counts=0;
//int r=row.length;
if(name != null){

valueCol = EditDB.getGeometryRowByName(layerName,name);
}
if(Coordinate!= null){
  valueCol=EditDB.getGeometryRowByCoordinate(layerName,Coordinate);
}
int v=valueCol.length;
String[][] co1=new String[v][l];
String[][] co=new String[v][l];
int count=0;
int geo = -1;
  		for(int k=0;k<v;k++){

                                 	for(int i=0;i<l;i++){
                                           		if (col[i].equals("the_geom")) geo = i;

			  co[k][i]=count+"";
                          			count++;

		}
                }


if(Update!=null){

for(int y=0;y<v;y++){
for (int j=0;j< l; j++){
  co1[y][j]=request.getParameter(co[y][j]);
  if (!co1[y][j].equals(valueCol[y][j])) EditDB.updateGeometryRow(layerName,col[j],valueCol[y][geo],co1[y][j]);
  if(EditDB.updateGeometryRow(layerName,col[j],valueCol[y][geo],co1[y][j])){
    counts++;
  }
}

}
if(counts==( v*l)){
  response.sendRedirect("EditRowByrow.jsp");
}
}
if(Delete != null){
  if(name != null){

 if(EditDB.deleteGeometryRowByName(layerName,name)){
   response.sendRedirect("EditRowByrow.jsp");
 }

  }
  if(Coordinate != null){
    if(EditDB.deleteGeometryRowByCoordinate(layerName,Coordinate)){
       response.sendRedirect("EditRowByrow.jsp");
    }
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
        || <font color="#FF0000"><u>Update Or Delete</u></font></font></strong></font></p>
      <p align="center">&nbsp;</p>
      <table width="68%" height="177" border="1" align="center">
        <tr>
          <td><div align="center">
              <table width="100%" height="169" border="0">

	<tr>

                            			<%for (int j=0;j< l; j++)
                                                            {%>

			<td><h2><%=col[j]%></h2></td>

                                                      	<%}%>

                             <tr>


            		<%for(int y=0;y<v;y++){%>
                              	<tr>
	   <%                                      for(int i=0;i<l;i++){%>

        		<td><input name =<%=co[y][i]%> TYPE="TEXT" value=<%=valueCol[y][i]%>></td>
                                    <%}%>
                                    	</tr><%}%>

                                </tr>
  </tr>

<tr ><td colspan=2><center>&nbsp;<input type=submit name=Update value=Update>&nbsp;<input type=submit name=Delete value=Delete> </center></td></tr>
              </table>
            </div></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp; </p></td>
  </tr>

</table>
</form>
</body>
</html>







