<%@ page contentType="text/html; charset=MS874" %>

<html>
<head>
<title>Web Map Service---&gt;Edit Database</title>
<jsp:useBean id="EditDB" scope="session" class="project.editDatabase" />
<style type="text/css">

        #color2{ color:#000000;}
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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" background="Background.JPG" link="#00FFFF">
<%


String type=request.getParameter("type");
String submit=request.getParameter("submit");
String layerName = (String)session.getAttribute("LName");///********** session**********
String Group = (String)session.getAttribute("group");///********** session***********
String level = (String)session.getAttribute("level");///********** session***********
String[] t =EditDB.getAllLayerName(Group);
String[] row=EditDB.getAllGeometryName(layerName);
String[] geom=EditDB.getAllGeometryCoordinate(layerName);
 String name="";
 String Coordinate="";
 if(submit != null){
if(type.equals("By Name")){
  name=request.getParameter("name");
  session.setAttribute("name",name);//**********session ***************************
 //Coordinate="":
//session.setAttribute("Coordinate",Coordinate);//**********session *************************
}

if(type.equals("By Coordinate")){
 // name="";
 //  session.setAttribute("name",name);//**********session ***************************
Coordinate=request.getParameter("Coordinate");
session.setAttribute("Coordinate",Coordinate);//**********session *************************
}
response.sendRedirect("Update.jsp");
 }
%>
<form  method="post">
  <table width="100%" height="100%" border="1" bordercolor="#660000">
  <tr>
    <td width="32%" rowspan="2"> <div align="left">
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
    <td height="80" valign="top" background="Map.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="530"> <p align="center"><strong><font color="#0000FF" size="+2">my</font></strong><font size="+2"><strong><font color="#FF6600">GISMapService
        </font><font color="#000000"> || <font color="#FF0000"><u>Update Or Delete By Name Or By  Coordinate</u></font></font></strong></font></p>
      <table width="90%" height="177" border="1" align="center">

        <tr>
          <td><div align="center">
              <table width="100%" height="169" border="0">
                <tr>
          <td><div align="center">
            <p><font color="#FF0066"><strong>Choose the row that you want to Edit  </strong></font></p>
               </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input  type="radio" name="type" value="By Name" checked="checked">By Name
             <select NAME="name" SIZE= 0 >


                		<%for (int j=0;j< row.length; j++)
                                                            {%>
                                                       	            <option    value=<%=row[j]%>  > <%=row[j]%>
  			</option>
                                                            <%}%>
              	</select>
  	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="type" value="By Coordinate">By Coordinate
                 <select NAME="Coordinate" SIZE= 0 >


                		<%for (int j=0;j< geom.length; j++)
                                                            {%>
                                                       	            <option    value=<%=geom[j]%>  > <%=geom[j]%>
  			</option>
                                                            <%}%>
              	</select>

      	<br><br><center><input type=submit  name=submit  value=submit></center>
                	<br><br>
            </td>

        </tr>



              </table>
            </div></td>
        </tr>

      </table>
      <p align="center">&nbsp;</p>
      <p>&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp; </p></td>
  </tr>
</table>
</form>
</body>
</html>















