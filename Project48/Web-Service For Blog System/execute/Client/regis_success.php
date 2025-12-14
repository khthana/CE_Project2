<?php 
		session_start() ; 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.style8 {font-family: Arial, Helvetica, sans-serif}
.style9 {font-size: 12px}
.style3 {color: #ffffff}
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style10 {color: #ed1b23}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function checkSubmit(form) {
	Checkbox = document.form1.accept.checked;
	if (!Checkbox ) { alert('กรุณายินยอมตกลงตามเงื่อนไขการให้บริการ');}
}

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
//-->
</script>
</head>

<body onLoad="MM_preloadImages('12_1.jpg','images/Regis_form_12_1.jpg')">
<form name="form1" method="post" action="regis.php" onSubmit="return checkSubmit(this.form)">
  <table width="545" height="104" border="0" cellspacing="0">
    <tr>
      <td height="61"><img src="images/Regis_form_header.jpg" width="545" height="59"></td>
    </tr>
    <tr>
      <td height="6"><div align="center" class="style9">
        <br><br><div align="left"><strong>ยินดีต้อนรับคุณ 
	        <?php
	  	print $_SESSION['ss_UserName'];
	  ?>
        </strong></div><br>
      </div></td>
    </tr>
    <tr>
      <td height="7"><div align="center" class="style9">
<?php
	$file_path="user/".$_SESSION['ss_UserName'];
//	unlink ("user/".$_SESSION['ss_UserName']."/index.html");
//	rmdir($file_path);
	$check = mkdir($file_path, 0777);
	chmod($file_path,0777);

	if ($check) {
	$handle = fopen("user/".$_SESSION['ss_UserName']."/index.html", "w+");
	$text = "<html>
				<head>
				</head>
				<body >
				<META HTTP-EQUIV=\"refresh\" CONTENT=\"0; URL=../../show_blog.php?userid=".$_SESSION['ss_User_id']."\"> \n
				</body>
				</html>";

	fwrite($handle, $text);
	fclose($handle);

		print "คุณสามารถเข้าสู่ blog ของคุณได้ ผ่านทาง 
		<a href = 'show_blog.php?userid=".$_SESSION['ss_User_id']."'> ".$_SERVER['SERVER_NAME']."/show_blog.php?userid=".$_SESSION['ss_User_id']."</a><br>
		
		หรือ ผ่านทาง 
		<a href = '/user/".$_SESSION['ss_UserName']."'> ".$_SERVER['SERVER_NAME']."/user/".$_SESSION['ss_UserName']."</a><br><br>";
	} else {
		print "Error : Can't make file in directory";
	}
?>		</div></td>
    </tr>
    <tr>
      <td height="13" bgcolor="#EBEBEB"><div align="right">
        <table width="386" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="122"><div align="center">
            </div></td>
            <td width="180"><div align="center">
            </div></td>
            <td width="84">			
			<a href="javascript:window.close()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','images/Regis_form_12_1.jpg',1)">
			<img src="images/Regis_form_12.jpg" name="Image2" width="63" height="23" border="0"></a></td>
          </tr>
        </table>
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>
