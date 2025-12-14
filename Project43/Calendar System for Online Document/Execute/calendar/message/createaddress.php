<?php
include("checkauth.inc");

$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
if(!isset($groupid))$groupid='all';
if($lastpage=='createaddress')
{
$rec_name='';
if(sizeof($checkbox)<>0)
{
foreach($checkbox as $address)
{$rec_name=$rec_name.$address.',';
}}
if(sizeof($groupselect)<>0)
{
foreach($groupselect as $group_id)
{$sql="select  t1.mem_username from member t1,contact t2 where t1.mem_id=t2.friend_id && t2.mem_id=$user_id && t2.grp_id=$group_id";
$result=mysql_db_query($db,$sql);
$row=mysql_num_rows($result);
	for($i=$begin;$i<$row;$i++)
	{$data=mysql_fetch_array($result);
		if(!strpos($rec_name,$data[0]))$rec_name=$rec_name.$data[0].',';
}
}}
$rec_name=substr_replace($rec_name,'',strlen($rec_name)-1);
mysql_close($link);
header("Location:./sendmessage.php?send_name=$rec_name");
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

onload="MM_preloadImages('file:///E|/project/magazine/redpoint.gif','file:///E|/project/magazine/carblue.gif','file:///E|/project/magazine/sendpink.gif','file:///E|/project/magazine/detailblue.gif','file:///E|/project/magazine/logoutorg.gif','file:///E|/project/magazine/docyellow.gif','file:///E|/project/magazine/addresspink.gif','../images/homered.gif','../images/docyellow.gif','../images/carblue.gif','../images/messagegreen.gif','../images/addresspink.gif','../images/detailblue.gif','../images/logoutorg.gif')" link="#666666">
<TABLE height=10 width="100%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <a href="../welcome.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','../images/homered.gif',1)"><IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1></a><a href="../../index.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','../images/docyellow.gif',1)"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><a href="../schedule/sch_add.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','../images/carblue.gif',1)"><IMG 

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
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="100"> 
                  <table width="99%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933" align="center" height="96">
                    <tr align="center" bgcolor="#FF9900"> 
                      <td height="20" valign="top"><font size="3" face="MS Sans Serif" color="#000000">เมนู</font></td>
                    </tr>
                    <tr> 
                      <td height="75" valign="top"> 
                        <table width="100%" border="1" bordercolor="#CCCCCC">
                          <tr bgcolor="#FFFFFF"> 
                            <td align="center" height="27"><font size="2"><a href="./readmessage.php"><font face="MS Sans Serif" color="666666">อ่านข้อความ</font></a></font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td align="center" height="32"><font size="2"><a href="./sendmessage.php"><font face="MS Sans Serif" color="FF6600">ส่งข้อความ</font></a></font></td>
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
            <table width="120" border="0" cellpadding="0" cellspacing="0">
              <tr align="left" valign="top"> 
                <td nowrap colspan="2"> 
                  <div align="center"><img src="../images/mess_remindhead.gif" width="188" height="21"></div>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" bgcolor="#FFFFFF" height="133"> 
                  <div align="center"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td height="72"> 
                          <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FAAB34" height="91">
                            <tr> 
                              <td height="97"> 
                                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                  <tr> 
                                    <td height="34" colspan="2"><font size="2"><font color="#0066FF" face="AngsanaUPC, Angsana New, MS Serif">
                                      <?php include("../checkmessage.inc"); ?>
                                      </font></font></td>
                                  </tr>
                                  <tr> 
                                    <td height="31" colspan="2">&nbsp;</td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                          <? //----------หมด เตือนข้อความ ---------- ?>
                        </td>
                      </tr>
                    </table>
                    <font face="MS Sans Serif, Microsoft Sans Serif" size="2"></font></div>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="16"><img src="../images/sch_remindhead.gif" width="188" height="20"></td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="101"> 
                  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFB038">
                    <tr> 
                      <td height="83"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                          <tr> 
                            <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif">
                              <?php include("../remind/sch_remindside.inc"); ?>
                              </font></font></td>
                          </tr>
                          <tr> 
                            <td height="31" colspan="2">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="16">&nbsp;</td>
              </tr>
              <? //------------หมด เตือน ตาราง------------ ?>
              <tr align="left" valign="top"> 
                <td colspan="2" height="9"><img src="../images/app_remindhead.gif" width="188" height="20"></td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="2" height="108"> 
                  <div align="center"> 
                    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933">
                      <tr> 
                        <td height="127"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr> 
                              <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif">
                                <?php include("../remind/app_messbeside.inc"); ?>
                                </font></font></td>
                            </tr>
                            <tr> 
                              <td height="31" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif">
                                <?php include("../remind/app_mess_tosenderbeside.inc"); ?>
                                </font></font></td>
                            </tr>
                            <tr> 
                              <td colspan="2">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <? //---------------- หมด เตือน นัดหมาย -------------- ?>
                  </div>
                </td>
              </tr>
            </table>
          </TD>
          <TD vAlign=top width="727" height="497">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr align="center"> 
                <td height="44"><b><font face="MS Sans Serif" size="2" color="#333333">กรุณาเลือกบุคคลที่คุณต้องการส่งข้อความถึง</font></b></td>
              </tr>
              <tr align="center" valign="top"> 
                <td height="40"> 
                  <div align="center">
                    <form method="post" action="./createaddress.php">
                      <font size="2" face="MS Sans Serif"> </font> <font size="2" face="MS Sans Serif"> 
                      </font> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF">
                        <tr bordercolor="#FFFFFF" bgcolor="#CAE4FF"> 
                          <td align="right" width="37%"><font size="2" face="MS Sans Serif">ต้องการดูรายชื่อเพื่อนในกลุ่ม 
                            ชื่อ</font><font size="2" face="MS Sans Serif" color="#333333"></font></td>
                          <td width="19%"> <font size="2" face="MS Sans Serif">
                            <select name="groupid">
                              <option value="all" >รายชื่อทั้งหมด</option>
                              <? 
