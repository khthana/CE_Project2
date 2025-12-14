<?
session_start();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="style.css">	
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<?
include("config.inc.php");
include("function.php");


if($SESSION[membername]){
	
	
	if (empty($page)){
										$page=1;
									}		
	
	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
    $result = mysql_db_query($dbname, "select  code from poster  where username='$SESSION[membername]' and member='1' ");
	$NRow = mysql_num_rows($result);
	
	$rt = $NRow%$list_page;
	if($rt!=0)		{ 
							$totalpage = floor($NRow/$list_page)+1; 
						}
		else	  {
					$totalpage = floor($NRow/$list_page); 
					}
	$goto = ($page-1)*$list_page;

	// Query ข้อมูลตามจำนวนที่กำหนด

$sql="	select * from post,poster where post.code=poster.code and username='$SESSION[membername]'  and member='1' order by post.date DESC,post.code DESC limit $goto,$list_page   ";

	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0) { 
							echo "<font size=2 face='MS Sans Serif'>ยังไม่มีหัวข้อของคุณ</font><br><br>\n";
								}
	else {

//		echo "<table width=100% border=1 bordercolor=black cellspacing=0 cellpadding=2>\n";
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
while ($row = mysql_fetch_array($result)) 
{
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
			$Date=showdate($Date);
			echo "<tr bgcolor=$bgc >\n";

	if($Price==0){$Price="ไม่ระบุ";}
	
	//กำหนดไฟล์ที่ใช้ show		
	
	$dfile=substr($Code,0,1);
	if($dfile=='F' || $dfile=='L' || $dfile=='N'){$Price='-';}

	switch($dfile){
	case "B" :	$dfile='showbook.php';
							break;
    case "E"  : $dfile='showequ.php';
							break;
	case "V" :$dfile='showveh.php';
						break;
	case "H" :$dfile='showaddress.php';
						break;
	case "F" :$dfile='showfriend.php';
						break;
	case "N" :$dfile='shownews.php';
						break;
	case "A" :$dfile='showetc.php';
						break;
					
	case "L" :$dfile='showlost.php';
						break;					
							}


//ตรวจสอบว่ามีรูปภาพหรือไม่
$sql1="select picture,member from poster where code='$Code'";
$result1 = mysql_db_query($dbname,$sql1);
$row1= mysql_fetch_array($result1); 
$Pic=$row1[0];
$Member=$row1["member"];
// แสดงคำถาม
			echo "\t<td width=10% align=center> $Code</td>\n";
	    	echo "\t<td width=10% align=center>$Status</td>\n";
//			echo "\t<td width=44% align=left valign=center><a href='$dfile?Code=$row[code]&PHPSESSID=$PHPSESSID' target='$Code'>$Topic</a>";
				echo "\t<td width=44% align=left valign=center><a href='$dfile?Code=$row[code]' target='$Code'>$Topic</a>";
		
		if($Reply>5){echo"<img src='images/tc.gif'  width=10></img><img src='images/hot.gif' ></img>";}
         if($Pic){echo"<img src='images/tc.gif'  width=10></img><img src='images/pic.gif' ></img>";}	
		 if($Member==1){echo"<img src='images/tc.gif'  width=10></img><img src='images/member.gif' ></img>";}
			
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
		echo "\t<img src='images/hot.gif'> - ประกาศยอดนิยม \n";
		echo "\t<img src='images/pic.gif'> - มีรูปภาพ \n";
		echo "\t<img src='images/member.gif'> - ประกาศของสมาชิก\n";
		echo "</td></tr>\n";
		echo "</table>\n\n";

			// table แสดงเลขหน้า
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<font size=1 color=#9400D3>\n";

		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='postself.php?page=$prevpage'>[ << Prev ]</a>\n";
		}
		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";
		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='postself.php?page=$nextpage'>[ Next >> ]</a>\n";
		}
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
	// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='postself.php?page=$i'>$i</a> \n";
		}
		echo "\t<font size=1 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='postself.php?page=$i'>$i</a> \n";
		}
			echo "</td></tr>\n";
		echo "</table>\n";
}
mysql_close();

}else{ echo"กรุณา Login ก่อนเข้าระบบ ";}
?> 

</BODY>
</HTML>
