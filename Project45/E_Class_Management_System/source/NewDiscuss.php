<?php 
	require('./libraries/grab_globals.lib.php');
	session_start(); 
?>

  <!--<tr> 
    <td bgcolor="#FFCCCC" align="center" class="text">-->
<?php
	include("./GenHtml.php");
	include("./config.inc.php");
	
	function checklist($var,$name) {
		global $question;
		global $flag;
		if(empty($var)) {
			if(!ereg("หมายเลข|วันที่|E-mail",$name))
				$flag = 1;
		}
		$question[$name] = $var;
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
		checklist($postid,"หมายเลข");
		checklist($CID,"หมายเลขวิชา");
		checklist($title,"ชื่อกระทู้");
		checklist($poster,"เจ้าของกระทู้");
		checklist($email,"E-mail");
		checklist(date("j-M-Y H:i"),"วันที่");
		$str = insertnl($mesg);
		checklist($str,"รายละเอียด");
		if($flag) {
			echo errmesg("กรุณากรอก ");
			while(list($key,$value) = each($question)) {
				if(empty($value)) {
					if(!ereg("หมายเลข|วันที่|E-mail",$key))
						echo errmesg(" \"$key\" ");
				}
			}
			echo errmesg("ให้ครบถ้วน<br>");
		}					
		else {
			$query = add_data($question,"wquestion"); //wquestion is table name.
			$row = data_row($query,"add_data");
			if($row >0 ) {
				echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= Webboard.php?CID=$CID>";
			}			
			else
				errmesg(mysql_error());
		}
	}
?>
<html>
<head>
<title>New - Discussion</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body  topmargin="0" leftmargin="0">
<table width="100%" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse" bordercolor="#111111">
  <tr> 
    <td width="100%"><img src="./Picture/logo.jpg" width="100%" height="81"></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFCC" width="100%" align="center">&nbsp;
	<form  method="post" action="NewDiscuss.php?CID=<?php echo $CID ?>">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="30%" align="right" class="text"><font color="#FF0000">* 
              </font>ชื่อกระทู้ : &nbsp;</td>
            <td width="70%"  class="text"><input name="title" type="text" id="title" size="40" maxlength="50"></td>
          </tr>
          <tr> 
            <td align="right" class="text"><font color="#FF0000"> * </font>เจ้าของกระทู้ 
              : &nbsp;</td>
            <td  class="text"><input name="poster" type="text" id="poster" size="40" maxlength="10"></td>
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
                <input name="b1" type="submit" value="ตกลง">
                &nbsp;&nbsp;&nbsp; 
                <input   value="ค่าเริ่มต้น" type="reset">
              </p></td>
          </tr>
        </table>
      </form></td>
  </tr>
	
<!--	</td>
  </tr> -->
  <tr bgcolor="#FFFFCC" >	
  		<td height="60" >&nbsp;</td>
  </tr>
 </table>
</body>
</html>
