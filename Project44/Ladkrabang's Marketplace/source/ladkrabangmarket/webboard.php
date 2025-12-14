<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Webboard </TITLE>
<link rel="stylesheet" type="text/css" href="style.css">	
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<?
include("config.inc.php");
include("function.php");

	if (empty($page)){
										$page=1;
									}		
	
	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
    $result = mysql_db_query($dbname, "select code from post  where code like '$menu%' ");
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
	
	$sql = "select * from post   where code like  '$menu%' order by  code DESC limit $goto,$list_page ";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0) { 
							echo "<font size=2 face='MS Sans Serif'>ยังไม่มีหัวข้อ</font><br><br>\n";
								}
	else {
	
////////////////////////แสดงตรงหัวที่ประกาศในแต่ละเมนู
//	$dname=substr($Code,0,1);
	switch($menu){

	case "B" :    
		               echo "<table width=100% border=0>";
						    echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
						echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงประกาศสิ่งพิมพ์</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
			   			    echo	"		</table>";
				//			echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
				//			echo "  href='post/postbook.html'"; 
				//			echo  "target='_blank'>ลงประกาศสิ่งพิมพ์ </a></font></div> ";
				//echo"<img src='images/post_book.gif' width='120' height='25' align='center' border='0'>"; 
							echo "<a href='post/postbook.html' target='_blank'><img src='images/topic.jpg'"; echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
							break;
    case "E"  :  echo "<table width=100% border=0>";
						   echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
							echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงประกาศอุปกรณ์การเรียน</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
							echo	"		</table>";
               //              echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
				//			echo "  href='post/postequipment.html'"; 
				//			echo  "target='_blank'>ลงประกาศอุปกรณ์การเรียน </a></font></div> ";					
						echo "<a href='post/postequipment.html' target='_blank'><img src='images/topic.jpg'"; 
						echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
						break;
	case "V" : echo "<table width=100% border=0>";
						   echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
							echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงประกาศยานพาหนะ</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
							echo	"		</table>";
                        //    echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
						//	echo "  href='post/postvehicle.html'"; 
						//	echo  "target='_blank'>ลงประกาศยานพาหนะ</a></font></div> ";
						echo "<a href='post/postvehicle.html' target='_blank'><img src='images/topic.jpg'"; 
						echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
						break;
	case "H" : echo "<table width=100% border=0>";
						   echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
							echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงประกาศที่พัก</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
							echo	"		</table>";
                //        echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
				//			echo "  href='post/postaddress.html'"; 
				//			echo  "target='_blank'>ลงประกาศที่พัก</a></font></div> ";
						echo "<a href='post/postaddress.html' target='_blank'><img src='images/topic.jpg'"; 
						echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
						break;
	case "F" :  echo "<table width=100% border=0>";
						   echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
							echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงประกาศหาเพื่อน</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
							echo	"		</table>";
                        //    echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
						//	echo "  href='post/postfriends.html'"; 
						//	echo  "target='_blank'>ลงประกาศหาเพื่อน</a></font></div> ";
							echo "<a href='post/postfriends.html' target='_blank'><img src='images/topic.jpg'"; echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
						break;
	case "N" :  echo "<table width=100% border=0>";
						   echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
							echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงข่าวฝากประกาศ</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
							echo	"		</table>";
                     //      echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
					//		echo "  href='post/postnews.html'"; 
					//		echo  "target='_blank'>ลงข่าวฝากประกาศ</a></font></div> ";
							echo "<a href='post/postnews.html' target='_blank'><img src='images/topic.jpg'"; echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
						break;
	case "A" : echo "<table width=100% border=0>";
						   echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
							echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงประกาศอื่น ๆ</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
							echo	"		</table>";
                   //        echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
					//		echo "  href='post/postetc.html'"; 
					//		echo  "target='_blank'>ลงประกาศอื่น ๆ</a></font></div> ";
						echo "<a href='post/postetc.html' target='_blank'><img src='images/topic.jpg'"; 
						echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
						break;
	case "L" : echo "<table width=100% border=0>";
						   echo	"<tr>";
							echo	"		<td bgcolor=#9999FF height=20>"; 
							echo	"	<div align=center><font face=MS Sans Serif, Microsoft Sans Serif size=3><b>";	
							echo "   <font color=#FFFFFF>แสดงประกาศของหาย</font></b></font></div>";
							echo	"		</td>";
							echo	"		</tr>";
							echo	"		</table>";
                      //     echo  "<div align=right><font face='MS Sans Serif, Microsoft Sans Serif' size=2><a ";
					//		echo "  href='post/postlost.html'"; 
					//		echo  "target='_blank'>ลงประกาศของหาย</a></font></div> ";
							echo "<a href='post/postlost.html' target='_blank'><img src='images/topic.jpg'"; echo "width='104' height='18' border='0' align='right'></a><br><br>" ;
						break;

							}

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
			
$chknew=date("ymd",mktime(0,0,0,date("m"),date("d")-3));

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
			echo "<tr bgcolor=$bgc >\n";
	if($Date>=$chknew){$isnew=1;}else{$isnew=0;}
	
	
	$Date=showdate($Date);
	//
if($Price==0){$Price="ไม่ระบุ";}

if($menu=='F' || $menu=='L' || $menu=='N'){$Price='-';}
//
	//กำหนดไฟล์ที่ใช้ show		
	$dfile=substr($Code,0,1);
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
$Pic=$row1["picture"];
$Member=$row1["member"];
// แสดงคำถาม
			echo "\t<td width=10% align=center> $Code</td>\n";
	    	echo "\t<td width=10% align=center>$Status</td>\n";
//			echo "\t<td width=44% align=left valign=center><a href='$dfile?Code=$row[code]&PHPSESSID=$PHPSESSID' target='$Code'>$Topic</a>";
			echo "\t<td width=44% align=left valign=center><a href='$dfile?Code=$row[code]' target='$Code'>$Topic</a>";
		
		if($Reply>5){echo"<img src='images/tc.gif'  width=10></img><img src='images/hot.gif' ></img>";}
         if($Pic){echo"<img src='images/tc.gif'  width=10></img><img src='images/pic.gif' ></img>";}	
		 if($Member==1){echo"<img src='images/tc.gif'  width=10></img><img src='images/member.gif' ></img>";}
			 if($isnew){echo"<img src='images/tc.gif'  width=10></img><img src='images/new.gif' ></img>";}
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
		echo "\t<img src='images/new.gif'> - ประกาศใหม่\n";
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
			echo "\t<a href='webboard.php?page=$prevpage&menu=$menu'>[ << Prev ]</a>\n";
																			}
		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";
		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='webboard.php?page=$nextpage&menu=$menu'>[ Next >> ]</a>\n";
													}
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
	// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='webboard.php?page=$i&menu=$menu'>$i</a> \n";
															}
		echo "\t<font size=1 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='webboard.php?page=$i&menu=$menu'>$i</a> \n";
															}
			echo "</td></tr>\n";
		echo "</table>\n";

}
mysql_close();
?> 
</BODY>
</HTML>