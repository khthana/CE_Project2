<?php 

@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c";
	//echo"$a_date";

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>:: ระบบห้องสมุดบนมือถือ ::</title>
<link rel="stylesheet"
      href="text.css"
      type="text/css" >
<!-- <meta http-equiv="Content-Type" content="text/html; charset=windows-874"> -->
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">

</head>

<body>

<table width="980" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr> 
    <td width="90" height="20" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td width="90" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
      </table></td>
    <td width="800" rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td width="800" height="95" valign="top"><div align="right"><img src="picture/head1.gif" width="800" height="95"></div></td>
        </tr>
      </table></td>
    <td width="90" rowspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td width="90" height="529" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="75"></td>
  </tr>
  <tr> 
    <td height="434"></td>
    <td rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <!--DWLayoutTable-->
        <tr> 
          <td height="35" colspan="5" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="800" height="2"></td>
              </tr>
              <tr> 
                <td height="33" valign="top"><table width="100%" border="2" bordercolor="#000000" bgcolor="#000000">
                    <!--DWLayoutTable-->
                    <tr bordercolor="#000000" bgcolor="#CCCCCC"> 
                      <td width="18%" height="29" bordercolor="#CCCCCC"><div align="center">[ 
                          <a href="#">Home</a> ]</div></td>
                      <td width="18%" bordercolor="#CCCCCC"><div align="center">[ 
                          <a href="library_services.htm">Library Services</a> 
                          ]</div></td>
                      <td width="25%" bordercolor="#CCCCCC"><div align="center">[ 
                          <a href="audio.htm">Audio-Visual Services</a> ]</div></td>
                      <td width="18%" bordercolor="#CCCCCC"><div align="center">[ 
                          <a href="archives.htm">Archives</a> ]</div></td>
                      <td width="21%" bordercolor="#CCCCCC"><div align="center">[ 
                          <a href="login.htm">Librarian</a> ]</div></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="20" colspan="5" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="800" height="20"><div align="right"> 
                    <DIV align=right></DIV>
                  </div></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="216" rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="200" height="197" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <!--DWLayoutTable-->
                    <tr> 
                      <td width="200" height="197" valign="top"><table width="100%" border="1" bordercolor="#666666">
                          <tr> 
                            <td bgcolor="#CCCCCC"><div align="center"><font color="#000000">ข้อมูลทั้วไปเกี่ยวกับห้องสมุด</font></div></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="activity.htm">ปฎิทินกิจกรรม</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="plan.htm">แผนผังห้องสมุด</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="map.htm">แผนที่</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="member.htm">สมาชิก</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="timeonoff.htm">เวลาเปิดปิดบริการ</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="holiday.htm">วันหยุดประจำปี</a></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="163" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <!--DWLayoutTable-->
                    <tr> 
                      <td width="200" height="163" valign="top"><table width="100%" border="1" bordercolor="#666666">
                          <tr> 
                            <td bgcolor="#CCCCCC"><div align="center">ห้องสมุดคณะในสถาบัน</div></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="http://www.kmitl.ac.th/englib/">ห้องสมุดคณะวิศวกรรมศาสตร์</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="http://www.kmitl.ac.th/%7Ewebsci/libsci_files/libsci.htm">ห้องสมุดคณะวิทยาศาสตร์</a></td>
                          </tr>
                          <tr> 
                            <td> <img src="picture/arrow_rg.gif" width="5" height="7"><a href="http://www.arch.kmitl.ac.th/lib/lib_index.php/">ห้องสมุดคณะสถาปัตยกรรมศาสตร์</a> 
                            </td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="http://www.inded.kmitl.ac.th/www/modules.php?name=Content&pa=showpage&pid=35">ห้องสมุดคณะครุศาสตร์อุตสาฯ</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="http://lib.agri.kmitl.ac.th/">ห้องสมุดคณะเทคโนโลยีการเกษตร</a></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="4"></td>
              </tr>
              <tr> 
                <td height="1"></td>
              </tr>
            </table></td>
          <td width="28" rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="30" height="376">&nbsp;</td>
              </tr>
            </table></td>
          <td width="327" height="353" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="327" height="187" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <!--DWLayoutTable-->
                    <tr> 
                      <td width="327" height="187" valign="top"><table width="100%" border="1" bordercolor="#666666">
                          <tr> 
                            <td bgcolor="#CCCCCC"><div align="center">ข่าวบริการ</div></td>
                          </tr>
                          <tr> 
                            <td> <img src="picture/ann_old.gif" width="13" height="11" align="absmiddle"> 
                              <a href="data/detail01.doc">บริการฉายภาพยนตร์</a> <img src="picture/word.gif" width="16" height="16" align="absmiddle"></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/ann_old.gif" width="13" height="11"> 
                              <a href="data/detail02.doc">งานบริการโสตทัศนศึกษา</a> 
                              <img src="picture/word.gif" width="16" height="16" align="absmiddle"></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/ann_old.gif" width="13" height="11"> 
                              <a href="data/detail03.pdf">ฐานข้อมูล E-Book DAO 
                              Fulltext</a> <img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/ann_old.gif" width="13" height="11"> 
                              <a href="data/detail04.pdf">ฐานข้อมูล E-Book NetLibrary</a> 
                              <img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/ann_old.gif" width="13" height="11"> 
                              <a href="data/detail05.pdf">ฐานข้อมูล SpringerLink 
                              eBooks</a> <img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="166" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <!--DWLayoutTable-->
                    <tr> 
                      <td width="327" height="166" valign="top"><table width="100%" border="1" bordercolor="#666666">
                          <tr> 
                            <td bgcolor="#CCCCCC"><div align="center">จดหมายข่าว</div></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"> 
                              <a href="data/january2549.pdf">ข่าวสำนักห้อสมุดกลางประจำเดือนมกรรคม 
                              2549</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"> 
                              <a href="data/december2548.pdf">ข่าวสำนักห้อสมุดกลางประจำเดือนธันวาคม 
                              2548</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"> 
                              <a href="data/november2548.pdf">ข่าวสำนักห้อสมุดกลางประจำเดือนพฤศจิกายน 
                              2548</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"> 
                              <a href="data/september2548.pdf">ข่าวสำนักห้อสมุดกลางประจำเดือนกันยายน 
                              2548</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/acrobat.gif" width="17" height="17" align="absmiddle"> 
                              <a href="data/august2548.pdf">ข่าวสำนักห้อสมุดกลางประจำเดือนสิงหาคม 
                              2548</a></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="28" rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="30" height="376">&nbsp;</td>
              </tr>
            </table></td>
          <td width="201" rowspan="2" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="201" height="110" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <!--DWLayoutTable-->
                    <tr> 
                      <td width="201" height="110" valign="top"><table width="100%" border="1" bordercolor="#666666">
                          <tr> 
                            <td bgcolor="#CCCCCC"><div align="center">Library 
                                Services</div></td>
                          </tr>
                          <tr> 
                            <td> <img src="picture/arrow_rg.gif" width="5" height="7"><a href="search.htm">สืบค้นทรัพยากร 
                              สารนิเทศ</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="formguestbook.htm">ข้อเสนอแนะ</a></td>
                          </tr>
                          <tr> 
                            <td><img src="picture/arrow_rg.gif" width="5" height="7"><a href="search_borrow.htm">ตรวจสอบการยืม/การยืมต่อ</a></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="266" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <!--DWLayoutTable-->
                    <tr> 
                      <td width="201" height="130" valign="top"><table width="85%" border="1" align="center" bordercolor="#666666">
                          <tr> 
                            <td bgcolor="#CCCCCC"><div align="center">Link</div></td>
                          </tr>
                          <tr> 
                            <td bordercolor="#FFFFFF"><a href="https://webmail.kmitl.ac.th/src/login.php?secure_login=yes" target="_blank"><img src="picture/icon1.gif" width="160" height="40" border="0"></a></td>
                          </tr>
                          <tr> 
                            <td bordercolor="#FFFFFF"><a href="http://webserv.kmitl.ac.th/%7Ekmitldb/forum/webboard.php" target="_blank"><img src="picture/icon2.gif" width="160" height="40" border="0"></a></td>
                          </tr>
                          <tr> 
                            <td bordercolor="#FFFFFF"><a href="http://www.reg.kmitl.ac.th" target="_blank"><img src="picture/icon3.gif" width="160" height="40" border="0"></a></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="98"> 
                        <table width="50%" border="1" align="center" bordercolor="#666666">
                          <tr> 
                            <td bgcolor="#CCCCCC"> <div align="center">จำนวนผู้เข้าชมเว็บ</div></td>
                          </tr>
                          <tr>
                            <td bordercolor="#FFFFFF">
                              <?php
