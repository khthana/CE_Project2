<html>
<head>
<title>All News</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
	require('./libraries/grab_globals.lib.php'); 
	include("./config.inc.php");
	
	echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";	
	echo "<table width = 100% border = 0 cellpadding=0 cellspacing=0 class = text >";
	if(			
		if($row = headline()) {
					while($show = mysql_fetch_row($row)) {
						echo "<tr bgcolor=CCCCCC>";
						echo "<td>&nbsp;&nbsp;&nbsp;<a href =\" ";
						echo "javascript:%20void%20window.open('AllNew.php?id=$show[0]','Detail',' width=770,heigth=600,location=yes,menubar=yes,toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=5,left=10');\">$show[1]</a></td>";
						echo "</tr>";
				}
		}
	echo "</table>";
		
	if($row = detail($id)) {
				echo "<head><title>Detail News</title>";
				echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">";
				echo "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">";
				echo "</head><body>";
				echo "<table width = 100% border = 0 bordercolor=black cellpadding=2 cellspacing=0 class = text >";
				echo "<tr><td><font color=A1A1A1><a href=AllNews.php target=_parent>ดูประกาศทั้งหมด</a></font></td></tr>";
				while($show = mysql_fetch_row($row)) {
					echo "<tr valign = top bgcolor=CCE6FF>";
					echo "<td class=normal>&nbsp;&nbsp;<font color=0033FF><b>ประกาศ</b></font><font color=AA9999 class=text> เมื่อวันที่ $show[4] </font></td>";
					echo "</tr>";
					echo "<tr bgcolor=CCCCCC><td>&nbsp;&nbsp;&nbsp;$show[3]</td></tr>";
					echo "<tr bgcolor=CCE6FF align=right>";
					echo "<td ><font color=0033FF><b>:: ผู้ประกาศ ::</b></font>&nbsp;&nbsp;<font color=AA9999  ";
					echo " class=text>$show[1] </font>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
	}
				echo "</table>";
				echo "</body></html>";
			echo "</font>";
		}
	
?>
</body>
</html>
