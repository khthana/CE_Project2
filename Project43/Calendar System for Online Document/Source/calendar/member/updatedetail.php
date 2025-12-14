<?php
include('checkauth.inc');
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$new_email=trim($new_email);
$new_fname=trim($new_fname);
$new_lname=trim($new_lname);
$new_nickname=trim($new_nickname);


session_register("old_fname");
$old_fname=$new_fname;

session_register("old_lname");
$old_lname=$new_lname;

session_register("old_nickname");
$old_nickname=$new_nickname;

session_register("old_address");
$old_address=$new_address;

session_register("old_zipcode");
$old_zipcode=$new_zipcode;

session_register("old_bdate");
$old_bdate=$new_bdate;

session_register("old_bmonth");
$old_bmonth=$new_bmonth;

session_register("old_byear");
$old_byear=$new_byear;

session_register("old_email");
$old_email=$new_email;

session_register("old_icq");
$old_icq=$new_icq;

session_register("old_tel");
$old_tel=$new_tel;

session_register("old_gender");
$old_gender=$new_gender;

session_register("old_pager");
$old_pager=$new_pager;

session_register("old_occupation");
$old_occupation=$new_occupation;

session_register("old_income");
$old_income=$new_income;

session_register("old_showstatus");
$old_showstatus=$new_showstatus;

session_register("lastpage");
$lastpage='updatedetail';


$sql1="select  mem_fname,mem_lname,mem_nickname,mem_email ,mem_birthday from member where mem_id=$user_id";
$result1=mysql_db_query($db,$sql1);
$data1=mysql_fetch_array($result1);
$accept=1;
session_register("err_msg");
$index=strpos($new_email,'@');
$indexpoint=strpos($new_email,'.');
if(($index===false)||($index==0)||($indexpoint==(strlen($new_email)-1)) ||($indexpoint===false)||($index==($indexpoint-1)))
{
$err_msg="ชื่ออีเมล์ไม่ถูกต้อง";
$accept=0;
}

if($new_fname==''){$err_msg=$err_msg."ชื่อไม่ถูกต้อง<br>";$accept=0;}
if($new_lname==''){$err_msg=$err_msg."นามสกุลไม่ถูกต้อง<br>";$accept=0;}
if($new_nickname==''){$err_msg=$err_msg."ชื่อเล่นไม่ถูกต้อง<br>";$accept=0;}
if(!checkdate($new_bmonth,$new_bdate,$new_byear))
{
$err_msg=$err_msg."วันเกิดไม่ถูกต้อง";
$accept=0;
}

if($accept==0){header("Location:./editdetail.php");}
else
{
if($new_occupation=="0"){$occupation="";	}
$new_birthday=$new_byear."-".$new_bmonth."-".$new_bdate;
if ($new_showstatus<>'Y'){$new_showstatus='N';}
$sql="update member set mem_fname='".$new_fname."',mem_lname='".$new_lname
."',mem_nickname='".$new_nickname."',mem_address='".$new_address."',mem_zipcode='".$new_zipcode."',mem_birthday='".$new_birthday
."',mem_email='".$new_email."',mem_icq='".$new_icq."',mem_tel='".$new_tel."',mem_gender='".$new_gender
."',mem_pager='".$new_pager."',mem_occupation='".$new_occupation."',mem_income='".$new_income
."',mem_show_status='".$new_showstatus."' where mem_id=".$user_id;
$link=mysql_connect($host,$user,$pass)or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$result=mysql_db_query($db,$sql);
mysql_close($link);
$lastpage='';
$old_fname='';
$old_lname='';
$old_nickname='';
$old_address='';
$old_zipcode='';
$old_bdate='';
$old_bmonth='';
$old_byear='';
$old_email='';
$old_icq='';
$old_tel='';
$old_gender='';
$old_pager='';
$old_occupation='';
$old_income='';
$old_showstatus='';
session_unregister("err_msg");
session_unregister("lastpage");
session_unregister("old_fname");
session_unregister("old_lname");
session_unregister("old_nickname");
session_unregister("old_address");
session_unregister("old_zipcode");
session_unregister("old_bdate");
session_unregister("old_bmonth");
session_unregister("old_byear");
session_unregister("old_email");
session_unregister("old_icq");
session_unregister("old_tel");
session_unregister("old_gender");
session_unregister("old_pager");
session_unregister("old_occupation");
session_unregister("old_income");
session_unregister("old_showstatus");
     header("Location:./edit_profile.html");
}
?>