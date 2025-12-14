<!-- หน้านี้ใช้ลบกระทู้-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>==>ลบกระทู้</title>
<meta content="text/html; charset=windows-874" http-equiv=Content-Type>
<link href="script/style.css" rel=stylesheet type=text/css>
</head>
<body   bgcolor="#F8C4AC">
<table width="90%" height="90%" border="0" align="center" bgcolor="#FFFFFF">
  <tr> 
    <td height="22" valign="top" bgcolor="#F8C4AC"> <div align="center"><a href="webboard.php">Webboard</a></div></td>
  </tr>
  <tr>
    <td valign="top">
      <?php
                              //กำหนดตัวแปรเพื่อนำไปใช้งาน
	        		 $hostname = "localhost";   // ชื่อโฮสต์
               		         $username = "root";         // ชื่อผู้ใช้
	        	  	 $password = "12345678";         // รหัสผ่าน
	        		 $dbname = "xss";	 // ชื่อฐานข้อมูล
	        		 $tblname = "question";	//ชื่อตาราง
                                 $adminpass = "admin";

                             // เริ่มติดต่อฐานข้อมูล
                             mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

                            // เลือกฐานข้อมูล
                            mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

                            if (1)//---------------------------------------
	                          {
		                        $sql = "select * from $tblname order by q_id desc";
		                        $db_query = mysql_db_query($dbname, $sql);
		                        if (!$db_query)
		                            {
			                            echo("<b><font size=3>เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ </b></font>" . mysql_error() );
			                            exit;
		                            }
		                       else
		                           {
			  			$nums_rows = mysql_num_rows($db_query);	 // จำนวนเรกคอร์ดของกระทู้ทั้งหมด
			  			echo "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  			<B>ถ้าต้องการลบกระทู้ให้คลิกที่ <Font color=red>Delete</Font> ด้านหน้ากระทู้</B><Hr dir=ltr>";

			 			// เริ่มวนรอบแสดงข้อมูล
						echo "<ul dir=ltr>\n";

			                       for ($i=0;$i<$nums_rows;$i++)	// อ่านข้อมูลแต่ละเรกคอร์ด
			                            {
                                                            $count = $i+1;
			                                    $result = mysql_fetch_array($db_query);
			                                    $q_id = $result[q_id];
			                                    $q_topic = $result[q_topic];
			                                    $q_name = $result[q_name];
			                                    $q_email = $result[q_email];
			                                    $q_ip = $result[q_ip];
			                                    $q_date = $result[q_datetime];

			                                    $sql1 = "select * from answer where a_qid = '$q_id'";
			                                    $db_query1 = mysql_db_query ($dbname, $sql1);
		                                        $num_rows1 = mysql_num_rows($db_query1);	// จำนวนเรกคอร์ดของผู้ที่ตอบกระทู้

			             	                    echo "<a href=\"finish.php?q_id=$q_id\">Delete</a>&nbsp &nbsp<img src=\"../../images\question.gif\" width=10 height=11> $count  $q_topic <font color=red> $q_name </font> [$num_rows1] - ($q_date)<br>\n";
			                            }	// จบ for
		                                echo "</ul>\n";

		                           }              // ปิดการติดต่อฐานข้อมูล mysql_close();
	                          }
                              else	 // ในกรณีรหัสผ่านไม่ถูกต้อง
	                         {
	                                	echo "<center><font size=3><b>รหัสผ่านไม่ถูกต้อง</b></font></center>";
	                         }
        ?>
    </td>
  </tr>
</table>
</body></html>