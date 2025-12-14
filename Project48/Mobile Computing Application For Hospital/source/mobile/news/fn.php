<?
function setvar($param){
 		global $var;
 		$var = $param;
 	}
  //---------------------------------------------------- getvar ---------------------------------------------------------
 	function getvar(){
 		global $var;
 		return $var;
 	}
   //---------------------------------------------------- setid ---------------------------------------------------------
	function setid($param){
 		global $id;
 		$id = $param;
 	}
	//---------------------------------------------------- getid ---------------------------------------------------------
 	function getid(){
 		global $id;
 		return $id;
	}
	//---------------------------------------------------- fillarray ---------------------------------------------------------
 	function fillarray($var,$name){
 		global $data;
 		global $flag;
 		
 		if(empty($var)){
 			if(!ereg("id|ภาพ",$name))
 				$flag = 1;
 		}
 		$data[$name] = $var;
 	}
//---------------------------------------------------- error ---------------------------------------------------------
 	function error($array){
 		$str = "กรุณาป้อน ";
 		while(list($key,$value) = each($array)){
 			if(empty($value)){
 				if(!ereg("id|ภาพ",$key))
 					$str = $str." \"$key\" ";
 			}
 		}
 		$str = $str." ให้ครบถ้วน";
 		return $str;
 	}
	//---------------------------------------------------- leftmenu ---------------------------------------------------------
 	function leftmenu(){
 		if (empty($menu)) $menu=NULL;
		$query = get_list("newsgroup");
 		$result = action("get_data",$query);
 		$i = 0;
 		while($row = mysql_fetch_array($result)){
 			$menu[$i][0] = "news.php?cm=read&gid=$row[0]";
 			$menu[$i][1] = $row[1];
 			$i++;
 		}
		mysql_free_result($result);
 		return $menu;
 	}
 ?>