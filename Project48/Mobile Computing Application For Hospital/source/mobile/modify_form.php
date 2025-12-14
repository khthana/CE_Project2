<?
include("database.php");
include("function.php");
require_once("headeradmin.php");
require_once("check_data.php");
require_once("connect_db.php");
header_admin("แก้ไขรายละเอียดของบุคลากร");
check_session();
check_permit();
$count=0;
$result = show_data("tbldoctor");
?>

<br>
<table align="center" width="700">
<form action="delete_many.php" method="post">
<tr bgcolor="#CCAAFF">
<td align="center"><font face="Ms Sans serif"><b>เลือก</b></font></td>
<td align="center"><font face="Ms Sans serif"><b>ID</b></font></td>
<td align="center"><font face="Ms Sans serif"><b>ชื่อ-สกุล</b></font></td>
<td align="center"><font face="Ms Sans serif"><b>อีเมล์</b></font></td>
</tr>
<?
 while($row = mysql_fetch_array($result,MYSQL_ASSOC))
 {
	 if($count==0)
	 {
?>
<tr bgcolor=#EEEEFF>
<td align=center><input type=checkbox name="checkbox[]" value=<?=$row["DoctorID"]?>></td>
<td><font face=Ms Sans serif><?=$row["DoctorID"]?></font></td>
<td><font face="Ms Sans serif"> <a href="edit_form.php?DoctorID=<?=$row["DoctorID"]?>"> <?=$row["DoctorName"]?></a></font></td>
<td><font face="Ms Sans serif"><?=$row["Email"]?></font></td>
</tr>
<?
	$count=1;
	 }
else
{
?>
<tr bgcolor="#CCCCFF">
<td align="center"><input type="checkbox" name="checkbox[]" value="<?=$row["DoctorID"]?>"></td>
<td><font face="Ms Sans serif"><?=$row["DoctorID"]?></font></td>
<td><font face="Ms Sans serif"><a href="edit_form.php?DoctorID=<?=$row["DoctorID"]?>"><?=$row["DoctorName"]?></a></font></td>
<td><font face="Ms Sans serif"><?=$row["Email"]?></font></td>
</tr>
<?
$count=0;
}
 }	
?>
<tr>
<td colspan="3" align="center"><input type="submit" name="delete" value="ลบรายชื่อบุคลากร">
</td></form>
<form action="insertperson_form.php" method="post">
<td><input type="submit" name="insert" value="เพิ่มรายชื่อบุคลากร"></td>
</form>
</tr>
</table>
<?
echo "<br><br><br>";
require_once("footer.php");
?>