$link=mysql_connect($host,$user,$pass) or die("ไม่สามารถติดต่อฐานข้อมูลได้");
		$sql1="select grp_id,grp_name from group_name where mem_id=".$user_id.' order by grp_id';
		$result1=mysql_db_query($db,$sql1);
		$row=mysql_num_rows($result1);
		for($i=0;$i<$row;$i++){
					$data=mysql_fetch_array($result1);
if($groupid==$data[0])                     echo'<option value="'.$data[0].'" selected>'.$data[1].'</option>';
else                       echo'<option value="'.$data[0].'">'.$data[1].'</option>';
		}
?> 
                            </select>
                            </font></td>
                          <td width="44%"><font size="2" face="MS Sans Serif"> 
                            <input type="submit" name="viewfriend" value="ดูรายชื่อเพื่อน">
                            <input type="hidden" name="grouptype" value="bygroup">
                            </font></td>
                        </tr>
                      </table>
                      <font size="2" face="MS Sans Serif"> </font> 
                    </form>
                    
                  </div>
                </td>
              </tr>
              <tr bordercolor="#FFFFFF"> 
                <td> 
                  <form method="post" action="./createaddress.php">
                    <input type="submit" name="Submit" value="ตกลง">
                    <input type="hidden" name="lastpage" value="createaddress">
                    <table width="565" border="1">
                      <tr bgcolor="#3366FF" align="center"> 
                        <td  width="5%"> </td>
                        <td width="95%"><font size="2"><b><font color="#FFFFFF" face="MS Sans Serif">ชื่อผู้ใช้</font></b></font></td>
                      </tr>
                      <font face="MS Sans Serif" size="2"> <?
if($groupid=='all')
	{
				$sql1="select grp_id,grp_name from group_name where mem_id=$user_id order by grp_id";
					$result1=mysql_db_query($db,$sql1);
					$row1=mysql_num_rows($result1);
					for($i=$begin;$i<$row1;$i++)
					{$data1=mysql_fetch_array($result1);
					echo '<tr align="center">';
					echo '<td width="5%">';
					echo'<input type="checkbox" name="groupselect['.$data1[1].']" value="'."$data1[0]".'">';
					echo '</td>';
					echo '<td width="95%"><font color="#000000" size="2" face="MS Sans Serif"><b><i>กลุ่ม '.$data1[1].'</i></b></font></a></td>';
					echo '</tr>';
					}				
					$sql="select distinct t1.mem_id,t1.mem_username,t1.mem_fname,t1.mem_lname from member t1,contact t2 where t1.mem_id=t2.friend_id && t2.mem_id=$user_id  order by t1.mem_username,t1.mem_fname,t1.mem_lname  ";
					$result=mysql_db_query($db,$sql);
					$row=mysql_num_rows($result);
					for($i=$begin;$i<$row;$i++)
					{$data=mysql_fetch_array($result);
					echo '<tr align="center">';
					echo '<td width="5%">';
					echo'<input type="checkbox" name="checkbox['.$i.']" value="'."$data[1]".'">';
					echo '</td>';
					echo '<td width="95%"><b><font face="MS Sans Serif" size="2">'.$data[1].' ( '.$data[2].' '.$data[3].' )</font></b></td>';
					echo '</tr>';
					}
}
else
{					$sql="select distinct t1.mem_id,t1.mem_username,t1.mem_fname,t1.mem_lname from member t1,contact t2 where t1.mem_id=t2.friend_id && t2.mem_id=$user_id  &&t2.grp_id=$groupid order by t1.mem_username,t1.mem_fname,t1.mem_lname  ";
					$result=mysql_db_query($db,$sql);
					$row=mysql_num_rows($result);
					for($i=$begin;$i<$row;$i++)
					{$data=mysql_fetch_array($result);
					echo '<tr align="center">';
					echo '<td width="5%">';
					echo'<input type="checkbox" name="checkbox['.$i.']" value="'."$data[1]".'">';
					echo '</td>';
					echo '<td width="95%"><b><font face="MS Sans Serif" size="2">'.$data[1].' ( '.$data[2].' '.$data[3].' )</font></b></td>';
					echo '</tr>';
}}
mysql_close($link);
				?> </font> 
                    </table>
                    <input type="submit" name="Submit" value="ตกลง">
                  </form>
                </td>
              </tr>
              <tr> 
                <td>&nbsp; </td>
              </tr>
            </table>
          </TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD></TR></TBODY></TABLE>

</BODY>

</HTML>