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

	    			$hostname = "localhost";
	    			$username = "player";
	    			$password = "player";
	    			$dbname = "allmission";

	    			// ติดต่อฐานข้อมูล
					//$link = @mysql_pconnect("localhost","root","");
					//@mysql_select_db($dbname,$link);
				 $link=mysql_connect($hostname, $username, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	    			// เลือกฐานข้อมูล
	    		     mysql_select_db($dbname,$link) or die("เลือกฐานข้อมูลไม่ได้");

	    			//ต้องการแสดง10 ข้อ ต่อ 1 หน้า

	    			$pagesize = 10;

	    			// ถ้า $page ไม่มีค่า กำหนดให้เท่ากัน 1
	    			if (empty($page))
	                             {
	    			               $page=1;
	    			    }

	    			$q_sql = "select * from webboard_question";
	    			$q_db_query = mysql_db_query ($dbname, $q_sql);
	    			$num_rows = mysql_num_rows($q_db_query);
	    			$rt = $num_rows%$pagesize;	// หาจำนวนหน้าทั้งหมด

	    			if($rt!=0)
	    			   {
	    			               $totalpage = floor($num_rows/$pagesize)+1;
	    			    }
	    			else
	    			   {
	    			              $totalpage = floor($num_rows/$pagesize);
	    			    }

	    			$goto = ($page-1)*$pagesize;	// หาหน้าที่จะกระโดดไป

	    			$sql = "select * from webboard_question order by q_id desc limit $goto,$pagesize";
	    			$db_query = mysql_db_query ($dbname, $sql);
	    			if (!$db_query)
	    				{
	    					echo("เอ็กซีคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() );
	    					exit;
	    				}
	    			else {
	    				$nums_rows = mysql_num_rows($db_query);
?>
<html>
<head>
<title>Webboard</title>
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
            <td class="style0"><div align="center"><strong><a href="_2ndstage_.php">HOME</a></strong></div></td>
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
    <td width="93%" valign="top"> 
      <div align="left"><br>
        <table width="100%"  height="41%" border="0" align="left" cellspacing="0">
          <tr> 
            <td width=100% height=18 bgcolor="#657889"  class="style0"><div align="center"><b> 
                <strong><font color="#333333">Webboard</font></strong></b></div></td>
          </tr>
          <tr> </tr>
          <tr> 
            <td height=18  width="100%" class="style0"> <center>
                <a href="formpost.php"><b> คลิกที่นี่เพื่อตั้งกระทู้ใหม่</b></a> 
              </center></td>
          </tr>
          <tr> 
            <td height=51> 
              <?php
	    		// จำนวนเรคคอร์ดของกระทู้ทั้งหมด
	    		echo "<table border=0 bordercolor=black cellspacing=0 cellpadding=2 >\n";
	    		echo "<tr align=center > <td align=left  class=\"style0\"><b>แสดงหน้าที่ : </b>";

	    		for($i=1 ; $i<$page ; $i++)
	    		 {
	    		       echo "<a href='$PHP_SELF?page=$i'>$i</a> ";
	    		  }

	    		echo "<font size=2  color=red><u><b>$page</b></u></font> ";
	    		for($i=$page+1 ; $i<=$totalpage ; $i++)
	    		  {
	    		        echo "<a href=$PHP_SELF?page=$i>$i</a> ";
	    		   }

	    		echo "</font></td></tr>";
	    		echo "</table align = left>";

	    		echo "<hr>\n";	    		

			echo "<table border=0 >";
			  echo "<tr class=\"style0\">";                            
                           echo "<th bgcolor = #657889 >No.</th>";                      
                           echo "<th bgcolor = #657889>หัวช้อ</th>";                         
                           echo "<th bgcolor = #657889>ผู้เขียน</th>";                      
                           echo "<th bgcolor = #657889>วันที่เขียน</th>";
                           echo "<th bgcolor = #657889>ผู้ออกความเห็น</th>"; 
						   echo "<th bgcolor = #657889>ip</th>";
	    		for ($i=0;$i<$nums_rows;$i++)
	    		{
	                          $count = $i + 1;
	    		          $result = mysql_fetch_array($db_query);
	    		          $q_id = $result[q_id];
	    		          $q_topic = $result[q_topic];
	    		          $q_name = $result[q_name];
	    		          $q_email = $result[q_email];
	    		          $q_ip = $result[q_ip];
	    		          $q_date = $result[q_datetime];

	                          $sql1 = "select * from webboard_answer where a_qid = '$q_id'";
	    		          $db_query1 = mysql_db_query ($dbname, $sql1);
	    		          $num_rows1 = mysql_num_rows($db_query1);

	    		          
	    		             echo "<tr>";
	    		                   echo "<td align=center width=3% bgcolor = #CCCCCC class=\"style0\">&nbsp;&nbsp;&nbsp;$q_id :</td>"; 
	    		                   echo "<td align=middle width=10% bgcolor = #CCCCCC class=\"style0\"><a href=detial.php?q_id=$q_id  >$q_topic</a></td>";//--------target=\"_blank\"
                                           echo "<td align=middle width=5% bgcolor = #CCCCCC class=\"style0\"><font color=red>$q_name</font></td>";
                                           echo "<td align=middle width=10% bgcolor = #CCCCCC class=\"style0\">$q_date</td>";
                                           echo "<td align=middle width=10% bgcolor = #CCCCCC class=\"style0\">ผู้ออกความเห็น $num_rows1 คน</td>";
										    echo "<td align=middle width=10% bgcolor = #CCCCCC class=\"style0\">$q_ip</td>";
                                     echo "</tr>";                                
	    		      }
	    		     echo "</tr>";   
	    		  echo "</table>";
	    		}
	?>
            </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table>
        <br>
      </div>
      <div align="center"></div></td>
    <td width="4%" valign="top">&nbsp;</td>
  </tr>
  <tr bgcolor="#657889"> 
    <td height="20" colspan="3">&nbsp;</td>
  </tr>
</table>
</body>
</html>

