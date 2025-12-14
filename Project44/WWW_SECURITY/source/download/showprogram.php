<?
include "interface.inc.php";
include "outputlib.php";
include "db.php";
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open("<center>");
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

$PHP_SELF = $HTTP_SERVER_VARS["PHP_SELF"];
//  ใช้เมื่อได้กำหนดให้ตัวแปรโกลบอลในไฟล์ php.ini เป็น off

$pname = $HTTP_GET_VARS["pname"];

if (!$pname) {
?>
<table  border=1  cellpadding=5  cellspacing=0  align="right">
		  
			
<?						//  เมนูให้เลือกหมวดหมู่ของโปรแกรม
    				$query = "select subj_id,subj_name from program_subject";
					$data_query = mysql_query($query) or die("ส่งคิวรี 1 ไม่ได้");
?>
					<tr  id=table3>  <td  colspan=2><h3>โปรแกรม</h3></td>  </tr>
<?
					while ($arr = mysql_fetch_array($data_query) ) {
							$i = $arr[subj_id];
							
							$query6 = "select count(*) as num from download_program where subj_id='$i'";
							$data_query6 = mysql_query($query6) or die("ส่งคิวรี select count(*) เพื่อนับจำนวนโปรแกรมในหมวดหมู่ไม่ได้");
							$arr6 = mysql_fetch_array($data_query6);
							$number = $arr6[num];
?>							
							<tr  id=table1>  <td><? echo "<a href=$PHP_SELF?a=$i>$arr[subj_name]</a><br>"; ?></td>
									<td><? echo "$number"; ?></td>
							</tr>
<?
					}
?>

</table>
<?
}   // end if (!$pname)

$a = $HTTP_GET_VARS["a"];
if ($a) {
		$query5 = "select subj_name from program_subject where subj_id = '$a'";
		$data_query5 = mysql_query($query5) or die("ส่งคิวรี select subj_name ในตาราง program_subject ไม่ได้");
		$arr5 = mysql_fetch_array($data_query5);
		$subj_name = $arr5[subj_name];
?>
		<center><h2>หมวด<?  echo " $subj_name"; ?></h2></center>
<?
		$query2 = "select name, detail, filename, size, user_add, date_format(date_add, '%e %b %Y, %H:%i') as date_add, download, user  from download_program where subj_id='$a' order by id desc";
		$data_query2 = mysql_query($query2) or die("ส่งคิวรี select ทุก field ในตาราง download_program ไม่ได้");
		while ($arr2 = mysql_fetch_array($data_query2) ) {
				$name = $arr2[name];
				$detail = $arr2[detail];
				$filename = $arr2[filename];
				$size = $arr2[size];
				$user_add = $arr2[user_add];
				$date_add = $arr2[date_add];
				$download = $arr2[download];
				$user = $arr2[user];
?>
				<table  border=1  cellpadding=2  cellspacing=0  width=400  height=100>
<?
?>																   <!--   <?=$filename?> ใช้แทน <? echo $filename; ?> ได้  -->
						<tr  id=table3>  <td  colspan=2  align=center><a href="../download/downloadprogram.php?pname=<?=$filename?>"  Target='_blank'><?=$name?></a></td>
<!--								<td>		
										<? 
												if ($user == "L") {
													echo "<b>เฉพาะสต๊าฟเท่านั้นที่ดาวน์โหลดได้</b><br>";
												}
												elseif ($user == "G") {
													echo "<b>คนทั่วไปสามารถดาวน์โหลดได้</b><br>";
												}
										?>
								</td>  
-->						
						</tr>
						<tr  id=table1>  <td><b>จำนวนครั้งที่มีการดาวน์โหลด : </b></td>  <td><? echo $download; ?></td>  </tr>
						<tr  id=table1>  <td><b>วัน-เวลาที่อัพโหลด : </b></td>  <td><? echo $date_add; ?></td>  </tr>
    						<tr  id=table1>  <td><b>ขนาดไฟล์ : </b></td>  <td><? echo "$size  ไบต์"; ?></td>  </tr>
						<tr  id=table1>  <td><b>รายละเอียด : </b></td>  <td><? echo $detail; ?></td>  </tr>
						<tr  id=table1>  <td><b>โดย : </b></td>  <td><? echo $user_add; ?></td>  </tr>
						<br><br>
		    	</table>
<?	
		}    // end while loop

}     // end if ($a)


 curve_close("</center>");
 empty_5();
 ?>
     