<script language="javascript" type="text/JavaScript">
function del(varUrl)
{ 		
	if (window.confirm("ยืนยันการลบข้อมูล")==true){window.open(varUrl,"_self")}
}
</script>
<?php include('../Connections/conn.php'); ?>
<?php //change order news
if(isset($HTTP_POST_VARS['Submit']))
{
	mysql_select_db($database_conn, $conn);
	$updateSQL = "UPDATE news SET news_order ='$news_order' WHERE news_ID='$news_ID'";
	$Result = mysql_query($updateSQL, $conn) or die(mysql_error());
  	if($Result!=0){
	$change ='0';
	echo "<meta http-equiv='refresh' content='0;URL=newslists.php'>";
    }

}
?>

<?php
$currentPage = $_SERVER["PHP_SELF"];

$maxRows_Recordset1 = 10;
$pageNum_Recordset1 = 0;
if (isset($_GET['pageNum_Recordset1'])) {
  $pageNum_Recordset1 = $_GET['pageNum_Recordset1'];
}
$startRow_Recordset1 = $pageNum_Recordset1 * $maxRows_Recordset1;

mysql_select_db($database_conn, $conn);
$query_Recordset1 = "SELECT * FROM news order by news_order DESC";
$query_limit_Recordset1 = sprintf("%s LIMIT %d, %d", $query_Recordset1, $startRow_Recordset1, $maxRows_Recordset1);
$Recordset1 = mysql_query($query_limit_Recordset1, $conn) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);

if (isset($_GET['totalRows_Recordset1'])) {
  $totalRows_Recordset1 = $_GET['totalRows_Recordset1'];
} else {
  $all_Recordset1 = mysql_query($query_Recordset1);
  $totalRows_Recordset1 = mysql_num_rows($all_Recordset1);
}
$totalPages_Recordset1 = ceil($totalRows_Recordset1/$maxRows_Recordset1)-1;

$queryString_Recordset1 = "";
if (!empty($_SERVER['QUERY_STRING'])) {
  $params = explode("&", $_SERVER['QUERY_STRING']);
  $newParams = array();
  foreach ($params as $param) {
    if (stristr($param, "pageNum_Recordset1") == false && 
        stristr($param, "totalRows_Recordset1") == false) {
      array_push($newParams, $param);
    }
  }
  if (count($newParams) != 0) {
    $queryString_Recordset1 = "&" . htmlentities(implode("&", $newParams));
  }
}
$queryString_Recordset1 = sprintf("&totalRows_Recordset1=%d%s", $totalRows_Recordset1, $queryString_Recordset1);
?>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php
?>

<body link="#0000FF" vlink="#0000FF" alink="#0000FF"><div align="center">
  <p><font color="#6699FF" size="6" face="Arial, Helvetica, sans-serif"><strong>ข่าวทั้งหมด</strong></font></p>
  <p><a href="news_add.php">เพิ่มข่าว</a> &nbsp;&nbsp;&nbsp;<a href="admin_index.php">กลับไปหน้าเมนูผู้ดูแลระบบ</a>&nbsp;&nbsp;&nbsp;<a href="../index.php">กลับไปหน้า home page</a></p>
</div>    

<?php if ($totalRows_Recordset1 > 0) { // Show if recordset not empty ?>
<table width="900" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#6699FF">
  <tr>
    <td  width="175" bgcolor="#66CCFF"><div align="center">
        <font size="+1"><strong>Headlines</strong>
        </font></div></td>
    <td width="134" bgcolor="#66CCFF"><div align="center">
       <strong><span class="style3 style1"><font size="+1">News Type</font></span></strong>
    </div></td>
    <td width="114" bgcolor="#66CCFF"><div align="center">
    <strong><span class="style3 style1"><font size="+1">Create</font></span></strong>
    </div></td>
    <td width="124" bgcolor="#66CCFF"><div align="center">
    <strong><font size="+1">Modified</font></strong>
    </div></td>
    <td width="131" bgcolor="#66CCFF"><div align="center">
    <strong><span class="style3 style1"><font size="+1">Published</font></span></strong>
    </div></td>
    <td width="72" bgcolor="#66CCFF">
    <div align="center"><strong><font size="+1">Show</font></strong></div></td>
    <td width="92" bgcolor="#66CCFF"><div align="center"><strong><font size="+1">Order</font></strong></div></td>
    <td colspan="2" bgcolor="#66CCFF">&nbsp;</td>
  </tr>
  <?php do { ?>
  <tr>
    <td><div align="justify"> <font size="-1"><?php echo ++$count."."; ?> <?php echo $row_Recordset1['headline']; ?></font></div></td>
    <td width="134">
      <div align="center"><font size="-1"><?php echo $row_Recordset1['news_type']; ?></font></div></td>
    <td width="114"><div align="center"> </div>
        <div align="center"><font size="-1"><?php echo $row_Recordset1['created']; ?></font></div></td>
    <td width="124"><div align="center"> <font size="-1"><?php if($row_Recordset1[modified]){echo $row_Recordset1['modified'];}else echo"ยังไม่มีการแก้ไข"; ?> </font></div></td>
    <td width="131"><div align="center"> <font size="-1"><?php if($row_Recordset1[published]){echo $row_Recordset1['published'];}else echo"ยังไม่นำขึ้นเว็บ"; ?> </font></div></td>
    <td width="72"><div align="center"> <font size="-1">
    <?php if($row_Recordset1['published']==""){echo "<a href='action.php?do=publish&news_ID=".$row_Recordset1['news_ID']."'>ส่งแสดง</a>";}else{echo "<a href='action.php?do=not_show&news_ID=".$row_Recordset1['news_ID']."'>แสดงแล้ว</a>";}?>
</font></div></td>
    <td width="92"><div align="center"><?php if($row_Recordset1['news_order']>0){ echo $row_Recordset1['news_order'];}else echo"-"; ?></div></td>
    <td width="24"><div align="center"><font size="-1"><span class="headlines"><a href="news_edit.php?news_ID=<?php  echo $row_Recordset1['news_ID']; ?>">แก้ไข</a></span></font></div></td>
    <td width="14"><div align="center"><font size="-1"><span class="headlines"><a href=# onClick="del('action.php?do=del&news_ID=<?php echo  $row_Recordset1['news_ID']; ?>')">ลบ</a></span></font></div></td>
  </tr>
  <?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
</table>
<?php } // Show if recordset not empty ?>
<?php
mysql_free_result($Recordset1);
?>
<p align="center"><font size="1"></font></p>
<table border="0" width="50%" align="center">
  <tr>
    <td width="23%" align="center"><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, 0, $queryString_Recordset1); ?>">First</a>
        <?php } // Show if not first page ?>
    </td>
    <td width="31%" align="center"><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, max(0, $pageNum_Recordset1 - 1), $queryString_Recordset1); ?>">Previous</a>
        <?php } // Show if not first page ?>
    </td>
    <td align="center"><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, min($totalPages_Recordset1, $pageNum_Recordset1 + 1), $queryString_Recordset1); ?>">Next</a>
        <?php } // Show if not last page ?>    </td>
    <td width="23%" align="center"><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
        <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, $totalPages_Recordset1, $queryString_Recordset1); ?>">Last</a>
        <?php } // Show if not last page ?>
    </td>
  </tr>
</table>
<font size="1">
</p>
</font>
</html>
