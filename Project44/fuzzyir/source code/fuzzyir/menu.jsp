<html>
<head>
<title>Untitled Document</title>
<%
	String pass_authen= new String(); 
	if(session.getValue("pass_authen")!=null){
		pass_authen=(String)session.getValue("pass_authen");
	}
	if (!(pass_authen.equals("yes"))){
		response.sendRedirect("librarian.html");
	}
%>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" onLoad="MM_preloadImages('pic/buttonred_down.jpg')" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="317" width="21%">&nbsp;</td>
    <td height="317" width="54%" valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="74" width="36%">&nbsp;</td>
          <td height="74" width="64%">&nbsp;</td>
        </tr>
        <tr>
          <td width="36%" height="60">
            <div align="right"><a href="add.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','pic/buttonred_down.jpg',1)"><img name="Image1" border="0" src="pic/buttonred_up.jpg" width="81" height="70"></a></div>
          </td>
          <td width="64%"><img src="pic/add.jpg" width="66" height="24"></td>
        </tr>
        <tr>
          <td width="36%" height="60">
            <div align="right"><a href="modify.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','pic/buttonred_down.jpg',1)"><img name="Image2" border="0" src="pic/buttonred_up.jpg" width="81" height="70"></a></div>
          </td>
          <td width="64%"><img src="pic/modify.jpg" width="101" height="30"></td>
        </tr>
        <tr>
          <td width="36%" height="60">  
            <div align="right"><a href="changepw.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','pic/buttonred_down.jpg',1)"><img name="Image3" border="0" src="pic/buttonred_up.jpg" width="81" height="70"></a></div>
          </td>
          <td width="64%"><img src="pic/changep.jpg" width="247" height="31"></td>
        </tr>
        <tr>
          <td width="36%" height="60">  
            <div align="right"><a href="logout_page.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','pic/buttonred_down.jpg',1)" target="_self"><img name="Image4" border="0" src="pic/buttonred_up.jpg" width="81" height="70"></a></div>
          </td>
          <td width="64%"><img src="pic/logout.jpg" width="106" height="29"></td>
        </tr>
      </table>
    </td>
    <td height="317" width="25%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
