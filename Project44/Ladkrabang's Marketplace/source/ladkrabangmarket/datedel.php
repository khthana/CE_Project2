<?

//ลบข้อความตามวันที่กำหนด
   $date1=date("d/m/y"); 
	mysql_connect($host,$user,$passwd);
	$sql = "select code from  date_delete where date='$date1'";
	$result = mysql_db_query($dbname,$sql);
	//$NRow = mysql_num_rows($result);


while ($row = mysql_fetch_array($result)) 
{
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

}//while
?>