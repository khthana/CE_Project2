<?php
	require('./libraries/grab_globals.lib.php'); 
	include("./GenHtml.php");
	include("./config.inc.php");
	define("DBNAME","e_learning");
	define("TABLE","wquestion");
	
	function setid($var) {
		global $pid;
		$pid = $var;
	}
	function getid() {
		global $pid;
		return $pid;
	}
	
	$menuh = array(array("NewDiscuss.php","ตั้งกระทู้ใหม่"),array("SearchDiscuss.php","หน้าถัดไป"));
	
	if(!empty($id)) {
		$query = check_data("wquestion",$id);
		$row = data_row($query,"check_data");
		if($row != 0) {
			setid($id);
			showheader("Webboard","./picture/logo.jpg ");
			echo  "<td bgcolor=#969696 align=center class = text>&nbsp;</td>";
			showbody("show_ans");
			if($submit || $tmp == 1) {
					include("./ReplyDiscuss.php"); 
					$Check = " ";
					$tmp = 0;
			}
			if(!$flag) {
			//	Closed();
				Closed();	
			}
			echo  "<td bgcolor=#FF9900 align=center class = text>&nbsp;</td>";			
		if(empty($Check))  {
			?>
			<form  method="post" action="Discussion.php?id=<?php echo getid() ?> ">
				<table width="100%"  cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="right"><input type="submit" name="submit" value="Reply"></td>
						<td width="3%">&nbsp;</td>
					</tr>
				</table>
			</form> 
			<?php
			}
		}
		else {
			showheader("Webboard","./picture/logo.jpg ");
			showmenu(menu($menuh,1,"#969696"));
			showbody(DBNAME);
			showfooter(menu($menuh,1,"#FF9900"));
		}
	}
	else {
			showheader("Webboard","./picture/logo.jpg ");
			showmenu(menu($menuh,1,"#969696"));
			showbody(DBNAME);
			showfooter(menu($menuh,1,"#FF9900"));
	}
?>
<!--
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

</body>
</html>-->