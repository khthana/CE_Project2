<?
function header_admin($title)
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
	<tr ><td align="left" width="100">
	<td align="center">
			<img src="image/logo.jpg" border="0" width="750" height="100">
</td>
</tr>
</table>
			<table align="center">
			<tr>
    <td  bgcolor=#3366CC width=100% height=25  align="center"> 
		<font face = "MS Sans Serif"size="2"><font color="#FFFFFF"><IMG SRC="image/write-icon.gif" WIDTH="20" HEIGHT="13" BORDER=0 align="center">
        </font> <a class ="cate" href="insertperson_form.php"><b>เพิ่มข้อมูลบุคลากร</b></a><font color="#FFFFFF"> 
        | <IMG SRC="image/b_edit.gif" WIDTH="16" HEIGHT="16" BORDER=0 align="center">
		</font> <a class ="cate" href="modify_form.php"><b>แก้ไขรายละเอียดบุคลากร</b></a><font color="#FFFFFF"> 
        | <IMG SRC="image/bookmarks.gif" WIDTH="16" HEIGHT="16" BORDER=0 align="center">
		</font> <a class ="cate" href="cate_form.php"><b>จัดหมวดหมู่ความเชี่ยวชาญ</b></a><font color="#FFFFFF"> 
        | <IMG SRC="image/icon_mini_search.gif" WIDTH="12" HEIGHT="13" BORDER=0 align="center">
		</font> <a class ="cate" href="search_form.php"><b>ค้นหาข้อมูล</b></a><font color="#FFFFFF"> 
        | <IMG SRC="image/sitebuild_icon.gif" WIDTH="16" HEIGHT="16" BORDER=0 align="center">
		</font> <a class ="cate" href="show_user_profile.php"><b>เปลี่ยนรหัสผ่าน</b></a><font color="#FFFFFF"> 
        | <IMG SRC="image/profile_small.gif" WIDTH="14" HEIGHT="15" BORDER=0 align="center">
		</font> <a class ="cate" href="logout.php"><b>ล็อกเอาท์ &nbsp;</b></a>
		&nbsp;&nbsp;<IMG SRC="image/home_small.gif" WIDTH="16" HEIGHT="16"  align="center"><font face = "MS Sans Serif" color="#FFFF00" size="1"><b>&nbsp;&nbsp;วันที่:</b>
<?  
		@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย 
			$a = date("j");	 // วันที่
			$b = strftime("%B");	 // เดือนเต็ม
			$c = strftime("%Y")+543;	 // ปี พ.ศ.
			$d = date("H:i:s");	 // เวลา

			$a_date = "$a $b $c";
			echo"$a_date";
?>
			<b>&nbsp;เวลา:  </b><?echo"$d";?><b>&nbsp;น.</b></DIV></TR>
      </td></tr>
			</table>

<?
}
?>