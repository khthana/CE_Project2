<?php
 $DBName="allmission";
$link=@mysql_pconnect("localhost","player","player");
@mysql_select_db($DBName,$link);


$ciper=$HTTP_COOKIE_VARS['passkey'];

//decyption
$len_ciper=(strlen($ciper)/2);

$plantext=decypt($ciper,$len_ciper);

for($i=0;$i<=($len_ciper);$i++){
 $planstr{$i}=chr($plantext{$i});
}

$planstring = implode("", $planstr);
$plan=trim($planstring);

$row=mysql_query("SELECT * FROM profile WHERE email='$plan' ");
$rownum=mysql_num_rows($row);

if($rownum ==0){
header("Location:../first_stage/home.php");
}

//decyption function
function decypt($ciper,$len_ciper){
for($i=0;$i<$len_ciper;$i++){
 $buffer1=$ciper{$i+$i};
$buffer2=$ciper{$i+$i+1};
$todec= hexdec($buffer1);

$first_ascii=$todec;
 $encypt= $first_ascii ^ 10;
$hex1=dechex($encypt);
$todec2= hexdec($buffer2);
 $second_ascii=$todec2;
 $encypt2= $second_ascii ^ 10;
$hex2=dechex($encypt2);

$concat="$hex1"."$hex2";
$plantext{$i}=hexdec($concat);
}
return $plantext;
}
?>
<?php

		                // สำหรับอ่านข้อมูลกระทู้ต่าง ๆ
	                 $hostname = "localhost";   // ชื่อโฮสต์
	                 $user = "player";         // ชื่อผู้ใช้
	                 $password = "player";         // รหัสผ่าน
	                 $dbname = "allmission";	 // ชื่อฐานข้อมูล
	
	                 // เริ่มติดต่อฐานข้อมูล
	                 mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	                // เลือกฐานข้อมูล
	                mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");	
	                $sql = "select * from webboard_question where q_id = '$q_id'";
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
	             
                 ?>

<html>
<head>
<title>answer</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="../smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style0 {
	                   font-family: "MS Sans Serif";
					   font-size: 14px;
					   color:#333333;
        }
-->
</style>
</head>
<body background="pic/line.gif" link="#000000" vlink="#330000"  bgproperties="fixed" >

