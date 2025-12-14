<?
	include("database.php");
	include("function.php");
	include("connect_db.php");
	require_once("headeradmin.php");
	check_permit();
	header_admin("เพิ่มหมวดหมู่หนังสือใหม่");
?>
<br>
<form action="insert_cat.php" method="post">
<table align="center" border="1" bordercolor="#FFFFFF" cellspacing="0">
<tr align="center" bgcolor="#3366CC"><td colspan="2"><font face="LilyUPC" size="5" color="#FFFFFF"><b>
เพิ่มหมวดหมู่ความเชี่ยวชาญ</b></font></td></tr>
<tr>
<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>ชื่อหมวดหมู่ : </b></font></td>
<td bgcolor="#DDEEEE"><input type="text" name="CatName" maxlength ="60" size="30"></td>
</tr>
<tr bgcolor="#EEEEFF" align="center">
<td colspan="2"><input type="submit" name="insert" value="เพิ่มหมวดหมู่"></td>
</tr>
</table>
</form>
<?
require_once("footer.php");
?>