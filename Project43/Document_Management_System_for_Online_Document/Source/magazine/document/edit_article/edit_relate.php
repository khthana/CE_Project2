<body bgcolor="#FFFFFF" text="#CCCCFF" link="#3333FF">
<table width="500" border="1" cellspacing="0" cellpadding="5" height="250" align="center">
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

//echo "article id : $art_id <br>\n";
//echo "number of relate : $count_relate <br>\n";

//###########################################################################
// ============== delete old relate ==========

	$str_sql = "
		delete	from relate
		where	art_id = $art_id
		or	relate_art_id = $art_id
		  ";
	$result = mysql_db_query (magazine,$str_sql,$id_link);

//#####################################################################
//=========insert new relate ===============

for ($line = 1; $line <=$count_relate; $line++){
        $relate = "relate_art_id".$line;
	$relate_art_id = ${$relate};
//	echo "$relate_art_id <br>\n";


	$str_sql = "
		insert into relate (
					art_id,
					relate_art_id
				) values (
					'$art_id',
					'$relate_art_id'
				    ) ";
	if ( $relate_art_id <> "") {			 
		$result = mysql_db_query (magazine,$str_sql,$id_link);
	}

// insert  related with old article (exchange with up ) 
	$str_sql = "
		insert into relate (
					art_id,
					relate_art_id
				) values (
					'$relate_art_id',
					'$art_id'
				    ) ";
	if ( $relate_art_id <> "") {			 
		$result = mysql_db_query (magazine,$str_sql,$id_link);
	}

}

?>
