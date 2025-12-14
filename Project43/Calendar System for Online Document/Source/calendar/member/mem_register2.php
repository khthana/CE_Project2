<?
include("thaidate.inc");
if($num_work=="1")
{
	   include("mem_fn_chkpasswd.inc");
		if($num_chk<>9)
		{
			if($err==2 || $err==5 || $err==8)
			{ 
				header("Location:mem_register1.php?err=$err&user=$user");
			}else 
			{			
				header("Location:mem_register1.php?err=$err");
			}
		}
}elseif($num_work=="2")
{
	include("mem_chkdetail.inc");
}
if($num_work=="1" and $num_chk==9)//this status when new apply and getting error
{
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0062)http://olala05.ce.kmitl.ac.th/magazines/testphp/tempwhite.html -->
<HTML><HEAD><TITLE>Calendar</TITLE>
<style type="text/css">

<!--

body {  margin: 0px  0px; padding: 0px  0px}

a:link { color: #ccffcc; text-decoration: none}

a:visited { color: #CCFFCC; text-decoration: none}

a:active { color: #CCFFCC; text-decoration: underline}

a:hover { color: #CCFFCC; text-decoration: underline}

-->

</style>
<META http-equiv=Content-Type content="text/html; charset=Windows-874">
<META content="MSHTML 5.50.4134.600" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff 
onload="MM_preloadImages('../backup/carblue.gif','../backup/sendpink.gif','../backup/detailblue.gif','../backup/logoutorg.gif','../backup/docyellow.gif','../backup/addresspink.gif')">
<TABLE width="120%" border=0 cellpadding="0" cellspacing="0">
  <TBODY> 
  <TR>
    <TD height=39>&nbsp;</TD></TR>
  <TR>
    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <IMG 
      height=33 src="../images/home.gif" width=90 border=0 
      name=Image1><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"><IMG 
      height=33 src="../images/carlendar.gif" width=90 border=0 
      name=Image2><IMG 
      height=33 src="../images/send.gif" width=90 border=0 
      name=Image4><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"><IMG 
      height=33 src="../images/detail.gif" width=90 border=0 
      name=Image5><IMG 
      height=33 src="../images/logout.gif" width=90 border=0 
      name=Image6></TD>
  </TR>
  <TR> 
    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>
  </TR>

  <TR vAlign=top align=left>
    <TD>
      <TABLE height=464 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width="15%"> </TD>
          <TD width="79%"> 
            <div align="left">
      <form method="post" action="mem_register2.php">
                <table width="80%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="2%" height="27">&nbsp;</td>
                    <td colspan="4" height="27">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td width="2%" height="27">&nbsp;</td>
                    <td colspan="4" height="27"> 
                      <div align="center"><b><font color="#FF0000" face="MS Sans Serif, Microsoft Sans Serif" size="3"> 
                        <?
	if ($err=="3")
		{
			echo "ข้อมูลที่คุณกรอกไม่ครบ กรุณาตรวจสอบอีกครั้ง";
		}elseif ($err=="4")
		{
			echo "วันเกิดคุณไม่เป็นวันที่จริง กรุณากลับไปดูอีกครั้ง";				
		}elseif ($err=="5")
		{
			echo "กรุณาตรวจสอบอี-เมล์อีกครั้ง";
		}
?> </font></b> </div>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="2"> 
                      <div align="right"><font size="4"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#669966" size="2">ชื่อผู้ใช้ 
                        : &nbsp;&nbsp;</font></b></font></div>
                    </td>
                    <td  colspan="2"><font size="5" face="Angsana New, AngsanaUPC" color="#6699CC"><? echo $user ?></font> 
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="4"><font face="Angsana New, AngsanaUPC" size="5"><b><font color="#999900" face="MS Sans Serif, Microsoft Sans Serif" size="3">กรุณากรอกข้อมูลส่วนตัว</font></b></font></td>
                  </tr>
                  <tr> 
                    <td width="2%" height="25">&nbsp;</td>
                    <td width="19%" height="25"><font face="Angsana New, AngsanaUPC" size="4" color="#669900"><b><font color="#666666" face="MS Sans Serif, Microsoft Sans Serif" size="2">ชื่อ</font></b></font><font color="#FF3333" face="MS Sans Serif, Microsoft Sans Serif" size="2">*</font></td>
                    <td width="24%" height="25"> 
 <?
if($name<>"")
{ 
		$name=stripslashes($name);
		$name=str_replace('"','&quot;',$name);

?>
                   <input type="text" name="name" size="20" maxlength="30" value=" <? echo $name; ?>">
<?
}else
{
?>				
                   <input type="text" name="name" size="20" maxlength="30">
<?
}
?>
                    </td>
                    <td width="18%" height="25"> 
                      <h5><font face="Angsana New, AngsanaUPC" size="4"><b><font color="#666666"> 
                        <font size="2" face="MS Sans Serif, Microsoft Sans Serif">&nbsp; 
                        นามสกุล</font></font><font color="#FF3333" size="2" face="MS Sans Serif, Microsoft Sans Serif">*</font></b></font></h5>
                    </td>
                    <td width="37%" height="25"> 

<?
if($surname<>"")
{ 
		$surname=stripslashes($surname);
		$surname=str_replace('"','&quot;',$surname);
?>
                      <input type="text" name="surname" size="20" maxlength="30" value="<? echo $surname; ?>">
<?
}else
{
?>				
                      <input type="text" name="surname" size="20" maxlength="30">
<?
}
?>	
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">ชื่อเล่น</font><font color="#FF3333" face="MS Sans Serif, Microsoft Sans Serif" size="2">*</font></b></td>
                    <td width="24%"> 
                      <h5> 
<?
if($nickname<>"")
{ 
		$nickname=stripslashes($nickname);
		$nickname=str_replace('"','&quot;',$nickname);

?>
                        <input type="text" name="nickname" size="10" maxlength="20" value="<? echo $nickname; ?>">
<?
}else
{
?>				
                        <input type="text" name="nickname" size="10" maxlength="20">
<?
}
?>
                      </h5>
                    </td>
                    <td width="18%"><font face="Angsana New, AngsanaUPC" size="4"><b><font color="#666666"> 
                      &nbsp;</font></b></font> </td>
                    <td width="37%">&nbsp; </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">เพศ</font><font color="#FF3333" size="2" face="MS Sans Serif, Microsoft Sans Serif">*</font></b></td>
                    <td  colspan="3"> 
                      <select name="gender">
                        <option value="m"
<?
if($gender<>"f")
{ echo " selected";
}
?>
					>ชาย</option>
                        <option value="f"
<?
if($gender=="f")
{ echo " selected";
}
?>

				>หญิง</option>
                      </select>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">วันเกิด 
                      <font color="#FF0000">*</font> </font></b></td>
                    <td  colspan="3"> 
                      <input type="text" name="bddate" size="2" maxlength="2"
<?
if($bddate<>"")
{ echo "value=",$bddate;
}
?>

				>
                      - 
                      <select name="month">
                        <option value="0" 
<?
if($month=="0" || $month=="")
{ echo " selected";
}
?>
					>-เดือน-</option>
                        <?
				for($i=0;$i<12;$i++)
				{
                	echo "<option value=",$i+1;
					$j=$i+1;
					if($month==$j)
					{ echo " selected";
					}
					echo ">",$thaimonth[$i],"</option>";
				}
?> 
                      </select>
                      - 
                      <select name="year">
                        <option value="0" 
<?
if($year=="0" || $year=="")
{ echo " selected";
}
?>
					>--ปี--</option>
                        <?
			$tempyear=1900;
			for($i=0;$i<100;$i++)
			{
	             echo " <option value=",$tempyear;
				if($year==$tempyear)
				{ echo " selected";
				}
				echo ">",$tempyear+543,"</option>";
				$tempyear=$tempyear+1;
			}
?> 
                      </select>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><font face="Angsana New, AngsanaUPC" size="4"><b><font color="#666666" size="2" face="MS Sans Serif, Microsoft Sans Serif">ที่อยู่</font></b></font></td>
                    <td  colspan="3"> 
                      <h5> 

<?
if($address<>"")
{
		$address=stripslashes($address);
		$address=str_replace('"','&quot;',$address);
?>
                        <input type="text" name="address" size="50" maxlength="50" value="<? echo $address; ?>">
<?
}else
{
?>
                        <input type="text" name="address" size="50" maxlength="50">
<?
}
?>
                      </h5>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%" height="32">&nbsp;</td>
                    <td colspan="1" height="32" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">รหัสไปรษณีย</font></b>์ 
                    </td>
                    <td  colspan="3" height="32"> 
                      <h5> 
  
<?
if($zipcode<>"")
{  
		$zipcode=stripslashes($zipcode);
		$zipcode=str_replace('"','&quot;',$zipcode);
?>
                        <input type="text" name="zipcode" size="5" maxlength="10" value="<? echo $zipcode; ?>">
<?
}else
{
?>
	                      <input type="text" name="zipcode" size="5" maxlength="10">
<?
}
?>
                      </h5>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">อี-เมล์</font><font color="#FF3333" size="2" face="MS Sans Serif, Microsoft Sans Serif">*</font></b></td>
                    <td  colspan="3"> 

<?
if($email<>"")
{  
		$email=stripslashes($email);
		$email=str_replace('"','&quot;',$email);
?>
                      <input type="text" name="email" size="40" maxlength="40" value="<? echo $email; ?>">
<?
}else
{
?>
                      <input type="text" name="email" size="40" maxlength="40">
<?
}
?>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" color="#666666" size="2">เบอร์ 
                      ICQ</font></b></td>
                    <td  colspan="3"> 

<?
if($icq<>"")
{ 
		$icq=stripslashes($icq);
		$icq=str_replace('"','&quot;',$icq);
?>
                      <input type="text" name="icq" size="15" maxlength="15" value="<? echo $icq; ?>">
<?
}else
{
?>
                      <input type="text" name="icq" size="15" maxlength="15" >
<?
}
?>		
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">เบอร์โทรศัพท์</font><font face="Angsana New, AngsanaUPC" size="4" color="#666666"> 
                      </font></b></td>
                    <td  colspan="3"> 

<?
if($tel<>"")
{ 
		$tel=stripslashes($tel);
		$tel=str_replace('"','&quot;',$tel);
?>
                      <input type="text" name="tel" size="20" maxlength="20" value="<? echo $tel; ?>">
<?
}else
{
?>
                      <input type="text" name="tel" size="20" maxlength="20">
<?
}
?>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">เบอร์เพจ</font></b></td>
                    <td  colspan="3"> 

<?
if($pager<>"")
{ 
		$pager=stripslashes($pager);
		$pager=str_replace('"','&quot;',$pager);
?>
                      <input type="text" name="pager" size="20" maxlength="20" value="<? echo $pager; ?>">
<?
}else
{
?>
                      <input type="text" name="pager" size="20" maxlength="20">
<?
}
?>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><font color="#666666" face="Angsana New, AngsanaUPC" size="4"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif">อาชีพ</font></b></font></td>
                    <td  colspan="3"> <?

$host="localhost";

$usersql="magazine";

$password="magazine";

$table="member";

$db="magazine";

mysql_connect($host,$usersql,$password) or

die("ไม่สามารถติดต่อฐานข้อมูลได้");

mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
$sql="select * from occupation order by occ_name";
$result= mysql_db_query("magazine",$sql);
$numrow=mysql_num_rows($result);
?> 
                      <select name="occupation">
                        <option value="0" 
<?
if($occupation=="0" || $occupation=="")
{
echo " selected";
}
?>					
				>-เลือกอาชีพ-</option>
                        <?
for($i=0;$i<$numrow;$i++)
{
		$row=mysql_fetch_array($result);
?> 
                        <option value="<? echo $row[1] ?>"
<?
					if($occupation=="$row[1]")
					{
						echo " selected";
					}
?>					
					 ><? echo $row[1] ?></option>
                        <?
	}
mysql_close();
?> 
                      </select>
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%"><font color="#666666" face="Angsana New, AngsanaUPC" size="4"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif">รายได้</font></b></font></td>
                    <td  colspan="3"> 
                      <select name="income">
                        <option value=""
<? 
if($income=="")
{ echo " selected";
}
?>
					>-เลือกรายได้-</option>
                        <option value="&lt;5000"
<? 
if($income=="<5000")
{ echo " selected";
}
?> selected

				>ต่ำกว่า 5,000 บาท</option>
                        <option value="5000-10000"
<? 
if($income=="5000-10000")
{ echo " selected";
}
?>

				>5,000-10,000 บาท</option>
                        <option value="10000-30000"
<? 
if($income=="10000-30000")
{ echo " selected";
}
?>

				>10,000-30,000บาท</option>
                        <option value="&gt;30000"
<? 
if($income==">30000")
{ echo " selected";
}
?>

				>มากกว่า30,000บาท</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td width="2%" height="35">&nbsp;</td>
                    <td colspan="1" width="19%" height="35"> 
                      <div align="right">
                        <input type="checkbox" name="status" value="yes" checked>
                      </div>
                    </td>
                    <td  colspan="3" height="35"> 
                      <p><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><b>อนุญาติให้ผู้อื่นดูข้อมูลส่วนตัวได้ 
                        </b><font size="1" color="#006699">( เช่น ชื่อ,ชื่อเล่น,วันเกิด,ที่อยู่,อีเมลล์ 
                        )</font></font></p>
                      </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%">&nbsp;</td>
                    <td  colspan="3"> 
                      <input type="submit" name="Submit" value="กรอกข้อมูลเรียบร้อยแล้ว">
                    </td>
                  </tr>
                  <tr> 
                    <td width="2%">&nbsp;</td>
                    <td colspan="1" width="19%">&nbsp;</td>
                    <td  colspan="3"><font color="#FF0000" size="1" face="MS Sans Serif, Microsoft Sans Serif">* 
                      จำเป็นต้องกรอก</font><font color="#FF9999" size="3" face="Angsana New, AngsanaUPC"> 
                      <input type="hidden" name="pass" value=<? echo $pass ?>>
                      <input type="hidden" name="user" value=<?echo $user ?>>
                      <input type="hidden" name="num_work" value="2">
                      </font></td>
                  </tr>
                </table>
      </form>

              <table width="95%" height="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
            </div>
          </TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</BODY>
</HTML>
<?
}elseif($num_work=="2")
{
header("Location:../welcome.php");
//$host="localhost";

//$usersql="magazine";

//$password="magazine";

//$table="member";

//$db="magazine";

//mysql_connect($host,$usersql,$password) or

//die("ไม่สามารถติดต่อฐานข้อมูลได้");

//mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 
//  $sql_mem_id="select mem_id from member where mem_username=$username";
//$result= mysql_db_query("magazine",$sql_mem_id);
//$numrow=mysql_num_rows($result);
//$row=mysql_fetch_array($result);
//$mem_id=$row[0];
//	$crp_password=crypt($pass,"mg");
//mysql_close();
//	header("Location: welcome.php"); 



}
?>
