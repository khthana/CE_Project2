<?php
session_start();

session_unset();
session_destroy();
?>
<html>
<head>
<title>Ladkrabang's Marketplace ตลาดนัดซื้อ-ขาย สินค้าในลาดกระบัง</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<frameset cols="*" rows="80,**" frameborder="NO" border="0" framespacing="0"> 
  <frame name="topFrame" scrolling="NO" noresize src="ladkrabangmarket/top.html">
  <frameset cols="180,427*" frameborder="NO" border="0" framespacing="0"> 
    <frame name="leftFrame" noresize scrolling="NO" src="ladkrabangmarket/left.php">
    <frame name="mainFrame" src="ladkrabangmarket/main.php">
  </frameset>
</frameset>
<noframes><body bgcolor="#FFFFFF">

</body></noframes>
</html>
