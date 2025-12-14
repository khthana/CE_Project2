<?
		include("database.php");
		require_once("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		require_once("check_data.php");
		check_permit();
		header_admin("แก้ไขหมวดหมู่ความเชี่ยวชาญ");
		$result=select_cat($CatID);
		$row = mysql_fetch_array($result,MYSQL_ASSOC);
?>
		<table align="center" width="500">
				<form action="editcat.php" method="post">
				<br>
				<tr>
						<td bgcolor="#AACCCC"><font face="Ms Sans serif"><b>รหัสหมวดหมู่ : </b></font></td>
						<td bgcolor="#DDEEEE" colspan="2"><font face="Ms Sans serif"><b><?=$row["CatID"]?></b></font></td>
				</tr>
				<tr>
						<td bgcolor="#AACCCC"><font face="Ms Sans serif" size="2"><b>หมวดหมู่ : </b></font></td>
						<td bgcolor="#DDEEEE" colspan="2"><input type="text" value="<?=$row["CatName"]?>" name="CatName" size="30"></td>
				</tr>
						<input type="hidden" value="<?=$row["CatID"]?>" name="CatID">
				<tr>
						<td align="left" colspan="2">
						<input type="submit" name="edit" value="แก้ไขหมวดหมู่"></td>
				</form>
				
				<form action="deletecat.php" method="post">
						<td align="left">
						<input type="hidden" value="<?=$row["CatID"]?>" name="CatID">
						<input  type="submit" name="delete" value="ลบหมวดหมู่"></td>
				</form>
				</tr>
		</table>
		<br>
<?
require_once("footer.php");
?>