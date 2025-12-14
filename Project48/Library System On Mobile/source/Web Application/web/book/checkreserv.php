<?
session_register("SessionMember");


if($SessionMember == ""){
?>
	<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ขณะนี้คุณยังไม่ได้ Login เข้าสู้ระบบ.............</b>
		  [ <A  href="login.htm" >กลับไปหน้า login ใหม่</A> ]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

<?
}else{
?>

<?php


/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");




	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

// ตรวจสอบตัวแปรคุกกี้ numCounter ว่ามีการกำหนดค่าไว้หรือไม่
//if ( isset($_COOKIE[$catalog]) ) {
	





If (($unitOne == "") or  ($catalog=="") or ($unitTwo=="") or ($unitThree == ""))
	{
		echo "โปรดกรอกข้อมูลให้ครบ (โดยเฉพาะฟิลด์ที่มี *)";
		echo "<br><br><a href =borrow.htm>กรอกข้อมูลใหม่</a>";
	}

else
{
$code = "$unitOne$unitTwo$unitThree";
//echo $code;

if (isset($_COOKIE[$catalog])&&($_COOKIE[$code]) )

{

$catalog = $_COOKIE[$catalog];
$code = $_COOKIE[$code];

$sql_getname  =  "select * from book where  code='$code'&&catalog='$catalog'";
$db_query_getname = mysql_db_query ($dbname, $sql_getname);
$result_getname = mysql_fetch_array($db_query_getname);


$name_reserv = $result_getname[name_reserv];
//echo $id_student;


//echo" หนังสือยังได้ถูกจองไปแล้ว โดย  ";
?>
<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>หนังสือได้ถูกจองไปแล้ว.....ไม่สามารถจองได้   </b><br>หนังสือได้ถูกจอง โดย : <? echo  $name_reserv ;?>      
		  [ <A  href="borrow.htm" >กลับไปหน้าแรก</A> ]</center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="list_addmin.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
<?

$code = $_COOKIE[$code]; 
$catalog = $_COOKIE[$catalog]; 


//echo $_COOKIE[$code];
//echo $_COOKIE[$catalog];

$sql = "select * from book where code = '$code'";
$db_query = mysql_db_query ($dbname, $sql);
$result = mysql_fetch_array($db_query);


$id_student = $result[id_student];
//echo $id_student;


}

else{



//echo "หนังสือยังไม่ได้ถูกจอง";



print <<<EOT
<HTML><HEAD><TITLE>:: ระบบห้องสมุดบนมือถือ ::</TITLE>
<META 
content=freewebboard,freeguestbook,freepoll,freescript,PHP,devforum,thai,ฟรีเว็บบอร์ด,ฟรีสมุดเยี่ยม,ฟรีโพลล์ 
name=keywords>
<META 
content="Thai PHP Developer Freewebboard Freeguestbook Freepoll FreescriptPHP devforum เว็บบอร์ดฟรีที่ดีที่สุดในประเทศ" 
name=description>
<META http-equiv=Content-Type content="text/html; charset=tis-620"><LINK 
href="webboard/style.css" 
type=text/css rel=stylesheet>
<SCRIPT language=JavaScript>
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</SCRIPT>
<STYLE type=text/css>A:link {
	FONT-SIZE: x-small; COLOR: #005ca2; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: underline
}
A:visited {
	FONT-SIZE: x-small; COLOR: green; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: underline
}
A:active {
	FONT-SIZE: x-small; COLOR: #0099ff; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: x-small; COLOR: #0099ff; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"; TEXT-DECORATION: none
}
TD {
	FONT-SIZE: x-small; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"
}
INPUT {
	BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; FONT-SIZE: 10pt; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"
}
TEXTAREA {
	BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; FONT-SIZE: x-small; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid; FONT-FAMILY: "MS Sans Serif", "Microsoft Sans Serif"
}
</STYLE>

<META content="MSHTML 6.00.2800.1458" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff>
<SCRIPT 
src="webboard/photo2mobileJS.js"></SCRIPT>





<FORM  action=addreserv.php method=post > 
<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="60%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สามารถทำการจองหนังสือเล่มนี้ได้</B></FONT></DIV></TD></TR>
  <TR>
    <TD bgColor=#ffffff><BR>
      <TABLE width="95%" align=center border=0>
        <TBODY>
        
   

  
 
      <TR>
  
  <TD>ชื่อ-นามสกุล  :</TD>
<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT Type=Text maxLength=40 size=40   name= name_reserv>* </TR>
 
<!-- <TR>
	<TD>รหัสนักศึกษา</TD>
	<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT Type=Text maxLength=10 size=10  name=id_student >*</TD> </TR> -->
	
	<input type = hidden name =code value = $code>
	<input type = hidden name =catalog value = $catalog>
  
 <TR>
      


           <TD>&nbsp;</TD> <TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=submit value="ยืนยันการจอง" name=Action> <INPUT type=reset value="ลบ" name=Action> *  <BR>* ชื่อ-นามสกุล นี้จะใช้เป็นหลักฐานในการมารับหนังสือ  <BR><BR></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD bgColor=#f0f0f0><div align="center"><FONT face=Verdana size=2>ระบบห้องสมุดบนมือถือ 
          :: Powered by นายปัณณวิช สุวัฒนวนิช กับ นายสุรัช วังรัตนชัย :: 2006 
          All rights reserved. </FONT><FONT color=white size=1><A 
      href="http://t.extreme-dm.com/?login=212cafe" target=_blank><IMG height=1 
      alt="" 
      src="webboard/i.gif" 
      width=1 border=0></A> </FONT></div></TD></TR></TBODY></TABLE></FORM>




</body>
</html>

EOT;



	}	
}	

?>

<?
	}
?>

