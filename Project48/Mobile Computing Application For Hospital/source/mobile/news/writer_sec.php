<?
session_start();
	include("db.php");
	include("fn.php");
	include("genhtml.php");
	define("HOST","localhost");
	define("UNAME","news");
	define("PASSWD","news");
	define("DBNAME","news");
if(empty($cm)) $cm="";
if(empty($type)) $type="newsgroup";
	$hmenu = array(array("writer_sec.php?type=newsgroup","ประเภทข่าว"),
  					array("writer_sec.php?type=news","ข่าว"),
	  				array("writer_sec.php?cm=logout","ออกจากระบบ"));

	if(ereg("newsgroup",$type)){
		$vmenu = array(array("writer_sec.php?type=newsgroup&cm=add","เพิ่มกลุ่มข่าวใหม่"),
	      					array("writer_sec.php?type=newsgroup&cm=del","ลบกลุ่มข่าว"),
						      array("writer_sec.php?type=newsgroup&cm=edit","แก้ไขกลุ่มข่าว"));
		if(ereg("add",$cm))
			settitle("เพิ่มกลุ่มข่าวใหม่");
		else if(ereg("del",$cm))
			settitle("ลบกลุ่มข่าว");
		else if(ereg("edit|update",$cm))
			settitle("แก้ไขกลุ่มข่าว");
		$content = "group_form";
		$group = 0;
	}
	else if(ereg("news",$type)){
		$vmenu = array(array("writer_sec.php?type=news&cm=add","เพิ่มหัวข้อข่าวใหม่"),
						array("writer_sec.php?type=news&cm=del","ลบข่าวเก่า"),
						array("writer_sec.php?type=news&cm=edit","แก้ไขหัวข้อข่าว"));
		if(ereg("add",$cm))
			settitle("เพิ่มหัวข้อข่าวใหม่");
		else if(ereg("del",$cm))
			settitle("ลบหัวข้อข่าว");
		else if(ereg("edit|update",$cm))
			settitle("แก้ไขหัวข้อข่าว");
		$content = "news_form";
		$group = 1;
	}
	$footer = "โรงพยาบาล เกกีงาม 2 	เลขที่  13/32   ถ.คุณหญิงเลี่ยม   เขตลาดกระบัง   กรุงเทพฯ   10520    โทร : 02-327-2002";
	if(session_is_registered("authuser")){
		setvar($cm);
		switch($cm){
			case 'add':
				if(isset($submit)){
					if($group == 0){
						fillarray(NULL,"id");
						fillarray($gname,"ชื่อกลุ่ม");
						fillarray($describe,"คำอธิบาย");
					}
					else if($group == 1){
						fillarray(NULL,"id");
						fillarray($authuser,"ผู้เขียน");
						fillarray($listid,"กลุ่มข่าว");
						fillarray($headline,"พาดหัวข่าว");
						fillarray($story,"รายละเอียด");
						if($image_size != 0){
							if(ereg("image/jpeg|image/pjpeg",$image_type)){
								$file = "../image/".time().".jpg";
								move_uploaded_file($image,$file);
							}
							else
								$err = "ไฟล์รูปภาพที่อัพโหลดไม่ใช่ไฟล์ jpeg";
						}
						if (!empty($file)) fillarray($file,"ภาพ");
						$date = date("j-M-Y H:i:s");
						fillarray($date,"สร้าง");
						fillarray($date,"ปรับปรุง");
						fillarray(1,"ล่าสุด");
					}
					if(!empty($flag))
						$footer = errmesg(error($data));
					else if(!empty($err))
						$footer = errmesg($err);
					else{
						clearflag($listid);
						$query = add_data($data,$type);
						$row = action("affected_row",$query);
						if($row > 0)
							$footer = "ข้อมูลถูกเพิ่มเรียบร้อยแล้ว";
						else
							$footer = errmesg(mysql_error());
					}
				}
				break;
			case 'del':
				if(isset($listid)){
					setid($listid);
					if($group == 0)
						$footer = "confirm";
					else if($group == 1)
						$content = "news_list";
				}
				else if(isset($submit)){
					$db = conn_db(HOST,UNAME,PASSWD,DBNAME);
					if($group == 0)
						$row = del_group($gid,$db);
					else if($group == 1)
						$row = del_news($nid,$db);
					if($row > 0)
						$footer = "ข้อมูลถูกลบเรียบร้อยแล้ว";
					else
						$footer = errmesg(mysql_error());
				}
				break;
			case 'edit':
				if(!empty($listid)){
					setid($listid);
					$content = "news_list";
				}
				break;
			case 'update':
				if($group == 0)
					setid($listid);
				else if($group == 1)
					setid($nid);
				if(isset($submit)){
					if($group == 0)
						$query = "update newsgroup set gname='$gname',description='$describe' where gid='$listid'";
					else if($group == 1){
						if($image_size != 0){
							if(ereg("image/jpeg|image/pjpeg",$image_type)){
								$query = "select image from news where nid='$nid'";
								$file = action("get_result",$query);
								if(empty($file))
									$file = "../image/".time().".jpg";
								move_uploaded_file($image,$file);
								$row = 1;
							}
							else
								$footer = errmesg("ไฟล์รูปภาพที่อัพโหลดไม่ใช่ไฟล์ jpeg");
						}
						$date = date("j-M-Y H:i:s");
						if (!empty($listid)) clearflag($listid);
						$query = "update news set headline='$headline',content='$story',image='$file',modified='$date',latest='1' where nid='$nid'";
					}
					$row = action("affected_row",$query);
					if($row > 0)
						$footer = "ข้อมูลถูกปรับปรุงเรียบร้อยแล้ว";
					else if($row == 0)
						$footer = "ข้อมูลไม่ถูกปรับปรุงแต่อย่างใด";
					else
						$footer = errmesg(mysql_error());
				}
				break;
			case 'logout':
				session_unregister("authuser");
				session_destroy();
				header("Location: news.php");
				exit;
				break;
			default:
				$title = "ข่าวประชาสัมพันธ์โรงพยาบาลเกกี 2";
				$content = "&nbsp;";
				break;
		}
		showheader(gettitle());
		topmenu(hori_menu($hmenu,"#FFCCCC"));
		sidemenu(vert_menu($vmenu));
		showcontent($content);
		showfooter($footer);
	}
	else
			header("Location: news.php");
?>