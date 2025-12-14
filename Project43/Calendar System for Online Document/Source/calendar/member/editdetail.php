<?php
include("checkauth.inc");
include("thaidate.inc");
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
if($lastpage<>'updatedetail')
{

$sql="select mem_username,mem_password,mem_fname,mem_lname,mem_nickname
,mem_address,mem_zipcode,mem_birthday,mem_email,mem_icq,mem_tel,mem_gender
,mem_pager,mem_occupation,mem_income,mem_show_status 
from member where mem_id='".$user_id."'";

$result=mysql_db_query($db,$sql);
$data=mysql_fetch_array($result);

$username=$data[0];
$password=$data[1];
$old_fname=$data[2];
$old_lname=$data[3];
$old_nickname=$data[4];
$old_address=$data[5];
$old_zipcode=$data[6];
$old_birthday=$data[7];
$old_byear=substr($old_birthday,0,4);
$old_bmonth=substr($old_birthday,5,2);
$old_bdate=substr($old_birthday,8,2);
$old_email=$data[8];
$old_icq=$data[9];
$old_tel=$data[10];
$old_gender=$data[11];
$old_pager=$data[12];
$old_occupation=$data[13];
$old_income=$data[14];
$old_showstatus=$data[15];
mysql_close($link);
}

$msg="";
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

onload="MM_preloadImages('file:///E|/project/magazine/redpoint.gif','file:///E|/project/magazine/carblue.gif','file:///E|/project/magazine/sendpink.gif','file:///E|/project/magazine/detailblue.gif','file:///E|/project/magazine/logoutorg.gif','file:///E|/project/magazine/docyellow.gif','file:///E|/project/magazine/addresspink.gif')" link="#666666">
<TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <a href="../welcome.php"><IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1></a><a href="../../reader.php"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><a href="../schedule/sch_add.php"><IMG 

      height=33 src="../images/carlendar.gif" width=90 border=0 

      name=Image2></a><a href="../message/readmessage.php"><IMG 

      height=33 src="../images/message.gif" width=90 border=0 

      name=Image4></a><a href="../address/addressbook.php"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><a href="./edit_profile.html"><IMG 

      height=33 src="../images/detail.gif" width=90 border=0 

      name=Image5></a><a href="./logout.php"><IMG 

      height=33 src="../images/logout.gif" width=90 border=0 

      name=Image6></a></TD>

  </TR>

  <TR> 

    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>

  </TR>



  <TR vAlign=top align=left>

    <TD>

      <TABLE height=1089 width="100%" border=0>
        <TBODY> 
        <TR align="left" bgcolor="#FFFFFF"> 
          <TD vAlign=top width="169" height="497"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="100"> 
                  <table width="99%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="96">
                    <tr align="center" bgcolor="#FF9900"> 
                      <td height="20" valign="top"><font size="3" face="MS Sans Serif" color="#000000">แก้ไขข้อมูล</font></td>
                    </tr>
                    <tr> 
                      <td height="75" valign="top"> 
                        <table width="100%" border="1">
                          <tr> 
                            <td align="center"><a href="./editusername.php"><font face="MS Sans Serif" size="2" color="#666666">แก้ไขชื่อผู้ใช้</font></a></td>
                          </tr>
                          <tr> 
                            <td align="center"><a href="./editpassword.php"><font face="MS Sans Serif" size="2" color="#000000"><font color="#666666">แก้ไขรหัสผ่าน</font></font></a></td>
                          </tr>
                          <tr> 
                            <td align="center"><a href="./editdetail.php"><font face="MS Sans Serif" size="2" color="#FF6600">แก้ไขข้อมูลส่วนตัว</font></a></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
<? //-----ปุ่มจัดตารางรวดเร็ว และ นัดหมายรวดเร็ว-------- ?>

<table width="180" border="0" cellpadding="0" cellspacing="0">

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="25"> 

                          <div align="right"><a href="../schedule/sch_add2.php"><img src="../images/sch_quick.gif" width="150" height="20" border="0"></a></div>

                        </td>

                      </tr>

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="26"> 

                          <div align="right"><a href="app_add1.php?quick_butt=Y"><img src="../images/app_quick.gif" width="150" height="20" border="0"></a></div>

                        </td>

                      </tr>

                      <?

if($user_calendar=="A" || $user_calendar=="W")

{

?> 

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="26"> 

                          <div align="right"><a href="../../document/edit_article/page_edit.php"><img src="../images/write_column.gif" width="148" height="20" border="0"></a></div>

                        </td>

                      </tr>

                      <?

} //เช็คสิทธ์เขียน

?> <?

if($user_calendar=="A")

{

?> 

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="2"> 

                          <div align="right"><a href="../admin/adminpage.php"><img src="../images/admin.gif" width="149" height="22" border="0"></a></div>

                        </td>

                      </tr>

                      <tr align="left" valign="top"> 

                        <td nowrap colspan="2" height="2"> 

                          <div align="right">&nbsp;</div>

                        </td>

                      </tr>



                      <?

} //เช็คผู้ดูแลระบบ

