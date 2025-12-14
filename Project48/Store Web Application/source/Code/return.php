<?php
echo "
<HTML>
<HEAD>
<TITLE>หน้าสำหรับการคืน  </TITLE>
<meta http-equiv='Content-Type' content='text/html; charset=windows-874'>
</HEAD>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<font color='#7B869A'></font>
<form name='ReturnHardware' method='post' action='Return1.php'>
<div align='center'>  <h2><font color=#993366>:: การคืนอุปกรณ์   :: </font> </h2></div>  

     
<br>
<table width='50%' height='30' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='#3399FF'>

<tr> 
<td  bgcolor=#FFFFCC> <font color=#6633FF><b> &nbsp;  รหัสนักศึกษา </b></font> </td>
<td bgcolor=#CCFFFF> <input name='ID' type='text' maxlength='10' ></td>
</tr>

<tr>
<td  bgcolor=#FFFFCC><font color=#6633FF><b>  &nbsp; รหัสอุปกรณ์ </b></font></td>
<td bgcolor=#CCFFFF> <input  name='Hard_ID' type='text' maxlength='30' ></td>
</tr>
<tr>
  <td> </td>
  <td>
    <div align='center'>
      <input name='Submit' type='submit' value=' ตกลง '> &nbsp;
      <input name='Reset' type='reset' value=' ยกเลิก '>
  </div></td>
</tr>
</table>
</form>

</BODY>
</HTML> ";
?>
