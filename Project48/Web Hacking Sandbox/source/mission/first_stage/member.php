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
<body background="pic/line.gif" link="#FFFFFF" vlink="#330000"  bgproperties="fixed" >

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
      <table width="52%" border="1" align="left" cellspacing="0" bordercolor="#333333" bgcolor="#CCCCCC">
        <tr> 
          <td width="47%" height="22" bgcolor="#657889" class="style0"><div align="center"></div>
            <div align="center">ยินดีต้อนรับคุณ<font color="#FF0000"> </font> 
              <b> 
              <?php  echo $data[1];?>
              </b> </div></td>
          <td width="53%" bgcolor="#657889" class="style0"><div align="center">สถานะภาพ ::<?php echo $data[3]; ?> 
              ::</div></td>
        </tr>
        <tr> 
          <td height="22" colspan="2" class="style0"> 
            <?php 
		  echo "<table width=\"100%\"border=1 bordercolor=\"#333333\"  align=\"left\">";
			  echo "<tr class=\"style0\">";                            
                           echo "<th bgcolor = #657889 ><font color=#FFFFFF>No.</font></th>";                      
                           echo "<th bgcolor = #657889><font color=#FFFFFF>user name</font></th>";                         
                           //echo "<th bgcolor = #FF8F20><font color=#FFFFFF>Email Address</font></th>";                      
                           echo "<th bgcolor = #657889><font color=#FFFFFF>สถานะ</font></th>";
						   echo "<th bgcolor = #657889><font color=#FFFFFF>สิทธิ</font></th>";
           $sql="SELECT * FROM profile;";
		   $command=mysql_query($sql);
		                $count=0;
						 while($info= mysql_fetch_array($command)){
						       $count++;
							   //if($info[4]==1)$permitt="VIP";
							 //  else $permitt="user ต๊อกต๋อย";
	    		             echo "<tr>";
	    		                   			echo "<td align=center width=3% bgcolor = #CCCCCC class=\"style0\">";if($user==$info[1])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "&nbsp;&nbsp;&nbsp;$count :</font></td>"; 
	    		                   			echo "<td align=middle width=10% bgcolor = #CCCCCC class=\"style0\">";if($user==$info[1])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "$info[1]</font></td>";
                                          // echo "<td align=middle width=15% bgcolor = #FFF0E1 class=\"style0\">";if($user==$info[1])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "$info[1]</font></td>";
                                           echo "<td align=middle width=6% bgcolor = #CCCCCC class=\"style0\">";if($user==$info[1])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "$info[3]</font></td>";
										   echo "<td align=middle width=10% bgcolor = #CCCCCC class=\"style0\">";if($user==$info[1])echo "<font color=#ff0000>";else echo "<font color=#000000>";if($info[3]=="user")echo "ดูได้อย่างเดียว</font></td>";else echo "ดู+download</font></td>";
                                        echo "</tr>";                                
	    		      }
	    		     echo "</tr>";   
	    		  echo "</table>";
				 
		  ?>
          </td>
        </tr>
      </table>
      <div align="left"><br>
        <br>
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

