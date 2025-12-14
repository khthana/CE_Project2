<?
//---------------------------------------------------- showheader ----------------------------------------------
	function showheader($str){
?>
<html>
<head>
<?	
echo "<title>$str</title>";
?>
<link rel="stylesheet" href="stylesheet.css"></head>
<body topmargin="1" leftmargin="1">
<table border="2" bordercolorlight="#000000" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" width="100%">
<tr align="left">
<td width="100%" colspan="2"><img border="0" src="../image/logo.jpg" width="775" height="90"></td>
</tr>
<?
}
//---------------------------------------------------- topmenu ----------------------------------------------
function topmenu($str){
?>
<tr>
<td colspan="2">
<table border="0" cellpadding="0" cellspacing="0" bordercolor="#111111" width="100%">
<tr>
<?
echo $str;
?>
</tr>
</table>
</td>
</tr>
<?
}
//---------------------------------------------------- sidemenu ----------------------------------------------
function sidemenu($str){
?>
<tr>
<td rowspan="2" width="10%" bgcolor="#CCCCCC" valign="top">
<table border="0" cellpadding="0" cellspacing="0" bordercolor="#111111" width= "100%">
<?
echo $str;
?>
</table>
</td>
<?
}
//---------------------------------------------------- showcontent ----------------------------------------------
function showcontent($str){
?>
<td width="75%" align="center"><br>
<?	
switch($str){
case 'login_form':
login_form();
break;
case 'group_form':
group_form();
break;
case 'news_form':
news_form();
break;
case 'news_list':
news_list();
break;
case 'news_body':
news_body();
break;
default:
echo $str;
break;
}
?>
</td>
</tr>
<?
	}
//---------------------------------------------------- showfooter ----------------------------------------------
	function showfooter($str){
?>
<tr>
	<td bgcolor="#CCCCC" align="center">
<?
		switch($str){
			case 'confirm':
				confirm();
				break;
			default:
				echo "<font face=\"MS Sans Serif\" size=\"1\">$str</font>";
				break;
		}
?>
	</td>
</tr>
</table>
</body>
</html>
<?
	}
//---------------------------------------------------- hori_menu ----------------------------------------------
	function hori_menu($menu,$color){
		$str = "<td bgcolor=\"$color\" align=\"right\"><font face=\"MS Sans Serif\" size=\"2\">";
		for($i = 0;$i < count($menu);$i++){
			$j = 0;
			if($i != 0)
				$str .= " | ";
			$str .= "<a class=\"set1\" href=\"".$menu[$i][$j]."\">".$menu[$i][++$j]."</a>";
		}
		$str .= "&nbsp;</font></td>\n";
		return $str;
	}
//---------------------------------------------------- vert_menu ----------------------------------------------
	function vert_menu($menu){
		$str = "";
		for($i = 0;$i < count($menu);$i++){
			$j = 0;
			$str .= "<tr><td align=\"center\"><font face=\"MS Sans Serif\" size=\"2\"><a class=\"set2\" href=\"".$menu[$i][$j]."\">";
			$str .= $menu[$i][++$j]."</a></font></td></tr>\n";
		}
		return $str;
	}