# กำหนดรูปแบบของตัวนับ image กับ text
$style = "image";

# กำหนดค่าความกว้างความสูงของไฟล์รูปภาพ
$height = "25";
$width = "16";

# กำหนดชื่อไฟล์เก็บค่าตัวนับ
$hitsfile = "counter.dat";

$images = dirname( __FILE__ ) . "/images";
$images = str_replace( $DOCUMENT_ROOT, "", $images );

# ตรวจสอบว่ามีไฟล์ที่กำหนดจากตัวแปร $hitsfile อยู่หรือไม่
if ( file_exists( $hitsfile ) ) 	
	{		
		# อ่านค่าจากไฟล์ แล้วทำการบวกเพิ่มทีละ 1		
		$hits = file( $hitsfile );		
		$hits = $hits[0] + 1;		

		$fp = fopen( $hitsfile, "w" );		
		fwrite( $fp, $hits );		
		fclose( $fp );	
	}
else	
	{		
		$fp = fopen( $hitsfile, "w" );		
		fwrite( $fp, "1" );		
		fclose( $fp );	
		$hits = 1;
	}
# ตรวจสอบค่าของตัวแปร $style
if ( $style == "text" ) 		
	echo $hits;
else 	
	{		
		# แสดงตัวเลขด้วยรูปภาพ โดยใช้คำสั่ง for และ strlen ออกมาทีละ 1 ตำแหน่ง
		$digit = "0000000" . strval( $hits );
		$digit = substr( $digit, -7 );
		for ( $i = 0; $i < strlen( $digit ); $i++ ) 				
			echo "<img src=$images/$digit[$i].gif height=$height width=$width alt=$hits>";
	}
?>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="23"></td>
        </tr>
        <tr> 
          <td height="4"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr> 
          <td height="30" colspan="5" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr> 
                <td width="800" height="30" valign="top"><table width="100%" border="0">
                    <tr> 
                      <td bgcolor="#CCCCCC"><div align="center"><FONT face=Verdana size=2>ระบบห้องสมุดบนมือถือ 
                          :: Powered by นายปัณณวิช สุวัฒนวนิช กับ นายสุรัช วังรัตนชัย 
                          :: 2006 All rights reserved. </FONT><FONT color=white size=1><A 
      href="http://t.extreme-dm.com/?login=212cafe" target=_blank><IMG height=1 
      alt="" 
      src="webboard/i.gif" 
      width=1 border=0></A> </FONT></div></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="1"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="35"></td>
    <td></td>
  </tr>
</table>
</body>
</html>
