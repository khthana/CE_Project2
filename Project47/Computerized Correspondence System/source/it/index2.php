<?
require("config.php");

	if($data==NULL)
	{ 
			$data=home;
			$name=NULL;
	} 
 					//session
					session_start();
				  	session_register("$username");
					if($uname!=NULL)
							$username="$uname";
					else
							$username=$username;

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title><?=$title?></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 00px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-family: Tahoma, Verdana, Arial;
	font-size: 12px;
	font-weight: bold;
	color: #FFFFFF;
}
.style26 {color: #000000}
-->
</style>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="778"><img src="images/pic_r1_c1.jpg" width="778" height="126"></td>
    <td background="images/bgline.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="778"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="195" valign="top" background="images/bg1.jpg"><table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top">&nbsp;<span class="style1">ยินดีต้อนรับ,
              <?
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from users where USER_NAME='$username'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
		 		$result = mysql_fetch_array($dbquery);
				$re_YOS   = $result[YOS];
				$re_NAME  =$result[USER_NAME];
				$re_SERNAME  =$result[SERNAME];
				echo "$re_YOS $re_NAME $re_SERNAME";
	 ?>
            </span>&nbsp;</td>
          </tr>
          <tr>
            <td valign="top">&nbsp;</td>
          </tr>
        </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td>
                <table width="100%"  border="0" cellspacing="0" cellpadding="3">
                  <tr bgcolor="#990000">
                    <td width="100%">&nbsp;<img src="images/icon2/f1_2.gif" width="16" height="16" align="absmiddle">&nbsp;<span class="style1">ระบบจัดการ</span></td>
                    </tr>
                  <tr>
                    <td><table width="100%"  border="0" cellspacing="0" cellpadding="3">
                      <tr>
                        <td width="15%" align="center"><img src="images/icon2/ico517.gif" width="16" height="16"></td>
                        <td width="85%" class="style1"><a href="index2.php?data=home&username=<?=$username;?>&pwd=<?=$pwd;?>">หน้าแรก</a></td>
                      </tr>
                      <tr>
                        <td align="center"><img src="images/icon2/ico492.gif" width="16" height="16"></td>
                        <td class="style1"><a href="index.php?data=logout&username=<?=$username;?>">ออกจากระบบ</a></td>
                      </tr>
                      <tr>
                        <td align="center"><img src="images/icon2/ico509.gif" width="16" height="13"></td>
                        <td class="style1"><a href="index2.php?data=getpwd&username=<?=$username;?>&pwd=<?=$pwd;?>">แก้ไขรหัสผ่าน</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td align="right"><hr></td>
                    </tr>
                </table>
                <br>
                <table width="100%"  border="0" cellspacing="0" cellpadding="3">
                  <tr bgcolor="#990000">
                    <td width="100%">&nbsp;<img src="images/icon2/145.gif" width="15" height="15" align="absmiddle">&nbsp;<span class="style1">เมนู</span></td>
                  </tr>
                  <tr>
                    <td><table width="100%"  border="0" cellspacing="0" cellpadding="3">
 <?		
		  		require("config.php");
				$tbname = "users";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "SELECT POSITION FROM users WHERE USER_NAME = '$username' AND  PASSWORD = '$pwd' ";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				$result = mysql_fetch_array($dbquery);
				$position   = $result[POSITION];
				switch($position)
				{
					case 'secretary'  : {	  
 ?>
					    <tr>
                          <td width="15%" align="center"><img src="images/icon2/ico416.gif" width="16" height="21"></td>
                          <td width="85%" class="style1"><a href="index2.php?data=accept&username=<?=$username;?>&pwd=<?=$pwd;?>">หนังสือรออนุมัติ</a></td>
                        </tr>
                        <tr>
                          <td align="center"><img src="images/icon2/ico051.gif" width="13" height="19"></td>
                          <td class="style1"><a href="index2.php?data=add_user&username=<?=$username;?>&pwd=<?=$pwd;?>">เพิ่มผู้ใช้งานระบบ</a></td>
                        </tr>
                        <tr>
                          <td align="center"><img src="images/icon2/ico215.gif" width="16" height="16"></td>
                          <td class="style1"><a href="index2.php?data=delete_user&username=<?=$username;?>&pwd=<?=$pwd;?>">ลบผู้ใช้งานระบบ</a></td>
                        </tr>
                        <tr>
                          <td align="center"><img src="images/icon2/ico418.gif" width="16" height="16"></td>
                          <td class="style1"><a href="index2.php?data=form_insert&username=<?=$username;?>&pwd=<?=$pwd;?>">ลงทะเบียนหนังสือเข้า</a></td>
                        </tr>
                        <tr>
                          <td align="center"><img src="images/icon2/ico419.gif" width="16" height="16"></td>
                          <td class="style1"><a href="index2.php?data=form_insert_book_sent&username=<?=$username;?>&pwd=<?=$pwd;?>">ลงทะเบียนหนังสือออก</a></td>
                        </tr>
               
					    <tr>
                          <td align="center"><img src="images/icon2/ico549.gif" width="16" height="16"></td>
                          <td class="style1"><a href="index2.php?data=edit_book&username=<?=$username;?>&pwd=<?=$pwd;?>">แก้ไขข้อมูลหนังสือ</a></td>
                        </tr>
 <?
					}break;
					 case 'user' :{		
?>   
                        <tr>
                          <td align="center"><img src="images/icon2/ico531.gif" width="16" height="14"></td>
                          <td class="style1"><a href="index2.php?data=user&username=<?=$username;?>&pwd=<?=$pwd;?>">รายละเอียดหนังสือ</a></td>
                        </tr>
<?
					}break;
					 case 'หัวหน้าภาควิชาวิศวกรรมคอมพิวเตอร์' : {
?>
                        <tr>
                          <td align="center"><img src="images/icon2/ico531.gif" width="16" height="14"></td>
                          <td class="style1"><a href="index2.php?data=head&username=<?=$username;?>&pwd=<?=$pwd;?>">รายละเอียดหนังสือ</a></td>
                        </tr>
						                  <?
				  }break;
					default  : {
						echo "กรุณา login เข้าระบบ";
					}
				}
			?>
                    </table></td>
                  </tr>
                  <tr>
                    <td align="right"><hr></td>
                  </tr>
                </table>
                <br>
                <table width="100%"  border="0" cellspacing="0" cellpadding="3">
                  <tr bgcolor="#990000">
                    <td width="100%">&nbsp;<img src="images/icon2/ico489.gif" width="16" height="15" align="absmiddle">&nbsp;<span class="style1">สร้างหนังสือ</span></td>
                  </tr>
                  <tr>
                    <td><table width="100%"  border="0" cellspacing="0" cellpadding="3">
                        <tr>
                          <td width="15%" align="center"><img src="images/icon2/ico584.gif" width="12" height="16"></td>
                          <td width="85%" class="style1"><a href="index2.php?data=internal_book&username=<?=$username;?>&pwd=<?=$pwd;?>">หนังสือภายใน</a></td>
                        </tr>
                        <tr>
                          <td height="22" align="center"><img src="images/icon2/ico657.gif" width="14" height="16"></td>
                          <td class="style1"><a href="index2.php?data=external_book&username=<?=$username;?>&pwd=<?=$pwd;?>">หนังสือภายนอก</a></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td align="right"><hr></td>
                  </tr>
                </table>
                <br>
                <table width="100%"  border="0" cellspacing="0" cellpadding="3">
                    <tr bgcolor="#990000"> 
                      <td width="100%">&nbsp;<img src="images/icon2/ico420.gif" width="16" height="16" align="absmiddle">&nbsp;<span class="style1">แบบฟอร์ม</span></td>
                    </tr>
                    <tr> 
                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="3">
                          <tr> 
                            <td align="center"><img src="images/icon2/ico416.gif" width="16" height="21"></td>
                            <td class="style1"><a href="index2.php?data=from1&username=<?=$username;?>&pwd=<?=$pwd;?>">ลาป่วย/กิจ/คลอดบุตร</a></td>
                          </tr>
                          <tr> 
                            <td align="center"><img src="images/icon2/ico416.gif" width="16" height="21"></td>
                            <td class="style1"><a href="index2.php?data=from3&username=<?=$username;?>&pwd=<?=$pwd;?>">ลาศึกษา/อบรม/ดูงาน/วิจัย</a></td>
                          </tr>
                          <tr>
                            <td align="center"><img src="images/icon2/ico416.gif" width="16" height="21"></td>
                            <td class="style1"><a href="index2.php?data=from2&username=<?=$username;?>&pwd=<?=$pwd;?>">ลาพักผ่อน</a></td>
                          </tr>
                          <tr> 
                            <td width="15%" align="center"><img src="images/icon2/ico416.gif" width="16" height="21"></td>
                            <td width="85%" class="style1"><a href="index2.php?data=from4&username=<?=$username;?>&pwd=<?=$pwd;?>">ขอใช้รถ</a></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td align="right"><hr></td>
                    </tr>
                  </table>
                <br>
                <table width="100%"  border="0" cellspacing="0" cellpadding="3">
                  <tr bgcolor="#990000">
                    <td width="100%" bgcolor="#990000">&nbsp;<img src="images/icon2/ico420.gif" width="16" height="16" align="absmiddle">&nbsp;<span class="style1">ค้นหาข้อมูล</span></td>
                  </tr>
                  <tr>
                    <td>
<form action="search.php?data=search&username=<?=$username;?>" method="post" name="form3" target="_blank" id="form3" onSubmit="return check()">
                      <table width="100%"  border="0" cellspacing="0" cellpadding="3">
                        <tr>
                          <td width="70%" align="center"><input name="search" type="text" id="search" size="20"></td>
                          <td width="30%" align="center" class="style1"><input name="imageField" type="image" src="images/icon2/ico534.gif" alt="ค้นหาข้อมูล" width="13" height="13" border="0"></td>
                        </tr>
                        <tr>
                          <td class="style1"><img src="images/icon2/ico611.gif" width="16" height="16" align="absmiddle"><a href="advance_search.php?startpage=1&username=<?=$username;?>">ระบุข้อมูลค้นหา</a></td>
                          <td class="style1">&nbsp;
						  

</td>
                        </tr>
                      </table>
                    </form>
<script language="JavaScript">
function check()
{
      var v1 = document.form3.search.value;

        if (v1.length==0)
           {
           alert("กรุณาป้อนข้อมูลที่ต้องการค้นหา");
           document.form3.search.focus();           
           return false;
           }else
           return true;
}
</script></td>
                  </tr>
                  <tr>
                    <td align="right"><hr></td>
                  </tr>
                </table>
                <br>
                <br>
                <br>
                </td>
            </tr>
          </table></td>
        <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10" align="left" valign="top"><? include("$data.php"); ?></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td background="images/bgline.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="778"><img src="images/pic_r3_c1.jpg" width="778" height="40"></td>
    <td background="images/bgline.gif">&nbsp;</td>
  </tr>
</table>
</body>
</html>
