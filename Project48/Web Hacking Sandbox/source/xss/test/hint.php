<?php
	session_start();
	//$_SESSION['hintxss']=5;
	
?>
<html>
<head>
<title>Cross-Site Script Test</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:##000000;
					   scrollbar-face-color: #F8C4AC;
					   scrollbar-highlight-color: #FFFFFF; 
					   scrollbar-shadow-color: #FFFFFF; 
					   scrollbar-arrow-color: #DE5208;
					   scrollbar-track-color: #FFFFFF; 
					   scrollbar-darkshadow-color: #009900;
        }
.style1 {font-family: "Microsoft Sans Serif", "MS Serif", Tahoma, sans-serif, serif; font-size: 14px; color: #003366; }
a:link {
	color: #FF3333;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FF3333;
}
a:hover {
	text-decoration: none;
	background-color: #FF8204;
	color: #FFFFFF; 
	width:100%
					 
}
a:active {
	text-decoration: none;
	color: #BAF8C5;
}
-->
</style>
</head>
<body class="style0">
<?php 
					if($_SESSION['hintxss'] < 4){
						$page = "hintadd.php"; 
						$name = "Hint";
						if($_SESSION['hintcook']==1){
						$page = "testxss.php target=\"_parent\""; $_SESSION['hintcook']=0;}
					}else {
						$page ="hint.php";
						$name = "Back";
						}
				
						
				?>
					<form name="form1" method="post" action=<?php echo  $page; ?> >
                    <input type="submit" name="Submit2" value=<?php echo  $name; ?>>
                  	</form>
<?php 
if ($_SESSION['hintxss']=='0'){echo '';}
else if($_SESSION['hintxss']=='1'){
	?><font color="#FF0000">วิธีการทดลอง<br>
1.</font> สามารถวาง script ที่ต้องการได้ในหน้า<br>
 ตั้งกระทู้ หรือ ตอบกระทู้<br>
                  <div align="center"><a href="hintdel.php">back</a></div> 
<?php		  }
else if ($_SESSION['hintxss']=='2'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
</font><font color="#FF0000">1.</font> สามารถวาง script ที่ต้องการได้ในหน้า<br>
 ตั้งกระทู้ หรือ ตอบกระทู้<br><br>
<font color="#FF0000">2.</font> ตัวอย่าง script อย่างง่าย คือ การใส่ html tag 
ลงไปในเว็บบอร์ดเช่น<br>
<font color="#FF0000">&lt;u&gt;ข้อความ&lt;/u&gt;</font> เพื่อทำให้เกิดตัวหนา<br>
<font color="#FF0000">&lt;i&gt;ข้อความ&lt;/i&gt;</font> เพื่อทำให้เกิดตัวเอียง<br>
                  <div align="center"><a href="hintdel.php">back</a></div>
<?php  }
else if($_SESSION['hintxss']=='3'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
</font><font color="#FF0000">1.</font> สามารถวาง script ที่ต้องการได้ในหน้า<br>
 ตั้งกระทู้ หรือ ตอบกระทู้<br><br>
<font color="#FF0000">2.</font> ตัวอย่าง script อย่างง่าย <br>
คือ การใส่ html tag 
ลงไปในเว็บบอร์ดเช่น <br>
<font color="#FF0000">&lt;u&gt;ข้อความ&lt;/u&gt;</font> เพื่อทำให้เกิดตัวหนา<br>
<font color="#FF0000">&lt;i&gt;ข้อความ&lt;/i&gt;</font> เพื่อทำให้เกิดตัวเอียง<br>
<br>
<font color="#FF0000">3.</font> ตัวอย่าง script 2<br>
<font color="#FF0000">&lt;script&gt;alert(document.cokie)<br>&lt;/script&gt;</font><br>
เป็น sript ที่จะทำงานเมื่อทำการคลิ้ก ก็จะแสดงค่า cookie ออกมา<br>
<div align="center"><a href="hintdel.php">back</a></div>
<br>
<?php  }
else if($_SESSION['hintxss']=='4'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
</font><font color="#FF0000">1.</font> สามารถวาง script ที่ต้องการได้ในหน้า<br>
 ตั้งกระทู้ หรือ ตอบกระทู้<br><br>
<font color="#FF0000">2.</font> ตัวอย่าง script อย่างง่าย <br>
คือ การใส่ html tag 
ลงไปในเว็บบอร์ดเช่น <br>
<font color="#FF0000">&lt;u&gt;ข้อความ&lt;/u&gt;</font> เพื่อทำให้เกิดตัวหนา<br>
<font color="#FF0000">&lt;i&gt;ข้อความ&lt;/i&gt;</font> เพื่อทำให้เกิดตัวเอียง<br>
<br>
<font color="#FF0000">3.</font> ตัวอย่าง script 2<br>
<font color="#FF0000">&lt;script&gt;alert(document.cokie)<br>&lt;/script&gt;</font><br>
เป็น sript ที่จะทำงานเมื่อทำการคลิ้ก ก็จะแสดงค่า cookie ออกมา<br>
<br>
<font color="#FF0000">4.</font> สามารถใส่ script อื่นๆที่ใช้ในการโจมตีเว็บได้<br>
<div align="center"><a href="hintdel.php">back</a></div>
<br>
<?php				  $_SESSION['hintxss']=0;
							
				  }
else   $_SESSION['hintxss']=0;
?>
</body>
</html>
