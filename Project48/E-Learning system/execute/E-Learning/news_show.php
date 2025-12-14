<?php require_once('Connections/conn.php'); ?>
<?php
$currentPage = $_SERVER["PHP_SELF"];

$maxRows_news = 10;
$pageNum_news = 0;
if (isset($_GET['pageNum_news'])) {
  $pageNum_news = $_GET['pageNum_news'];
}
$startRow_news = $pageNum_news * $maxRows_news;

mysql_select_db($database_conn, $conn);
$test="";
$query_news = "SELECT * FROM news where published is not null";
$query_limit_news = sprintf("%s LIMIT %d, %d", $query_news, $startRow_news, $maxRows_news);
$news = mysql_query($query_limit_news, $conn) or die(mysql_error());


if (isset($_GET['totalRows_news'])) {
  $totalRows_news = $_GET['totalRows_news'];
} else {
  $all_news = mysql_query($query_news);
  $totalRows_news = mysql_num_rows($all_news);
}
$totalPages_news = ceil($totalRows_news/$maxRows_news)-1;

$queryString_news = "";
if (!empty($_SERVER['QUERY_STRING'])) {
  $params = explode("&", $_SERVER['QUERY_STRING']);
  $newParams = array();
  foreach ($params as $param) {
    if (stristr($param, "pageNum_news") == false && 
        stristr($param, "totalRows_news") == false) {
      array_push($newParams, $param);
    }
  }
  if (count($newParams) != 0) {
    $queryString_news = "&" . htmlentities(implode("&", $newParams));
  }
}
$queryString_news = sprintf("&totalRows_news=%d%s", $totalRows_news, $queryString_news);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>
<style type="text/css">
<!--
.style2 {font-size: 24px; color: #6699FF;}
body {
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
}
a:link {
	text-decoration: none;
	color: 006699;
}
a:visited {
	text-decoration: none;
	color: #006699;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
</head>

<body>
<?php include("index_header.htm");?>
<p class="style2">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;แสดงข่าวทั้งหมด</p>
<table width="860" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="0"><table width="400" height="70" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="4">&nbsp;</td>
        <td width="100">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <?php $no=1;?>
      <?php while(($no<6)&&($row_news = mysql_fetch_assoc($news))){ ?>
      <tr>
        <td height="19">&nbsp;</td>
        <td><a href="news_page.php?news_ID=<?php echo $row_news['news_ID'];?>"><img src="Images/news_pic/small_pic/<?php echo $row_news['small_pic']; ?>" width="100" height="100" border="0"></a></td>
        <td width="4">&nbsp;</td>
        <td width="212"><a href="news_page.php?news_ID=<?php echo $row_news['news_ID'];?>"><?php echo $row_news['headline']; ?></a></td>
      </tr>
      <tr>
        <td height="19">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="19">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <?php $no++; } ?>
    </table></td>
    <td width="159">&nbsp;</td>
    <td width="414"><table width="400" height="70" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="29">&nbsp;</td>
        <td width="100">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <?php while(($no<11)&&($row_news = mysql_fetch_assoc($news))) { ?>
      <tr>
        <td height="19">&nbsp;</td>
        <td><a href="news_page.php?news_ID=<?php echo $row_news['news_ID'];?>"><img src="Images/news_pic/small_pic/<?php echo $row_news['small_pic']; ?>" width="100" height="100" border="0"></a></td>
        <td width="20">&nbsp;</td>
        <td width="265"><a href="news_page.php?news_ID=<?php echo $row_news['news_ID'];?>"><?php echo $row_news['headline']; ?></a></td>
      </tr>
      <tr>
        <td height="19">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="19">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <?php $no++;}?>
    </table></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table border="0" width="50%" align="center">
  <tr>
    <td width="23%" align="center"><?php if ($pageNum_news > 0) { // Show if not first page ?>
        <a href="<?php printf("%s?pageNum_news=%d%s", $currentPage, 0, $queryString_news); ?>">First</a>
        <?php } // Show if not first page ?>
    </td>
    <td width="31%" align="center"><?php if ($pageNum_news > 0) { // Show if not first page ?>
        <a href="<?php printf("%s?pageNum_news=%d%s", $currentPage, max(0, $pageNum_news - 1), $queryString_news); ?>">Previous</a>
        <?php } // Show if not first page ?>
    </td>
    <td align="center"><?php if ($pageNum_news < $totalPages_news) { // Show if not last page ?>
        <a href="<?php printf("%s?pageNum_news=%d%s", $currentPage, min($totalPages_news, $pageNum_news + 1), $queryString_news); ?>">Next</a>
        <?php } // Show if not last page ?>
    </td>
    <td width="23%" align="center"><?php if ($pageNum_news < $totalPages_news) { // Show if not last page ?>
        <a href="<?php printf("%s?pageNum_news=%d%s", $currentPage, $totalPages_news, $queryString_news); ?>">Last</a>
        <?php } // Show if not last page ?>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
<?php
mysql_free_result($news);
?>
