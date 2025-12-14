<?php
if ($_SESSION['Status']=="online") {
  print "<center><table>";
  print "<tr bgcolor='#880000'><td align='center'><img src='./image/lb_membername.jpg' border='0'>";
  print "<tr><td align='center'><font size='2' color='#FFFF00'><b>".$_SESSION['User']."</b></font>";
  print "<tr><td align='center'><font size='2' color='#0000FF'>(".$_SESSION['Name'].")</font>";
  print "</table></center>";
  
  print "<hr><br>";
  print "<center><table cellspacing='1' cellpadding='1'>";
  print "<tr><td align='center'><a href='editprofile1.php'><img src='./image/bt_editprofile.gif' border='0'></a>";
  print "<tr><td align='center'><a href='changepwd1.php'><img src='./image/bt_changepwd.gif' border='0'></a>";
  print "<tr><td align='center'><a href='regist2.php?pIs_Return=yes'><img src='./image/bt_sendphoto.gif' border='0'></a>";
  print "<tr><td align='center'><a href='main.php'><img src='./image/bt_refresh.gif' border='0' alt='ดูข้อความล่าสุด'></a>";
  print "<tr><td align='center'><a href='main.php?btSignOut=yes'><img src='./image/bt_signout.gif' border='0'></a>";
  print "</table></center>";

  if ($_SESSION['ss_Level']=='admin') {
    print "<br><br><table bgcolor='#000000' width='100%'>";
    print "<tr><td align='center'><font size='2' color='#FFFFFF'> สำหรับผู้ดูแลระบบ</font>";
    print "</table>";
    print "<table bgcolor='#CFCFCF' width='100%'>";
    if ($_SESSION['ShowManage']) {
      $mvalue = "ซ่อนปุ่มควบคุม";
    } else {
      $mvalue = "แสดงปุ่มควบคุม";
    }
    print "<tr><td align='center'><input type='button' name='btswitch_manage' value='$mvalue' onClick='window.navigate(\"main.php?btswitch_manage=yes\")'>";
    print "</table>";
  }
} else {
  print "<table>";
  if (isset($_POST['btSignIn'])) {
    print "<tr><td align='center'>";
    print "<table bgcolor='#FFFF99' border='1'>";
    print "<tr><td><font size='2' color='#FF0000'> ชื่อผู้ใช้ / รหัสผ่าน";
    print "<br>ไม่ถูกต้อง";
    print "<br>ลองให้....</font>";
    print "</table>";
  }

  //------ Log In --------//

  print "<form name='LogInForm' method='post' action='main.php'>";
  print "<tr bgcolor='#880000'><td align='center'><font size='2' color='#FFFFFF'><b></b></font>";
  print "<tr><td align='center'><font size='2' color='#BF6F00'> User </font>";
  print "<tr><td align='center'><input type='text' name='cLogIn' size='12' maxlength='50'>";
  print "<tr><td align='center'><font size='2' color='#BF6F00'> Password</font>";
  print "<tr><td align='center'><input type='password' name='Pwd' size='12' maxlength='16'>";
  print "<tr><td align='center'><input type='submit' name='btSignIn' value='Submit'>";
  print "</form>";
  //--------------------------//
  
  print "<tr><td><hr>";
  print "<tr><td><font size='2' color='#0000BF'>ใครยังไม่ได้ลงทะเบียน</font>";
  print "<tr><td><font size='2' color='#0000BF'>เชิญทางนี้.....</font>";
  print "<tr><td align='center'><input type='button' name='btRegist' value='ลงทะเบียน' onClick='window.navigate(\"regist1.php\")'>";
  print "</table>";
}

print "<br><br>";
print "<!-- XCounters.com Hit Counter for com4ru -->";
print "<center><a href=http://panties.shoppingsavvy.com/>";
print "<img src=http://a.xcounters.com/?com4ru border=0></a></center>";
print "<!-- XCounters.com Hit Counter for com4ru -->";
?>
