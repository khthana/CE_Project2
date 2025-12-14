<?
		include("database.php");
		include("function.php");
		require_once("headeradmin.php");
		require_once("check_data.php");
		require_once("connect_db.php");
		check_permit();
		header_admin("แก้ไขรายละเอียดของบุคลากร");

		$count=0;
		$result= show_data("categories");

?>
		<br>
		<br>
		<table align="center" width="300">
				<form action="deletecat_many.php" method="post">
					<tr bgcolor="#CCAAFF">
						<td align="center"><font face="Ms Sans serif"><b>เลือก</b></font></td>
						<td align="center"><font face="Ms Sans serif"><b>หมวดหมู่</b></font></td>
					</tr>
<?
		 while($row = mysql_fetch_array($result,MYSQL_ASSOC))
		 {

			 if($count==0)
			 {
		?>
		<tr bgcolor=#EEEEFF>
		<td align=center><input type=checkbox name="checkbox[]" value=<?=$row["CatID"]?>></td>
		<td><font face="Ms Sans serif"> <a href="editcat_form.php?CatID=<?=$row["CatID"]?>"> <?=$row["CatName"]?></a></font></td>
		</tr>
		<?
			$count=1;
			 }
		else
		{
		?>
		<tr bgcolor="#CCCCFF">
		<td align=center><input type=checkbox name="checkbox[]" value=<?=$row["CatID"]?>></td>
		<td><font face="Ms Sans serif" color="#0000FF"> <a href="editcat_form.php?CatID=<?=$row["CatID"]?>"> <?=$row["CatName"]?></a></font></td>
		</tr>
		<?
		$count=0;
		}
		 }	
?>
		<tr>
			<td align="center"><input type="submit" name="delete" value="ลบหมวดหมู่"></td>
		</form>
					<form action="insertcat_form.php" method="post">
							<td><input type="submit" name="insert" value="เพิ่มหมวดหมู่"></td>
					</form>
		</tr>
		</table>
<?
echo "<br><br>";
require_once("footer.php");
?>