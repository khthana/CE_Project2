<html>
	<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="../style.css">	
	</head>
	<body bgcolor=#FFFFFF>
	<?
	include("../config.inc.php");
include("../function.php");
$search_topic = $word;
$word = strtolower(trim($word));

mysql_connect($host,$user,$passwd);


	switch($cat){
	case "B" :	$Table='book_data';
						

						if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{

						if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code  ";}
						else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}

								}

						if($word){
							$sql=$sql."and (topic like '%$word%' or  detail like '%$word%' or bookname like '%$word%' or author like '%$word%' or publisher like '%$word%' )";
						}
							break;


    case "E"  : $Table='equipment_data';

							if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{



						if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code  ";}
						else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}

									}					
							if($word){
							$sql=$sql."and (topic like '%$word%' or detail like '%$word%' or brand like '%$word%' or model like '%$word%' )";			
										}
						
							break;
	case "V" :$Table='vehicle_data';

						if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{

					if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code ";}
					else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}
						
							}
							
							if($word){
							$sql=$sql."and (topic like '%$word%' or detail like '%$word%' or brand like '%$word%' or model like '%$word%' or color like '%$word%' or license like'%word%')";
							}
						break;
	case "H" :$Table='address_data';

							if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{

						if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code ";}
						else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}
						}
							
							if($word){
								$sql=$sql."and (topic like '%$word%' or detail like '%$word%' or name like '%$word%' or type like '%$word%' or address like '%$word%' or no_room like '%$word%' or size like '%$word%' or tela like '%$word%' )";
							}
						break;
	case "F" :$Table='friends_data';

							if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{
						if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code ";}
						else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}

						}
							if($word){
								$sql=$sql."and (topic like '%$word%' or detail like '%$word%' or fullname like '%$word%' or nickname like '%$word%' or faculty like '%$word%' or class like '%$word%' or e_mail like '%$word%' or icq like '%$word%' or tel like '%$word%' or pager like '%$word%' or year like '%$word%' )";
							}
						break;
	case "N" :$Table='news_data';
							if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{

						if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code ";}
						else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}
						}
							if($word){
								$sql=$sql."and (topic like '%$word%' detail like '%$word%' )";
							}
						break;
	case "A" :$Table='etc_data';

					if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{
					
						if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code ";}
						else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}
						
							}
							if($word){
							$sql=$sql."and (topic like '%$word%' or detail like '%$word%' or brand like '%$word%' or model like '%$word%' )";	}		
							break;
	case "L" :$Table='lost_data';

							if($icq||$id||$fac||$bra||$year)
						{
							if($status=='all'){ $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' ";}
						else { $sql="select * from post ,$Table,poster,member where post.code=$Table.code and post.code=poster.code and poster.username=member.username and member='1' and status='$status'  ";}
						
						
						}else{
						if($status=='all'){ $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code ";}
						else { $sql="select * from post ,$Table,poster where post.code=$Table.code and post.code=poster.code and status='$status'  ";}
						}
							if($word){
								$sql=$sql."and (topic like '%$word%' or detail like '%$word%' )";
							}
						break;
	}

	   
		
	if($cat=='B'	|| $cat=='E' || $cat =='H' || $cat =='V' || $cat=='A' ) {
		
		switch($eprice){	

  case "0" : $sql=$sql;
				break;
  case "1": $sql=$sql."and price between 0 and 500 ";
				break;
  case "2" :$sql=$sql."and price between 501 and 1000 ";
				break;
  case "3":$sql=$sql."and price between 1001 and 2000 ";
				break;
  case "4" :$sql=$sql."and price between 2001 and 5000 ";
				break;
  case "5":$sql=$sql."and price between 5001 and 10000 ";
				break;
  case "6" :$sql=$sql."and price between 10001 and 30000 ";
				break;
  case "7":$sql=$sql."and price between 30001 and 50000 ";
				break;
  case "8" :$sql=$sql."and price between 50001 and 75000 ";
				break;
  case "9":$sql=$sql."and price between 75001 and 100000 ";
				break;
  case "10" :$sql=$sql."and price >100000 ";
				break;
		}//switch eprice

}//if

	if($cat=='B'	|| $cat=='E' ||  $cat =='V' || $cat=='A' ) {

 switch($con){
		 case "1" : $sql=$sql." and condition like '%ของมือสอง%' ";
							if($percent!="0" ){ 
																$sql=$sql."and percent ='$percent' "; 
																				}					
				
				if($usedyear!='0'){
				  $sql=$sql."and usedyear ='$usedyear' "; }
				if($usedmonth!='0'){			
			      $sql=$sql."and usedmonth ='$usedmonth' ";}
				
			
						break;
		case "2" : $sql=$sql."and condition like '%ของใหม่%' ";
						break;
		case "3" : $sql=$sql;
						break;
				 }//switch con

				 }//if

				

		$date1=date("ymd");
       switch($date){
 case "0" : $sql=$sql;
					break;
 case "1":$sql=$sql."and date='$date1'  ";
				break;
 case "2":
       	    $date2=date("ymd",mktime(0,0,0,date("m"),date("d")-3 ) );
            $sql=$sql."and date between '$date2' and '$date1' ";
		 
				break;
 case "3" :
	 	    $date2=date("ymd",mktime(0,0,0,date("m"),date("d")-5 ) );
			 $sql=$sql."and date between '$date2' and '$date1' ";
				break;
 case "4" :
		      $date2=date("ymd",mktime(0,0,0,date("m"),date("d")-7 ) );
	            $sql=$sql."and date between '$date2' and '$date1' ";
					break;
 case "5":
		      $date2=date("ymd",mktime(0,0,0,date("m"),date("d")-24 ) );
           $sql=$sql."and date between '$date2' and '$date1' ";
				break;
 case "6":
	 	      $date2=date("ymd",mktime(0,0,0,date("m")-1 ) );
		            $sql=$sql."and date between '$date2' and '$date1' ";
				break;
 case "7" :
	 	      $date2=date("ymd",mktime(0,0,0,date("m")-3 ) );
		       $sql=$sql."and date between '$date2' and '$date1' ";
				break;
 case "8" :
	       $date2=date("ymd",mktime(0,0,0,date("m")-6 ) );
	        $sql=$sql."and date between '$date2' and '$date1' ";
					break;
 case "9":
	    $date2=date("ymd",mktime(0,0,0,date("m")-9 ) );
	    $sql=$sql."and date between '$date2' and '$date1' ";
				break;
 case "10":
	    $date2=date("ymd",mktime(0,0,0,date("m")-11 ) );
         $sql=$sql."and date between '$date2' and '$date1' ";
				break;

	   }//switch date

	   

		if($cat=='B'	|| $cat=='E' || $cat =='V' || $cat=='A' ) {
  switch($howsend1){
case "0" : $sql=$sql;
			
					break;
case "1" :$sql=$sql."and howsend like '%นัดเจอเพื่อมารับสินค้า%' ";
				break;

case "2" :$sql=$sql."and howsend like '%ส่งสินค้าผ่านไปรษณีย์%' ";
				break;
  }//switch howsend

  }//if


switch($pic){
case "0" : $sql=$sql;
			
					break;
case "1" : $sql=$sql."and picture <>'' " ;
				break;
  }//switch pic

 if($name){  $sql=$sql."and username='$name' "; 
						}
  if($e_mail){	$sql=$sql."and email='$e_mail' " ;	 }
 
  
  if($icq){ $sql=$sql." and icq='$icq' "; }
  if($fac){ $sql=$sql." and faculty='$fac' ";}
  if($bra){$sql=$sql." and branch='$bra' ";}
  if($year){ $sql=$sql." and year='$year' ";}
 if($id){$sql=$sql." and id like '%$id%' ";}




  
	if (empty($page)){
		$page=1;
	}
// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	$rt = $NRow%$list_page;
	if($rt!=0) { 
		$totalpage = floor($NRow/$list_page)+1; 
	}
	else {
		$totalpage = floor($NRow/$list_page); 
	}
	$goto = ($page-1)*$list_page;

	echo "<font size=2 face='MS Sans Serif'>\n";
	echo "ผลจากการค้นหา เจอทั้งหมดจำนวน \" <b>$NRow</b> \" ประกาศ\n";
	echo "</font><br><br>\n\n";	
$chknew=date("ymd",mktime(0,0,0,date("m"),date("d")-3));
	// Query ข้อมูลตามจำนวนที่กำหนด
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0) { 
			
		echo "</body>\n";
		echo "</html>\n";
		exit();
	}
	// แสดงหัวข้อของบอร์ด
	else {
		echo "<table width=100% border=0 >\n";
		echo "<tr bgcolor= dodgerblue>\n";
//		echo "<tr bgcolor= '#66CCCC'>\n";
		echo "\t<td align=center width=10%><font size=2 color=#FFF8DC><b>รหัส</b></font></td>\n";
		echo "\t<td align=center width=10%><font size=2 color=#FFF8DC><b>สถานะ</b></font></td>\n";
		echo "\t<td align=center width=44%><font size=2 color=#FFF8DC><b>หัวข้อ</b></font></td>\n";
		echo "\t<td align=center width=14%><font size=2 color=#FFF8DC><b>ราคา</b></font></td>\n";
		echo "\t<td align=center width=10%><font size=2 color=#FFF8DC><b>วันที่</b></font></td>\n";
		echo "\t<td align=center width=6%><font size=2 color=#FFF8DC><b>ตอบ</b></font></td>\n";
		echo "\t<td align=center width=6%><font size=2 color=#FFF8DC><b>เข้าดู</font></td>\n";
		echo "</tr>\n\n";
// วนลูปแสดงข้อมูลที่อ่านได้
		while ($row = mysql_fetch_array($result)) {
			
			// กำหนดสีของตาราง เพื่อให้มีการสลับสี
			$bgc = ($bgc=="lightcyan") ? "powderblue" : "lightcyan";

			// กำหนดค่าตัวแปร
			$Code = $row["code"];
			$Status = $row["status"];
			$Topic = $row["topic"];
			$Price = $row["price"];
			$Date =trim($row["date"]);
			$Reply = $row["reply"];
			$Visit = $row["visit"];
			if($Date>=$chknew){$isnew=1;}else{$isnew=0;}
			$Date=showdate($Date);

			if($Price==0){$Price="ไม่ระบุ";}
			if($menu=='F' || $menu=='L' || $menu=='N'){$Price='-';}
			echo "<tr bgcolor=$bgc >\n";
			
//กำหนดไฟล์ที่ใช้ show		
	$dfile=substr($Code,0,1);
	switch($dfile){
	case "B" :	$dfile='../showbook.php';
							break;
    case "E"  : $dfile='../showequ.php';
							break;
	case "V" :$dfile='../showveh.php';
						break;
	case "H" :$dfile='../showaddress.php';
						break;
	case "F" :$dfile='../showfriend.php';
						break;
	case "N" :$dfile='../shownews.php';
						break;
	case "A" :$dfile='../showetc.php';
						break;
	case "L" :$dfile='../showlost.php';
						break;
							
							}

//ตรวจสอบว่ามีรูปภาพหรือไม่
$sql1="select picture,member from poster where code='$Code'";
$result1 = mysql_db_query($dbname,$sql1);
$row1= mysql_fetch_array($result1); 
$Pic=$row1["picture"];
$Member=$row1["member"];
// แสดงคำถาม
			echo "\t<td width=10% align=center> $Code</td>\n";
	    	echo "\t<td width=10% align=center>$Status</td>\n";
			echo "\t<td width=44% align=left valign=center><a href='$dfile?Code=$row[code]' target='$Code'>$Topic</a>";
		
		if($Reply>5){echo"<img src='../images/tc.gif'  width=10></img><img src='../images/hot.gif' ></img>";}
         if($Pic){echo"<img src='../images/tc.gif'  width=10></img><img src='../images/pic.gif' ></img>";}	
		 if($Member==1){echo"<img src='../images/tc.gif'  width=10></img><img src='../images/member.gif' ></img>";}
			 if($isnew){echo"<img src='../images/tc.gif'  width=10></img><img src='../images/new.gif' ></img>";}	
			echo"</td>\n";
			echo "\t<td width=14% align=center>$Price</td>\n";
			echo"\t<td width=10% align=center>$Date</td>\n";
			echo"\t<td width=6% align=center>$Reply</td>\n";
			echo"\t<td width=6% align=center>$Visit</td>\n";
		
    echo "</tr>\n\n";
	}
echo"</table>";

			
			// table อธิบายความหมายของรูป
		echo"<br>";
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<img src='../images/new.gif'> - ประกาศใหม่\n";
		echo "\t<img src='../images/hot.gif'> - ประกาศยอดนิยม \n";
		echo "\t<img src='../images/pic.gif'> - มีรูปภาพ \n";
		echo "\t<img src='../images/member.gif'> - ประกาศของสมาชิก\n";
		echo "</td></tr>\n";
		echo "</table>\n\n";

		// table แสดงเลขหน้า
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<font size=1 color=#9400D3>\n";

		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='advsearch.php?word=$word&cat=$cat&eprice=$eprice&con=$con&date=$date&howsend1=$howsend1&pic=$pic&name=$name&e_mail=$e_mail&icq=$icq&fac=$fac&bra=$bra&year=$year&id=$id&page=$prevpage'>[ <<Prev ]</a>\n";
		}
		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";
		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='advsearch.php?word=$word&cat=$cat&eprice=$eprice&con=$con&date=$date&howsend1=$howsend1&pic=$pic&name=$name&e_mail=$e_mail&icq=$icq&fac=$fac&bra=$bra&year=$year&id=$id&page=$nextpage'>[ Next >> ]</a>\n";
		}
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
	// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='advsearch.php?word=$word&cat=$cat&eprice=$eprice&con=$con&date=$date&howsend1=$howsend1&pic=$pic&name=$name&e_mail=$e_mail&icq=$icq&fac=$fac&bra=$bra&year=$year&id=$id&page=$i'>$i</a> \n";
		}
		echo "\t<font size=1 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='advsearch.php?word=$word&cat=$cat&eprice=$eprice&con=$con&date=$date&howsend1=$howsend1&pic=$pic&name=$name&e_mail=$e_mail&icq=$icq&fac=$fac&bra=$bra&year=$year&id=$id&page=$i'>$i</a> \n";
		}
			echo "</td></tr>\n";
		echo "</table>\n";
}
?>
</BODY>
</HTML>
