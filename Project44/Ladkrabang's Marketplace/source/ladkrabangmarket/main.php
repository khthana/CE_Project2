<html>
<head>
<title>Main Menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
<style type="text/css">
	<!-- 
BODY {font-family:;font-size="10"}
	A:link { color: blue }
	A:visited { color: blue }
	A:hover { color: darkorange }
	A:active { color: blue }
	p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
	-->
</style>
</head>
<body bgcolor="#FFFFFF">
<div align="center"> 
  <table width="100%" border="0">
    <tr>
      <td bgcolor="#9999FF"> 
        <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="1" color="#000FF"><b><font color="#FFFFFF">หมวดหมู่สินค้า</font></b></font></div>
      </td>
    </tr>
  </table>
  <table width="73%" border="0" height="0">
    <tr valign="top"> 
      <td height="288"> 
        <table border=0 cellpadding=0 cellspacing=0 width="571" height="288">
          <tbody> 
          <tr valign=top> 
            <td height="73" width="57"> <img border=0 height=62 src="images/book.gif" width=55></td>
            <td height="73" width="2"><img height=1 src="./images/tc.gif" width=2></td>
            <td height="73" width="234"> 
              <table border=0 cellpadding=0 cellspacing=0 width=207>
                <tbody> 
                <tr> 
                  <?
	include("config.inc.php");
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
    $result = mysql_db_query($dbname, "select code from post  where code like 'B%' ");
	$NRow = mysql_num_rows($result);

