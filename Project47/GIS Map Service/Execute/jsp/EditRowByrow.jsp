<%@ page contentType="text/html; charset=MS874" %>
<html>
<head>
<title>Web Map Service---&gt;Edit Row  By Row</title>
<script language=JavaScript src="picker.js"></script>
<jsp:useBean id="EditDB" scope="session" class="project.editDatabase" />
<jsp:useBean id="DisplaySvg" scope="session" class="project.gensvg" />
<style type="text/css">

        #color2{ color:#000000;}
</style><jsp:useBean id="userLoginId" scope="session" class="project.userLogin" />
<style type="text/css">
        #color1{background-color:#5971AF;font-weight:bold; color:#ffffff;}
        #color2{color:#000000;}
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

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_jumpMenuGo(selName,targ,restore){ //v3.0
  var selObj = MM_findObj(selName); if (selObj) MM_jumpMenu(targ,selObj,restore);
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" background="Background.JPG" link="#00FFFF">
<%

String submit=request.getParameter("submit");
String delete=request.getParameter("delete");
String Update=request.getParameter("Update");
String Insert=request.getParameter("Insert");
String color=request.getParameter("color");
String changeDefault=request.getParameter("changeDefault");
String level = (String)session.getAttribute("level");///********* session***********
String layerName = (String)session.getAttribute("LName");///********** session***********
 if(submit != null){
 	String color1=DisplaySvg.color2rgb(color);

          	EditDB.changeDefaultColor(layerName,color1);
          	out.println("ŕĂŐÂşĂéÍÂáĹéÇ¤čĐ");
          	//response.sendRedirect("MenuAdmin.jsp");
       }

if(Update !=null) {


  			response.sendRedirect("SelectNameOrCoordinate.jsp");
	}
if(Insert !=null) {

        			response.sendRedirect("Insert.jsp");
	}
if(delete != null){
  			response.sendRedirect("deleteLayer.jsp");
}
/*if(changeDefault !=null){

                              response.sendRedirect("changeDefaultColor.jsp");
              		 	}*/

%>

<form  name="tcp_test"  method="post">
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
        || <font color="#FF0000"><u>Edit Row By Row</u></font></font></strong></font></p>
      <p align="center">&nbsp;</p>
      <table width="68%" height="177" border="1" align="center">


             <tr>
               	 <td> <p align="center"><font color="#0000FF">Edit Default Color in Geometry Layer</font></p><br>
  	<center><input type="Text" name=color  readonly="readonly">
                        	<a href="javascript:TCP.popup(document.forms['tcp_test'].elements['color'])">
	<img width="15" height="13" border="0" alt="Click Here to Pick up the color" src="img/sel.gif"></a>
        	<input type=submit  name=submit value=submit> </center><p align="center">&nbsp;</p></td>
                </tr>
               <tr id=color2>
                  <td> <p align="center"><font color="#0000FF">Edit  Geometry Layer</font></p><br>

                  <center> <input type=submit  name=Insert  value=Insert>&nbsp;<input type=submit name=Update value=Update&Delete>&nbsp;<input type=submit name=delete value=DeleteLayer></center>
                    <p align="center">&nbsp;</p>
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


