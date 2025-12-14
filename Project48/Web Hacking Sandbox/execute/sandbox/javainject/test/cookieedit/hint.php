<?php session_start();?>
<html>
<head>
<title>hint</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#006699;
					   scrollbar-face-color: #0099FF;
					   scrollbar-highlight-color: #006699; 
					   scrollbar-shadow-color: #006699; 
					   scrollbar-arrow-color: #FFFFFF;
					   scrollbar-track-color: #FFFFFF; 
					   scrollbar-darkshadow-color: #009900;
        }
		a:link {
	color: #F58227;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #006699;
}
a:hover {
	text-decoration: none;
	background-color: #7DD6E8;
	color: #F58227; 
	width:100%
}
</style>
</head>

<body class="style0">
<?php 
					if($_SESSION['counter'] < 4){
						$page = "hintadd.php"; 
						$name = "Hint";
					}else {
						$page ="hint.php";
						$name = "Back";
						}
				?>
	             <form name="form1" method="post" action=<?php echo $page; ?> >
                    <input  type="submit" name="Submit2" value=<?php echo $name; ?>>
                  </form>

 <!--                 <form name="form1" method="post" action=<?php //if($_COOKIE['hint']<'4')echo "hintadd.php"; else echo "javackkoietest.php";?> >
                    <input  type="button" name="Submit2" value=<?php //if($_COOKIE['hint']<'4')echo "Hint"; else echo "Back";?>>
                  </form>
-->
<?php 
if ($_SESSION['counter']=='0'){echo '';}
else if($_SESSION['counter']=='1'){
	?>วิธีการ</font><br>
                  <font color="#FF0000">1.</font> ใช้คำสั่ง javascript ดูค่าของ 
                  cookie<br><br>
				  <div align="center"><a href="hintdel.php">back</a></div>
				<?php  }
else if ($_SESSION['counter']=='2'){
	?> วิธีการ</font><br>
                  <font color="#FF0000">1.</font> ใช้คำสั่ง javascript ดูค่าของ 
                  cookie<br>
                  <font color="#FF0000">2.</font> โดยใช้คำสั่ง<font color="#FF0000"> 
                  javascript:alert(document.cookie)</font><br><br>
				  <div align="center"><a href="hintdel.php">back</a></div>
				 <?php }
else if($_SESSION['counter']=='3'){
	?> วิธีการ</font><br>
                  <font color="#FF0000">1.</font> ใช้คำสั่ง javascript ดูค่าของ 
                  cookie<br>
                  <font color="#FF0000">2.</font> โดยใช้คำสั่ง<font color="#FF0000"> 
                  javascript:alert(document.cookie)</font><br>
<font color="#FF0000">3.</font> ค่าของ cookie ใน field admin = noให้เปลี่ยนเป็น 
yes<br>
                  <br>
                  <div align="center"><a href="hintdel.php">back</a></div>
				<?php  }
 else if($_SESSION['counter']=='4'){
	?>วิธีการ</font><br>
                  <font color="#FF0000">1.</font> ใช้คำสั่ง javascript ดูค่าของ 
                  cookie<br>
                  <font color="#FF0000">2.</font> โดยใช้คำสั่ง<font color="#FF0000"> 
                  javascript:alert(document.cookie)</font><br>
<font color="#FF0000">3.</font> ค่าของ cookie ใน field admin = noให้เปลี่ยนเป็น 
yes<br>
<font color="#FF0000">4. </font>โดย ใช้คำสั่ง <font color="#FF0000">javascript:alert(document.cookie="Status=Online&quot;);</font> 
หลังจากเปลี่ยนค่าแล้วจึง Refresh page<br>
					<?php	$_SESSION['counter']=0;
						}
else  echo "";
?>
</body>
</html>
