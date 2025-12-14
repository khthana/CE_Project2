<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<title>Register Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</HEAD>
<link rel="stylesheet" type="text/css" href="style.css">	
<BODY BGCOLOR="#FFFFFF">
<?
	require("config.inc.php");
	$username = trim(htmlspecialchars($username));
	$password = trim(htmlspecialchars($password));
	$repassword = trim(htmlspecialchars($repassword));
	$email = trim(htmlspecialchars($email));
	$icq = trim(htmlspecialchars($icq));
	$homepage = trim(htmlspecialchars($homepage));
	$fullname = trim(htmlspecialchars($fullname));
	$nickname = trim(htmlspecialchars($nickname));
	$faculty = trim(htmlspecialchars($faculty));
	$department = trim(htmlspecialchars($department));
	$branch = trim(htmlspecialchars($branch));
	$year = trim(htmlspecialchars($year));
	$class = trim(htmlspecialchars($class));
	$id = trim(htmlspecialchars($id));
	$tel = trim(htmlspecialchars($tel));
	$pager = trim(htmlspecialchars($pager));
	$addr = trim(htmlspecialchars($addr));
     $date=date("d/m/y");

//ใส่ -  ให้กับตัวแปรที่ไม่มีค่า
 if(strlen($icq)==0){$icq='-';}
if(strlen($homepage)==0){$homepage='-';}
if(strlen($fullname)==0){$fullname='-';}
if(strlen($nickname)==0){$nickname='-';}
if(strlen($tel)==0){$tel='-';}
if(strlen($pager)==0){$pager='-';}
if(strlen($addr)==0){$addr='-';}
if(strlen($faculty)==0){$faculty='-';}
if(strlen($id)==0){$id='-';}
if(strlen($department)==0){$department='-';}
if(strlen($branch)==0){$branch='-';}
if(strlen($year)==0){$year='-';}
if(strlen($class)==0){$class='-';}

	// ตรวจสอบว่ารหัสผ่านตรงกันหรือไม่
	$n_pw = strlen($password);
	if($password!=$repassword || $n_pw<4) {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>รหัสผ่านไม่ตรงกัน</b></font><br><br>";
		echo "หรือน้อยกว่า 4 หลัก กรุณาตรวจสอบให้ถูกต้องด้วยครับ : )";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	}


	if($action!="edit") {
	// ตรวจสอบว่า user ที่รับมาเคยลงทะเบียนไปหรือยัง
	mysql_connect($host,$user,$passwd);
	$sql = "select username from member where username='$username'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	// ถ้าเคยลงทะเบียนแล้ว ให้แจ้งข้อผิดพลาด
	if($NRow!=0) {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>Username [$username] ได้ถูกใช้ไปแล้ว</b></font><br><br>";
		echo "กรุณาเปลี่ยน Username ด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	}
	mysql_close(); 
	}

	// บันทึกข้อมูลลงฐานข้อมูล
	mysql_connect($host,$user,$passwd);
	if($action=="edit") {

		$sql = "update member set password='$password' , email='$email' ,icq='$icq' , homepage='$homepage' , fullname='$fullname' ,nickname='$nickname',faculty='$faculty',department='$department',branch='$branch',year='$year',class='$class',id='$id',tel='$tel',pager='$pager',addr='$addr' where username='$username'";
	}
	else {
		$sql = "insert into member (username,password,email,icq,homepage,fullname,nickname,faculty,department,branch,year,class,id,tel,pager,addr,date_mem) values ('$username','$password','$email','$icq','$homepage','$fullname','$nickname','$faculty','$department','$branch','$year','$class','$id','$tel','$pager','$addr','$date')";
	}
	$result = mysql_db_query($dbname,$sql);

	if($result==0) {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>มีข้อผิดพลาดที่ระบบ</b></font><br><br>";
		echo "กรุณาแจ้ง admin ให้ตรวจสอบด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	}
	mysql_close(); 

	if($action=="edit") {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "<font size=3 color=red><b>ได้แก้ไขข้อมูลของ $username </b></font><br><br>";
		echo "และบันทึกลงในฐานข้อมูลแล้ว";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "<font size=2 face='MS Sans Serif'><a href='main.php'>หน้าแรก</a><br>";
	}
	else {
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "<font size=3 color=red><b>ได้เพิ่มข้อมูลของ $username </b></font><br><br>";
		echo "ลงในฐานข้อมูลแล้ว";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'><a href='main.php'>หน้าแรก</a><br>";
		
		
	}
?>
<table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF">Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
</BODY>
</HTML>
