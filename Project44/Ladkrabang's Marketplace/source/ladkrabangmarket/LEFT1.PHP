<?php
session_start();
?>
<html>
<head>
<title></title>

<style type="text/css">
	<!-- 
	BODY {font-family:;font-size="10"}
	A:link {text-decoration: none; color: blue }
	A:visited {text-decoration: none; color: blue }
	A:hover {text-decoration: none; color: darkorange }
	A:active {text-decoration: none; color: blue }
	p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
	-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<body bgcolor="#EAF9FD">
<?
include("config.inc.php");
include("datedel.php");

//if($logout==1){
//								session_unset();
//								session_destroy();
//							}

//if(isset($name)&&isset($pwd))
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
			// ตรวจสอบว่า Password ถูกหรือไม่	
			if($name==$row["username"] && $pwd==$row["password"]) 
				{ 
					$membername=$name;
					session_register("membername");
					}
    	}	
		mysql_close();
}


if(!isset($membername))
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
//echo"    <form action='memberleft.php' method='POST' >";
echo"    <form  method='POST'  name='weblogin'  onsubmit='return check()' >";
echo"           <tr> ";
echo"             <td align='right'><font face='Verdana, Arial, Helvetica, sans-serif' size='1' color='#000000' class='fsize10'>Username:</font></td> ";
echo"             <td><font face='MS Sans Serif' size='1' color='#000000'> ";
echo"               <input type='text' name='name' maxlength='15' size='8'>";
echo"               </font></td>";
echo"           </tr>";
echo"           <tr> ";
echo"             <td align='right'><font face='Verdana, Arial, Helvetica, sans-serif' size='1' color='#000000' class='fsize10'>Password:</font></td>";
echo"             <td><font face='MS Sans Serif' size='1' color='#000000'> ";
echo"               <input type='password' name='pwd' maxlength='15' size='8'>";
echo"               </font></td>";
echo"           </tr>";
echo"           <tr> ";
echo"             <td nowrap height='30'><font face='MS Sans Serif, CordiaUPC' size='1' color='#000000' class='fsize8'> ";
echo"               &nbsp;</font></td>";

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
<TD class=heading width=7 bgcolor="#0066CC" height="18"></TD>
<TD class=heading style="PADDING-LEFT: 2px" bgcolor="#80B4FF"><B><FONT color="#FFFFFF">:: สมาชิก!</B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
<TD class=topics><B><a href='postself.php' target='mainFrame'>:: ประกาศของ<?echo $membername?></A></B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
<TD class=topics><B><a href='showintro.php' target='mainFrame'>:: อ่านคำแนะนำติชม</A></B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
<TD class=topics><B><a href='editprofile.php?action=login' target='mainFrame'>:: แก้ไขข้อมูลสมาชิก</A></B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
<TD class=topics><B><a href='fromdel.php' target='mainFrame'>:: ลบประกาศ</A></B></TD>
</TR>
<TR bordercolor="#CCCCCC">
<TD bgcolor="#0066C"></TD>
<TD class=topics><B><a href='../index.php'  target='_top'>:: Logout</A></B></TD>
</TR>
<TR >
<TD style="BORDER-BOTTOM: 0px" bgcolor="#0066C"></TD>
<TD class=topics style="BORDER-BOTTOM: 0px" valign=bottom align=right><IMG border=0 height=16 src="images/icon_corner1.gif" width=16></TD>
</TR>
</TABLE>
</table>

<?/*
//ของสมาชิก
echo" <table width=150 border=1 cellspacing=0 cellpadding=3 bgcolor='#578CF3' bordercolor='#80B4FF' >";
echo"   <tr bgcolor='#7EB3FD' > ";
echo"     <td><font face='MS Sans Serif' size=2><a href='postself.php' target='mainFrame'><b><font color='#FFFFCC'>ประกาศของ  $membername </font></b></a></font></td>";
echo"   </tr>";
echo"   <tr bgcolor='#C7E2FE'> ";
echo"     <td><font size=2 face='MS Sans Serif'><a href='showintro.php' target='mainFrame'><b><font color='#CCFFFF'>อ่านคำแนะนำติชม</font></b></a></font></td>";
echo"   </tr>";
echo"   <tr bgcolor='#7EB3FD'> ";
echo"     <td><font size=2 face='MS Sans Serif'><a href='editprofile.php?action=login' target='mainFrame'><b><font color='#CCFFFF'>แก้ไขข้อมูลสมาชิก</font></b></a></font></td>";
echo"   </tr>";
echo"   <tr bgcolor='#C7E2FE'> ";
echo"     <td><font face='MS Sans Serif' size='2'><a href='fromdel.php' target='mainFrame'><b><font color='#CCFFFF'>ลบประกาศ</font></b></a></font></td>";
echo"   </tr>";
echo"   <tr bgcolor='#7EB3FD'> ";
echo"     <td><font face='MS Sans Serif' size='2'><a href='../index.php'  target='_top'><b><font color='#CCFFFF'>Logout</font></b></a></font></td>";
//
echo"   </tr>";
echo" </table>";
*/
}
?>
<!----------------------->
<form method=post action="search/search.php" name="SearchForm" onsubmit="return checks()" target="mainFrame">
<table width="150" cellspacing="0" border="1" bordercolor="#80B4FF" bgcolor="#C7E2FE">
  <td bgcolor="#7EB3FD" height="15"> 
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
			  <input type='image' border='0' name='imageField1' src='.././ladkrabangmarket/images/go.gif' width='23' height='21' alt='search'></div>
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
  <tr bgcolor="#99CCFF"> 
    <td> 
      <div align="center"><font face="MS Sans Serif" size="1"><b><a href="loginadmin.php" 
	  target="_blank" >Administrator</a></b></font></div> 
 
	</td>
  </tr>
  <tr> 
    <td height="10">&nbsp; </td>
  </tr>
  <?
  echo"<tr bgcolor=#99CCFF> ";
echo"    <td> ";
	  $date=date("d-F-Y"); //วันที่
echo"      <div align=center><font face=MS Sans Serif size=1 color=#0033CC><b>$date</b></font></div>";
 echo"   	</td>";
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
           return true;
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
