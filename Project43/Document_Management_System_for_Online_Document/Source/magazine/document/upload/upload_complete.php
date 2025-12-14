
<body bgcolor="#FFFFFF">
<table width="501" border="1" cellspacing="0" cellpadding="5" height="250" align="center">
     <tr align="center" valign="middle" bgcolor="#FFFFCC"> 
          <td> 
               <p><font size="+3" face="MS Sans Serif, Microsoft Sans Serif" color="#FF3333">congraturation 
                    !! </font></p>
               <p><font size="+3" face="MS Sans Serif, Microsoft Sans Serif" color="#FF3333">your 
                    article completed !!</font></p>
               <hr>
               <p><a href="../../reader.php"><font size="2" face="MS Sans Serif, Microsoft Sans Serif">อ่านบทความ</font></a></p>
               <p><font size="2" face="MS Sans Serif, Microsoft Sans Serif"><a href="../edit_article/page_edit.php">สร้างบทความ</a></font></p>
          </td>
     </tr>
</table>
<?
include ('connect.inc');
for ($number_question = 1; $number_question <= $num_question; $number_question++)
{
	$question = "question".$number_question;
	$question = ${$question};
//	echo "$question <br>\n";
	
	$str_sql = "
			insert into opinion (
						question,
						art_id

					) values (
						'$question',
						'$art_id'
		
					) ";




//	if ( $poll_question <> "") {			 
		$result = mysql_db_query (magazine,$str_sql,$id_link);
//	}
 
}


//echo "<center><h1> COMPLETE </h1></center> ";
?>
