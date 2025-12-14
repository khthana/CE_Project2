 <html>
<head>
<title>:: ระบบห้องสมุดบนมือถือ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="discuss.css" type="text/css">
</head>
<body bgcolor="#052D61" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<br>
<table width="345" border="0" cellspacing="0" cellpadding="3" align="center">
  <tr> 
    <td bgcolor="#094AA4" class="Tahoma13"><b><font color="#CCFF00">โปรดระบุ E-mail address :</font></b></td>
  </tr>
  <tr> 
    <td> 
      <table border="0" cellspacing="0" cellpadding="5" align="center" width="80%">
        <form action="phpTalkTo.php" method="post">
		<input type="hidden" name="id" value="<?php echo $id; ?>">
          <tr> 
            <td class="Tahoma13" align="right"> 
              <font color="#FFFFFF"> จาก : </font><input type="text" name="FromEmail" size="25" maxlength="35" style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; font-size: 10pt; font-family: Tahoma;"><br>
              <font color="#FFFFFF">  ถึง : </font><input type="text" name="ToEmail" size="25" maxlength="35" style="border-right: 1px solid; border-top: 1px solid; border-left: 1px solid; border-bottom: 1px solid; font-size: 10pt; font-family: Tahoma;">
            </td>
            <td class="Tahoma13" align="left"> 
              <input type="image" src="webboard/cmdGo6.gif" name="Submit">
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
  <form>
    <tr> 
      <td bgcolor="#094AA4" class="Tahoma13" align="right"> 
        <input notab type="reset" value="ปิดหน้าต่าง" onclick="javascript:parent.close();" style="font-weight:bold; color:#FFF; background-color:#036; border-style:outset; border-color:#69F; font-family: Tahoma;">
      </td>
    </tr>
  </form>
</table>
</body>
</html>