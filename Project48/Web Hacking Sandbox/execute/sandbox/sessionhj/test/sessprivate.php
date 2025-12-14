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
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<!-- ImageReady Slices (scr.jpg) -->
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD COLSPAN=4>
			<IMG SRC="../../images/scr_01.gif" ALT="" WIDTH=750 HEIGHT=112 border="0" usemap="#Map"></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=4><table width="100%" height="150" border="0">
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
                  <div align="center"><font color="#3399CC"><a href="personal.php">รายชื่อสมาชิก</a></font></div></td>
                <td width="19%" class="style0"><div align="center"><font color="#3399CC"><a href="logout.php"><u>ออกจากระบบ</u></a></font></div></td>
              </tr>
            </table></td>
          <td width="17%" rowspan="3" valign="top"  class="style0">
		  <a  onClick="MM_openBrWindow('mission.php','mission','status=yes,scrollbars=yes,width=800,height=600')" href="#">ข้อมูลเบื้องต้น</a>
<table width="100%" border="0">
              <tr> 
                <td class="style0">
		 <input type="submit" name="Button55" value="ดูค่า session" onClick=see()></td>
              </tr>
            </table><br>
            <a  onClick="MM_openBrWindow('mission.php','mission','status=yes,scrollbars=yes,width=800,height=600')" href="#"> 
            </a></td>
          <td width="2%" rowspan="3">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2" valign="top"><br><table width="100%" height="170" border="1" align="left" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#94CAE4">
              <tr bgcolor="#3399CC"> 
                <td width="6%" height="22" valign="top" class="style0"><div align="center"><font color="#FFFFFF"><strong>No.</strong></font></div></td>
                <td width="62%" valign="top" class="style0"><div align="center"><font color="#FFFFFF"><strong>ชื่อ 
                    Program</strong></font></div></td>
                <td width="15%" valign="top" class="style0"><div align="center"><font color="#FFFFFF"><strong>Size</strong></font></div></td>
                <td width="17%" valign="top" class="style0" ><div align="center"><font color="#FFFFFF"></font></div></td>
              </tr>
              <tr> 
                <td height="22" valign="middle" class="style0"><div align="center">1.</div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFF99">Winamp 
                    5</font></div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFFFF">3 
                    MB</font></div></td>
                <td height="22" valign="top"class="style0"><div align="center"> 
                    <?php  
			 if($data[4]==0){ ?>
                    <input name="Button32" type="button" onClick="MM_popupMsg('user ต๊อกต๋อย ไม่สามารถดาวน์โหลดได้\rVIP เท่านั้นที่สามารถดาวน์โหลดได้')" value="ดาวน์โหลด">
                    <?php ;}else {?>
                    <input name="Button322" type="button" onClick="MM_popupMsg('สำเร็จแล้ว...')" value="ดาวน์โหลด">
                    <?php ;} ?>
                  </div></td>
              </tr>
              <tr> 
                <td height="22" valign="middle" class="style0"><div align="center">2.</div></td>
                <td height="22" valign="middle" class="style0"><div align="center"><font color="#FFFF99">MSN 
                    8.0</font></div></td>
                <td height="22" valign="middle" class="style0"><div align="center"><font color="#FFFFFF">5 
                    MB</font></div></td>
                <td height="22" valign="top"class="style0"><div align="center"> 
                    <?php  
			 if($data[4]==0){ ?>
                    <input name="Button33" type="button" onClick="MM_popupMsg('user ต๊อกต๋อย ไม่สามารถดาวน์โหลดได้\rVIP เท่านั้นที่สามารถดาวน์โหลดได้')" value="ดาวน์โหลด">
                    <?php ;}else {?>
                    <input name="Button33" type="button" onClick="MM_popupMsg('สำเร็จแล้ว...')" value="ดาวน์โหลด">
                    <?php ;} ?>
                  </div></td>
              </tr>
              <tr> 
                <td height="22" valign="middle" class="style0"><div align="center">3.</div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFF99">BitComet</font></div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFFFF">1.8 
                    MB</font></div></td>
                <td height="22" valign="top"class="style0"><div align="center"> 
                    <?php  
			 if($data[4]==0){ ?>
                    <input name="Button3" type="button" onClick="MM_popupMsg('user ต๊อกต๋อย ไม่สามารถดาวน์โหลดได้\rVIP เท่านั้นที่สามารถดาวน์โหลดได้')" value="ดาวน์โหลด">
                    <?php ;}else {?>
                    <input name="Button3" type="button" onClick="MM_popupMsg('สำเร็จแล้ว...')" value="ดาวน์โหลด">
                    <?php ;} ?>
                  </div></td>
              </tr>
              <tr> 
                <td height="22" valign="middle" class="style0"><div align="center">4.</div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFF99">Ethereal</font></div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFFFF">10.5 
                    MB</font></div></td>
                <td height="22" valign="top"class="style0"><div align="center"> 
                    <?php  
			 if($data[4]==0){ ?>
                    <input name="Button34" type="button" onClick="MM_popupMsg('user ต๊อกต๋อย ไม่สามารถดาวน์โหลดได้\rVIP เท่านั้นที่สามารถดาวน์โหลดได้')" value="ดาวน์โหลด">
                    <?php ;}else {?>
                    <input name="Button34" type="button" onClick="MM_popupMsg('สำเร็จแล้ว...')" value="ดาวน์โหลด">
                    <?php ;} ?>
                  </div></td>
              </tr>
              <tr> 
                <td height="22" valign="middle" class="style0"><div align="center">5.</div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFF99">Dictionary 
                    9.532</font></div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFFFF">5.9 
                    MB</font></div></td>
                <td height="22" valign="top"class="style0"><div align="center"> 
                    <?php  
			 if($data[4]==0){ ?>
                    <input name="Button35" type="button" onClick="MM_popupMsg('user ต๊อกต๋อย ไม่สามารถดาวน์โหลดได้\rVIP เท่านั้นที่สามารถดาวน์โหลดได้')" value="ดาวน์โหลด">
                    <?php ;}else {?>
                    <input name="Button35" type="button" onClick="MM_popupMsg('สำเร็จแล้ว...')" value="ดาวน์โหลด">
                    <?php ;} ?>
                  </div></td>
              </tr>
              <tr> 
                <td height="22" valign="middle" class="style0"><div align="center">6.</div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFF99">Superscan</font></div></td>
                <td height="22" valign="middle"class="style0"><div align="center"><font color="#FFFFFF">245 
                    KB</font></div></td>
                <td height="22" valign="top"class="style0"><div align="center"> 
                    <?php  
			 if($data[4]==0){ ?>
                    <input name="Button36" type="button" onClick="MM_popupMsg('user ต๊อกต๋อย ไม่สามารถดาวน์โหลดได้\rVIP เท่านั้นที่สามารถดาวน์โหลดได้')" value="ดาวน์โหลด">
                    <?php ;}else {?>
                    <input name="Button36" type="button" onClick="MM_popupMsg('สำเร็จแล้ว...')" value="ดาวน์โหลด">
                    <?php ;} ?>
                  </div></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
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
  <area shape="rect" coords="2,2,418,112" href="../../index1.html">
</map>
</BODY>
</HTML>