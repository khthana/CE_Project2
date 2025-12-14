<?
	session_start();
	require_once("function.php");
	include("db.php");
	include("fn.php");
	include("genhtml.php");
	define("HOST","localhost");
	define("UNAME","news");
	define("PASSWD","news");
	define("DBNAME","news");
	$vmenu = leftmenu();	
	if (empty($cm)) $cm="";
	switch($cm){
		case 'login':		//-------------------------- login ------------------------------
			settitle("ล็อกอิน");
			$hmenu = array(array("/project/index.php","หน้าแรก"),
							array("news.php?cm=login","ล็อกอิน"));
			$content = "login_form";
			if(isset($submit)){
				if(empty($uname) || empty($passwd))
					$footer = errmesg("กรุณาป้อนชื่อผู้ใช้และรหัสผ่านให้ครบถ้วน");					
				else{
					$query = user_auth($uname,$passwd);
					$row = action("get_row",$query);
					if($row <= 0)
						$footer = errmesg("ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง กรุณาป้อนใหม่อีกครั้ง");
					else{
						$authuser = $uname;
						session_register("authuser");
						header("Location: writer_sec.php");
						header ("Cache-Control: no-cache, must-revalidate");
				$footer = "โรงพยาบาล เกกีงาม 2 	เลขที่  13/32   ถ.คุณหญิงเลี่ยม   เขตลาดกระบัง   กรุงเทพฯ   10520    โทร : 02-327-2002";
				}
				}
			}
			else
				$footer = "โรงพยาบาล เกกีงาม 2 	เลขที่  13/32   ถ.คุณหญิงเลี่ยม   เขตลาดกระบัง   กรุงเทพฯ   10520    โทร : 02-327-2002";
			break;
		case 'read':			//-------------------------- read ------------------------------
			setid($gid);
			settitle("ข่าวประชาสัมพันธ์");
			$hmenu = array(array("/project/index.php","หน้าแรก"),
							array("news.php?cm=login","ล็อกอิน"));
			$content = "news_body";
			$footer = "โรงพยาบาล เกกีงาม 2 	เลขที่  13/32   ถ.คุณหญิงเลี่ยม   เขตลาดกระบัง   กรุงเทพฯ   10520    โทร : 02-327-2002";
			break;
		default:
			settitle("ข่าวประชาสัมพันธ์");
			if (!empty($listid)) setid($listid);
			$hmenu = array(array("news.php?cm=login","ล็อกอิน"));
			$content = "news_body";
			$footer = "โรงพยาบาล เกกีงาม 2 	เลขที่  13/32   ถ.คุณหญิงเลี่ยม   เขตลาดกระบัง   กรุงเทพฯ   10520    โทร : 02-327-2002";
			break;
	}
	showheader(gettitle());
	topmenu(hori_menu($hmenu,"#CCCCCC"));
	sidemenu(vert_menu($vmenu));
	showcontent($content);
	showfooter($footer);
?>