<?php
session_start();
?>
<html>
<head>
<title>SQL hint</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="../../smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#006699;
        }
		a:link {
	color: #F58227;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FFFFFF;
}
-->
</style>
</head>

<body  class="style0">
<?php 
					if($_SESSION['hintsql'] < 3){
						$page = "hintadd.php"; 
						$name = "Hint";
					}else {
						$page ="hint.php";
						$name = "Back";
						}
				?>
					<form name="form1" method="post" action=<?php echo  $page; ?>>
                    <input type="submit" name="Submit2" value=<?php echo  $name; ?>>
                  	</form>
<?php 
if ($_SESSION['hintsql']=='0'){echo '';}
else if($_SESSION['hintsql']=='1'){
	?><font color="#FF0000">วิธีการทดลอง<br>
                  1.</font> ใส่ username อะไรก็ได้ <br>
                  <div align="center"><a href="hintdel.php">back</a></div> 
<?php		  }
else if ($_SESSION['hintsql']=='2'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
                  1.</font> ใส่ username อะไรก็ได้ <br>
                  <font color="#FF0000">2.</font> ในช่อง password สามารถใส่คำสั่ง 
                  SQL ได้<br>
                  <div align="center"><a href="hintdel.php">back</a></div>
<?php  }
else if($_SESSION['hintsql']=='3'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
                  1.</font> ใส่ username อะไรก็ได้ <br>
                  <font color="#FF0000">2.</font> ในช่อง password สามารถใส่คำสั่ง 
                  SQL ได้<br>
<font color="#FF0000">3.</font> คำสั่ง sql คือ <font color="#FF0000"> 'or '1' 
= '1 </font>หรืออย่างอื่นที่ทำให้เกิดค่า <font color="#FF0000">true</font><br>
<?php				  $_SESSION['hintsql']=0;
				  }
else  echo "";
?>
</body>
</html>
