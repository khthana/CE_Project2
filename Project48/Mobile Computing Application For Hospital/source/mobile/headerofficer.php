<?
function header_officer($title)
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

		</style>
	</head>
	<body>
<table  width="760">
	<tr ><td align="center" width="100">
	<td align="center">
			<img src="image/logo.jpg" border="0" width="750" height="100">
</td>
</tr>
</table>
			<table align="center" width="100%">
			<tr>
    <td  bgcolor=#3366CC height=25 align="center"> 
		<font face = "MS Sans Serif"size="2"><font color="#FFFFFF">
		 <a class ="cate" href="index.php"><b>หน้าเเรก</b></a><font color="#FFFFFF">
        | </font> <a class ="cate" href="search_form2.php"><b>ค้นหาข้อมูล</b></a><font color="#FFFFFF">
		| </font> <a class ="cate" href="list.php"><b>ข้อความใหม่</b></a><font color="#FFFFFF">
		| </font> <a class ="cate" href="list2.php"><b>ข้อความที่อ่านเเล้ว</b></a><font color="#FFFFFF">
        | </font> <a class ="cate" href="logout_admin.php?status=logout"><b>ล็อกเอาท์ &nbsp;</b></a> 
      </td></tr>
			</table>
<?		
}
?>