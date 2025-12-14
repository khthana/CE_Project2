	<html>
	<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="../style.css">	
	</head>
	<body bgcolor=#FFFFFF>
<?
	include("../config.inc.php");
	include("../function.php");
	$search_topic = $search;
	$search = strtolower(trim($search));
	
$dcode=$select;
if($dcode=='C'){  $flag=1;}

	if (empty($page)){
		$page=1;
	}

	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
	if($flag==1){
	$sql = "select code from post where  topic like '%$search%' ";
	}else{
	$sql = "select code from post where  topic like '%$search%' and code like '$dcode%' ";
	}
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
	echo "ผลจากการค้นหาคำว่า \" <b>$search_topic </b>\" เจอทั้งหมดจำนวน \" <b>$NRow</b> \" ประกาศ\n";
	echo "</font><br><br>\n\n";
$chknew=date("ymd",mktime(0,0,0,date("m"),date("d")-3));
	// Query ข้อมูลตามจำนวนที่กำหนด
//	$sql = "select * from post where  topic like '%$search%' and code like '$dcode%' order by code DESC limit $goto,$list_page";
	if($flag==1){
   $sql = "select * from post where  topic like '%$search%'  order by date DESC,code DESC limit $goto,$list_page";
	}else{
	$sql = "select * from post where  topic like '%$search%' and code like '$dcode%' order by date DESC,code DESC limit $goto,$list_page";
}
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
			echo "\t<a href='search.php?search=$search&page=$prevpage'>[ << Prev ]</a>\n";
		}
		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";
		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='search.php?search=$search&page=$nextpage'>[ Next >> ]</a>\n";
		}
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
	// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='search.php?search=$search&page=$i'>$i</a> \n";
		}
		echo "\t<font size=1 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='search.php?search=$search&page=$i'>$i</a> \n";
		}
			echo "</td></tr>\n";
		echo "</table>\n";
}

?> 
</BODY>
</HTML>	

