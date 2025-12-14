<?
		include("database.php");
		include("function.php");
		require_once("connect_db.php");
		require_once("headeradmin.php");
		require_once("check_data.php");
		check_permit();
		header_admin("แก้ไขบุคลากร");
?>
<?
		$result = select_book($DoctorID);
		$row = mysql_fetch_array($result,MYSQL_ASSOC);
		$catego=$row["CatID"];
?>
		<br>
		<table align="center" width="500">
				<form action="edit.php" method="post">
				<tr>
						<td bgcolor="#A6A6FF" colspan="3" align="center"><font face="Ms Sans serif"><b>เเก้ไขข้อมูลพนักงาน : </b></font></td>
				</tr>
				<tr>
						<td bgcolor="#F3F3F3"><font face="Ms Sans serif"><b>ID : </b></font></td>
						<td bgcolor="#F3F3F3" colspan="2"><input type="text" value="<?=$row["DoctorID"]?>" name="DoctorID">
						<input type="hidden" name="OldDoctorID" value="<?=$row["DoctorID"]?>">
						</td>
				</tr>
				<tr>
						<td bgcolor="#F3F3F3"><font face="Ms Sans serif"><b>ชื่อ-สกุล : </b></font></td>
						<td bgcolor="#F3F3F3" colspan="2"><input type="text" value="<?=$row["DoctorName"]?>" name="DoctorName" maxlength="60" size="28"></td>
				</tr>
				<tr>
						<td bgcolor="#F3F3F3"><font face="Ms Sans serif"><b>ความเชี่ยวชาญ : </b></font></td>
						<td bgcolor="#F3F3F3" colspan="2"><select size="1" name="CatID">
<?
			$resultcat = show_data("categories");
			while($cate = mysql_fetch_array($resultcat,MYSQL_ASSOC)){
			 if($row["CatID"]==$cate["CatID"])
					echo "<option value=". $cate["CatID"] ." selected>".$cate["CatName"]."</option>";
			else
					echo "<option value= ".$cate["CatID"].">".$cate["CatName"]."</option>";
			 }
?>
						</td>
				</tr>

				<tr>
						<td bgcolor="#F3F3F3"><font face="Ms Sans serif"><b>ที่อยู่ : </b></font></td>
						<td bgcolor="#F3F3F3" colspan="2"><input type="text" value="<?=$row["Address"]?>" name="Address" size="50"></td>
				</tr>

				<tr>
						<td bgcolor="#F3F3F3"><font face="Ms Sans serif"><b>โทรศัพท์มือถือ : </b></font></td>
						<td bgcolor="#F3F3F3" colspan="2"><input type="text" value="<?=$row["MobilePhone"]?>" name="MobilePhone" size="15"></td>
				</tr>

				<tr>
						<td bgcolor="#F3F3F3"><font face="Ms Sans serif"><b>โทรศัพท์บ้าน : </b></font></td>
						<td bgcolor="#F3F3F3" colspan="2"><input type="text" value="<?=$row["Phone"]?>" name="Phone" size="15">
						<font face="Ms Sans serif"></font></td>
				</tr>

				<tr>
						<td bgcolor="#F3F3F3"><font face="Ms Sans serif"><b>อีเมล์ : </b></font></td>
						<td bgcolor="#F3F3F3" colspan="2"><input type="text" value="<?=$row["Email"]?>" name="Email" size="30"></td>
				</tr>

				<tr>
						<td bgcolor="#F3F3F3"><img src="<?=$row["Picture"]?>" style="border-right:2pt border-top:2pt border-bottom:2pt border-left:2pt"></td>
						<td bgcolor="#F3F3F3" colspan="2"><input type="text" name="Picture" size="30" value="<?=$row["Picture"]?>"></td>
				</tr>

				<tr>
						<td bgcolor="#F3F3F3" align="center" colspan="1">
						<input  type="submit" name="edit" value="แก้ไขบุคลากร"></td>
				</form>

				<form action="delete.php" method="post">
						<td bgcolor="#F3F3F3" align="left">
						<input type="hidden" value="<?=$row["DoctorID"]?>" name="DoctorID">
						<input  type="submit" name="delete" value="ลบบุคลากร"></td>
						</td>
				</tr>
				</form>
		</table>
<?
require_once("footer.php");
?>