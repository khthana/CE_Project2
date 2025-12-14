<?	session_start();
   $hostname = "localhost";
   $username = "magazine";
   $password = "magazine";
   $dbName = "magazine";
   mysql_connect($hostname,$username,$password) or die("can not connect!");
	if ($id_col == "")
	$id_col = "0";	//***
?>
<html>
<head>
<title>Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td height="86" align="left"><img src="image/my/logo1.jpg" width="60%" height="100"><img src="image/my/logo_search.jpg" width="40%" height="100"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td valign="top" width="1%" rowspan="2"><img src="image/my/3/bg2.jpg" width="15" height="57"></td>
    <td valign="top" rowspan="2" width="17%"><img src="image/my/3/bg3.jpg" width="100%" height="57"></td>
    <td valign="top" rowspan="2" colspan="2" background="image/my/3/bg9.jpg"><img src="image/my/3/bg1.jpg" width="50" height="57"></td>
    <td height="2" valign="top" colspan="2"><img src="image/my/lhome_bg.jpg" width="100%" height="20"></td>
  </tr>
  <tr> 
    <td valign="middle" width="12%" align="right" height="30">&nbsp; </td>
    <td valign="middle" align="right" rowspan="2" width="57%"> 
      <table width="550" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="right"> 
            <form name="form1" method="post" action="search/searchBasic.php">
              <table cellspacing=0 cellpadding=0 width="400" 
                  bgcolor=#dcedf5 border=0>
                <tbody> 
                <tr> 
                  <td align=center width=97><img height=10 
                        src="image/my/search_text.gif" 
                        width=57 border=0><br>
                  </td>
                  <td align=left width=108> 
                    <input size=20 name=keyword>
                  </td>
                  <td align=center width=40> 
                    <input type=image height=23 
                        width=29 
                        src="image/my/btn_gotosearch.gif" 
                        border=0 name="image">
                    <br>
                  </td>
                  <td align=center colspan="2" width=155><a href="search.php"><img 
                        height=10 alt="" 
                        src="image/my/search_advanced.gif" 
                        width=52 border=0 align="middle"></a> <img height=10 alt="" 
                        src="image/my/search_divider.gif" 
                        width=3 border=0 align=middle> <a 
                        href="../search/search_tips.html"><img 
                        height=10 
                        src="image/my/search_tips.gif" 
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
    <td valign="top" width="1%" background="image/my/3/bg4.jpg">&nbsp;</td>
    <td valign="top" width="17%" bgcolor="#00FFFF"> 
      <table width="130" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
    <td valign="top" colspan="2"><img src="image/my/3/bg5.jpg" width="50" height="20"></td>
    <td valign="middle" width="12%" align="right">&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top" width="1%" height="7" background="image/my/3/bg4.jpg">&nbsp;</td>
    <td valign="top" height="7" width="17%" bgcolor="#00FFFF"> 
      <table border="0" cellspacing="0" cellpadding="3" width="100%">
        <tr> 
          <td bgcolor="#003399" colspan="2" height="24"><b><font color="#FFFFFF" size="2" face="MS Sans Serif, CordiaUPC, AngsanaUPC">Main 
            menu</font></b></td>
        </tr>
        <tr> 
          <td> <img src="image/my/column.gif" width="12" height="12"><font size="2"><a href="index.php?id_col=<?echo $id_col;?>"><font face="MS Sans Serif, CordiaUPC, AngsanaUPC" size="1">home</font></a><br>
            <img src="image/my/column.gif" width="12" height="12"><font size="2"><a href="reader.php?id_col=<?echo $id_col;?>"><font face="MS Sans Serif, CordiaUPC, AngsanaUPC" size="1">articles</font></a></font></font></td>
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
			echo "<b><font color=\"#FFFFFF\" size=\"2\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">".ucwords($row[col_name])." [ <a href=\"reader.php?id_col=$row[parent_col_id]\"><font size=\"1\" color=\"#FFFF00\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">Up</font></a> ]</font></b>";
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
   		echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><font color=\"#FFFFFF\" size=\"1\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\"><a href=\"reader.php?id_col=$row[col_id]\">$row[col_name]</a></font><br>";
		}
	}