<table width="95%" height="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bgcolor="#657889"> 
    <td height="132" colspan="3" valign="top"><div align="left"><img src="pic/name01.jpg" width="741" height="141"><img src="pic/name02.jpg" width="128" height="141"></div></td>
  </tr>
  <tr align="left"> 
    <td height="20" colspan="3"> <div align="left"> 
        <table width="100%" border="0">
          <tr bgcolor="#657889"> 
            <td class="style0"><div align="center"><strong><a href="home.php">HOME</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="product_.php">Product</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="download.php">Download</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="member.php">Member</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="webboard.php">Webboard</a></strong></div></td>
            <td class="style0"><div align="center"><strong><a href="logout.php">Logout</a></strong></div></td>
          </tr>
        </table>
      </div></td>
  </tr>
  <tr> 
    <td width="3%" valign="bottom"> <div align="left"> 
        <div align="left"> </div>
      </div></td>
    <td width="93%" valign="top"> <div align="center"> </div>
      <table width="90%" border="0" align="center" cellspacing="0" >
        <tr> 
          <td colspan="3"><div align="center"> 
              <table width="75%" height="30%"  cellspacing="0" >
                <tr bgcolor="#666666"> 
                  <td height="20" colspan="3" valign="top"> <div align="center"><a href="webboard.php">Webboard</a></div></td>
                </tr>
                <tr bgcolor="#657889"> 
                  <td height="21" colspan="3" valign="top" bgcolor="#657889"><div align="center"><font  size="3pt"><b><u><?php echo $q_topic; ?></u></b></font></div></td>
                </tr>
                <tr> 
                  <td width="10%" colspan="3" bgcolor="#CCCCCC"  class="style0"> 
                    <div align="center"> 
                      <?php
                            echo "<font color=blue size=5pt >$q_message </font>";  
                         ?>
                    </div></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#657889" class="style0"> &nbsp; <strong>โดย 
                    : </strong> 
                    <?php 
		                        if ($q_email == "")
			                       {	
				                     echo "$q_name</font> - เมื่อ [$q_date] ip :: $q_ip";
			                       }
		                       else
			                       { 
				                      echo " <a href='mailto:$q_email'>$q_name</a> -  เมื่อ [$q_date] ip :: $q_ip";
			                       }	// จบ if
	                           ?>
                  </td>
                </tr>
              </table>
            </div></td>
        </tr>
        <tr> 
          <td width="12%" align="center"> </td>
          <td width="76%" align="center"> 
            <?php
	         $sql1 = "select  *  from  webboard_answer  where  a_qid = '$q_id'";
	         $db_query1 = mysql_db_query ($dbname, $sql1);

	         if (!$db_query1)
		     {
			     echo ("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้");
			   //  exit;
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
            <table width=100% border=0 cellspacing="0"  bordercolor="#FFCC99">
              <tr> 
                <td  class="style0" width=100%> <table border=0 cellPadding=0 cellSpacing=0 height=46 width=100%>
                    <tbody>
                      <tr> 
                        <td class="style0" width=100%> <table width="99%" border="1"  align="center" cellspacing="0" bordercolor="#657889" class="style0">
                            <tr> 
                              <td bgcolor="#657889" class="style0"> <div align="center"><u> 
                                  <?php if ($i==0)echo "ความคิดเห็นล่าสุด";?>
                                  </u></div></td>
                            </tr>
                            <tr height=30> 
                              <td bgcolor="#CCCCCC"> 
                                <?php  echo $a_message ;?>
                              </td>
                            </tr>
                            <tr> 
                              <td height="10" bgcolor="#657889" class="style0"> 
                                <strong>โดย : </strong> 
                                <?php if ($a_email == "")
					                                                                      {
						                                                                     echo "<font color=#000000>$a_name - เมื่อ [ $a_date] ip :: $a_ip ";
					                                                                       }
				                                                                           else
				                                                                             {
                                        						                               echo " <a href='mailto:$a_email'> $a_name</a> - เมื่อ [$a_date] ip :: $a_ip ";
					                                                                        }	// จบ if ?></font>
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                    </tbody>
                  </table></td>
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
                <table width="45%" border="1" align="center" cellspacing="1" bordercolor="#999999">
                  <tr bgcolor="#657889"> 
                    <td colspan="4" class="style0"><marquee>
                      </marquee></td>
                  </tr>
                  <tr valign="top"> 
                    <td colspan="4" class="style0"><b>รายละเอียด ::</b>
                      <div align="right"> </div></td>
                  </tr>
                  <tr valign="top"> 
                    <td colspan="4" align="center"><textarea class="blue" cols=65 name="a_message" rows=7></textarea></td>
                  </tr>
                  <tr> 
                    <td width="16%" rowspan="3"  valign="top">&nbsp; </td>
                    <td width="16%"  bgcolor="#657889" class="style0"><div align="right"><font size="2"><b>ชื่อ 
                        * ::</b></font></div></td>
                    <td width="53%"> <div align="left"> 
                        <input type="text" name="a_name" size="34" >
                      </div></td>
                    <td width="15%" rowspan="3">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td width="16%" bgcolor="#657889" class="style0"><div align="right"><font size="2"><b>E-mail 
                        ::</b></font><font color="#187DF7" size="2"><b> </b></font></div></td>
                    <td width="53%"><div align="left"> 
                        <input type="text" name="a_email" size="34" >
                      </div></td>
                  </tr>
                  <tr> 
                    <td width="16%" bgcolor="#657889" class="style0"><div align="right"><font size="2"><b>MSN 
                        :: </b></font></div></td>
                    <td width="53%"><div align="left"> 
                        <input type="text" name="a_icq" size="34" >
                      </div></td>
                  </tr>
                  <tr> 
                    <td colspan="4"><div align="center"> 
                        <input name="submit" type="submit"  value="ออกความเห็น" size="8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <input name="reset" type="reset"  value="   ยกเลิก   " size="8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div></td>
                  </tr>
                  <tr bgcolor="#657889"> 
                    <td colspan="4" class="style0"></td>
                  </tr>
                </table>
                <input type=hidden name="q_id" value="<?php echo "$q_id"; ?>">
              </form>
            </div></td>
        </tr>
      </table>
      <div align="center"></div></td>
    <td width="4%" valign="top">&nbsp;</td>
  </tr>
  <tr bgcolor="#657889"> 
    <td height="20" colspan="3">&nbsp;</td>
  </tr>
</table>
</body>
</html>