?> 

                    </table>

<? //-------------หมดquickbutton------- ?>
          </TD>
          <TD vAlign=top width="678" height="497"> 
            <div align="left"></div>
            <form name="form1" method="post" action="./updatedetail.php">
              <table width="370" border="0" cellpadding="0" cellspacing="0" align="center" height="200">
                <tr align="left" valign="top"> 
                  <td nowrap colspan="2" height="18"> 
                    <div align="center"><img src="../images/head_table.gif" width="370" height="20"></div>
                  </td>
                </tr>
                <tr align="left" valign="top"> 
                  <td colspan="2" bgcolor="#FFFFFF" height="185"> 
                    <div align="center"> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                          <td height="193" valign="top"> 
                            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="170">
                              <tr> 
                                <td height="191" valign="top"> 
                                  <table width="100%" border="0" cellspacing="0" cellpadding="3" height="116">
                                    <tr> 
                                      <td height="19" colspan="3" align="center" valign="middle"><font face="MS Sans Serif"></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="26" colspan="3" align="center" valign="middle"><font size="2" face="MS Sans Serif"><b><font size="3" color="#6666CC">แก้ไขข้อมูลส่วนตัว</font></b></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="13" colspan="3" align="center" valign="middle"> 
                                        <table width="100%" border="0">
                                          <tr align="left"> 
                                            <td width="34%" height="34"><b><font face="MS Sans Serif" size="2"><font color="#993399">ชื่อผู้ใช้ 
                                              : </font></font></b></td>
                                            <td width="66%" height="34"><font color="#000000"><b><font face="MS Sans Serif" size="2"> 
                                              <?php echo $username; ?>
                                              </font> </b></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">ชื่อจริง 
                                              : <font color="#ff9999">*</font></font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_fname" size="20" maxlength="30" value="<?php echo $old_fname; ?>">
                                              </font><font face="MS Sans Serif"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">นามสกุล 
                                              : <font color="#ff9999">*</font></font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_lname" size="20" maxlength="30" value="<?php echo$old_lname; ?>">
                                              </font><font face="MS Sans Serif"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"> 
                                              <p><b><font color="#993399" face="MS Sans Serif" size="2">ชื่อเล่น 
                                                : </font><font face="MS Sans Serif" size="2"><font color="#993399"><font color="#ff9999">*</font></font></font></b></p>
                                            </td>
                                            <td width="66%"><font face="MS Sans Serif"><b><font color="#000000" size="5"> 
                                              </font></b></font><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_nickname" size="10" maxlength="20" value="<?php echo$old_nickname; ?>">
                                              </font><font face="MS Sans Serif" size="3"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เพศ 
                                              : <font color="#ff9999">*</font></font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif"> 
                                              <select name="new_gender">
                                                <option value="m" <?php if($old_gender=="m"){echo "selected";}?> >ชาย</option>
                                                <option value="f"<?php if($old_gender=="f"){echo "selected";}?> >หญิง</option>
                                              </select>
                                              </font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">วันเกิด 
                                              : <font color="#ff9999">*</font></font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif"> 
                                              <input type="text" name="new_bdate" size="2" maxlength="2" value="<?php echo$old_bdate; ?>">
                                              - 
                                              <select name="new_bmonth">
                                                <?php for($i=0;$i<12;$i++)
													{if($i==$old_bmonth-1){$select="selected";}
														else{$select="";}
														$j=$i+1;
											             echo '<option value="'.$j.'"  '.$select.'>'.$thaimonth[$i].'</option>';
														}?> 
                                              </select>
                                              - 
                                              <select name="new_byear">
                                                <option value="1900", selected>2443</option>
                                                <?php

			for($engyear=1901;$engyear<2001;$engyear++)

			{	$thaiyear=$engyear+543;

				if($engyear==$old_byear){$select="selected";}

					else {$select='';}

	             echo '<option value="'.$engyear.'"  '.$select.'>'.$thaiyear.'</option>';

			}

?> 
                                              </select>
                                              </font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">ที่อยู่ 
                                              :</font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_address" size="30" value="<?php echo$old_address; ?>" maxlength="50">
                                              </font><font face="MS Sans Serif"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">รหัสไปรษณีย์ 
                                              :</font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_zipcode" size="5" maxlength="10" value="<?php echo$old_zipcode; ?>">
                                              </font><font face="MS Sans Serif"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">อีเมล์ 
                                              : <font color="#ff9999">*</font></font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_email" size="20" maxlength="80" value="<?php echo$old_email; ?>">
                                              </font><font face="MS Sans Serif"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เบอร์โทรศัพท์ 
                                              :</font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              </font><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_tel" size="15" maxlength="20" value="<?php echo$old_tel; ?>">
                                              </font><font face="MS Sans Serif"></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เบอร์ไอซีคิว 
                                              :</font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_icq" size="15" maxlength="15" value="<?php echo$old_icq; ?>">
                                              </font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">เบอร์เพจ 
                                              :</font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              <input type="text" name="new_pager" size="15" maxlength="20" value="<?php echo$old_pager; ?>">
                                              </font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">อาชีพ 
                                              :</font></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif, Microsoft Sans Serif"> 
                                              </font> 
                                              <?
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");



