<?
		include("genhtml.php");
		include("webboard_db.php");
		define("HOST","localhost");
		define("UNAME","webboard");
		define("PASSWD","webboard");
		define("DBNAME","webboard");
		define("TABLE","question");

		function setid($var){
			global $pid;
			$pid = $var;
		}
		function getid(){
			global $pid;
			return $pid;
		}
		$menuh = array(array("new_discuss.php","ตั้งกระทู้ใหม่"),
						 array("search_discuss.php","หน้าถัดไป"));
		$menuh2 = array(array("webboard.php","กลับไปยังกระดาน"),
			 			 array("new_discuss.php","ตั้งกระทู้ใหม่"));
		if(!empty($id)){
			$query = check_data("question",$id); 
			$row = data_row($query,"check_data");
			if($row != 0){
				setid($id);
				showheader("W e b b o a r d","image/logo.jpg");
				showmenu(menu($menuh2,1,"#969696"));
				showbody("show_ans");
				include("reply_discuss.php");
				showfooter(menu($menuh2,1,"#FF9900"));
			}
			else{
				showheader("W e b b o a r d","image/webboard.jpg");
				showmenu(menu($menuh,1,"#969696"));
				showbody(DBNAME);
				showfooter(menu($menuh,1,"#FF9900"));
			}
		}
		else{
			showheader("W e b b o a r d","image/webboard.jpg");
			showmenu(menu($menuh,1,"#FFCC99"));
			showbody(DBNAME);
			showfooter(menu($menuh,1,"#FF9900"));
		}
		require_once("footer.php");
?>