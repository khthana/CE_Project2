<?php
session_start();
?>
<html>
<head>
<title></title>

<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<body bgcolor="#EAF9FD">
<?
include("config.inc.php");
include("datedel.php");
include("md5.js");
$rn=rand();

if($name&&$pwd)
{

	mysql_connect($host,$user,$passwd);
    $sql = "select username,password from member where username='$name'";
	$result=mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0)
	{ 
		$nomember=1;
	
	}
	else
	{
			$row = mysql_fetch_array($result);

			$pwd1=$row["password"];
			$pwd1=MD5($pwd1).$challenge;
			$pwd1=MD5($pwd1);


			// ตรวจสอบว่า Password ถูกหรือไม่	
			if($name==$row["username"] && $pwd==$pwd1) 
				{ 
			//		$membername=$name;
	//				$pwd_s=$password;
					session_register("SESSION");
					$SESSION["membername"]=$name;
					$SESSION["pwd_s"]=$pwd;
					//session_register("membername");
					//session_register("pwd_s");
					
					}
    	}	
		mysql_close();
}


if(!isset($SESSION[membername]))
{
//ฟอร์ม login
echo"<table width='150' border='0' cellspacing='1' cellpadding='0' bgcolor='#578CF3'>";
echo"  <tr align='center'> ";
echo"    <td> ";
echo"      <table width='100' border='0' cellspacing='0' cellpadding='1'>";
echo"        <tr> ";
echo"           <td nowrap> ";
echo"             <div align=center><font size='1' color='#FFFFFF' face='MS Sans Serif, Microsoft Sans Serif' class='fsize8'><b>สมาชิก</b></font></div>";
echo"           </td>";
echo"           <td nowrap> ";
echo"             <div align=center><font size='1' color='#FFFFFF' face='MS Sans Serif, Microsoft Sans Serif' class='fsize8'><b>[<a href='accept.html' target='mainFrame'>"; 
echo"               <font color='#FFFFFF'>สมัครสมาชิก</font></a>]</b></font></div>";
echo"           </td>";
echo"         </tr>";
echo"       </table>";
  echo"   </td>";
echo"   </tr>";
echo"   <tr bgcolor='#C7E2FE'> ";
echo"     <td> ";
echo"       <table border='0' cellspacing='1' cellpadding='0'>";

//echo"    <form  method='POST'  name='weblogin'  onsubmit='return check()' >";
echo"    <form  method='POST'  name='weblogin'  onsubmit='return check()' autocomplete='off'>";
echo"           <tr> ";
echo"             <td align='right'><font face='Verdana, Arial, Helvetica, sans-serif' size='1' color='#000000' class='fsize10'>Username:</font></td> ";
echo"             <td><font face='MS Sans Serif' size='1' color='#000000'> ";
echo"               <input type='text' name='name' maxlength='25' size='8'>";
echo"               </font></td>";
echo"           </tr>";
echo"           <tr> ";
echo"             <td align='right'><font face='Verdana, Arial, Helvetica, sans-serif' size='1' color='#000000' class='fsize10'>Password:</font></td>";
echo"             <td><font face='MS Sans Serif' size='1' color='#000000'> ";
echo"               <input type='password' name='pwd' maxlength='25' size='8'>";
echo"               </font></td>";
echo"           </tr>";
echo"           <tr> ";
echo"             <td nowrap height='30'><font face='MS Sans Serif, CordiaUPC' size='1' color='#000000' class='fsize8'> ";
echo"               &nbsp;</font></td>";
echo"	<INPUT type=hidden value=$rn   name=challenge>";//////

echo" 	<td nowrap height='30'><input type='image'  src='images/member_login.gif' width='35' height='16' border='0'>";
echo" 			  <img src='.././marketplace/images/tc.gif' width='1' height='1'><a href='formforget.html' target='mainFrame'><img src='.././ladkrabangmarket/images/ic_2.gif' width='14' height='17' alt='ลืมรหัสผ่าน&quot;กดที่นี้&quot;' border='0'></a> ";
echo"             </td>";
echo"           </tr>";
echo"         </form>";
echo"       </table>";
echo"     </td>";
echo"   </tr>";
echo" </table>";
echo" <br>";
////////////
}
else
{
//ของสมาชิก
?>
<TABLE border="0" width="100%" cellspacing="0" cellpadding="0">
<TR>
<TD valign="top" width="150"><LINK href="leftstyle.css" type="text/css" rel=stylesheet> 
<TABLE border=0 cellpadding=0 cellspacing=0 width=150 class="topics">
<TR>
<TD class=heading width=7 bgcolor="#0066C" height="18"></TD>
          <TD class=heading style="PADDING-LEFT: 2px" bgcolor="#33CCFF"><B><font face="MS Sans Serif, Microsoft Sans Serif" size="1">:: 
            สมาชิก!</font></B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
          <TD class=topics><B><a href='postself.php' target='mainFrame'><font face="MS Sans Serif, Microsoft Sans Serif" size="1">:: 
            ประกาศของ</font> 
            <?echo $SESSION[membername] ?>
            </A></B></TD>
</TR>
<? echo"
		  <TR bordercolor='#CCCCCC'>
<TD bgcolor='#0066C'></TD>

		  <TD class=topics><B><a href='showintro.php?membername=$SESSION[membername]' target='mainFrame'><font face='MS Sans Serif, Microsoft Sans Serif' size=1>:: 
            อ่านคำแนะนำติชม</font></A></B></TD>
</TR> ";
?>
		  <TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
          <TD class=topics><B><a href='editprofile.php?action=login' target='mainFrame'><font face="MS Sans Serif, Microsoft Sans Serif" size="1">:: 
            แก้ไขข้อมูลสมาชิก</font></A></B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
          <TD class=topics><B><a href='fromdel.php' target='mainFrame'><font face="MS Sans Serif, Microsoft Sans Serif" size="1">:: 
            ลบประกาศ</font></A></B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
          <TD class=topics><B><a href='../index.php'  target='_top'><font face="MS Sans Serif, Microsoft Sans Serif" size="1">:: 
            ออกจากระบบ </font></A></B></TD>
</TR>
<TR >
<TD style="BORDER-BOTTOM: 0px" bgcolor="#0066C"></TD>
<TD class=topics style="BORDER-BOTTOM: 0px" valign=bottom align=right><IMG border=0 height=16 src="images/corner.gif" width=16></TD>
</TR>
</TABLE>
</table>

<?
}
?>
<style type="text/css">
	<!-- 
	BODY {font-family:;font-size="10"}
	A:link {text-decoration: none; color: white }
	A:visited {text-decoration: none; color: white }
	A:hover {text-decoration: none; color: darkorange }
	A:active {text-decoration: none; color: white }
	p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
	-->