?>
                  <td><font face="MS Sans Serif, CordiaUPC" size=1><b><img src="images/bullet.gif" width="6" height="11" border="0"> 
                    <a href="webboard.php?menu=B">สิ่งพิมพ์</a> 
                    <?echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </b></font> </td>
                </tr>
                <tr> 
                  <td colspan="2"><img height=3 src="./images/tc.gif" width=1></td>
                </tr>
                <tr> 
                  <td height="25" colspan="2"><font color="#000099" face="MS Sans Serif" size="1">หนังสือ, 
                    Sheet, ตำรา, สื่อการสอน ,แผ่นใส,Text Book,การ์ตูน,หนังสือพิมพ์,ใบปลิว,หนังสือเก่า,...</font></td>
                </tr>
                </tbody> 
              </table>
            </td>
            <td height="73" width="10"><img height=1 src="./images/tc.gif"     width=10></td>
            <td height="73" width="55"><img border=0 height=62 src="images/accessory.gif" width=55></td>
            <td height="73" width="2"><img height=1 src="./images/tc.gif" width=2></td>
            <td height="73" width="329"> 
              <table border=0 cellpadding=0 cellspacing=0 width=224>
                <tbody> 
                <tr> 
                  <?
             $result = mysql_db_query($dbname, "select code from post  where code like 'E%' ");
        	$NRow = mysql_num_rows($result);
			?>
                  <td><font color="#0000FF"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><img src="images/bullet.gif" width="6" height="11"><b> 
                    <a href="webboard.php?menu=E">อุปกรณ์การเรียน</a></b></font><font color="#FF0000"> 
                    <? echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </font></font></td>
                </tr>
                <tr> 
                  <td><img height=3 src="./images/tc.gif"  width=1></td>
                </tr>
                <tr> 
                  <td><font color=#000099 face="MS Sans Serif, CordiaUPC"  size=1>เครื่องคิดเลข, 
                    ปากกา,ยางลบ,กล่องดินสอ ,ดินสอ,ไม้บรรทัด,กล่องดินสอ,สมุด,Talking 
                    Dictionary,แผ่นดิสค์,...</font></td>
                </tr>
                </tbody> 
              </table>
            </td>
          </tr>
          <tr valign=top> 
            <td width=57 height="70"><img border=0 height=62 src="images/hostel.gif" width=55></td>
            <td width=2 height="70"><img height=1 src="f./images/tc.gif" width=2></td>
            <td width=234 height="70"> 
              <table border=0 cellpadding=0 cellspacing=0 width=189>
                <tbody> 
                <tr> 
                  <?
             $result = mysql_db_query($dbname, "select code from post  where code like 'H%' ");
        	$NRow = mysql_num_rows($result);
			?>
                  <td height="16"> <font color="#0000FF"> <b><font size="1" face="MS Sans Serif, Microsoft Sans Serif"><img src="images/bullet.gif" width="6" height="11" border="0"> 
                    <a href="webboard.php?menu=H">ที่พัก</a><font color="#FF0000"> 
                    <?echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </font></font> </b> </font></td>
                </tr>
                <tr> 
                  <td><img height=3 src="./image/tc.gif" width=1></td>
                </tr>
                <tr> 
                  <td><font color=#000099 face="MS Sans Serif, CordiaUPC"     size=1>หอพัก 
                    , บ้าน, คอนโด, ทาวเฮาส์, เต็นท์,อพาร์ทเมนท์ ,แสดงความคิดเห็นเกียวกับที่พัก, 
                    ...</font></td>
                </tr>
                </tbody> 
              </table>
            </td>
            <td width=10 height="70"><img height=1 src="./images/tc.gif"        width=10></td>
            <td width=55 height="70"><img border=0 height=62 src="images/vehicle.gif" width=55></td>
            <td width=2 height="70"><img height=1 src="./images/tc.gif" width=2></td>
            <td width=329 height="70"> 
              <table border=0 cellpadding=0 cellspacing=0 width=186>
                <tbody> 
                <tr> 
                  <?
             $result = mysql_db_query($dbname, "select code from post  where code like 'V%' ");
        	$NRow = mysql_num_rows($result);
			?>
                  <td><font color="#0000FF"> <font face="MS Sans Serif, Microsoft Sans Serif" size="1"><img src="images/bullet.gif" width="6" height="11" border="0"><b> 
                    <a href="webboard.php?menu=V">ยานพาหนะ</a></b><font color="#FF0000"> 
                    <?echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </font> </font></font></td>
                </tr>
                <tr> 
                  <td><img height=3 src="./images/tc.gif" width=1></td>
                </tr>
                <tr> 
                  <td height="27"> <font color=#000099 face="MS Sans Serif, CordiaUPC" 
                  size=1>รถจักรยาน,รถยนต์,รถจักรยานยนต์,สเก็ตบอร์ด,...</font></td>
                </tr>
                </tbody> 
              </table>
            </td>
          </tr>
          <tr valign=top> 
            <td width=57 height="60"><img  border=0 height=62 src="images/friends.gif" width=55></td>
            <td width=2 height="60"><img height=1 src="./images/tc.gif" width=2></td>
            <td width=234 height="60"> 
              <table border=0 cellpadding=0 cellspacing=0 width=189>
                <tbody> 
                <tr> 
                  <?
             $result = mysql_db_query($dbname, "select code from post  where code like 'F%' ");
        	$NRow = mysql_num_rows($result);
			?>
                  <td><font color="#0000FF"> <b><font face="MS Sans Serif, Microsoft Sans Serif" size="1"><img src="images/bullet.gif" width="6" height="11" border="0"> 
                    <a href="webboard.php?menu=F">หาเพื่อน</a><font color="#FF0000"> 
                    <?echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </font> </font></b></font></td>
                </tr>
                <tr> 
                  <td><img height=3 src="./images/tc.gif" width=1></td>
                </tr>
                <tr> 
                  <td height="34"><font color=#000099 face="MS Sans Serif, CordiaUPC"                  size=1>หาเพื่อนคุย,เพื่อนร่วมห้อง,เพื่อนทำกิจกรรม 
                    ,เพื่อนเที่ยว,เพื่อนใหม่,...</font></td>
                </tr>
                </tbody> 
              </table>
            </td>
            <td width=10 height="60"><img height=1 src="./images/tc.gif"      width=10></td>
            <td width=55 height="60"><img   border=0 height=62 src="images/notices.gif" width=55></td>
            <td width=2 height="60"><img height=1 src="./images/tc.gif" width=2></td>
            <td width=329 height="60"> 
              <table border=0 cellpadding=0 cellspacing=0 width=249>
                <tbody> 
                <tr> 
                  <?
             $result = mysql_db_query($dbname, "select code from post  where code like 'N%' ");
        	$NRow = mysql_num_rows($result);
			?>
                  <td><font color="#0000FF"> <font face="MS Sans Serif, Microsoft Sans Serif" size="1"><b><img src="images/bullet.gif" width="6" height="11" border="0"> 
                    <a href="webboard.php?menu=N">ข่าวฝากประกาศ</a></b><font color="#FF0000"> 
                    <?echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </font></font></font></td>
                </tr>
                <tr> 
                  <td><img height=3 src="./images/tc.gif"  width=1></td>
                </tr>
                <tr> 
                  <td height="24"> 
                    <p><font color=#000099 face="MS Sans Serif, CordiaUPC" 
                  size=1><font face="MS Sans Serif">ข่าวทั่วไป,ประกาศหางาน,หาคนช่วยงาน,รับจ้างทั่วไป,...</font></font></p>
                  </td>
                </tr>
                </tbody> 
              </table>
            </td>
          </tr>
          <tr valign=top> 
            <td width=57 height="60"><img src="images/lost.gif" width="55" height="60"></td>
            <td width=2 height="60"><img height=1 src="./images/tc.gif" width=2></td>
            <td width=234 height="60"> 
              <table border=0 cellpadding=0 cellspacing=0 width=186>
                <tbody> 
                <tr> 
                  <?
             $result = mysql_db_query($dbname, "select code from post  where code like 'L%' ");
        	$NRow = mysql_num_rows($result);
			?>
                  <td><b><font face="MS Sans Serif" size="1"><img src="images/bullet.gif" width="6" height="11" border="0"> 
                    <a href="webboard.php?menu=L">ประกาศของหาย</a><font color="#FF0000"> 
                    <?echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </font></font></b></td>
                </tr>
                <tr> 
                  <td><img height=3 src="./images/tc.gif" 
