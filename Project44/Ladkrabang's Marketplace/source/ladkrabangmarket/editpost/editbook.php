<html>
<head>
<title>แก้ไขประกาศ</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
<link rel="stylesheet" type="text/css" href="../style.css">	
</head>

<body bgcolor="#FFFFFF">
<?

include("config.inc.php");
// ติดต่อ database เพื่ออ่านข้อมูล
//เลือกตารางและกำหนดตัวแปรเพื่อนำไปแสดง
mysql_connect($host,$user,$passwd);
$sql="select * from post ,book_data,poster  where post.code=book_data.code and post.code=poster.code and post.code='$codeedit'";
$result1=mysql_db_query($dbname,$sql);
$row= mysql_fetch_array($result1);
			$Code = $row["code"];
			$Status = $row["status"];
			$Topic = $row["topic"];
			$Price = $row["price"];
		//	$Date =trim($row["date"]);
			$Percent = $row["percent"];
		//	$Visit = $row["visit"];
			$Bookname = $row["bookname"];
			$Author = $row["author"];
			$Publisher = $row["publisher"];
			$Condition = $row["condition"];
			$Usedyear=$row["usedyear"];
			$Usedmonth=$row["usedmonth"];
			$Detail = $row["detail"];
			$Howsend=$row["howsend"];
//			$Duration=$row["duration"];
	//		$Member=$row["member"];
			$Picture = $row["picture"];
    		$Username = $row["username"];
			$Email=$row["email"];
			$Sendmail = $row["sendmail"];
//$Date=showdate($Date);
mysql_close();


?>
<form name="formbook" enctype="multipart/form-data" method="post" action="../ladkrabangmarket/post/postbook.php"  onsubmit="return check()" >
  <div align="center">
    <table width="640" border="0" cellspacing="0" cellpadding="2" bordercolor="#000080">
      <tr> 
        <td> 
          <div align="center"><font face="MS Sans Serif" size="4" color="#0000FF"><b>หนังสือ 
            </b></font></div>
        </td>
      </tr>
      <tr> 
        <td> 
          <table width="636" border="1" cellspacing="0" cellpadding="2" height="574" bordercolor="#000080">
            <tr> 
              <td width="104" height="23" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">ท่านต้องการ<font color="#FF00FF"> 
                <font color="#FF0000">*</font> </font></font></td>
              <td width="518" height="23" bgcolor="#c6e2ff"> <font face="MS Sans Serif" size="2"> 
                <select name=status>
                  <option value=<? echo $Status?> selected>
                  <?echo $Status ?>
                  </option>
                  <option value="ขาย">ขาย</option>
                  <option value="ซื้อ">ซื้อ</option>
                  <option value="เสนอราคา">เสนอราคา</option>
                  <option value="ให้เช่า">ให้เช่า</option>
                  <option value="แจกฟรี">แจกฟรี</option>
                  <option value="เช่า">เช่า</option>
                  <option value="แลก">แลก</option>
                </select>
                </font></td>
            </tr>
            <tr> 
              <td width="104" height="23" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">หัวข้อประกาศ<font face="MS Sans Serif" size="2"><font color="#FF0000"> 
                </font></font><font color="#FF0000">*</font> </font></td>
              <?
echo"    <td width=518 height=23 bgcolor=#c6e2ff><font    face=MS Sans Serif, Microsoft Sans Serif size=1>  ";
  echo"        <input maxlength=150  name=topic size=50 value='$Topic'>  </font></td>";
