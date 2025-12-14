<?
	include("genhtml.php");
	include("webboard_db.php");
	require_once("function.php");
	define("HOST","localhost");
	define("UNAME","webboard");
	define("PASSWD","webboard");
	define("DBNAME","webboard");
	define("TABLE","question");
	check_session();

	function setbegin($row){
		global $begin;
		$begin = $row;
	}
	function setend($row){
		global $end;
		$end = $row - 22;
	}
	function getbegin(){
		global $begin;
		return $begin;
	}
	function getend(){
		global $end;
		return $end;
	}

	if((!isset($np)) || (!isset($num))){
		$query = check_num_discuss();
		$row = data_row($query,"check_data");
		if($row <= 22){
			$begin = $row;
			$end = 0;
		}
		else{
			setbegin($row);
			setend($row);
			$begin = getbegin();
			$end = getend();
		}
		$menu = array(array("new_discuss.php","ตั้งกระทู้ใหม่"),
					   array("webboard.php?num=$row&np=".getend(),"หน้าถัดไป"));
	}
	else{
		setbegin($np);
		setend($np);
		$begin = getbegin();
		$end = getend();
		$prev = getbegin() + 22;

		if($end <= 0){
			if($prev == $num)
				$menu = array(array("webboard.php","หน้าที่แล้ว"),
array("new_discuss.php","ตั้งกระทู้ใหม่"));
			else
				$menu = array(array("webboard.php?num=$num&np=".$prev,"หน้าที่แล้ว"),
							   array("new_discuss.php","ตั้งกระทู้ใหม่"));
		}
		else{
			if($prev == $num)
				$menu = array(array("webboard.php","หน้าที่แล้ว"),
							   array("new_discuss.php","ตั้งกระทู้ใหม่"),
							  array("webboard.php?num=$num&np=".getend(),"หน้าถัดไป"));
			else
				$menu = array(array("webboard.php?num=$num&np=".$prev,"หน้าที่แล้ว"),
							   array("new_discuss.php","ตั้งกระทู้ใหม่"),
							   array("webboard.php?num=$num&np=".getend(),"หน้าถัดไป"));
		}
	}
		showheader("กระดานสนทนา","image/logo.jpg");
		echo "<td align=\"right\"bgcolor = \"#CCCCCC\"><IMG align=\"center\" SRC=\"image/home_small.gif\" WIDTH=\"16\" HEIGHT=\"16\"><FONT face=\"MS Sans Serif\" SIZE=\"1\" COLOR=\"#FFFFFF\"><A HREF=\"index.php\">กลับหน้าเเรก</A></FONT></td>";
		showmenu(menu($menu,1,"#666666"));
?>
		<tr>
			<td width="100%">
<?
	$query = get_discuss(TABLE,"PostID",$begin,$end); //order by postid
	$str = data_row($query,"get_discuss");
	webboard_body($str);
?>
			</td>
		</tr>
<?
		showmenu(menu($menu,1,"#FF9900"));	
?>
	</table>
	<?	require_once("footer.php");?>
</body>
</html>