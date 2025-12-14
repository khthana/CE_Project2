<?php 
session_start();
?>
<html>
<head>
<title>Hint</title>
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
</head>
<body class="style0">
<?php 
					if($_SESSION['hint'] < 3){
						$page = "hintadd.php"; 
						$name = "Hint";
					}else {
						$page ="hint.php";
						$name = "Back";
						}
				?>
				<form name="form1" method="post" action=<?php echo  $page; ?>>
                    <input type="submit" name="Submit2" value=<?php echo $name; ?>>
                  </form>
<?php 
	if ($_SESSION['hint']=='0'){echo '';}
	else if($_SESSION['hint']=='1'){
?><font color="#FF0000">วิธีการ
				  <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. </font><font color="#FF0000">&nbsp; 
                  </font>ดู source code โดยสังเกตุหมายเลขของ form ที่ใช้ในการ 
                  submit<br>
                  <div align="center"><a href="hintdel.php">back</a></div>
				 <?php } 

	else if ($_SESSION['hint']=='2'){
?><font color="#FF0000">วิธีการ
				  <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. </font><font color="#FF0000">&nbsp; 
                  </font>ดู source code โดยสังเกตุหมายเลขของ form ที่ใช้ในการ 
                  submit <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">2.</font> 
                  ใช้คำสั่ง Java Script เปลี่ยนค่า value ให้เป็นค่าทที่ต้องการ<br>
                  <div align="center"><a href="hintdel.php">back</a></div>
				<?php  } 

 else if($_SESSION['hint']=='3'){
?><font color="#FF0000">วิธีการ
				  <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. </font><font color="#FF0000">&nbsp; 
                  </font>ดู source code โดยสังเกตุหมายเลขของ form ที่ใช้ในการ 
                  submit <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">2.</font> 
                  ใช้คำสั่ง Java Script เปลี่ยนค่า value ให้เป็นค่าทที่ต้องการ
				  <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">3. 
                  </font> ที่ Address bar ใช้คำสั่ง Java Script คือ<br><br>
                  javascript:void(document.forms[<font color="#FF0000">x</font>].field.value=&quot;<font color="#FF0000">you 
                  want</font>&quot;);<br>
                  alert(document.forms[<font color="#FF0000">x</font>].field.value) ;<br>
				  <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; โดยที่ ค่า x คือลำดับของ 
                  form ที่จะ Edit โดยเริ่มจากศูนย์ ส่วน Field นั้นเป็นชื่อ Field 
                  ที่ต้องการ Edit นั้นเอง ส่วนคำสั่ง alert นั้นเพื่อดูว่าค่า Hidden 
                  Field ที่เราเปลี่ยนไปนั้นได้ผลหรือเปล่า 
				<?php  $_SESSION['hint']=0;
				  }
 
else  echo "";
?>
</body>
</html>
