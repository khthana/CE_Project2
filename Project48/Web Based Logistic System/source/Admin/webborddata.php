<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="98%" height="190" border="0" align="center">
  <tr> 
    <td height="66" valign="top" bgcolor="#CC0033"> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
        <tr bgcolor="#CC0033"> 
          <td height="20" colspan="7"><strong><font color="#FFFFFF" size="2">รายละเอียดคำถามเว็บบอร์ด</font></strong></td>
        </tr>
        <tr bgcolor="#FF9933"> 
          <td width="12%" height="22"><div align="center"><strong>ลำดับที่</strong></div></td>
          <td width="20%" bgcolor="#FF9933"><div align="center"><strong>หัวข้อ</strong></div></td>
          <td width="23%"><div align="center"><strong>เนื้อหา</strong></div></td>
          <td width="12%"><div align="center"><strong>วันที่ตั้ง</strong></div></td>
          <td width="9%"><div align="center"><strong>ผู้ตั้ง</strong></div></td>
          <td width="10%"><div align="center"><strong>อีเมลล์</strong></div></td>
          <td width="14%"><div align="center"><strong>การจัดการ</strong></div></td>
        </tr>
        <?
  include "connect.inc.php";
  $sql="select * from wb_question order by id_ques ASC";
  $result=mysql_db_query($dbname,$sql);
  while($object=mysql_fetch_object($result))
  {
  ?>
        <tr bgcolor="#FFFFFF"> 
          <td height="18" align="center"><? print"$object->id_ques";?></td>
          <td><? print"$object->title_ques";?></td>
          <td><? print"$object->detail_ques";?></td>
          <td align="center"><? print"$object->date_ques";?></td>
          <td align="center"><? print"$object->name_ques";?></td>
          <td align="center"><? print"$object->email_ques";?></td>
          <td align="center"><img src="images/img/icon_err.gif" width="16" height="16" align="absmiddle"><? print"<a href=\"?file=deletewebans.php&id=$object->id_ques\" onclick=\"return confirm('ท่านต้องการลบข้อมูลและรายการที่เกี่ยวข้องหรือไม่ ?')\"><font color=\"#FF0000\">ลบข้อมูล</font></a>";?></td>
        </tr>
        <?
  }
  ?>
      </table></td>
  </tr>
  <tr> 
    <td height="24" valign="top"><div align="right"><font size="4"><strong></strong></font></div></td>
  </tr>
  <tr> 
    <td height="66" valign="top" bgcolor="#CC0033"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
        <tr bgcolor="#CC0033"> 
          <td height="16" colspan="6"><strong><font color="#FFFFFF" size="2">รายละเอียดคำตอบเว็บบอร์ด</font></strong></td>
        </tr>
        <tr bgcolor="#FF9933"> 
          <td width="11%" height="24"><div align="center"><strong>ลำดับที่</strong></div></td>
          <td width="20%"><div align="center"><strong>หัวข้อคำถาม</strong></div></td>
          <td width="14%"><div align="center"><strong>วันที่ตอบ</strong></div></td>
          <td width="15%"><div align="center"><strong>ผู้ตอบ</strong></div></td>
          <td width="14%"><div align="center"><strong>อีเมลล์</strong></div></td>
          <td width="26%"><div align="center"><strong>การจัดการ</strong></div></td>
        </tr>
        <?
  $sql="select * from wb_answer order by id_ans ASC";
  $result=mysql_db_query($dbname,$sql);
  while($object=mysql_fetch_object($result))
  {
  ?>
        <tr bgcolor="#FFFFFF"> 
          <td height="20" align="center"><? print"$object->id_ans";?></td>
          <td align="center"><? print"$object->ref_id";?></td>
          <td align="center"><? print"$object->date_ans";?></td>
          <td align="center"><? print"$object->name_ans";?></td>
          <td align="center"><? print"$object->email_ans";?></td>
          <td align="center"><? print"<img src=\"images/img/wwebB.gif\" align=\"absmiddle\"><font color=\"#0000FF\">รายละเอียด</font>&nbsp;&nbsp;<img src=\"images/img/icon_err.gif\" align=\"absmiddle\"><font color=\"#FF0000\">ลบข้อมูล</font>";?></td>
        </tr>
        <?
  }
  ?>
      </table></td>
  </tr>
  <tr>
    <td height="24" valign="top"><div align="right"><font size="4"></font></div></td>
  </tr>
</table>
</body>
</html>
