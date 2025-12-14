<?php require('./libraries/grab_globals.lib.php'); ?>
<!--<html>
<head>
<title>New - Discussion</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body  topmargin="0" leftmargin="0">
<table width="100%" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse" bordercolor="#111111">
  <tr> 
    <td width="100%">&nbsp; </td>
  </tr> -->
  <tr> 
    <td bgcolor="#FFFFCC" width="100%" align="center">&nbsp;
	 <form name="form"  method="post" action="Discussion.php?id=<?php echo getid() ?>&tmp=1 ">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="30%" align="right" class="text"><font color="#FF0000">* 
              </font>ผู้ตอบ : &nbsp;</td>
            <td width="70%"  class="text"><input name="sender" type="text" id="sender" size="40" maxlength="50"></td>
          </tr>
          <tr> 
            <td align="right" class="text">E-mail : &nbsp;</td>
            <td><input name="email" type="text" id="email" size="40" maxlength="30"></td>
          </tr>
          <tr> 
            <td align="right" class="text" valign="top"><font color="#FF0000">*</font>รายละเอียด 
              : &nbsp;</td>
            <td><textarea name="mesg" cols="50" rows="8" id="mesg"></textarea></td>
          </tr>
          <tr> 
            <td colspan="2"><p align="center"> 
                <input name="b1" type="submit" value="ตกลง" onClick="return CheckBlank()">
                &nbsp;&nbsp;&nbsp; 
                <input   value="ค่าเริ่มต้น" type="reset">
              </p></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr> 
    <td bgcolor="#FFCCCC" align="center" class="text" width="100%">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td bgcolor="#FFCC99" align="center" class="text">
<?php
	function checklist($var,$name) {
		global $answer;
		global $flag;
		
		if(empty($var)) {
			if(!ereg("หมายเลขคำตอบ|หมายเลขกระทู้|วันที่|E-mail",$name))
				$flag = 1;
		}
		$answer[$name] = $var;
	}
	function insertnl($mesg) {
		$j = 0;
		$str = "";
		$size = strlen($mesg);
		if(!ereg("\n",$mesg)) {
			if($size > 90) {
				$token = floor($size / 90);
				for($i = 0;$i < $token;$i++) {
					$start = $i * 90;
					$sub[$j] = substr($mesg,$start,90);
					$j++;
				}
				$remain = $size % 90;
				$start = $size - $remain;
				$sub[$j] = substr($mesg,$start,$remain);
				for($k=0;$k < count($sub);$k++)
					$str = $str.$sub[$k]."\n";
			}
			else
				$str = $mesg;
		}
		else
			$str = $mesg;
		return $str;
	}
	
	if($b1) {
		
		checklist($ansid,"หมายเลขคำตอบ");
//		checklist(getid(),"หมายเลขกระทู้");
		checklist(getid(),"หมายเลขกระทู้");
		checklist($sender,"ผู้ตอบ");
		checklist($email,"E-mail");
		checklist(date("j-M-Y H:i"),"วันที่");
		$str = insertnl($mesg);
		checklist($str,"รายละเอียด");
		if($flag) {
			echo errmesg("กรุณากรอก ");
			while(list($key,$value) = each($answer)) {
				if(empty($value)) {
					if(!ereg("หมายเลขคำตอบ|หมายเลขกระทู้|วันที่|E-mail",$key))
						echo errmesg(" \"$key\" ");
				}
			}
			echo errmesg("ให้ครบถ้วน<br>");
		}					
		else {
			$query = add_data($answer,"wanswer"); //wanswer is table name.
			$row = data_row($query,"add_data");
			echo "ลงแล้วนะ";
			if($row > 0 ) {
				//Closed();
				Closed();
				echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= Discussion.php?id=".getid().">";
			}			
			else
				errmesg(mysql_error());
		}
	}
?>
	</font>
	</td>
  </tr>
</table>
</td>
</tr>
 <!--</table>
</body>
</html>-->
<script language="JavaScript">
	function CheckBlank() {
		 if(document.form.sender.value==''){
			alert('กรุณากรอกข้อมูลให้ครบ');
			document.form.sender.focus();
			return false;
		 }
	}
</script>