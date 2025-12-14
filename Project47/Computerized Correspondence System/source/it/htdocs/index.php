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
			$data=home;
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
                      <td width="80%" valign="bottom"> <form action="login.php?data=search" method="post" name="form3" id="form3" onSubmit="return check()">
                          <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="19%" height="29">&nbsp;<img src="../npe/images/bullet001.gif" width="7" height="7"> 
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
                              <td width="28%" align="right"><b> </b> <font color="#FFFFFF">ชื่อ 
                                : 
                                <input name="uname" type="text" id="uname" style="height:18px;" size="15">
                                </font>&nbsp; </td>
                              <td width="36%" align="center"><a href="../npe/index.php?data=advance_search"><b> 
                                </b></a><font color="#FFFFFF">รหัสผ่าน : 
                                <input name="pwd" type="password" id="pwd2" style="height:18px;" size="15">
                                </font></td>
                              <td width="17%" align="center"><font color="#FFFFFF">
                                <input type="submit" name="Submit" value="login">
                                </font></td>
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
                <td width="99%" align="left" valign="middle" background="immage/bg002.jpg"><blockquote>
                    <p></p>
                    
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
    <td align="center"> <br> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="20" align="left" valign="top" bgcolor="#00CCFF"> 
            <? include("$data.php"); ?>
          </td>
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
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
  </tr>
</table>
<table width="95%" border="0" cellpadding="0" cellspacing="0" background="../npe/images/footer_r1_c2.jpg">
  <tr> 
    <td height="45" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="12%" align="right" valign="bottom"><img src="immage/bg001.png" width="121" height="92"></td>
          <td width="88%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="46" valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
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