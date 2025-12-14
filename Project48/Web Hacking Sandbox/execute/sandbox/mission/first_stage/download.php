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
<title>showmember</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#FFFFFF;
        }
		a:link {
	color: #FFFFFF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FFFFFF;
}
-->
</style>
</head>
<body background="pic/line.gif" link="#000000" vlink="#330000"  bgproperties="fixed" >

<table width="95%" height="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bgcolor="#657889"> 
    <td height="132" colspan="3" valign="top"><div align="left"><img src="pic/name01.jpg" width="741" height="141"><img src="pic/name02.jpg" width="186" height="141"></div></td>
  </tr>
  <tr align="left"> 
    <td height="20" colspan="3"> <div align="left"> 
        <table width="100%" border="0">
          <tr bgcolor="#657889"> 
            <td class="style0"><div align="center"><strong><a href="home.php">HOME</a></strong></div></td>
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
    <td width="3%" valign="bottom"> <div align="left"> 
        <div align="left"> </div>
      </div></td>
    <td width="93%" valign="top"> 
      <div align="left"> 
        <table width="80%" height="170" border="1" align="center" cellspacing="0" bordercolor="#FFFFFF">
          <tr bgcolor="#657889"> 
            <td width="6%" height="22" valign="top" class="style0"><div align="center"><strong>No.</strong></div></td>
            <td width="62%" valign="top" class="style0"><div align="center"><strong>ชื่อ 
                Program</strong></div></td>
            <td width="15%" valign="top" class="style0"><div align="center"><strong>Size</strong></div></td>
            <td width="17%" valign="top" class="style0" ><div align="center"></div></td>
          </tr>
          <tr bgcolor="#CCCCCC"> 
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">1.</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">Winamp 
                5</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">3 
                MB</font></div></td>
            <td height="22" valign="top"class="style0"><div align="center"> </div></td>
          </tr>
          <tr bgcolor="#CCCCCC"> 
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">2.</font></div></td>
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">MSN 
                8.0</font></div></td>
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">5 
                MB</font></div></td>
            <td height="22" valign="top"class="style0"><div align="center"> </div></td>
          </tr>
          <tr bgcolor="#CCCCCC"> 
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">3.</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">BitComet</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">1.8 
                MB</font></div></td>
            <td height="22" valign="top"class="style0"><div align="center"> </div></td>
          </tr>
          <tr bgcolor="#CCCCCC"> 
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">4.</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">Ethereal</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">10.5 
                MB</font></div></td>
            <td height="22" valign="top"class="style0"><div align="center"> </div></td>
          </tr>
          <tr bgcolor="#CCCCCC"> 
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">5.</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">Dictionary 
                9.532</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">5.9 
                MB</font></div></td>
            <td height="22" valign="top"class="style0"><div align="center"> </div></td>
          </tr>
          <tr bgcolor="#CCCCCC"> 
            <td height="22" valign="middle" class="style0"><div align="center"><font color="#339966">6.</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">Superscan</font></div></td>
            <td height="22" valign="middle"class="style0"><div align="center"><font color="#339966">245 
                KB</font></div></td>
            <td height="22" valign="top"class="style0"><div align="center"> </div></td>
          </tr>
        </table>
      </div>
      <div align="center"></div></td>
    <td width="4%" valign="top">&nbsp;</td>
  </tr>
  <tr bgcolor="#657889"> 
    <td height="20" colspan="3">&nbsp;</td>
  </tr>
</table>
</body>
</html>

