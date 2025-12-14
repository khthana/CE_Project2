<?php
ob_start();
session_start();
if($_SESSION['status']=="teacher"){$_SESSION["user"]="TEACHER";}
else {$_SESSION["user"]=$_SESSION["name"];}
require '../chat room/libs/config.inc.php';
require '../chat room/libs/ajax.php'; 
require '../chat room/libs/mysql.php';
require '../chat room/libs/function.php';
require '../chat room/languages/lang_th.php';
require '../chat room/funcs/func_chat.php';

$sajax_request_type = "GET";
sajax_init();
sajax_export("add_line", "refresh");
sajax_handle_client_request();
ob_end_flush();
?>
<html>
<head>
<title></title>
<meta http-equiv='content-type' content='text/html; charset=tis-620'>
<meta name="GENERATOR" content="Active WebCam 6.3 (http://www.pysoft.com) [Unregistered]">
<meta name="Keywords"
content="ACTIVE,WEB,CAMERA,CAM,VIDEO,FRAME,IMAGE,BROADCAST,CAPTURE,CAPTUR,USB,DETECT,GUESTS,INTERNET,LIVE,MONITOR,MOTION,PAGE,PROGRAM,RECORD,WATCH,ADJUST,ALARM,AREA,AWAY,surveillance,JPEG,MPEG">
<link rel='stylesheet' href='../chat room/css/main.css' type='text/css'>
<script language='javascript'>
<!--
<? sajax_show_javascript(); ?>
<!-- chat room function !-->
function refresh_cb(e) {
	window.frames['m'].document.getElementById('contents').innerHTML = e;
}

function refresh() {
	x_refresh(refresh_cb);
}

function add_cb(e) {
	document.getElementById('report').innerHTML = "<font color='red'>" + e + "</font>";
}

function add() {
	msg = document.getElementById('msg').value;
	x_add_line(msg,add_cb);
	document.getElementById('msg').value = '';
	refresh();
}

function chkEnter() {
	var keyPress = event.keyCode;
	if(keyPress == '13') {
		return add();
	}
}
//-->
<!-- TV funvtion !-->
function ShowButton(objName, ImageName) {
  objName.src=ImageName;
}

function PreloadImages() {
  if(document.images) {
      if (!document.tmpImages)
         document.tmpImages=new Array();
      with(document) {
       var
          i, j=tmpImages.length,
          a=PreloadImages.arguments;
       for(i=0; i<a.length; i++)
          if (a[i].indexOf("#")!=0) {
             tmpImages[j]=new Image;
             tmpImages[j++].src=a[i];
          }
      }
  }
  
}

function PTZButton(PTZCommand, CameraNumb) {
   if ( document.NullFrame ) { 
      document.NullFrame.location = "http://" + document.location.host + 
                  "?PTZ=" + PTZCommand +   
                  "&ANSWER=NO" +
                  "&CAMERANUMB=" + CameraNumb;
      return false;
   }
   else
      return true;
}
</script>
</head>
<!--------------------TV---------------------------------------!-->
<BODY bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000"
      onLoad=""
>
<iframe width="1" height="1" src="" frameborder="no" scrolling="no" Name="NullFrame">
</iframe> 
<TABLE width="175" cellpadding="1" bordercolorlight="#FFFFFF" bordercolordark="#000000" cellspacing="2" align="center">
<TR>
<TD width="90%" valign="top">
&nbsp;
<OBJECT Name="Pl1" WIDTH="500" HEIGHT="403"
classid="CLSID:66D393D5-4D80-497C-9F4F-F3839E090202"
CODEBASE="WebCamPlayerOCX.cab#version=6,3,0,0"
standby="Loading PY Software player for AWLive files..."
type="application/x-oleobject">
<PARAM NAME="ImagePath" VALUE="capture1.jpg">
<PARAM NAME="ShowTopBar" VALUE="0">
<PARAM NAME="ShowControls" VALUE="1">
<PARAM NAME="ImagePort" VALUE="8080">
</OBJECT>
<script language="JavaScript">
document.Pl1.DocumentURL=document.URL;
</script></TD><TD valign="top">

<A name=1></A>

<TABLE width="50" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#000000" cellspacing="0">
<TR><TD></TD><TD></TD></TR>
<TR><form
 method="GET" action="" name="FormZoomIn1" TARGET="_top"  
 onsubmit="return PTZButton('ZOOMIN', '1')"><input type="HIDDEN" name="RETURNMAINPAGE" value="YES"><input
 type="HIDDEN" name="CAMERANUMB" value="1"><input
 type="HIDDEN" name="PTZ" value="ZOOMIN">
