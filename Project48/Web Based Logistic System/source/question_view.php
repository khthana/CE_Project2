<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<title>เวบบอร์ดถาม-ตอบเกี่ยวกับการขนส่งสินค้า</title>
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

<table width=87% border=0 align='center' cellpadding=0 cellspacing=0 bgcolor="#FFFFFF">
  <tr> 
    <td width="19%"  rowspan=2 bgcolor="#FFCC33"><img src='images/Logistic_01.gif' width=148 height=68 > 
    </td>
    <td height="47" bgcolor="#FFCC33" >&nbsp;<img src='images/Logistic_02.gif' width=93 height=45  ><img src='images/Logistic_03.gif' width=90 height=45 ><img src='images/Logistic_04.gif' width=97 height=45 ><img src='images/Logistic_05.gif' width=104 height=45 ><img src='images/Logistic_06.gif' width=90 height=45 ><img src='images/Logistic_07.gif' width=57 height=45 ></td>
  </tr>
  <tr> 
    <td height='18' bgcolor='#FFCC00'><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">Webbord 
        เกี่ยวกับระบบขนส่งสินค้า</font></strong></div></td>
  </tr>
  <tr bgcolor="#FFCC33" > 
    <td height='16' colspan='2'> <div align="right"><a href='question_form.php'><font size='2'  face='MS Sans Serif'><strong>&gt;&gt;หัวข้อใหม่&lt;&lt;</strong></font></a></div></td>
  </tr>
  <tr> 
    <td height='18' colspan='2' valign='top'> <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td> 
            <?
include "connect.php" ;
include "function.php" ;
$sql="select * from wb_question order by id_ques desc";
$result=mysql_db_query($dbname,$sql);
	echo"<table width='100%' border='0'>
        <tr  bgcolor=\"#CC0000\"> 
          <td width='9%'  ><center>
              <font size='2'  face='MS Sans Serif' color='white'><strong>ลำดับที่</strong></font></center></td>
          <td width='60%'  ><center>
              <font size='2'  face='MS Sans Serif' color='white'><strong>หัวข้อคำถาม</strong></font></center></td>
          <td width='15%'  ><center>
              <font size='2'  face='MS Sans Serif' color='white'><strong>ผู้ตั้งคำถาม</strong></font></center></td>
          <td width='16%' ><center>
              <font size='2'  face='MS Sans Serif' color='white'><strong>ตั้งเมื่อวันที่</strong></font></center></td>
        </tr>";
        while($record=mysql_fetch_array($result)){ $id_ques=$record[id_ques]; 
        $title_ques=$record[title_ques]; $detail_ques=$record[detail_ques]; $name_ques=$record[name_ques]; 
        $email_ques=$record[email_ques]; $date_ques=$record[date_ques]; $title_ques=htmlspecialchars($title_ques); 
        $name_ques=htmlspecialchars($name_ques); $detail_ques=nl2br(htmlspecialchars($title_ques)); 
        $date_ques=displaydate($date_ques); 
        if(($id_ques%2)!=0){
		echo"
		<tr bgcolor='#FDF3E7'> ";
		}else{
			echo"
		<tr bgcolor='#ECECEC'> ";
		}
		echo"
          <td ><center>
              <font size='1'  face='MS Sans Serif'>$id_ques</font></center></td>
          <td><center>
              <font size='1'  face='MS Sans Serif'><a href='answer_view.php?id_ques=$id_ques' target='_blank'>$title_ques</font></center></td>
          <td><center>
              <font size='1'  face='MS Sans Serif'>$name_ques</font></center></td>
          <td><center>
              <font size='1'  face='MS Sans Serif'>$date_ques</font></center></td>
        </tr>";
		}
      echo"
	  </table>";
?>
          </td>
        </tr>
      </table></td>
  </tr>
  <tr bgcolor="#FFCC33">
    <td height='16' colspan='2' valign='top'><div align="right"><strong><font color="#666666" size="2" face="MS Sans Serif">เวบบอร์ดถาม-ตอบ 
        เกี่ยวกับระบบขนส่งสินค้า</font></strong></div></td>
  </tr>
</table>
</body>