?>
          </td>
        </tr>
      </table>
      <form method="post" action="login.php">
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
					echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./Admin/columnAdmin.php\">column managment</a><br>";
				if (!$function || $function=="member_admin")
					echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./calendar/admin/adminpage.php\">member managment</a><br>";
				if (!$function || $function=="article_admin")
					echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./Admin/articleAdmin.php\">article managment</a><br>";
			}
			if (strpos(" $user_types","W")) {
				echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./document/onweb/onweb.php\">create article on web</a><br>";
				echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./document/upload/upload.php\">create article by upload</a><br>";
				echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./document/edit_article/page_edit.php\">edit article</a><br>";
				echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./document/edit_article/delete.php\">delate article</a><br>";
			}
			echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./calendar/welcome.php\">system calendar</a><br>";
			echo "<img src=\"./image/my/column.gif\" width=\"12\" height=\"12\"><a href=\"./index.php?logout=true\">logout</a><br>";
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
    </td>
    <td valign="top" height="7" width="1%" background="image/my/3/bg7.jpg">&nbsp;</td>
    <td valign="top" height="7" colspan="3" align="center"> 
      <table border="0" width="100%" cellpadding="2" cellspacing="2">
        <tr> 
          <td background="image/my/head_bg.jpg" height="13"> <font size="4">Search</font></td>
        </tr>
      </table>
      <?session_start();
//	echo $sqlcon;
   $cut = "{page$numPage"."}";
   $result = $searchResult;
   $cutStart = strpos($result,$cut)+7;
   $result = substr($result,$cutStart);
   $prePage = $numPage-1;
   $nextPage = $numPage+1;
   $cut = "{page$nextPage"."}";
   $cutEnd = strpos($result,$cut);
   $result = substr($result,0,$cutEnd);
   if ($prePage>=1)
      $prePage = "<a href=\"./search.php?numPage=$prePage\">&lt; Pre page</a>";
	else $prePage = "";
   if ($nextPage<=$maxPage)
      $nextPage = "<a href=\"./search.php?numPage=$nextPage\">Next page &gt; </a>";
	else $nextPage = "";
	$curPage = "Page of";
	for ($i=1;$i<=$maxPage;$i++) {
      if ($i == $numPage)
         $curPage = "$curPage $i";
      else
         $curPage = "$curPage<a href=\"./search.php?numPage=$i\"> $i</a>";
   }
	session_unregister("prePage");
	session_register("prePage");
	session_unregister("nextPage");
	session_register("nextPage");
	session_unregister("curPage");
	session_register("curPage");
	if ($numPage != "") {
		if ($result == "")
			$result = "<b>Find not found!</b>";
		echo "
            <table width=\"98%\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bgcolor=\"#F6F6F6\" bordercolor=\"#CCCCCC\">
              <tr bgcolor=\"#CCCCCC\"> 
                <td colspan=\"3\"><b><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">
					 ค้นหาพบ $numMax รายการ ( หน้าที่ $numPage )</font></b></td>
              </tr>
              <tr> 
                <td align=\"center\">$prePage &nbsp; | &nbsp; $curPage &nbsp; | &nbsp; $nextPage</td>
              </tr>
              <tr> 
                <td colspan=\"3\"><font size=\"2\" face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">$result</font></td>
              </tr>
              <tr> 
                <td align=\"center\">$prePage &nbsp; | &nbsp; $curPage &nbsp; | &nbsp; $nextPage</td>
              </tr>
            </table>";
	}
	if ($numPage != "") {
		echo "
				<table width=\"98%\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\" bgcolor=\"#F6F6F6\" bordercolor=\"#CCCCCC\">
				  <tr bgcolor=\"#CCCCCC\"> 
					 <td colspan=\"3\"><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\"><b>เงื่อนไขการค้นหา : </b></font></td>
				  </tr>
				  <tr>
					 <td colspan=\"3\"><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\">$searchCon</font></td>
				  </tr>
				</table>";
	}
