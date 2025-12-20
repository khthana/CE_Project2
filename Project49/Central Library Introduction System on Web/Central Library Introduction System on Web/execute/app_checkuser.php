<?php
session_start();


include("app_header.php");

$uname = $_POST['username'];
$pwd = $_POST['password'];
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
/////////////ตรวจสอบ username และ password //////////////////
if($uname && $pwd)
{
	if(($uname=="admin") && ($pwd=="library"))
	{
		//$valid_user = $uname;
		//session_register("valid_user");
		$_SESSION['valid_user']= $uname;
		
		echo "<p><strong>ยินดีต้อนรับสู่ระบบ! กรุณาเลือกรายการที่ต้องการ</strong></p>";
		echo '<p><a href="app_frame_add.html">เพิ่มข้อมูลใหม่ :: Add new document</a></p>';
        echo '<p><a href="app_frame_edit.html">แก้ไขข้อมูล :: Edit/Update file</a></p>';
        echo '<p><a href="app_frame_del.html">ลบเอกสาร :: Delete file</a></p>';
		
	}
	else
	{
		echo "<p class='health'><strong>username or password is invalid !!!</strong></p>";
		echo "<p>&nbsp;</p>";
		echo "<p><a href='app_index.html'> &gt;&gt; กรุณา Login ใหม่อีกครั้ง &lt;&lt;</a></p>";
	}
}
//ไม่ได้ป้อน username หรือ pass
else 
{
	echo "<p class='health'><strong>ป้อนชื่อผู้ใช้ หรือรหัสผ่านไม่ครบ</strong></p>";
	echo "<p>&nbsp;</p>";
	echo "<p><a href='app_index.html'> &gt;&gt; กรุณา Login ใหม่อีกครั้ง &lt;&lt;</a></p>";
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
