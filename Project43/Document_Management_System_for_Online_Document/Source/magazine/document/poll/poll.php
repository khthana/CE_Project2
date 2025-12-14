<html>
  <head>
    <title>
    </title>
  </head>
<body bgcolor="#FFFFFF" text="#000000" link="#3333FF" vlink="#CCCCFF" alink="#FF3333">
<table width="70%" border="1" cellspacing="0" cellpadding="5" align="center">
        <tr bgcolor="#FFFFCC"> 
           <?
include ('connect.inc');
include ('getdate.inc');
include ('get_ip.inc');
if ($nmonth < 10) 
	$nmonth ="0".$nmonth;
if ($date < 10)
	$date ="0".$date;
$date_vote = $year."-".$nmonth."-".$date;
$ip = $ip;

if ($ip == "")
     $ip = $proxy;
//echo "$ip<br>\n";
//echo "$date_vote<br>\n";
//echo "$poll_ans<br> \n";
//echo "$poll_id <br> \n";

	//==========================INSERT =========================================
	$str_sql = "
			insert into poll_ans (
					poll_ans,
					poll_id,
					date_vote,
					ip
					
				) values (
					'$poll_ans',
					'$poll_id',
					'$date_vote',
					'$ip'
					
					
				    ) ";

			//=================check vote========
			$str_sql2 = "	
					select	max(poll_ans_id)
					from	poll_ans
					where	 poll_id = '$poll_id'
					and	date_vote = '$date_vote'
					and	ip = '$ip'		
				    ";
			$result_max = mysql_db_query (magazine,$str_sql2,$id_link);
			 
			$row = mysql_fetch_array($result_max);
			$poll_ans_id = $row[0];

			$str_sql3 = "
				select	* 
				from	poll_ans
				where	poll_ans_id = '$poll_ans_id'
			    ";
				
			$result_lastvote = mysql_db_query (magazine,$str_sql3,$id_link);
			$row = mysql_fetch_array($result_lastvote);

//			echo " $row[0] $row[1] $row[2] $row[3] $row[4]<br>\n";
//			echo " $date_vote $ip <br>\n";
			$lastvote_date = $row[3];
			$lastvote_ip = $row[4];	
			if (( $lastvote_date <> $date_vote) or ( $lastvote_ip <> $ip))
			 {	
				$result = mysql_db_query (magazine,$str_sql,$id_link);

			 }	
				
			
	

	
	
	
	
		
	//================================= SHOW TOPIC VOTE==========================
	
	$str_sql= "		select		*
				from   		poll
				where		poll_id = '$poll_id'
				
				";
	
		$result_poll = mysql_db_query (magazine,$str_sql,$id_link);
		$row=mysql_fetch_array($result_poll);
		$poll_topic = $row[1] ;
		
		
		echo "<td colspan=\"2\"><font color=\"#3333FF\"><h2>$poll_topic </h2><font></td>\n";

		echo "<tr align=\"right\" bgcolor=\"#FFFFCC\"> \n"; 
		echo "<td colspan=\"2\">®”π«πºŸÈ‚À«¥</td> \n";
		echo "</tr>\n";

//================================= SHOW RESULT VOTE====================================================
//================================number voter all choice ===========================================
	$str_sql= "		select		count(*)
				from   		poll_ans
				where		poll_id = '$poll_id'
				";
	$result_choice = mysql_db_query (magazine,$str_sql,$id_link);
	$row=mysql_fetch_array($result_choice);
	$all_vote = $row[0];
//=============================== number vote each choice ==========================================
	$str_sql= "		select		count(*), poll_ans 
				from   		poll_ans
				where		poll_id = '$poll_id'
				group by	poll_ans
				";
	
		$result_choice = mysql_db_query (magazine,$str_sql,$id_link);
		$line = mysql_num_rows($result_choice);
		
		for ($number = 1; $number <= $line; $number++)
		{
			$row=mysql_fetch_array($result_choice);
			$number_ans = $row[0] ;
			$choice = $row[1];
			$persent = $number_ans/$all_vote*100;
			$persent = number_format($persent,2,'.',',');
			echo "<tr bgcolor=\"#CCFFCC\"> \n"; 
			echo "<td width=\"75%\">$choice </td>\n";
			echo "<td width=\"25%\"> $number_ans => $persent% <br></td> \n";
			echo "</tr>\n";
		}			




?> </td>
</tr>
</table>
</body>
</html>
