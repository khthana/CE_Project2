<?PHP
include ("common.php");

#require variable host_name, db_name, tbl_name, action
#option variable primary_key

if (!isset($action)) {
	echo "<b>Error : Unknown action</b>";
	exit;
}

##########
#Insert or Edit#
##########
if (($action=="insert")||($action=="edit")) {

	$sql_query = isset($sql_query) ? stripslashes($sql_query) : '';
	$table_def = mysql_db_query($db_name, "SHOW FIELDS FROM $tbl_name");

	if(isset($primary_key))	{
	    $primary_key = stripslashes($primary_key);
	    $result = mysql_db_query($db_name, "SELECT * FROM $tbl_name WHERE $primary_key");
		$record=mysql_fetch_array($result);
		$row = mysql_fetch_array($result);
	} else {
		$result = mysql_db_query($db_name, "SELECT * FROM $tbl_name LIMIT 0");
	}


	echo "<center>";
	echo "<form method=post action=record.php?host_name=host_name&db_name=db_name&tbl_name=tbl_name&action=inserted>\n";
	echo "<table>\n";
	echo "<th>Field</th><th>Type</th><th>Data</th>\n";
	for($i=0;$i<mysql_num_rows($table_def);$i++) {
	    $row_table_def = mysql_fetch_array($table_def);
		$field = $row_table_def["Field"];
		$type = $row_table_def["Type"];
		$len = @mysql_field_len($result,$i);
		if ($action == "insert") $record[$i] = "";
		
		if ((isset($i)) && ($i>0)) {
		echo "<tr><td>$field</td><td>$type</td><td><input type=text name=fields[$field] maxlength=$len size=50 value='$record[$i]'></td></tr>\n" ;
		}
	}

	if(isset($primary_key))	{ echo '<input type="hidden" name="primary_key" value="' . htmlspecialchars($primary_key) . '">' . "\n"; }
	echo ("
		<input type=hidden name=host_name value=$host_name>
		<input type=hidden name=db_name value=$db_name>
		<input type=hidden name=tbl_name value=$tbl_name>
		<tr><td><input type=submit name=btn_insert value=Apply> : <a href=javascript:history.go('-1')>Cancel</a><td></tr>
	");
	echo "</table></form></center>\n";

}


#############
#Inserted or Edited#
#############
elseif (($action=="inserted")||($action=="edited")) {
	reset($fields);
	
	if(isset($primary_key)) {
	    $primary_key = stripslashes($primary_key);
		$valuelist = '';
	    while(list($key, $val) = each($fields))
		{	switch (strtolower($val)) 
			{	case 'null':
			        break;
		        case '$set$':
			        $f = "field_$key";
				    $val = "'".($$f?implode(',',$$f):'')."'";
					break;
		        default:
		            $val = "'$val'";
			        break;
			}
			$valuelist .= "$key=$val, ";
		}
	    $valuelist = ereg_replace(', $', '', $valuelist);
		$query = "UPDATE $tbl_name SET $valuelist WHERE $primary_key";

	} else {

		$fieldlist = '';
		$valuelist = '';
	    while(list($key, $val) = each($fields))
		{	$fieldlist .= "$key, ";
		    switch (strtolower($val)) 
			{	case 'null':
			        break;
		        case '$set$':
			        $f = "field_$key";
				    $val = "'".($$f?implode(',',$$f):'')."'";
					break;
		        default:
		            $val = "'$val'";
			        break;
			}
		    $valuelist .= "$val, ";
		}
	    $fieldlist = ereg_replace(', $', '', $fieldlist);
	    $valuelist = ereg_replace(', $', '', $valuelist);
	    $query = "INSERT INTO $tbl_name ($fieldlist) VALUES ($valuelist)";
	}

	$result = mysql_db_query($db_name, $query);
	
	echo ("
		<p align=center><b>ได้รับข้อมูลเรียบร้อยแล้ว</b>
		<br>Database : $db_name
		<br>Table : $tbl_name
		<br><a href='$Data_Url/index.php?db_name=$db_name'>Tables</a>
		</p>
	");
}

#############
# login #
#############
elseif ($action=="login") {
	echo "User : $Username<br>";
    $result = mysql_db_query($db_name, "SELECT Password FROM $tbl_name WHERE Username='$Username' ");
	$row = mysql_fetch_array($result);
	if (($row!=NULL) && ($Password==$row[0])) 
	{
		$action="edit";

		$table_def = mysql_db_query($db_name, "SHOW FIELDS FROM $tbl_name");

		if(isset($primary_key))	{
			$primary_key = stripslashes($primary_key);
			$result = mysql_db_query($db_name, "SELECT * FROM $tbl_name WHERE Username='$Username' ");
			$record=mysql_fetch_array($result);
			$row = mysql_fetch_array($result);
		} else {
			$result = mysql_db_query($db_name, "SELECT * FROM $tbl_name LIMIT 0");
		}


		echo "<center>";
		echo "<form method=post action=record.php?host_name=host_name&db_name=db_name&tbl_name=tbl_name&action=inserted>\n";
		echo "<table>\n";
		echo "<th>Field</th><th>Type</th><th>Data</th>\n";
		for($i=0;$i<mysql_num_rows($table_def);$i++) {
			$row_table_def = mysql_fetch_array($table_def);
			$field = $row_table_def["Field"];
			$type = $row_table_def["Type"];
			$len = @mysql_field_len($result,$i);
			if ($action == "insert") $record[$i] = "";
			
			if ((isset($i)) && ($i>0)) {
			echo "<tr><td>$field</td><td>$type</td><td><input type=text name=fields[$field] maxlength=$len size=50 value='$record[$i]'></td></tr>\n" ;
			}
		}

		if(isset($primary_key))	{ echo '<input type="hidden" name="primary_key" value="' . htmlspecialchars($primary_key) . '">' . "\n"; }
		echo ("
			<input type=hidden name=host_name value=$host_name>
			<input type=hidden name=db_name value=$db_name>
			<input type=hidden name=tbl_name value=$tbl_name>
			<tr><td><input type=submit name=btn_insert value=Apply> : <a href=javascript:history.go('-1')>Cancel</a><td></tr>
		");
		echo "</table></form></center>\n";
			
	}
	else {echo "Incorrect Username or Password !!!<br>";}
}


include("footer.php");
?>