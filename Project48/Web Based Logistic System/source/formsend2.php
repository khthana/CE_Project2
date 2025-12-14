<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<?
session_start();
$username=$_SESSION[sess_username];
include "connect.php";
$sql="select * from customers where cusid='$username' ";
$result=mysql_db_query($dbname,$sql);
$reccord=mysql_fetch_array($result);
$cusid=$reccord[cusid];
$name=$reccord[name];
$lname=$reccord[lname];
$moo=$reccord[moo];
$att=$reccord[att];
$district=$reccord[district];
$amphur=$reccord[amphur];
$province=$reccord[province];
$zipcode=$reccord[zipcode];

mysql_close();
?>

<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body >
<form name="form1" method="post" action="?file=usertool.php&file2=addtocart.php">
  <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#FFCC66" >
    <tr bgcolor="#F3F3F3"> 
      <td width="20%"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"> 
          ชื่อ : </span></font></div></td>
      <td width="27%"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="namesend" type="text" id="namesend" size="25" value="<? print("$name");?>"  >
        <input name="cusid" type="hidden" value="<? print"$cusid";?>"></font></td>
      <td width="20%"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"> 
          </span>นามสกุล<span class="style5"> : </span></font></div></td>
      <td width="33%"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="sursend" type="text" id="sursend" size="20" value="<? echo"$lname";?>" >
		<input type="hidden"  name="flag" value="1">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td bgcolor="#F3F3F3"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5">เลขที่: 
          </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="addrsend" type="text" id="addrsend" value="<? echo"$att";?>" size="6" maxlength="6" >
        หมู่ : 
        <input name="textfield" type="text" size="5" maxlength="5" value="<? echo"$moo";?>">
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ตำบล 
        / แขวง : <span class="style36 style9"> </span></font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <input name="sdistrict" type="text" id="sdistrict" size="20" value="<?=$district?>" >
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">อำเภอ 
        / เขต :</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <input name="samphur" type="text" id="samphur" size="20" value="<?=$amphur?>" >
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5">จังหวัด 
        :</span></font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <input name="sprovince" type="text" size="18" value="<?=$province?>" >
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รหัสไปรษณีย์ 
          :</font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <input name="szipcode" type="text" id="szipcode" size="10" maxlength="5" value="<?=$zipcode?>" onKeyPress="checknumber();" >
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"> 
        </span></font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp; </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#FFCC66"> 
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รายละเอียดผู้รับ:</strong></font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td height="27"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5">ชื่อ 
          : </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="nameres" type="text" id="namesend2" size="25" >
        </font></td>
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">นามสกุล<span class="style5"> 
          : </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="surres" type="text" id="surres" size="20" >
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td height="26">
<div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5">เลขที่:</span>
          </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="ratt" type="text" size="6" maxlength="10">
        หมู่ที่ : 
        <input name="rmoo" type="text" id="rmoo" size="5" onKeyPress="checknumber();">
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ตำบล 
        / แขวง : </font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <input name="rdistrict" type="text" id="rdistrict" size="20">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">อำเภอ 
        / เขต :</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <input name="ramphur" type="text" id="ramphur" size="20">
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9">จังหวัด</span> 
        : </span><span class="style36"><span class="style36 style9"></span> </span></font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <? 
	  if($sess_place=="กรุงเทพมหานคร")
	  {
	  print"
        <select name=\"rprovince\">
          <option value=\"เลือก\" selected> - เลือก -</option>
          <option value=\"ระยอง\">ระยอง</option>
          <option value=\"ขอนแก่น\">ขอนแก่น</option>
          <option value=\"เชียงใหม่\">เชียงใหม่</option>
          <option value=\"สงขลา\">สงขลา</option>
        </select>";
		}elseif($sess_place=="ระยอง")
		{
		print"
		<select name=\"rprovince\">
          <option value=\"เลือก\" selected> - เลือก -</option>
          <option value=\"กรุงเทพมหานคร\">กรุงเทพมหานคร</option>
          <option value=\"ขอนแก่น\">ขอนแก่น</option>
          <option value=\"เชียงใหม่\">เชียงใหม่</option>
          <option value=\"สงขลา\">สงขลา</option>
        </select>";
		}elseif($sess_place=="ขอนแก่น")
		{
		print"
		<select name=\"rprovince\">
          <option value=\"เลือก\" selected> - เลือก -</option>
          <option value=\"กรุงเทพมหานคร\">กรุงเทพมหานคร</option>
          <option value=\"เชียงใหม่\">เชียงใหม่</option>
		  <option value=\"ระยอง\">ระยอง</option>
          <option value=\"สงขลา\">สงขลา</option>
        </select>";
		}elseif($sess_place=="เชียงใหม่")
		{
		print"
		<select name=\"rprovince\">
          <option value=\"เลือก\" selected> - เลือก -</option>
          <option value=\"กรุงเทพมหานคร\">กรุงเทพมหานคร</option>
          <option value=\"ขอนแก่น\">ขอนแก่น</option>
		  <option value=\"ระยอง\">ระยอง</option>
          <option value=\"สงขลา\">สงขลา</option>
        </select>";
		}
		elseif($sess_place=="สงขลา")
		{
		print"
		<select name=\"rprovince\">
          <option value=\"เลือก\" selected> - เลือก -</option>
          <option value=\"กรุงเทพมหานคร\">กรุงเทพมหานคร</option>
          <option value=\"ขอนแก่น\">ขอนแก่น</option>
		  <option value=\"เชียงใหม่\">เชียงใหม่</option>
		  <option value=\"ระยอง\">ระยอง</option>
        </select>";
		}				
		?>
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รหัสไปรษณีย์ 
          :<span class="style5"><span class="style36 style9"> </span></span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <input name="rzipcode" type="text" id="rzipcode" size="10" maxlength="5" onKeyPress="checknumber();">
        </font></td>
      <td align="right" valign="middle">&nbsp;</td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp; </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td height="24">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFCC66"> 
      <td height="24"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style7"><strong>รายการสินค้า:</strong></span></font></td>
      <td>&nbsp;</td>
      <td bgcolor="#FFCC66">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5">ประเภท 
          :</span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
	  <select name="packid">
                  <?
				$sql="select  * from packtype";
				$result=mysql_db_query($dbname,$sql);
				while($object2=mysql_fetch_object($result))
				{
			print"<option  value=\"$object2->packid\">$object2->packtype</option>";
				}			
			?>
                </select>
        </font></td>
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"> 
          จำนวนสินค้า</span> :</span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="total" type="text" id="number2" size="6" onKeyPress="checknumber();">
        ชิ้น </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
          น้ำหนักรวม:</font></div></td>
      <td colspan="2"><input name="weight" type="text" size="10" onKeyPress='checknumber();'> <font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">กิโลกรัม</font></td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td colspan="3"><div align="center"> <font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
          </font></div></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td colspan="4"> <div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp; 
          <input name="senddata" type="submit" id="senddata3" value="ส่งรายการสินค้า">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <input name="reset" type="reset" id="reset3" value="ลบข้อมูล">
          </font></div></td>
    </tr>
  </table>
</form>

</body>
</html>