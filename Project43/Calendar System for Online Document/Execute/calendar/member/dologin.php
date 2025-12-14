<?php
$host="localhost";
$user="magazine";
$pass="magazine";
$db="magazine";
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");

$sql="select mem_id	,mem_username,mem_password from member where mem_username='".$username."'";

$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);
$row=mysql_num_rows($result);

if ($row==0||empty($username))
{	$msg='ชื่อผู้ใช้ไม่ถูกต้อง กรุณาใส่ข้อมูลอีกครั้ง';
	$username='';
}
else if($password<>$data[2]) {
	$msg='รหัสผ่านไม่ถูกต้อง <br>กรุณาใส่รหัสผ่านอีกครั้ง';
}
else{
	session_start();

	session_register("user_id");
	session_register("crp_password");
	session_register("type");

	$user_id=$data[0];
	$crp_password=crypt($password,"mg");

	mysql_close($link);

	header("Location: ../welcome.php");
}
?>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<!-- saved from url=(0062)http://olala05.ce.kmitl.ac.th/magazines/testphp/tempwhite.html -->

<HTML><HEAD><TITLE>Calendar</TITLE>

<style type="text/css">



<!--



body {  margin: 0px  0px; padding: 0px  0px}



a:link { color: #ccffcc; text-decoration: none}



a:visited { color: #CCFFCC; text-decoration: none}



a:active { color: #CCFFCC; text-decoration: underline}



a:hover { color: #CCFFCC; text-decoration: underline}



-->



</style>

<META http-equiv=Content-Type content="text/html; charset=Windows-874">

<SCRIPT language=JavaScript>

<!--

function MM_swapImgRestore() { //v3.0

  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;

}



function MM_preloadImages() { //v3.0

  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();

    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)

    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}

}



function MM_findObj(n, d) { //v3.0

  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {

    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}

  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];

  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;

}



function MM_swapImage() { //v3.0

  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)

   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}

}

//-->

</SCRIPT>



<META content="MSHTML 5.50.4134.600" name=GENERATOR></HEAD>

<BODY bgColor=#ffffff 

onload="MM_preloadImages('../redpoint.gif','../carblue.gif','../sendpink.gif','../detailblue.gif','../logoutorg.gif','../docyellow.gif','../addresspink.gif')">

<TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

    <TD height=8> <img src=".././images/label1.gif" width="126" height="54" border="0"> 
      <IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"><IMG 

      height=33 src="../images/carlendar.gif" width=90 border=0 

      name=Image2><IMG 

      height=33 src="../images/message.gif" width=90 border=0 

      name=Image4><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"><IMG 

      height=33 src="../images/detail.gif" width=90 border=0 

      name=Image5><IMG 

      height=33 src="../images/logout.gif" width=90 border=0 

      name=Image6></TD>

  </TR>

  <TR> 

    <TD height="18"><img src=".././images/bolder2.gif" width="140" height="18"><img src=".././images/bolder1.gif" width="630" height="18"></TD>

  </TR>



  <TR vAlign=top align=left>

    <TD>

      <TABLE height=464 width="100%" border=0>
        <TBODY> 
        <TR align="center" bgcolor="#FFFFFF"> 
          <TD vAlign=top colspan="2"> 
            <form method="post" action="./dologin.php" name="Login">
              <table width="98" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td nowrap colspan="2" height="3"> 
                    <div align="center"><img src=".././images/login_head.gif" width="188" height="20"></div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" bgcolor="#FFFFFF"> 
                    <div align="center"> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td> 
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933">
                              <tr> 
                                <td> 
                                  <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                    <tr> 
                                      <td height="50" width="45%"><font color="#999999"><b><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ชื่อผู้ใช้ 
                                        : </font></b></font></td>
                                      <td height="50" width="55%"> 
                                        <input type="text" name="username" size="15" maxlength="15">
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td height="31" width="45%"><font color="#999999"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="1">รหัสผ่าน 
                                        :</font></b></font></td>
                                      <td height="31" width="55%"> 
                                        <input type="password" name="password" size="15" maxlength="15">
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td width="45%" valign="middle"> 
                                        <div align="center"><a href="../mem_register1.php"><b></b></a></div>
                                      </td>
                                      <td width="55%"> 
                                        <div align="center"> 
                                          <input type="image" border="0" name="submit" src="../images/go2.gif" width="19" height="19">
                                        </div>
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td colspan="2"> 
                                        <div align="center"><a href="./mem_register1.php"><b><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#FF9900">สมัครสมาชิก</font></b></a></div>
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td colspan="2"> 
                                        <div align="center"><font color="#FF0000"><b><font size="2" face="AngsanaUPC, Angsana New, MS Serif"><?php echo $msg; ?></font></b></font></div>
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                      <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src=".././images/login_line.gif" width="188" height="12"></b></font></div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2"> 
                    <div align="center"></div>
                  </td>
                </tr>
              </table>
            </form>
            <div align="right"> </div>
          </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD></TR></TBODY></TABLE>

</BODY>

</HTML>

