<html>
<head>
<title>แก้ไขประกาศ</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
<link rel="stylesheet" type="text/css" href="../style.css">	
</head>

<body bgcolor="#FFFFFF">
<?
//	include("function.php");
	include("config.inc.php");
// ติดต่อ database เพื่ออ่านข้อมูล
//เลือกตารางและกำหนดตัวแปรเพื่อนำไปแสดง
mysql_connect($host,$user,$passwd);
$sql="select * from post ,friends_data,poster  where post.code=friends_data.code and post.code=poster.code and post.code='$codeedit'";
$result1=mysql_db_query($dbname,$sql);
$row= mysql_fetch_array($result1);
			$Code = $row["code"];
			$Status = $row["status"];
			$Topic = $row["topic"];
			$Price = $row["price"];
	//		$Date =trim($row["date"]);
		//	$Reply = $row["reply"];
		//	$Visit = $row["visit"];
			$Fullname = $row["fullname"];
			$Nickname = $row["nickname"];
			$Faculty = $row["faculty"];
			$Department = $row["department"];
			$E_mail=$row["e_mail"];
			$Icq=$row["icq"];
			$Tel = $row["tel"];
			$Year=$row["year"];
			$Pager=$row["pager"];
			$Detail=$row["detail"];
			$Duration=$row["duration"];
//			$Member=$row["member"];
			$Picture = $row["picture"];
    		$Username = $row["username"];
			$Email=$row["email"];
//			$IP = $row["ip"];
	$Sendmail = $row["sendmail"];
