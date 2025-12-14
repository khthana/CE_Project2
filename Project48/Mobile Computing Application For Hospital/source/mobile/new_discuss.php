<html>
<head><title>ตั้งกระทู้ใหม่</title></head>
<table align="center"  cellpadding="0" cellspacing="0" style="border-collapse: collapse"  width="50%">
<br><br>
	<tr>
		<td >
				<img  border="1" src="image/logo.jpg" width="760" height="80">
		</td>
	</tr>
	
	<tr><td width="50%" align="center" bgcolor="#993399">
		<form method="POST" action="new_discuss.php">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
																		<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr> 
                                                                			<tr>
                                                                                <td bgcolor="#f3f3f3"  align="right" width="30%"><font face="MS Sans Serif" size="2">* ชื่อกระทู้ : </td></td>
                                                                                <td bgcolor="#f3f3f3" width="70%">
																				<input type="text" name="Title" size="40" maxlength="50">
																			</td>
                                                                        </tr> 
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right"><font face="MS Sans Serif" size="2">*เจ้าของกระทู้ : </td></td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="text" name="Poster" size="40" maxlength="10">
                                                                                	</td>
                                                                       <tr>
                                                                                <td bgcolor="#f3f3f3" align="right"><font face="MS Sans Serif" size="2">อีเมล์ : </td></td>
                                                                                <td bgcolor="#f3f3f3">
                                                                                		<input type="text" name="Email" size="40" maxlength="30">
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right"><font face="MS Sans Serif" size="2">* รายละเอียด : </td></td>
                                                                                <td bgcolor="#f3f3f3"><textarea rows="8" name="Mesg" cols="50"></textarea>
                                                                                </td>
                                                                        </tr>
                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3"></td>
                                                                                <td bgcolor="#f3f3f3"><input type="submit" value="   OK   " name="b1"><input type="reset" value="Clear"></td>
                                                                        </tr>
																		                                                                        <tr>
                                                                                <td bgcolor="#f3f3f3" align="right">&nbsp;</td>
                                                                                <td bgcolor="#f3f3f3">&nbsp;</td>
                                                                        </tr>
                                                                </table>
		</td>
	</tr>

	<tr>
		<td bgcolor="#FFCCCC" align="center"><font face="MS Sans Serif" size="2">
<?
	include("genhtml.php");
	include("webboard_db.php");
	define("HOST","localhost");
	define("UNAME","webboard");
	define("PASSWD","webboard");
	define("DBNAME","webboard");

	function checklist($var,$name){
		global $question;
		global $flag;

		if(empty($var)){
			if(!ereg("หมายเลข|วันที่|E-mail",$name))
				$flag = 1;
		}
		$question[$name] = $var;
	}

	function insertnl($mesg){
			$j = 0;
		$str = "";
		$size = strlen($mesg);
		if(!ereg("\n",$mesg)){
			if($size > 90){
				$token = floor($size / 90);
				for($i = 0;$i < $token;$i++){
					$start = $i * 90;
					$sub[$j] = substr($mesg,$start,90);
					$j++;
				}
				$remain = $size % 90;
				$start = $size - $remain;
				$sub[$j] = substr($mesg,$start,$remain);
				for($k = 0;$k < count($sub);$k++)
					$str = $str.$sub[$k]."\n";
			}
			else 
				$str = $mesg;
		}
		else
			$str = $mesg;
		return $str;
	}
if (empty($PostID))
$PostID = "";
	if(!empty($b1)){
		checklist($PostID,"หมายเลข");
		checklist($Title,"ชื่อกระทู้");
		checklist($Poster,"เจ้าของกระทู้");
		checklist($Email,"E-mail");
		checklist(Date("j-M-Y H:i"),"วันที่");
		$str = insertnl($Mesg);
		checklist($str,"รายละเอียด");
		if($flag){
			echo errmesg("กรุณากรอก ");
			while(list($key,$value) = each($question)){
				if(empty($value)){
					if(!ereg("หมายเลข|วันที่|E-mail",$key))
						echo errmesg(" \"$key\" ");
				}
			}
			echo errmesg(" ให้ครบถ้วน<br>");
		}
		else{
			$query = add_data($question,"question"); //question is table name.
			$row = data_row($query,"add_data");
			if($row > 0){
				echo "<br>ข้อความของคุณ $Poster ถูกโพสลงกระดานเรียบร้อยแล้ว<br></form>";
?>
					</form>

				<form method="POST" action="webboard.php">
					<input type="submit" value="กลับสู่ webboard">
				</form>
<?
			}
			else
				errmesg(mysql_error());
		}
	}
?>
	</font>
	</td></tr>
	<tr><td align="right"bgcolor = "#CCCCCC"><IMG align=\"center" SRC="image/home_small.gif" WIDTH="16" HEIGHT="16"><FONT face="MS Sans Serif" SIZE="1" COLOR="#FFFFFF"><A HREF="index.php">กลับหน้าเเรก</A></FONT></td>
	</tr>
</table>
</body>
</html>
<br><br>
<? require_once("footer.php"); ?>