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
	<script language="JavaScript">
	function go_back(ID,TID,Chapter,Subject)
	{
		var url;
		url ="./show_document.php?ID="+ID+"&TID="+TID+"&Chapter="+Chapter+"&Subject="+Subject;
		location.href=url;
	}
	</script>
	<form enctype="multipart/form-data" action="insert_chapter.php"  method="post">
<?php
	//$ID=117;
	//$Chapter="บทที่1";
	require('./libraries/grab_globals.lib.php'); 
	include("./connectDB.php");
	echo"<input name='ID'  type='hidden' value=$ID>";
	echo"<input name='TID'  type='hidden' value=$TID>";
			     	connect_db();
					$sql="select Document from documents where CID=$ID and Subject='$Subject' and Chapter='$Chapter'";
					$result=mysql_query($sql);
					$row=mysql_fetch_row($result);
					$row[0]=stripslashes($row[0]);
	?>
	<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
	<table  bgcolor="#0099FF" border="0" cellpadding="0" cellspacing="0" class="text" width="100%" height="100%">
	<tr>
	<td height="100%">
	<table  align="center"bgcolor="#99CCCC"width="90%" border="0" cellspacing="5" cellpadding="0"  class="text">
				<tr> 
                  <td><b>บทที่</b></td>
                  <?php echo"<td><input type='text' name='Chapter' value='$Chapter'> <font class='text' color='#FF0000' >*</font></td>";?>
                </tr>
                <tr> 
                  <td><b>หัวข้อ</b></td>
                  <?php echo"<td><input type='text' name='Subject' value='$Subject'> <font class='text' color='#FF0000' >*</font></td>";?>
                </tr>
                <tr> 
                  <td><b>รูปแบบ</b></td>
                  <td><input type="radio" name="HTML" value="1"> <label>สร้างเป็น 
                    HTML</label> <input type="radio" name="HTML" value="0"> 
                    <label>สร้างเป็น Document</label></td>
                </tr>
                <tr> 
                  <td><b>รายละเอียด</b></td>
                  <td> <textarea name="Document" rows="20" cols="90" wrap="soft">
			<?php
			       	echo $row[0];
					mysql_close();
			?>
			</textarea></td>
                </tr>
             	<tr>
            	<td><b>แทรกรูปภาพ</b></td>
            	<td>
				<input type="file" name="Picture">
				สูง <input type="text" name="Height" size="5">
				กว้าง <input type="text" name="Width" size="5">
				ตำแหน่ง<select name="list">
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
                  <td>
				  </td>
				  <td>
				  <!--input type="submit" name="Preview" value="ดูตัวอย่าง"-->
				  <input type="submit" name="Chang" value="แก้ไข"> 
				  <input type="button" name="back" value="ย้อนกลับ" onClick="go_back('<?php echo $ID;?>',<?php echo $TID; ?>,'<?php echo $Chapter; ?>','<?php echo $Subject; ?>')">
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
