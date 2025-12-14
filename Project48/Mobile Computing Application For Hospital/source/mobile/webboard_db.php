<?
	function conn_db($host,$uname,$passwd,$dbname){
		$db = mysql_connect($host,$uname,$passwd)
			or die(errmesg("ไม่สามารถติดต่อกับฐานข้อมูลได้"));
		mysql_select_db($dbname,$db);
		return $db;
	}
	function add_data($data,$table){
		$query = "insert into $table values(";
		list($key,$value) = each($data);
		$query = $query."'$value'";
		while(list($key,$value) = each($data))
			$query = $query.",'$value'";
		$query = $query.")";
		return $query;
	}
	function get_discuss($table,$field,$begin,$end){
		$query = "select PostID,Title,Poster,Date from $table where $field<='$begin' and $field>'$end' order by $field desc";
		return $query;
	}
	function check_num_discuss(){
		$query = "select * from question";
		return $query;
	}
	function check_data($table,$value){
		$query = "select * from $table where PostID='$value'";
		return $query;
	}
	function get_ans($value){
		$query = "select * from answer where PostID='$value' order by AnsID asc";
		return $query;
	}
	function data_row($query,$choice){
		$str = "";
		$db = conn_db(HOST,UNAME,PASSWD,DBNAME);
		$result = mysql_query($query,$db);

		if(strcmp($choice,"get_discuss") == 0){
			$field = mysql_num_fields($result);
			while($row = mysql_fetch_array($result))
				$str = $str.discuss_body($row,$field);
			mysql_free_result($result);
		}
		else if(strcmp($choice,"get_topic") == 0){
			$field = mysql_num_fields($result);
			while($row = mysql_fetch_array($result)){
				$data = discuss_topic($row,$field);
				$str = $str.template($data);
			}
			mysql_free_result($result);
		}
		else if(strcmp($choice,"get_ans") == 0){
			$field = mysql_num_fields($result);
			while($row = mysql_fetch_array($result)){
				$data = reply_discuss($row,$field);
				$str = $str.template($data);
			}
			mysql_free_result($result);
		}
		else if(strcmp($choice,"check_data") == 0)
			$str = mysql_num_rows($result);
		else if(strcmp($choice,"add_data") == 0)
			$str = mysql_affected_rows($db);
		return $str;
	}
?>