<?
session_start();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<?
include("config.inc.php");
mysql_connect($host,$user,$passwd);
$result = mysql_db_query($dbname, "select code from poster  where username='$SESSION[membername]' and member='1' ");
//$NRow = mysql_num_rows($result);
while ($row = mysql_fetch_array($result)) 
{
  if($$row[0]=='on')
  { 
  //echo"$row[0]<br>";}
//กำหนดตารางที่ ลบ	
	$table=substr($row[0],0,1);
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
    $sql1="delete from post where code='$row[0]'";
   $sql2="delete from poster where code='$row[0]'";
   $sql3="delete from date_delete where code='$row[0]'";
   $sql4="delete from $table where code='$row[0]'";
   $sql5="delete from $table1 where code='$row[0]'";
	 
 $result1 = mysql_db_query($dbname,$sql1);
 $result2 = mysql_db_query($dbname,$sql2);
  $result3 = mysql_db_query($dbname,$sql3);
 $result4 = mysql_db_query($dbname,$sql4);
  $result5 = mysql_db_query($dbname,$sql5);
  $fileimg="pic/".$row[0];
if( file_exists($fileimg.".gif") ){ unlink("pic/".$row[0].".gif") ; }
if( file_exists($fileimg.".jpg") ){ unlink("pic/".$row[0].".jpg") ; }

if($result1!=0 && $result2!=0 && $result3!=0 && $result4!=0 && $result5!=0 )
{
?>
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="50%" border="1" cellspacing="0" cellpadding="0" align="center" height="100" bgcolor="#FFFFD7" bordercolor="#FF0000">
  <tr>
    <td>
      <p align="center"><b><font face="MS Sans Serif" size="3" color="#0000FF">ลบประกาศที่</font><font face="MS Sans Serif" size="3" color="#66CCFF"> 
        <?echo $row[0] ?>
        </font></b></p>
      <p align="center"><font face="MS Sans Serif" size="3" color="#66CCFF"><b><font color="#0000FF" size="2">เรียบร้อยแล้ว</font></b></font></p>
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
<table width="50%" border="1" cellspacing="0" cellpadding="0" align="center" height="100" bgcolor="#FFCCFF" bordercolor="#FF0000">
  <tr>
    <td>
      <p align="center"><b><font face="MS Sans Serif" size="3" color="#FF0000">ไม่สามารถลบประกาศ</font><font face="MS Sans Serif" size="3" color="#66CCFF"> 
        <?echo $row[0] ?>
        <font color="#FF0000">ได้</font></font></b></p>
      <p align="center"><b><font face="MS Sans Serif" size="2" color="#FF0000">กรุณาตรวจสอบ</font></b></p>
      </td>
  </tr>
</table> 
<?
}//else
}//if
}//whicth
mysql_close();
?>
 <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size=1>Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
</BODY>
</HTML>
