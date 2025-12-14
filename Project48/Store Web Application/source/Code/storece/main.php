<?php
session_start();

/* ลงทะเบียนตัวแปรเซสซั่น  */

if (!session_is_registered("DBName")) {
  session_register("DBName");
  $_SESSION['DBName'] = "store";
}
if (!session_is_registered("DBUser")) {
  session_register("DBUser");
  $_SESSION['DBUser'] = "root";
}
if (!session_is_registered("DBPwd")) {
  session_register("DBPwd");
  $_SESSION['DBPwd'] = "";
}

if (!session_is_registered("User")) session_register("User");
if (!session_is_registered("Password")) session_register("Password");

if (!session_is_registered("Status")) {
  session_register("Status");
  $_SESSION['Status'] = "offline";  /* กำหนดสถานะเริ่มต้นเป็น Offline */ 
}

/*  if (!session_is_registered("User")) session_register("User"); */
if (!session_is_registered("Name")) session_register("Name");
if (!session_is_registered("Sname")) session_register("Sname");
/* เคยใส่ค่า Address ไว้ */
if (!session_is_registered("UserValid")) session_register("UserValid");
if (!session_is_registered("PwdValid")) session_register("PwdValid");

// หากผู้ใช้ยังไม่ได้ทำการ Login ให้กำหนดเป็น Guest

if (!session_is_registered("Level")) {
  session_register("Level");
  $_SESSION['Level'] = "Guest";
}

// กำหนดไม่ให้แสดงเมนู ผู้บริหารระบบ
if (!session_is_registered("ShowManage")) {
  session_register("ShowManage");
  $_SESSION['ShowManage'] = false;
}

$_SESSION['UserValid'] = "valid";
$_SESSION['PwdValid'] = "valid";

$link = @mysql_pconnect("localhost",
											$_SESSION['DBName'],
											$_SESSION['DBPwd']);
/*  mysql_select_db($_SESSION['DBName'], $link); */

//หากผู้ใช้ LogIN ให้กำหนดค่าให้กับตัวแปรเซสซั่นต่างๆ ตามที่บันทึกไว้ในเทเบิล UserProfile
$md5Password=md5($Password);

if (isset($_POST['btLogIN'])) {
$userresult = mysql_query(
						"SELECT * FROM userprofile".
						" WHERE User='".$_POST['User'].
						"' AND Password='".$_POST['$md5Password'].
						"' AND Status<>'D' ");

  if ($userrow=mysql_fetch_array($userresult)) {
    $_SESSION['ID'] = $userrow["ID"];
    $_SESSION['User'] = $userrow["User"];
    $_SESSION['Name'] = isset($userrow["Name"])?$userrow["Name"]:"";
    $_SESSION['Sname'] = isset($userrow["Sname"])?$userrow["Sname"]:"";

    $_SESSION['Level'] = isset($userrow["Level"])?$userrow["Level"]:"";
    $_SESSION['Status'] = "online";
  }
}

if (isset($_GET['btLogOut'])) {
  mysql_query("UPDATE userprofile SET".
  " Status='I' WHERE User=".$_SESSION['User']) or die ("Update userprofile query failed.");
  unset($_SESSION['ID']);
  unset($_SESSION['Email']);
  unset($_SESSION['Name']);
  unset($_SESSION['Sname']);

  $_SESSION['Level'] = "user";
  $_SESSION['Status'] = "offline";
  $_SESSION['ShowManage'] = false;
}

if (isset($_GET['btswitch_manage'])) {
  $_SESSION['ShowManage'] = !$_SESSION['ShowManage'];
}
?>