<?
// Algorithem of Search data for reader.
// 1.Get and conver input from's reader to correct input.
// 2.Convert input to SQL language.
// 3.Get information to show output.
//*************** Start grogram ***************
   session_start();
// * 1.Check and conver input from to correct.
// * 1.1 Include function for search. ---
   include('searchFunction.inc');
// * 1.2 Check and edit user's input of keyword to correct input form.
   $keyword = correctInputForm($keyword);
//---------------------------------------------
// * 2.Convert input to SQL language.
// * 2.2 Connect to MySQL database.
   $hostname = "localhost";
   $username = "magazine";
   $password = "magazine";
   $dbName = "magazine";
   mysql_connect($hostname,$username,$password) or die("can not connect!");
	$count = 0;
	$numMax = 0;
	$result = "";
	$page = 1;
	$listNum = 10;
	if ($keyword == "")
		$numSearch  = 1;
	else
		$numSearch  = 4;
	for ($c=1;$c<=$numSearch;$c++) {
	// * 2.1 Set condition search.
		if ($c == 1) {
			$keywordCon = SQLcondition($keyword,"key_word");
			$titleCon = "";
			$abstractCon = "";
			$percent = "100%";
		}
		else if ($c == 2) {
			$keywordCon = SQLcondition("-$keyword","key_word");
			$titleCon = SQLcondition($keyword,"art_name");
			$abstractCon = SQLcondition($keyword,"abstract");
			$percent = "92%";
		}
		else if ($c == 3) {
			$keywordCon = SQLcondition("-$keyword","key_word");
			$titleCon = SQLcondition($keyword,"art_name");
			$abstractCon = SQLcondition("-$keyword","abstract");
			$percent = "80%";
		}
		else {
			$keywordCon = SQLcondition("-$keyword","key_word");
			$titleCon = SQLcondition("-$keyword","art_name");
			$abstractCon = SQLcondition($keyword,"abstract");
			$percent = "60%";
		}
	// * 2.3 Determine sql variable to be SQL language. 
		$sql = "select distinct(p1.art_id),art_name,abstract,location,date_write,last_update,num_reader,col_name,mem_fname,mem_lname,p1.col_id 
						from article p1,have_key p2,col p3,member p4
						where p1.art_id = p2.art_id and p1.col_id = p3.col_id and p1.mem_id = p4.mem_id";
		if ($user_type == "W") {
			if (strpos(" $user_types","A") == 0)		
				$sql = "$sql  and p1.mem_id=$user_id";
		}
		else {
				$sql = "$sql  and art_status='A' ";
		}
		$sql = "$sql $keywordCon $titleCon $abstractCon";
		$SQLresult = mysql_db_query($dbName,$sql);
		if ($SQLresult)
			$num = mysql_numrows($SQLresult);
		$numMax = $numMax + $num;
		if ($num) {
			for ($i=1; $i<=$num; $i++) {
				$count++;
				if ($count%$listNum == 1) {
					if ($user_type == "W" && $user_action=="delete") {
						$result = "$result<br><input type = \"hidden\" name=\"num_delete\" value = $num>";
						$result = "$result <input type=\"submit\" name=\"Submit\" value=\"Submit\">";
						$result = "$result <input type=\"reset\" name=\"Submit2\" value=\"Reset\">";
						$result = "$result</form>";
					}
					$result = "$result{page$page}";
					if ($user_type == "W" && $user_action=="delete") {
						$result = "$result <form method =\" post\" action = \" ../../../document/edit_article/delete_article.php\">";
					}
					$page++;
				}
				$row = mysql_fetch_array($SQLresult);
				if ($user_type == "W") {
					if ($user_action=="delete") {
						if ($i==1)
							$result = "$result <form method =\" post\" action = \" ../../../document/edit_article/delete_article.php\">";
						// =========== SHOW  article for edit   for delete===========================
						$result = "$result <input type=\"checkbox\" name=\"delete_art_id$i\" value= $row[art_id]> ";
						$result = "$result $row[art_name]";
						$result = "$result <font color = \"#00cccc\">&nbsp &nbsp [ $row[date_write] ] </font><br>";
					}
					else {
						$result = "$result <strong>$count. </strong> $row[art_name] <br>";
						$row[location] = "/www/htdocs/magazine/".$row[location];
						$d = dir("$row[location]");
						while($entry=$d->read()) {				  
							$ext = strrchr($entry,'.'); 			
							if (($ext == ".txt")or($ext == ".html"))
								$result = "$result<a href = ../../../document/edit_article/edit_article.php?art_id=$row[art_id]&file_name=$entry> $entry </a><br>\n";
						}
						$d->close(); 
					}
				}
				else {
					$sql = "select * from col where col_id = $row[col_id];";
					$SQLresult2 = mysql_db_query($dbName,$sql);
					$row2 = mysql_fetch_array($SQLresult2);
					$result = "$result<strong>$count. </strong><a href=\"../document/template/$row2[template]?template=$row2[template]&location=$row[location]&name=index.html&article_id=$row[art_id]&id_col=$row[col_id]\">$row[art_name]</a> ($percent)";
					$result = "$result<br><strong> Abstract:</strong> $row[abstract]";
					$result = "$result<br><strong> Author name:</strong> $row[mem_fname] $row[mem_lname]";
					$result = "$result<br><strong> Column:</strong> $row[col_name] ";
					$result = "$result | <strong> Reader number:</strong> $row[num_reader]";
					$date =explode("-",$row[date_write]);
					$result = "$result<br><strong>Date write(D/M/Y):</strong> $date[2]/$date[1]/$date[0] ";
					$date =explode("-",$row[last_update]);
					$result = "$result | <strong>Last update(D/M/Y):</strong> $date[2]/$date[1]/$date[0] ";
					$result = "$result<br><br>";
				}
			}
		}
   }
	if ($user_type == "W" && $user_action=="delete") {
		$result = "$result<br><input type = \"hidden\" name=\"num_delete\" value = $num>";
		$result = "$result <input type=\"submit\" name=\"Submit\" value=\"Submit\">";
		$result = "$result <input type=\"reset\" name=\"Submit2\" value=\"Reset\">";
		$result = "$result</form>";
	}
	$keywordCon = str_replace("and (","",$keywordCon);
	$keywordCon = substr($keywordCon, 0, -1);
	$titleCon = str_replace("and (","",$titleCon);
	$titleCon = substr($titleCon, 0, -1);
	$abstractCon = str_replace("and (","",$abstractCon);
	$abstractCon = substr($abstractCon, 0, -1);
	$fauthorCon = str_replace("and (","",$fauthorCon);
	$fauthorCon = substr($fauthorCon, 0, -1);
	$lauthorCon = str_replace("and (","",$lauthorCon);
	$lauthorCon = substr($lauthorCon, 0, -1);
	$dateCon = str_replace("and (","",$dateCon);
	$dateCon = substr($dateCon, 0, -1);
	$columnCon = str_replace("and (","",$columnCon);
	$columnCon = substr($columnCon, 0, -1);
	$rateCon = str_replace("and (","",$rateCon);
	$rateCon = substr($rateCon, 0, -2);
	if ($keywordCon == "") $keywordCon = "ไม่ระบุ";
	if ($titleCon == "") $titleCon = "ไม่ระบุ";
	if ($abstractCon == "") $abstractCon = "ไม่ระบุ";
	if ($fauthorCon == "") $fauthorCon = "ไม่ระบุ";
	if ($lauthorCon == "") $lauthorCon = "ไม่ระบุ";
	if ($dateCon == "") $dateCon = "ไม่ระบุ";
	if ($columnCon == "") $columnCon = "ไม่ระบุ";
	if ($rateCon == "") $rateCon = "ไม่ระบุ";
	$searchCon = "
					<b>คำที่ต้องการค้นหา </b> $keywordCon<br>
					<b>ชื่อบทความ </b>$titleCon<br>
					<b>บทคัดย่อ </b>$abstractCon<br>
					<b>ผู้เขียน  ชื่อ</b> $fauthorCon <b>นามสกุล</b> $lauthorCon <br>
					<b>วันที่เขียนบทความ </b> $dateCon <br>
					<b>หัวข้อบทความ </b>$columnCon <br>
					<b>จำนวนผู้อ่านบทความ </b> $rateCon
	";
	while (strpos($searchCon,"key_word"))
	$searchCon = str_replace("key_word","",$searchCon);
	while (strpos($searchCon,"art_name"))
	$searchCon = str_replace("art_name","",$searchCon);
	while (strpos($searchCon,"abstract"))
	$searchCon = str_replace("abstract","",$searchCon);
	while (strpos($searchCon,"mem_fname"))
	$searchCon = str_replace("mem_fname","",$searchCon);
	while (strpos($searchCon,"mem_lname"))
	$searchCon = str_replace("mem_lname","",$searchCon);
	while (strpos($searchCon,"date_write"))
	$searchCon = str_replace("date_write","",$searchCon);
	while (strpos($searchCon,"col_name"))
	$searchCon = str_replace("col_name","",$searchCon);
	while (strpos($searchCon,"num_reader"))
	$searchCon = str_replace("num_reader","",$searchCon);
	while (strpos($searchCon," not "))
	$searchCon = str_replace(" not "," ไม ่",$searchCon);
	while (strpos($searchCon," and "))
	$searchCon = str_replace(" and "," และ ",$searchCon);
	while (strpos($searchCon," or "))
	$searchCon = str_replace(" or "," หรือ ",$searchCon);
	while (strpos($searchCon," like "))
	$searchCon = str_replace(" like "," มีคำว่า ",$searchCon);
	while (strpos($searchCon,"%"))
	$searchCon = str_replace("%","...",$searchCon);

	session_unregister("searchCon");
	session_register("searchCon");
	$maxPage = $page-1;
	session_unregister("maxPage");
	session_register("maxPage");
	$searchResult = "$result{page$page}";
	session_unregister("searchResult");
	session_register("searchResult");
	session_unregister("numMax");
	session_register("numMax");
	$sqlcon = $sql;
	session_unregister("sqlcon");
	session_register("sqlcon");
// * 3.3 Call displaySerach.php for display output.
	header("Location: ../search.php?numPage=1");
	mysql_close();
//******************* End *********************
?>
