<form name="form1" method="post" action="logout.php">
  <table width="180" height="140" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td><font  color="#FF00FF" size="4"  ><div align="center">ยินดีต้อนรับ</div>        <div align="center"  ><strong>คุณ  <?php echo $name; echo" "; echo $surname;?></strong></div></font></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center">
        <input type="submit" name="Submit" value="Logout">
      </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><font  color="#FF00FF" size="4"  ><div align="center" >กลับไปเมนู    
        <?php  
		 echo $status; if($status =="admin") echo("<a href ='Admin/admin_index.php'>");
		else if($status =="student")echo("<a href ='Student/student_index.php'>");
		else if($status =="teacher")echo("<a href ='Teacher/teacher_index.php'>");
		?>
      </div><div align="center"  >คลิกที่นี่ </a></div></font></td>
    </tr>
  </table>
</form>
