
<SCRIPT LANGUAGE="JavaScript">
/* DHTML functions */
    d=document;
	l=(d.layers)?1:0;
/* Get Element    */    
function gE(e,f){
		if(l){
				f=(f)?f:self;
				V=f.document.layers;
				if(V[e])
				return V[e];
				for(W=0;i<W.length;W++)
				return(gE(e,V[W]));
		}
		if(d.all) return d.all[e];
				return d.getElementById(e);
} 

</SCRIPT>
<?
//----------------------------Header for link----------------------------
if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
        die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
 include("header.php");
 OpenTable();
//-----------------------------------------------------------------------------
  //####################################
	 $username2=$HTTP_SESSION_VARS[username];
	$page=$HTTP_GET_VARS[page];
	if($page==null) $page=0;
	
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
	$dbQuery1 .="WHERE User='username2'";
	

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
	
	for($k=0;$k<$perpage;$k++){	
		$k_p=$k+1;
		//echo"<center>";
		//echo "<a //href=../nuke/modules.php?name=showfile&&page=$page_arr[$k]>$k_p</a>";
		//echo "&nbsp;&nbsp;";
		//echo "</center>";
	}

	echo "<a href=showfile.php ><a>";
	echo"<center><table width=\"100%\" bgcolor=\"#FFFFFF\" border=0>";
	echo"<tr>";
	$dbQuery1 = "SELECT * "; 
	$dbQuery1.= "FROM multimedia "; 
	$dbQuery1 .="WHERE User='username2'";
	$dbQuery1.="LIMIT $page,15";
	$result1 = mysql_query($dbQuery1) or die("Couldn't get file list");
	$i=0;
	while($rs = mysql_fetch_array( $result))
		{
	$i++;
	echo "<a href=\"edit.php?id=$rs[Id]\"&nbsp;&nbsp;&nbsp;&nbsp;<font color=\"#000000\">$rs[Filename]</font></br>";
  
	$bool=$i%5;
	if(!$bool){
	echo "</tr><tr>";
	}
		}
		
	echo"</tr>";
	echo"</table></center>";
	echo "<center>";
	echo"<a href=../nuke/modules.php?name=showfile&&file=showprivate>SHOW PRIVATE</a>";
	echo "&nbsp;&nbsp;";
	//echo"<a href=../nuke/modules.php?name=showfile&&file=edit>EDIT</a>";
	echo "</center>";
CloseTable();
 include("footer.php");
?>
