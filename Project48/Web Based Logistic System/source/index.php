<HTML>


<HEAD>
<?
session_start();
if($session_id==""){
	$session_id=session_id();
	session_register("session_id");
}
?>
<TITLE>เกี่ยวกับระบบ Logistic</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-874">
<style type="text/css">
<!--
body {
	background-image:   url(images/bg01.gif);
	background-color: #FFCC00;
}
.style19 {
	font-family: "MS Sans Serif";
		font-weight: bold;
}
.style24 { font-family: "MS Sans Serif";}
body,td,th {
	font-family: MS Sans Serif;
	font-size: 14px;
}
a {
	font-family: MS Sans Serif;
	color: #000000;
	font-size: 14px;
}
a:link {
	text-decoration: none;
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
 }
.style25 {font-size: 14px}
.style26 {font-size: 14px; font-family: "MS Sans Serif"; }
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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
//-->
</script>
<script language="JavaScript">
function checknumber()
{
e_k=event.keyCode //if(e_k !=13 &&(e_k<48)||(e_k>57)){event.returnValue=false;
if(((e_k<48)||(e_k>57))&&e_k!=46){
alert("กรุณากรอกตัวเลขเท่านั้น");}}
</script> 
</HEAD>
<BODY LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 onLoad="MM_preloadImages('/images/Logistic01_10.gif','/images/Logistic01_11.gif','/images/Logistic01_12.gif','/images/Logistic01_13.gif','/images/Logistic01_14.gif','images/Logistic01_09.gif')">
<!-- ImageReady Slices (Logistic.psd) -->
<table width=812 border=0 align="center" cellpadding=0 cellspacing=0 bgcolor="#FFCC00">
  <tr> 
    <td width="149" rowspan=2 bgcolor="#FFCC00"><img src="images/Logistic_01.gif" width="148" height="68"></td>
    <td colspan="6" > <img src="images/Logistic_02.gif" width=93 height=45 alt=""><img src="images/Logistic_03.gif" width=90 height=45 alt=""><img src="images/Logistic_04.gif" width=97 height=45 alt=""><img src="images/Logistic_05.gif" width=104 height=45 alt=""><img src="images/Logistic_06.gif" width=90 height=45 alt=""><img src="images/Logistic_07.gif" width=57 height=45 alt="" vspace="0"></td>
    <td width="172"  rowspan="4" valign="top" bgcolor="#FFCC00"> <img src="images/Logistic_08.gif" width=123 height=45 vspace="0"><img src="images/Logistic_15.gif" width=121 height=23  vspace="0" hspace="0" ><img src="images/Logistic_23.gif" width=121 height=31 vspace="0"  hspace="0"><img src="images/Logistic_26.gif" width=121 height=24  vspace="0"><img src="images/Logistic_27.gif" width=121 height=22 vspace="0"><IMG SRC="images/Logistic_28.gif" WIDTH=121 HEIGHT=26 ALT=""> 
      <table width="94%"  border="0">
        <tr> 
          <td colspan="2"><div align="center" class="style25"><strong>ผู้ที่เกี่ยวข้องกับระบบ</strong></div></td>
        </tr>
        <tr align="center"> 
          <td colspan="2"><form name="form1">
              <p> <font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
                <select name="menu1" class="style24" lang="th" onChange="MM_jumpMenu('parent',this,0)">
                  <option selected>ระบุตำแหน่ง</option>
                  <option value="?file2=formloginmanager.php">ผู้บริหาร</option>
                  <option value="?file2=formloginuser.php">พนักงาน</option>
                  <option value="Admin/login.php">administrator</option>
                </select>
                </font></p>
            </form></td>
        </tr>
        <tr valign="top" class="style19"> 
          <td width="15%" valign="middle" class="style19"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><img src="images/img/allow01.gif" width="10" height="10"></strong></font></div></td>
          <td width="85%" valign="middle"><font face="MS Sans Serif"><a href="?file2=webdiagram.php" class="style25">แผนผังเว็บไซต์</a></font></td>
        </tr>
        <tr valign="top" class="style19"> 
          <td height="15" valign="middle" class="style19"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><img src="images/img/allow01.gif" width="10" height="10"></strong></font></div></td>
          <td valign="middle"><span class="style26"><a href="mailto:webmaster@thailogistic.com">ติดต่อเรา</a></span></td>
        </tr>
    </table></td>
  </tr>
  <tr> 
    <td width="93" height="23"><a href="index.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image22','','images/Logistic01_09.gif',1)"><img src="images/Logistic_09.gif" name="Image22" width="93" height="23" border="0"></a></td>
    <td width="88"><a href="?file=datatool.php&file2=faq.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image23','','images/Logistic01_10.gif',1)"><img src="images/Logistic_10.gif" name="Image23" width="88" height="23" border="0"></a></td>   
	<?
	if($sess_type==2)
	{ 
	print"<td width=\"99\">
	<a href=\"?file=usertool.php&file2=senddetail.php\" onMouseOut=\"MM_swapImgRestore()\"onMouseOver=\"MM_swapImage('Image24',\'','images/Logistic01_11.gif',1)\"><img src=\"images/Logistic_11.gif\" name=\"Image24\" width=\"99\" height=\"23\" border=\"0\"></a></td>
	";
	}
	elseif($sess_type==3)
	{ 
	print"<td width=\"99\">
	<a href=\"?file=managertool.php&file2=reportday.php\" onMouseOut=\"MM_swapImgRestore()\"onMouseOver=\"MM_swapImage('Image24',\'','images/Logistic01_11.gif',1)\"><img src=\"images/Logistic_11.gif\" name=\"Image24\" width=\"99\" height=\"23\" border=\"0\"></a></td>
	";
	}
	else{
				if($sess_username==""){
	print"<td width=\"99\">		
	<a href=\"?file=servicetool.php&file2=detail2.php\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image24',\'','images/Logistic01_11.gif',1)\"><img src=\"images/Logistic_11.gif\" name=\"Image24\" width=\"99\" height=\"23\" border=\"0\"></a></td>
	
				";}
					else{
					print"<td width=\"99\">		
	<a href=\"?file=servicetool.php&file2=viewtrans.php\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image24',\'','images/Logistic01_11.gif',1)\"><img src=\"images/Logistic_11.gif\" name=\"Image24\" width=\"99\" height=\"23\" border=\"0\"></a></td>";	
		}
	}
	?>
	<td width="104"><a href="?file=alltool.php&file2=caltrans.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image25','','images/Logistic01_12.gif',1)"><img src="images/Logistic_12.gif" name="Image25" width="104" height="23" border="0"></a></td>
    <td width="78"><a href="?file=informationtool.php&file2=newsdetail.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image26','','images/Logistic01_13.gif',1)"><img src="images/Logistic_13.gif" name="Image26" width="78" height="23" border="0"></a> </td>
    <td width="69" bgcolor="#FFCC00"><a href="?file=searchtool.php&file2=map.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image27','','images/Logistic01_14.gif',1)"><img src="images/Logistic_14.gif" name="Image27" width="69" height="23" border="0"></a></td>
  </tr>
  <tr> 
    <td height="31" bgcolor="#FFCC00"> <div align="left"><img src="images/Logistic_16.gif" width="148" height="31"></div></td>
    <td colspan="6" bgcolor="#CC0000"><img src="images/Logistic_012.gif" width="531" height="31"></td>
  </tr>
  <tr> 
    <td height="267" valign="top" bgcolor="#FFCC00"> 
      <? if($sess_name==""){
	echo"<center></center>";
	}else{
	echo"<center>คุณ: <b>$sess_name&nbsp;&nbsp;$sess_lname</b>";
	if($sess_place){
	print"<br>จุดบริการ : <b>$sess_place</b>";}
	print"<br><a href=\"logout.php\">[ออกจากระบบ]</a></center>
	";}
	?>
      <br>
      <? 
									 if($file==""){
									 	if($sess_type!=0){
											if($sess_type==3){
												//require('managertool.php');
												require('abouttool.php');
												}
												elseif($sess_type==2){
												//require('usertool.php');
												require('abouttool.php');
												}
											}else{
											require('abouttool.php');
											print("<br>");
											if($sess_username!=""){
											//require('customertool.php');
											}else{require('login.php');	}
											}
										}else{
									    	require($file);
											}
										?>
      <br>
      <p align="center"><br> 
        <? include "function.php"; 
	$today=date("Y-n-j"); 
	$day=displaydate($today);
	print("<b>วันที่ $day</font>");
	?></p></td>
    <td colspan="6"  valign="top" bgcolor="#F0F0F0"> 
      <? 
									 if($file2==""){
										require('history.php');
										}else{
									    require($file2);
										}
										?>
    </td>
  </tr>
  <tr> 
    <td height="22" valign="top"><img src="images/Logistic_30.gif" width="148" height="19"></td>
    <td colspan="7" valign="top"><img src="images/Logistic_31.gif" width="531" height="19"><img src="images/Logistic_32.gif" width="121" height="19"></td>
  </tr>
</table>
<!-- End ImageReady Slices -->
</BODY>
</HTML>