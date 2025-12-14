<html>
<head>
<title>ลงทะเบียนหนังสือรับ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<?
		include  "datethai.php";
		
?>
<form action="index2.php?data=save1&username=<?=$username;?>&pwd=<?=$pwd;?>" method="post" enctype="multipart/form-data" name="form1"  >
  <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#33CCFF">
    <tr bgcolor="#009933"> 
      <td colspan="4" align="center">ข้อมูลหนังสือ</td>
    </tr>
    <tr> 
      <td width="9%"><p>วันที่(หนังสือ)</p></td>
      <td colspan="3"><p> 
          <input name="date_book"  type="text" id="date_book" value="<?=$data_date;?>"  >
        </p></td>
    </tr>
    <tr> 
      <td height="24">ที่</td>
      <td colspan="3"><input name="att" type="text" id="att" value="ศธ.0524.02.7/"></td>
    </tr>
    <tr> 
      <td height="24"><p>เรื่อง</p></td>
      <td colspan="3"><p> 
          <input name="ttopic"  type="text" id="ttopic" >
        </p></td>
    </tr>
    <tr> 
      <td><p>เรียน</p></td>
      <td colspan="3"><p> 
          <input name="too"  type="text" id="too" >
        </p></td>
    </tr>
    <tr> 
      <td align="left" valign="top">ผู้ออกหนังสือ</td>
      <td colspan="3"><input name="sender" type="text" id="sender"></td>
    </tr>
    <tr> 
      <td>แนบไฟล์</td>
      <td colspan="3"><p> 
          <input  type="file" name="files">
        </p></td>
    </tr>
    <tr align="center" bgcolor="#009933"> 
      <td colspan="4">คำสำคัญสำหรับค้นหา(Keywords)</td>
    </tr>
    <tr> 
      <td rowspan="4" align="right" valign="top">คำสำคัญเพื่อค้นหา</td>
      <td width="25%"><input type="radio" name="keys" value="radiobutton"></td>
      <td width="28%"><input type="radio" name="keys" value="radiobutton"></td>
      <td width="38%"><input type="radio" name="keys" value="radiobutton"></td>
    </tr>
    <tr> 
      <td><input type="radio" name="keys" value="radiobutton"></td>
      <td><input type="radio" name="keys" value="radiobutton"></td>
      <td><input type="radio" name="keys" value="radiobutton"></td>
    </tr>
    <tr> 
      <td><input type="radio" name="keys" value="radiobutton"></td>
      <td><input type="radio" name="keys" value="radiobutton"></td>
      <td><input type="radio" name="keys" value="radiobutton">
        <select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
          <option selected>unnamed1</option>
        </select></td>
    </tr>
    <tr> 
      <td><input type="radio" name="keys" value="radiobutton"></td>
      <td><input type="radio" name="keys" value="radiobutton"></td>
      <td><input type="radio" name="keys" value="radiobutton">
        <input type="text" name="textfield"> </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td colspan="3"><blockquote> 
          <blockquote> 
            <p> 
              <input type="submit" name="Submit" value="Submit">
            </p>
          </blockquote>
        </blockquote></td>
    </tr>
  </table>
</form>
</body>
</html>
