<tr>
			<td width="100%" align="center" bgcolor="#FFFFCC">
			<form method="POST" action="discussion.php?id=<?echo getid()?>">
			  <table border="0" cellpadding="0" cellspacing="0"  width="100%">
				<tr>
                                                                                <td bgcolor="#F3F3F3"  align="right" width="30%">&nbsp;</td>
                                                                                <td bgcolor="#F3F3F3" width="70%">&nbsp;</td>
                                                                        </tr> 
                                                                			<tr>
                                                                                <td bgcolor="#f3f3f3"  align="right" width="30%"><font face="MS Sans Serif" size="2">* ผู้ตอบ : </td></td>
                                                                                <td bgcolor="#f3f3f3" width="70%">
																				<input type="text" name="Sender" size="40" maxlength="10">
																			</td>
                                                                        </tr> 
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
				  <td width="100%" colspan="2">
				  <p align="center"><input type="submit" value="  OK  " name="b1"><input type="reset" value="Clear"></td>
				</tr>
			  </table>
			</form>
			</td>
		</tr>
		<tr>
			<td width="100%" align="center" bgcolor="#FFFFCC">
			<table border="0" cellpadding="0" cellspacing="0"  width="100%">
				<tr>
					<td bgcolor="#FFCC99" align="center"><font face="MS Sans Serif" size="2">
<?
	function checklist($var,$name){
		global $answer;
		global $flag;

		if(empty($var)){
			if(!ereg("หมายเลขคำตอบ|หมายเลขกระทู้|วันที่|E-mail",$name))
				$flag = 1;
		}
		$answer[$name] = $var;
	}
	function insertnl($Mesg){
		$j = 0;
		$str = "";
		$size = strlen($Mesg);
		if(!ereg("\n",$mesg)){
			if($size > 90){
				$token = floor($size / 90);
				for($i = 0;$i < $token;$i++){
					$start = $i * 90;
					$sub[$j] = substr($Mesg,$start,90);
					$j++;
				}
				$remain = $size % 90;
				$start = $size - $remain;
				$sub[$j] = substr($Mesg,$start,$remain);
				for($k = 0;$k < count($sub);$k++)
					$str = $str.$sub[$k]."\n";
			}
			else 
				$str = $Mesg;
		}
		else
			$str = $Mesg;
		return $str;
	}
if (empty($AnsID))
$AnsID = "";
	if(isset($b1)){
		checklist($AnsID,"หมายเลขคำตอบ");
		checklist(getid(),"หมายเลขกระทู้");
		checklist($Sender,"ผู้ตอบ");
		checklist($Email,"E-mail");
		checklist(Date("j-M-Y H:i"),"วันที่");
		$str = insertnl($Mesg);
		checklist($str,"รายละเอียด");
		if($flag){
			echo errmesg("กรุณากรอก ");
			while(list($key,$value) = each($answer)){
				if(empty($value)){
					if(!ereg("หมายเลขคำตอบ|หมายเลขกระทู้|วันที่|E-mail",$key))
						echo errmesg(" \"$key\" ");
				}
			}
			echo errmesg(" ให้ครบถ้วน<br>");
		}
		else{
			$query = add_data($answer,"answer");                //question is table name.
			$row = data_row($query,"add_data");
			if($row > 0){
				echo "ข้อความของคุณถูกโพสลงกระทู้เรียบร้อยแล้ว<br>";
?>
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
					</font></td>
				</tr>
			</table>
			</td>
		</tr>