<body bgcolor="#FFFFFF">
<table width="501" border="1" cellspacing="0" cellpadding="5" height="250" align="center">
     <tr align="center" valign="middle" bgcolor="#FFFFCC"> 
          <td> 
               <p><font size="+3" face="MS Sans Serif, Microsoft Sans Serif" color="#FF3333">congraturation 
                    !! </font></p>
               <p><font size="+3" face="MS Sans Serif, Microsoft Sans Serif" color="#FF3333">delete 
                    article completed !!</font></p>
               <hr>
               <p><a href="../../reader.php"><font size="2" face="MS Sans Serif, Microsoft Sans Serif">อ่านบทความ</font></a></p>
               <p><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><a href="../edit_article/page_edit.php">สร้างบทความ</a></font></p>
          </td>
     </tr>
</table>
<?
include ('connect.inc');
?>

<?

//echo "$num_delete <br>\n";

for ($line = 1; $line <=$num_delete; $line++){
        $delete = "delete_art_id".$line;
	$delete_art_id = ${$delete};
//	echo "$delete_art_id <br>\n";
 if ( $delete_art_id <> "")    {
		
	// =================   delete directory of article ===========
				$str_sql = "
							select		location
							from		article
							where		art_id = $delete_art_id 
						";

				$result = mysql_db_query (magazine,$str_sql,$id_link);

				$row=mysql_fetch_array($result);
				$directory = $row[location];
//				echo "directory for delete : $directory <br>\n";
				$location= "/www/htdocs/magazine/".$directory;
//				echo "location for detete : $location<br>\n";			

				//##########################
				$command ="rm -rf ".$location ;
				if ($directory <> "")
					exec($command); 	
				
				//##########################


			//===============  delete article table ==============
			$str_sql = "
				delete  from   article 
				where  art_id = $delete_art_id   ";
	
				$result = mysql_db_query (magazine,$str_sql,$id_link);

			//============== delete relate table ================
				$str_sql = "
				delete  from   relate 
				where  art_id = $delete_art_id 
				or         relate_art_id = $delete_art_id ";
	 
				$result = mysql_db_query (magazine,$str_sql,$id_link);

			//==============delete have key table ================
				$str_sql = "
				delete  from   have_key 
				where  art_id = $delete_art_id 
				";
 
				$result = mysql_db_query (magazine,$str_sql,$id_link);
			// ============= select op_id  ================
	
				$str_sql = "
				select  op_id
				from    opinion
				where  art_id = $delete_art_id 
				";

				$result = mysql_db_query (magazine,$str_sql,$id_link);

				$row=mysql_fetch_array($result);
				$op_id = $row[0];

			//========== delete opinion =====================
	
				$str_sql = "
				delete  from   opinion 
				where  art_id = $delete_art_id 
				";

				$result = mysql_db_query (magazine,$str_sql,$id_link);

			//===========delete op_ans

				$str_sql = "
				delete  from   op_ans 
				where  op_id = $op_id 
				";

				$result = mysql_db_query (magazine,$str_sql,$id_link);

			//===========select poll_id =================

				$str_sql = "
				select  poll_id
				from    poll
				where  art_id = $delete_art_id 
				";

				$result = mysql_db_query (magazine,$str_sql,$id_link);

				$row=mysql_fetch_array($result);
				$poll_id = $row[0];

			//=============delete poll===================
				$str_sql = "
				delete  from   poll 
				where  art_id= $delete_art_id 
				";

				$result = mysql_db_query (magazine,$str_sql,$id_link);


			//=============delete choice===================
				$str_sql = "
				delete  from   choice
				where  poll_id= $poll_id 
				";

				$result = mysql_db_query (magazine,$str_sql,$id_link);

			//=============delete poll_ans===================
				$str_sql = "
				delete  from   poll_ans
				where  poll_id= $poll_id
			       ";

				$result = mysql_db_query (magazine,$str_sql,$id_link);


			}  // end if

		} // end for
?>