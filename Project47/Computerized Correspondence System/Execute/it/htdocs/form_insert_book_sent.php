<html>
<head>
<title>ลงทะเบียนหนังสือรับ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<form action="index2.php?data=save4&username=<?=$username;?>&pwd=<?=$pwd;?>" method="post" enctype="multipart/form-data" name="form1"  >
  <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#33CCFF">
    <tr> 
      <td align="left">&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr bgcolor="#009933"> 
      <td colspan="4" align="center">ข้อมูลหนังสือส่ง</td>
    </tr>
    <tr>
      <td align="left">เลขที่หนังสือ</td>
      <td colspan="3"><input name="d1" type="text" id="d1"></td>
    </tr>
    <tr> 
      <td align="left">ที่</td>
      <td colspan="3"><input name="d2" type="text" id="d2"></td>
    </tr>
    <tr> 
      <td><p>วันที่</p></td>
      <td colspan="3"><p> 
          <input name="d3"  type="text" id="d3"  >
        </p></td>
    </tr>
    <tr> 
      <td height="24"><p>เรื่อง</p></td>
      <td colspan="3"><p> 
          <input name="d4"  type="text" id="d4" >
        </p></td>
    </tr>
    <tr> 
      <td><p>เรียน</p></td>
      <td colspan="3"><p> 
          <input name="d5"  type="text" id="d5" >
        </p></td>
    </tr>
    <tr> 
      <td align="left" valign="top">ผู้ส่ง</td>
      <td colspan="3"><input name="d6" type="text" id="d6"></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td colspan="3"><p>Attach<br>
          <input  type="file" name="files">
        </p></td>
    </tr>
    <tr align="center" bgcolor="#009933"> 
      <td colspan="4">คำสำคัญสำหรับค้นหา(Keywords)</td>
    </tr>
    <tr> 
      <td align="right">คำสำคัญ</td>
      <td colspan="3"><input name="d7" type="text" id="d7"></td>
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
