<script language="javascript" type="text/JavaScript">
function Check() {
	var headline= document.getElementById("headline");
	var news_type = document.getElementById("news_type");
	var story_text = document.getElementById("story_text");
	var file1 = document.getElementById("file1");
	var file2= document.getElementById("file2");
	if (headline.value == ""){
		alert("กรุณากรอก หัวข้อข่าว");
		headline.focus();
		return false;
	}
	else if (news_type.value == ""){
		alert("กรุณากรอก ชนิดของข่าว");
		news_type.focus();
		return false;
	}
	else if (story_text.value == ""){
		alert("กรุณากรอก รายละเอียดของข่าว");
		story_text.focus();
		return false;
	}
	else if (file1.value == ""){
		alert("กรุณาเลือก รูปเล็ก");
		file1.focus();
		return false;
	}
	else if (file2.value == ""){
		alert("กรุณาเลือก รูปใหญ่");
		file2.focus();
		return false;
	}
}
</script>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <?php require_once('../Connections/conn.php'); ?>
 <?php 
$path1="C:/Inetpub/wwwroot/E-Learning/Images/news_pic/small_pic/";
$path2="C:/Inetpub/wwwroot/E-Learning/Images/news_pic/large_pic/";
if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="ตกลง"))
{	
	//collect small picture
	$TempName1 = $HTTP_POST_FILES['file1']['tmp_name'];
  	$Name1=$HTTP_POST_FILES['file1']['name'];
	if(@opendir("$path1"))
	{
	copy($HTTP_POST_FILES['file1']['tmp_name'],"$path1$Name1");
	}
	else
	{
	mkdir("$path1");
	copy($HTTP_POST_FILES['file1']['tmp_name'],"$path1$Name1");
	}
   //collect large picture
   $TempName2 = $HTTP_POST_FILES['file2']['tmp_name'];
  	$Name2=$HTTP_POST_FILES['file2']['name'];
	if(@opendir("$path2"))
	{
	copy($HTTP_POST_FILES['file2']['tmp_name'],"$path2$Name2");
	}
	else
	{
	mkdir("$path2");
	copy($HTTP_POST_FILES['file2']['tmp_name'],"$path2$Name2");
	}
   
   mysql_select_db($database_conn, $conn);
	//change news_order
	if($news_order>0){$query="UPDATE news SET news_order=0 where news_order='$news_order' ";
										mysql_query($query);}
  //add news
  $insertSQL = "INSERT INTO news(news_ID,news_type,headline,story_text,small_pic,large_pic,news_order,created) VALUES('','$news_type','$headline','$story_text','$Name1','$Name2','$news_order',NOW()) ";
  $Result = mysql_query($insertSQL, $conn) or die(mysql_error());

  if($Result!=0)
  {
	echo "<meta http-equiv='refresh' content='0;URL=newslists.php'>";
  }
}

?>
<div align="center"><font size="5"><strong>เพิ่มข่าวใหม่</strong></font></div>
<FORM action="news_add.php" METHOD=POST ENCTYPE="multipart/form-data" name="Add" id="Add">
  <table width="70%" border="1" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><TABLE width="100%" border="0" cellspacing="2" bgcolor="#66CCFF">
          <TR>
            <TD colspan="2" ALIGN=CENTER><div align="center">หัวข้อข่าว</div>
          </TR>
          <TR>
            <TD colspan="2"><div align="center">
              <textarea name="headline" cols="80" rows="2" wrap="VIRTUAL"></textarea>
            </div></TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER><div align="center">&#3594;&#3609;&#3636;&#3604;&#3586;&#3629;&#3591;&#3586;&#3656;&#3634;&#3623;</div>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER>            <input name="news_type" type="text" id="news_type" size="60"></TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER><div align="center">&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3586;&#3629;&#3591;&#3586;&#3656;&#3634;&#3623;             </div></TD>
          </TR>
          <TR>
            <TD colspan="2"><div align="center">
              <textarea cols=80 rows=7 name="story_text"
           wrap=VIRTUAL></textarea>
            </div></TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER>&nbsp;</TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER>Upload&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;            </TD>
          </TR>
          <TR>
            <TD width="29%" ALIGN=CENTER><div align="right">รูปเล็ก (100*100 pixel) </div></TD>
          <TD width="71%" ALIGN=CENTER><div align="left">
            <INPUT NAME="file1" TYPE=FILE id="file1"SIZE=40>
          </div></TD>
          </TR>
          <TR>
            <TD ALIGN=CENTER><div align="right">รูปใหญ่ (ไม่จำกัดขนาด)</div></TD>
          <TD ALIGN=CENTER><div align="left">
            <INPUT NAME="file2" TYPE=FILE id="file2"SIZE=40>
          </div></TD>
          </TR>
          <TR>
            <TD ALIGN=CENTER>ลำดับของข่าวหน้าเว็บ</TD>
            <TD ALIGN=CENTER><div align="left">
                <select name="news_order" id="news_order">
                  <option value="0">ไม่มี</option>
                  <option value="1">บนซ้าย</option>
                  <option value="2">บนกลาง</option>
                  <option value="3">บนขวา</option>
                  <option value="4">ล่างซ้าย</option>
                  <option value="5">ล่างกลาง</option>
                  <option value="6">ล่างขวา</option>
				</select>
            </div></TD>
          </TR>
          
		  <TR>
            <TD colspan="2" ALIGN=CENTER>              <input name="Submit" type=SUBMIT id="Submit" value="ตกลง" onClick=" return Check()"></TD>
          </TR>
      </TABLE></td>
    </tr>
  </table>
</FORM>
</html>