<?php
 $DBName="allmission";
$link=@mysql_pconnect("localhost","player","player");
@mysql_select_db($DBName,$link);


$ciper=$HTTP_COOKIE_VARS['passkey'];

//decyption
$len_ciper=(strlen($ciper)/2);

$plantext=decypt($ciper,$len_ciper);

for($i=0;$i<=($len_ciper);$i++){
 $planstr{$i}=chr($plantext{$i});
}

$planstring = implode("", $planstr);
$plan=trim($planstring);

$row=mysql_query("SELECT * FROM profile WHERE email='$plan' ");
$rownum=mysql_num_rows($row);

if($rownum ==0){
header("Location:../first_stage/home.php");
}

//decyption function
function decypt($ciper,$len_ciper){
for($i=0;$i<$len_ciper;$i++){
 $buffer1=$ciper{$i+$i};
$buffer2=$ciper{$i+$i+1};
$todec= hexdec($buffer1);

$first_ascii=$todec;
 $encypt= $first_ascii ^ 10;
$hex1=dechex($encypt);
$todec2= hexdec($buffer2);
 $second_ascii=$todec2;
 $encypt2= $second_ascii ^ 10;
$hex2=dechex($encypt2);

$concat="$hex1"."$hex2";
$plantext{$i}=hexdec($concat);
}
return $plantext;
}
?>
<html>
<head>
<title>stage 2 </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#657889;
        }
		a:link {
	color: #FFFFFF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FFFFFF;
}
.style1 {font-size: 36px}
.style2 {font-size: 18px}
-->
</style>
</head>
<body background="pic/line.gif"  bgproperties="fixed">
<table width="95%" height="99%" border="1" align="center" cellspacing="1" bordercolor="#333333">
  <tr>
    <td><table width="95%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="132" colspan="4" valign="top" bgcolor="#657889"><div align="left"><img src="pic/name01.jpg" width="741" height="141"><img src="pic/name02.jpg" width="186" height="141"></div></td>
        </tr>
        <tr> 
          <td height="20" colspan="4"> <div align="center">
              <table width="100%" border="0">
                <tr bgcolor="#657889"> 
                  <td class="style0"><div align="center"><strong><a href="_2ndstage_.php">HOME</a></strong></div></td>
                  <td class="style0"><div align="center"><strong><a href="product_.php">Product</a></strong></div></td>
                  <td class="style0"><div align="center"><strong><a href="download.php">Download</a></strong></div></td>
                  <td class="style0"><div align="center"><strong><a href="member.php">Member</a></strong></div></td>
                  <td class="style0"><div align="center"><strong><a href="webboard.php">Webboard</a></strong></div></td>
                  <td class="style0"><div align="center"><strong><a href="logout.php">Logout</a></strong></div></td>
                </tr>
              </table>
            </div></td>
        </tr>
        <tr> 
          <td width="4%" rowspan="2" valign="bottom"> <div align="left"> 
              <div align="left"> </div>
            </div></td>
          <td width="41%" rowspan="2" valign="top" class="style0"><p align="center"><br>
              ::<span class="style1"> ยินดีต้อนรับ</span></p>
            <p align="center" class="style2">สู่เว็บไซต์วาไรตี้อันดับหนึ่ง</p>            <p align="center">
              <input name="imageField" type="image" src="pic/006.gif" width="100" height="120" border="0">
              <br>
            </p></td>
          <td width="18%" rowspan="2" valign="bottom" ><div align="center">
            <input name="imageField2" type="image" src="pic/002.gif" align="top" width="107" height="180" border="0">
          </div></td>
          <td width="37%" align="right" valign="top" ><img src="pic/Compact_Discs.jpg" width="184" height="84"></td>
        </tr>
        <tr>
          <td align="right" valign="bottom" ><img src="pic/Vine_Border_2.jpg" width="90" height="94"></td>
        </tr>
        <tr> 
          <td height="20" colspan="4" bgcolor="#657889" class="style0"><font color="#333333">Web 
            Hacking Sandbox </font>Mission</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
