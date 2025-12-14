<?php
include("checkauth.inc");

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
$sql1="select count(*) from admin where mem_id=$user_id";
$result1=mysql_db_query($db,$sql1);
$row=mysql_num_rows($result1);
if($row==0&&$user_type<>'A') header("Location:../welcome.php");

$sql="select t1.mem_id,t1.mem_username,t1.mem_fname,t1.mem_lname,t1.mem_nickname,t2.wri_position,t2.wri_education,t2.wri_experience,t2.wri_skill from member t1,writer t2  where t1.mem_id=t2.mem_id && t1.mem_username='$writername'";
$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);

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

onload="MM_preloadImages('file:///E|/project/magazine/redpoint.gif','file:///E|/project/magazine/carblue.gif','file:///E|/project/magazine/sendpink.gif','file:///E|/project/magazine/detailblue.gif','file:///E|/project/magazine/logoutorg.gif','file:///E|/project/magazine/docyellow.gif','file:///E|/project/magazine/addresspink.gif','../images/homered.gif','../images/docyellow.gif','../images/carblue.gif','../images/messagegreen.gif','../images/addresspink.gif','../images/detailblue.gif','../images/logoutorg.gif')" link="#666666">
<TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <a href="../welcome.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','../images/homered.gif',1)"><IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1></a><a href="../../reader.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','../images/docyellow.gif',1)"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><a href="../schedule/sch_add.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','../images/carblue.gif',1)"><IMG 

      height=33 src="../images/carlendar.gif" width=90 border=0 

      name=Image2></a><a href="../message/readmessage.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','../images/messagegreen.gif',1)"><IMG 

      height=33 src="../images/message.gif" width=90 border=0 

      name=Image4></a><a href="../address/addressbook.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','../images/addresspink.gif',1)"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><a href="../member/edit_profile.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','../images/detailblue.gif',1)"><IMG 

      height=33 src="../images/detail.gif" width=90 border=0 

      name=Image5></a><a href="../member/logout.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','../images/logoutorg.gif',1)"><IMG 

      height=33 src="../images/logout.gif" width=90 border=0 

      name=Image6></a></TD>

  </TR>

  <TR> 

    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>

  </TR>



  <TR vAlign=top align=left>

    <TD>

      <TABLE height=464 width="100%" border=0>
        <TBODY> 
        <TR align="left" bgcolor="#FFFFFF"> 
          <TD vAlign=top width="163" height="497"> 
            <table width="160" border="0" cellpadding="0" cellspacing="0" align="center" height="200">
              <tr align="left" valign="top"> 
                <td nowrap colspan="2" height="18"> 
                  <div align="center"><img src="../images/head_table.gif" width="180" height="20"></div>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" bgcolor="#FFFFFF" height="185"> 
                  <div align="center"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="193" valign="top"> 
                          <table width="99%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="170">
                            <tr> 
                              <td height="191" valign="top"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3" height="116">
                                  <tr> 
                                    <td height="21" align="center" valign="middle"><font face="MS Sans Serif"></font></td>
                                  </tr>
                                  <tr> 
                                    <td height="26" align="center" valign="middle"> 
                                      <table width="100%" border="1">
                                        <tr> 
                                          <td align="center"><font size="2"><font face="MS Sans Serif" color="666666"><a href="./adminpage.php"><font size="2"><font face="MS Sans Serif" color="666666"><b>รายชื่อผู้เขียน</b></font></font></a></font></font></td>
                                        </tr>
                                        <tr>
                                          <td align="center"><a href="./addwriter.php"><font size="2"><font face="MS Sans Serif" color="666666"><b>เพิ่มชื่อผู้เขียน</b></font></font></a></td>
                                        </tr>
                                        <tr> 
                                          <td align="center"><a href="./editwriter.php"><font size="2"><font face="MS Sans Serif" color="666666"><b>แก้ไขข้อมูลผู้เขียน</b></font></font></a></td>
                                        </tr>
                                        <tr> 
                                          <td align="center"><a href="./deletewriter.php"><font size="2"><font face="MS Sans Serif" color="666666"><b><font color="#FF6600">ลบรายชื่อผู้เขียน</font></b></font></font></a></td>
                                        </tr>
                                      </table>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src="../images/login_line.gif" width="180" height="18"></b></font></div>
                </td>
              </tr>
            </table>
          </TD>
          <TD vAlign=top width="727" height="497"> 
            <form method="post" action="./confirmdeletewriter.php">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" height="206">
                <tr bgcolor="#0000CC"> 
                  <td height="32"> 
                    <div align="center"><b><font face="MS Sans Serif" size="3" color="#FFFFFF">ลบรายชื่อผู้เขียน</font></b></div>
                  </td>
                </tr>
                <tr align="left" valign="top"> 
                  <td> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="23%" height="36"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666">ชื่อผู้เขียน</font></font></font></font></font></div>
                        </td>
                        <td width="77%" height="36"><font face="MS Sans Serif" size="2" color="#000000"> 
                          <? echo $writername;?> </font></td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666">ชื่อ-นามสกุล</font></font></font></font></font></div>
                        </td>
                        <td width="77%"><font face="MS Sans Serif" size="2" color="#000000"> 
                          <? echo $data[2].' '.$data[3];?> </font></td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666">ชื่อเล่น</font></font></font></font></font></div>
                        </td>
                        <td width="77%"><font face="MS Sans Serif" size="2" color="#000000"> 
                          <? echo $data[4];?> </font></td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666">หน้าที่การทำงาน</font></font></font></font></font></div>
                        </td>
                        <td width="77%"><font face="MS Sans Serif" size="2" color="#000000"> 
                          <? echo $data[5];?> </font> </td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666">การศึกษา</font></font></font></font></font></div>
                        </td>
                        <td width="77%"><font face="MS Sans Serif" size="2" color="#000000"> 
                          <? echo $data[6];?> </font> </td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666">ประสบการณ์</font></font></font></font></font></div>
                        </td>
                        <td width="77%"><font face="MS Sans Serif" size="2" color="#000000"> 
                          <? echo $data[7];?> </font> </td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666">ความสามารถ</font></font></font></font></font></div>
                        </td>
                        <td width="77%"><font face="MS Sans Serif" size="2" color="#000000"> 
                          <? echo $data[8];?> </font> </td>
                      </tr>
                      <tr> 
                        <td width="23%">&nbsp;</td>
                        <td width="77%"> 
                          <input type="radio" name="deletetype" value="onlywriter" checked>
                          <font face="MS Sans Serif" size="2" color="#000000">ทำการลบชื่อผู้ใช้ออกจาก 
                          <b> <font color="#FF0000"> <font size="3"> ฐานข้อมูลรายชื่อผู้เขียนบทความ</font></font></b></font> 
                        </td>
                      </tr>
                      <tr> 
                        <td width="23%">&nbsp;</td>
                        <td width="77%"> 
                          <input type="radio" name="deletetype" value="deleteall">
                          <font face="MS Sans Serif" size="2" color="#000000">ทำการลบชื่อผู้ใช้ออกจาก<font color="#FF0000"><b> 
                          <font size="3">ฐานข้อมูลของระบบปฏิทินนัดหมาย</font></b></font></font> 
                        </td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666"></font></font></font></font></font></div>
                        </td>
                        <td width="77%"> 
                          <input type="submit" name="Submit" value="ดำเนินการต่อไป">
                          <input type="hidden" name="writerid" value="<?echo$data[0];?>">
                          <input type="hidden" name="writername" value="<?echo $writername;?>">
                        </td>
                      </tr>
                      <tr> 
                        <td width="23%"> 
                          <div align="center"><font size="2"><font size="2"><font face="MS Sans Serif"><font face="MS Sans Serif"><font color="#666666"></font></font></font></font></font></div>
                        </td>
                        <td width="77%">&nbsp;</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </form>
          </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD></TR></TBODY></TABLE>

</BODY>
<?

session_unregister("writername");
?>
</HTML>