echo"            </tr> ";   ?>
            <tr> 
              <td width="104" height="26" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">ราคา</font></td>
              <td width="518" height="26" bgcolor="#c6e2ff"><font  face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <? echo"    <input maxlength=20   name=price size=16 value='$Price' >  บาท </font></td>  ";?>
            </tr>
            <tr> 
              <td width="104" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="1">ระยะเวลาที่ลงประกาศ</font></td>
              <td width="518" bgcolor="#c6e2ff"> <font face="MS Sans Serif" size="1"> 
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
            <tr> 
              <td width="104" height="23" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">สภาพสินค้า</font></td>
              <td width="518" height="23" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2"> 
                <? 
	  if(ereg("ของมือสอง",$Condition)	)
	  {
   echo"	<input CHECKED name=select1 type=radio value=1>";


	  }else
	  {
echo"		<input  name=select1 type=radio value=1>";
	  }
	?>
                ของมือสอง สภาพ </font> <font face="MS Sans Serif, Microsoft Sans Serif" size="1"> 
                <?
			echo"	<select name=percent>";
        if($Percent!='0' ){
				 echo" <option value='$Percent' selected>$Percent %</option>";
		}else{
				  echo" <option value='0' selected>ไม่ระบุ%</option>"; }
				  ?><option value="0" >
                ไม่ระบุ%</option> <option value="100">100%</option> <option value="99">99%</option> <option value="98">
                98%</option> <option value="95">95%</option> <option value="90">90%</option> <option value="85">
                85%</option> <option value="80">80%</option> <option value="75">75%</option> <option value="70">
                70%</option> <option value="65">65%</option> <option value="60">60%</option> <option value="50">
                50%</option> <option value="49">&lt;50%</option> </select> 
                <? 
	  if(ereg("ของใหม่",$Condition)	)
	  {
   echo"	<input CHECKED name=select1 type=radio value=2>";

	  }else
	  {
echo"		<input  name=select1 type=radio value=2>";
	  }
	?>
                ของ ใ หม่</font> <font color="#FF0080"> </font></td>
            </tr>
            <tr> 
              <td width="104" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">อายุการใช้งาน</font></td>
              <td width="518" bgcolor="#c6e2ff"> 
                <?
                echo"<select name=usedyear>";
			if($Usedyear!='0'){
				  echo"<option value='$Usedyear' selected>$Usedyear ปี</option>";
			}else{
                  echo"<option value='0' selected>ไม่ระบุ ปี</option>";
			}
                  ?><option value="0">
                ไม่ระบุ ปี</option> <option value="1 ">1</option> <option value="2">2</option> <option value="3">
                3</option> <option value="4">4</option> <option value="5">5</option> <option value="6">
                6</option> <option value="7">7</option> <option value="8">8</option> <option value="9">
                9</option> <option value="10">10</option> <option value="11">มากกว่า 
                10 ปี</option> </select> 
                <?
       echo"         <select name=usedmonth>";
		if($Usedmonth!='0'){
				 echo" <option value='$Usedmonth' selected>$Usedmonth เดือน</option> ";
		}else{
                 echo" <option value='0' selected>ไม่ระบุ เดือน</option>";
				 }
				 ?><option value="0">
                ไม่ระบุ เดือน</option> <option value="1">1</option> <option value="2">2</option> <option value="3">
                3</option> <option value="4">4</option> <option value="5">5</option> <option value="6">
                6</option> <option value="7">7</option> <option value="8">8</option> <option value="9">
                9</option> <option value="10">10</option> <option value="11">11</option> </select> 
              </td>
            </tr>
            <tr> 
              <td width="104" height="23" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">ชื่อหนังสือ</font></td>
              <td width="518" height="23" bgcolor="#c6e2ff"><font 
      face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <? echo"         <input maxlength=100    name=bookname size=50 value='$Bookname' > ";?>
                </font></td>
            </tr>
            <tr> 
              <td width="104" height="23" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">ผู้แต่ง</font></td>
              <td width="518" height="23" bgcolor="#c6e2ff"><font  face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                <?echo"         <input maxlength=150   name=author size=20 value='$Author' > "; ?>
                </font></td>
            </tr>
            <tr> 
              <td width="104" height="22" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">สำนักพิมพ์</font></td>
              <td width="518" height="22" bgcolor="#c6e2ff"> 
                <?echo"       <input type=text name=publisher size=20 maxlength=150 value='$Publisher' > ";?>
              </td>
            </tr>
            <tr> 
              <td width="104" valign="top" height="120" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">รายละเอียด 
                <font color="#FF00FF"> <font color="#FF0000">*</font></font> </font></td>
              <td width="518" bgcolor="#c6e2ff" height="120" valign="top"> 
                <? 
		 $Detail = eregi_replace("<br>",chr(13),$Detail);
   echo"  <textarea class=Font1 cols=50 name=detail rows=5>$Detail</textarea> "; 
   ?>
              </td>
            </tr>
            <tr> 
              <td width="104" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">การรับส่งสินค้า</font></td>
              <td width="518" bgcolor="#c6e2ff"><font face="MS Sans Serif, Microsoft Sans Serif"    size=1> 
                <?  			 
					if(ereg("นัดเจอเพื่อมารับสินค้า",$Howsend)	){
			        echo" <input  type=radio name=how value=1 CHECKED>  นัดเจอเพื่อมารับสินค้า ";
					$f1=1;
					}else{
					      		echo" <input  type=radio name=how value=1 >  นัดเจอเพื่อมารับสินค้า "; 
								$f1=0;
								}
						if(ereg("ส่งสินค้าผ่านไปรษณีย์",$Howsend) ){
								echo"<input checked type=radio name=how value=2> ส่งสินค้าผ่านไปรษณีย์ (พ.ก.ง) ";
								$f2=1;
								}else{
									$f2=0;
									echo"	<input type=radio name=how value=2> ส่งสินค้าผ่านไปรษณีย์ (พ.ก.ง) ";
								}					    
					if($f1||$f2){
						echo" <input   type=radio name=how value=3>  อื่นๆ ระบุ ";
					echo"<input name=other size=20  > "; 
					}else{
					 echo" <input  checked type=radio name=how value=3>  อื่นๆ ระบุ ";
					echo"<input name=other size=20  value='$Howsend'> "; 
					}			
					 ?>
                </font></td>
            </tr>
            <tr> 
              <td width="104" height="65" bgcolor="#c6e2ff"><font face="MS Sans Serif" size="2">ผู้ประกาศ 
                <font color="#FF00FF"> <font color="#FF0000">*</font></font> </font></td>
              <td width="518" height="65" bgcolor="#c6e2ff"> 
                <table width="520" border="0" cellspacing="0" cellpadding="2" height="70" bordercolor="#000080">
                  <tr bgcolor="#c6e2ff"> 
                    <td height="43"><font 
            face="MS Sans Serif, Microsoft Sans Serif" size=1> ชื่อ</font><font 
            face="MS Sans Serif, Microsoft Sans Serif" size=1> 
                      <? echo"  <font  face=MS Sans Serif, Microsoft Sans Serif size=3 color=blue> $Username ";?>
                      </font> Email </font> 
                      <?
 echo"                     <input type=text name=email size=24 maxlength=50 value='$Email'> ";
 ?>
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
	  var v1 = document.formbook.status.value;
      var v2 = document.formbook.topic.value;
      var v3 = document.formbook.detail.value;
	//   var v4 = document.formbook.username.value;
  	   
	   if (v1.length==0)
           {
           alert("กรุณาเลือกความต้องการ( ซื้อ,ขาย,ฯลฯ)");
           document.formbook.status.focus();           
		   return false;
           }
       else if ( v2.length==0)
           {
           alert("กรุณาป้อนหัวข้อครับ");
           document.formbook.topic.focus();           
           return false;
           }
      	else if (v3.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.formbook.detail.focus();           
		   return false;
        }
     /*   else if (v4.length==0)
           {
           alert("กรุณาป้อนชื่อผู้ประกาศ");
           document.formbook.username.focus();           
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
