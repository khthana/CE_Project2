<? // ไฟล์ที่เกี่ยวข้องก็จะมี insert_book.php  , function.php [insert_person()] ?>
<?
include("database.php");
include("function.php");
include("connect_db.php");
require_once("headeradmin.php");
check_permit();

?>

<? header_admin("เพิ่มบุคลากร");?>
<br><br>

<form action="insert_person.php" method="post">
<table align="center" border="1" bordercolor="#FFFFFF" cellspacing="0">
	<tr align="center" bgcolor ="#3366CC">
		<td colspan="2">
			<font face="MS Sans Serif" size="3" color="#FFFFFF"><b>เพิ่มบุคลากรใหม่</b></font>
		</td>
	</tr>
	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>ID : </b></font></td> 
		<td bgcolor="#DDEEEE"><input type="text" name="DoctorID" maxlength ="10" size="30"></td>
	</tr>
	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>ชื่อ-สกุล : </b></font></td>
		<td bgcolor="#DDEEEE"><input type="text" name="DoctorName" maxlength ="100" size="30"></td>
	</tr>
	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>ความเชี่ยวชาญ : </b></font></td>
		<td bgcolor="#DDEEEE">  <select size="1" name="CatID"> 

<?
		$result = show_data("categories");
		while($row = mysql_fetch_array($result,MYSQL_ASSOC)) 
		{
?>
		<option value="<?=$row["CatID"]?>"><?=$row["CatName"]?></option>
<?
		}
?>
		</td>
	</tr>

	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>ที่อยู่ : </b></td>
		<td bgcolor="#DDEEEE"><textarea cols="50" row="2" name="Address" maxlength="100"></textarea></td></font>
	</tr>

	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>โทรศัพท์มือถือ : </b></font></td>
		<td bgcolor="#DDEEEE"><input type="text" name="MobilePhone" maxlength ="100" size="30"></td>
	</tr>

	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>โทรศัพท์บ้าน : </b></font></td>
		<td bgcolor="#DDEEEE"><input type="text" name="Phone" maxlength ="100" size="30"></td>
	</tr>

	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>อีเมล์ : </b></font></td>
		<td bgcolor="#DDEEEE"><input type="text" name="Email" maxlength ="100" size="30"></td>
	</tr>

	<tr>
		<td bgcolor="#EEEEFF"><font face="MS Sans serif"><b>ไฟล์รูปภาพ : </b></font></td>
		<td bgcolor="#DDEEEE"><input type="text" name="Picture"></td>
	</tr>

	<tr bgcolor="#EEEEFF" align="center">
		<td colspan="2"><input type="submit" name="save" value="เพิ่มบุคลากรใหม่"></td>
	</tr>

</table>
</form>

<?
echo "<br><br>";
require_once("footer.php");
?>
