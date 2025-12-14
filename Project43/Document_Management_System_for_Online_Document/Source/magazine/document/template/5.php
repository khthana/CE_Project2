<?
	session_start();
   $hostname = "localhost";
   $username = "magazine";
   $password = "magazine";
   $dbName = "magazine";
   mysql_connect($hostname,$username,$password) or die("can not connect!");
	$read = "read_$article_id";
	if (${$read} != $article_id) {
		$sql = "update article set num_reader=num_reader+1 where art_id=$article_id";
		$SQLresult = mysql_db_query($dbName,$sql);
		${$read} = $article_id;
		session_register("$read");
	}
	if ($id_col == "")
	$id_col = "0";	//***	
?>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td height="86" align="left"><img src="../../image/my/logo1.jpg" width="60%" height="100"><img src="../../image/my/logo_article.jpg" width="40%" height="100"></td>
  </tr>
  <tr>
    <td height="86" align="left">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td valign="top" width="1%" rowspan="2"><img src="../../image/my/3/bg2_8.jpg" width="15" height="57"></td>
          <td valign="top" rowspan="2" width="17%"><img src="../../image/my/3/bg3_8.jpg" width="100%" height="57"></td>
          <td valign="top" rowspan="2" colspan="2" background="../../image/my/3/bg9_8.jpg"><img src="../../image/my/3/bg1_8.jpg" width="50" height="57"></td>
          <td height="2" valign="top" colspan="2"><img src="../../image/my/lhome_bg_8.jpg" width="100%" height="20"></td>
        </tr>
        <tr> 
          <td valign="middle" width="4%" align="right" height="30">&nbsp; </td>
          <td valign="middle" align="right" rowspan="2" width="73%"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right"> 
                  <form name="form1" method="post" action="../../search/searchBasicReader.php">
                    <table cellspacing=0 cellpadding=0 width="400" 
                  bgcolor=#dcedf5 border=0>
                      <tbody> 
                      <tr> 
                        <td align=center width=107><img height=10 
                        src="../../image/my/search_text.gif" 
                        width=57 border=0><br>
                        </td>
                        <td align=left width=98> 
                          <input size=20 name=keyword>
                        </td>
                        <td align=center width=40> 
                          <input type=image height=23 
                        width=29 
                        src="../../image/my/btn_gotosearch.gif" 
                        border=0 name="image">
                          <br>
                        </td>
                        <td align=center colspan="2" width=155><a href="../../search.php"><img 
                        height=10 alt="" 
                        src="../../image/my/search_advanced.gif" 
                        width=52 border=0 align="middle"></a> <img height=10 alt="" 
                        src="../../image/my/search_divider.gif" 
                        width=3 border=0 align=middle> <a 
                        href="../../search/search_tips.html"><img 
                        height=10 
                        src="../../image/my/search_tips.gif" 
                        width=59 
              border=0 align="middle"></a> </td>
                      </tr>
                      </tbody> 
                    </table>
                  </form>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td valign="top" width="1%"><img src="../../image/my/3/bg4_8.jpg" width="15" height="20"></td>
          <td valign="top" width="17%" bgcolor="#F49F9B"> 
            <table width="130" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
          </td>
          <td valign="top" colspan="2"><img src="../../image/my/3/bg5_8.jpg" width="50" height="20"></td>
          <td valign="middle" width="4%" align="right">&nbsp;</td>
        </tr>
        <tr> 
          <td valign="top" width="1%" height="7" background="../../image/my/3/bg4_8.jpg"><img src="../../image/my/3/bg4_8.jpg" width="15" height="20"></td>
          <td valign="top" height="7" width="17%" bgcolor="#F49F9B"> 
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
              <tr> 
                <td bgcolor="#003399" colspan="2" height="24"><b><font color="#FFFFFF" size="2" face="MS Sans Serif, CordiaUPC, AngsanaUPC">Main 
                  menu</font></b></td>
              </tr>
              <tr> 
                <td height="55"> <img src="../../image/my/column.gif" width="12" height="12"><font size="2"><a href="../../index.php?id_col=<?echo $id_col;?>"><font face="MS Sans Serif, CordiaUPC, AngsanaUPC" size="1">home</font></a></font><br>
                  <img src="../../image/my/column.gif" width="12" height="12"><font size="2"><a href="../../reader.php?id_col=<?echo $id_col;?>"><font size="1" face="MS Sans Serif, CordiaUPC, AngsanaUPC">articles</font></a><br>
                  <img src="../../image/my/column.gif" width="12" height="12"><font size="2"><a href="../../search.php?id_col=<?echo $id_col;?>"><font size="1" face="MS Sans Serif, CordiaUPC, AngsanaUPC">search</font></a></font> 
                  </font></td>
              </tr>
            </table>
            <br>
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
              <tr> 
                <td bgcolor="#003399" colspan="2" height="24"> 
                  <? //show column
	$sql = "select * from col where col_id = $id_col ";
	$SQLresult = mysql_db_query($dbName,$sql);
   $num = mysql_numrows($SQLresult);
   if ($num) {
      for ($i=1;$i<=$num;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "<b><font color=\"#FFFFFF\" size=\"2\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">".ucwords($row[col_name])." [ <a href=\"../../reader.php?id_col=$row[parent_col_id]\"><font size=\"1\" color=\"#FFFF00\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">Up</font></a> ]</font></b>";
		}
	}
	else {
		echo "<b><font color=\"#FFFFFF\" size=\"2\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">Column</font></b>";	
	}