?>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <form method="post" action="./search/searchAdvance.php">
              <table width="100%" border="1" cellspacing="0" cellpadding="3" bordercolor="#CCCCCC" bgcolor="#F7F7F7">
                <tr> 
                  <td width="43%" valign="top"> <font face="MS Sans Serif, CordiaUPC, AngsanaUPC" color="#000000">คำ</font><font face="MS Sans Serif, CordiaUPC, AngsanaUPC">ที่เกี่ยวข้อง 
                    : </font><br>
                    <i> 
                    <input type="text" name="keyword" size="38">
                    <br>
                    </i><font face="MS Sans Serif, CordiaUPC, AngsanaUPC">ชื่อบทความ 
                    :</font><br>
                    <input type="text" name="title" size="38">
                    <br>
                    <font face="MS Sans Serif, CordiaUPC, AngsanaUPC">บทคัดย่อ 
                    :</font><br>
                    <input type="text" name="abstract" size="38">
                    <br>
                    <font face="MS Sans Serif, CordiaUPC, AngsanaUPC">ผู้เขียน 
                    :</font><br>
                    <font face="MS Sans Serif, CordiaUPC, AngsanaUPC">ชื่อ</font><font size="2"> 
                    <input type="text" name="fauthor" size="10">
                    </font><font face="MS Sans Serif, CordiaUPC, AngsanaUPC">นามสกุล<font size="2"> 
                    </font></font><font size="2"> 
                    <input type="text" name="lauthor" size="14">
                    </font></td>
                  <td width="57%" valign="top"><font face="MS Sans Serif, CordiaUPC, AngsanaUPC">วันที่เขียนบทความ 
                    :</font> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="3">
                      <tr> 
                        <td width="20%"><font size="2" face="MS Sans Serif, CordiaUPC, AngsanaUPC">หลังวันที่</font><font size="2"></font></td>
                        <td colspan="2" width="80%"> 
                          <?session_start();
   echo "<select name=\"dateIni\">";
	for ($i=1;$i<=31;$i++) {
		echo "<option value=\"$i\"";
		if ($dateIni == $i)
			echo " selected ";
		echo ">$i</option>";
	}
   echo "</select>";
	session_unregister("dateIni");
// ------------------------------------	
	$month_name = array("-","January","Febuary","March","April","May","June","July","Augus","September","October","November","December");
	echo "<select name=\"monthIni\">";
	for ($i=1;$i<=12;$i++) {
		echo "<option value=\"$i\"";
		if ($monthIni == $i)
			echo " selected ";
		echo ">$month_name[$i]</option>";
	}
   echo "</select>";
	session_unregister("monthIni");
// ------------------------------------
	$today = getdate();
   echo "<select name=\"yearIni\">";
	echo "<option value=\"0\"";
	if ($yearIni == 0)
		echo " selected";
	echo ">--</option>";
	for ($i=0;$i<=9;$i++) {
		$year = $today[year]-$i;
		echo "<option value=\"$year\"";
		if ($yearIni == $year)
			echo " selected";
		echo ">$year</option>";
	}
   echo "</select>";
	session_unregister("yearIni");
?>
                        </td>
                      </tr>
                      <tr> 
                        <td width="20%"><font size="2" face="MS Sans Serif, CordiaUPC, AngsanaUPC">ก่อนวันที่</font><font size="2"></font></td>
                        <td colspan="2" width="80%"> 
                          <?session_start();
   echo "<select name=\"dateDes\">";
	for ($i=1;$i<=31;$i++) {
		echo "<option value=\"$i\"";
		if ($dateDes == $i)
			echo " selected ";
		echo ">$i</option>";
	}
   echo "</select>";
	session_unregister("dateDes");
// ------------------------------------	
	$month_name = array("-","January","Febuary","March","April","May","June","July","Augus","September","October","November","December");
	echo "<select name=\"monthDes\">";
	for ($i=1;$i<=12;$i++) {
		echo "<option value=\"$i\"";
		if ($monthDes == $i)
			echo " selected ";
		echo ">$month_name[$i]</option>";
	}
   echo "</select>";
	session_unregister("monthDes");
