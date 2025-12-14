<!--    หน้าแรกเว็บบอร์ด     -->
<?php
	session_start();
setcookie("value", $name=get_your_cookie, time()+36000);
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<?php
	    			$hostname = "localhost";
	    			$username = "player";
	    			$password = "player";
	    			$dbname = "xss";

	    			// ติดต่อฐานข้อมูล
					//$link = @@mysql_pconnect("localhost","root","");
					//@@mysql_select_db($dbname,$link);
				 $link=@mysql_connect($hostname, $username, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	    			// เลือกฐานข้อมูล
	    		     @mysql_select_db($dbname,$link) or die("เลือกฐานข้อมูลไม่ได้");

	    			//ต้องการแสดง19 ข้อ ต่อ 1 หน้า

	    			$pagesize = 19;

	    			// ถ้า $page ไม่มีค่า กำหนดให้เท่ากัน 1
	    			if (empty($page))
	                             {
	    			               $page=1;
	    			    }

	    			$q_sql = "select * from question";
	    			$q_db_query = @mysql_db_query ($dbname, $q_sql);
	    			$num_rows = @mysql_num_rows($q_db_query);
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

	    			$sql = "select * from question order by q_id desc limit $goto,$pagesize";
	    			$db_query = @mysql_db_query ($dbname, $sql);
	    			if (!$db_query)
	    				{
	    					echo("เอ็กซีคิวต์คำสั่ง SQL ไม่ได้ " . @mysql_error() );
	    					exit;
	    				}
	    			else
	    				{
	    						$nums_rows = @mysql_num_rows($db_query);
	         ?>
<html>
<head>
<title>:: Cross-Site Script SandBox :: กระดานข่าว :: สามารถใส่สคริปต์ได้ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="smf.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
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
	color: #00ff00; 
	width:100%;
					 
}
a:active {
	text-decoration: none;
	color: #BAF8C5;
}
-->
</style>
</head>
<body  class="style0">
<table width="100%"  height="41%" border="0" align="left" cellspacing="0">
  <tr> 
    <td width=100% height=18 bgcolor="#FFCC99"  class="style0"><div align="center"><b> 
        <font color="#FF0000"><strong>Cross-Site Scripting Test</strong></font></b></div></td>
  </tr>
  <tr> </tr>
  <tr> 
    <td height=18  width="100%" class="style0"> <center>
        <a href="formpost.html"><b> คลิกที่นี่เพื่อตั้งกระทู้ใหม่</b></a> 
      </center></td>
  </tr>
  <tr> 
    <td height=51> 
      <?php
	    		// จำนวนเรคคอร์ดของกระทู้ทั้งหมด
	    		echo "<table border=0 bordercolor=black cellspacing=0 cellpadding=2 >\n";
	    		echo "<tr align=center > <td align=left  class=\"style0\"><b><font color=#ff0000>แสดงหน้าที่</font> : </b>";

	    		for($i=1 ; $i<$page ; $i++)
	    		 {
	    		       echo "<a href='$PHP_SELF?page=$i'  >$i</a> ";
	    		  }

	    		echo "<font size=2  color=red><u><b>$page</b></u></font> ";
	    		for($i=$page+1 ; $i<=$totalpage ; $i++)
	    		  {
					
	    		        echo "<a href='$PHP_SELF?page=$i' >$i</a> ";
	    		   }

	    		echo "</font></td></tr>";
	    		echo "</table align = left>";

	    		echo "<hr>\n";	    		

			echo "<table border=0 >";
			  echo "<tr class=\"style0\">";                            
                           echo "<th bgcolor = #FF8F20 >No.</th>";                      
                           echo "<th bgcolor = #FF8F20>หัวช้อ</th>";                         
                           echo "<th bgcolor = #FF8F20>ผู้เขียน</th>";                      
                           echo "<th bgcolor = #FF8F20>วันที่เขียน</th>";
                           echo "<th bgcolor = #FF8F20>ผู้ออกความเห็น</th>"; 
						   echo "<th bgcolor = #FF8F20>ip</th>";
	    		for ($i=0;$i<$nums_rows;$i++)
	    		{
	                          $count = $i + 1;
	    		          $result = @mysql_fetch_array($db_query);
	    		          $q_id = $result[q_id];
	    		          $q_topic = $result[q_topic];
	    		          $q_name = $result[q_name];
	    		          $q_email = $result[q_email];
	    		          $q_ip = $result[q_ip];
	    		          $q_date = $result[q_datetime];

	                          $sql1 = "select * from answer where a_qid = '$q_id'";
	    		          $db_query1 = @mysql_db_query ($dbname, $sql1);
	    		          $num_rows1 = @mysql_num_rows($db_query1);

	    		          
	    		             echo "<tr>";
	    		                   echo "<td align=center width=3% bgcolor = #FFF0E1 class=\"style0\"><img src=\"../../images/question.gif\" >&nbsp;&nbsp;&nbsp;$q_id :</td>"; 
	    		                   echo "<td align=middle width=10% bgcolor = #FFF0E1 class=\"style0\"><a href=detial.php?q_id=$q_id  >$q_topic</a></td>";//--------target=\"_blank\"
                                           echo "<td align=middle width=5% bgcolor = #FFF0E1 class=\"style0\"><font color=red>$q_name</font></td>";
                                           echo "<td align=middle width=10% bgcolor = #FFF0E1 class=\"style0\">$q_date</td>";
                                           echo "<td align=middle width=10% bgcolor = #FFF0E1 class=\"style0\">ผู้ออกความเห็น $num_rows1 คน</td>";
										    echo "<td align=middle width=10% bgcolor = #FFF0E1 class=\"style0\">$q_ip</td>";
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
</body>
</html>