</style>
<!----------------------->
<form method=post action="search/search.php" name="SearchForm" onsubmit="return checks()" target="mainFrame">
<table width="150" cellspacing="0" border="1" bordercolor="#578CF3" bgcolor="#C7E2FE">
  <td bgcolor="#578CF3" height="15"> 
    <div align="center"><font face="MS Sans Serif, CordiaUPC" size="1" color="#FFFFFF" class="fsize8" align="center"><b>&nbsp;ค้นหา</b></font></div>
  </td>
  </tr>
  <tr valign="top"> 
    <td height="0"> 
      <table width="100%" border="0">
        <tr> 
          <td> 
            <div align="center">  <div align="center"><font face="MS Sans Serif, CordiaUPC" size="1">
                <input type="text" name="search" size="14"></font>
            </div>
          </div></td>
        </tr>
        <tr> 
          <td> 
            <div align="center">
              <select name="select">
                  <option value="C" selected>--- ทุกหมวด ---</option>
                  <option value="B">สิ่งพิมพ์</option>
                  <option value="V">ยานพาหนะ</option>
                  <option value="E">อุปกรณ์การเรียน</option>
                  <option value="H">ที่พัก</option>
                  <option value="F">หาเพื่อน</option>
                  <option value="N">ข่าวประกาศ</option>
                  <option value="A">อื่นๆ</option>
                 <option value="L">แจ้งของหาย</option>
				</select>
            </div>
          </td>
        </tr>
        <tr> 
          <td>
           <div align="center">
			    <input type='image' border='0' name='imageField1' src='.././ladkrabangmarket/images/go.gif' width='43' height='20' alt='search'>
              </div>