$sql="select * from occupation order by occ_name";

$result= mysql_db_query($db,$sql);

$numrow=mysql_num_rows($result);

?>
                                              <select name="new_occupation">
                                                <option value="0" selected>-เลือกอาชีพ-</option>
                                                <?php
for($i=0;$i<$numrow;$i++)
{	$row=mysql_fetch_array($result);
if($row[1]==$old_occupation){echo'<option value="'.$row[1].'" selected>'.$row[1].'</option>';}
else{echo'<option value="'.$row[1].'">'.$row[1].'</option>';}
	}
?> 
                                              </select>
                                            </td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"><font color="#993399">รายได้ 
                                              :</font></font></b></td>
                                            <td width="66%"> 
                                              <select name="new_income">
                                                <option value="" <?php if($old_income==""){echo" selected";}?>>-เลือกรายได้-</option>
                                                <option value="&lt;5000" <?php if($old_income=="<5000"){echo" selected";}?>>ต่ำกว่า 
                                                5,000บาท</option>
                                                <option value="5000-10000" <?php if($old_income=="5000-10000"){echo' selected';}?>>5,000-10,000บาท</option>
                                                <option value="10000-30000" <?php if($old_income=="10000-30000"){echo" selected";}?>>10,000-30,000บาท</option>
                                                <option value="&gt;30000" <?php if($old_income==">30000"){echo" selected";}?>>มากกว่า30,000บาท 
                                              </select>
                                            </td>
                                          </tr>
                                          <tr align="left">
                                            <td width="34%" align="right" height="45"> 
                                              <input type="checkbox" name="new_showstatus" value="Y" 
												<?php
														if ($old_showstatus=='Y') echo'checked';
												?>
												>
                                            </td>
                                            <td width="66%" height="45"><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"><b><font size="1" face="MS Sans Serif">อนุญาติให้ผู้อื่นดูข้อมูลส่วนตัวได้ 
                                              </font></b><font color="#006699" size="1" face="MS Sans Serif"><br>
                                              ( 
                                              เช่น ชื่อ,ชื่อเล่น,วันเกิด,ที่อยู่,อีเมลล์ 
                                              )</font></font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><b><font face="MS Sans Serif" size="2"></font></b></td>
                                            <td width="66%"><font face="MS Sans Serif"> 
                                              <input type="submit" name="Submit" value="แก้ไขข้อมูล">
                                              </font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td width="34%"><font face="MS Sans Serif"></font></td>
                                            <td width="66%"><font face="MS Sans Serif"> 
                                              </font> <font color="#FF9999" size="2" face="MS Sans Serif, Microsoft Sans Serif"><b>* 
                                              <font color="#000000">จำเป็นต้องกรอก 
                                              </font></b></font><font face="MS Sans Serif"> 
                                              </font></td>
                                          </tr>
                                          <tr align="left"> 
                                            <td colspan="2" align="center" height="25"> 
                                              <div align="center"><font face="MS Sans Serif" size="2" color="FF3333"><b>
                                             <?php 
														echo $err_msg;  
														$err_msg="";
														session_unregister("err_msg");
												?></b></font></div>
                                            </td>
                                          </tr>
                                        </table>
                                        <font face="MS Sans Serif"></font></td>
                                    </tr>
                                    <tr> 
                                      <td height="26" colspan="3" align="center" valign="middle">&nbsp; 
                                      </td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                      <font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><img src="../images/login_line.gif" width="370" height="18"></b></font></div>
                  </td>
                </tr>
              </table>
            </form>
            <div align="left"> </div>
          </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD></TR></TBODY></TABLE>
<? 
$lastpage='';
$old_fname='';
$old_lname='';
$old_nickname='';
$old_address='';
$old_zipcode='';
$old_bdate='';
$old_bmonth='';
$old_byear='';
$old_email='';
$old_icq='';
$old_tel='';
$old_gender='';
$old_pager='';
$old_occupation='';
$old_income='';
$old_showstatus='';

session_unregister("lastpage");
session_unregister("old_fname");
session_unregister("old_lname");
session_unregister("old_nickname");
session_unregister("old_address");
session_unregister("old_zipcode");
session_unregister("old_bdate");
session_unregister("old_bmonth");
session_unregister("old_byear");
session_unregister("old_email");
session_unregister("old_icq");
session_unregister("old_tel");
session_unregister("old_gender");
session_unregister("old_pager");
session_unregister("old_occupation");
session_unregister("old_income");
session_unregister("old_showstatus");
mysql_close();
?>
</BODY>

</HTML>

