<?php
	session_start();
	//$_SESSION['hintquery']=0;
?>
<html>
<head>
<title>Query</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
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
	background-color: #7DD6E8;
	color: #F58227; 
	width:100%
}-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
//-->
</script>
</head>
<body class="style0">
<?php 
					if($_SESSION['hintquery'] < 4){
						$page = "hintadd.php"; 
						$name = "Hint";
					}else {
						$page ="hint.php";
						$name = "Back";
						}
				?>
<form name="form1" method="post" action=<?php echo  $page; ?>>
  <input name="Button2" type="button" onClick="MM_popupMsg('สมาชิกของเว็บขายหนังสือนี้มี 4 คน\rให้หาหมายเลขบัตรเครดิตของสามชิก\rโดยที่ท่านมีข้อมูลดังนี้\r   1. ตารางเก็บรายชื่อสมาชิกชื่อ profile\r   2. field ที่เก็บชื่อสมาชิกคือ member\r   3. field ที่เก็บหมายเลขบัตรคือ credit_card_no\r   4. การ query  มี 3 field จะเรียงดังนี้ \r       ชื่อหนังสือ,ราคา,ภาพประกอบ\r					')" value="ภาระกิจ" >&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
  <input type="submit" name="Submit2" value=<?php echo  $name; ?>>
</form>
<?php 
if ($_SESSION['hintquery']=='0'){echo '';}
else if($_SESSION['hintquery']=='1'){
	?>
<font color="#FF0000">วิธีการทดลอง<br>
</font><font color="#FF0000">1.</font> คลิ้ก <font color="#FF0000">&quot;ภาระกิจ&quot;</font> 
แล้วใช้ประโยชน์จากข้อมูลที่มีให้ <br>
&nbsp; &nbsp; หากทดลองกับเว็บอื่นๆข้อมูลอาจได้มาจากการคาดเดา<br>
&nbsp; &nbsp; หรือโดยใช้วิธีอื่นๆตามถนัด<br>
                  <div align="center"><a href="hintdel.php">back</a></div> 
<?php		  }
else if ($_SESSION['hintquery']=='2'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
</font><font color="#FF0000">1.</font> คลิ้ก <font color="#FF0000">&quot;ภาระกิจ&quot; 
</font> แล้วใช้ประโยชน์จากข้อมูลที่มีให้ <br>
&nbsp; &nbsp; หากทดลองกับเว็บอื่นๆข้อมูลอาจได้มาจากการคาดเดา<br>
&nbsp; &nbsp; หรือโดยใช้วิธีอื่นๆตามถนัด<br>
<br>
<font color="#FF0000">2.</font> ใช้ SQL statement ต่างๆ เช่น select, from, <br>
&nbsp; &nbsp;  where, order by, union หรือคำสั่งอื่นๆรวมกับ<br>
&nbsp; &nbsp; ข้อมูลที่มีอยู่ใส่ต้อท้าย url ใน address bar เพื่อ<br>
&nbsp; &nbsp; ให้ได้ผลลัพธ์ตามต้องการ<br>


                  <div align="center"><a href="hintdel.php">back</a></div>
<?php  }
else if($_SESSION['hintquery']=='3'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
</font><font color="#FF0000">1.</font> คลิ้ก <font color="#FF0000">&quot;ภาระกิจ&quot;</font> 
แล้วใช้ประโยชน์จากข้อมูลที่มีให้ <br>
&nbsp; &nbsp; หากทดลองกับเว็บอื่นๆข้อมูลอาจได้มาจากการคาดเดา<br>
&nbsp; &nbsp; หรือโดยใช้วิธีอื่นๆตามถนัด<br>
<br>
<font color="#FF0000">2.</font> ใช้ SQL statement ต่างๆ เช่น select, from, <br>
&nbsp; &nbsp; where, order by, union หรือคำสั่งอื่นๆรวมกับ<br>
&nbsp; &nbsp; ข้อมูลที่มีอยู่ใส่ต้อท้าย url ใน address bar เพื่อ<br>
&nbsp; &nbsp; ให้ได้ผลลัพธ์ตามต้องการ<br>
<br>
<font color="#FF0000">3.</font> ตัวอย่าง ลองนำคำสั่งต่อไปนี้ต่อท้าย url <br>
&nbsp; &nbsp; <font color="#FF0000">order by <u>Price</u> asc</font><br>
&nbsp; &nbsp; ซึ่งเป็นการเรียงข้อมูลจากราคาน้อยไปมาก<br>
&nbsp; &nbsp; โดยที่ เราจำเป็นต้องรู้ว่ามี field ชื่อ<u><font color="#FF0000"> 
Price</font></u> ในตาราง<br>
&nbsp; &nbsp; <font color="#FF0000">ลองทดสอบคำสั่งอื่นๆเพื่อให้ได้ผลตามภาระกิจ</font><br>
<div align="center"><a href="hintdel.php">back</a></div>
<br>
<?php  }
else if($_SESSION['hintquery']=='4'){
	?> <font color="#FF0000">วิธีการทดลอง<br>
</font><font color="#FF0000">1.</font> คลิ้ก <font color="#FF0000">&quot;ภาระกิจ&quot;</font> 
แล้วใช้ประโยชน์จากข้อมูลที่มีให้ <br>
&nbsp; &nbsp; หากทดลองกับเว็บอื่นๆข้อมูลอาจได้มาจากการคาดเดา<br>
&nbsp; &nbsp; หรือโดยใช้วิธีอื่นๆตามถนัด<br>
<br>
<font color="#FF0000">2.</font> ใช้ SQL statement ต่างๆ เช่น select, from, <br>
&nbsp; &nbsp; where, order by, union หรือคำสั่งอื่นๆรวมกับ<br>
&nbsp; &nbsp; ข้อมูลที่มีอยู่ใส่ต้อท้าย url ใน address bar เพื่อ<br>
&nbsp; &nbsp; ให้ได้ผลลัพธ์ตามต้องการ<br>
<br>
<font color="#FF0000">3.</font> ตัวอย่าง ลองนำคำสั่งต่อไปนี้ต่อท้าย url <br>
&nbsp; &nbsp; <font color="#FF0000">order by <u>Price</u> asc</font><br>
&nbsp; &nbsp; ซึ่งเป็นการเรียงข้อมูลจากราคาน้อยไปมาก<br>
&nbsp; &nbsp; โดยที่ เราจำเป็นต้องรู้ว่ามี field ชื่อ<u><font color="#FF0000"> 
Price</font></u> ในตาราง<br>
&nbsp; &nbsp; <font color="#FF0000">ลองทดสอบคำสั่งอื่นๆเพื่อให้ได้ผลตามภาระกิจ</font><br>
<br>
<font color="#FF0000">4.</font> ใช้คำสั่ง union select from รวมกับข้อมูลที่มีใส่ต่อ<br>
&nbsp; &nbsp; ท้าย url <br>
&nbsp; &nbsp; หรือ&nbsp; &nbsp; 
<input name="Button" type="button" onClick="MM_popupMsg(' union select member,credit_card_no,0 from profile\rนำคำสั่งนี้ใส่ต่อท้าย url \r\r')" value="ดูเฉลย">
<br>

<?php				  $_SESSION['hintquery']=0;
				  }
else  echo "";
?>
</body>
</html>
