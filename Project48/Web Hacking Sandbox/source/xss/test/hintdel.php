<?php
session_start();
$_SESSION['hintxss']--;
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Cross-Site Script Test</title>
<META http-equiv="refresh" content="0;URL=hint.php">
</head>
<body >
</body>
</html>