<TD valign="top"></TD></form></TD></TR><TR><form method="GET"
 action="" name="FormZoomOut1" TARGET="_top"  
 onsubmit="return PTZButton('ZOOMOUT', '1')"><input type="HIDDEN" name="RETURNMAINPAGE" value="YES"><input
 type="HIDDEN" name="CAMERANUMB" value="1"><input
 type="HIDDEN" name="PTZ" value="ZOOMOUT">
<TD valign="top"></TD></form></TR><TR><TD></TD><TD></TD></TR>
</TABLE>
</TD></TR>
</TABLE>



<div align="CENTER"><BR>
</div>
<div align="CENTER">
  <p>
    <body topmargin='0' leftmargin='0'>
</p>
</div>
<table width='100%' height='100%' cellpadding='0' cellspacing='0' border='0'>
<tr>
<td  height='15%' colspan='2' valign='top'>
	<table width='100%' height='100%' style="background-image: url('../chat room/images/bg_01.gif')">
	<tr>
	<td><img src='../chat room/images/logo.gif'></td>
	</tr>
	</table>
</td>
</tr>
<tr>
<td width='80%' height='65%' align='left' valign='top' style='padding: 10px'>
	<table width='100%' height='30' cellpadding='0' cellspacing='0' border='0' style='border-bottom: solid 1px #999999'>
	<tr>
	<td width='9'><img src='../chat room/images/bor_TL.gif'></td>
	<td style="background-image: url('../chat room/images/bor_TC.gif')">
		<table width='100%' cellpadding='0' cellspacing='0'>
		<tr>
		<td><span class='menu_en'><?=$webSite['intro']?></span></td>
		<td align='right'><input type='button' value='Log Out' class='logout' onclick="location.href='<?php if($_SESSION[status]=="student"){echo "student_index.php";}else if($_SESSION[status]=="teacher"){echo "../teacher/teacher_index.php";}else {echo "../admin/admin_index.php";}?>'"></td>
		</tr>
		</table>
	</td>
	<td width='9'><img src='../chat room/images/bor_TR.gif' width='9'></td>
	</tr>
	</table>

	<table width='100%' height='89%' cellpadding='0' cellspacing='0' border='0' style='border: solid 1px #999999'>
	<tr>
	<td><iframe id='m' width='100%' height='100%' frameborder='0' src='../chat room/chatroom/message.php' scrolling='auto'></iframe></td>
	</tr>
	</table>
</td>
<td width='20%' height='65%' align='right' valign='top' style='padding: 10px' rowspan='2'><table width='100%' height='30' cellpadding='0' cellspacing='0' border='0' style='border-bottom: solid 1px #999999'>
	<tr>
	<td width='9'><img src='../chat room/images/bor_TL.gif'></td>
	<td style="background-image: url('../chat room/images/bor_TC.gif')" align='right'><div align="center"><span class='menu_en'>Who's Online</span></div></td>
	<td width='9'><img src='../chat room/images/bor_TR.gif' width='9'></td>
	</tr>
	</table>

	<table width='100%' height='93%' cellpadding='0' cellspacing='0' border='0' style='border: solid 1px #999999'>
	<tr>
	<td><iframe id='useronline' width='100%' height='100%' frameborder='0' src='../chat room/chatroom/user.php' scrolling='auto'></iframe></td>
	</tr>
	</table>
	</td>
</tr>

<tr>
<td height='25%' valign='bottom' style='padding: 10px;'>

	<table width='100%' height='95%' cellpadding='0' cellspacing='0' border='0'>
	<form name='frm' method='post' action='#' onsubmit='add(); return false;'>

	<tr valign='top'>
	<td valign='bottom' height='80' width='*'>
	<textarea name='msg' id='msg' class='editor' style='width:100%;height:80' onkeypress='chkEnter()'></textarea>
	</td>
	<td width='120' rowspan='2' align='right'><input type='image' src='../chat room/images/send.gif' onclick='add(); return false;'></td>
	</tr>
	<tr>
	<td height='30'><div id='report' class='menu_en'><?=$webSite['copyright']?></div></td>

	</tr>
	</form>
	</table>

</td>
</tr>
</table>

</body>
</html>