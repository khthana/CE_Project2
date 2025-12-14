<?
require("config.php");
?>
<HTML>
<HEAD>
<TITLE><?=$title?></TITLE>
<link rel="stylesheet" href="../npe/style.css" type="text/css" media="screen">
<style type="text/css">
		body {
			font-family: Georgia;
			font-size: 12pt;
		}
		
		.treeMenuDefault {
			
		}
		
		.treeMenuBold {
			font-style: italic;
			font-weight: bold;
		}
	</style>
<style type="text/css">
<!--
.style21 {font-weight: bold}
.style22 {
	color: #CC0000;
	font-weight: bold;
}
.style23 {
	color: #0066CC;
	font-weight: bold;
}
.style24 {
	color: #FFFFFF;
	font-weight: bold;
}
.style26 {color: #000000}
.style27 {
	font-size: 9px;
	font-weight: bold;
	color: #990000;
}
-->
</style>
<? 
	if($data==NULL)
	{ 
			$data=head;
			$name=NULL;
	} ?>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874"></HEAD>
<BODY bgcolor="#C9C9C9" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<table width="95%"  border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="12%" align="right" valign="bottom"><img src="immage/bg001.png" width="121" height="92"></td>
          <td width="88%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="46" valign="middle" background="../npe/images/bg001.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="20%" align="right" valign="top" bgcolor="#FFFFFF"><img src="immage/colorbox002.png" width="139" height="46"></td>
                      <td width="60%" valign="bottom"> <form action="search.php?data=search" method="post" name="form3" id="form3" onSubmit="return check()">
                          <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="30%" height="29">&nbsp;<img src="../npe/images/bullet001.gif" width="7" height="7"> 
                                <script language=JavaScript>
				var days = new Array("อาทิตย์","จันทร์","อังคาร","พุธ","พฤหัสบดี","ศุกร์","เสาร์");
				var months = new Array("มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฏาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม"); 
				var idate = new Date()
				var iday = days[idate.getDay()]
				var imonth = months[idate.getMonth()]
				var date = idate.getDate()
				var iyear = (543+ idate.getYear())
				document.write('<font color="#ffffff" size="1"><b>')
				document.write(date+' '+ imonth+' '+ iyear)
				document.write('</b></font>')
				
</script>
				<?php
 					session_start();
				  	session_register("$username");
					if($uname!=NULL)
							$username="$uname";
					else
							$username=$username;
					
				?>
				</td>
                              <td width="39%" align="right"><b> </b> 
                                <input name="search" type="text" id="search" style="height:18px;" size="15"> 
                                &nbsp; <input name="imageField" type="image" src="immage/search.gif" alt="ค้นหาข้อมูล" width="36" height="12" border="0"></td>
                              <td width="31%" align="center"><a href="advance_search.php?data=advance_search"><b>
                                <script language="JavaScript">
function check()
{
      var v1 = document.form3.search.value;

        if (v1.length==0)
           {
           alert("กรุณาป้อนข้อมูลที่ต้องการค้นหา");
           document.form3.search.focus();           
           return false;
           }else
           return true;
}
</script>
                                </b><img src="immage/advancesearch.gif" alt="ค้นหาข้อมูลแบบละเอียด" width="100" height="12" border="0"></a></td>
                            </tr>
                          </table>
                        </form>
                        
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="1%" background="../npe/images/bg002.jpg"><img src="immage/bg002.jpg" width="10" height="47"></td>
                <td width="99%" align="left" valign="middle" background="file:///C|/AppServ/www/htdocs/immage/bg002.jpg"><blockquote> 
                    <p><a href="index.php">Home</a>&nbsp;&nbsp;&nbsp;<a href="index.php?data=logout&username=<?=$username;?>" class="style26">Logout</a>&nbsp;&nbsp;&nbsp;<a href="index2.php?data=getpwd&username=<?=$username;?>&pwd=<?=$pwd;?>">แก้ใขระหัสผ่าน</a></p>
                  </blockquote></td>
              </tr>
            </table> </td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<map name="Map">
  <area shape="rect" coords="3,2,227,67" href="../npe/product.php?type=1" alt="Bioclock Series">
  <area shape="rect" coords="3,69,226,141" href="../npe/product.php?type=2" alt="Access Control">
  <area shape="rect" coords="3,145,223,216" href="../npe/product.php?type=3" alt="Accessories">
</map>
<table width="95%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top"> 
    <td width="19%" align="center"> 
      <table border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="171" align="center"><img src="../npe/images/headerboxright.gif" width="171" height="9"></td>
        </tr>
        <tr> 
          <td align="right" background="../npe/images/menubox2.jpg"><strong><font color="#FFFFFF">Member 
            Area&nbsp;&nbsp;</font></strong></td>
        </tr>
        <tr> 
          <td valign="top" background="../npe/images/colorbox003.gif"><table width="94%" border="0" cellspacing="0" cellpadding="2">
              <tr> 
                <td align="right" valign="top"><p>&nbsp;<a href="#"><strong></strong></a><span class="style26"> 
                    <?		
		  		require("config.php");
				$tbname = "users";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select POSITION from users where USER_NAME ='$username' AND PASSWORD='$pwd'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				$result = mysql_fetch_array($dbquery);
				$position   = $result[POSITION];
				switch($position)
				{
					case 'secretary'  : {	  
		   ?>
                    <br>
                    <a href="index2.php?data=form_insert&username=<?=$username;?>&pwd=<?=$pwd;?>"><font face="Geneva, Arial, Helvetica, sans-serif">ลงทะเบียนหนังสือ</font></a><font face="Geneva, Arial, Helvetica, sans-serif"><br>
                    <a href="index2.php?data=edit_book&username=<?=$username;?>&pwd=<?=$pwd;?>">แก้ใขข้อมูลหนังสือ 
                    </a><br>
                    </font><a href="index2.php?data=create_pdf&username=<?=$username;?>&pwd=<?=$pwd;?>">สร้างหนังสือภายใน</a></span><span class="style26"><a href="index2.php?data=create_pdf1&username=<?=$username;?>&pwd=<?=$pwd;?>"><br>
                    สร้างบันทึกข้อความ</a></span><span class="style26"><font face="Geneva, Arial, Helvetica, sans-serif"> 
                    <?
					}break;
					 case 'user' :{		
			?>
                    <br>
                    <a href="index2.php?data=user&username=<?=$username;?>&pwd=<?=$pwd;?>">หนังสือเข้า</a></font> 
                    <?
					}break;
					 case 'head' : {
			?>
                    <br>
                    <font face="Geneva, Arial, Helvetica, sans-serif"><a href="index2.php?data=head&username=<?=$username;?>&pwd=<?=$pwd;?>">หนังสือเข้าใหม่</a></font></span><span class="style26"><br>
                    <a href="index2.php?data=add_user&username=<?=$username;?>&pwd=<?=$pwd;?>"> 
                    เพิ่มผู้ใช้งานระบบ</a><br>
                    <a href="index2.php?data=delete_user&username=<?=$username;?>&pwd=<?=$pwd;?>">ลบผู้ใช้งานระบบ</a><br>
                    <a href="index2.php?data=delete_book&username=<?=$username;?>&pwd=<?=$pwd;?>">ลบหนังสือ 
                    </a><br>
                    <a href="index2.php?data=form_insert&username=<?=$username;?>&pwd=<?=$pwd;?>"><font face="Geneva, Arial, Helvetica, sans-serif">ลงทะเบียนหนังสือเข้า</font></a><br>
                    <a href="index2.php?data=form_insert_book_sent&username=<?=$username;?>&pwd=<?=$pwd;?>">ลงทะเบียนหนังสือออก</a><font face="Geneva, Arial, Helvetica, sans-serif"> 
                    <br>
                    <a href="index2.php?data=edit_book&username=<?=$username;?>&pwd=<?=$pwd;?>">แก้ใขข้อมูลหนังสือ 
                    </a><br>
                    <a href="index2.php?data=create_pdf&username=<?=$username;?>&pwd=<?=$pwd;?>">สร้างหนังสือ</a></span><span class="style26"> 
                    <?
				  }break;
					default  : {
						echo "กรุณา login เข้าระบบ";
					}
				}
			?>
                    <br>
                    </span> </p>
                  </td>
              </tr>
              <tr> 
                <td align="right">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p><br>
      </p></td>
    <td width="81%" bgcolor="#00CCFF">
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="20" align="left" valign="top" bgcolor="#00CCFF"> 
            <? include("$data.php"); ?>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="95%" border="0" cellpadding="0" cellspacing="0" background="../npe/images/footer_r1_c2.jpg">
  <tr> 
    <td height="45" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="12%" align="right" valign="bottom"><img src="immage/bg001.png" width="121" height="92"></td>
          <td width="88%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="46" valign="middle" bgcolor="#FFFFFF">&nbsp; </td>
              </tr>
            </table>
            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="1%" background="../npe/images/bg002.jpg"><img src="immage/bg002.jpg" width="10" height="47"></td>
                <td width="99%" valign="top" background="immage/bg002.jpg"> 
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--power by Sampan Khamthon
Global One Studio 
contact : casnoboy@hotmail.com -->
<map name="Map2">
  <area shape="rect" coords="70,15,117,32" href="index.php?data=sitemap&username=<?=$username;?>" alt="แผนผังเว็บไซด์">
  <area shape="rect" coords="132,15,183,32" href="index.php?data=contacts&username=<?=$username;?>" alt="ติดต่อสอบถาม">
  <area shape="rect" coords="9,13,51,32" href="index.php?data=home&username=<?=$username;?>" alt="หน้าแรก">
</map>
</BODY>
</HTML>