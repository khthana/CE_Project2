<?

session_start();

include("../checkauth.inc");

if($num_app=="2")

{

		include("app_group_chkdetail.inc");

}

if($num_chk=="F" || $num_app<>"2")

{

?>



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

onload="MM_preloadImages('../redpoint.gif','../carblue.gif','../sendpink.gif','../detailblue.gif','../logoutorg.gif','../docyellow.gif','../addresspink.gif','../image/detailblue.gif')">

<?



	Include("time.inc");

 	Include("thaidate.inc");



if(!isset($schday))

{

	$schday=date("w");

}

if(!isset($schdate))

{

	$schdate=date("j");

}

if(!isset($schmonth))

{

	$schmonth=date("m");

}

if(!isset($schyear))

{

	$schyear=date("Y");

}



?> 

<TABLE width="120%" border=0 cellpadding="0" cellspacing="0">

  <TBODY> 

  <TR>

    <TD height=39>&nbsp;</TD></TR>

  <TR>

    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 

      <A onmouseover="MM_swapImage('Image1','','../images/redpoint.gif',1)" 

      onmouseout=MM_swapImgRestore() 

      href="../welcome.php"><IMG 

      height=33 src="../images/home.gif" width=90 border=0 

      name=Image1></A><a href="../../reader.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','../images/docyellow.gif',1)"><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"></a><A onmouseover="MM_swapImage('Image2','','../images/carblue.gif',1)" 

      onmouseout=MM_swapImgRestore() 

      href="../schedule/sch_add.php"><IMG 

      height=33 src="../images/carlendar.gif" width=90 border=0 

      name=Image2></A><A 

      onmouseover="MM_swapImage('Image4','','../images/messagegreen.gif',1)" 

      onmouseout=MM_swapImgRestore() 

      href="../message/readmessage.php"><IMG 

      height=33 src="../images/message.gif" width=90 border=0 

      name=Image4></A><a href="../address/addressbook.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','../images/addresspink.gif',1)"><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"></a><A 

      onmouseover="MM_swapImage('Image5','','../images/detailblue.gif',1)" 

      onmouseout=MM_swapImgRestore() 

      href="../member/edit_profile.html"><IMG 

      height=33 src="../images/detail.gif" width=90 border=0 

      name=Image5></A><A 

      onmouseover="MM_swapImage('Image6','','../images/logoutorg.gif',1)" 

      onmouseout=MM_swapImgRestore() 

      href="../member/logout.php"><IMG 

      height=33 src="../images/logout.gif" width=90 border=0 

      name=Image6></A></TD>

  </TR>

  <TR> 

    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>

  </TR>



  <TR vAlign=top align=left>

    <TD>

      <TABLE height=464 width="100%" border=0>

        <TBODY>

        <TR>

          <TD vAlign=top align=left width="21%"> 



              <table width="98%" border="0" cellpadding="0" cellspacing="0">

                <tr> 

                  

                <td nowrap colspan="2"> 

                  <div align="center"></div>

                  </td>

                </tr>

                <tr> 

                  <td colspan="2" bgcolor="#FFFFFF" nowrap> 

                    <div align="center"> 

                      <table width="180" border="0" cellspacing="0" cellpadding="0">

                        <tr> 

                          <td height="109"> 

                            <table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="">

                              <tr>

                                

                              <td>

                                <table cellspacing=0 cellpadding=1 width="100%" border=1 bordercolor="#FF9900">

                                  <tbody> 

                                  <tr bgcolor="#FF9900"> 

          <td noWrap align=middle colspan=4> 

            <div align="left"><font face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFCC" size="2"><b>วันนี้ :</b>

 <a href="../schedule/sch_add.php?schday=<? echo date("w"); ?>&schdate=<? echo date("j"); ?>&schmonth=<? echo date("m"); ?>&schyear=<? echo date("Y"); ?>">

<font color="#FFFFCC" size="2">



<? echo date("j")," ",$thaimonth[date("m")-1]," ",date("Y")+543;    

?>

		 </font></a>

     </font></div></td>

        </tr>



        <tr bgcolor=#ffffff> 

          <td align=middle bgcolor=#FFCC99 width="25%" height="12"><a href="../schedule/sch_add.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#FF0000">วัน</font></a></td>

          <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="../schedule/sch_add_week.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2"><font color="#009900">สัปดาห์</font></font></a></td>

          <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="../schedule/sch_add_month.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">เดือน</font></font></a></td>

          <td align=middle bgcolor=#ffffff width="25%" height="12"><a href="../schedule/sch_add_year.php?schday=<? echo $schday; ?>&schdate=<? echo $schdate; ?>&schmonth=<? echo $schmonth; ?>&schyear=<? echo $schyear; ?>"><font color="#009900">&nbsp;<font face="MS Sans Serif, Microsoft Sans Serif" size="2">ปี</font></font></a></td>

        </tr>

        <tr> 

          <td noWrap align=middle bgcolor=#dcdcdc colspan=4 height="32"> 

            <table cellspacing=0 cellpadding=1 border=0>

              <tbody> 

              <tr>

<?

//-----next month

	$next_month= date("d/m/Y",mktime(1,1,0,$schmonth+1,1,$schyear));

	$nx_day=(int) date("w",mktime(1,1,0,$schmonth+1,1,$schyear));

	$nx_date=(int) substr($next_month,0,2);

	$nx_month=(int) substr($next_month,3,2);

	$nx_year= substr($next_month,6,4);

//----previous month

	$pre_month= date("d/m/Y",mktime(1,1,0,$schmonth-1,1,$schyear));

	$pr_day=(int) date("w",mktime(1,1,0,$schmonth-1,1,$schyear));

	$pr_date=(int) substr($pre_month,0,2);

	$pr_month=(int) substr($pre_month,3,2);

	$pr_year= substr($pre_month,6,4);





?>

 

                                          <td><a 

                  href="../schedule/sch_add.php?schday=<? echo $pr_day; ?>&schdate=<? echo $pr_date; ?>&schmonth=<? echo $pr_month; ?>&schyear=<? echo $pr_year; ?>"> 

                                            <img height=10 src="../images/left4.gif" width=11 

                  border=0></a> </td>

                <td valign=center noWrap><tt><b>

				<font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#FF6600">

<?

	echo $thaimonth[$schmonth-1]," ",$schyear+543;

?>

				</font></b></tt> </td>

                                          <td><a 

                  href="../schedule/sch_add.php?schday=<? echo $nx_day; ?>&schdate=<? echo $nx_date; ?>&schmonth=<? echo $nx_month; ?>&schyear=<? echo $nx_year; ?>"> 

                                            <img height=11 src="../images/right4.gif" width=11 

                  border=0></a> </td>

              </tr>

              </tbody> 

            </table>

          </td>

        </tr>

        <tr> 

          <td align=middle colspan=4> 

<?



// ปฏิทินด้านขวา***************

include("sch_day_of_month.inc");//$day_of_month[0-34] or [0-42] ,$num_week

?> 

            <table width= 100% cellspacing=3 cellpadding=1 bgcolor=#ffffff border=0>

        <tbody>

        <tr>

<?

$start=0;

for($i=0;$i<7;$i++)//week

{

?>

                <td valign=top align=right><font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#000000"> 

                  <?

	$num_show=$start+$i;

    echo $thaiday_short[$i],"<br>";

	for($j=0;$j<$num_week;$j++)

    {

	  $show_date=(int) substr($day_of_month[$num_show],0,2);

	  $tmp_month=(int) substr($day_of_month[$num_show],3,2);

	  $tmp_year=(int) substr($day_of_month[$num_show],6,4);

?></font> <a href="../schedule/sch_add.php?schday=<? echo $i; ?>&schdate=<? echo $show_date; ?>&schmonth=<? echo $tmp_month; ?>&schyear=<? echo $tmp_year; ?>"> 

                  <font face="MS Sans Serif,Microsoft Sans Serif" size="2" color="#000000">	

                  <?

// เช็ควันที่อยู่ในปฏิทินแต่เป็นของเดือนก่อนกับเดือนหน้า

$last_week=$num_week-1;

	  if(($j==0 and $show_date>7) || ($j==$last_week and $show_date<7))

	  { 

		echo "<font color=#999999>";

//แสดงตัวหนา

		    if($show_date==$schdate and $tmp_month==$schmonth) 

			{ echo "<b>",$show_date,"</b><br></font>";

			}else

			{ echo $show_date,"<br></font>";

			}

	  }else

	  {

		echo "<font color=#0000FF>";

		    if($show_date==$schdate and $tmp_month==$schmonth) 

			{ echo "<b>",$show_date,"</b><br></font>";

			}else

			{ echo $show_date,"<br></font>";

			}

	  }		

	  $num_show=$num_show+7;	

	} 

?> </font></a></td>

<?

}

?>

        </tr>

        </tbody> 

      </table>                

<? //หมดปฏิทินด้านขวา 

?>

          </td>

        </tr>

        <tr bgcolor="#CCCCCC"> 

          <td noWrap align=middle colspan=4 height="10">&nbsp;</td>

        </tr>

        </tbody> 

      </table>



								&nbsp; <? //--------------  หมดปฏิทินด้านขวา     -------------------- ?></td>

                              </tr>

                            </table>

                          </td>

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

                        <td colspan="2" bgcolor="#FFFFFF" height="150"> 

                          <div align="center"> 

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                              <tr> 

                                <td height="72"> 

                                  <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FAAB34" height="91">

                                    <tr> 

                                      <td height="97"> 

                                        <table width="100%" border="0" cellspacing="0" cellpadding="3">

                                          <tr> 

                                            <td height="34" colspan="2"><font size="2"><font color="#0066FF" face="AngsanaUPC, Angsana New, MS Serif"><?php include("../checkmessage.inc"); ?></font></font></td>

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

                        <td colspan="2" height="69"> 

                          <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFB038">

                            <tr> 

                              <td height="83"> 

                                <table width="100%" border="0" cellspacing="0" cellpadding="3">

                                  <tr> 

                                    <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/sch_remindside.inc"); ?></font></font></td>

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

                        <td colspan="2" height="2">&nbsp;</td>

                      </tr>

                      <? //------------หมด เตือน ตาราง------------ ?> 

                      <tr align="left" valign="top"> 

                        <td colspan="2" height="9"><img src="../images/app_remindhead.gif" width="188" height="20"></td>

                      </tr>

                      <tr align="left" valign="top"> 

                        <td colspan="2"> 

                          <div align="center"> 

                            <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FF9933">

                              <tr> 

                                <td height="88"> 

                                  <table width="100%" border="0" cellspacing="0" cellpadding="3">

                                    <tr> 

                                      <td height="34" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/app_messbeside.inc"); ?></font></font></td>

                                    </tr>

                                    <tr> 

                                      <td height="31" colspan="2"><font size="1"><font color="#0066FF" face="MS Sans Serif, Microsoft Sans Serif"><?php include("../remind/app_mess_tosenderbeside.inc"); ?></font></font></td>

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

                  </div>

                  </td>

                </tr>

                <tr> 

                  <td colspan="2">

                    

                  <div align="center"></div>

                  </td>

                </tr>

                <tr> 

                  <td colspan="2" height="35"> 

                    

                  <div align="center"></div>

                  </td>

                </tr>

              </table>

          </TD>

          <TD width="79%"> 

      <form method="post" action="app_add_group.php">

              <table width="85%" border="0" cellspacing="0" cellpadding="0">

                <tr>

                  <td width="75%"> 

                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                      <tr> 

                        <td width="10%" height="27">&nbsp;</td>

                        <td width="60%" height="27"> 

                          <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#FF0000"> 

                            <?

if($err<>"")

{

		if($err==1)		

		{ echo " กรุณาใส่ชื่อเรื่องการนัดหมายด้วยค่ะ ";

		 }elseif($err==2)

		{ echo " กรุณาใส่วันที่ให้ถูกต้องด้วยคะ "; 

		}elseif($err==3)

		{ echo " วัน-เดือน-ปี ไม่ถูกต้อง กรุณาตรวจสอบ "; 

		}elseif($err==4)

		{

			echo "กรุณาเลือกกลุ่มที่ต้องการนัดด้วยค่ะ";

		}elseif($err==5)

		{

			echo "กลุ่มที่คุณเลือกไม่มีรายชื่อบุคคล";

		}elseif($err==6)

		{

			echo "รายละเอียดการนัดหมายเกิน200ตัวอักษรค่ะ";

		}

		

}

?> </font></b></font></div>

                        </td>

                      </tr>

                      <tr> 

                        <td width="10%" height="27">&nbsp;</td>

                        <td width="60%" height="27">&nbsp; </td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"> 

                          <select name="date1">

                            <?



		for ($i=1;$i<32;$i++)



		{



			if ($schdate==$i)



          {



				echo "<option value=",$i," selected>",$i,"</option>";



			}else{



               echo "<option value=",$i,">",$i,"</option>";



			}



		}



?> 

                          </select>

                          <select name="month">

                            <?



		for ($i=0;$i<12;$i++)



		{



			$tmpmonth=$schmonth-1;			



			if ($tmpmonth==$i)



          {



				echo "<option value=",$i+1," selected>",$thaimonth[$i],"</option>";



			}else{



               echo "<option value=",$i+1,">",$thaimonth[$i],"</option>";



			}



		}



?> 

                          </select>

                          <select name="year">

                            <?

$tmpyear2=$schyear-10;

		for ($i=0;$i<57;$i++)



		{



			$tmpyear=$tmpyear2+$i;	



			if ($schyear==$tmpyear)



          {



				echo "<option value=",$tmpyear," selected>",$tmpyear+543,"</option>";



			}else{



               echo "<option value=",$tmpyear,">",$tmpyear+543,"</option>";



			}



		}



?> 

                          </select>

                        </td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"> <font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">เวลา</font> 

                          <select name="time">

                            <?



		for ($i=0;$i<16;$i++)



		{



				  if ($time==$schvalue[$i])



				  {



		               echo " <option value=",$schvalue[$i]," selected>",$schtime[$i],"</option>";



					}else{



			            echo "<option value=",$schvalue[$i],">",$schtime[$i],"</option>";



					}



		}



?> 

                          </select>

                        </td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" color="#666666" size="2">เรื่อง</font></td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"> 

<?

if($edit_butt<>"Y")

{

$app_title=stripslashes($app_title);

$app_title=str_replace('"','&quot;',$app_title);

}

if($app_title<>"")

{ 

?> 

                          <input type="text" name="title" size="50" value="<? echo $app_title; ?>" maxlength="50">

                          <?

}else

{

?> 

                          <input type="text" name="title" size="50" maxlength="50" >

                          <?

} //else

?> </td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666">รายละเอียด</font></td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"> <font face="MS Sans Serif, Microsoft Sans Serif" size="2" color="#666666"> 

                          <textarea name="note" cols="50" rows="3" wrap="PHYSICAL">
<?

if($edit_butt<>"Y")

{

$app_note=stripslashes($app_note);

$app_note=str_replace('"','&quot;',$app_note);

}

if($app_note<>"")

{ echo $app_note;

} 

?></textarea>

                          </font> </td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"><font face="MS Sans Serif, Microsoft Sans Serif" color="#666666" size="2">ระยะเวลา 

                          </font><font face="Angsana New, AngsanaUPC" color="#666666"> 

                          <select name="duration">

                            <?

for ($i=1;$i<13;$i++)

{

	echo " <option value=",$i;

	if ($app_duration<>"")

	{		if($app_duration==$i)

			{ echo " selected"; }

	}else

	{ 	if($i==1)

		{ echo " selected"; }

	}

	echo ">",$i," ชม.</option>";

}

?> 

                          </select>

                          </font></td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"><font color="#666666" size="2" face="MS Sans Serif, Microsoft Sans Serif">กำหนดให้มีการเตือนก่อน 

                          <font color="#666666" size="2" face="MS Sans Serif, Microsoft Sans Serif"> 

                          <select name="remind_before">

                            <?

for($i=0;$i<100;$i++)

{

	echo "<option value=$i ";

	if($app_remind_before<>"")

	{

		if($i==$app_remind_before)

		{ echo "selected"; }

	}elseif($app_remind_before=="" and $i==0)

	{ 

		echo "selected";

	}

	echo ">$i</option>";

}

?> 

                          </select>

                          </font>วัน 

                          <select name="remind_before_hour">

                            <?

for($i=0;$i<24;$i++)

{

	echo "<option value=$i ";

	if($app_remind_before_hour<>"")

	{

		if($i==$app_remind_before_hour)

		{ echo "selected"; }

	}elseif($app_remind_before_hour=="" and $i==1)

	{ 

		echo "selected";

	}

	echo ">$i</option>";

}

?> 

                          </select>

                          &nbsp;ชั่วโมง&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></td>

                      </tr>

                      <tr>

                        <td width="10%">&nbsp;</td>

                        <td width="60%">

<?

if($app_remind_mail=="yes")

{ $tmp=" checked";

}else

{ $tmp="";

}

?>

                          <input type="checkbox" name="remind_mail" value="yes" <? echo $tmp; ?>>

                          <font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#666666"> 

                          เตือนงานผ่านทางอีเมล์</font> 

						</td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"> 

                          <div align="center"> 

                            <input type="hidden" name="num_app" value="2">

                          </div>

                        </td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%"> 

                          <div align="center"> 

                            <input type="submit" name="appoint" value="ทำการนัดหมาย">

                          </div>

                        </td>

                      </tr>

                      <tr> 

                        <td width="10%">&nbsp;</td>

                        <td width="60%" height="100%">&nbsp;</td>

                      </tr>

                    </table>





                  </td>

                  <td width="25%"> 

                    <table width="100%" border="1" cellspacing="0" cellpadding="0">

                      <tr bgcolor="#666666"> 

                        <td colspan="2"> 

                          <table width="100%" border="1" cellspacing="0" cellpadding="0">

                            <tr> 

                              <td bgcolor="#999999" width="57%"> 

                                <div align="center">

                                  <input type="submit" name="appoint_person" value="นัดรายบุคคล">

                                </div>

                              </td>

                              <td bgcolor="#CCCCCC" width="43%"> 

                                <div align="center"> <font color="#0000FF" size="1" face="MS Sans Serif, Microsoft Sans Serif">นัดเป็นกลุ่ม</font></div>

                              </td>

                            </tr>

                          </table>

                        </td>

                      </tr>

                      <tr bgcolor="#666666"> 

                        <td colspan="2"> 

                          <div align="center"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#FFFFFF">รายชื่อเพื่อน</font></div>

                        </td>

                      </tr>

                      <tr bgcolor="#CCCCCC"> 

                        <td colspan="2"><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#003399">กลุ่ม 

                          : </font> 

<?

$host="localhost";



$usersql="magazine";



$password="magazine";



$table="schedule";



$db="magazine";



$link=mysql_connect($host,$usersql,$password) or



die("ไม่สามารถติดต่อฐานข้อมูลได้");



mysql_select_db("magazine") or die("ไม่สามารถติดต่อแฟ้มข้อมูลได้"); 

$sqlgroup ="select grp_id,grp_name from group_name where mem_id=$user_id order by grp_id";

$result= mysql_db_query("magazine",$sqlgroup);

$numrow=@mysql_num_rows($result);



?>

                        </td>

                      </tr>

                      <tr> 

                        <td colspan="2" height="35"> 

<font size="1" face="MS Sans Serif, Microsoft Sans Serif" >

<?

for($i=0;$i<$numrow;$i++)

{

	   $row=mysql_fetch_array($result);		

		$tmpname=$row[1];

		$tmpname=$tmpname.$row[0];
    echo "<input type=checkbox name=$tmpname value=$row[0]>";

     echo '<a href="./checkfreegroup.php?group_id='."$row[0]&time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear".'"> <font color="#0066CC">&nbsp;'. $row[1]."</font>";
		echo "<img border=0 src=../images/search.gif width=12 height=12>";
echo'</a><br>';
}

?>

						</font></td>

                      </tr>

                    </table>

                  </td>

                </tr>

                <tr>

                  <td width="65%">&nbsp;</td>

                  <td width="35%">&nbsp;</td>

                </tr>

              </table>

            </form>

<table width="95%" height="100%" border="0" cellspacing="0" cellpadding="0">

                <tr>

                  <td>&nbsp;</td>

                </tr>

              </table>

            



          </TD>

        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>

</BODY>

</HTML>

<?

}elseif($num_chk=="T")

{

$schdate=$date1;

$schmonth=$month;

$schyear=$year;

$schday=(int) date("w",mktime(1,1,0,$schmonth,$schdate,$schyear));

//echo $grp_name,"<br>";

//echo $fri_name;

header("Location:app_add_group2.php?time=$time&schday=$schday&schdate=$schdate&schmonth=$schmonth&schyear=$schyear");

}

?>

