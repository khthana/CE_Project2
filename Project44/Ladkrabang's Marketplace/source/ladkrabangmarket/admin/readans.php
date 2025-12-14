<?
session_start();
if($administrator[0]=='1')
{
?>
<html>
<head>
<title>อ่าน - ตอบคำถาม</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</head>

<body bgcolor="#FFFFFF">
<?
   include("../config.inc.php");	
   	mysql_connect($host,$user,$passwd);
	$sql = "select * from toadmin where no='$no'   ";
	$result = mysql_db_query($dbname,$sql);
	$row = mysql_fetch_array($result);
				$No=$row["no"];
				$Date=$row["date"];
				$Topic=$row["topic"];
				$Ans=$row["ans"];
				$Sender=$row["sender"];
				$Detail=$row["detail"];
				$Email=$row["email"];
?>
<table width="50%" border="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="55%" border="1" height="79" cellpadding="0" cellspacing="0" align="center" bordercolor="#009966">
  <tr bgcolor="#FFFF66"> 
    <td height="30" bgcolor="#FFFFCC"> 
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif"><b><font size="3" color="#0000FF"> 
        <? echo $Topic ?>
        </font></b></font></div>
    </td>
  </tr>
  <tr> 
    <td> 
      <table width="100%" border="0" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="23%" height="30" bgcolor="#66FFFF"> 
            <div align="center"><font face="MS Sans Serif" size="2" color="#0000FF">ข้อความ</font></div>
          </td>
          <td width="77%" height="30" bgcolor="#CCFFCC"> 
            <p><font face="MS Sans Serif" size="2"> 
              <? echo $Detail ?>
              </font></p>
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td width="23%" height="30" bgcolor="#66FFFF"> 
            <div align="center"><font face="MS Sans Serif" size="2" color="#0000FF">ผู้ส่ง</font></div>
          </td>
          <td width="77%" height="30" bgcolor="#CCFFCC"><font face="MS Sans Serif" size="2"> 
            <? echo $Sender ?>
            </font></td>
        </tr>
        <tr> 
          <td width="23%" height="30" bgcolor="#66FFFF"> 
            <div align="center"><font face="MS Sans Serif" size="2" color="#0000FF">E-mail</font></div>
          </td>
          <td width="77%" height="30" bgcolor="#CCFFCC"><font face="MS Sans Serif" size="2"> 
            <? echo $Email ?>
            </font></td>
        </tr>
        <tr> 
          <td width="23%" height="30" bgcolor="#66FFFF"> 
            <div align="center"><font face="MS Sans Serif" size="2" color="#0000FF">วันที่</font></div>
          </td>
          <td width="77%" height="30" bgcolor="#CCFFCC"> 
            <? echo $Date ?>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br><hr color="FF1493" width="600"><br>
<!--<p>&nbsp;</p> -->
<form name="ansform"  method="post" action="sendans.php"   onsubmit="return check()">
  <table width="55%" border="1" align="center" cellspacing="0" cellpadding="0" bordercolor="#0000FF" bgcolor="#FCDC9A">
    <tr bordercolor="#FF99FF" bgcolor="#FFCCFF"> 
      <td height="34" bgcolor="#78CBFC" bordercolor="#0000FF"> 
        <div align="center"><font face="MS Sans Serif" size="3"><b><font color="#FFFFFF">ตอบคำถาม</font></b></font></div>
    </td>
  </tr>
  <tr bordercolor="#FF99FF" valign="top"> 
      <td height="175" bordercolor="#0000FF">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FCDC9A" bordercolor="#0000FF">
          <tr> 
            <td width="24%" bgcolor="#FCDC9A"> 
              <div align="center"><font face="MS Sans Serif" size="2" color="#3300FF">หัวข้อ</font></div>
            </td>
            <td width="76%" bgcolor="#FCDC9A"> 
        <? echo"  <input type='text' name='subject' size='35'  value='RE:$Topic From MarketPlace'>	"; ?>
		</td>
          </tr>
          <tr> 
            <td width="24%" bgcolor="#FCDC9A"> 
              <div align="center"><font face="MS Sans Serif" size="2" color="#3300FF">ข้อความ</font></div>
            </td>
            <td width="76%" bgcolor="#FCDC9A"> 
              <textarea name="message" cols="35" rows="6"></textarea>
            </td>
          </tr>
          <tr> 
            <td width="24%" bgcolor="#FCDC9A" height="32"> 
              <div align="center"><font face="MS Sans Serif" size="2" color="#3300FF">โดย</font></div>
            </td>
            <td width="76%" height="32" bgcolor="#FCDC9A"> 
             <!-- <input type="text" name="name" size="35" value="Ladkrabang Market Place"> -->
					<font face="MS Sans Serif" size="2" >webmaster@ce.kmitl.ac.th</font>
            </td>
          </tr>
        </table>
      </td>
  </tr>
  <tr bordercolor="#FF99FF" bgcolor="#FFCCFF"> 
      <td bgcolor="#FCDC9A" height="30" bordercolor="#0000FF"> 
        <div align="center"> 
         
		<input type="submit" name="Submit" value="ส่งคำตอบ">
		<input type="hidden" name="noans" value="<? echo $No ?>">
		<input type="hidden" name="mailto" value="<? echo $Email ?>">
        <input type="reset" name="Submit2" value="ยกเลิก">
        </div>
    </td>
  </tr>
</table>
</form>
<script language="JavaScript">
<!--
function check()
{
	  var v1 = document.ansform.subject.value;
      var v2 = document.ansform.message.value;
      var v3 = document.ansform.name.value;

  	   
	  if (v1.length==0)
           {
           alert("กรุณาป้อนหัวข้อ");
           document.ansform.subject.focus();           
		   return false;
           }
		
        else if ( v2.length==0)
           {
           alert("กรุณาป้อนรายละเอียดครับ");
           document.ansform.message.focus();           
           return false;
           }
        	else if (v3.length==0)
           {
           alert("กรุณาป้อนชื่อ");
           document.ansform.name.focus();           
		   return false;
        }
		else
           return true;
}
//-->
</script>
</body>
</html>
<?}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}?>