<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<title>ตอบคำถาม</title>
<style type="text/css">
<!--
body,td,th {
	font-family: MS Sans Serif;
	font-size: 10px;
}
.style25 {
	font-size: 14px;
	font-weight: bold;
}
.style27 {
	font-size: 18px;
	color: #FFFFFF;
	font-weight: bold;
}
a {
	font-family: MS Sans Serif;
	color: #000000;
	font-size: 10px;
}
a:link {
	text-decoration: none;
	color: #000000;
}
a:visited {
	text-decoration: none;
	
}
a:hover {
	text-decoration: none;
	color: #3366FF;
}
a:active {
	text-decoration: none;
	color: #000000;
}
.style31 {color: #000000}
.style32 {font-size: 12px}
-->
</style>
<body bgcolor="#FFCC00" background="images/bg01.gif" >

<table width=80% border=1 align='center' cellpadding=0 cellspacing=0 bordercolor="#FFCC00" bgcolor="#FFCC00">
  <tr bordercolor="#FFCC33"> 
    <td width="19%"  rowspan=2 bgcolor="#FFCC33"><img src='images/Logistic_01.gif' width=148 height=68 > 
    </td>
    <td height="47" bordercolor="#FFCC33" bgcolor="#FFCC33" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='images/Logistic_02.gif' width=93 height=45  ><img src='images/Logistic_03.gif' width=90 height=45 ><img src='images/Logistic_04.gif' width=97 height=45 ><img src='images/Logistic_05.gif' width=104 height=45 ><img src='images/Logistic_06.gif' width=90 height=45 ><img src='images/Logistic_07.gif' width=57 height=45 ></td>
  </tr>
  <tr> 
    <td height='15' bordercolor="#FFCC33" bgcolor='#FFCC00'><div align="center"><strong></strong></div></td>
  </tr>
  <tr bgcolor="#FFCC33" > 
    <td colspan='2' valign="top"> </td>
  </tr>
  <tr bgcolor="#FFCC00"> 
    <td height='310' colspan='2' valign='top'>
        <table width="100%" height="308" align="center" bgcolor="#FFFFFF">
          <tr> 
            <td height="20" align="center" valign="top" bgcolor="#FFFFFF"><font size="3" face="MS Sans Serif, Tahoma, sans-serif"> 
              <?

include "connect.php";
include "function.php";

$id_ques=$_GET[id_ques];

/////////////////////ส่วนที่ 1 นำคำถามมาแสดง  รับค่า แบบ get ///////////////////////

$sql= "select * from wb_question where id_ques='$id_ques'";
$result=mysql_db_query($dbname,$sql);
$record=mysql_fetch_array($result);
$id_ques=$record[id_ques];
$title_ques=$record[title_ques];
$detail_ques=$record[detail_ques];
$name_ques=$record[name_ques];
$email_ques=$record[email_ques];
$date_ques=$record[date_ques];

$title_ques=htmlspecialchars($title_ques);
$detail_ques=nl2br(htmlspecialchars($detail_ques));
$name_ques=htmlspecialchars($name_ques);
$email_ques=htmlspecialchars($email_ques);
$date_ques=htmlspecialchars($date_ques);
$date_ques=displaydate($date_ques); 

echo"
			<center><b><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"> หัวข้อคำถาม::</b> $title_ques</font></center>
<table width=\"600\" align='center' border=\"0\">
  <tr>
    <td bgcolor='#FFF2C6' >
	<font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">เนื้อหา :  $detail_ques
	</font>
	</td>
	</tr>
	<tr><td bgcolor='#D2E9FF' align='right' ><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><p><b>โดย :</b>   $name_ques
	<b>อีเมล : </b>  $email_ques
	<b>เมื่อ :</b>   $date_ques
	</p></font>
  </td>
  </tr>
</table><br>";

////////////////////////////// ส่วนที่ 2 ส่วนแสดงคำตอบ  //////////////////////////////////////
print"<font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><strong><div align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;คำตอบ</div></font>";
$sql="select * from wb_answer where ref_id='$id_ques' order by id_ans";
$result=mysql_db_query($dbname,$sql);
while($record=mysql_fetch_array($result)){
	$id_ans=$record[id_ans];
	$detail_ans=$record[detail_ans];
	$name_ans=$record[name_ans];
	$email_ans=$record[email_ans];
	$date_ans=$record[date_ans];
	$ref_id=$record[ref_id];
	
	$detail_ans=nl2br(htmlspecialchars($detail_ans));
	$name_ans=htmlspecialchars($name_ans);
	$email_ans=htmlspecialchars($email_ans);
	$date_ans=displaydate($date_ans); 
	echo"
	<table width=\"600\"  align='center' border=\"0\">
  <tr>
    <td bgcolor='#FDF3E7' ><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">คำตอบ: $detail_ans</font></td>
	</tr>
	<tr>
	<td bgcolor='#D2E9FF' align='right'><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\"><p>
	<b>โดย : </b>$name_ans
	<b>อีเมล : </b>$email_ans
	<b>เมื่อ : </b>$date_ans</p></font>
  </tr>
</table><br>";
} //endwhile
mysql_close();

///////////////////////////////////////  ส่วนที่ 3 ฟอร์มการกรอกการตอบคำถาม /////////////////////////////////////
?>
              </font></td>
          </tr>
          <tr> 
            <td height="280" align="center" valign="top"> <center>
                <h3><font face="MS Sans Serif, Tahoma, sans-serif" size="2">ตอบคำถาม</font></h3>
              </center>
              <form action="answer_save.php" method="post">
                <table width="426" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFCC33" bgcolor="#FFE9A6">
                  <tr> 
                    <td width="92" valign="top"><font face="MS Sans Serif, Tahoma, sans-serif" size="2"><strong>รายละเอียด 
                      :</strong></font></td>
                    <td width="328"><textarea name="detail_ans" rows="8" cols="40" ></textarea> 
                      <font color="#FF0000"> * </font></td>
                  </tr>
                  <tr> 
                    <td><font face="MS Sans Serif, Tahoma, sans-serif" size="2"><strong>ชื่อผู้ตอบ 
                      :</strong></font></td>
                    <td><input type="text" name="name_ans"> <font color="#FF0000"> 
                      *</font></td>
                  </tr>
                  <tr> 
                    <td><font face="MS Sans Serif, Tahoma, sans-serif" size="2"><strong>อีเมล 
                      : </strong></font></td>
                    <td><input type="text" name="email_ans">
                    <input type="hidden" name="ref_id" value="<? echo $id_ques;?>"> 
                      <input type="hidden" value="1" name="flag"> </td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td  ><div align="center"> 
                        <input name="submit" type="submit" value="ตกลง" >
                        &nbsp;&nbsp;&nbsp; 
                        <input name="reset" type="reset" value="ยกเลิก">
                      </div></td>
                  </tr>
                </table>
              </form></td>
          </tr>
        </table>
       </td>
  </tr>
  <tr bgcolor="#FFCC00">
    <td height='22' colspan='2' valign='top'><div align="right"><strong><font color="#999999" size="2" face="MS Sans Serif, Tahoma, sans-serif">ตอบคำถาม</font></strong></div></td>
  </tr>
</table>
</body>
