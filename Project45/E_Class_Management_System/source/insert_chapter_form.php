<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/logo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>

<body leftmargin="0" topmargin="0" >
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr valign="top">
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" --> 
	<!--form action="" name=""  method="get"-->
	<script language="JavaScript">
	function go_back(ID,TID)
	{
		var url;
		url ="./course_content.php?ID="+ID+"&TID="+TID;
		location.href=url;
	}
	</script>
	<form enctype="multipart/form-data" action="insert_chapter.php"  method="post">
	<?php
	echo"<input name='ID'  type='hidden' value=$ID>";
	echo"<input name='TID'  type='hidden' value=$TID>";
	?>
	<input type="hidden" name="MAX_FILE_SIZE" value="10000000">
	<table  bgcolor="#0099FF" border="0" cellpadding="0" cellspacing="0" class="text" width="100%" height="100%">
	<tr>
	<td>
	<table  align="center" bgcolor="#FAF7EA" width="90%" border="0" cellspacing="5" cellpadding="0"  class="text">
                <tr> 
                  <td><b>บทที่</b></td>
                  <td><input type="text" name="Chapter"> <font class='text' color='#FF0000' >*</font></td>
                </tr>
				<tr> 
                  <td><b>หัวข้อ</b></td>
                  <td><input type="text" name="Subject"> <font class='text' color='#FF0000' >*</font></td>
                </tr>
                <tr> 
                  <td><b>รูปแบบ</b></td>
                  <td><input type="radio" name="HTML" value="1"> <label>สร้างเป็น 
                    HTML</label> <input type="radio" name="HTML" value=."0"> <label>สร้างเป็น 
                    Document</label></td>
                </tr>
                <tr> 
                  <td><b>แทรกรูปภาพ</b></td>
                  <td> <input name="Picture_up" type="file" id="Picture_up">
                    สูง 
                    <input type="text" name="Height_up" size="5">
                    กว้าง 
                    <input type="text" name="Width_up" size="5">
                    ตำแหน่ง 
                    <select name="list_up">
                      <option>absbottom</option>
                      <option>absmiddle</option>
                      <option>baseline</option>
                      <option>bottom</option>
                      <option>left</option>
                      <option>middle</option>
                      <option>right</option>
                      <option>texttop</option>
                      <option>top</option>
                    </select> 
                    <!--input type="submit" name="Submit" value="Submit"-->
                  </td>
                </tr>
                <tr> 
                  <td><b>รายละเอียด</b></td>
                  <td><textarea name="Document" rows="20" cols="90" wrap="soft"></textarea></td>
                </tr>
                <tr> 
                  <td><b>แทรกรูปภาพ</b></td>
                  <td> <input name="Picture_down" type="file" id="Picture_down">
                    สูง 
                    <input type="text" name="Height_down" size="5">
                    กว้าง 
                    <input type="text" name="Width_down" size="5">
                    ตำแหน่ง <select name="list_down">
                      <option>absbottom</option>
                      <option>absmiddle</option>
                      <option>baseline</option>
                      <option>bottom</option>
                      <option>left</option>
                      <option>middle</option>
                      <option>right</option>
                      <option>texttop</option>
                      <option>top</option>
                    </select> 
                    <!--input type="submit" name="Submit" value="Submit"-->
                  </td>
                </tr>
                <tr> 
                  <td><b>Link</b></td>
                  <td><textarea name="Link" rows="3" cols="40"></textarea></td>
                </tr>
                <!--/table>
	  <form>
	  <form enctype="multipart/form-data" action=""  method="post">
	  <table-->
                <tr> 
                  <td><b>ไฟล์ Word</b></td>
                  <td><input type="file" name="Word" value=""> 
                    <!--input type="submit" name="Submit" value="Submit"-->
                  </td>
                </tr>
                <tr> 
                  <td><b>ไฟล์ Powerpoint </b></td>
                  <td><input type="file" name="Powerpoint"> 
                    <!--input type="submit" name="Submit2" value="Submit"-->
                  </td>
                </tr>
                <tr> 
                  <td><b>ไฟล์ PDF</b></td>
                  <td><input type="file" name="PDF"> 
                    <!--input type="submit" name="Submit2" value="Submit"-->
                  </td>
                </tr>
                <tr> 
                  <td><b>ไฟล์ Flash</b></td>
                  <td><input type="file" name="Flash"> 
                    <!--input type="submit" name="Submit3" value="Submit"-->
                  </td>
                </tr>
                <tr> 
                  <td><b>ไฟล์ Video</b></td>
                  <td><input type="file" name="Video"> 
                    <!--input type="submit" name="Submit4" value="Submit"-->
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" align="center"> <input type="submit" name="add_chapter" value="ตกลง">
                    <input type="reset" name="reset" value="ยกเลิก"> <input type="button" name="back" value="ย้อนกลับ" onClick="go_back('<?php echo $ID;?>',<?php echo $TID; ?>)"> 
                  </td>
                </tr>
              </table>
	</td>
	</tr>
	</table>
	</form>
	
	  <!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
