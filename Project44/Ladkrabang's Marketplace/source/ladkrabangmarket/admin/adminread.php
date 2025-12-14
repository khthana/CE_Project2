<?
session_start();
if($administrator[0]=='1')
{
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>อ่านคำถาม</TITLE>
<link rel="stylesheet" type="text/css" href="../style.css">	
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="../images/logo_big.gif" width="467" height="54"></td>

    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>


<?
include("../config.inc.php");

	if (empty($page)){
										$page=1;
									}		
	
	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
    $result = mysql_db_query($dbname, "select no from toadmin ");
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
	
	$sql = "select * from toadmin   order by  no DESC limit $goto,$list_page ";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0) { 
							echo "<font size=2 face='MS Sans Serif'>ยังไม่มีหัวข้อ</font><br><br>\n";
								}
	else {

	?>
	<form name="formread" method="post" action="readdel.php"  >
  <table width="100%" border="0">
    <tr>
      <td>
        <div align="right">
          <input type="submit" name="Submit" value="ลบคำถาม">
          
        </div>
      </td>
    </tr>
  </table>
  <?

  	echo "<table width=100% border=0 >\n";
		echo "<tr bgcolor= dodgerblue>\n";
		echo "\t<td align=center width=5%><font size=2 color=#FFF8DC><b>No</b></font></td>\n";
		echo "\t<td align=center width=10%><font size=2 color=#FFF8DC><b>Status</b></font></td>\n";
		echo "\t<td align=center width=45%><font size=2 color=#FFF8DC><b>Topic</b></font></td>\n";
		echo "\t<td align=center width=15%><font size=2 color=#FFF8DC><b>From</b></font></td>\n";
		echo "\t<td align=center width=15%><font size=2 color=#FFF8DC><b>Date</b></font></td>\n";
		echo "\t<td align=center width=10%><font size=2 color=#FFF8DC><b>Delete</b></font></td>\n";
		echo "</tr>\n\n";
	  $date1=date("d/m/y");
while ($row = mysql_fetch_array($result)) 
{
			// กำหนดสีของตาราง เพื่อให้มีการสลับสี
			$bgc = ($bgc=="lightcyan") ? "powderblue" : "lightcyan";
			// กำหนดค่าตัวแปร

				$No=$row["no"];
				$Date=$row["date"];
				$Topic=$row["topic"];
				$Ans=$row["ans"];
				$Sender=$row["sender"];
					echo "<tr bgcolor=$bgc >\n";

			echo "\t<td width=5% align=center> $No</td>\n";
			// แสดงรูป folder
			if($Ans==1){
						    	echo "\t<td width=10% align=center><img src='../images/openfd.gif'></td>\n";
								}else if($Date==$date1){echo "\t<td width=10% align=center><img src='../images/newfd.gif'></td>\n";
								}else{  echo "\t<td width=10% align=center><img src='../images/closefd.gif'></td>\n";
								}
			echo "\t<td width=45% align=left valign=center><a href='readans.php?no=$No' target='_blank'>$Topic</a>";
			echo"\t<td width=15% align=center>$Sender</td>\n";
			echo"\t<td width=15% align=center>$Date</td>\n";
			echo"\t<td width=10% align=center><INPUT TYPE=checkbox NAME=$No></td>\n";
 echo "</tr>\n\n";
	}
echo"</table>";
?>
 <table width="100%" border="0">
    <tr>
      <td>
        <div align="right">
          <input type="submit" name="Submit" value="ลบคำถาม">
          
        </div>
      </td>
    </tr>
  </table>
  </form>
<?

	// table อธิบายความหมายของรูป
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<img src='../images/newfd.gif'> - คำถามใหม่ \n";
		echo "\t<img src='../images/closefd.gif'> - คำถามเก่า \n";
		echo "\t<img src='../images/openfd.gif'> - คำถามที่ถูกตอบแล้ว\n";
		echo "</td></tr>\n";
		echo "</table>\n\n";
// table แสดงเลขหน้า
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<font size=2 color=#9400D3>\n";

		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='adminread.php?page=$prevpage'>[หน้าก่อน = $prevpage]</a>\n";
																			}
		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";
		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='adminread.php?page=$nextpage'>[หน้าถัดไป = $nextpage]</a>\n";
													}
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
	// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='adminread.php?page=$i'>$i</a> \n";
															}
		echo "\t<font size=2 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='adminread.php?page=$i'>$i</a> \n";
															}
			echo "</td></tr>\n";
		echo "</table>\n";

          }//nrow
mysql_close();
?>
<hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF">Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
  </body>
  </html>
  <?
}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}?>