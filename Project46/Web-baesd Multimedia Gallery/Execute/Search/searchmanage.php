
<html>

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

function download1(id){
	window.open('../../../../show.php?id='+id,'', 'scrollbars=no,width=430,height=360,status=yes,Left=300 ,Top=150,toolbar=1,status=1,resizable=1,menubar=1,AddressBar=1,location=1');
				
}

</SCRIPT>
<?
 
if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
        die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
 include("header.php");
   OpenTable();
  //####################################

$page=$HTTP_GET_VARS[page];
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


$filesearch=$_POST[filesearch]; 

$dbQuery = "SELECT * "; 
$dbQuery .= "FROM multimedia "; 
$dbQuery .= "WHERE (Title  Like ('%$filesearch%') OR Id  Like ('%$filesearch%') OR Type  Like ('%$filesearch%') ) AND Status='0'";
$dbQuery.="LIMIT $page,15";
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
	echo"<center>";
	for($k=0;$k<$perpage;$k++){	
		$k_p=$k+1;
		echo "<a href=showfile.php?page=$page_arr[$k]>$k_p</a>";
		echo "&nbsp;&nbsp;";
	}
	echo"</center>";

	echo "<a href=showfile.php ><a>";
	echo"<center><table width=\"100%\" bgcolor=\"#FFFFFF\" border=0>";
	echo"<tr height=200>";
	$i=0;
	while($rs = mysql_fetch_array( $result))
		{
	$i++;
	echo"<td width=\"25%\" valign=\"top\">";
	echo "<font face=\"Verdana\" size=\"1\" color=\"#FFFFFF\"> ";
	echo "<br>";
	echo "<center><img src=\"downloadfile.php?ImageId=$rs[Id]\" width=100 height=100 onclick=\"download1($rs[Id]);\">\n";
	echo "<br>";
	echo "<a href=\"downloadfile1.php?ImageId=$rs[Id]\"target=\"new\"><font color=\"#000000\">$rs[Filename]</font>";
	echo "<br>";
	echo "<font color=\"#000000\">$rs[Type]</font></a>";
	echo "<br>";
	echo "</center>";
	echo"</td>";
	$bool=$i%5;
	if(!$bool){
	echo "</tr><tr height=200>";
	}

		}
	echo"</tr>";
	echo"</table></center>";
CloseTable();
 include("footer.php");	
	?>
	</html>
	
