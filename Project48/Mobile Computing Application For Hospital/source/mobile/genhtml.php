<?	
function showheader($str,$imgfile){
echo "<html>\n";
echo "<head><title>$str</title><link rel=\"stylesheet\" href=\"stylesheet.css\" ></head>\n";
?>
<style>
a.cate {text-decoration:none; color: #FFFFFF;}
</style>
<body topmargin="0" leftmargin="0">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" align="center" width="100%">
<tr align="left">
<td >
<?
echo "<img border=\"0\" src=\"$imgfile\" width=\"780\" height=\"80\"></td>\n";
echo "</tr>";
}

function showmenu($str){
?>
<tr>
<td width="100%">
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
function showbody($str){
?>
<tr>
<td width="100%">
<?
if(strcmp($str,"webboard") == 0){
$query = check_num_discuss();
$row = data_row($query,"check_data");
$query = get_discuss(TABLE,"PostID",$row,$row - 22);              
$str = data_row($query,"get_discuss");
webboard_body($str);
}
else if(strcmp($str,"show_ans") == 0){
$query = check_data(TABLE,getid());
$str = data_row($query,"get_topic");
ansbody($str);
$query = get_ans(getid());
$str = data_row($query,"get_ans");
ansbody($str);$query = check_data(TABLE,getid());
}
else
echo $str;
?>
</td>
</tr>
<?
}
function showfooter($str){
?>
<tr>
<?
echo $str;
?>
</tr>
</table>
</body>
</html>
<?
}

function menu($menu,$num,$color){
$tp = '';
if($num == 1)
$str = "<td bgcolor=\"$color\" align=\"right\"><font face=\"MS Sans Serif\" size=\"2\">";
for($i = 0;$i < count($menu);$i++){
$j = 0;
if($num == 0)
$str1 = "<td>";
if( $num == 1 && $i != 0)
$tp = " | ";
$str1 =$tp." <a  class =\"cate\" href=\"".$menu[$i][$j]."\">";
$str2 = img_or_txt($menu[$i][++$j],$num)."</a>";
if($num == 0)
$str2 .= "</td>\n";
$tmp = $str1.$str2;
$str .= $tmp;
}
if($num == 1)
$str .= "</font></td>\n";
return $str;
}

function webboard_body($str){
?>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td width="8%" bgcolor="#FFCC99"><font face="MS Sans Serif" size="2"><b><IMG SRC="image/ic_plus.gif" WIDTH="12" HEIGHT="12" BORDER=0 align="center">&nbsp;หมายเลข</b></font></td>
<td width="57%" bgcolor="#FFCC99" align="center"><font face="MS Sans Serif" size="2"><b><IMG SRC="image/write-icon.gif" WIDTH="18" HEIGHT="13" BORDER=0 align="center">&nbsp;ชื่อกระทู้</b></font></td>
<td width="10%" bgcolor="#FFCC99"><font face="MS Sans Serif" size="2"><b><IMG SRC="image/mail222.gif" WIDTH="16" HEIGHT="16" BORDER=0 align="center">&nbsp;ผู้ส่ง</b></font></td>
<td width="20%" bgcolor="#FFCC99"><font face="MS Sans Serif" size="2"><b><IMG SRC="image/icon_exclaim.gif" WIDTH="14" HEIGHT="15" BORDER=0 align="center">&nbsp;วันที่-เวลา</b></font></td>
<td width="5%" bgcolor="#FFCC99"><font face="MS Sans Serif" size="2"><b><IMG SRC="image/profile_small.gif" WIDTH="14" HEIGHT="15" BORDER=0 align="center">&nbsp;ผู้ตอบ</b></font></td>
</tr>
<?
echo $str
?>
</table>
<?
}
function discuss_body($row,$field){
$td = "<td border=\"1\" bgcolor=\"#CCFFCC\"><font face=\"MS Sans Serif\" size=\"2\">";
$str = "<tr>\n";
for($i = 0;$i <= $field;$i++){
if($i == 0){
$id = $row[$i];
$data = sprintf("%05d",$row[$i]);
}
else if($i == 1){
$data = "<a class =\"set2\" target =\"_blank\" href=\"discussion.php?id=$id\">$row[$i]</a>";
}
else if($i == $field){
$query = check_data("answer",$id);
$data = data_row($query,"check_data");
}
else
$data = $row[$i];
$str = $str.$td.$data."</td></font>\n";
}
$str = $str."</tr>\n";
return $str;
}

function ansbody($str){
?>
		<br><p align="center">
<?
		echo $str;
?>
		</p>
<?
}

function template($str){
		$head = "<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse\" bordercolor=\"#111111\" width=\"80%\">\n";
		$str = $head.$str."</table><br>";
		return $str;
}

function discuss_topic($result,$size){
$str = "<tr>\n";
$j = 0;
$list = array("จาก","E-mail","วัน-เวลา");

for($i = 1;$i < $size;$i++){
if($i == 1)
$tr = "<tr><td width=\"100%\" colspan=\"3\" bgcolor=\"#99FF99\"><font face=\"MS Sans Serif\" color=\"#000000\" size=\"2\"><b>$result[$i]</b></font></td></tr>\n";
else if($i == ($size - 1))
$Mesg = "<tr>\n<td width=\"100%\" colspan=\"3\"><font face=\"MS Sans Serif\" size=\"2\">$result[$i]</font></td>\n</tr>\n";
else{
$td = "<td width=\"33%\" bgcolor=\"#FFCC99\"><font face=\"MS Sans Serif\" size=\"1\">$list[$j] : $result[$i]</font></td>\n";
$j++;
$str = $str.$td;
}
}
$str = $tr.$Mesg.$str."</tr>\n";
return $str;
}


function reply_discuss($result,$size){
$str = "<tr>\n";
$j = 0;
$list = array("จาก","E-mail","วัน-เวลา");
for($i = 2;$i < $size;$i++){
if($i == ($size - 1))
$Mesg = "<tr>\n<td width=\"100%\" colspan=\"3\" bgcolor=\"#CCFF99\"><font face=\"MS Sans Serif\" size= \"1\">$result[$i]</font></td>\n</tr>\n";
else{
$td = "<td width=\"33%\" bgcolor=\"#66FFCC\"><font face=\"MS Sans Serif\" size=\"1\">$list[$j] : $result[$i]</font></td>\n";
$j++;
$str = $str.$td;
}
}
$str = $str.$Mesg;
return $str;
}

function img_or_txt($str,$i){
if($i == 0)
$str = "<img src=\"".$str."\" border=\"0\">";
if($i == 1)
$str = $str;
return $str;
}
function errmesg($str){
$Mesg = "<font face=\"MS Sans Serif\" size=\"2\" color=\"red\">$str</font>";
return $Mesg;
}
?>