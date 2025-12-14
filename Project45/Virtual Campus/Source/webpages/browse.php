<?PHP
include("common.php");


$sql_query = isset($sql_query) ? stripslashes($sql_query) : '';
$sql_order = isset($sql_order) ? stripslashes($sql_order) : '';
$sql_limit = (isset($pos) && eregi("^SELECT", $sql_query)) ? " LIMIT $pos, $cfgMaxRows" : '';
$result = mysql_db_query($db_name,$sql_query.' '.$sql_order.' '.$sql_limit);


	echo "<br><table>";
	for ($i=0;$i<mysql_num_fields($result);$i++) {
		$field_name=mysql_field_name($result,$i);
		echo ("
			<th><a href='browse.php?host_name=$host_name&db_name=$db_name&tbl_name=$tbl_name&sql_query=select * from $tbl_name&sql_order=order by $field_name'>$field_name</a></th>
		");
	}
	

	while ($record=mysql_fetch_array($result)) {
		echo "<tr>";
		for ($i=0;$i<mysql_num_fields($result);$i++) echo "<td class=data_table>".$record[$i]."</td>";
		$primary_key=mysql_field_name($result,0).'='.$record[0];
		echo "<td class=data_table><a href='record.php?host_name=$host_name&db_name=$db_name&tbl_name=$tbl_name&sql_query=SELECT * FROM $tbl_name&primary_key=$primary_key&action=edit'>Edit</a></td>";
		echo "</tr>";
	}
	echo "</table>";
	echo " - <a href='record.php?host_name=$host_name&db_name=$db_name&tbl_name=$tbl_name&action=insert'>Insert Record</a> - <a href=javascript:history.go('-1')>Back</a> - ";


mysql_free_result($result);
include("footer.php");
?>