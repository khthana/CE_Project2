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
<title>stage 3</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:##00ff00;
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
    <td width="3%" valign="bottom"> <div align="left"> 
        <div align="left"> </div>
      </div></td>
    <td width="93%" valign="top"> <table width="30%" border="1" cellspacing="0" bordercolor="#657889" bgcolor="#CCCCCC">
        <tr> 
          <td width='34%' class="style0"><div align="center" class="style0"><a href="product_.php?type=1">Computer</a></div></td>
          <td width='34%' class="style0"><div align="center" class="style0"><a href="product_.php?type=2">Law</a></div></td>
          <td width='32%' class="style0"><div align="center"><a href="product_.php?type=1%20OR%202">All</a></div></td>
        </tr>
      </table>
      <br> 
      <?php
//echo "type = ";echo $type;
if($type=="")$type="1 OR 2";
$result=mysql_query("SELECT PName,Price,Image FROM product  WHERE Type=$type " );
//if($type==1||$type==2)$result=@mysql_query("SELECT PName,Price,Image FROM product WHERE Type=$type ");

 print" <table bgcolor='#CCCCCC' width='100%' height='50%'border='1' cellspacing='1' bordercolor='#657889' align='center'>";
 
$count=0;
print "<tr>";
while ($data=mysql_fetch_array($result)) {
 	$count++;
	 			print"<td  class=\"style0\"  width='50%'><div align='center'><br>
					  <font color=0000ff>$data[0]</font><br><br> ราคา <font color=ff0000>$data[1]</font> บาท<br><br><img src=$data[2] width='100' height='135' align='center'></div></td>";
			   if($count==2){	print"</tr>";$count=0; }
}
	 print "</tr>";
print "</table>";
 ?>
      <div align="center"></div></td>
    <td width="4%" valign="top">&nbsp;</td>
  </tr>
  <tr> 
    <td height="20" colspan="3" bgcolor="#657889">&nbsp;</td>
  </tr>
</table>
</body>
</html>
