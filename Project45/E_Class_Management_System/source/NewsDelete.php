<html>
<head>
<title>NewsDelete</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
		require('./libraries/grab_globals.lib.php');
		
		if($DeleteNews) {
			include("./config.inc.php");
			$num =  count($name);
			for($i = 0;$i < $num ; $i++) {
				newsdelete($name[$i],$con);
			}
		echo "<meta http-equiv=\"REFRESH\" content=\"0;URL= AdminTable.php?Choice=news\">";
		}
		
	function NewsShow() {
		//include("./config.inc.php");
		$row = headline();
		echo "<html><head><title>DeleteNews</title>";
		echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">";
		echo "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">";
		echo "</head>";
		echo "<body leftmargin=\"0\" topmargin=\"0\">";
		echo  "<form action=\"NewsDelete.php\" method=\"post\" name=\"admin\">";
		echo "<table width = 95% border = 0 cellpadding=0 cellspacing=1 class = text align=center ";
		echo "bgcolor=999999 bordercolor=CCCCCC bordercolordark=DDDDDD bordercolorlight=CCCCCC >";			
		echo "<tr class=text><th width=5% bgcolor=FFFFFF><img src=\"Picture/announce.gif\" width=20 height=20></th><th width=28% bgcolor=99AAFF>ประกาศวันที่</th><th bgcolor=99AAFF>เรื่อง</th></tr>";
		while($show = mysql_fetch_row($row)) {
			echo "<tr><td bgcolor=FFFFFF align=center><input name=\"name[]\" type=\"checkbox\" value=\"$show[0]\"></td>";
			echo "<td bgcolor=EEEEEE align=center><font color=EE2222 >$show[3]</font></td>";
			echo "<td bgcolor=EEEEEE nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href =\" ";
			//echo "javascript:%20void%20window.open('Headline.php?id=$show[0]','Detail',' width=770,heigth=500,location=yes,menubar=yes,toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=5,left=10');\">$show[1]</a></td>";
			echo "Headline.php?id=$show[0]\" target=_blank>$show[1]</a></td>";
			echo "</tr>";
		}
		echo "<tr><td colspan=3>&nbsp;&nbsp;<input name=\"DeleteNews\" type=\"submit\" value=\"delete\"></td></tr>" ;	
		echo "</table>";
		echo "</body></html>";
		echo "</font>";
 	}
?>
</body>
</html>
<?php
	function newsdelete($ID,$con){
		global $con;
		$sql = "DELETE FROM  news WHERE ID = '$ID ' ";
		$query = mysql_query($sql,$con);
	}
?>