//---------------------------------------------------- news_body ----------------------------------------------
	function news_body(){
		$listid = getid();
		if(isset($listid))
			$query = "select headline,image,content,fname from news,writer where news.gid='$listid' and writer.uname=news.writer order by modified desc";
		else{
			$query = "select gname,image,headline,modified,news.gid from newsgroup,news where latest='1' and news.gid=newsgroup.gid order by newsgroup.gid asc";
			$link = 1;
		}
		$result = action("get_data",$query);
		while($row = mysql_fetch_array($result)){
?>
	<table border="0" cellpadding="0" cellspacing="2" width="90%">
		<tr>
			<td colspan="2" align="left" bgcolor="#CCCCCC"><font face="Microsoft Sans Serif" size="2" color="red"><? echo $row[0]; ?></font></td>
		</tr>
		<tr>
			<td rowspan="3" width="30%" valign="top"><?
			if(!empty($row[1])){
				echo "<img src=\"resize.php?file=$row[1]\">";
			}	
?></td>
			<td width="70%" valign="top"><font face="Microsoft Sans Serif" size="2"><? echo nl2br($row[2]); ?></font></td>
		</tr>
		<tr>
			<td align="right" valign="top"><i><font face="Microsoft Sans Serif" size="2"><? echo $row[3]; ?></font></i></td>
		</tr>
		<tr>
			<td align="right" valign="top"><?
			if(!empty($link))
				echo "<font face=\"Microsoft Sans Serif\" size=\"2\"><a class=\"set3\" href=\"news.php?cm=read&gid=$row[4]\">ดูรายละเอียด...</a></font>";
?></td>
		</tr>
	</table>
<?
		}
		mysql_free_result($result);
	}
//---------------------------------------------------- login_form ----------------------------------------------
	function login_form(){
?>
	<form method="POST" action="news.php?cm=login">
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="80%">
		<tr>
		  <td width="100%" colspan="2" align="right" bgcolor="#EEEEEE"><font face="Microsoft Sans Serif" size="2" color="#A1A1A1">:: <? echo gettitle() ?> :: &nbsp;</font></td>
		</tr>
		<tr>
		  <td width="37%" bgcolor="#CCCCCC" align="right"><font face="MS Sans Serif" size="2">ชื่อผู้ใช้ :&nbsp;</font></td>
		  <td width="63%" bgcolor="#CCCCCC"><input type="text" name="uname" size="20"></td>
		</tr>
		<tr>
		  <td width="37%" bgcolor="#CCCCCC" align="right"><font face="MS Sans Serif" size="2">รหัสผ่าน :&nbsp; </font></td>
		  <td width="63%" bgcolor="#CCCCCC"><input type="password" name="passwd" size="20"></td>
		</tr>
		<tr>
		  <td width="100%" colspan="2" bgcolor="#CCCCCC" align="center">
		  <input type="submit" value="ตกลง" name="submit"><input type="reset" value="ยกเลิก"></td>
		</tr>
	</table>
	</form>
<?
	}
//---------------------------------------------------- news_form ----------------------------------------------
	function news_form(){
		$issue = getvar();
		if(ereg("edit|del",$issue))
			showlist("news",$issue);
		else if(ereg("add|update",$issue)){
						if(ereg("update",$issue)){
				$tmpid = getid();
				$query = "select headline,content,nid,image,gid from news where nid= $tmpid ";
				$result = action("get_data",$query);
				$row = mysql_fetch_array($result);
				$headline =$row[0];
				$content = $row[1];
				$nid=$row[2];
				$image = $row[3];
				$gid = $row[4];
				$sql= "select gname from newsgroup where gid = $gid";
				$rs = action("get_data",$sql);
				$rw = mysql_fetch_array($rs);
				$group = $rw[0];
				$status = "update";
			}
				else if(ereg("add",$issue))
			{
				$headline = NULL;
				$content = NULL;
				$status="add";
				$nid =NULL;
				$image =NULL;
				$group = pulldownmenu("newsgroup","news",$issue);
			}
?>
	<form method="POST" enctype="multipart/form-data" action="writer_sec.php?type=news&cm=<? echo $status ?>">
	<input type="hidden" name="nid" value ="<?  echo $nid ?>">  
	  <table border="0" cellpadding="0" cellspacing="0" width="85%">
		<tr>
		  <td width="100%" colspan="2" align="right" bgcolor="#EEEEEE"><font face="Microsoft Sans Serif" size="2" color="#A1A1A1">:: <? echo gettitle() ?> :: &nbsp;</font></td>
		</tr>
		<tr>
	<td width="20%" bgcolor="#CCCCCC" align="right"><font face="MS Sans Serif" size="2">กลุ่มข่าว :&nbsp; </font></td>
		  <td width="80%" bgcolor="#CCCCCC"><?echo $group?></td>
		</tr>
		<tr>
		  <td width="20%" bgcolor="#CCCCCC" align="right"><font face="MS Sans Serif" size="2">พาดหัวข่าว :&nbsp; </font></td>
		  <td width="80%" bgcolor="#CCCCCC"><input type="text" size="35" align="right" name="headline" value="<?echo $headline?>"></td>
		</tr>
		<tr>
		  <td width="20%" bgcolor="#CCCCCC" align="right" valign="top"><font face="MS Sans Serif" size="2">รายละเอียด :&nbsp; </font></td>
		  <td width="80%" bgcolor="#CCCCCC"><textarea rows="7" name="story" cols="35"><? echo $content ?></textarea></td>
		</tr>
		<tr>
		  <td width="20%" bgcolor="#CCCCCC" align="right"><font face="MS Sans Serif" size="2">รูปภาพ :&nbsp; </font></td>
		  <td width="80%" bgcolor="#CCCCCC"><input type="file" name="image" size="30" value="<?echo $image?>"></td>
		</tr>
		<tr>
		  <td width="100%" colspan="2" bgcolor="#CCCCCC" align="center">
		  <input type="submit" value="ตกลง" name="submit"><input type="button" value="ยกเลิก"></td>
		</tr>
	  </table>
	</form>
<?
		}

	}