?>
                </td>
              </tr>
              <tr> 
                <td> 
                  <?
	$sql = "select * from col where parent_col_id = $id_col order by col_name";
	$SQLresult = mysql_db_query($dbName,$sql);
		$num = mysql_numrows($SQLresult);
	if ($num) {
      for ($i=1;$i<=$num;$i++) {
  	      $row = mysql_fetch_array($SQLresult);
   		echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><font color=\"#FFFFFF\" size=\"1\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\"><a href=\"../../reader.php?id_col=$row[col_id]\">$row[col_name]</a></font><br>";
		}
	}
?>
                </td>
              </tr>
            </table>
            <form method="post" action="../../login.php">
              <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr> 
                  <td bgcolor="#003399" colspan="2" height="24"><b><font color="#FFFFFF" size="2" face="MS Sans Serif, CordiaUPC, AngsanaUPC">Member</font></b></td>
                </tr>
                <tr> 
                  <td> 
                    <?
	if ($logout=="true") {
		session_destroy();
		$member = "fail";
	}
	$sql = "select mem_password from member where mem_username = \"$user_name\"";
	$SQLresult = mysql_db_query($dbName,$sql);
   $num = mysql_numrows($SQLresult);
	echo "<font color=\"#0000FF\" size=\"1\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">";
   if ($num && $logout!="true") {
		$row = mysql_fetch_array($SQLresult);
		$password=crypt($row[mem_password],"mg");
		if($password==$crp_password) {
			$member = "true";
			if (strpos(" $user_types","A")) {
				if (!$function || $function=="column_admin")
					echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../../Admin/columnAdmin.php\">column managment</a><br>";
				if (!$function || $function=="member_admin")
					echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../../calendar/admin/adminpage.php\">member managment</a><br>";
				if (!$function || $function=="article_admin")
					echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../../Admin/articleAdmin.php\">article managment</a><br>";
			}
			if (strpos(" $user_types","W")) {
				echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../onweb/onweb.php\">create article on web</a><br>";
				echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../upload/upload.php\">create article by upload</a><br>";
				echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../edit_article/page_edit.php\">edit article</a><br>";
				echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../edit_article/delete.php\">delate article</a><br>";
			}
			echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../../calendar/welcome.php\">system calendar</a><br>";
			echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"../../index.php?logout=true\">logout</a><br>";
		}
		else
			$member = "fail";
	}
	if ($member!="true") {
		echo "
				  <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">
					 <tr> 
						<td>
						  <font color=\"#003399\" size=\"1\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">
						  User name :<br>
						  <input type=\"text\" name=\"loginUser\" size=\"12\"><br>
						  Password :<br>
						  <input type=\"password\" name=\"passwordUser\" size=\"12\">
						  </font>
						</td>
					 </tr>
					 <tr> 
						<td><a href=\"./calendar/member/mem_register1.php\"><font color=\"#FF0000\" size=\"2\">สมัครสมาชิกใหม่</font></a><br>&nbsp;</td>
					 </tr>
					 <tr> 
						<td> 
						  <font color=\"##003399\" size=\"1\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">
						  <input type=\"submit\" name=\"Submit\" value=\"Submit\">
						  <input type=\"reset\" name=\"Reset\" value=\"Reset\">
						  </font>
						</td>
					 </tr>
				  </table>
				";
	}
	echo "</font>";	
