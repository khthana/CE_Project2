<html>
<head>
<title>
</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#3333FF" vlink="#CCCCFF" alink="#FF3333">
<table align="center" width="70%" cellpadding="10">
     <tr bgcolor="#FFFFCC"> 
          <td> 
	  
	  
<?
include ('connect.inc');

//====================SELECT QUESTION=====================================
	
	$str_sql= "	select  * 
			from   	opinion
			where	op_id = '$op_id'
			";
	$result_question = mysql_db_query (magazine,$str_sql,$id_link);
	$row = mysql_fetch_array($result_question);
	$question = $row[1]; 
	echo "<h1><font color = #0000FF> $question</font> </h1><hr> \n";
	
//######################################################################
include ('getdate.inc');
include ('get_ip.inc');
$date_post = $year."-".$nmonth."-".$date;
$time_post = $hours.":".$minutes.":".$seconds;
$ip = $proxy."=>".$ip;
	
	$str_sql = "
			insert into op_ans (
						op_answer,
						op_id, 						 
						date_post, 
						time_post,
						name,
						ip

					) values (
						'$op_answer',
						'$op_id',					
						'$date_post',
						'$time_post',
						'$name',
						'$ip'
		
					) ";

	if ( $op_answer <> "") {			 
		$result = mysql_db_query (magazine,$str_sql,$id_link);
	}
 
//====================SELECT ANSWER OF QUESTION =========================== 
	$str_sql= "	select  * 
			from   	op_ans
			where	op_id = '$op_id'
			";
	$result_ans = mysql_db_query (magazine,$str_sql,$id_link);
	$nf=mysql_num_rows($result_ans);

	for ($num_ans = 1; $num_ans <= $nf; $num_ans++){

		$row=mysql_fetch_array($result_ans);
		$op_ans = $row[1];
		$date_post = $row[3];

	include('swap_date.inc');

		$time_post = $row[4];
		$name = $row[5];
		$ip=$row[6];

		echo " $op_ans  <br> \n";
		echo "<font color = #FF0000> จาก $name  IP: $ip  วันที่ $date_post  เวลา $time_post </font><hr>\n ";

	}		

?> 
  <form method="post" action="opinion.php">
    <table width="250 pixel" border="1" cellspacing="0" cellpadding="0" align="center">
    <tr align="center" bgcolor="#9999FF"> 
                              <td><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">แสดงความคิดเห็น</font></b></td>
    </tr>
                         <tr align="left"> 
                              <td> <font color="#9999FF"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="1">ชื่อ 
                                   / E-mail</font> </b> </font> 
                                   <input type = text name="name" size = 40 >
      </td>
    </tr>


    <tr align="center"> 
      <td>
        <textarea name="op_answer" cols="50" rows="5"></textarea>
      </td>
    </tr>
    
    <tr align="center"> 
      <td> 
<? echo "        <input type=\"hidden\" name=\"op_id\" value= \"$op_id\"> \n";  ?>
	<input type="submit" name="Submit" value="Submit">
        <input type="reset" name="Submit2" value="Reset">

      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>

       </td>
     </tr>
</table>
</body>
</html>