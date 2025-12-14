		<?
include('connect.inc');
?>
<html>
<head><title>edit table article </title></head>
<body bgcolor = "#FFFFFF">
<table width="501" border="1" cellspacing="0" cellpadding="5" height="250" align="center">
     <tr align="center" valign="middle" bgcolor="#FFFFCC"> 
          <td> 
               <p><font size="+3" face="MS Sans Serif, Microsoft Sans Serif" color="#FF3333">congraturation 
                    !! </font></p>
               <p><font size="+3" face="MS Sans Serif, Microsoft Sans Serif" color="#FF3333">edit
                    article completed !!</font></p>
               <hr>
               <p><a href="../../reader.php"><font size="2" face="MS Sans Serif, Microsoft Sans Serif">อ่านบทความ</font></a></p>
               <p><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><a href="../edit_article/page_edit.php">สร้างบทความ</a></font></p>
          </td>
     </tr>
</table>

<?
//echo "$art_id<br>\n";
//echo "$art_name<br>\n";
//echo "$abstract<br>\n";
//echo "$col_name<br>\n";
//echo "source file is $source<br>\n\n";

////////////////////////////////////////// select col_id

$str_sql = "
	select 	*
	from	col
	where	col_name ='$col_name' ";
$result = mysql_db_query(magazine,$str_sql,$id_link);
$col = mysql_fetch_array($result);

////////get new location/////////////////////
$str_sql = "
	select location
	from   article
	where  art_id = $art_id ";
$result = mysql_db_query(magazine,$str_sql,$id_link);
$location = mysql_fetch_array($result);
$location = $location[location];
//echo "location is $location <br>\n ";


//$newlocation = "article/".$col_name."/article_".$art_id."/index.php"; 
$newlocation = "article/".$col_name."/article_".$art_id."/"; 



////// move file ///////////
$dir_location = "/www/htdocs/magazine/".$location;
$dir_newlocation = "/www/htdocs/magazine/".$newlocation;
$dir_location = substr($dir_location,0,-1);
$dir_newlocation = substr($dir_newlocation,0,-1);
 

//echo "location : $dir_location <br>\n";
//echo "new location : $dir_newlocation <br>\n";
//exec("mv $dir_location $dir_newlocation");


///////////////////////////////////////// update article
include ('getdate.inc');
$last_update = $year."-".$nmonth."-".$date;



$str_sql = "
	update 	article
	set	art_name = '$art_name' ,
		abstract = '$abstract',
		location = '$newlocation',
		col_id	 = '$col[col_id]',
		last_update = '$last_update'
	where	art_id 	 = $art_id " ;
		
$result = mysql_db_query(magazine,$str_sql,$id_link);

///////////////////////////////////////// update key word
///////////////// delete  old key 
$str_sql = "
	delete 	
	from 	have_key
	where	art_id = $art_id 
 ";
$result = mysql_db_query(magazine,$str_sql,$id_link);

///////////////// insert new key

for($num_key=1; $num_key <= $new_key; $num_key++)
{
	$key  = "key".$num_key;
//	echo " $key =";
	$keyword = ${$key};
//	echo " $keyword <br> \n";
	$str_sql = "
		insert into have_key (
			art_id,
			key_word
			) values (
			'$art_id',
			'$keyword'
			) ";
	if($keyword != "") {
		$result = mysql_db_query (magazine,$str_sql,$id_link);
	}
}	

// Edit Source File ///////////////////////////////////////

		$source_file = fopen($source,"w+");
//		echo " made file $file_location";

		
//	// =========== source data ===========	
		
	//	fputs($source_file,"$data");
		fputs($source_file,stripslashes ($data));
		fclose($source_file);


///////////////////////////////////////////////////////////


//echo " number of poll is $num_poll <br>\n";
//====================UPDATE POLL ===========================
	
		for ($poll = 1; $poll <= $num_poll; $poll++){

		$poll_question = "poll".$poll;
		$poll_question = ${$poll_question};
//		echo " poll $poll_question <br>\n";
		
		$poll_id = "poll_id".$poll;
		$poll_id = ${$poll_id};
//		echo " poll_id $poll_id <br>\n";
	
		$str_sql = "	update  poll 
				set	poll_question = '$poll_question'
				where	poll_id = $poll_id
			";
		$str_sql2 = "	delete from poll
				where   poll_id='$poll_id'
			";
		$del_poll = "del_poll".$poll;
		$del_poll = ${$del_poll};
//		echo "delete  = $del_poll<br>\n";
		
		if ( $del_poll == "delete") 
			{
			  $result_poll = mysql_db_query (magazine,$str_sql2,$id_link);
			//==========delete poll_ans =========

				$str_sql4 = "	delete from poll_ans
				   		where poll_id = '$poll_id'
					";	
				$result_poll = mysql_db_query (magazine,$str_sql4,$id_link);
			//=====================================
			}
		else 
			$result_poll = mysql_db_query (magazine,$str_sql,$id_link);
	

//==================UPDATE CHOICE ============================
$num_choice = "num_choice".$poll;
$num_choice =${$num_choice};
//echo " number of choice is $num_choice <br>\n";	

		for ($number_choice = 1; $number_choice <= $num_choice; $number_choice++)
		{
		$choice = "choice".$poll.$number_choice;
		$choice =${$choice};
//		echo " choice $choice <br>\n";

		$choice_id ="choice_id".$poll.$number_choice;
		$choice_id = ${$choice_id};
//		echo " choice_id $choice_id <br>\n";

		$str_sql= "	update  choice 
			set	choice = '$choice'
			where	choice_id = '$choice_id'
			";
		$str_sql2= "	delete	from choice
				where	choice_id = '$choice_id'
			";
//		echo "delete  = $del_poll <br>\n";
		if ( $del_poll == "delete") 
			{$result_poll = mysql_db_query (magazine,$str_sql2,$id_link);
			 
			 }
		else 
			{ $result_poll = mysql_db_query (magazine,$str_sql,$id_link);
			 
			}
		}
	}

?>

<?

//====================UPDATE Question ===========================
	
		for ($num_op = 1; $num_op <= $num_question; $num_op++){

		$op_question = "question".$num_op;
		$op_question = ${$op_question};
//		echo " question $op_question <br>\n";

		$op_id = "op_id".$num_op;
		$op_id = ${$op_id};
//		echo " op_id $op_id <br>\n";
	
		$str_sql= "	update  opinion 
			set	question = '$op_question'
			where	op_id = $op_id
			";

		$str_sql2 = "	delete from opinion
				where   op_id='$op_id'
			";
		$del_question = "del_question".$num_op;
		$del_question = ${$del_question};
//		echo "delete = $del_question<br>\n";
		
		if ( $del_question == "delete") 
		 {	
			$result_question = mysql_db_query (magazine,$str_sql2,$id_link);
			
			//==========delete op_ans =========

			$str_sql3 = "	delete from op_ans
				   	where op_id = '$op_id'
				   ";	
			$result_question = mysql_db_query (magazine,$str_sql3,$id_link);
		 }
		else 
			$result_poll = mysql_db_query (magazine,$str_sql,$id_link);

	       }

//==============================================================
exec("mv $dir_location $dir_newlocation");
?>


</body>
</html>
