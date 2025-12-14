<?php 
	session_start(); 
	require('./libraries/grab_globals.lib.php'); 
?>
<html>
<head><title>Change Password</title>
<meta http-equiv="Content-Type" content="Text/Html;charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<script language="javascript">
<!--
	function check_input(){
	var password = change_pwd.new_password.value.length;
		if(change_pwd.old_password.value ==""){
			alert("คุณยังไม่ได้กรอก old password ");
			change_pwd.old_password.focus();
			return false
		}
		if(change_pwd.new_password.value ==""){
			alert("คุณยังไม่ได้กรอก new password ");
			change_pwd.new_password.focus();
			return false
		}
		if(change_pwd.conf_password.value ==""){
			alert("คุณยังไม่ได้กรอก confirm new password ");
			change_pwd.conf_password.focus();
			return false
		}
		if(change_pwd.new_password.value != change_pwd.conf_password.value){
			alert("new password ไม่ตรงกับ confirm new password ");
			change_pwd.new_password.value = "";			
			change_pwd.conf_password.value = "";
			change_pwd.new_password.focus();
			return false;								
		}
		if( password < 4  || password > 12) {
		alert("ความยาว password ต้องมีความยาว 4-12 ตัวอักษร");
		document.change_pwd.new_password.focus();
		return false;
	}


	}
//-->
</script>

<body>
<form name="change_pwd" method = "post" action = "change_pwd.php?user=<?php echo $user ?>" onsubmit = "return check_input()">
   <table width="350" cellspacing="0" cellpadding="0" border="0">
      <tr>
         <td width="5" rowspan="20"></td>
         
      <td class="title"><font color="#CC9900">เปลี่ยนรหัสผ่าน </font></td>
      </tr>
      <tr> 
      <td bgcolor="#000000" colspan="2"><img src="images/dot.gif" width="1" height="1"></td>
  	 </tr>
      <tr>
      <td align="left"><br>
        <table width="100%" border="0">
          <tr>
            <td> 
              <div align="right"> 
                <input type="submit" name="savd_ch" value="บันทึก" class="button" title = "บันทึกการเปลี่ยนแปลง">
              </div>
            </td>
          </tr>
        </table>       <?php if($errmessage) { ?>
                <table border="0" cellspacing="0" cellpadding="0" class = "text" width="152">
          <tr> 
            <td align="left" valign="top" bgcolor="#869DB9" width="11"><img src="Picture/cn_drk_lt.gif" width="11" height="19"></td>
            <td bgcolor="#869DB9" style="color:white;" width="128"><b>ข้อผิดพลาด</b><img src="picture/dnw_arrow.gif" width="7" height="7" hspace="5"></td>
            <td align="right" valign="top" bgcolor="#869DB9" width="13"><img src="Picture/cn_drk_rt.gif" width="11" height="20"></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class = "text" >
          <tr bgcolor="#869DB9"> 
            <td > 
              <table width="100%" border="0" cellspacing="0" cellpadding="1" class = "text">
                <tr bgcolor="#869DB9"> 
                  <td bgcolor="#869DB9"> 
                    <table width="100%" border="0" cellspacing="1" cellpadding="4" class = "text" bgcolor="#E9E9E9">
                      <tr> 
                        <td valign="top"><font color="red"><?php echo $errmessage; ?></font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table> <?php } ?>
        <br>
              </td>
      </tr>
      <tr>
         <td>
            <table width="350" border="0" cellspacing="0" cellpadding="0">
               <tr> 
                  <td valign="top" width="10"><img src="Picture/cn2s_lt.gif" width="10" height="11"></td>
                  <td bgcolor="#869DB9" align="left" width="520"><img src="Picture/dot.gif" width="1" height="1"></td>
                  <td valign="top" width="10"><img src="Picture/cn2s_rt.gif" width="10" height="11"></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td bgcolor="#869DB9">
            <table width="350" border="0" cellspacing="1" cellpadding="4" class="text">

               <tr>
                  
            <td bgcolor="#E0DDBC" width="145" class="header_left">Old Password 
            </td>
                  
            <td bgcolor="#FAF7EA" width="186"> 
              <input type="text" size="15" maxlength="12" name="old_password" value="">
                  </td>
               </tr>
               <tr>
                  
            <td bgcolor="#E0DDBC" width="145" class="header_left">New Password 
            </td>
                  
            <td bgcolor="#FAF7EA" width="186"> 
              <input type="password" size="15" maxlength="12" name="new_password" value="">
                  </td>
               </tr>
               <tr>
                  
            <td bgcolor="#E0DDBC" width="145" class="header_left">Confirm New 
              Password </td>
                  
            <td bgcolor="#FAF7EA" width="186"> 
              <input type="password" size="15" maxlength="12" name="conf_password" value="">
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td>
            <table width="350" border="0" cellspacing="0" cellpadding="0">
               <tr> 
                  <td valign="bottom" width="10"><img src="Picture/cn2_lb.gif" width="10" height="11"></td>
                  <td bgcolor="#869DB9" width="520"><img src="Picture/dot.gif" width="1" height="1"></td>
                  <td valign="bottom" width="10"><img src="Picture/cn2_rb.gif" width="10" height="11"></td>
               </tr>
            </table>
         </td>
      </tr>
   </table>
</form>
</body>
</html>