// ------------------------------------
	$today = getdate();
   echo "<select name=\"yearDes\">";
	echo "<option value=\"0\"";
	if ($yearDes == 0)
		echo " selected";
	echo ">--</option>";
	for ($i=0;$i<=9;$i++) {
		$year = $today[year]-$i;
		echo "<option value=\"$year\"";
		if ($yearDes == $year)
			echo " selected";
		echo ">$year</option>";
	}
   echo "</select>";
	session_unregister("yearDes");
?>
                        </td>
                      </tr>
                    </table>
                    <font face="MS Sans Serif, CordiaUPC, AngsanaUPC">หัวข้อบทความ 
                    :</font><br>
                    <? //show column
	session_start();
	$sql = "select col_name from col p1,article p2 where p1.col_id = p2.col_id group by col_name";
	$SQLresult = mysql_db_query($dbName,$sql);
   if ($SQLresult)
      $num = mysql_numrows($SQLresult);
   if ($num) {
		echo "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
      for ($i=1;$i<=$num;$i=$i=$i+2) {
			echo "<tr>";
			for ($i2=$i;$i2<$i+2 && $i2<=$num;$i2++) {
				echo "<td width=\"50%\"> <font size=\"2\">";
				$row = mysql_fetch_array($SQLresult);
				echo "<input type=\"checkbox\" name=\"$row[col_name]\" value=\"checkbox\"";
				if (${$row[col_name]}) 
					echo "checked";
				echo ">";
				echo "$row[col_name]";
				echo "</font></td>";
				session_unregister("$row[col_name]");
			}
			echo "</tr>";
		}
		echo "</table>";
	}
?>
                    <font face="MS Sans Serif, CordiaUPC, AngsanaUPC"><br>
                    จำนวนผู้อ่านบทความ : </font> 
                    <?								 
	session_start();
	echo "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"100%\"><tr>";
	echo "<td width=\"33%\"><input type=\"checkbox\" name=\"hight\" value=\"checkbox\"";
	if ($hight)
		echo " checked";
	echo "><font size=\"2\"><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\">สูง</font></font></td>";
   echo "<td width=\"33%\"><input type=\"checkbox\" name=\"middle\" value=\"checkbox\"";
	if ($middle)
		echo "checked";
	echo "><font size=\"2\"><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\">ปานกลาง</font></font></td>";
   echo "<td width=\"34%\"><input type=\"checkbox\" name=\"low\" value=\"checkbox\"";
	if ($low)
		echo " checked";
	echo "><font size=\"2\"><font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"3\">น้อย</font></font></td>";
	echo "</tr></table>";
	session_unregister("hight");
	session_unregister("middle");
	session_unregister("low");
?>
                  </td>
                </tr>
                <tr valign="bottom" align="right"> 
                  <td colspan="2" height="19"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="43%"><font face="MS Sans Serif, CordiaUPC, AngsanaUPC">แบ่งหน้าละ: 
                          <?
	session_start();
	echo "<select name=\"listNum\">";
	for ($i=5;$i<=50;$i=$i+5) {
   	echo "<option value=\"$i\"";
		if ($listNum == $i)
			echo " selected";
		echo ">$i</option>";
	}
   echo "</select>";
	session_unregister("listNum");
?>
                          บทความ / หน้า</font></td>
                        <td width="57%" align="right"> 
                          <input type="submit" name="Submit2" value="ค้นหา">
                          <input type="reset" name="Submit2" value="Reset">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td valign="top" height="5" width="1%"><img src="image/my/3/bg11.jpg" width="15" height="22"></td>
    <td valign="top" height="5" width="17%"><img src="image/my/3/bg12.jpg" width="100%" height="22"></td>
    <td valign="top" height="5" width="1%"><img src="image/my/3/bg10.jpg" width="15" height="22"></td>
    <td valign="top" height="5" colspan="3">&nbsp; </td>
  </tr>
</table>
</body>
</html>
