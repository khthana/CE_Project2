<?
require("config.php");
$conn=mysql_connect($host,$username,$password);
mysql_select_db($database,$conn);
?>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
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
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="right"><strong><font size="3" color="#ffffff"> <?echo "<font color=white size=3><b>Advance Search</b></font>&nbsp;&nbsp;";?> 
      </font></strong></td>
  </tr>
</table><table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r1_c1.gif" width="5" height="5"></td>
    <td width="963" valign="top" background="../npe/images/x_r1_c2.gif"><img src="../npe/images/x_r1_c2.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r1_c5.gif" width="5" height="5"></td>
  </tr>
  <tr> 
    <td width="5" valign="top" background="../npe/images/x_r2_c1.gif"><img src="../npe/images/x_r2_c1.gif" width="5" height="1"></td>
    <td valign="top"> <form action="advance_search.php?data=advance_search&type_book=select2&from=select1&username=<?=$username;?>" method="post" name="form_new" id="form_new" onSubmit="return check()">
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td width="37%" align="right"><strong>ข้อความที่ต้องการค้น :</strong></td>
            <td width="63%"><input name="advance_search" type="text" id="advance_search" size="25"></td>
          </tr>
          <tr> 
            <td align="right"><strong>ค้นหาโดย :</strong></td>
            <td><select name="select2">
                <option value="R_SENDER">ตำแหน่งผู้ออกหนังสือ</option>
                <option value="R_SENDER">หน่วยงานที่ออกหนังสือ</option>
                <option value="จดหมาย">ส่งมาโดยจดหมาย</option>
                <option value="fax">ส่งมาทาง fax</option>
                <option value="ยื่นด้วยตัวเอง">ยื่นด้วยตัวเอง</option>
              </select> <input name="values" type="hidden" id="values" value="<?=$values?>"> 
            </td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td>
            <td> 
              <?
			//select
			  ?>
            </td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td>
            <td><input type="submit" name="Submit" value="ค้นหาข้อมูล"> &nbsp; 
              <input name="search" type="hidden" id="search" value="1"></td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td>
            <td><a href="../npe/index.php?data=advance_search"><b> 
           
              </b></a></td>
          </tr>
        </table>
      </form></td>
    <td width="5" align="right" valign="top" background="../npe/images/x_r2_c5.gif"><img src="../npe/images/x_r2_c5.gif" width="5" height="1"></td>
  </tr>
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r4_c1.gif" width="5" height="5"></td>
    <td valign="top" background="../npe/images/x_r4_c4.gif"><img src="../npe/images/x_r4_c4.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r4_c5.gif" width="5" height="5"></td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r1_c1.gif" width="5" height="5"></td>
    <td width="963" valign="top" background="../npe/images/x_r1_c2.gif"><img src="../npe/images/x_r1_c2.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r1_c5.gif" width="5" height="5"></td>
  </tr>
  <tr> 
    <td width="5" valign="top" background="../npe/images/x_r2_c1.gif"><img src="../npe/images/x_r2_c1.gif" width="5" height="1"></td>
    <td valign="top"><font size="3" color="#006699"> <strong>ผลการค้นหาข้อมูล</strong> 
      </font><font size="3" color="#CC0000"><b>
      <?=$advance_search?></b>
      &nbsp; </font></td>
    <td width="5" align="right" valign="top" background="../npe/images/x_r2_c5.gif"><img src="../npe/images/x_r2_c5.gif" width="5" height="1"></td>
  </tr>
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r4_c1.gif" width="5" height="5"></td>
    <td valign="top" background="../npe/images/x_r4_c4.gif"><img src="../npe/images/x_r4_c4.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r4_c5.gif" width="5" height="5"></td>
  </tr>
