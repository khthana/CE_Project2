<script language="javascript" type="text/JavaScript">
function Check() {
	var headline= document.getElementById("headline");
	var news_type = document.getElementById("news_type");
	var story_text = document.getElementById("story_text");
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
}
</script>
<?php require_once('.../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_rsNewsReport = "SELECT * FROM news WHERE news_ID='$news_ID'";
$rsNewsReport = mysql_query($query_rsNewsReport, $conn) or die(mysql_error());
$row_rsNewsReport = mysql_fetch_assoc($rsNewsReport);
$totalRows_rsNewsReport = mysql_num_rows($rsNewsReport);
 ?>
 <?php
$path1="C:/Inetpub/wwwroot/E-Learning/images/news_pic/small_pic/";
$path2="C:/Inetpub/wwwroot/E-Learning/images/news_pic/large_pic/";

if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="ตกลง"))
{	
	//change small_pic
	if($file1 !=""){
	$TempName1 = $HTTP_POST_FILES['file1']['tmp_name'];
  	$Name1=$HTTP_POST_FILES['file1']['name'];
	copy($HTTP_POST_FILES['file1']['tmp_name'],"$path1$Name1");
	}
	//change large_pic
	if($file2 !=""){
	$TempName2 = $HTTP_POST_FILES['file2']['tmp_name'];
  	$Name2=$HTTP_POST_FILES['file2']['name'];
	copy($HTTP_POST_FILES['file2']['tmp_name'],"$path2$Name2");
	}
	//change news_order
	if($news_order>0){$query="UPDATE news SET news_order=0 where news_order='$news_order' ";
										mysql_query($query);}
	//update news
	if($file1!="" && $file2!=""){ 
	$updateSQL = "UPDATE news SET news_type='$news_type', headline='$headline', story_text='$story_text', small_pic='$Name1', large_pic='$Name2',news_order='$news_order',modified=NOW() WHERE news_ID='$news_ID'";}
	else if($file1!="" && $file2==""){
	$updateSQL = "UPDATE news SET news_type='$news_type', headline='$headline', story_text='$story_text', small_pic='$Name1',news_order='$news_order',modified=NOW() WHERE news_ID='$news_ID'";}
	else if($file1=="" && $file2!=""){
	$updateSQL = "UPDATE news SET news_type='$news_type', headline='$headline', story_text='$story_text', large_pic='$Name2',news_order='$news_order',modified=NOW() WHERE news_ID='$news_ID'";}
	else{
	$updateSQL = "UPDATE news SET news_type='$news_type', headline='$headline', story_text='$story_text',news_order='$news_order',modified=NOW() WHERE news_ID='$news_ID'";}
	$Result = mysql_query($updateSQL, $conn) or die(mysql_error());
  	if($Result!=0){
	echo "<meta http-equiv='refresh' content='0;URL=newslists.php'>";
   	} 
}
?>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <style type="text/css">
<!--
.style1 {
	font-size: large;
	font-weight: bold;
}
.style3 {font-size: 16px}
-->
 </style>
<div align="center" class="style1">
   <p>แก้ไขข่าวใหม่</p>
   <p><img src="../Images/news_pic/large_pic/<?php echo $row_rsNewsReport['large_pic']; ?>"></p>
  </div>
   <div align="center" >รูปใหญ่
   </div>

<FORM METHOD=POST ENCTYPE="multipart/form-data" name="Add" id="Add">
  <p>&nbsp;</p>
  <div align="center">
  </div>
  <table border="1" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="100" height="409"><table width="105"  border="0" cellpadding="0" cellspacing="0" bgcolor="#66CCFF">
        <tr>
          <td height="19">&nbsp;</td>
        </tr>
        <tr>
          <td height="100"><img src="../Images/news_pic/small_pic/<?php echo $row_rsNewsReport['small_pic']; ?>" width="100" height="100"></td>
        </tr>
        <tr>
          <td height="25"><div align="center">รูปเล็ก</div></td>
        </tr>
        <tr>
          <td height="270">&nbsp;</td>
        </tr>
      </table></td>
      <td><TABLE width="100%" height="407" border="0" align="center" cellspacing="2" bgcolor="#66CCFF">
          <TR>
            <TD colspan="2" ALIGN=CENTER><div align="center">หัวข้อข่าว 
            </div>
          </TR>
          <TR>
            <TD colspan="2">
              <div align="center">
                <textarea name="headline" cols="80" rows="2" wrap="VIRTUAL"><?php echo $row_rsNewsReport['headline']; ?></textarea>
              </div></TD></TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER><div align="center">ชนิดของข่าว             </div>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER>            
              <div align="center">
                <input name="news_type" type="text" id="news_type" value="<?php echo $row_rsNewsReport['news_type']; ?>" size="60">
              </div></TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER><div align="center">รายละเอียดของข่าว</div></TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER><div align="center">
              <textarea cols=80 rows=7 name="story_text"
           wrap=VIRTUAL><?php echo $row_rsNewsReport['story_text']; ?></textarea>
            </div></TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER>&nbsp;</TD>
          </TR>
          <TR>
            <TD colspan="2" ALIGN=CENTER>Upload รูปภาพ (*ว่างไว้ถ้าไม่แก้ไข)</TD>
          </TR>
          <TR>
            <TD width="26%" ALIGN=CENTER><div align="right">รูปเล็ก (100*100 pixel)</div></TD>
          <TD width="74%" ALIGN=CENTER><div align="left">
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
            <TD ALIGN=CENTER>
              <div align="left">
                <select name="news_order" id="news_order">
                  <option value="0" <?php if (!(strcmp(0, $row_rsNewsReport['news_order']))) {echo "SELECTED";} ?>>ไม่มี</option>
                  <option value="1" <?php if (!(strcmp(1, $row_rsNewsReport['news_order']))) {echo "SELECTED";} ?>>บนซ้าย</option>
                  <option value="2" <?php if (!(strcmp(2, $row_rsNewsReport['news_order']))) {echo "SELECTED";} ?>>บนกลาง</option>
                  <option value="3" <?php if (!(strcmp(3, $row_rsNewsReport['news_order']))) {echo "SELECTED";} ?>>บนขวา</option>
                  <option value="4" <?php if (!(strcmp(4, $row_rsNewsReport['news_order']))) {echo "SELECTED";} ?>>ล่างซ้าย</option>
                  <option value="5" <?php if (!(strcmp(5, $row_rsNewsReport['news_order']))) {echo "SELECTED";} ?>>ล่างกลาง</option>
                  <option value="6" <?php if (!(strcmp(6, $row_rsNewsReport['news_order']))) {echo "SELECTED";} ?>>ล่างขวา</option>
				</select>
              </div></TD>
          </TR>
          <TR>
            <TD height="41" colspan="2" ALIGN=CENTER><input name="news_ID" type="hidden" id="news_ID" value="<?php echo"$news_ID" ?>">              <INPUT name="Submit" TYPE=SUBMIT id="Submit" VALUE="ตกลง" onClick=" return Check()"></TD></TR>
      </TABLE></td>
    </tr>
  </table>
</FORM>

<?php
mysql_free_result($rsNewsReport);
?>
