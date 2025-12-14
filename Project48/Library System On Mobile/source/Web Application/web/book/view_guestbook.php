<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

if(isset($Session[@login_name]))
	@$login_name=$Session[login_name];	


@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c";

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
	
	$sql = "select * from guestbook where g_id = '$g_id'";
	$db_query = mysql_db_query ($dbname, $sql);
	
	$nums_rows = mysql_num_rows($db_query);
		
	if ($nums_rows < 1 )
		{
			echo ("<font color=\"red\">ไม่มีข้อมูลแสดง1</font>");
			exit;
		}	// จบ if


	for ($i=0;$i<$nums_rows;$i++)	// เริ่มรับข้อมูลจากฟิลด์ต่าง ๆ ในตาราง question1
		{
			$result = mysql_fetch_array($db_query);
							@$g_id = $result[g_id];
							@$topic = $result[g_topic];
							@$detail = $result[g_detail];
							@$datetime= $result[g_datetime];
							@$ip = $result[g_ip];
						
		}

	
	
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>:: ระบบห้องสมุดบนมือถือ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

<table width="980" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="90" height="20" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td width="90">&nbsp;</td>
        </tr>
      </table></td>
    <td width="800" rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td width="800" height="95" valign="top"><div align="right"><img src="picture/head1.gif" width="635" height="95"></div></td>
        </tr>
      </table></td>
    <td width="90" rowspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td width="90" height="529" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="75"></td>
  </tr>
  <tr> 
    <td height="434"></td>
    <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td height="39" colspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="800" height="2"></td>
              </tr>
              <tr> 
                <td height="33" valign="top"><table width="100%" border="2" bordercolor="#000000" bgcolor="#000000">
                    <!--DWLayoutTable-->
                    <tr bordercolor="#000000" bgcolor="#CCCCCC"> 
                      <td height="29" bordercolor="#CCCCCC"><div align="center">[ 
                          หน้าแรก ]</div></td>
                      <td bordercolor="#CCCCCC"><div align="center">[ เมนูหนึ่ง 
                          ]</div></td>
                      <td bordercolor="#CCCCCC"><div align="center">[ เมนูสอง 
                          ]</div></td>
                      <td bordercolor="#CCCCCC"><div align="center">[ เมนูสาม 
                          ]</div></td>
                      <td bordercolor="#CCCCCC"><div align="center">[ <a href="login.htm">ผู้ดูแลระบบ</a> 
                          ]</div></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="20" colspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="800" height="20"><div align="right"> 
                    <DIV align=right><!-- <b>วันนี้วันที่:</b> --> 
  <?  

//@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
//	$a = date("j");	 // วันที่
//	$b = strftime("%B");	 // เดือนเต็ม
//	$c = strftime("%Y")+543;	 // ปี พ.ศ.
//	$d = date("H:i:s");	 // เวลา

//$a_date = "$a $b $c";
	//echo"$a_date";

?>
                      <!-- <b>เวลา:</b><?echo"$d";?><b>น.</b> --></DIV>
                  </div></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="216" height="376" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="216" height="364">&nbsp;</td>
              </tr>
            </table></td>
          <td width="383" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="383" height="376" valign="top"><p>&nbsp;</p>
                  <table width="100%" border="1" bordercolor="#666666">
                    <tr bgcolor="#CCCCCC"> 
                      <td height="30" colspan="2"><div align="center">ลำดับการนำเสนอที่ <? echo "$g_id"; ?>
                        </div></td>
                    </tr>
                    <tr> 
                      <td width="30%">หัวข้อนำเสนอแนะ</td>
                      <td width="70%"><? echo " $topic ";?></td>
                    </tr>
                    <tr> 
                      <td>รายละเอียด</td>
                      <td><? echo "$detail "; ?>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p></td>
                    </tr>
                    <tr> 
                      <td>วันที่และเวลา</td>
                      <td><? echo "$datetime"; ?></td>
                    </tr>
                    <tr> 
                      <td>IP address</td>
                      <td><? echo "$ip";?></td>
                    </tr>
                  </table>
                  &nbsp;</td>
              </tr>
            </table></td>
          <td width="201" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="201" height="376">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="4"></td>
          <td></td>
          <td></td>
        </tr>
        <tr> 
          <td height="30" colspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="800" height="30" valign="top"><table width="100%" border="0">
                    <tr> 
                      <td bgcolor="#CCCCCC">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="35"></td>
    <td></td>
  </tr>
</table>
</body>
</html>
