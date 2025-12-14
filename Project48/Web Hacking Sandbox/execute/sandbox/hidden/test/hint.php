<?php
session_start();
?>
<html>
<head>
<title>:: Hidden Manipulation ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
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
	background-color: #FF8204;
	color: #FFFFFF; 
	width:100%
}
-->
</style>
</head>

<body  class="style0">
<?php 
					if($_SESSION['hiddenhint'] < 3){
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
if ($_SESSION['hiddenhint']=='0'){echo '';}
else if($_SESSION['hiddenhint']=='1'){
	?>
				 <font color="#FF0000">วิธีการ</font><br>
                  <font color="#FF0000">1.</font> ทำการ save หน้านี้เก็บไว้<br>
                  จากนั้นเปิดดู source code ดูที่ FORM tag
                  <div align="center"><a href="hintdel.php">back</a></div>
	<?php			  }
else if ($_SESSION['hiddenhint']=='2'){
	?>
				<font color="#FF0000">วิธีการ</font><br>
                  <font color="#FF0000">1.</font> ทำการ save หน้านี้เก็บไว้<br>
                  จากนั้นเปิดดู source code ดูที่ FORM tag<br>
                  <font color="#FF0000">2.</font> ทำการแก้ value=5000 ให้เป็นค่าที่ต้องการ
                  <div align="center"><a href="hintdel.php">back</a></div>
				<?php  }
else if($_SESSION['hiddenhint']=='3'){
	?>
			 <font color="#FF0000">1.</font> ทำการ save หน้านี้เก็บไว้<br>
                  จากนั้นเปิดดู source code ดูที่ FORM tag<br>
                  <font color="#FF0000">2.</font> ทำการแก้ value=5000 ให้เป็นค่าที่ต้องการ<br>
                  <font color="#FF0000">3.</font> ส่งกลับไปยัง server โดยเปลี่ยน<br>
                  &lt;FORM name=form2 action=&quot;<font color="#FF0000">hiddenchk.php</font>&quot; 
                  <br>
                  ให้เป็น url ของ server เช่น<br>
                  &lt;FORM name=form2 action=&quot;<font color="#FF0000">http://server/hiddenchk.php</font>&quot;
				 <?php $_SESSION['hiddenhint']=0;
				  }
else  echo "";
?>
</body>
</html>