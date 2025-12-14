<?php // function work into webboard
	require('./libraries/grab_globals.lib.php'); 
	function showheader($str,$imgfile) {
		echo "<html>\n";
		echo "<head><title>$str</title><link href=\"./style.css\" rel=\"stylesheet\" type=\"text/css\"></head>\n";
	?>
		
<link href="style.css" rel="stylesheet" type="text/css">
<body topmargin="0" leftmargin="0">
		<table border="1" cellpadding="0"  cellspacing="0" style="border-collapse:collapse" bordercolor="#111111" width="100%">
			<tr>
				<td width="100%">
		<?php
				echo "<img border=\"0\" src=\"$imgfile\" height=\"81\" width=\"100%\"></td>\n";
				echo "</tr>";
				}
				function showmenu($str) {
		?>		
					<tr>
						<td width="100%">
							<table border="0" cellpadding="0" cellspacing="0" bordercolor="#111111" width="100%	">
								<tr>
			<?php
					echo $str;
			?>
								</tr>
							</table>
						</td>
					</tr>
			<?php
					}
					function showbody($str) {
			?> 
					<tr>
						<td width="100%">
			<?php
					if(strcmp($str,"e_learning") == 0) {
						$query = check_num_discuss();
						$row = data_row($query,"check_data");
						$query = get_discuss(TABLE,"postid",$row,$row - 22);
						$str = data_row($query,"get_discuss");
						webboard_body($str);
					}
					else if(strcmp($str,"show_ans") == 0){
						$query = data(TABLE,getid());
						$str = data_row($query,"get_topic");
						ansbody($str);
						$query = get_ans(getid());
						$str = data_row($query,"get_ans");
						ansbody($str);
						$query = check_data(TABLE,getid());
					}
					else
						echo $str;
			?>
						</td>
					</tr>
			<?php
					}
					function showfooter($str) {
			?>
				<tr>
			<?php 
				echo $str;
			?>				
				</tr>
			</table>
		</body>
		</html>
	<?php
		}
		function menu($menu,$num,$color) {
			if($num == 1)
				$str = "<td bgcolor=$color align=center class = text>";
				
			for($i = 0;$i < count($menu);$i++) {
				$j = 0;
				if($num == 0)
					$str1 = "<td>";
				if($num == 1 && $i != 0)
					$str1 = "|";
				$str1 .= "<a class=text href = \"".$menu[$i][$j]."\">";
				$str2 = img_or_txt($menu[$i][++$j],$num)."</a>";
				if($num == 0)
					$str2 .= "</td>\n";
				$tmp = $str1.$str2;
				$str .= $tmp;
			}
			if($num == 1)
				$str .= "</td>\n";
			return $str;
		}
		function webboard_body($str) {
	?>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr  class="text">
				<td width="8%" bgcolor="#FFCC99"><b>หมายเลข</b></td>
				<td width="57%" bgcolor="#FFCC99"><b>ชื่อกระทู้</b></td>
				<td width="10%" bgcolor="#FFCC99"><b>ผู้ส่ง</b></td>
				<td width="20%" bgcolor="#FFCC99"><b>วันที่ - เวลา</b></td>
				<td width="5%" bgcolor="#FFCC99"><b>ผู้ตอบ</b></td>
			</tr>
	<?php
		echo $str 
	?>
		</table>
	<?php
		}
		function discuss_body($row,$field) {
			$td = "<td bgcolor=#FFFFCC class = text>";
			$str = "<tr>\n";
			
			for($i=0;$i <= $field;$i++) {
				if($i == 0) {
					$id = $row[$i] ;
					$data = sprintf("%05d",$row[$i]);
				}
				else if($i == 1) {
					$data = "<a class=text target = \"_blank\" href=\"Discussion.php?id=$id\">$row[$i]</a>";
				}
				else if($i == $field) {
					$query = check_data("wanswer" , $id);
					$data = data_row($query,"check_data");
				}	
				else 
					$data = $row[$i];
					$str = $str.$td.$data."</td>\n";
			}
			$str = $str."</tr>\n";
			return $str;
		}
		function ansbody($str) {
	?>
		<br><p align="center">
	<?php
		echo $str;
	?>
		</p>
	<?php
		}
		function template($str) {
			$head = "<table border=1 cellpadding=0 cellspacing=0 style=border-collapse:collapse bordercolor = #111111 width=80%>\n";
			$str = $head.$str."</table><br>";
			return $str;
		}
		function discuss_topic($result,$size) {
			$str = "<tr>\n";
			$j = 0;
			$list = array("จาก","E-mail","วัน - เวลา");
			
			for($i = 1;$i < $size;$i++) {
				if($i == 1)
					$tr = "<tr><td width=100% colspan=3 bgcolor=#000000><font face=MS Sans Serif color=#FFFFFF size=5>$result[$i]</font></td></tr>\n";
				else if($i ==($size-1))
					$mesg = "<tr>\n<td width=100% colspan=3 class=text>$result[$i]</td>\n<tr>\n";
				else {
					$td = "<td width=33% bgcolor=#CCFFCC class = text>$list[$j]:$result[$i]</td>\n";
					$j++;
					$str = $str.$td;
				}
			}
			$str = $tr.$mesg.$str."</tr>\n";
			return $str;
		}
		function reply_discuss($result,$size) {
			$str = "<tr>\n";
			$j = 0;
			$list = array("จาก","E-mail","วัน - เวลา");
			
			for($i=2;$i<$size;$i++) {
				if($i ==($size-1)) 
					$mesg = "<tr>\n<td width=100% colspan=3 class = text>$result[$i]</td>\n";
				else {
					$td = "<td width=33% bgcolor=#CCFFCC class =text>$list[$j]:$result[$i]</td>\n";
					$j++;
					$str = $str.$td;
				}
			}
			$str = $str.$mesg.$str."</tr>\n";
			return $str;
		}
		function img_or_txt($str,$i) {
			if($i==0)
				$str = "<img src=\"".$str."\" border=0>";
			if($i==1)
				$str = $str;
			return $str;
		}
		function errmesg($str) {
			$mesg = "<font color=red class =text>$str</font>";
			return $mesg;
		}
	// function work into News post		
		function showcontent($str) {
	?>
		<table width="100%" border="1" cellpadding="0" cellspacing="0">
		   	<tr>
				<td>
	<?php
			switch($str) {
				case 'login_form':
					login_form();break;
				case 'group_form':
					group_form();break;	
				case 'news_form':
					news_form();break;
				case 'news_list':
					news_list();break;	
				case 'news_body':
					news_body();break;
				default:
					echo $str;break;	
			}
	?>
				</td>
			</tr>
		</table>
	<?php
		}
		function hori_menu($menu,$color) {
			$str = "<td bgcolor=\"$color\" align=right class=text>";
			for($i=0;$i < count($menu);$i++) {
				$j = 0;
				if($i != 0)
					$str .= "|";
				$str .= "<a class=text href=\"".$menu[$i][$j]."\">".$menu[$i][++$j]."</a>";
			}
			$str .= "&nbsp;</td>\n";
			return $str;
		}
		function news_body() {
			$listid = getid();
			if(isset($listid)) {
				$query = "SELECT headline,image,content,fname FROM news,writer ";
				$query .="WHERE news.gid='$listid' and writer.uname=news.writer ORDER BY modified DESC";
			}
			else { 
				$query = "SELECT gname,image,headline,modifield,news.gid FROM newsgroup,news ";
				$query .="WHERE latest='1' and news.gid = newgroup.gid ORDER BY newsgroup.gid ASC";
				$link = 1;	
			}
			$result = action("get_data",$query);	
			while($row = mysql_fetch_array($result)) {
	?>
		<table border="0" cellpadding="0" cellspacing="0" width="90%">
			<tr>
				<td colspan="2" algn="left" bgcolor="#CCCCCC" class="text"><font color="#FF0000"> 
				<?php echo $row[0]; ?> </font></td>
			</tr>
			<tr>
				<td rowspan="3" width="30%" valign="top"> <?php
				 if(!empty($row[1])){
				 	echo "<img src=\"resize.php?file=$row[1]\">";
				 } ?>
				</td>
				<td width="70%" valign="top" class="text"><?php echo nl2br($row[2]); ?></td>
			</tr>
			<tr>
				<td align="right" valign="top" class="text"><i><?php echo $row[3]; ?></i></td>
			</tr>
			<tr>
				<td align="right" valign="top" class="text"> <?php 
					if($link)
						echo "<a class=text href=\"news.php?cm=read&gid=$row[4]\">ดูรายละเอียด...</a>";
				?></td>
			</tr>
		</table>
	<?php
			}		
			mysql_free_result($result);
		}
		function login_form() {
	?>
	<form method="post" action="News.php">
		<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
			<tr>
				<td width="100%" bgcolor="#CCCCCC" colspan="2" align="right" class="text">&nbsp;</td>
			</tr>
			<tr>
				<td width="95%" bgcolor="#EEEEEE" colspan="2" align="right" class="text"><font color="#A1A1A1">:: LOGIN ::&nbsp;</font></td>
			</tr>
			<tr>
				<td width="31%" align="right" bgcolor="#CCE6FF" class="text" height="35">ชื่อผู้ใช้ :&nbsp;</td>
				<td width="64%" bgcolor="#CCE6FF"><input name="uname" type="text" size="20"></td>
			</tr>
			<tr>
				<td width="31%" align="right" bgcolor="#CCE6FF" class="text">รหัสผ่าน :&nbsp;</td>
				<td width="64%" bgcolor="#CCE6FF"><input name="passwd" type="password" size="20"></td>						
			</tr>
			<tr>
				<td width="95%" colspan="2" align="center" bgcolor="#CCE6FF" class="text">
				<input name="submit" type="submit" value="ตกลง"><input name="" type="reset" value="ยกเลิก"></td>						
			</tr>
			<tr>
				<td width="95%" bgcolor="#EEEEEE" colspan="2" align="right" class="text"><font color="#A1A1A1">:: สำหรับอาจารย์หรือผู้ดูแลระบบ ::&nbsp;</font></td>
			</tr>
			<tr>
				<td width="100%" bgcolor="#CCCCCC" colspan="2" align="right" class="text">&nbsp;</td>
			</tr>

		</table>
	</form>
	<?php
		}	
?>
<!--<html>
<html>
<head>
<title>Webboard</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" leftmargin="0">

</body>
</html>

</html>-->