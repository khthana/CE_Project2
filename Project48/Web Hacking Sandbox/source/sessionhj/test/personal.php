<?php

 $DBName="session";
$link=@mysql_pconnect("localhost","player","player");
@mysql_select_db($DBName,$link);

$ciper=$HTTP_COOKIE_VARS["passkey"];
//decyption
$len_ciper=(strlen($ciper)/2);

$plantext=decypt($ciper,$len_ciper);

for($i=0;$i<=($len_ciper);$i++){
 $planstr{$i}=chr($plantext{$i});
}

$planstring = implode("", $planstr);
$plan=trim($planstring);
$row=mysql_query("SELECT * FROM profile WHERE email='$plan' ");
$rownum=mysql_num_rows($row);//WHERE email='' 
if($rownum ==1){
	$data=mysql_fetch_array($row);
	$user=$data[3];
	
		if($data[4]==1)$permitt="VIP";
		else $permitt="user ต๊อกต๋อย";
	//$data[0];==ID    $data[1];==email    $data[2];==Password    $data[3];==user;
}
else{
	header("Location:index.php");
/*echo'	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
			<html>
			<head>
			<title>session logout</title>
			<META http-equiv="refresh" content="0;URL=index.php">
			</head>
			<body >
			</body>
			</html>';*/
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Web Hacking Sandbox... Solution  for protected the Web...</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="../../../../../smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#006699;
        }
		a:link {
	color: #F58227;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #3399CC;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
//-->
<!--
			function see(){ 
 				alert(document.cookie);
 			}
		//-->
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 >
<!-- ImageReady Slices (scr.jpg) -->
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" height="161" border="0">
        <tr> 
          <td width="2%" rowspan="3">&nbsp;</td>
          <td height="26" colspan="2" valign="top" class="style0"> <table width="100%" border="1" align="center" cellspacing="0" bordercolor="#3399CC" bgcolor="#CFE8F3">
              <tr> 
                <td width="34%" height="22" class="style0"><div align="center"></div>
                  <div align="center"><font color="#3399CC">ยินดีต้อนรับคุณ </font> 
                    <font color="#3399CC"><b><?php echo $user; ?></b> </font></div></td>
                <td width="31%" class="style0"><div align="center"><font color="#3399CC">สถานะภาพ 
                    ::</font> <font color="#3399CC"><?php echo $permitt; ?> ::</font></div></td>
                <td width="16%" class="style0"><div align="center"></div>
                  <div align="center"><font color="#3399CC"><a href="sessprivate.php">กลับ</a></font></div></td>
                <td width="19%" class="style0"><div align="center"><font color="#3399CC"><a href="logout.php"><u>ออกจากระบบ</u></a></font></div></td>
              </tr>
            </table></td>
          <td width="17%" rowspan="3" valign="top" class="style0">
		  <a  onClick="MM_openBrWindow('mission.php','mission','status=yes,scrollbars=yes,width=800,height=600')" href="#">ข้อมูลเบื้องต้น</a>
		  <table width="100%" border="0">
              <tr> 
                <td>
				<input type="submit" name="Button55" value="ดูค่า session" onClick=see()></td>
              </tr>
            </table> </td>
          <td width="2%" rowspan="3">&nbsp;</td>
        </tr>
        <tr> 
          <td height="87" colspan="2" valign="top"><br>
            <?php 
		  echo "<table width=\"100%\"border=0  align=\"left\">";
			  echo "<tr class=\"style0\">";                            
                           echo "<th bgcolor = #3399CC ><font color=#FFFFFF>No.</font></th>";                      
                           echo "<th bgcolor = #3399CC><font color=#FFFFFF>user name</font></th>";                         
                           echo "<th bgcolor = #3399CC><font color=#FFFFFF>Email Address</font></th>";                      
                           echo "<th bgcolor = #3399CC><font color=#FFFFFF>สถานะ</font></th>";
						   echo "<th bgcolor = #3399CC><font color=#FFFFFF>สิทธิ</font></th>";
           $sql="SELECT * FROM profile;";
		   $command=mysql_query($sql);
		                $count=0;
						 while($info= mysql_fetch_array($command)){
						       $count++;
							   if($info[4]==1)$permitt="VIP";
							   else $permitt="user ต๊อกต๋อย";
	    		             echo "<tr>";
	    		                   			echo "<td align=center width=3% bgcolor = #CFE8F3 class=\"style0\">";if($user==$info[3])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "&nbsp;&nbsp;&nbsp;$count :</font></td>"; 
	    		                   			echo "<td align=middle width=10% bgcolor = #CFE8F3 class=\"style0\">";if($user==$info[3])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "$info[3]</font></td>";
                                           echo "<td align=middle width=15% bgcolor = #CFE8F3 class=\"style0\">";if($user==$info[3])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "$info[1]</font></td>";
                                           echo "<td align=middle width=6% bgcolor = #CFE8F3 class=\"style0\">";if($user==$info[3])echo "<font color=#ff0000>";else echo "<font color=#000000>";echo "$permitt</font></td>";
										   echo "<td align=middle width=10% bgcolor = #CFE8F3 class=\"style0\">";if($user==$info[3])echo "<font color=#ff0000>";else echo "<font color=#000000>";if($info[4]==0)echo "ดูได้อย่างเดียว</font></td>";else echo "ดู+download</font></td>";
                                        echo "</tr>";                                
	    		      }
	    		     echo "</tr>";   
	    		  echo "</table>";
				 
		  ?>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="style0"><font color="#FF0000">หมายเหตุ</font> ท่านมีสถานะเป็น 
            <?php echo "<font color=ff0000>$permitt </font>: มีสิทธิคือ ";  if($data[4]==0)echo "ไม่สามารถดาวน์โหลดได้ ";else echo "สามารถดาวน์โหลดได้ " ;?></td>
        </tr>
      </table> </TD>
	</TR>
	<TR>
		<TD COLSPAN=3>
			<IMG SRC="../../images/scr_03.gif" WIDTH=641 HEIGHT=41 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_04.gif" WIDTH=109 HEIGHT=41 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=2>
			<IMG SRC="../../images/scr_05.gif" WIDTH=473 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_06.gif" WIDTH=168 HEIGHT=46 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_07.gif" WIDTH=109 HEIGHT=46 ALT=""></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="../../images/scr_08.gif" WIDTH=36 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_09.gif" WIDTH=437 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_10.gif" WIDTH=168 HEIGHT=42 ALT=""></TD>
		<TD>
			<IMG SRC="../../images/scr_11.gif" WIDTH=109 HEIGHT=42 ALT=""></TD>
	</TR>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../images/scr_12.gif" WIDTH=750 HEIGHT=87 ALT=""></TD>
	</TR>
</TABLE>
<!-- End ImageReady Slices -->
<map name="Map">
  <area shape="rect" coords="1,1,418,113" href="../../index1.html">
</map>
</BODY>
</HTML>