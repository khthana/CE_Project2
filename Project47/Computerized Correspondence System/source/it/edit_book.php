<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style9 {color: #003366}
.style12 {color: #FF6600}
-->
</style>
</head>
<body>
<form name="form1" method="post" action="editbook.php?data1=<?=$re_idbook; ?>">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="38" bgcolor="#990000">&nbsp;<img src="images/icon2/ico549.gif" width="16" height="16"> <span class="style8"><strong>หนังสือเข้า</strong></span></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
    <?php
				require("config.php");
				$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select ID_BOOKS,R_TOPIC,TYPE_BOOK from $tbname";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_idbook   = $result[ID_BOOKS];
							$re_topic  =$result[R_TOPIC];
							$re_type_book  =$result[TYPE_BOOK];
							$i++;
	 		?>
    <tr align="center" valign="top" bgcolor="#CCCCCC"> 
      <td width="20%" height="20" align="left"> 
        <font color="#006699" class="style4">&nbsp;&nbsp;ศธ 0524.02/ 
        <?=$re_idbook;?>
        </font></td>
      <td align="left" class="style4 style9"> &nbsp;
        <?=$re_topic;?></td>
      <td width="10%" valign="middle"><a href="index2.php?data=editbook&username=<?=$username;?>&data1=<?=$re_idbook;?>&data2=<?=$re_topic;?>&pwd=<?=$pwd;?>" class="title" ><font color="#FF6600">แก้ใข</font></a></td>
    </tr>
    <?
				  			}
	 			mysql_close();
		?>
  </table>
   <br>
   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="38" bgcolor="#990000">&nbsp;<img src="images/icon2/ico549.gif" width="16" height="16"> <span class="style8"><strong>หนังสือออก</strong></span></td>
     </tr>
   </table>
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
    <?php
				require("config.php");
				$tbname = "externalbook";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select ID,ID_BOOK,E_TOPIC from $tbname";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_idbook   = $result[ID_BOOK];
							$re_id   = $result[ID];
							$re_topic  =$result[E_TOPIC];
							$i++;
	 		?>
    <tr align="center" valign="top" bgcolor="#CCCCCC"> 
      <td width="20%" height="20" align="left"> 
        <font color="#006699" class="style4"> &nbsp;&nbsp;ศธ 0524.02/ 
        <?=$re_id;?>
        </font> </td>
      <td width="414" align="left"> 
        <font class="style4 style9"> 
        &nbsp;
        <?=$re_topic;?>
        </font></td>
      <td width="10%"><a href="index2.php?data=editbook2&username=<?=$username;?>&idbook=<?=$re_idbook;?>&data2=<?=$re_topic;?>&pwd=<?=$pwd;?>" class="title"><font color="#FF6600">แก้ใข</font></a></td>
    </tr>
    <?
				  			}
	 			mysql_close();
		?>
  </table>
</form>
</body>
</html>
