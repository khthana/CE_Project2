<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<?php
	require('./libraries/grab_globals.lib.php'); 
	include("./config.inc.php");
	require("./ChkErr.inc.php");
	CheckSpace($user,"USERNAME");
	if(ChkUser($user) == true) {
	?>
		<form name="form1" method="post" action=""> 
		  <table width="300" border="0" align="center" cellpadding="1" cellspacing="1" bordercolor="#000000" bgcolor="#000000">
			<tr> 
			  <td width="227" bgcolor="#66BBFF" class="header"><div align="center"></div></td>
			</tr>
			<tr>
			  <td bgcolor="#FFAAFF"  class="header"><div align="center"><strong>username(<?php echo $user; ?>) 
				  ได้มีคนใช้งานแล้ว</strong></div></td>
			</tr>
			<td bgcolor="#FFAAFF" > <div align="center">
				  <input type="button" name="Button" value="back"  onClick="history.back()">
				</div></td>
			</tr>
		  </table>
	 
  <?php
	}
	else 	{ 
		
?>
  <table width="300" border="0" align="center" cellpadding="1" cellspacing="1" bordercolor="#000000" bgcolor="#000000">
		  <tr> 
			<td width="227" bgcolor="#66BBFF" class="header"><div align="center"></div></td>
		  </tr>
		  <tr> 
			<td bgcolor="#FFAAFF"  class="header"><div align="center"><strong>username(<?php echo $user; ?>) 
        ยังไม่มีผู้ใช้งาน</strong></div></td>
		  </tr>
		  <td bgcolor="#FFAAFF" > <div align="center">
          <input type="button" name="Submit3" value="back" onClick="history.back()">
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" name="Submit2" value="ปิด" onClick="window.close()">
			</div></td>
		  </tr>
		</table>
	  </form>	
<?php
	}
?>
</body>
</html>