width=1></td>
                </tr>
                <tr> 
                  <td><font face="MS Sans Serif, CordiaUPC" size="1" color="#000099">ประกาศของหาย,เจอของหาย,หาเพื่อนช่วยหาของ,...</font><font face="MS Sans Serif" size="1"></font></td>
                </tr>
                </tbody> 
              </table>
            </td>
            <td width=10 height="60"><img height=1 src="./images/tc.gif" 
          width=10></td>
            <td width=55 height="60"><img 
            border=0 height=62 src="images/etc.gif" width=55></td>
            <td width=2 height="60"><img height=1 src="./images/tc.gif" width=2></td>
            <td width=329 height="60"> 
              <table border=0 cellpadding=0 cellspacing=0 width=182>
                <tbody> 
                <tr> 
                  <?
             $result = mysql_db_query($dbname, "select code from post  where code like 'A%' ");
        	$NRow = mysql_num_rows($result);
			?>
                  <td><font face="MS Sans Serif, CordiaUPC" size=1><font color="#0000FF"><img src="images/bullet.gif" width="6" height="11" border="0"><b> 
                    <a href="webboard.php?menu=A">อื่น ๆ</a></b> </font><font color="#FF0000"> 
                    <?echo" <font size=1 face='MS Sans Serif' color=red><b>( $NRow  )</b></font>"; ?>
                    </font> </font></td>
                </tr>
                <tr> 
                  <td height="6"><img height=3 src="./images/tc.gif" 
width=1></td>
                </tr>
                <tr> 
                  <td><font color=#000099 face="MS Sans Serif, CordiaUPC" 
                  size=1>Cd,Tape,Vdo,Vcd, Dvd,เครื่องดนตรี,อาหาร,เฟอร์นิเจอร์,,เครื่องนอน,,เสื้อผ้า,อุปกรณ์กีฬา,... 
                    </font></td>
                </tr>
                </tbody> 
              </table>
              <b></b></td>
          </tr>
          </tbody> 
        </table>
      </td>
    </tr>
  </table>
  <?
      if( file_exists("admin/news/news.html") ){
																	 echo"  <hr color=1E90FF>";
																	 include("admin/news/news.html");
																	 	}


  ?>
  <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font face="MS Sans Serif" size="1" color="#0000FF">Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
  <br>
</div>
</body>
</html>
