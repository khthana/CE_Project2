<?php require_once('Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_Subject = "SELECT * FROM subject";
$Subject = mysql_query($query_Subject, $conn) or die(mysql_error());
$row_Subject = mysql_fetch_assoc($Subject);
$totalRows_Subject = mysql_num_rows($Subject);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>S u b j e c t</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(Images/bg.gif);
}
.style26 {font-size: 16px; font-weight: bold; }
a:link {
	text-decoration: none;
	color: #0000FF;
}
a:visited {
	text-decoration: none;
	color: #0000FF;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
.style28 {font-size: 18px}
.style29 {font-size: 18px; color: #6666FF; }
-->
</style></head>

<body>
<?php include('index_header.htm') ?>
<table width="860" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center"><img src="Images/subject_head2.gif" width="356" height="49"></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><form name="form1" method="post" action="">
      <table width="860" border="0" cellpadding="0" cellspacing="0" bordercolor="#6699FF">
        <tr>
          <td width="56" bordercolor="#6699FF">&nbsp;</td>
          <td width="278" bordercolor="#6699FF"><div align="center" class="style26"></div></td>
          <td width="526"><div align="center" class="style26"> </div></td>
        </tr>
        <?php do { ?>
        <tr>
          <td width="56">&nbsp;</td>
          <td width="278"><a href="Subject/<?php echo $row_Subject['subject_name']?>.php?id=<?php echo $row_Subject['subject_ID'];?> " target="_blank" class="style29"><?php echo $row_Subject['subject_name']; ?> </a> </td>
          <td width="526"><span class="style28"><?php echo $row_Subject['short_description']; ?></span></td>
        </tr>
        <?php } while ($row_Subject = mysql_fetch_assoc($Subject)); ?>
      </table>
    </form></td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($Subject);
?>
