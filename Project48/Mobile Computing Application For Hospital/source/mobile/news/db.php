<?
	function conn_db($host,$uname,$passwd,$dbname){
		$db = mysql_connect($host,$uname,$passwd)
			or die(errmesg("ไม่สามารถสร้างการเชื่อมต่อไปยังดาต้าเซิร์ฟเวอร์ได้"));
		mysql_select_db($dbname,$db);
		return $db;
	}
	//------------------------------------------- user_auth --------------------------------------------------------------------
	function user_auth($uname,$passwd){
		$query = "select * from writer where uname='$uname' and passwd='$passwd'";
		return $query;
	}
	//-------------------------------------------- add_data --------------------------------------------------------------------
	function add_data($data,$table){
		$query = "insert into $table values(";
		list($key,$value) = each($data);
		$query = $query."'$value'";
		while(list($key,$value) = each($data))
			$query = $query.",'$value'";
		$query = $query.")";
		return $query;
	}
	//------------------------------------------ get_list ------------------------------------------------------------------------
	function get_list($table){
		if(ereg("newsgroup",$table))
			$col = "gid,gname";
		else if(ereg("news",$table))
			$col = "nid,headline";
		$query = "select $col from $table";
		return $query;
	}
	//----------------------------------------- del_group -------------------------------------------------------------------
	function del_group($gid,$db){
		$query = "select image from news where gid='$gid' and image!=''";
		$result = mysql_query($query,$db);
		if(mysql_num_rows($result) != 0){
			while($row = mysql_fetch_array($result))
				unlink($row[0]);
			mysql_free_result($result);
		}
		$query = "delete from news where gid='$gid'";
		mysql_query($query,$db);
		$query = "delete from newsgroup where gid='$gid'";
		mysql_query($query,$db);
		$row = mysql_affected_rows($db);
		return $row;
	}
	//--------------------------------------- del_news ---------------------------------------------------------------------
	function del_news($nid,$db){
		$query = "select image from news where nid='$nid' and image!=''";
		$result = mysql_query($query,$db);
		if(mysql_num_rows($result) != 0){
			$file = mysql_result($result,0,0);
			if (!empty($file)) unlink($file);
		}
		$query = "delete from news where nid='$nid'";
		mysql_query($query,$db);
		$row = mysql_affected_rows($db);
		return $row;
	}
	//--------------------------------- clearflag ----------------------------------------------------------------------------
	function clearflag($gid){
		$db = conn_db(HOST,UNAME,PASSWD,DBNAME);
		$query = "update news set latest='0' where gid='$gid'";
		mysql_query($query,$db);
	}
	//-------------------------------- action --------------------------------------------------------------------------------
	function action($str,$query){
		$db = conn_db(HOST,UNAME,PASSWD,DBNAME);
		$result = mysql_query($query,$db);

		if(ereg("get_row",$str))
			$data = mysql_num_rows($result);
		else if(ereg("get_result",$str))
			$data = mysql_result($result,0,0);
		else if(ereg("affected_row",$str))
			$data = mysql_affected_rows($db);
		else if(ereg("get_data",$str))
			$data = $result;
		return $data;
	}
?>