<?php

//---------------------------------------------- insert_person ---------------------------------------------------------------------

function insert_person($DoctorID,$DoctorName,$Address,$CatID,$Picture,$MobilePhone,$Phone,$Email)
{
$con=connect_db("hospital");
if(!$con)
	{
		return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
		exit;
	}
$sql = "select * from tbldoctor where DoctorID='$DoctorID'";
$result = mysql_query($sql);
if(!$result)
	return "กรุณาตรวจคิวรี อีกครั้ง <br>";
if(mysql_num_rows($result)>0)
	return "ชื่อของผู้ใช้ซ้ำกับในฐานข้อมูล <br>";
$result = mysql_query("insert into tbldoctor values ('$DoctorID','$DoctorName','$Address','$CatID','$Picture','$MobilePhone','$Phone','$Email')");
if(!$result)
	return("ไม่สามารถเพิ่มบุคลากรใหม่ได้");
else
	return true;
}

//---------------------------------------------- delete_person ---------------------------------------------------------------------

function delete_person($DoctorID)
{
$con=connect_db("hospital");
if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$result = mysql_query("delete from tbldoctor where DoctorID='$DoctorID'");
if(!$result)
	return("ไม่สามารถลบรายการหนังสือได้");
else
	return true;
}

//---------------------------------------------- edit_person ---------------------------------------------------------------------

function edit_person($oldDoctorID,$DoctorID,$DoctorName,$Address,$CatID,$Picture,$MobilePhone,$Phone,$Email)
{
$con=connect_db("hospital");

if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$sql="update tbldoctor set DoctorID='$DoctorID' ,DoctorName='$DoctorName',Address='$Address', CatID='$CatID' , Picture='$Picture' ,MobilePhone='$MobilePhone',Phone='$Phone',Email='$Email' where DoctorID='$oldDoctorID' ";
$result = mysql_query($sql);
if(!$result)
	return("ไม่สามารถเพิ่มรายการหนังสือได้");
else
	return true;
}

//---------------------------------------------- insert_cat ---------------------------------------------------------------------

function insert_cat($CatName)
{
$con=connect_db("hospital");
if(!$con)
	{
		return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
		exit;
	}
$result = mysql_query("insert into categories(CatName) values ('$CatName')");
if(!$result)
	return("ไม่สามารถเพิ่มรายการหมวดหมู่ได้");
else
	return true;
}

//---------------------------------------------- edit_cat ---------------------------------------------------------------------


function edit_cat($CatID,$CatName)
{
$con=connect_db("hospital");

if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$sql="update categories set  CatName='$CatName' where CatID = $CatID ";
$result = mysql_query($sql);
if(!$result)
	return("ไม่สามารถเพิ่มหมวดหมู่ความเชี่ยวชาญได้");
else
	return true;
}

//---------------------------------------------- delete_cat ---------------------------------------------------------------------

function delete_cat($CatID)
{
$con=connect_db("hospital");
if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$result = mysql_query("delete from categories where CatID='$CatID'");
if(!$result)
	return("ไม่สามารถลบรายการหมวดหมู่ได้");
else
	return true;
}

//---------------------------------------------- db_to_array ---------------------------------------------------------------------

function db_to_array($result)
{
	$result_array=array();
	for($count=0;$row=@mysql_fetch_array($result);$count++)
		$result_array[$count]=$row;
	return $result_array;
}

//---------------------------------------------- get_person_details ---------------------------------------------------------------------

function get_person_details($DoctorID)
{
  if (!$DoctorID || $DoctorID=="")
     return false;
$con=connect_db("hospital");
   $query = "select * from tbldoctor where DoctorID='$DoctorID'";
   $result = mysql_query($query);
   if (!$result)
     return false;
   $result = mysql_fetch_array($result);
   return $result;
}

//---------------------------------------------- register ---------------------------------------------------------------------

function register($USERNAME,$PASSWORD,$ANSWER,$EMAIL)
{
$con=connect_db("hospital");
if(!$con)
	return "ไม่สามารถติดต่อกับฐานข้อมูลได้ กรุณาพยายามอีกครั้ง";
$sql = "select * from user_profile where USER_NAME='$USERNAME' ";
$result = mysql_query($sql);
if(!$result)
	return "กรุณาตรวจคิวรี อีกครั้ง <br>";
if(mysql_num_rows($result)>0)
	return "ชื่อของผู้ใช้ซ้ำกับในฐานข้อมูล <br>";
$result = mysql_query("insert into user_profile values ('$USERNAME','$PASSWORD','$ANSWER','$EMAIL')");
if(!$result)
	return("ไม่สามารถลงทะเบียนได้");
else
   return true;
}

//---------------------------------------------- show_data ---------------------------------------------------------------------

function show_data($tablename)
{
$conn = connect_db("hospital");
if(!$conn)
echo "เกิดความผิดพลาดไม่สามารถติดต่อกับฐานข้อมูลได้";
$sql = "select * from $tablename";
$result = mysql_query($sql);
if(!$result)
	return 0;
else
 return $result;
}

