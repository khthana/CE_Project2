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
   include("../function.php");
   	if (empty($page)){
										$page=1;
									}		
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

	?>
	<form name="formread" method="post" action="delbyadmin.php?menu=<?echo $menu ?>"  >
  <table width="100%" border="0">
    <tr>
      <td>
        <div align="right">
          <input type="submit" name="Submit" value="ลบประกาศ">
           <input type="reset" name="reset" value="ยกเลิก">
        </div>
      </td>
    </tr>
  </table>
  <?
	echo "<table width=100% border=0 >\n";
		echo "<tr bgcolor= dodgerblue>\n";
		echo "\t<td align=center width=15%><font size=2 color=#FFF8DC><b>Code</b></font></td>\n";
		echo "\t<td align=center width=50%><font size=2 color=#FFF8DC><b>หัวข้อ</b></font></td>\n";
		echo "\t<td align=center width=15%><font size=2 color=#FFF8DC><b>วันที่</b></font></td>\n";
		echo "\t<td align=center width=15%><font size=2 color=#FFF8DC><b>เลือก</font></td>\n";
		echo "</tr>\n\n";
        while ($row = mysql_fetch_array($result)) 
{
			// กำหนดสีของตาราง เพื่อให้มีการสลับสี
			$bgc = ($bgc=="lightcyan") ? "powderblue" : "lightcyan";
			// กำหนดค่าตัวแปร
		
			$Code = $row["code"];
		//	$Status = $row["status"];
			$Topic = $row["topic"];
		//	$Price = $row["price"];
			$Date =trim($row["date"]);
		//	$Reply = $row["reply"];
		//	$Visit = $row["visit"];
			$Date=showdate($Date);
			echo "<tr bgcolor=$bgc >\n";

		    echo "\t<td width=15% align=center> $Code</td>\n";
	    	echo "\t<td width=50% align=left valign=center>$Topic</td>\n";
		    echo"\t<td width=15% align=center>$Date</td>\n";
			echo"\t<td width=15% align=center><INPUT TYPE=checkbox NAME=$Code></td>\n";
    echo "</tr>\n\n";
}
echo"</table>";
mysql_close();
?>
  <table width="100%" border="0">
    <tr> 
      <td> 
        <div align="right"> 
          <input type="submit" name="Submit3" value="ลบประกาศ">
          <input type="reset" name="Submit22" value="ยกเลิก">
        </div>
      </td>
    </tr>
  </table>


<?
     	// table แสดงเลขหน้า
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<font size=2 color=#9400D3>\n";

		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='readpost.php?page=$prevpage'>[หน้าก่อน = $prevpage]</a>\n";
		}
		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";
		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='readpost.php?page=$nextpage'>[หน้าถัดไป = $nextpage]</a>\n";
		}
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
	// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='readpost.php?page=$i'>$i</a> \n";
		}
		echo "\t<font size=2 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='readpost.php?page=$i'>$i</a> \n";
		}
			echo "</td></tr>\n";
		echo "</table>\n";
}

}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}?>