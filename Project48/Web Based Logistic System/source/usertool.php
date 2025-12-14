<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<?
session_start();
?>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body,td,th {
	font-family: MS Sans Serif;
	font-size: 14px;
}
.style25 {
	font-size: 14px;
	font-weight: bold;
}
.style27 {
	font-size: 18px;
	color: #FFFFFF;
	font-weight: bold;
}
a {
	font-family: MS Sans Serif;
	color: #000000;
	font-size: 14px;
}
a:link {
	text-decoration: none;
	color: #000000;
}
a:visited {
	text-decoration: none;
	
}
a:hover {
	text-decoration: none;
	color: #3366FF;
}
a:active {
	text-decoration: none;
	color: #000000;
}
.style31 {color: #000000}
.style32 {
	font-size: 12px;
	color: #000000;
}
.style34 {font-size: 12px}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<table width="96%" height="49"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CC0000" bgcolor="#CC0000">
  <tr>
    <td height="47"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFCC00">
        <tr bgcolor="#CC0000"> 
          <td height="16" colspan="2"><div align="center"><span class="style25"><font color="#FFFFFF">รายการ</font> 
              </span></div></td>
        </tr>
        <tr> 
          <td height="16" colspan="2"><div align="center" class="style25"></div></td>
        </tr>
		<?
        print"<tr> 
          <td width=\"18%\" height=\"20\" align=\"center\" valign=\"middle\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><img src=\"images/img/gray_bot.gif\" width=\"15\" height=\"13\"></font></td>
          <td class=\"style31\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=\"register.php\" >ลงทะเบียนลูกค้า</a></font></td>
        </tr>
        <tr> 
          <td height=\"18\" align=\"center\" valign=\"middle\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><img src=\"images/img/gray_bot.gif\" width=\"15\" height=\"13\"></font></div></td>
          <td class=\"style31\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=\"?file=usertool.php&file2=senddetail.php\">ลงทะเบียนสินค้า</a></font></td>
        </tr>
        <tr> 
          <td height=\"19\" align=\"center\" valign=\"middle\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><img src=\"images/img/gray_bot.gif\" width=\"15\" height=\"13\"></font></td>
          <td class=\"tyle31\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=\"?file=usertool.php&file2=viewtotaltrans.php\">ตารางสินค้าประจำวัน</a></font></td>
        </tr>";
		print"<tr> 
          <td height=\"18\" align=\"center\" valign=\"middle\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><img src=\"images/img/gray_bot.gif\" width=\"15\" height=\"13\"></font></td>
          <td align=\"center\" valign=\"middle\"><div align=\"left\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=\"?file=usertool.php&file2=viewtotalres.php\">ตารางสินค้าที่รับ</a></font></div></td>
        </tr>";	
		?>
        <tr> 
          <td height="13" colspan="2" align="center" valign="middle">. .. ... 
            ... .. .</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
