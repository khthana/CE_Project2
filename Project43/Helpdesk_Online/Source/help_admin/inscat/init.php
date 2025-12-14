<?
	session_start( );
	if (!session_is_registered("admin"))
	{
		header ("Location: index.php");  
		exit;
	}
?>
<html>

<head>

<title>Un title page</title>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

<style type="text/css">

<!--

body {  margin: 0px  0px; padding: 0px  0px}

a:link { color: #005CA2; text-decoration: none}

a:visited { color: #005CA2; text-decoration: none}

a:active { color: #0099FF; text-decoration: underline}

a:hover { color: #0099FF; text-decoration: underline}

-->

</style>

</head>



<body bgcolor="#FFFFCC" >

<div align="center"> 

  <p>&nbsp;</p>

  <? if(!isset($flag))

		{

	?>

  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">เพิ่ม 

    Category</font></p>

	<?

		}elseif($flag==0)

		{

	?>

  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">เพิ่ม 

    Category สำเร็จ</font></p>

	<?

		}elseif ($flag==1)

		{

	?>

	<p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399"> 

    ไม่สามารถเพิ่ม Category ที่ต้องการได้เพราะCategory ที่ต้องการเพิ่มมีอยู่แล้ว</font></p>

	<?

		}

	?>

  <table width="100%" border="0" cellspacing="0" cellpadding="0">

    <tr> 

      <td width="20%">&nbsp;</td>

      <td width="77%"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#3333FF">วิธีการ</font></td>

      <td width="20%">&nbsp;</td>

    </tr>

    <tr> 

      <td width="20%">&nbsp;</td>

      <td width="77%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">1. 

        เลือก parent category ที่ต้องการเพิ่ม category จากด้านซ้าย</font></td>

      <td width="20%">&nbsp;</td>

    </tr>

    <tr> 

      <td width="20%">&nbsp;</td>

      <td width="77%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">2. 

        ทำการพิมพ์ชื่อ category ใหม่ที่ต้องการ จากนั้นคลิกที่ปุ่ม Submit </font></td>

      <td width="20%">&nbsp;</td>

    </tr>

  </table>

  <p>&nbsp;</p>

  <p>&nbsp;</p>

</div>

</body>

</html>