?>
                  </td>
                </tr>
              </table>
            </form>
            <?
	$str_sql = "select relate.relate_art_id from article,relate
					where article.art_id = relate.art_id and relate.art_id = '$article_id'";
	$result = mysql_db_query($dbName,$str_sql);
	$nf=mysql_num_rows($result);
	if ($nf) {
		echo "
				<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"100%\">
				  <tr> 
					 <td bgcolor=\"#003399\" colspan=\"2\" height=\"24\"> <b><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\" color=\"#FFFFFF\">
					 Relate Articles</font></b></td>
				  </tr>
				  <tr><td> ";
		for($line=1; $line<=$nf; $line++) {
			$row=mysql_fetch_array($result);
			$str_sql = "select * from article where art_id = '$row[0]' group by col_id";
			$result_relate = mysql_db_query($dbName,$str_sql);
			$relate_article = mysql_fetch_array($result_relate);
			$sql = "select * from col where col_id=$relate_article[col_id]";
			$SQLresult = mysql_db_query($dbName,$sql);
  			$row2 = mysql_fetch_array($SQLresult);
			echo "<font color=\"#000000\" face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\"> \n";
			echo "<img src=\"../../image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./$row2[template]?template=$row2[template]&location=$relate_article[location]&name=index.html&article_id=$relate_article[art_id]&id_col=$row2[col_id]\"><font color = #0000FF>$relate_article[art_name]</font></a><br>";
			echo "</font>";
		}
		echo "</td></tr></table><br>";
	}
//====================SELECT POLL =========================== 
	$str_sql= "select * from poll	where	art_id = '$article_id'";
	$result_poll = mysql_db_query($dbName,$str_sql);
	$nf=mysql_num_rows($result_poll);
	if ($nf) {
		echo "
			<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\" width=\"100%\"><tr> 
				 <td bgcolor=\"#003399\" colspan=\"2\" height=\"24\"> <b><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\" color=\"#FFFFFF\">Votes</font></b></td>
			  </tr><tr><td>";
		for ($poll = 1; $poll <= $nf; $poll++){
			$row=mysql_fetch_array($result_poll);
			$poll_id       = $row[0];
			$poll_question = $row[1];
			echo "<form method=\"post\" action=\"../../../document/poll/poll.php\" target = $poll_id> \n ";
			echo "<table width=\"150\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">  \n";
			echo "<tr> \n";
			echo " <td colspan=\"0\" align=\"left\"> \n";
			echo "<font color=\"#FF0000\" face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\"> \n";
			echo "  $poll_question <br>\n ";
			echo "</font> \n";
			echo "  </td> \n";
			echo "</tr> \n";
	//==========================SELECT CHOICE ===========================
			$str_sql= "select * from choice where poll_id = '$poll_id'";
			$result_choice = mysql_db_query($dbName,$str_sql);
			$num_choice = mysql_num_rows($result_choice);
			echo "<tr>";
			echo " <td colspan=\"0\" align=\"left\">";
			for ($number_choice = 1; $number_choice <= $num_choice; $number_choice++)
			{
				$row=mysql_fetch_array($result_choice);
				$choice = $row[1];
				echo " <font color=\"#000000\" face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"1\"> \n";
				echo " <input type=\"radio\" name=\"poll_ans\" value=\"$choice\">$choice <br>\n";
				echo "</font>";
			}
			echo "<input type=\"hidden\" name=\"poll_id\" value=\"$poll_id\">";
			echo "</td>";
			echo "<tr><td colspan=\"0\" align=\"right\"><input type=\"submit\" value=\"VOTE\" name=\"VOTE\"></td></tr>";
			echo "</table></form>";
		}
		echo "</td></tr></table><br>";
	}