//$Date=showdate($Date);
mysql_close();
?>
<form name="formfriend" enctype="multipart/form-data" method="post" action="../ladkrabangmarket/post/postfriends.php"  onsubmit="return check()" >
<div align="center">
  <table width="645" border="0" cellspacing="0" cellpadding="2">
    <tr> 
      <td> 
        <div align="center"><font face="MS Sans Serif" size="4"><b><font color="#0000FF">หาเพื่อน</font></b></font></div>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="center"> 
          <table width="600" border="1" cellspacing="0" cellpadding="2" height="493" bordercolor="#000080">
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="25"><font face="MS Sans Serif" size="2">หัวข้อประกาศ 
                <font color="#FF0000">* </font></font></td>
              <td width="477" height="25"><font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <?
		echo"		<input maxlength=150    name=topic size=50 value='$Topic'>";
    ?>
                </font><font face="MS Sans Serif" size="2"> </font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="22"><font face="MS Sans Serif" size="2">ชื่อ-นามสกุล</font></td>
              <td width="477" height="22"><font     face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <?
                echo"<input type=text name=fullname  value='$Fullname'>";
                ?>
                <font color="#FF0000">(สมาชิกไม่ต้องใส่) **โดยจะใช้ข้อมูลของสมาชิก 
                </font></font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="17"><font face="MS Sans Serif" size="2"> 
                ชื่อเล่น</font></td>
              <td width="477" height="17"><font     face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <?
                echo"<input type=text name=nickname value='$Nickname'>";
                ?>
                <font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> <font color="#FF0000">(สมาชิกไม่ต้องใส่) 
                </font></font><font color="#FF0080"></font></font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="12"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Email 
                </font></td>
              <td width="477" height="12"><font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 
                <?
          echo"      <input type=text name=e_mail value='$E_mail'>";
                ?>
                <font  face="MS Sans Serif, Microsoft Sans Serif" size=1> <font color="#FF0000">(สมาชิกไม่ต้องใส่) 
                </font></font><font color="#FF0080"></font></font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="8"><font face="MS Sans Serif" size="2">ICQ</font></td>
              <td width="477" height="8"><font face="MS Sans Serif" size="1"> 
                <font color="#FF0080"> 
                <?
                echo"<input type=text name=icq value='$Icq' >";
                ?>
                </font><font    face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <font color="#FF0000">(สมาชิกไม่ต้องใส่) </font></font></font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="25"><font face="MS Sans Serif" size="2">โทรศัพท์</font></td>
              <td width="477" height="25"><font face="MS Sans Serif" size="2"> 
                <?
                echo"<input type=text name=tel value='$Tel'>";
               ?>
                </font><font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> <font color="#FF0000">(สมาชิกไม่ต้องใส่) 
                </font></font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="9"><font size="2" face="MS Sans Serif">เพจเจอร์</font></td>
              <td width="477" height="9"> 
                <?
                echo"<input type=text name=pager size=15 value='$Pager'>";
              ?>
                <font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> <font color="#FF0000">(สมาชิกไม่ต้องใส่) 
                </font></font> </td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="15"><font face="MS Sans Serif" size="1">คณะ</font></td>
              <td width="477" height="15"><font    face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <?
                echo"<input type=text name=faculty size=15 maxlength=100  value='$Faculty'>";
                ?>
                ภาควิชา 
                <?
                  echo"<input type=text name=department size=15 maxlength=100  value='$Department'>";
               ?>
                ปี 
                <?
                  echo"<input type=text name=year size=10 value='$Year'>";
                ?>
                <font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> <font color="#FF0000">(สมาชิกไม่ต้องใส่) 
                </font></font></font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="16"><font face="MS Sans Serif" size="1">ระยะเวลาที่ลงประกาศ</font></td>
              <td width="477" height="16"> <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 
                <select    name=duration>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3" selected>3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6" >6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
                เดือน </font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" valign="top" height="101"><font face="MS Sans Serif" size="2">ข้อความ<font color="#FF0000"> 
                * </font></font></td>
              <td width="477" height="101"> 
                <?
			 $Detail = eregi_replace("<br>",chr(13),$Detail);
   echo"  <textarea class=Font1 cols=50 name=detail rows=5>$Detail</textarea> "; 
         ?>
              </td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="109" height="77"><font face="MS Sans Serif" size="2">ผู้ประกาศ<font color="#FF0000"> 
                * </font></font></td>
              <td width="477" height="77"> 
                <table width="480" border="0" cellspacing="0" cellpadding="2" height="70" bordercolor="#000080">
                  <tr bgcolor="#c6e2ff"> 
                    <!----------->
                    <td height="43"><font 
            face="MS Sans Serif, Microsoft Sans Serif" size=1> ชื่อ</font><font 
            face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                      <!--                      <input maxlength=20 name=username   size=10 type=text>-->
                      <? echo"  <font  face=MS Sans Serif, Microsoft Sans Serif size=3 color=#3399ff> $Username ";?>
                      </font> Email </font> 
                      <?
		echo"			  <input type=text name=email size=24 maxlength=50 value= '$Email'>";
    ?>
                      <!--      <font face="MS Sans Serif" size="1" color="#FF0000">(สมาชิกไม่ต้องใส่)</font> -->
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td width="104" height="30" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">รูปภาพ 
                </font></td>
              <td width="518" height="30" bgcolor="#c6e2ff">
                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                  <tr> 
                    <td width="20%"> 
                      <input type="radio" name="cpic" value="0" checked>
                      <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 
                      รูปภาพเดิม </font></td>
                  </tr>
                  <tr> 
                    <td width="20%"> 
                      <input type="radio" name="cpic" value="1">
                      <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 
                      ลบรูปภาพ </font></td>
                  </tr>
                  <tr> 
                    <td width="20%"> 
                      <input type="radio" name="cpic" value="2">
                      <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 
                      รูปภาพใหม่ </font><font face="MS Sans Serif" size="2"> 
                      <input type="file" name="qpic" size="15">
                      </font></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td width="104" height="30" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2"><font color="#FF0000">(สำหรับสมาชิก) 
                </font></font></td>
              <td width="518" height="30" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">ต้องการให้ส่งคำตอบของประกาศไปให้ทางเมล์หรือไม่ 
                <? if($Sendmail==1){
                echo"<input type=radio name=qsendmail value=1 CHECKED>  ต้องการ  ";
				echo"<input type=radio name=qsendmail value=0  >";
				}else{
				echo"<input type=radio name=qsendmail value=1>  ต้องการ  ";
				echo"<input type=radio name=qsendmail value=0 CHECKED>";
				}?>
                ไม่ต้องการ</font></td>
            </tr>
          </table>
          <table width="636" border="0" cellspacing="0" cellpadding="2" height="27">
            <tr> 
              <td> 
                <div align="center"> 
                  <input type="submit" name="Submit" value="ตกลง">
				  <INPUT TYPE="hidden" name="action" value="edit">
				    <INPUT TYPE="hidden" name="pic1" value=<? echo $Picture ?>>
				    <INPUT TYPE="hidden" name="username" value=<?echo $Username ?>>
				   <INPUT TYPE="hidden" name="code" value=<?echo $Code ?>>
                  <input type="reset" name="Submit3" value="ยกเลิก">
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
</div>
</form>
<script language="JavaScript">
<!--
function check()
{
	
      var v2 = document.formfriend.topic.value;
      var v3 = document.formfriend.detail.value;
	//   var v4 = document.formfriend.username.value;
  	   
	  
        if ( v2.length==0)
           {
           alert("กรุณาป้อนหัวข้อครับ");
           document.formfriend.topic.focus();           
           return false;
           }
              
			else if (v3.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.formfriend.detail.focus();           
		   return false;
        }
	/*	 else if (v4.length==0)
           {
           alert("กรุณาป้อนชื่อผู้ประกาศ");
           document.formfriend.username.focus();           
		   return false;
           }
       */
		else
           return true;
}
//-->
</script>
</body>
</html>
