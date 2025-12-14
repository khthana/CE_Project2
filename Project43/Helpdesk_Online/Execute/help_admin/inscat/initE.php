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

  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">แก้ไข 

    Category</font></p>

	<?

		}elseif($flag==0)

		{

	?>

  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399">แก้ไข 

    Category สำเร็จ</font></p>

	<?

		}elseif ($flag==1)

		{

	?>

	

  <p><font face="MS Sans Serif, Microsoft Sans Serif" size="4" color="#FF3399"> 

    ไม่สามารถแก้ไข Category ที่ต้องการได้ กรุณาตรวจสอบใหม่อีกครั้ง</font></p>

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

        เลือก category ที่ต้องการแก้ไขจากด้านซ้าย</font></td>

      <td width="20%">&nbsp;</td>

    </tr>

    <tr> 

      <td width="20%">&nbsp;</td>

      <td width="77%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#3333FF">2. 

        ทำการแก้ไข category ที่ต้องการ จากนั้นคลิกที่ปุ่ม Submit </font></td>

      <td width="20%">&nbsp;</td>

    </tr>

  </table>

  <p>&nbsp;</p>

  <table width="50%" border="0" cellspacing="0" cellpadding="0">

    <tr> 

      <td width="7%" height="28">&nbsp;</td>

      <td width="19%" height="28"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><i>หมายเหตุ</i></b></font> 

      </td>

      <td width="67%" height="28"> 

        <p>&nbsp;</p>

      </td>

      <td width="7%" height="28">&nbsp;</td>

    </tr>

    <tr> 

      <td width="7%">&nbsp;</td>

      <td width="19%">&nbsp;</td>

      <td width="67%"><font color="#FF3399" face="MS Sans Serif, Microsoft Sans Serif" size="2">- 

        ชื่อ category เป็น case sensitive</font></td>

      <td width="7%">&nbsp;</td>

    </tr>

    <tr> 

      <td width="7%">&nbsp;</td>

      <td width="19%">&nbsp;</td>

      <td width="67%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF3399">- 

        ถ้าต้องการแก้ให้ category ที่เลือก ไปอยู่ใน main category ให้ใส่ Parent 

        Name = Main</font></td>

      <td width="7%">&nbsp;</td>

    </tr>

  </table>

  <p>&nbsp;</p>

  <p>&nbsp;</p>

</div>

</body>

</html>