//---------------------------------------------------- news_list ----------------------------------------------
	function news_list(){
		$issue = getvar();
		$name=NULL;
		if(ereg("edit",$issue))
		$status="update";
		else
		{
		$name = "name=\"submit\"";
		$status = "del";
		}
		$query = "select nid,headline from news where gid='".getid()."'";
		$data = action("get_data",$query);
?>
	<form method="POST" action="writer_sec.php?type=news&cm=<? echo $status?>">
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="80%">
		<tr>
	<td width="100%" colspan="2" align="right" bgcolor="#EEEEEE"><font face="Microsoft Sans Serif" size="2" color="#A1A1A1">:: <? echo gettitle(); ?> :: &nbsp;</font></td>
		</tr>
		<tr>
		  <td width="100%" colspan="2" bgcolor="#CCE6FF" align="left"><font face="Microsoft Sans Serif" size="2">
<?
		while($row = mysql_fetch_array($data))
			echo "<input type=\"radio\" name=\"nid\" value=\"$row[0]\">$row[1]<br>\n";
		  	mysql_free_result($data);

?>
			</font></td>
		</tr>
		<tr>
		  <td width="100%" colspan="2" align="center" bgcolor="#EEEEEE"><input type="submit" <? echo $name ?> value="ตกลง" ></td>
		</tr>
	</table>
	</form>
<?
	}

//---------------------------------------------------- group_form ----------------------------------------------
	function group_form(){
		$issue = getvar();
		if(ereg("edit|del",$issue))
			showlist("newsgroup",$issue);
		else if(ereg("add|update",$issue)){
			if(ereg("update",$issue)){
				$tmpid = getid();
				$query = "select gname,description,gid from newsgroup where gid= $tmpid ";
				$result = action("get_data",$query);
				$row = mysql_fetch_array($result);
				$headline = $row[0];
				$content = $row[1];
				$listid=$row[2];
				$status = "update";
			}
			else
			{ 
				if (ereg("add",$issue))
				$headline = "";
				$content = "";
				$status="add";
				$listid ="";
			}
			$group = pulldownmenu("newsgroup","newsgroup",$issue);

?>
	<form method="POST" enctype="multipart/form-data" action="writer_sec.php?type=newsgroup&cm=<? echo $status ?>">
	<input type="hidden" name="listid" value ="<?  echo $listid ?>">  
	<table border="0" cellpadding="0" cellspacing="0" width="85%">
		<tr>
		  <td width="100%" colspan="2" align="right" bgcolor="#EEEEEE"><font face="Microsoft Sans Serif" size="2" color="#A1A1A1">:: <? echo gettitle() ?> :: &nbsp;</font></td>
		</tr>
		<tr>
	<td width="20%" bgcolor="#CCCCCC" align="right"><font face="MS Sans Serif" size="2">ชื่อกลุ่มข่าว :&nbsp; </font></td>
	<td width="80%" bgcolor="#CCCCCC"><input type="text" name="gname" size="30" value ="<? echo $headline ?>"></td>
		</tr>
		<tr>
		  <td width="20%" bgcolor="#CCCCCC" align="right" valign="top"><font face="MS Sans Serif" size="2">คำอธิบาย :&nbsp; </font></td>
		  <td width="80%" bgcolor="#CCCCCC"><textarea rows="7" name="describe" cols="35"><? echo $content ?></textarea></td>
		</tr>
		  <td width="100%" colspan="2" bgcolor="#CCCCCC" align="center">
		  <input type="submit" value="ตกลง" name="submit"><input type="button" value="ยกเลิก"></td>
		</tr>
	  </table>
	</form>
<?
		}
	}

