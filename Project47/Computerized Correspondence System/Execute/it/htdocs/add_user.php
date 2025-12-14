<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="../nissan/nissan.css" type="text/css" media="screen">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../nissan/nissan.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #990000;
	font-weight: bold;
}
.style3 {
	color: #666666;
}
.style4 {color: #666666}
.style6 {color: #666666; font-weight: bold; }
.style7 {color: #333333}
-->
</style>
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
เพิ่มชื่อผู้เข้าใช้ระบบ<br>
<form name="form1" method="post" action="index2.php?data=adduser&username=<?=$username;?>&pwd=<?=$pwd;?>">
  <table width="102%" border="0" align="center" cellpadding="0" cellspacing="10" bgcolor="#33CCFF">
    <tr align="center" valign="top" bgcolor="#999999"> 
      <td width="69">ชื่อ-สกุล</td>
      <td width="69">ระหัสผ่าน</td>
      <td width="80">ตำแหน่ง</td>
      <td width="109">ระดับ</td>
      <td width="122">ภาค</td>
      <td width="129">คณะ</td>
      <td width="160">ตำแหน่งการใช้งาน</td>
    </tr>
    <tr align="center" valign="top" bgcolor="#33CCFF"> 
      <td><span class="style4"></span><span class="style3"><span class="style1"> 
        </span></span><span class="style1"> 
        <input name="d1" type="text" id="d1">
        </span></td>
      <td><input name="d2" type="text" id="d2" value="123" size="5"></td>
      <td><span class="style3"><span class="style1"> </span><span class="style6"> 
        <input name="d3" type="text" id="d3" size="10">
        </span></span></td>
      <td><span class="style3"><span class="style6"> 
        <select name="d4" id="d4" onChange="MM_jumpMenu('parent',this,0)">
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
      <td><select name="d5" id="d5" onChange="MM_jumpMenu('parent',this,0)">
          <option value="ภาควิชาวิศวกรรมคอมพิวเตอร์">ภาควิชาวิศวกรรมคอมพิวเตอร์</option>
        </select></td>
      <td><select name="d6" id="d6" onChange="MM_jumpMenu('parent',this,0)">
          <option value="วิศวกรรมศาสตร์">วิศวกรรมศาสตร์</option>
        </select></td>
      <td><span class="style3"><span class="style1"> </span><span class="style3"><span class="style1"> 
        </span></span><span class="style6"> 
        <select name="d7" size="1" id="d7">
          <option value="user" selected>user</option>
          <option value="secretary">secretary</option>
        </select>
        </span></span></td>
    </tr>
    <tr align="center" valign="top" bgcolor="#33CCFF"> 
      <td colspan="2">&nbsp;</td>
      <td colspan="4"><input type="submit" name="Submit" value="Submit"></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
