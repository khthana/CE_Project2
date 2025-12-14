<?php
session_start();
$host="localhost";
$link=mysql_connect($host,$user);

if(!$link) {
exit("ไม่สามารถเชื่อมต่อกับ server ได้ เนื่องจาก password หรือ username ของท่านไม่ถูกต้อง");
}

mysql_select_db("dms");
$mdpass = md5($pass.$user);
$password = mysql_query("SELECT  * FROM user WHERE Username='$user' AND Password='$mdpass'");
if (mysql_num_rows($password)==0) {exit("<a href=../><strong><font color=#FF0000 size=3>Username หรือ Password ของท่านไม่ถูกต้อง 
กรุณากรอกใหม่อีกครั้ง</font></strong>");}

$groupre = mysql_query("SELECT * FROM user WHERE UserName LIKE '$user'");
if ((mysql_num_rows($groupre))!==0) {
while ($groupre2=mysql_fetch_array($groupre)) {
$usergroup = $groupre2["Group"];
session_register("usergroup");
}
}
$file = fopen("group.txt","r");
$group = fgets($file); 
session_register("group");
$ii="0";
//move and copy///////////////////////////////////////////////////////////////
if  ($cRadioMove!="") {
$CheckEQdel = mysql_query("SELECT * FROM file WHERE FileID LIKE '$hidden4'");
$NameCheck = mysql_result($CheckEQdel,0,"FileName");
$PathCheck = $uploadPath.$cRadioMove;
$PathCheck2 = substr($PathCheck,0,strrpos($PathCheck,"/"));
$CheckEQdel2 = mysql_query("SELECT * FROM file WHERE FileName='$NameCheck' AND Path='$PathCheck2'");
if ((mysql_num_rows($CheckEQdel2))==0) {
$PathGoal = $PathCheck.$NameCheck;
$OldPathGoal = $uploadPath.$hidden3;
$OldPathGoal2 = $OldPathGoal.$NameCheck;

$teststatus = mysql_query("SELECT * FROM virtual WHERE VirtualPath='$cRadioMove' AND FileID='$hidden4'");
if ((mysql_num_rows($teststatus))==0) {  
if (($statuss=="Move to")&&($cButtonMove=="Move")) { //echo "head = ".$OldPathGoal2."tail".$PathGoal;
if (@rename($OldPathGoal2,$PathGoal)) {} else { echo "ไม่สามารถย้ายไฟล์ได้เนื่องจากเกิดความผิดพลาด ระบบหาไฟล์ไม่พบ!";  }
mysql_query("UPDATE virtual SET VirtualPath='$cRadioMove' WHERE  VirtualPath='$hidden3' AND FileID='$hidden4'");
mysql_query("UPDATE file SET Path='$PathCheck2' WHERE FileID='$hidden4'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ย้ายไฟล์ ID ".$hidden4." จาก Path ".$hidden3." ไปเป็น Path ".$PathCheck2." <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
} else {if (($statuss=="Copy to")&&($cButtonCopy=="Copy")) {
if (@rename($oldpath1,$newpath1)) {} else { echo "ไม่สามารถย้ายไฟล์ได้เนื่องจากเกิดความผิดพลาด ระบบหาไฟล์ไม่พบ!"; }
mysql_query("INSERT INTO virtual (VirtualPath,FileID) VALUES ('$cRadioMove','$hidden4')");
}}} else { $error = 1; }
} else { $ErrorMove = "1"; }
}
//end move and copy///////////////////////////////////////////////////////////////
//delete///////////////////////////////////////////////////////////////////////////////////
if (($statuss=="Delete")&&($cButtonMove=="Sure")) { 
mysql_query ("DELETE FROM virtual WHERE FileID='$hidden4'");
$DeletePoint  = mysql_query("SELECT * FROM file WHERE file.FileID LIKE '$hidden4'");
$oldname = mysql_result($DeletePoint,0,"FileName");
$fileorder = mysql_result($DeletePoint,0,"FileID");
$newname = $fileorder."_".$oldname;
$oldpath = mysql_result($DeletePoint,0,"Path");
$newpath = $unusePath;
$oldpath1 = $oldpath."/".$oldname;
$newpath1 = $newpath.$newname;
$deletesql = mysql_query("UPDATE file SET file.FileName='$newname',file.Path='$newpath',file.FileStatus='UNUSE' WHERE FileID='$hidden4'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ลบไฟล์ ID ".$hidden4." ใน Path ".$hidden3." ไปอยู่ในโฟลเดอร์ unuse<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
if(!$deletesql) {echo "ไฟล์ของคุณมีขนาดใหญ่เกินไปค่ะ"; }  //echo $oldpath1.$newpath1;
if (@rename($oldpath1,$newpath1)) {} else { echo "ไม่สามารถย้ายไฟล์ได้เนื่องจากเกิดความผิดพลาด ระบบหาไฟล์ไม่พบ!"; }
}
//end delete////////////////////////////////////////////////////////////////////////////
//priority//////////////////////////////////////////////////////////////////////////////////
if (($statuss=="Set Priority")&&($cButtonSet=="OK")) {
mysql_query("DELETE FROM permission WHERE ID LIKE '$hidden4'");
for ($k=1;$k<=$group;$k++) {
if(($cSet[$k]=="SetR[$k]")) { mysql_query("INSERT INTO permission (ID,GroupAllow,Permiss) VALUES ('$hidden4','$k','R')"); 
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน Priority ของไฟล์ใน  ID ".$hidden4." เป็น R <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
} else {
if(($cSet[$k]=="SetRW[$k]")) { mysql_query("INSERT INTO permission (ID,GroupAllow,Permiss) VALUES ('$hidden4','$k','RW')"); 
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน Priority ของไฟล์ใน  ID ".$hidden4." เป็น RW <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
} else {
if(($cSet[$k]=="SetRWS[$k]")) { mysql_query("INSERT INTO permission (ID,GroupAllow,Permiss) VALUES ('$hidden4','$k','RWS')"); 
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน Priority ของไฟล์ใน  ID ".$hidden4." เป็น RWS <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}  }}
}
}
//end priority///////////////////////////////////////////////////////////////////////////
//add to virtual
 if (($IDadd!="Back")&&($IDadd!="")) {
				$cc1 = mysql_query("SELECT * FROM file WHERE FileID LIKE '$IDadd'");
				$cc2 = mysql_result($cc1,0,"FileName");
				$cc3 = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE '$AddValue'");
				if ((mysql_num_rows($cc3))!=0) {
				while ($cc4=mysql_fetch_array($cc3)) {
				$cc6 = $cc4["FileID"];
				$cc5 = mysql_query("SELECT * FROM file WHERE FileID LIKE '$cc6'");
				$cc7 = @mysql_result($cc5,0,"FileName"); 
				if ($cc2==$cc7) {$errorDetect = "1"; }
				}
				}
				if ($errorDetect!="1") {
				mysql_query("INSERT INTO virtual (VirtualPath,FileID) VALUES ('$AddValue','$IDadd')");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ได้ Add File ID ".$IDadd."ไปที่ virtual drive Path ".$AddValue."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
				}
				}
?>
<html>
<head>
<title>DMS Project : Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/head3.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="client.php">
        <area shape="rect" coords="237,38,326,58" href="all%20files.php">
        <area shape="rect" coords="436,38,525,58" href="profile.php">
        <area shape="rect" coords="336,38,425,58" href="search.php">
        <area shape="rect" coords="537,38,626,58" href="../index.php?Log=1">
      </map>
      </td>
  </tr>
  <tr> 
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="3%">&nbsp;</td>
          <td width="97%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><p><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><img src="pictures/search.gif" width="300" height="26"></strong></font>
            <?php if ($Submit=="") {?>
			</p>
            <form name="form1" method="post" action="search.php">
              <table width="100%"  border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td width="27%" scope="col"><div align="right"></div></td>
                  <th width="73%" scope="col">&nbsp;</th>
                </tr>
                <tr>
                  <td scope="row"><div align="right"><font color="#000066" size="3"><img src="pictures/sname.gif" width="182" height="26"></font></div></td>
                  <td><input name="name" type="text" id="name" size="30"></td>
                </tr>
                <tr>
                  <td scope="row"><div align="right"><img src="pictures/smodifydate.gif" width="182" height="26"></div></td>
                  <td>D
                      <select name="d" id="d">
                        <option value="ALL">Day</option>
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
&nbsp;M&nbsp;
      <select name="m" id="m">
        <option value="ALL">Month</option>
        <option value="01">January</option>
        <option value="02">February</option>
        <option value="03">March</option>
        <option value="04">April</option>
        <option value="05">May</option>
        <option value="06">June</option>
        <option value="07">July</option>
        <option value="08">August</option>
        <option value="09">September</option>
        <option value="10">October</option>
        <option value="11">November</option>
        <option value="12">December</option>
      </select>
&nbsp;Y&nbsp;
      <select name="y" id="y">
        <option value="ALL">Year</option>
        <option value="1998">1998</option>
        <option value="1999">1999</option>
        <option value="2000">2000</option>
        <option value="2001">2001</option>
        <option value="2002">2002</option>
        <option value="2003">2003</option>
        <option value="2004">2004</option>
        <option value="2005">2005</option>
      </select>
                  </td>
                </tr>
                <tr>
                  <td scope="row"><div align="right"><img src="pictures/stype.gif" width="182" height="26"></div></td>
                  <td><select name="type" id="type">
                    <option value="ALL">ALL</option>
                    <option value="doc">เอกสารWord</option>
                    <option value="xls">เอกสารExcel</option>
                    <option value="pdf">เอกสารAcrobat</option>
                    <option value="txt">เอกสารText</option>
                    <option value="pic">เอกสารแสกน</option>
                                                      </select></td>
                </tr>
                <tr>
                  <td scope="row"><div align="right"><img src="pictures/sdetail.gif" width="182" height="26"></div></td>
                  <td><input name="detail" type="text" id="detail" size="50" maxlength="50"></td>
                </tr>
                <tr>
                  <td scope="row">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td scope="row">&nbsp;&nbsp;&nbsp;
                      <input type="submit" name="Submit" value="Search!">
                      <input type="reset" name="Submit2" value="Clear"></td>
                  <td>&nbsp;</td>
                </tr>
              </table>
            </form>
            <?php }elseif($Submit=="Search!") {
			?>
            <table width="100%" border="0" cellspacing="2" cellpadding="0">
              <tr>
                <td width="46" scope="col"><div align="center"><img src="pictures/no.gif" width="46" height="26"></div></td>
                <td scope="col"><font size="2"><img src="pictures/searchresult.gif" width="300" height="26">
				<?php if ($errorDetect=="1") {?><br><span class="style1"><font  color="#FF0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>ไม่สามารถ Add File เข้า Virtual Drive ได้ เนื่องจากคุณมีไฟล์ชื่อเดียวกันอยู่ในแฟ้มแล้วค่ะ</strong></font></span> 
				<?php $errorDetect="0"; } 
				?>
				</font></td>
              </tr>
			  <?php //search result
			  //if (($name!="")||($d!="")||($m!="")||($y!="")||($type!="")||()) {
			  /*$name = $name2; 
			  $d = $d2; 
			  $m = $m2;
			  $y = $y2;
			  $type = $type2;
			  $detail = $detail2;*/
			  if ($name=="") {$name = "%";}else{$name="%".$name."%";}//echo $name;
			  if ($d=="ALL") {$d = "%";}
			  if ($m=="ALL") {$m = "%";}
			  if ($y=="ALL") {$y = "%";} $day = $y."-".$m."-".$d."%"; //echo $day;
			  if ($type=="ALL") {$type = "%";}
			  if($type=="pic"){$type="%.jpg";}
			  if($type=="doc"){$type="%.doc";}
			  if($type=="pdf"){$type="%.pdf";}
			  if($type=="xls"){$type="%.xls";}
			  if($type=="txt"){$type="%.txt";}//echo $type;
			  if ($detail=="") {$detail = "%";}else{$detail="%".$detail."%";}//echo $detail;
			  $re1 = mysql_query("SELECT * FROM file WHERE FileName LIKE '$name' AND  FileName LIKE '$type' AND  Detail LIKE '$detail' AND LastModify LIKE '$day' ORDER BY FileName");
			  if (mysql_num_rows($re1)!=0) {//main if
			  while ($re2=mysql_fetch_array($re1)) { //while loop
			  $re4 = $re2["FileID"];
			  $ree = mysql_query("SELECT * FROM permission WHERE ID LIKE '$re4' AND GroupAllow LIKE '$usergroup'");
			  if ((mysql_num_rows($ree)!=0)){//&&((mysql_result($ree,0,"Permiss")=="RW")||(mysql_result($ree,0,"Permiss")=="RWS")) { //sub if
			  $ree3 = mysql_result($ree,0,"Permiss");
			  $re7 = $re2["FileStatus"];
			  $re5 = mysql_query("SELECT * FROM virtual WHERE FileID LIKE '$re4' AND VirtualPath LIKE 'ALL%'");
			  $re6 = @mysql_result($re5,0,"VirtualPath"); 
			  if ($re6=="") {$re6 ="Unuse Path"; }//echo $re6.$re7;
			  ?>
              <tr>
                <td width="46" valign="top" background="pictures/bgc.gif" scope="col"><div align="center"><font  color="#000099" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>
				<?php $ii=$ii+"1"; echo $ii;?></strong></font>
				</div></td>
                <td scope="col"><form name="form2" method="post" action="action3_1.php">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="pictures/bgc.gif" scope="col">&nbsp;&nbsp;<img src="pictures/name.gif" width="48" height="16">&nbsp;&nbsp;<font size="2" face="MS Sans Serif, Tahoma, sans-serif">
					  <?php echo $re2["FileName"];?></font><?php if(($re6!="Unuse Path")){?>&nbsp;&nbsp;<a href="action6_1.php<?php echo "?IDadd=".$re4."&name=".$name."&d=".$d."&m=".$m."&y=".$y."&type=".$type."&detail=".$detail; ?>" target="_top"><img src="pictures/addtovirtualdrive.gif" border="0"></a><?php }?>&nbsp;&nbsp;<a href="<?php if($re6!="Unuse Path"){echo "upload/".$re6; }else{echo "unuse/";}echo $re2["FileName"];?>" target="_blank"><img src="pictures/download.gif" width="81" height="16" border="0"></a>&nbsp;&nbsp;
					  <?php if (($re6!="Unuse Path")&&($re7=="Y")&&($ree3!="R")){ ?><a href="download.php?dw=upload/<?php echo $re6.$re2["FileName"]; ?>&cUse=<?php echo md5($user."upload/".$re6.$re2["FileName"]); ?>" target="_blank"><img src="pictures/downloadformodify.gif" width="145" height="16" border="0"></a><?php } ?>
					  <input name="Submit" type="hidden" id="Submit" value="Search!">
					  <input name="name" type="hidden" id="name" value="<?php echo $name; ?>">
					  <input name="d" type="hidden" id="d" value="<?php echo $d; ?>">
					  <input name="m" type="hidden" id="m" value="<?php echo $m; ?>">
					  <input name="y" type="hidden" id="y" value="<?php echo $y; ?>">
					  <input name="type" type="hidden" id="type" value="<?php echo $type; ?>">
					  <input name="detail" type="hidden" id="detail" value="<?php echo $detail; ?>">
					  <br>
                        <?php if (($re6!="Unuse Path")&&($re7!="Y")&&($ree3!="R")){ ?>
                        <font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;&nbsp;ขณะนี้ คุณ''<?php echo $re7; ?>'' กำลังเปลี่ยนแปลงไฟล์อยู่  คุณจึงไม่สามารถดาวโหลดเพื่อเปลี่ยนแปลงซ้อนได้</font><br><?php } ?>
						&nbsp;&nbsp;<img src="pictures/path.gif" width="48" height="16">&nbsp;&nbsp;<font size="2" face="MS Sans Serif, Tahoma, sans-serif"><?php echo $re6;?></font>
						<input name="hidden1" type="hidden" id="hidden1" value="<?php echo $re6; ?>">
						<input name="hidden2" type="hidden" id="hidden2" value="<?php echo $re4; ?>">
						<br>
                        &nbsp;&nbsp;<img src="pictures/detail.gif" width="50" height="16">&nbsp;&nbsp;<font size="2" face="MS Sans Serif, Tahoma, sans-serif"><?php echo $re2["Detail"];?><br>&nbsp;&nbsp;
                        <?php if (($re6!="Unuse Path")&&(($ree3=="RWS")||($ree3=="RW"))){ ?>
						<input name="move" type="submit" id="move" value="Move to">
                        <input name="delete" type="submit" id="delete" value="Delete">
						<?php } ?>
						<?php if (($re6!="Unuse Path")&&($ree3=="RWS")){ ?>
                        <input name="priority" type="submit" id="priority" value="Set Priority">
						<?php } ?>
                        </font></td>
                    </tr>
                  </table>
                </form></td>
              </tr>
			  <?php //end search result
			  }//end sub if
			  }//end while loop
			  }//end main if
			  ?>
            </table>
			<?php }
			?>
<p><br>
            </p></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