//---------------------------------------------------- showlist ----------------------------------------------
	function showlist($type,$issue){
		if(ereg("edit",$issue)){
			if(ereg("newsgroup",$type))
				$issue = "update";
		}
?>
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="80%">
		<tr>
		  <td width="100%" colspan="2" align="right" bgcolor="#EEEEEE"><font face="Microsoft Sans Serif" size="2" color="#A1A1A1">:: <? echo gettitle() ?> :: &nbsp;</font></td>
		</tr>
		<tr>
		  <td width="100%" colspan="2" bgcolor="#CCCCCC" align="center">
<?
			echo pulldownmenu("newsgroup",$type,$issue);
?>
			</td>
		</tr>
		<tr><td width="100%" colspan="2">&nbsp;</td>
		</tr>
	</table>
<?
	}

//---------------------------------------------------- pulldownmenu ----------------------------------------------  เเสดง drop down list ให้เลือกกลุ่มกรณีจะเเก้ไขข้อมูล
	function pulldownmenu($table,$type,$issue){
		$i = 0;
		$str = "<select name=\"listid\"";
		if(!ereg("add",$issue)){
			$str .= "onchange=\"location.href=this.options[this.selectedIndex].value;\"";
			$option = "writer_sec.php?type=$type&cm=$issue&listid=";
		}
		if(empty($option)) $option=NULL;
		$str .= ">\n<option value=\"\">-----เลือกรายการ-----\n";
		$query = get_list($table);
		$result = action("get_data",$query);
		while($row = mysql_fetch_array($result))
		$str .= "<option value=\"$option$row[0]\">".$row[1]."\n";
		$str .= "</select>\n";
		mysql_free_result($result);
		return $str;
	}

//---------------------------------------------------- confirm ----------------------------------------------
	function confirm(){
		$query = "select gname from newsgroup where gid='".getid()."'";
		$result = action("get_result",$query);
?>
	<form method="POST" action="writer_sec.php?type=newsgroup&cm=del">
		<font face="Microsoft Sans Serif" size="2">ยืนยันการลบกลุ่ม</font> <? echo errmesg($result); ?><br><br>
		<input type="hidden" name="gid" value="<? echo getid(); ?>">
		<input type="submit" value="ตกลง" name="submit"><input type="button" value="ยกเลิก" onClick="location.href='writer_sec.php?type=newsgroup&cm=del'">
	</form>
<?
	}

//---------------------------------------------------- settitle ----------------------------------------------
	function settitle($param){
		global $title;
		$title = $param;
	}

//---------------------------------------------------- gettitle ----------------------------------------------
	function gettitle(){
		global $title;
		return $title;
	}

//---------------------------------------------------- errmesg ----------------------------------------------
	function errmesg($str){
		$mesg = "<font face=\"MS Sans Serif\" size=\"2\" color=\"red\">$str</font>";
		return $mesg;
	}
?>