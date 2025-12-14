
<?
if(session_is_registered("user")){
  //####################################
//1.ouble login---------------------------------------------------

//2.show private
$page=$HTTP_GET_VARS[page];
$user=$HTTP_SESSION_VARS["user"];
	if($page==null) $page=0;
	// Database connection variables 

	$dbServer = "localhost"; 
	$dbDatabase = "project"; 
	$dbUser = "root"; 
	$dbPass = ""; 


	$sConn = mysql_connect($dbServer, $dbUser, $dbPass) 
	or die("Couldn't connect to database server"); 

	$dConn = mysql_select_db($dbDatabase, $sConn) 
	or die("Couldn't connect to database $dbDatabase"); 


	$dbQuery = "SELECT * "; 
	$dbQuery .= "FROM multimedia "; 
	$dbQuery .="WHERE User='$user'";
	//$dbQuery.="WHERE Type Like ('%image%' ) AND User='$user'";

	$result = mysql_query($dbQuery) or die("Couldn't get file list");
	$rows=mysql_num_rows($result);
	$perpage=$rows/15;
	$perpage=(int)$perpage;
	$p=$rows%15;
	if($p)
	{
		$perpage=$perpage+1;
	}
	for($j=0;$j<$perpage;$j++){
	$page_arr[$j]=$j*15;
	}
	//echo"<center>";
	for($k=0;$k<$perpage;$k++){	
		$k_p=$k+1;
		echo "<a href=showfile.php?page=$page_arr[$k]>$k_p</a>";
		echo "&nbsp;&nbsp;";
	}
	//echo"</center>";

	echo "<a href=showfile.php ><a>";
	echo"<center><table width=\"100%\" bgcolor=\"#FFFFFF\" border=0>";
	echo"<tr height=200>";
	$dbQuery1 = "SELECT * "; 
	$dbQuery1.= "FROM multimedia "; 
	$dbQuery1 .="WHERE User='$user'";
	//$dbQuery1.="WHERE Type Like ('%image%' ) AND User='$user'";
	$dbQuery1.="LIMIT $page,10";
	$result1 = mysql_query($dbQuery1) or die("Couldn't get file list");
	$i=0;
	while($rs = mysql_fetch_array( $result1 ))
		{
	$i++;
	echo"<td width=\"25%\" valign=\"top\">";
	echo "<font face=\"Verdana\" size=\"1\" color=\"#FFFFFF\"> ";
	echo "<br>";
	echo "<center><img src=\"downloadfile.php?ImageId=$rs[Id]\"width=\"100\"height=\"100\"border=\"1\"hspace=\"5\"  onclick=\"show('$rs[Id]');\" alt=\"$rs[Filename]\n$rs[Type]\">\n";
	echo "<br>";
	echo "<font color=\"#000000\">$rs[Filename]</font>";
	echo "<br>";
	echo "<font color=\"#000000\">$rs[Type]</font>";
	echo "<br>";
	echo "<img src=\"\"  width=\"100\" height=\"40\" onclick=\"download1($rs[Id]);\">";
	echo "</center>";
	echo"</td>";
	$bool=$i%5;
	if(!$bool){
	echo "</tr><tr height=200>";
	}

		}
	echo"</tr>";
	echo"</table></center>";

	?>

