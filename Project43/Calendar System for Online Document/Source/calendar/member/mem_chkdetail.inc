<?
$name=trim($name);
$surname=trim($surname);
$nickname=trim($nickname);
$address=trim($address);
$zipcode=trim($zipcode);
$email=trim($email);
$icq=trim($icq);
$tel=trim($tel);
$pager=trim($pager);
function chk_email($email)
{
	$email=trim($email);
	$long=strlen($email);
	$firstads=strpos($email,"@");
	$lastads=strrpos($email,"@");
	$firstdot=strpos($email,".");
	$lastdot=strrpos($email,".");
	$space=strpos($email," ");
	if($firstads===false||$firstdot===false)
	{ $chk="F"; //ไม่มี @ or .
	}elseif($firstads<>$lastads)
	{
		$chk="F"; //มี@หลายอัน
	}elseif(($long-1)==$lastdot || $firstads==0)
{	 $chk="F"; //@อยู่หน้าสุด or . อยู่หลังสุด
}elseif(($firstads-1)==$firstdot||($firstdot-1)==$firstads)
{
	$chk="F"; //@.ติดกัน
}elseif($space!==false)
{
	 $chk="F";
}else
{
		$chk="T";
	}

	if($chk=="F")
	{ return "F";
	}else
	{ return "T";
}
}  //function

//-------------------------------------------------------------------

if($name=="" || $surname=="" || $nickname=="" || $email=="" || $bddate=="")
{ 
		$num_work="1";
		$num_chk=9;
			$err=3;
}elseif(checkdate($month,$bddate,$year)<>1 and $bddate<>"")
{
		$num_work="1";
		$num_chk=9;
		$err=4;
}elseif( chk_email($email)=="F")
{  
		$num_work="1";
		$num_chk=9;
		$err=5;
}else
{
$host="localhost";

$usersql="magazine";

$password="magazine";

$table="member";

$db="magazine";

$link=mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
//	echo "year=",$year,"  month=",$month," date =",$bddate;
if($occupation=="0")
		{ $occupation="";
		}
if($icq=="0")
{ $icq="";
}
if($status=="yes")
{ $status="Y";
}else
{ $status="N";
}
	if ($bddate<>"")
	{
			$birthday=$year."-".$month."-".$bddate;
	 $sqlinsert="insert into member(mem_username,mem_password,mem_fname, mem_lname
	,mem_nickname,mem_address,mem_zipcode,mem_birthday,mem_email,mem_icq
	,mem_tel,mem_gender,mem_pager,mem_occupation,mem_income,mem_show_status)
	 values('$user','$pass','$name','$surname','$nickname','$address','$zipcode','$birthday','$email','$icq','$tel','$gender','$pager'
,'$occupation','$income','$status')";

	}else
	{
			$birthday="";
	 $sqlinsert="insert into member(mem_username,mem_password,mem_fname, mem_lname
	,mem_nickname,mem_address,mem_zipcode,mem_email,mem_icq
	,mem_tel,mem_gender,mem_pager,mem_occupation,mem_income,mem_show_status)
	 values('$user','$pass','$name','$surname','$nickname','$address','$zipcode','$email','$icq','$tel','$gender','$pager'
,'$occupation','$income','$status')";

	}

   mysql_db_query("magazine",$sqlinsert);
$sql_mem="select mem_id from member where mem_username='$user'";
$result=mysql_db_query("magazine",$sql_mem);
$row=mysql_fetch_array($result);
$mem=$row[0];

// สร้างกลุ่มdefault คือ ทั่วไป ครอบครัว เพื่อน และที่ทำงาน

$group=array("ทั่วไป","ครอบครัว","เพื่อน","ที่ทำงาน");
for($i=0;$i<4;$i++)
{
		$sqlgroup="insert into group_name(grp_id,mem_id,grp_name) values($i,$mem,'$group[$i]')";
		mysql_db_query("magazine",$sqlgroup);
		//echo $sqlgroup;
}
mysql_close();

session_start();

	session_register("user_id");

	session_register("crp_password");
	session_register("user_type");
$user_type="R";
$user_id=$mem;
$crp_password=crypt($pass,"mg");
} //else
?>