?>
          </td>
          <td valign="top" height="7" width="1%" background="../../image/my/3/bg7_8.jpg"><img src="../../image/my/3/bg7_8.jpg" width="15" height="20"></td>
          <td valign="top" height="7" colspan="3"> 
            <table border="0" width="100%" cellpadding="2" cellspacing="2">
              <tr> 
                <td height="18"> 
                  <?
	$list = "";
	$pointer = $id_col;
	$stop = "false";
	while ($stop != "true") {
		$sql = "select * from col where col_id = $pointer order by col_name";
		$SQLresult = mysql_db_query($dbName,$sql);
		if ($SQLresult)
			$num = mysql_numrows($SQLresult);
		if ($num) {
			$row = mysql_fetch_array($SQLresult);
			if ($row[col_id] == $id_col)
				$list = ucwords("$row[col_name] :");
			else
			   $list = "<a href=\"../../reader.php?id_col=$row[col_id]\">".ucwords($row[col_name])."</a> &gt; $list";
			$pointer = $row[parent_col_id];
		}
		else {
			if ($list)
				$list = "<a href=\"../../reader.php\">Column</a> &gt; $list";
			else
				$list = "Column : ";
			$stop = "true";
		}
	}
	$list = "<a href=\"../../index.php\">Home</a> &gt; $list";
	echo "<b><font size=\"4\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">$list</font></b>";
?>
                </td>
              </tr>
            </table>
            <table width="100%" cellspacing="10" cellpadding="0">
              <tr align="left" valign="top"> 
                <td height="52"> 
                  <?
	$sql = "select art_id,art_name,art_status from article where art_id=$article_id";
	$SQLresult = mysql_db_query($dbName,$sql);
   	$num = mysql_numrows($SQLresult);
   	if ($num) {
		$row = mysql_fetch_array($SQLresult);
		echo "<p><font color=\"#FF0000\" face=\"MS Sans Serif, Microsoft Sans Serif\" size=\"3\"><b>$row[art_name]</b></font></p>";
	}
