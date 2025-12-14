<?php session_start(); ?>
<?php  //php function
function print_day($pos){
if($pos==0){echo"จันทร์";}
else if($pos==1){echo"อังคาร";}
else if($pos==2){echo"พุธ";}
else if($pos==3){echo"พฤหัส";}
else if($pos==4){echo"ศุกร์";}
else if($pos==5){echo"เสาร์";}
else if($pos==6){echo"อาทิตย์";}
}
function print_learn_time($learn_time){
$pos=0;
$FindTailMode =false;
$first=true;
while ($pos<7){
if(!$FindTailMode){
										if(substr($learn_time,$pos,1)==1){
											if(!$first){echo",";}
											print_day($pos); 
											$first=false;
											if(substr($learn_time,$pos+1,1)==1)
											{echo "-"; $FindTailMode=true;}
										}
									}
else if (substr($learn_time,$pos+1,1)==0 ||  $pos==6){print_day($pos);  $FindTailMode=false;}
$pos++;
}//while
}//function
?>
<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_config = "SELECT * FROM config";
$config = mysql_query($query_config, $conn) or die(mysql_error());
$row_config = mysql_fetch_assoc($config);
$totalRows_config = mysql_num_rows($config);
//-------------------------------------------------------------
$query_register_rec = "SELECT subject.subject_name,course.learn_time,IP,status FROM course 
left join register on course.course_ID=register.course_ID 
left join subject on course.subject_ID=subject.subject_ID 
where student_ID='$_SESSION[student_ID]' order by subject.subject_name";
$register_rec = mysql_query($query_register_rec, $conn) or die(mysql_error());
$row_register_rec = mysql_fetch_assoc($register_rec);
$totalRows_register_rec = mysql_num_rows($register_rec);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Student index</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	font-size: 20px;
	color: #FF3366;
}
.style2 {	font-size: 16px;
	color: #FF33CC;
}
.style5 {font-size: 16px}
.style6 {
	color: #FF00CC;
	font-weight: bold;
	font-size: 18px;
}
.style7 {color: #FF33CC}
a:link {
	color: #0000FF;
}
a:visited {
	color: #0000FF;
}
a:active {
	color: #0000FF;
}
-->
</style></head>

<body>
<?php include('student_header.htm'); ?>
<table width="860" border="1" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="157" height="245" valign="top"><form name="form1" method="post" action="../logout.php">
       &nbsp;&nbsp;&nbsp;
       <table width="165" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="191" height="20">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="center" class="style2">ยินดีต้อนรับ</div>
              <div align="center" class="style2"><strong>คุณ <strong><?php echo "$name $surname";?></strong></strong></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="center">
              <input type="submit" name="Submit" value="Logout">
          </div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="center" class="style2"><span class="style5">กลับไปหน้าแรก</span>
         
            </div>
              <div align="center" class="style2"><a href="../index.php">คลิกที่นี</a></div></td>
        </tr>
      </table>
    </form></td>
    <td width="500" valign="top"><div align="center" class="style1">
      <table width="408" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="377">&nbsp;</td>
        </tr>
        <tr>
          <td><?php if($totalRows_register_rec>0){?><div align="center" class="style6">Subject</div><?php } ?></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      	  <?php if($totalRows_register_rec>0){?>
		  <table width="500" border="1">
        <tr bgcolor="#FF99CC">
          <td width="20"><div align="center">No</div></td>
          <td width="200"><div align="center">Subject name </div></td>
          <td colspan="2"><div align="center">Learn time(live)</div> </td>
        <td><div align="center">Status </div></td>
        </tr>
		<?php $No="1"; $not_show=true; ?>
		<?php do{ ?>
		<tr>
          <td><div align="center"><?php echo $No; $No++;?></div></td>
          <td><div align="center"><?php echo $row_register_rec['subject_name'];?></div></td>
          <td width="70"><div align="center"><?php print_learn_time($row_register_rec['learn_time']);?></div></td>
        <td width="60"><div align="center"><?php echo substr($row_register_rec['learn_time'],8,11); ?></div></td>
          <td><div align="center"><?php if($row_config['money_require']==0){echo"<a href='learn_choice.php?IP=$row_register_rec[IP]'>Learn</a>";}
		   else{if($row_register_rec['status']=="cashed"){echo "<a href='learn_choice.php'>Learn</a>"; }
					else if($row_register_rec['status']=="wait"){echo"<font color ='ff0000'>ยังไม่ได้ชำระเงิน</font>"; $not_show=false;}
					else {echo"<font color='ff6600'>ยังไม่ได้ชำระเงินเพิ่มจากการเปลี่ยนวิชา</font>"; 
							if($totalRows_register_rec>0){$not_show=false;}
						 }
					}  ?> 
		   </div></td>
        </tr>
	  <?php } while($row_register_rec = mysql_fetch_assoc($register_rec))?>
	  </table><?php } else{?> 
	  <span class="style7">ยังไม่ได้ลงทะเบียนวิชาค่ะ</span>
	  <?php }?>
	       <br><?php /*if(!$not_show){echo"<div align='center'><a href='how_to_cash.htm'><font size='+0'>ดูวิธีการชำระเงิน คลิกที่นี่</font></a></div>";}*/?>
    </div></td>
  <td width="195" valign="top"><img src="../Images/Student_right_menu.gif" width="195" height="243" border="0" usemap="#Map2"></td>
  </tr>
  <tr>
    <td height="384" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
</table>
<map name="Map2">
  <area shape="rect" coords="8,141,134,160" href="question_show.php">
</map>
</body>
</html>
<?php
mysql_free_result($config);

mysql_free_result($register_rec);
?>
