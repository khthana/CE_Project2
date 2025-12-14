<html>
<head>
<title>แก้ไขประกาศ</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
<link rel="stylesheet" type="text/css" href="../style.css">	
</head>

<body bgcolor="#FFFFFF">
<?
include("config.inc.php");
//include("function.php");
// ติดต่อ database เพื่ออ่านข้อมูล
mysql_connect($host,$user,$passwd);
$sql="select * from post,news_data,poster  where post.code=news_data.code and post.code =poster.code and post.code='$codeedit'";
$result1=mysql_db_query($dbname,$sql);
$row= mysql_fetch_array($result1);
			$Code = $row["code"];
			$Status = $row["status"];
			$Topic = $row["topic"];
			$Price = $row["price"];
//			$Date =trim($row["date"]);
	//		$Reply = $row["reply"];
	//		$Visit = $row["visit"];
			$Picture = $row["picture"];
			$Detail = $row["detail"];
			$Duration=$row["duration"];
//			$Member=$row["member"];
			$Username = $row["username"];
			$Email=$row["email"];
//			$IP = $row["ip"];
				/////////////////
//				$Date=showdate($Date);
	$Sendmail = $row["sendmail"];
				mysql_close();
				?>
<form name="formnews" enctype="multipart/form-data" method="post" action="../ladkrabangmarket/post/postnews.php"   onsubmit="return check()">
  <div align="center">
    <table width="645" border="0" cellspacing="0" cellpadding="2">
      <tr> 
        <td height="29"> 
          <div align="center"> <font face="MS Sans Serif" size="4"><b><font color="#0000FF">ข่าวฝากประกาศ</font></b></font></div>
        </td>
      </tr>
      <tr> 
        <td> 
          <table width="627" border="1" cellspacing="0" cellpadding="2" height="246" bordercolor="#000080">
            <tr bgcolor="#c6e2ff"> 
              <td width="120"><font face="MS Sans Serif" size="2">ท่านต้องการ<font color="#FF0000"> 
                * </font></font></td>
              <td width="480" height="18"> <font face="MS Sans Serif" size="2"> 
                <select name=status>
                  <option value=<? echo $Status?> selected>
                  <?echo $Status ?>
                  </option>
                  <option value="จ้าง">จ้าง</option>
                  <option value="รับจ้าง">รับจ้าง</option>
                  <option value="แนะนำ">แนะนำ</option>
                  <option value="ประกาศ">ประกาศ</option>
                </select>
                </font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="120"><font face="MS Sans Serif" size="2">หัวข้อประกาศ 
                <font color="#FF0000">*</font> </font></td>
              <td width="480" height="22"><font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <?
		echo"		<input maxlength=150     name=topic size=50 value=' $Topic' >";
    ?>
                </font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="120"><font face="MS Sans Serif" size="1">ระยะเวลาที่ลงประกาศ</font><font face="MS Sans Serif, Microsoft Sans Serif" size="1"></font></td>
              <td width="480" height="34"><font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <select     name=duration>
                  <option value="12">12</option>
                  <option value="11">11</option>
                  <option value="10">10</option>
                  <option value="9">9</option>
                  <option value="8">8</option>
                  <option value="7">7</option>
                  <option value="6" >6</option>
                  <option value="5">5</option>
                  <option value="4">4</option>
                  <option value="3" selected>3</option>
                  <option value="2">2</option>
                  <option value="1">1</option>
                </select>
                <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> เดือน 
                </font> </font></td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="120" valign="top"><font face="MS Sans Serif" size="2">ข้อความ 
                <font color="#FF0000">* </font></font></td>
              <td width="480" height="98" valign="top"><font    face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <?
			 $Detail = eregi_replace("<br>",chr(13),$Detail);
   echo"  <textarea class=Font1 cols=50 name=detail rows=5>$Detail</textarea> "; 
         ?>
                </font> </td>
            </tr>
            <tr bgcolor="#c6e2ff"> 
              <td width="120" height="68"><font face="MS Sans Serif" size="2">ผู้ประกาศ 
                <font color="#FF0000">* </font></font></td>
              <td width="480" height="68" valign="top"> 
                <table width="500" border="0" cellspacing="0" cellpadding="2" height="70" bordercolor="#000080">
                  <tr bgcolor="#c6e2ff"> 
                    <!----------->
                    <td height="43"><font 
            face="MS Sans Serif, Microsoft Sans Serif" size=1> ชื่อ</font><font 
            face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                      <!--                      <input maxlength=20 name=username   size=10 type=text>-->
                      <? echo"  <font  face=MS Sans Serif, Microsoft Sans Serif size=3 color=#3399ff> $Username ";?>
                      </font> Email </font> 
                      <?
                     echo" <input type=text name=email size=24 maxlength=50 value='$Email'>";
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
	  var v1 = document.formnews.status.value;
      var v2 = document.formnews.topic.value;
      var v3 = document.formnews.detail.value;
	 //  var v4 = document.formnews.username.value;
  	   
	  if (v1.length==0)
           {
           alert("กรุณาเลือกความต้องการ(ประกาศ,แนะนำ,ฯลฯ)");
           document.formnews.status.focus();           
		   return false;
           }
		
        else if ( v2.length==0)
           {
           alert("กรุณาป้อนหัวข้อครับ");
           document.formnews.topic.focus();           
           return false;
           }
        	else if (v3.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.formnews.detail.focus();           
		   return false;
        }
 /*       else if (v4.length==0)
           {
           alert("กรุณาป้อนชื่อผู้ประกาศ");
           document.formnews.username.focus();           
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