</table>
<?		
			mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
			mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
			$sql = "select POSITION from users where USER_NAME='$username'";
			$dbquery = mysql_db_query($dbname,$sql);
			$result = mysql_fetch_array($dbquery);
			$re_POSITION   = $result[POSITION];
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
			switch($select2)
			{
					case 'R_SENDER':
					{				
							switch ($re_POSITION)
							{
								case 'user':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book,use_book where book.$select2 like '%$advance_search%' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
								case 'head':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.$select2 like '%$advance_search%'";	
								}break;
								case 'secretary':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.$select2 like '%$advance_search%'";	
								}break;
								default :
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									echo "user ไม่มีตำแหน่งการค้นหาข้อมูล";
									$sql = "select * from book,use_book where book.$select1 like '%$advance_search%' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
							}
					}break;
					case 'จดหมาย':
					{				
							switch ($re_POSITION)
							{
								case 'user':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book,use_book where book.TYPE_SENT ='จดหมาย' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
								case 'head':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.TYPE_SENT='จดหมาย'";	
								}break;
								case 'secretary':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.TYPE_SENT='จดหมาย'";	
								}break;
								default :
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									echo "user ไม่มีตำแหน่งการค้นหาข้อมูล";
									$sql = "select * from book,use_book where book.$select1 like '%$advance_search%' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
							}
					}break;
					case 'fax':
					{				
							switch ($re_POSITION)
							{
								case 'user':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book,use_book where book.TYPE_SENT='fax' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
								case 'head':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.TYPE_SENT='fax'";	
								}break;
								case 'secretary':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.TYPE_SENT='fax'";	
								}break;
								default :
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									echo "user ไม่มีตำแหน่งการค้นหาข้อมูล";
									$sql = "select * from book,use_book where book.$select1 like '%$advance_search%' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
							}
					}break;
					case 'ยื่นด้วยตัวเอง':
					{				
							switch ($re_POSITION)
							{
								case 'user':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book,use_book where book.TYPE_SENT ='ยื่นด้วยตัวเอง' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
								case 'head':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.TYPE_SENT='ยื่นด้วยตัวเอง'";	
								}break;
								case 'secretary':
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									$sql = "select * from book where book.TYPE_SENT='ยื่นด้วยตัวเอง'";	
								}break;
								default :
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									echo "user ไม่มีตำแหน่งการค้นหาข้อมูล";
									$sql = "select * from book,use_book where book.$select1 like '%$advance_search%' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
							}
					}break;
					default :
					{
									//echo "ไม่สามารถค้นหาข้อมูลได้";
									//$sql = "select * from $select2 where S_AT like '%$advance_search%'";
					}break;
			}
			if($startpage!=1)
			{
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
				if($num_rows<1){
						echo "ไม่พบข้อมูลที่ทำการค้นหา";
				}
				else
				{				
		 	?>
			
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td width=7% height="39"><font size="2">เลขที่หนังสือ</font></td>
        <td width=7% align="center"><font size="2">วันที่</font></td>
        <td width=9% align="center"><font size="2">วันที่รับหนังสือ</font></td>
        <td width=20% align="center"><font size="2">เรื่อง</font></td>
        <td width=16% align="center"><font size="2">เรียน</font></td>
        <td width=12% align="center"><font size="2">ผู้ออกหนังสือ</font></td>
        <td width=7% align="center"><font size="2">คำสำคัญ</font></td>
        <td width=9% align="center"><font size="2">ชนิด</font></td>
        <td width=13% align="center"><font size="2">รายละเอียด</font></td>
      </tr>
      <tr> 
	        <?
	  			$i=0;
	 						while($i<$num_rows)
	 						{
		 								$result = mysql_fetch_array($dbquery);
										$re_ID_BOOKS   = $result[ID_BOOKS ];
										$re_DATE  =$result[R_DATE ];
										$re_TOPIC   =$result[R_TOPIC  ];
										$re_TO  =$result[R_TO];
										$re_SENDER   =$result[R_SENDER];
										$re_DATE_RECEIVE  =$result[DATE_RECEIVE];
										$re_KEYS  =$result[R_KEYS];
										$re_TYPE   =$result[TYPE_BOOK];
										
	  ?>
        <td width=7% height="36"><font size="2"><span class="style3"><span class="style1"> 
          <?=$re_ID_BOOKS;?>
          </span></span></font></td>
        <td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
          <?=$re_DATE;?>
          </span></span></span></font></td>
        <td align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
          <?=$re_DATE_RECEIVE;?>
          </span></span></span></font></td>
        <td width=20% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
          <?=$re_TOPIC;?>
          </span></span></span></font></td>
        <td width=16% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
          <?=$re_TO;?>
          </span></span></span></font></td>
        <td width=12% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
          <?=$re_SENDER;?>
          </span></span></span></font></td>
        <td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
          <?=$re_KEYS;?>
          </span></span></span></font></td>
        <td width=9% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
          <?=$re_TYPE;?>
          </span></span></span></font></td>
        <td width=13% align="center"><span class="style1"><font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>">ดูรายละเอียด</a></font> 
          </span></td>
      </tr>
	        <? 
	  						$i++;
				  			}
	 			mysql_close();
	  			}
			}
			else
			{
			
			}
?>
    </table>
    </body>
</html>