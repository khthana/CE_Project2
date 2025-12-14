<?php require_once('../Connections/conn.php'); ?>
<?php 
session_start();
require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_subject = "SELECT * FROM subject where subject_ID='$id'";
$subject = mysql_query($query_subject, $conn) or die(mysql_error());
$row_subject = mysql_fetch_assoc($subject);
$totalRows_subject = mysql_num_rows($subject);

mysql_select_db($database_conn, $conn);
$query_teacher = "SELECT * FROM teacher left join course on teacher.teacher_ID = course.teacher_ID WHERE subject_ID = '$id'";
$teacher = mysql_query($query_teacher, $conn) or die(mysql_error());
  ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $row_subject['subject_name'];?></title>
<style type="text/css">
<!--
body {
	background-color: #E0DFE3;
	margin-left:10px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../Images/bg.gif);
}
.style1 {
	font-size: 24px;
	font-weight: bold;
}
.style5 {font-weight: bold; color: #6699FF;font-size: 18px;}
a:link {
	color: #000000;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body>
 <table width="860" cellspacing="0">
   <tr>
     <td colspan="3">&nbsp;</td>
   </tr>
   <tr>
     <td colspan="3"><div align="center" class="style1"><font color="#0066FF"><?php echo $row_subject[subject_name]?></font></div></td>
   </tr>
   <tr>
     <td colspan="3">&nbsp;</td>
   </tr>
   <tr>
     <td colspan="3"><p class="style5">Overview:</p>      
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $row_subject[description]?>
       
     </td>
   </tr>
   <tr>
     <td width="476"><table border="0" cellspacing="0" cellpadding="2">
       <tr>
         <td colspan="2"><table width="415" border="0">
             <tr>
               <td colspan="2">&nbsp;</td>
             </tr>
             <tr>
               <td colspan="2"><strong>เนื้อหาบทเรียน</strong></td>
             </tr>
             <tr>
               <td colspan="2">&nbsp;</td>
             </tr>
             <tr>
               <td width="78"><strong>Chapter 1</strong></td>
               <td width="318"><div align="left"><FONT face=Tahoma size=2><BR>
               </FONT></div></td>
             </tr>
             <tr>
               <td><strong>Chapter 2</strong></td>
               <td><div align="left"> <FONT face=Tahoma size=2><BR>
               </FONT></div></td>
             </tr>
             <tr>
               <td><strong>Chapter 3</strong></td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td><strong>Chapter 4</strong></td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td><strong>Chapter 5</strong></td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td><strong>Chapter 6</strong></td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td><strong>Chapter 7</strong></td>
               <td>&nbsp; </td>
             </tr>
             <tr>
               <td><strong>Chapter 8</strong></td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td><strong>Chapter 9</strong></td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td><strong>Chapter 10</strong></td>
               <td><p> <BR>
               </p></td>
             </tr>
             <tr>
               <td><strong>Chapter 11</strong></td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td><strong>Chapter 12</strong></td>
               <td>&nbsp;</td>
             </tr>
         </table></td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2"><strong>หลักสูตร</strong> 50 ชั่วโมง เีรียนทั้งสิ้น6 ครั้ง ครั้งละ 3 ชั่วโมง</td>
       </tr>
       <tr>
         <td colspan="2"><strong>Software ที่ใช้ในการเรียน</strong> winzip,winrar</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2"><span class="style5">Lecturers:</span></td>
       </tr>
       <tr>
         <td width="9">&nbsp;</td>
         <td width="402"><?php while($row_teacher = mysql_fetch_assoc($teacher)){?>
             <strong><a href="../teacher_show.php?id=<?php echo $row_teacher['teacher_ID'];?>"><?php echo "$row_teacher[title] $row_teacher[name] $row_teacher[surname]"?></a></strong> <br>
             <strong> Education </strong><?php echo $row_teacher['education'];?> <br>
             <br>
             <?php }?></td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2" class="style5">Benifits:</td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td><strong>•</strong>&nbsp;&nbsp;&nbsp;ผู้จบหลักสูตรสามารถออกแบบวงจรทางดิจิตอลได้ <br>
             <strong>•</strong>&nbsp;&nbsp;&nbsp;ผู้จบหลักสูตรจะได้รับประกาศนียบัตรจากทางมหาลัยเทคโนโลยี เจ้่่าคุณทหารพระจอมเกล้าลาดกระบัง <br>
             <strong>•</strong>&nbsp;&nbsp;&nbsp;ประกาศนียบัตรของทางมหาลัย สามารถนำไปเป็นเอกสาร เพื่อศึกษาต่อปริญญาโท ที่ ม.เทคโนโลยเจ้่าคุณทหารพระจอมเกล้าลาดกระบังได้ </td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2" class="style5">Course Fee &amp; Payment: </td>
       </tr>
       <tr>
         <td><p>&nbsp;</p>
          </td>
       <td><p><strong>ค่าลงทะเบียนเรียน &nbsp;<?php echo $row_subject['subject_point']*150;?>&nbsp;บาท</strong></p>
         <strong>การชำระเงิน :</strong> <br>
1. ชำระเงินด้วยตนเองที่มหาลัยเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบังโดยชำระที่สำนักทะเบียนภาควิชาวิศวกรรมคอมพิวเตอร์ <br>
<br>
2. โอนเงินเข้าบัญชีของมหาลัยเทคโนโลยีพระจอมเกล้า เจ้าคุณทหารลาดกระบัง <br>
ธนาคาร กสิกรไทย จำกัด &nbsp;สาขาใดก็ได้ <br>
ประเภท บัญชีออมทรัพย์<br>
เลขที่บัญชี xxx-x-xxxxx-x </td>
       </tr>
     </table>       <p>&nbsp;</p>       <p>&nbsp;</p>       
       <p>&nbsp;</p></td>
     <td width="19" rowspan="2">&nbsp;</td>  
     <td width="349"><table width="300" border="0" cellpadding="2" cellspacing="0">
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td width="309"><form name="form1" method="post" action="../register_check.php">
           <div align="center">
  <input name="Button" type="button" onClick="MM_openBrWindow('../learn_example.php','','status=yes,menubar=yes,width=520,height=400')" value="ตัวอย่างบทเรียน">
&nbsp;&nbsp;  <input type="submit" name="Submit" value="ลงทะเบียนเรียน">
           <input name="subject_ID" type="hidden" id="subject_ID" value="<?php echo $row_subject['subject_ID']; ?>">
           </div>
         </form></td>
       <td width="30">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
       <tr>
         <td colspan="2">&nbsp;</td>
       </tr>
     </table>       <p>&nbsp;</p>       <p>&nbsp;</p>       <p class="style5">&nbsp;</p>       <p>&nbsp;</p>       <p>&nbsp;</p></td>
   </tr>
   <tr>
     <td width="476">&nbsp;</td>
   <td width="349">&nbsp;</td>
   </tr>
</table>
 <p>&nbsp;</p>
 <p>&nbsp; </p>
</body>
</html>
<?php
mysql_free_result($teacher);
?>
