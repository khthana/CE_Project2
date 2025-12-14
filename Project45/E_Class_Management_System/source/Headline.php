<?php
		require('./libraries/grab_globals.lib.php'); 
		include("./config.inc.php");
		echo "<font face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">";	
		if(!$id) {
			if($row = headline()) {
				if($status != all)
					show($row);
				else 
					showall($row);
			}
		}
		else  {
			if($row = detail($id)) {
				echo "<html><head><title>Detail News</title>";
				echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">";
				echo "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">";
				echo "</head><body>";
				echo "<table width = 100% border = 0 bordercolor=black cellpadding=2 cellspacing=0 class = text >";
				while($show = mysql_fetch_row($row)) {
					echo "<tr valign = top bgcolor=CCE6FF>";
					echo "<td class=normal>&nbsp;&nbsp;<font color=0033FF><b>ประกาศ</b></font><font color=AA9999 class=text> เมื่อวันที่ $show[4] </font></td>";
					echo "</tr>";
					echo "<tr bgcolor=CCCCCC><td>&nbsp;&nbsp;&nbsp;$show[3]</td></tr>";
					echo "<tr bgcolor=CCE6FF align=right>";
					echo "<td ><font color=0033FF><b>:: ผู้ประกาศ ::</b></font>&nbsp;&nbsp;<font color=AA9999  ";
					echo " class=text>$show[1] </font>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
				}
				//echo "<tr><td align=right><font color=A1A1A1><a href=Headline.php?status=all target=_parent>ดูประกาศทั้งหมด </a></font></td> </tr>";
				echo "</table>";
				echo "</body></html>";
			//echo "</font>";
		}
 	}					
	function show($row) {
		echo "<table width = 100% border = 0 cellpadding=0 cellspacing=0 class = text >";			
		$dateM = date(m);
		$dateD = date(d);
		while($show = mysql_fetch_row($row)) {
			$date_array = explode("/",$show[2]);
			if($dateM <= $date_array[2] and $dateD <= $date_array[1]) {
				echo "<tr bgcolor=CCCCCC>";
				echo "<td nowrap>&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"Picture/headnew.gif\" width=14 			height=13> &nbsp; ";
				//echo "<a href =\"javascript:%20void%20window.open('Headline.php?id=$show[0]','Detail',' width=770,heigth=500,location=yes,menubar=yes,toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=5,left=10');\">$show[1]</a></td>";
				echo "<a href=\"Headline.php?id=$show[0]\" target=_blank >$show[1]</a></td>";	
				echo "</tr>";
			}	
		}	echo "</table>";
	}
	
	function showall($row) {
		echo "<html><head><title>Detail News</title>";
		echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">";
		echo "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">";
		echo "</head>";
		echo "<body leftmargin=\"0\" topmargin=\"0\">";
	?>
	<table width="776" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="#" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr valign="top">
    <td width="100%"  valign="top" height="100%">
	<?php
		echo "<br>";
		echo "<table width = 95% border = 0 cellpadding=0 cellspacing=1 class = text align=center ";
		echo "bgcolor=999999 bordercolor=CCCCCC bordercolordark=DDDDDD bordercolorlight=CCCCCC >";			
		echo "<tr class=text><th width=5% bgcolor=FFFFFF><img src=\"Picture/announce.gif\" width=20 height=20></th><th width=20% bgcolor=99AAFF>ประกาศวันที่</th><th bgcolor=99AAFF>เรื่อง</th></tr>";
		while($show = mysql_fetch_row($row)) {
			echo "<tr><td bgcolor=FFFFFF align=center><img src=\"Picture/new.gif\" ";
			echo " width=12 height=12 align=\"absmiddle\" ></td><td bgcolor=EEEEEE>";
			echo "<font color=EE2222>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$show[3]</font></td>";
			echo "<td bgcolor=EEEEEE nowrap>&nbsp;&nbsp;&nbsp;<a href =\" ";
			//echo "javascript:%20void%20window.open('Headline.php?id=$show[0]','Detail',' width=770,heigth=500,location=yes,menubar=yes,toolbar=yes,scrollbars=yes,status=yes,resizable=yes,top=5,left=10');\">$show[1]</a></td>";
			echo "Headline.php?id=$show[0]\" target=_blank>$show[1]</a></td>";
			echo "</tr>";
		}	
		echo "</table>";
		//echo "</body></html>";
		?>
	</td>
  </tr>
 </table>
 <?php
		echo "</font>";
	}
?>
