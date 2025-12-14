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
function test()
{
document.create_course.submit();
}
</script>
<br>
<form name="create_course" action="insert_course.php" method="post">
<?php
require('./libraries/grab_globals.lib.php');
echo"<input name='TID' type='hidden' value=$TID>";
?><table  border="1" cellspacing="0" cellpadding="0" bordercolor="#000000"  align="center" width="60%">
  <tr>
    <td>
		<table border="0" bgcolor="#FAF7EA" cellpadding="0" cellspacing="0" align="center" class="text" width="100%">
		<tr>
                  <th colspan="2" align="center" class="header"><font color="#0066FF">ข้อมูลวิชา</font><br>
 <br></th></tr>
		<tr><td align="right"><label>คณะวิชา</label></td><td>
		<?php
		switch ($FacultyName)
		{
		case "วิทยาศาสตร์": ?>
												<select  name="FacultyName" onChange="test();">
															  <option value="วิทยาศาสตร์" selected>วิทยาศาสตร์</option>
															  <option value="วิศวกรรมศาสตร์" >วิศวกรรมศาสตร์</option>
															  <option value="สถาปัตยกรรมศาสตร์">สถาปัตยกรรมศาสตร์</option>
															  <option value="เทคโนโลยีสารสนเทศ">เทคโนโลยีสารสนเทศ</option>
															  <option value="คุรุศาสตร์อุตสาหกรรม">คุรุศาสตร์อุตสาหกรรม</option>
															  <option value="เทคโนโลยีการเกษตร">เทคโนโลยีเกษตร</option>
												</select>
												<?php break;
		case "วิศวกรรมศาสตร์": ?>
												<select  name="FacultyName" onChange="test();">
															  <option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
															  <option value="วิศวกรรมศาสตร์" selected>วิศวกรรมศาสตร์</option>
															  <option value="สถาปัตยกรรมศาสตร์">สถาปัตยกรรมศาสตร์</option>
															  <option value="เทคโนโลยีสารสนเทศ">เทคโนโลยีสารสนเทศ</option>
															  <option value="คุรุศาสตร์อุตสาหกรรม">คุรุศาสตร์อุตสาหกรรม</option>
															  <option value="เทคโนโลยีการเกษตร">เทคโนโลยีเกษตร</option>
												</select>											
												<?php break;
	case "สถาปัตยกรรมศาสตร์": ?>
												<select  name="FacultyName" onChange="test();">
																  <option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
																  <option value="วิศวกรรมศาสตร์" >วิศวกรรมศาสตร์</option>
																  <option value="สถาปัตยกรรมศาสตร์" selected>สถาปัตยกรรมศาสตร์</option>
																  <option value="เทคโนโลยีสารสนเทศ">เทคโนโลยีสารสนเทศ</option>
																  <option value="คุรุศาสตร์อุตสาหกรรม">คุรุศาสตร์อุตสาหกรรม</option>
																  <option value="เทคโนโลยีการเกษตร">เทคโนโลยีเกษตร</option>
													</select>												
													<?php break;
		case "เทคโนโลยีสารสนเทศ":?>
													<select  name="FacultyName" onChange="test();">
																	  <option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
																	  <option value="วิศวกรรมศาสตร์" >วิศวกรรมศาสตร์</option>
																	  <option value="สถาปัตยกรรมศาสตร์">สถาปัตยกรรมศาสตร์</option>
																	  <option value="เทคโนโลยีสารสนเทศ" selected>เทคโนโลยีสารสนเทศ</option>
																	  <option value="คุรุศาสตร์อุตสาหกรรม">คุรุศาสตร์อุตสาหกรรม</option>
																	  <option value="เทคโนโลยีการเกษตร">เทคโนโลยีเกษตร</option>
														</select>													
													<?php break;										
		case "คุรุศาสตร์อุตสาหกรรม": ?>
													<select  name="FacultyName" onChange="test();">
																	  <option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
																	  <option value="วิศวกรรมศาสตร์" >วิศวกรรมศาสตร์</option>
																	  <option value="สถาปัตยกรรมศาสตร์">สถาปัตยกรรมศาสตร์</option>
																	  <option value="เทคโนโลยีสารสนเทศ">เทคโนโลยีสารสนเทศ</option>
																	  <option value="คุรุศาสตร์อุตสาหกรรม" selected>คุรุศาสตร์อุตสาหกรรม</option>
																	  <option value="เทคโนโลยีการเกษตร">เทคโนโลยีเกษตร</option>
														</select>													
													<?php break;
		default:							?>
												<select  name="FacultyName" onChange="test();">
																  <option value="วิทยาศาสตร์" selected>วิทยาศาสตร์</option>
																  <option value="วิศวกรรมศาสตร์" >วิศวกรรมศาสตร์</option>
																  <option value="สถาปัตยกรรมศาสตร์">สถาปัตยกรรมศาสตร์</option>
																  <option value="เทคโนโลยีสารสนเทศ">เทคโนโลยีสารสนเทศ</option>
																  <option value="คุรุศาสตร์อุตสาหกรรม">คุรุศาสตร์อุตสาหกรรม</option>
																  <option value="เทคโนโลยีการเกษตร">เทคโนโลยีเกษตร</option>
													</select>												
													<?php break;
		}										
		?>					
		<font color="#FF0000">*</font></td></tr>
		<tr><td align="right"><label>สาขาวิชา</label></td><td>
		<?php
		switch ($FacultyName)
		{
		case "วิทยาศาสตร์": ?>
													<select  name="DepartmentName">
																  <option value="คณิตศาสตร์ประยุกต์">คณิตศาสตร์ประยุกต์</option>
																  <option value="วิทยาการคอมพิวเตอร์" >วิทยาการคอมพิวเตอร์</option>
																  <option value="ชีววิทยาประยุกต์">ชีววิทยาประยุกต์</option>
																  <option value="ฟิสิกส์ประยุกต์">ฟิสิกส์ประยุกต์</option>
																  <option value="สถิติประยุกต์">สถิติประยุกต์</option>
																  <option value="เคมีอุตสาหการ">เคมีอุตสาหการ</option>
																  <option value="เคมีทรัพยากรณ์สิ่งแวดล้อม">เคมีทรัพยากรณ์สิ่งแวดล้อม</option>
													</select>
													<?php break;
		case "วิศวกรรมศาสตร์": ?>
													<select  name="DepartmentName">
																  <option value="วิศวกรรมโยธา">วิศวกรรมโยธา</option>
																  <option value="วิศวกรรมคอมพิวเตอร์" >วิศวกรรมคอมพิวเตอร์</option>
																  <option value="วิศวกรรมระบบควบคุม">วิศวกรรมระบบควบคุม</option>
																  <option value="วิศวกรรมไฟฟ้า">วิศวกรรมไฟฟ้า</option>
																  <option value="วิศวกรรมอิเล็กทรอนิกส์">วิศวกรรมอิเล็กทรอนิกส์</option>
																  <option value="วิศวกรรมอาหาร">วิศวกรรมอาหาร</option>
																  <option value="วิศวกรรมอุตสาหการ">วิศวกรรมอุตสาหการ</option>
																  <option value="วิศวกรรมการวัดคุม">วิศวกรรมการวัดคุม</option>
																  <option value="วิศวกรรมสารสนเทศ">วิศวกรรมสารสนเทศ</option>
																  <option value="วิศวกรรมเครื่องกล">วิศวกรรมเครื่องกล</option>
																  <option value="วิศวกรรมโทรคมนาคม">วิศวกรรมโทรคมนาคม</option>
																  <option value="วิศวกรรมเคมี">วิศวกรรมเคมี</option>
																  <option value="วิศวกรรมเกษตร">วิศวกรรมเกษตร</option>
													</select>
													<?php break;
	case "สถาปัตยกรรมศาสตร์": ?>
													<select  name="DepartmentName">
																  <option value="การวางแผนภาคและเมือง">การวางแผนภาคและเมือง</option>
																  <option value="สถาปัตยกรรมศาสตร์" >สถาปัตยกรรมศาสตร์</option>
																  <option value="ศิลปอุตสาหกรรม">ศิลปอุตสาหกรรม</option>
																  <option value="นิเทศศิลป์">นิเทศศิลป์</option>
																  <option value="สถาปัตยกรรมภายใน">สถาปัตยกรรมภายใน</option>
																  <option value="วิจิตรศิลป์">วิจิตรศิลป์</option>
																  </select>
													<?php break;
		case "เทคโนโลยีสารสนเทศ":?>
													<select  name="DepartmentName">
																	<option value="">ไม่มีข้อมูล</option>
													</select>
													<?php break;										
		case "คุรุศาสตร์อุตสาหกรรม": ?>
													<select  name="DepartmentName">
																  <option value="การผลิตพืช">การผลิตพืช</option>
																  <option value="การผลิตสัตว์" >การผลิตสัตว์</option>
																  <option value="อุตสาหกรรมเกษตร">อุตสาหกรรมเกษตร</option>
																  <option value="วิศวกรรมโทรคมนาคม">วิศวกรรมโทรคมนาคม</option>
																  <option value="อิเล็กทรอนิกส์และคอมพิวเตอร์">อิเล็กทรอนิกส์และคอมพิวเตอร์</option>
																  <option value="เทคโนโลยีการวัดคุมทางอุตสาหการ">เทคโนโลยีการวัดคุมทางอุตสาหการ</option>
																  <option value="สถาปัตยกรรม">สถาปัตยกรรม</option>
																  <option value="สถาปัตยกรรมภายใน">สถาปัตยกรรมภายใน</option>
																  <option value="ศิลปอุตสาหกรรม">ศิลปอุตสาหกรรม</option>
																  <option value="การบริหารอาชีวศึกษา">การบริหารอาชีวศึกษา</option>
																  <option value="การศึกษาวิทยาศาสตร์">การศึกษาวิทยาศาสตร์</option>
																  <option value="เทคโนโลยีการศึกษาทางการอาชีวศึกษาและเทคนิคศึกษา">เทคโนโลยีการศึกษาทางการอาชีวศึกษาและเทคนิคศึกษา</option>
																  <option value="หลักสูตรและการสอนอาชีวศึกษา">หลักสูตรและการสอนอาชีวศึกษา</option>
																  <option value="ภาษาญี่ปุ่น">ภาษาญี่ปุ่น</option>
													</select>
													<?php break;
			default:							?>
												<select  name="DepartmentName">
																  <option value="คณิตศาสตร์ประยุกต์">คณิตศาสตร์ประยุกต์</option>
																  <option value="วิทยาการคอมพิวเตอร์" >วิทยาการคอมพิวเตอร์</option>
																  <option value="ชีววิทยาประยุกต์">ชีววิทยาประยุกต์</option>
																  <option value="ฟิสิกส์ประยุกต์">ฟิสิกส์ประยุกต์</option>
																  <option value="สถิติประยุกต์">สถิติประยุกต์</option>
																  <option value="เคมีอุตสาหการ">เคมีอุตสาหการ</option>
																  <option value="เคมีทรัพยากรณ์สิ่งแวดล้อม">เคมีทรัพยากรณ์สิ่งแวดล้อม</option>
													</select>
													<?php break;
		}										
		?>										
		<font color="#FF0000">*</font></td></tr>
		<tr><td align="right"><label>ชื่อวิชา</label></td><td><input maxlength="100" name="CourseName"><font color="#FF0000">*</font></td></tr>
		<tr><td align="right"><label>วัตถุประสงค์</label></td><td><textarea cols="50" rows="5" name="Target"></textarea><font color="#FF0000">*</font></td></tr>
		<tr><td align="right"><label>เนื้อหาโดยย่อ</label></td><td><textarea name="Description" cols="50" rows="5"></textarea><font color="#FF0000">*</font></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr>
                  <td colspan="2" align="center" class="normal"><b><font color="#0066FF">ข้อมูลวิชาบังคับก่อนเรียน</font></b><br>
                    <br></td></tr>
		<tr><td align="right"><label>รหัสวิชา</label></td><td><input maxlength="10" size="10" name="CourseConID"></td></tr>
		<tr><td align="right"><label>ชื่อวิชา</label></td><td><input maxlength="100" name="CourseConName"></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr>
                  <td colspan="2" align="center" class="normal"><b><font color="#0066FF">ข้อมูลอื่นๆ</font></b><br>
                    <br></td></tr>
		<tr><td align="right"><label>หนังสือเรียน</label></td><td><input maxlength="100" size="50" name="TextBook"></td></tr>
		<tr><td align="right"><label>เกณฑ์การตัดคะแนน</label></td><td><textarea cols="50" rows="5" name="GradeDetail"></textarea></td></tr>
		<tr><td align="right"><label>แหล่งข้อมูลอ้างอิง</label></td><td><textarea cols="50" rows="5" name="Refer"></textarea></td></tr>
		<tr><td colspan="2"><center>กรุณากรอกข้อมูลลงในแบบฟอร์มที่มีเครื่องหมาย&nbsp;<font color="#FF0000">*</font>&nbsp;ให้ครบด้วยครับ</center></td></tr>
		<tr><td height="52" colspan="2" align="center"><br>
		<!--<input name="submit" type="button" value="สร้างวิชา" onClick="test();">-->
		<input name="OK" type="button" value="สร้างวิชา" onClick="test();">
		<input name="reset" type="reset" value="ยกเลิก">
		</td></tr>
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