//---------------------------------------------- head_html ---------------------------------------------------------------------

	function head_html($title) {
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> <?php print $title ?> </title>
<META http-equiv=Content-Type content="text/html; charset=windows-874">
</head>

<body>
<?php
	}
	
//---------------------------------------------- end_head_html ---------------------------------------------------------------------

	function end_head_html() {
?>
</body>
</html>
<?php
	}
	
//---------------------------------------------- end_head_html ---------------------------------------------------------------------
	function list_box_date() {
		$month = array(1=>"มกราคม",2=>"กุมภาพันธ์",3=>"มีนาคม",4=>"เมษายน",5=>"พฤษภาคม",6=>"มิถุนายน",7=>"กรกฏาคม",8=>"สิงหาคม",9=>"กันยายน",10=>"ตุลาคม",11=>"พฤศจิกายน",12=>"ธันวาคม",);
		print "<select name='day'>";
		for($i=1;$i<32;$i++)
        	print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
        print "</select>";
		print "/";
		print "<select name='month'>";
		for($i=1;$i<13;$i++)
        	print"     <option value='" . ($i) . "'>". $month[$i] . "</option>\n";
        print "</select>";
		print "/";
		print "<select name='dyear'>";
		for($i=2547;$i<2568;$i++)
        	print"     <option value='" . ($i) . "'>". ($i) . "</option>\n";
      print "</select>";
	}

//---------------------------------------------- message_box ---------------------------------------------------------------------
	function message_box($title,$str_body,$cont) {
?>
	
		<table width="50%" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td>
					 <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#FFAE88" bordercolor="#EC4D00">
                   <tr>
                       <td><font face = "MS Sans Serif" color="#000000" size="2">&nbsp;<? print $title; ?></font></td>
                   </tr>
                </table>
				</td>
			</tr>
			<tr>
				<td>					
					<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#F3F3F3">
						<tr>
							<td  align="center"><font face = "MS Sans Serif" color="#000000" size="2"><? print $str_body; ?></font></td>
						</tr>
						<tr>
							<td  align="center"><font face = "MS Sans Serif" color="#000000" size="2"><? print "<a href='".$cont."'>"; ?>กลับหน้าเดิม</a></font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

<?php
	}
	
	//---------------------------------------------- login ---------------------------------------------------------------------

	function login($user,$pass) {
		$str = "select * from user_profile where user_name = '$user' and password = '$pass'";				
		$ret = database_query($str);
		$row = mysql_fetch_array($ret);
		if(mysql_num_rows($ret) != 0) {
			session_register("login");
			if($row["STATUS"] == '0')
				session_register("status");
			else if($row["STATUS"] == '1')
				session_register("office");
			else if($row["STATUS"] == '2')
				session_register("normal");
		}
		else {
			message_box("","User name หรือ Password ผิด ไม่สามารถล็อกอินได้","javascript:history.back()");
			exit;
		}
	}
	
	
	
	//---------------------------------------------- check_session ---------------------------------------------------------------------
	function check_session() {	
		session_start();	
		if (!session_is_registered("login")) {
			message_box("","คุณยังไม่ได้ล๊อกอินเข้าระบบ","index.php");
			exit;
		}
	}
	
	
	
	//---------------------------------------------- check_permit ---------------------------------------------------------------------
	function check_permit() {
		session_start();	
		if (!session_is_registered("status")) {
			message_box("","คุณไม่มีสิทธิ์ในการใช้งานส่วนนี้","javascript:history.back()");
			exit;
		}
	}

	//---------------------------------------------- check_office ---------------------------------------------------------------------
	function check_office() {
		session_start();	
		if (!session_is_registered("office")) {
			message_box("","คุณไม่มีสิทธิ์ในการใช้งานส่วนนี้","javascript:history.back()");
			exit;
		}
	}

	//---------------------------------------------- check_normal ---------------------------------------------------------------------
	function check_normal() {
		session_start();	
		if (!session_is_registered("normal")) {
			message_box("","คุณไม่มีสิทธิ์ในการใช้งานส่วนนี้","javascript:history.back()");
			exit;
		}
	}

	//---------------------------------------------- select_cat ---------------------------------------------------------------------

function select_cat($key)
{
$conn=connect_db("hospital");
if(!$conn)
	echo "เกิดความผิดพลาดไม่สามารถติดต่อกับฐานข้อมูลได้";
$sql="select * from categories where CatID='$key' ";
$result = mysql_query($sql);
if(!$result)
	return 0;
else 
	return $result;
}

function select_book($DoctorID)
{
$conn=connect_db("hospital");
if(!$conn)
	echo "เกิดความผิดพลาดไม่สามารถติดต่อกับฐานข้อมูลได้";
$sql="select * from tbldoctor where DoctorID='$DoctorID' ";
$result = mysql_query($sql);
if(!$result)
	return 0;
else 
	return $result;
}
?>




