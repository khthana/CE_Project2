<!-- หน้านี้แสดงรายละเอียดของกระทู้แต่ละอันพร้อมทังแสดงความคิดเห็น -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>:: Cross-Site Script SandBox :: ร่วมแสดงความคิดเห็น :: สามารถใส่ script ได้ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:##000000;
					   scrollbar-face-color: #F8C4AC;
					   scrollbar-highlight-color: #FFFFFF; 
					   scrollbar-shadow-color: #FFFFFF; 
					   scrollbar-arrow-color: #DE5208;
					   scrollbar-track-color: #FFFFFF; 
					   scrollbar-darkshadow-color: #009900;
        }
.style1 {font-family: "Microsoft Sans Serif", "MS Serif", Tahoma, sans-serif, serif; font-size: 14px; color: #003366; }
a:link {
	color: #FF3333;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #FF3333;
}
a:hover {
	text-decoration: none;
	background-color: #FF8204;
	color: #FFFFFF; 
			 
}
a:active {
	text-decoration: none;
	color: #BAF8C5;
}
</style>
</head>
<body  class="style0">
<?php
	                // สำหรับอ่านข้อมูลกระทู้ต่าง ๆ
	                 $hostname = "localhost";   // ชื่อโฮสต์
	                 $user = "player";         // ชื่อผู้ใช้
	                 $password = "player";         // รหัสผ่าน
	                 $dbname = "xssprotect";	 // ชื่อฐานข้อมูล
	
	                 // เริ่มติดต่อฐานข้อมูล
	                 mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	                // เลือกฐานข้อมูล
	                mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");	
	                $sql = "select * from question where q_id = '$q_id'";
	               $db_query = mysql_db_query ($dbname, $sql);
	
	               if (!$db_query)
		             {
		                      echo ("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้" . mysql_error());
		                      exit;
		             }   // จบ if
	                $nums_rows = mysql_num_rows($db_query);		
	                if ($nums_rows < 1 )
		             {
			              echo ("<font color=\"red\">ไม่มีข้อมูลแสดง</font>");
			              exit;
		              }	// จบ if
	                 for ($i=0;$i<$nums_rows;$i++)	// เริ่มรับข้อมูลจากฟิลด์ต่าง ๆ ในตาราง Question
		                {
			              $result = mysql_fetch_array($db_query);
			              $q_id = $result[q_id];
			              $q_topic = $result[q_topic];
			              $q_message = $result[q_message];
			              $q_name = $result[q_name];
			              $q_email = $result[q_email];
			              $q_icq = $result[q_icq];
			              $q_ip = $result[q_ip];
			              $q_date = $result[q_datetime];
		                 }
	                  $image1 = "image\question.gif";
	                  $image2 = "image\answer.gif";
                 ?>
<font color="#FF0000">ไม่สามารถใส่ Sript ได้ </font> 
<table width="90%" border="0" align="center" >
  <tr> 
    <td colspan="3"><div align="center"> 
        <table width="74%" height="30%"  cellspacing="0" >
          <tr> 
            <td height="20" colspan="3" valign="top" bgcolor="#FFFFFF"> <div align="center"><a href="webboard.php">Webboard</a></div></td>
          </tr>
          <tr bgcolor="#FFCC99">
            <td height="21" colspan="3" valign="top"><div align="center"><font color="blue" size="10"><img src="../../images/answer.gif" width="34" height="34" ></font><font  size="3pt"><b><u><?php echo $q_topic; ?></u></b></font></div></td>
          </tr>
          <tr> 
            <td colspan="3"  class="style0">&nbsp;</td>
          </tr>
          <tr> 
            <td width="10%" height="15">&nbsp; </td>
            <td height="15"> 
              <?php
                            echo "<font color=blue size=2pt >$q_message </font>";  
                         ?>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr> 
            <td height="10" colspan="3"> </td>
          </tr>
          <tr bgcolor="#FFCC99"> 
            <td colspan="3" class="style0"> &nbsp; <strong>โดย 
              : </strong> <font color="#808000"> 
              <?php 
		                        if ($q_email == "")
			                       {	
				                     echo "<font color=#ff0000> $q_name</font> - เมื่อ [$q_date] ip :: $q_ip";
			                       }
		                       else
			                       { 
				                      echo " <a href='mailto:$q_email'>$q_name</a> -  เมื่อ [$q_date] ip :: $q_ip";
			                       }	// จบ if
	                           ?>
              </font> </td>
          </tr>
        </table>
      </div></td>
  </tr>
  <tr> 
    <td width="12%" align="center"> 
      </td>
    <td width="76%" align="center">
      <?php
	         $sql1 = "select * from answer where a_qid = '$q_id'";
	         $db_query1 = mysql_db_query ($dbname, $sql1);

	         if (!$db_query1)
		     {
			     echo ("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้");
			     exit;
		       }	// จบ if
	         $num_rows1 = mysql_num_rows($db_query1);		
	         if ($num_rows1 != 0 )
		      {
			     for ($i=0;$i<$num_rows1;$i++)	// รับค่าข้อมูลจากฟิลด์ต่าง ๆ ในตาราง answer
			           {
				             $result1 = mysql_fetch_array($db_query1);
				             $a_message = $result1[a_message];
				             $a_email = $result1[a_email];
				             $a_name = $result1[a_name];
				             $a_date = $result1[a_datetime];
							 $a_ip = $result1[a_ip];	
?>
		              <table border=0  bordercolor="#FFCC99" width=100%>
                                   <tr>
                                          <td  class="style0" width=100%>
                                                 <table border=0 cellPadding=0 cellSpacing=0 height=46 width=100%>
                                                        <tbody>
                                                           <tr>
                                                                 <td class="style0" width=100%>
                                                                         <table width="99%" border="1"  align="center" cellspacing="0" bordercolor="#FFCC99" class="style0">
                      <tr> 
                        <td bgcolor="#FFCC99" class="style0"> <div align="center"><font color=blue size=3><u> 
                            <img src =../../images/people.gif><?php if ($i==0)echo "ความคิดเห็นล่าสุด";?>
                            </u></font> </div></td>
                      </tr>
                      <tr height=30> 
                        <td bgcolor="#FFEEDD"><font color=#000099> 
                          <?php  echo $a_message ;?>
                          </font></td>
                      </tr>
                      <tr> 
                        <td height="10" bgcolor="#FFCC99"> <strong>โดย : </strong> <font color="#808000"> 
                          <?php if ($a_email == "")
					                                                                      {
						                                                                     echo "<font color=#ff0000> $a_name</font> - เมื่อ [ $a_date] ip :: $a_ip ";
					                                                                       }
				                                                                           else
				                                                                             {
                                        						                               echo " <a href='mailto:$a_email'> $a_name</a> - เมื่อ [$a_date] ip :: $a_ip ";
					                                                                        }	// จบ if ?>
                          </font> </td>
                      </tr>
                    </table>
                									</td>
                								</tr>
                					       </tbody>
                			               </table>
                	                       </td>
                                      </tr>
                               </table>
                              <?php	      }	// จบ for
	              }	// จบ if
              ?>
    </td>
    <td width="12%" align="center">&nbsp; </td>
  </tr>
  <tr> 
    <td height="268" colspan="3"><div align="center"> 
        <form name="myform" method="post" action="record.php">
          <table width="45%" border="1" align="center" cellspacing="1" bordercolor="#FFCC99">
            <tr> 
              <td colspan="4" bgcolor="#FFCC99" class="style0"><marquee>
                <font color="#FF0000">ไม่สามารถใส่ Sript ได้ </font></marquee></td>
            </tr>
            <tr valign="top"> 
              <td colspan="4"> <font color="#187DF7" size="2"><b>รายละเอียด ::</b></font> 
                <div align="right"> </div></td>
            </tr>
            <tr valign="top">
              <td colspan="4" align="center"><textarea class="blue" cols=65 name="a_message" rows=7></textarea></td>
            </tr>
            <tr> 
              <td width="16%" rowspan="3"  valign="top">&nbsp; </td>
              <td width="16%"  bgcolor="#FFCC99"><div align="right"><font size="2" color="#187DF7"><b>ชื่อ 
                  * ::</b></font></div></td>
              <td width="53%"> <div align="left"> 
                  <input type="text" name="a_name" size="34" >
                </div></td>
              <td width="15%" rowspan="3">&nbsp;</td>
            </tr>
            <tr> 
              <td width="16%" bgcolor="#FFCC99"><div align="right"><font color="#187DF7" size="2"><b>E-mail 
                  :: </b></font></div></td>
              <td width="53%"><div align="left"> 
                  <input type="text" name="a_email" size="34" >
                </div></td>
            </tr>
            <tr> 
              <td width="16%" bgcolor="#FFCC99"><div align="right"><font color="#187DF7" size="2"><b> 
                  MSN :: </b></font></div></td>
              <td width="53%"><div align="left"> 
                  <input type="text" name="a_icq" size="34" >
                </div></td>
            </tr>
            <tr> 
              <td colspan="4"><div align="center"> 
                  <input name="submit" type="submit"  value="ออกความเห็น" size="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="reset" type="reset"  value="   ยกเลิก   " size="8">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div></td>
            </tr>
            <tr> 
              <td colspan="4" bgcolor="#FFCC99" class="style0"><marquee>
                <font color="#FF0000">ไม่สามารถใส่ Sript ได้ </font></marquee></td>
            </tr>
          </table>
          <input type=hidden name="q_id" value="<?php echo "$q_id"; ?>">
        </form>
      </div></td>
  </tr>
</table>
</body>
</html>