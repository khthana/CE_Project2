<?
session_start();

?>
<html>
<head></head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="../images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>

<?
	include("../config.inc.php");
$code=$codedel;
mysql_connect($host,$user,$passwd);
if($administrator[0]=='1')
{
  $table=substr($code,0,1);
	switch($table){
	case "B" :	$table='book_data';
						$table1='book_ans';
							break;
    case "E"  : $table='equipment_data';
						$table1='equipment_ans';
							break;
	case "V" :$table='vehicle_data';
					$table1='vehicle_ans';
						break;
	case "H" :$table='address_data';
					$table1='address_ans';
						break;
	case "F" :$table='friends_data';
					$table1='friends_ans';	
						break;
	case "N" :$table='news_data';
					$table1='news_ans';	
						break;
	case "A" :$table='etc_data';
					$table1='etc_ans';	
						break;
	case "L" :$table='lost_data';
					$table1='lost_ans';	
						break;
							}//switch

if($ans_no=='ALL')
  {
    $sql1="delete from post where code='$code'";
   $sql2="delete from poster where code='$code'";
   $sql3="delete from date_delete where code='$code'";
   $sql4="delete from $table where code='$code'";
   $sql5="delete from $table1 where code='$code'";
	 
 $result1 = mysql_db_query($dbname,$sql1);
 $result2 = mysql_db_query($dbname,$sql2);
  $result3 = mysql_db_query($dbname,$sql3);
 $result4 = mysql_db_query($dbname,$sql4);
  $result5 = mysql_db_query($dbname,$sql5);
  $fileimg="../pic/".$code;
if( file_exists($fileimg.".gif") ){ unlink("../pic/".$code.".gif") ; }
if( file_exists($fileimg.".jpg") ){ unlink("../pic/".$code.".jpg") ; }

if($result1!=0 && $result2!=0 && $result3!=0 && $result4!=0 && $result5!=0 )
{
?>
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="50%" border="1" cellspacing="0" cellpadding="0" align="center" height="100" bgcolor="#CAFFFF" bordercolor="#CC00FF">
  <tr>
    <td>
      <p align="center"><b><font face="MS Sans Serif" size="3" color="#0000FF">ลบประกาศที่ 
        <?echo $code ?>
        </font></b></p>
      <p align="center"><font face="MS Sans Serif" size="3" color="#0000FF"><b>เรียบร้อยแล้ว</b></font></p>
    </td>
  </tr>
</table>
<?
}else{
?> 
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="50%" border="1" cellspacing="0" cellpadding="0" align="center" height="100" bgcolor="#FFF0F8" bordercolor="#00CCFF">
  <tr>
    <td>
      <p align="center"><b><font face="MS Sans Serif" size="3" color="#FF0000">ไม่สามารถลบประกาศ 
        <?echo $code ?>
        ได้</font></b></p>
      <p align="center"><font color="#FF0000"><b><font face="MS Sans Serif" size="3">กรุณาตรวจสอบ</font></b></font></p>
      </td>
  </tr>
</table> 
<?
}//result
  }else//ans_no
  {
      $sql1="select  no from $table1  where code='$code' order by no ";
	 $result1 = mysql_db_query($dbname,$sql1);
	while ($row = mysql_fetch_array($result1)) {
    $num=$num+1;
    
      if($num==$ans_no){      
												//ลบคำตอบ
												$sql7="delete from $table1 where no='$row[0]' "; 
												 $result7 = mysql_db_query($dbname,$sql7);
	  											//ลบจำนวนคำตอบ
												$sql8 = "UPDATE post SET reply=reply-1  WHERE code='$code' ";
												$result8 = mysql_db_query($dbname,$sql8);
													}
   }//while
if($result7!=0 &&$result8!=0)
{
?>
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="50%" border="1" cellspacing="0" cellpadding="0" align="center" height="100" bgcolor="#FFFFFF" bordercolor="#0033FF">
  <tr>
    <td>
      <p align="center"><b><font face="MS Sans Serif" size="3" color="#FF6666">ลบคำตอบที่ 
        <?echo $ans_no ?>
        ของประกาศ 
        <?echo $code ?>
        </font></b></p>
      <p align="center"><font face="MS Sans Serif" size="3" color="#FF6666"><b>เรียบร้อยแล้ว</b></font></p>
    </td>
  </tr>
</table>
<?
}else{
?> 
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="50%" border="1" cellspacing="0" cellpadding="0" align="center" height="100" bgcolor="#FFFFFF" bordercolor="#FF0000">
  <tr>
    <td>
      <p align="center"><b><font face="MS Sans Serif" size="3" color="#EF72A7">ไม่สามารถลบคำตอบที่
        <? echo $ans_no ?>
        ของประกาศ 
        <?echo $code ?>
        ได้</font></b></p>
      <p align="center"><font color="#EF72A7"><b><font face="MS Sans Serif" size="3">กรุณาตรวจสอบ</font></b></font></p>
      </td>
  </tr>
</table> 
<?
}//result

}//ans no

}else//admin
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}
mysql_close();
?>
 <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size=2>Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
  </body>
  </html>