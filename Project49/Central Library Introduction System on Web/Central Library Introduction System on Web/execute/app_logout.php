<?php
session_start();

include("app_header.php");

?>
<div align="center">
<table width="790" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td><img src="AppImages/AppHead.jpg" width="780" height="100" /></td>
  </tr>
  <tr>
    <td bgcolor="#DE8911">
	<table width="780" border="0" cellspacing="1" cellpadding="10">
  	<tr>
      <td align="center" bgcolor="#FFFFFF">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
<?php

	if (isset($_SESSION["valid_user"]))
	{
		unset($_SESSION['valid_user']);
		
		echo "<p class='health'><strong>คุณออกจากระบบเรียบร้อยแล้ว</strong></p>";	
		echo "<p>&nbsp;</p>";
		echo "<p><a href='app_index.php'> &gt;&gt; ต้องการ Login อีกครั้ง &lt;&lt;</a></p>";	
	}
	else
	{
		echo "<p class='health'><strong>ไม่สามารถออกจากระบบได้</strong></p>";
		echo "<p>&nbsp;</p>";
		echo "<p><a href='app_logout.php'> &gt;&gt; กรุณา ออกจากระบบ อีกครั้ง &lt;&lt;</a></p>";
		echo "<p>&nbsp;</p>";
		echo "<p class='health'><strong>หรือ คุณอาจยังไม่ได้ Login</strong></p>";
		echo "<p>&nbsp;</p>";
		echo "<p><a href='app_index.php'> &gt;&gt; กรุณา Login ก่อน &lt;&lt;</a></p>";
	}
?>
		<p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
       </td>
     </tr>
     </table>
   </td>
  </tr>
  <tr>
    <td height="50" align="center" valign="bottom" bgcolor="#FFFFFF">
                <p>Manachanok Khumsiri, Central Library Information System Project @2006.<br />
                    King Mongkut's Institute of Technology Ladkrabang.
                </p>
    </td>
   </tr>
</table>
</div>
</body>
</html>
