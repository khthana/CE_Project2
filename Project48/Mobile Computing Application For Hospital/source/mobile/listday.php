<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>ข้อความประจำวัน</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<?
	include('function.php');
	include('database.php');
	require_once("headerofficer.php");	
	header_officer("พนักงาน");
	database_connect();

	check_session();
?>
<body>
<table width="800" height="534" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr><td width="400" height="23" colspan="4"><IFRAME id=classical name="list1"src="DBlistday1.php" width=100% height=400> </IFRAME></td></tr>
				<tr><td width="400" colspan="4"><IFRAME id=classical  src="DBlistday2.php" width=100% height=400> </IFRAME></td></tr>
              </table>
            </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>

