<? session_start();
	$user_type = "R";
	session_unregister("user_type");
	session_register("user_type");
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
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td height="86" align="left"><img src="image/my/logo1.jpg" width="60%" height="100"><img src="image/my/logo2.3.jpg" width="40%" height="100"></td>
  </tr>
  <tr>
    <td height="86" align="left" valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td valign="top" width="1%" rowspan="2"><img src="image/my/3/bg2.jpg" width="15" height="57"></td>
          <td valign="top" rowspan="2" width="17%"><img src="image/my/3/bg3.jpg" width="100%" height="57"></td>
          <td valign="top" rowspan="2" colspan="2" background="image/my/3/bg9.jpg"><img src="image/my/3/bg1.jpg" width="50" height="57"></td>
          <td height="2" valign="top" colspan="2"><img src="image/my/lhome_bg.jpg" width="100%" height="20"></td>
        </tr>
        <tr> 
          <td valign="middle" width="5%" align="right" height="30">&nbsp; </td>
          <td valign="middle" align="right" rowspan="2" width="72%"> 
            <table width="550" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right"> 
                  <form name="form1" method="post" action="search/searchBasic.php"R"">
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
                        href="http://www.vstore.com/cgi-bin/pagegen/vstorelibrary/hodgepodgebooks/page.html?mode=home&amp;file=/page/search/search_tips.spl"><img 
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
          <td valign="top" width="1%"><img src="image/my/3/bg4.jpg" width="15" height="20"></td>
          <td valign="top" width="17%" bgcolor="#00FFFF"> 
            <table width="130" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
          </td>
          <td valign="top" colspan="2"><img src="image/my/3/bg5.jpg" width="50" height="20"></td>
          <td valign="middle" width="5%" align="right">&nbsp;</td>
        </tr>
        <tr> 
          <td valign="top" width="1%" height="7" background="image/my/3/bg4.jpg"><img src="image/my/3/bg4.jpg" width="15" height="20"></td>
          <td valign="top" height="7" width="17%" bgcolor="#00FFFF"> 
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
              <tr> 
                <td bgcolor="#003399" colspan="2" height="24"><b><font color="#FFFFFF" size="2" face="MS Sans Serif, CordiaUPC, AngsanaUPC">Main 
                  menu</font></b></td>
              </tr>
              <tr> 
                <td> <img src="image/my/column.gif" width="12" height="12"><font size="2"><a href="reader.php?id_col=<?echo $id_col;?>"><font face="MS Sans Serif, CordiaUPC, AngsanaUPC" size="1">articles</font></a><br>
                  <img src="image/my/column.gif" width="12" height="12"><font size="2"><a href="search.php?id_col=<?echo $id_col;?>"><font face="MS Sans Serif, CordiaUPC, AngsanaUPC" size="1">search</font></a></font> 
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
          <td valign="top" height="7" width="1%" background="image/my/3/bg7.jpg"><img src="image/my/3/bg7.jpg" width="15" height="20"></td>
          <td valign="top" height="7" colspan="3"> 
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr> 
                <td background="image/my/head_bg.jpg" height="13"><b><font size="3" face="MS Sans Serif, CordiaUPC, AngsanaUPC">Welcome</font></b></td>
              </tr>
              <tr> 
                <td> 
                  <p><font face="MS Sans Serif, CordiaUPC, AngsanaUPC" size="2">ขณะนี้แมกกาซีนออน์ไลนเสร็์จแล้วนะครับ 
                    หลายคนอาจสงสัยว่า document online คืออะไร ซึ่งมันก็คือ ระบบการจัดการเอกสารบนเว็บไซต์นั่นเอง 
                    โดยจะมีสามารถในเรื่องการ สร้างเอกสารโดยการสร้างบนเว็บหรืออัพโหลด 
                    และยังมีความสามารถ ค้นหาเอกสาร, แก้ไขเอกสาร, ลบเอกสาร, และ 
                    แสดงเอกสาร นอกจากนี้ยังมีความสามารถในเรื่องของการจัดการ column 
                    โดยสามารถเพิ่ม, แก้ไข, และลบ column ได้และยังสามารถทำการเปลี่ยน 
                    template ของเอกสารได้อีกด้วย<font color="#330066"> (22 March 
                    2001,จัดทำโดย นาย ธานี รักษาสุธี และ นาย วรเชษฐ์ ทรัพย์สมบูรณ์)<br>
                    </font><font color="#330066"></font> </font></p>
                </td>
              </tr>
              <tr> 
                <td background="image/my/head_whatnews2.jpg" height="15"><b><font face="MS Sans Serif, CordiaUPC, AngsanaUPC">What's 
                  new</font></b></td>
              </tr>
              <tr> 
                <td> 
                  <?
	$sql = "select art_id,art_name,abstract,location,last_update,p1.col_id,template from article p1,col p2 where p1.col_id=p2.col_id order by last_update desc";
	$SQLresult = mysql_db_query($dbName,$sql);
   $num = mysql_num_rows($SQLresult);
   if ($num) {
		$SQLresult = mysql_db_query($dbName,$sql);	
		$num = mysql_num_rows($SQLresult);	
      for ($i=1;$i<=$num && $i<=10;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "<font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\"><font color=\"#003399\"> [$row[last_update]] </font><a href=\"./document/template/$row[template]?template=$row[template]&location=$row[location]&name=index.html&article_id=$row[art_id]&id_col=$row[col_id]\">$row[art_name]</a> ; $row[abstract]</front><br>";
		}
	}
?>
                  &nbsp;</td>
              </tr>
              <tr> 
                <td background="image/my/head_bg.jpg"><b><font face="MS Sans Serif, CordiaUPC, AngsanaUPC">Top 
                  10</font></b></td>
              </tr>
              <tr> 
                <td> 
                  <?
	$sql = "select art_id,art_name,abstract,location,last_update,num_reader,p1.col_id,template from article p1,col p2 where p1.col_id=p2.col_id order by num_reader desc";
	$SQLresult = mysql_db_query($dbName,$sql);
   $num = mysql_num_rows($SQLresult);
   if ($num) {
      for ($i=1;$i<=$num && $i<=10;$i++) {
			$row = mysql_fetch_array($SQLresult);
			echo "<font face=\"MS Sans Serif, CordiaUPC, AngsanaUPC\" size=\"2\">$i. <a href=\"./document/template/$row[template]?template=$row[template]&location=$row[location]&name=index.html&article_id=$row[art_id]&id_col=$row[col_id]\">$row[art_name]</a> ($row[num_reader])</front><br>";
		}
	}
?>
                  &nbsp;</td>
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
    </td>
  </tr>
</table>
</body>
</html>
