<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<style type="text/css">
<!--
.style9 {
	color: #333333;
	font-weight: bold;
}
.style10 {color: #333333}
-->
</style>
</head>

<body>
<form name="form1" method="post" action="index2.php?data=adduser&username=<?=$username;?>&pwd=<?=$pwd;?>">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="38" bgcolor="#990000">&nbsp;<img src="images/icon2/ico051.gif" width="13" height="19" align="absmiddle">&nbsp;<span class="style8"><strong>เพิ่มผู้ใช้งานระบบ</strong></span></td>
    </tr>
  </table>
    <table width="100%"  border="0" cellpadding="2" cellspacing="3" bgcolor="#DFDFDF">
    <tr>
      <td width="26%" align="right" valign="middle" class="right"><span class="style9">คำนำหน้าชื่อ</span></td>
      <td colspan="3"><span class="style1">
        <input name="d1" type="text" id="d1" size="10">
      </span></td>
    </tr>
    <tr>
      <td align="right" valign="middle" class="right"><span class="style9">ชื่อ</span></td>
      <td width="20%"><input name="d2" type="text" id="d2" size="20"></td>
      <td width="5%" align="right"><strong class="right style10">สกุล</strong></td>
      <td width="49%"><input name="d3" type="text" id="d3" size="20"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" class="right"><span class="style9">รหัสผ่าน</span></td>
      <td colspan="3"><input name="d4" type="password" id="d4" size="20"></td>
    </tr>
    <tr>
      <td align="right" valign="middle" class="right"><span class="style9">ตำแหน่ง</span></td>
      <td colspan="3"><span class="style4"><span class="style6">
        <input name="d5" type="text" id="d5" size="20">
      </span></span></td>
    </tr>
    <tr>
      <td align="right" valign="middle" class="right"><span class="style9">ระดับ</span></td>
      <td colspan="3"><span class="style4"><span class="style6">
        <select name="d6" id="d6" onChange="MM_jumpMenu('parent',this,0)">
          <option value="ระดับ1">ระดับ1</option>
          <option value="ระดับ2">ระดับ2</option>
          <option value="ระดับ3">ระดับ3</option>
          <option value="ระดับ4">ระดับ4</option>
          <option value="ระดับ5">ระดับ5</option>
          <option value="ระดับ6">ระดับ6</option>
          <option value="ระดับ7">ระดับ7</option>
          <option value="ระดับ8">ระดับ8</option>
          <option value="ระดับ9">ระดับ9</option>
        </select>
      </span></span></td>
    </tr>
    <tr>
      <td align="right" valign="middle" class="right"><span class="style9">ตำแหน่งการใช้งาน</span></td>
      <td colspan="3"><span class="style4"><span class="style6">
        <select name="d9" size="1" id="d9">
          <option value="user" selected>user</option>
          <option value="secretary">secretary</option>
        </select>
      </span></span></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3"><input type="submit" name="Submit" value="เพิ่มผู้ใช้งาน"></td>
    </tr>
  </table>
</form>
</body>
</html>
