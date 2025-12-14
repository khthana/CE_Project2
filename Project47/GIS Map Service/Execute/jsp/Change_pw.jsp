<%@ page contentType="text/html; charset=MS874" %>

<html>
<head>
<title>Web Map Service--&gt;Change Password</title>
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

function go()
{
var user = document.form.userName.value;
var pass = document.form.passWord.value;
var pass1 = document.form.passWord1.value;
var pass2 = document.form.passWord2.value;
var submit = document.form.submit.value;
if(!(pass1==pass2)){ alert("New Password is not match!"); }
else if (( pass == "") ||( user =="")||(pass1=="")||(pass2=="")) { alert("Invalid Try again!"); }
//else { location = user.toLowerCase() + "/" + pass.toLowerCase() + ".html" }
/*if(submit != null){
  userLoginId.changePassword(UserName,Group,PassWord,PassWord1);
  alert("ok!");
}*/

}
</script>
</head>


<jsp:useBean id="userLoginId" scope="session" class="project.userLogin" />
<body bgcolor="#FFFFFF" background="Background.JPG" link="#00FFFF">
<%
String UserName=request.getParameter("userName");
String Group = (String)session.getAttribute("group");///********* session***********
String level = (String)session.getAttribute("level");//********** session***********
String PassWord=request.getParameter("passWord");
String PassWord1=request.getParameter("passWord1");
String PassWord2=request.getParameter("passWord2");
String submit=request.getParameter("submit");

 if(submit != null){


if(userLoginId.changePassword(UserName,Group,PassWord,PassWord1)&&(PassWord1.equals(PassWord2))){
response.sendRedirect("home.jsp");
}


}

%>

<form  name="form" action="Change_pw.jsp" method="post">
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
    <td width="100%" height="530"> <p align="center"><strong><font color="#0000FF" size="+2">m</font></strong>
        <font size="+2"><strong><font color="#0000FF">y</font><font color="#FF6600">GISMapService
        </font><font color="#000000"> || <font color="#FF0000"><u>Change Password</u></font></font></strong></font></p>
      <p align="center">&nbsp;</p>
      <p>&nbsp;</p>
      <table width="68%" height="177" border="1" align="center">
     <tr>
          <td><div align="center">
              <table width="100%" height="169" border="0">
                <tr>
                  <td width="42%"><div align="left"><strong>Username : </strong></div></td>
                  <td width="58%"><div align="center"><strong>
                      <input type="text" name="userName">
                      </strong></div></td>
                </tr>
                <tr>
                  <td height="35"><div align="left"><strong>Password :</strong></div></td>
                  <td><div align="center"><strong>
                      <input type="password" name="passWord">
                      </strong></div></td>
                </tr>
                <tr>
                  <td><div align="left"><strong>New Password:</strong></div></td>
                  <td><div align="center"><strong>
                      <input type="password" name="passWord1">
                      </strong></div></td>
                </tr>
                <tr>
                  <td><strong>Retype New Password:</strong></td>
                  <td><div align="center">
                      <input type="password" name="passWord2">
                    </div></td>
                </tr>
               <tr>
                 <td><div align="right"><strong>
                      <input type="submit" name="submit" value="submit" onclick="go()">
                      </strong></div></td>

                  <td><div align="center"><strong>
                      <input type="reset" name="Submit2" value="Reset">
                      </strong></div></td>
                </tr>
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
