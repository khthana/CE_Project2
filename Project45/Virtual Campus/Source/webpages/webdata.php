<?PHP
include("common.php");

if(isset($db_name)&&($db_name!='')) {
	echo "<b>Info : No table selected.</b><hr>";
	$tables=mysql_list_tables ($db_name,$link_id);
	$num_tables = @mysql_num_rows($tables);


	if($num_tables==0) echo "<b>Info : No table found.</b><hr>";
	else {
		echo "<center>";
		echo "<table>";
		echo "<th>Table</th><th>Records</th><th>Action</th>";
		while($i < $num_tables) {
			$tbl_name=mysql_tablename($tables,$i);
			$num_records=mysql_num_rows(mysql_db_query($db_name,'select * from ' . $tbl_name));
			echo ("
				<tr><td class=data_table>$tbl_name</td>
					<td class=data_table>$num_records</td>
					<td class=data_table>
							<a href='browse.php?host_name=$host_name&db_name=$db_name&tbl_name=$tbl_name&sql_query=select * from $tbl_name'>Browse</a> | 
							<a herf=''>Edit</a> | 
							<a herf=''>Drop</a> | 
							<a herf=''>Empty</a> | 
							<a href='record.php?host_name=$host_name&db_name=$db_name&tbl_name=$tbl_name&action=insert'>Insert Record</td>
				</tr>
			");
			$i++;
		}
		echo "</table>";
		echo "</center>";
		mysql_free_result($tables);
	}
} else {
	echo "<b>Info : No database selected.</b><hr>";
	$databases=mysql_list_dbs ($link_id);
	$num_databases = @mysql_num_rows($databases);


	if($num_databases==0) echo "<b>Info : No database found.</b><hr>";
	else {
		echo "<center>";
		echo "<table>";
		echo "<th>Database</th><th>Tables</th><th>Action</th>";
		while($i < $num_databases) {
			$db_name=mysql_tablename($databases,$i);
			$num_tables=mysql_num_rows(mysql_list_tables ($db_name,$link_id));
			echo ("
				<tr><td class=data_table>$db_name</td>
					<td class=data_table>$num_tables</td>
					<td class=data_table>
							<a href='webdata.php?db_name=$db_name'>Use</a> | 
							<a herf=''>Edit</a> | 
							<a herf=''>Drop</a> | 
							<a herf=''>Empty</a> | 
							<a herf=''>Insert Table</td>
				</tr>
			");
			$i++;
		}

		echo "</table>";
		echo "</center>";
		mysql_free_result($databases);
	}
}

include("footer.php");
?>