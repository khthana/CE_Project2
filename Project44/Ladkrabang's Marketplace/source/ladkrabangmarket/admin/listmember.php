<?
session_start();

if($administrator[0]=='1')
{
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> รายชื่อสมาชิก</TITLE>
<link rel="stylesheet" type="text/css" href="../style.css">	
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<div align="center">
  <table width="92%" border="0" cellspacing="0" cellpadding="0" height="50">
    <tr> 
      <td height="51" width="11%">&nbsp;</td>
      <td height="51" width="71%"><img src="../images/logo_big.gif" width="467" height="54"></td>
      <td height="51" width="10%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../../index.html">หน้าแรก</a></b></font></td>
      <td height="51" width="8%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ 
        </a></b></font></td>
    </tr>
  </table>
</div>
<hr color=1E90FF>
<?
 include("../config.inc.php");

	if (empty($page)){
										$page=1;
									}		
	
	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
    $result = mysql_db_query($dbname, "select username from member ");
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
	
	$sql = "select username from member   order by  username ASC limit $goto,$list_page ";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0) { 
							echo "<font size=2 face='MS Sans Serif'>ยังไม่มีหัวข้อ</font><br><br>\n";
								}
	else {
		?>
	<form name="formread" method="post" action="deluserbylist.php"  >
  <div align="center">
    <table width="70%" border="0">
      <tr> 
        <td> 
          <div align="right"> 
            <input type="submit" name="Submit" value="ลบสมาชิก">
            <input type="reset" name="reset" value="ยกเลิก">
          </div>
        </td>
      </tr>
    </table>
    <?
		echo "<table width=70% border=0 >\n";
		echo "<tr bgcolor= dodgerblue>\n";
		echo "\t<td align=center width=50%><font size=2 color=#FFF8DC><b>Username</b></font></td>\n";
		echo "\t<td align=center width=10%><font size=2 color=#FFF8DC><b>Delete</b></font></td>\n";
		echo "</tr>\n\n";

while ($row = mysql_fetch_array($result)) 
{
			// กำหนดสีของตาราง เพื่อให้มีการสลับสี
			$bgc = ($bgc=="lightcyan") ? "powderblue" : "lightcyan";
			// กำหนดค่าตัวแปร

				$username=$row["username"];
				echo "<tr bgcolor=$bgc >\n";
				//		echo "\t<td width=44% align=left valign=center><a href='$dfile?Code=$row[code]' target='$Code'>$Topic</a>";
				echo "\t<td width=50% align=center> <a href='../profile.php?Username=$username'>$username</a></td>\n";
				echo"\t<td width=10% align=center><INPUT TYPE=checkbox NAME=$username></td>\n";
				echo "</tr>\n\n";
	}
echo"</table>";
?>
  </div>
  <div align="center">
    <table width="70%" border="0">
      <tr> 
        <td> 
          <div align="right"> 
            <input type="submit" name="Submit" value="ลบสมาชิก">
            <input type="reset" name="reset" value="ยกเลิก">
          </div>
        </td>
      </tr>
    </table>
  </div>
</form>
<?
// table แสดงเลขหน้า
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<font size=2 color=#9400D3>\n";

		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='listmember.php?page=$prevpage'>[หน้าก่อน = $prevpage]</a>\n";
																			}
		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";
		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='listmember.php?page=$nextpage'>[หน้าถัดไป = $nextpage]</a>\n";
													}
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
	// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='listmember.php?page=$i'>$i</a> \n";
															}
		echo "\t<font size=2 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='listmember.php?page=$i'>$i</a> \n";
															}
			echo "</td></tr>\n";
		echo "</table>\n";

          }//nrow
mysql_close();

}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}?>