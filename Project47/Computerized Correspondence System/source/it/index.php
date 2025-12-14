<?
require("config.php");

	if($data==NULL)
	{ 
			$data=home;
			$name=NULL;
	} 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title><?=$title?></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 00px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-family: Tahoma, Verdana, Arial;
	font-size: 12px;
	font-weight: bold;
	color: #FFFFFF;
}
-->
</style>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="778"><img src="images/pic_r1_c1.jpg" width="778" height="126"></td>
    <td background="images/bgline.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="778"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="195" valign="middle" background="images/bg1.jpg"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top">&nbsp;</td>
          </tr>
        </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><form name="form1" method="post" action="login.php?data=search">
                <table width="100%"  border="0" cellspacing="0" cellpadding="3">
                  <tr bgcolor="#990000">
                    <td colspan="2">&nbsp;<img src="images/icon2/ico015.gif" width="15" height="15">&nbsp;<span class="style1">Login</span></td>
                    </tr>
                  <tr>
                    <td width="28%" align="right" class="right">ชื่อ</td>
                    <td width="72%"><input name="uname" type="text" id="uname" size="15"></td>
                  </tr>
                  <tr>
                    <td align="right" class="right">รหัสผ่าน</td>
                    <td><input name="pwd" type="password" id="pwd" size="15"></td>
                  </tr>
                  <tr>
                    <td align="right">&nbsp;</td>
                    <td><input type="submit" name="Submit" value="Login"></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="right"><hr></td>
                    </tr>
                </table>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
              </form></td>
            </tr>
          </table></td>
        <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10" align="left" valign="top"><? include("$data.php"); ?></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td background="images/bgline.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="778"><img src="images/pic_r3_c1.jpg" width="778" height="40"></td>
    <td background="images/bgline.gif">&nbsp;</td>
  </tr>
</table>
</body>
</html>
