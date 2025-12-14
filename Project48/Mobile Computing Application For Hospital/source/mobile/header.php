<?
function header_html($title)
{
	//แสดงส่วนของ header ใน html
?>
	<html>
	<head>
		<title><?=$title?></title>
		<style>
			body {font-family:Microsoft Sans Serif ,MS Sans Serif ,Arial ,CordiaUPC ; font-size: 13px }
			li,td {font-family : sans - serif , Arial ; font-size : 13px}
			hr {color:#3333cc ; width = 700; text-align = left}
			a.noline {COLOR: #ffffcc; TEXT-DECORATION: none	}
			a.noline:hover {	COLOR: #99cc99}
			a.cate {text-decoration:none; color: #FFFFFF;}
			a.cate:hover {color:"EE9935";}
			a.menu {text-decoration:none; color: "#6600FF";}
			a.menu:hover {color:"#FF6600";}
			a.shop {color: "#6600FF";}
			a.shop:hover {color:"#FF6600";}
			a.lmenu {color: "#660099"; text-decoration:none;}
			a.lmenu:hover {color:"#FF6600"; text-decoration:none;}
		</style>
	</head>
	<body>
<table  width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr >
	<td align="top">
			<img src="image/logo.jpg" border="0" width="760" height="100">
	</td>
</tr>
			<tr>
			<td  bgcolor=#3366CC width=750 height=25 align="right">
			<font face = "MS Sans Serif"size="2">
			 <a class ="cate" href="index.php"><b>หน้าแรก</b></a><font color="#FFFFFF"> |</font>
			 <a class ="cate" href="webboard.php"><b>เว็บบอร์ด</b></a><font color="#FFFFFF"> | </font>
			 <a class ="cate" href="officer.php"><b>สำหรับพนักงาน รพ.</b></a><font color="#FFFFFF"> | </font>
			 <a class ="cate" href="news/news.php" target="_blank"><b>ข่าวประชาสัมพันธ์</b></a><font color="#FFFFFF"> | </font>
			 <a class ="cate" href="basic_data_menu.php"><b>ผู้ดูแลระบบ</b></a><font color="#FFFFFF"> | </font>
			 <a class ="cate" href="logout.php"><b>ออกจากระบบ</b></a><font >	</td></tr>

<?
}
?>