<!---
			  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                <a href="search.php" target="mainFrame"><img src="images/GO.GIF" width="23" height="21" border="0" alt="search"></a> 
                </font></div>
          
		--->  
		  </td>
        </tr>
        <tr> 
          <td>
              <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2"><a href="search/advsearch.html" target="mainFrame"><img src="images/advsearch.jpg" width="90" height="20" border="0"></a></font></b></font></div>
          </td>
        </tr>
      </table>
    </td>
</table>

</form>
<!---- ส่วนของผู้ดูแล ------>
<table width="150" border="0">
  <tr bgcolor="#578CF3"> 
    <!---<td> 
      <div align="center"><font face="MS Sans Serif" size="1" ><b><a href="loginadmin.php" 
	 // target="_blank" >Administrator</a></b></font></div> 
 
	</td> -->
  </tr>
  <tr> 
    <td height="10">&nbsp; </td>
  </tr>
  <?
  echo"<tr bgcolor=#578CF3> ";
echo"    <td> ";
//	  $date=date("d-F-Y",mktime(0,0,0,0,date("Y")+543) ); //วันที่

 // $date=date("d-F-Y"); //วันที่

//$date=date("d/m/y",mktime(0,0,0,date("m")+$duration) );
echo"      <div align=center>";
//<font face=MS Sans Serif size=1 color=#FFFFFF><b>$date</b></font></div>";
?>

  <script  language="JavaScript">

	  var days = new Array("อาทิตย์","จันทร์","อังคาร","พุธ","พฤหัสบดี","ศุกร์","เสาร์");

      var months = new Array("ม.ค.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค."); 

      var dateObj = new Date(); 

      var wday = days[dateObj.getDay()];

      var lmonth = months[dateObj.getMonth()];

      var date = dateObj.getDate();

      var fyear = (543+(dateObj.getYear()));

      document.write('<font face=MS Sans Serif size=2 color=#FFFFFF><b>');

      document.write('  '+' วันที่ ' +date+' '+ lmonth+' '+ fyear+' ');

      document.write('</b></font>');

</script>

<?
echo"   </div>	</td>";
echo"  </tr>";

if($nomember==1){
									?>
									<script language="JavaScript">
									<!--
								     alert("ไม่ใช่สมาชิก กรุณาตรวจสอบข้อมูล หรือ  สมัครสมาชิกก่อน");
								      document.weblogin.name.focus();        
										//-->
										</script>
								       <?
								}
?>
</table>
<p>&nbsp;</p>
<blockquote> 
  <blockquote> 
    <blockquote> 
      <blockquote> 
        <blockquote> 
          <blockquote>
            <p><br>
            </p>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>

<script language="JavaScript">
<!--
function check()
{
	  var v1 = document.weblogin.name.value;
      var v2 = document.weblogin.pwd.value;
   
	  
        if ( v1.length==0)
           {
           alert("กรุณาป้อน Username");
           document.weblogin.name.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อน Password");
           document.weblogin.pwd.focus();           
		   return false;
           }
        else
             return hash(weblogin,'left.php');
}
function checks()
{
      var v1 = document.SearchForm.search.value;
        if ( v1.length==0)
           {
           alert("กรุณาป้อนคำที่ต้องการค้นหา");
           document.SearchForm.search.focus();
           return false;
           }
		 else
           return true;
}
//-->
</script>
</body>
</html>
