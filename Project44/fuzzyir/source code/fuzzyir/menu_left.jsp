<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=">
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

<body bgcolor="#FFFFFF" onLoad="MM_preloadImages('pic/adddown.jpg','pic/modifydown.jpg','pic/changepd.jpg','pic/logoutdown.jpg')">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="428"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="106" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="39">&nbsp;</td>
              </tr>
              <tr bgcolor="#0066FF"> 
                <td>
                  <div align="center"><font color="#FFFF33">MENU</font></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="60"> 
            <div align="center"><a href="add_page.jsp" target="mainFrame2" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','pic/adddown.jpg',1)" ><img name="Image1" border="0" src="pic/addup.jpg" width="150" height="38"></a></div>
          </td>
        </tr>
        <tr>
          <td height="60">
            <div align="center"><a href="modify_page.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','pic/modifydown.jpg',1)" target="mainFrame2"><img name="Image2" border="0" src="pic/modifyup.jpg" width="150" height="38"></a></div>
          </td>
        </tr>
        <tr>
          <td height="60">
            <div align="center"><a href="changepw_page.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','pic/changepd.jpg',1)" target="mainFrame2"><img name="Image3" border="0" src="pic/changepup.jpg" width="151" height="38"></a></div>
          </td>
        </tr>
        <tr>
          <td height="60">
            <div align="center"><a href="logout_page.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','pic/logoutdown.jpg',1)" target="mainFrame"><img name="Image4" border="0" src="pic/logoutup.jpg" width="150" height="38"></a></div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