//=============== data article============
	echo "<p>";
	$source = fopen("../../$location".$name,"r");
	if ($source) {
		while (!feof($source)) {
	 		$buffer = fgets($source, 4096);
			while (strpos(" $buffer","  "))
				$buffer = str_replace("  "," ",$buffer);
			while (strpos(" $buffer","src ="))
				$buffer = str_replace("src =","src=",$buffer);
			while (strpos(" $buffer","= \""))
				$buffer = str_replace("= \"","=\"",$buffer);				
			$buffer2 = $buffer;
			while (strpos(" $buffer2","src=\"") > 0) {
				$pt = strpos(" $buffer2","src=\"");
			// find search string.
				$str_search = substr($buffer2,$pt);
				$pt = strpos(" $str_search","\"");
				$str_search = substr($str_search,$pt);
				$buffer2 = $str_search;
				$pt = strpos(" $str_search","\"");
				$str_search = substr($str_search,0,$pt-1);
			// find replace string.
				$str_replace = "../../$location".$str_search;
			// replace href.
				while (strpos(" $buffer","src=\"$str_search"))
					$buffer = str_replace("src=\"$str_search","src=\"$str_replace",$buffer);
			}
			while (strpos(" $buffer","  "))
				$buffer = str_replace("  "," ",$buffer);
			while (strpos(" $buffer","href ="))
				$buffer = str_replace("href =","href=",$buffer);
			while (strpos(" $buffer","= \""))
				$buffer = str_replace("= \"","=\"",$buffer);				
			$buffer2 = $buffer;
			while (strpos(" $buffer2","href=\"") > 0) {
				$pt = strpos(" $buffer2","href=\"");
			// find search string.
				$str_search = substr($buffer2,$pt);
				$pt = strpos(" $str_search","\"");
				$str_search = substr($str_search,$pt);
				$buffer2 = $str_search;
				$pt = strpos(" $str_search","\"");
				$str_search = substr($str_search,0,$pt-1);
			// find replace string.
				$str_replace = "./$template?template=$template&location=$location&name=$str_search&article_id=$article_id";
			// replace href.
				while (strpos(" $buffer","href=\"$str_search"))
					$buffer = str_replace("href=\"$str_search","href=\"$str_replace",$buffer);
			}
			$article = $article.$buffer;
		}
		echo "<font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\" color=\"#000000\">$article</font>";
	}
	fclose ($source);
	//========================================
	echo "</p>";
	if ($row[art_status]=='N') {
		echo "
			<table width=\"100%\" border=\"0\">
			  <tr> 
				<td width=\"71%\">&nbsp;</td>
				<td width=\"13%\" align=\"center\"> 
				  <form name=\"form1\" method=\"post\" action=\"../../Admin/checkStatus?art_id=$row[art_id]&status=A\">
					<input type=\"submit\" name=\"Submit1\" value=\"Approved\">
				  </form>
				</td>
				<td width=\"16%\" align=\"center\"> 
				  <form name=\"form2\" method=\"post\" action=\"../../Admin/checkStatus?art_id=$row[art_id]&status=F\">
					<input type=\"submit\" name=\"Submit2\" value=\"Not approved\">
				  </form>
				</td>
			  </tr>
			</table>
			";
	}	
?>
                  <hr>
                  <?
	$id_link = mysql_connect('localhost','magazine','magazine');
	if (!$id_link) {
		affy_message(" The connection to the local database has failed.
		Please enter a username and password so a connection can be made." );
	}
	else {
//====================SELECT question =========================== 
		$str_sql= "	select  * 
				from   	opinion
				where	art_id = '$article_id'
				";
		$result_question = mysql_db_query (magazine,$str_sql,$id_link);
		$nf=mysql_num_rows($result_question);
		if ($nf) {
			echo "
		  		<p><font color=\"#ff0000\" size=\"2\" face=\"MS Sans Serif, Microsoft Sans Serif\"><b>คำถามท้ายบทความ</b></font></p>
		  		<p><font color=\"#330099\">";
			for ($num_question = 1; $num_question <= $nf; $num_question++) {
				$row=mysql_fetch_array($result_question);
				$op_id = $row[0];
				$op_question = $row[1];
				echo "<font color=\"#ff0000\" size=\"2\" face=\"MS Sans Serif, Microsoft Sans Serif\" color=\"#FF0000\"> \n";
				echo "<a href = \"../../../document/question/opinion.php?op_id=$op_id\" target=$op_id><font color = #0000FF > $op_question</font> </a> <br>\n ";
				echo "</font> \n";
			}		
			echo "</font></p>";
		}
	}
?>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td valign="top" height="5" width="1%"><img src="../../image/my/3/bg11_8.jpg" width="15" height="22"></td>
          <td valign="top" height="5" width="17%"><img src="../../image/my/3/bg12_8.jpg" width="100%" height="22"></td>
          <td valign="top" height="5" width="1%"><img src="../../image/my/3/bg10_8.jpg" width="15" height="22"></td>
          <td valign="top" height="5" colspan="3">&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
