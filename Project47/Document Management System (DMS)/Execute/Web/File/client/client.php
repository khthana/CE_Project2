<?php
session_start();
session_register("user");
session_register("pass");
$host="localhost";
$link=mysql_connect($host,$user);
$unusePath = "C:/AppServ/www/client/unuse/";
session_register("unusePath");
$uploadPath = "C:/AppServ/www/client/upload/";
session_register("uploadPath");

if(!$link) {
exit("ไม่สามารถเชื่อมต่อกับ server ได้ เนื่องจาก password หรือ username ของท่านไม่ถูกต้อง");
}

mysql_select_db("dms");
$mdpass = md5($pass.$user);
$password = mysql_query("SELECT  * FROM user WHERE Username='$user' AND Password='$mdpass'");
if ((mysql_num_rows($password)==0)||($user=="admin")) {exit("<a href=../><strong><font color=#FF0000 size=3>Username หรือ Password ของท่านไม่ถูกต้อง 
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
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
if ($endd!="1") {
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ล๊อคอินเข้าใช้ระบบ<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
$endd = "1"; session_register("endd");
}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
/*$CheckDWS = mysql_query("SELECT * FROM folderpermission WHERE FolderPath='$Folder'");
$DWerrorCheck = mysql_result($CheckDWS,0,"Permission");
$DWerror = "0";
if ($DWerrorCheck=="R") { $DWerror = "1"; }*/
//edit detail//////////////////////////////////////////////////////////////////////////////
if ($cEdit!="") {
mysql_query("UPDATE file SET file.Detail='$cEditText' WHERE file.FileID LIKE '$editt'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน detail ของไฟล์ ID : ".$editt." เป็น ".$cEditText."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
//end deit detail//////////////////////////////////////////////////////////////////////
//move and copy///////////////////////////////////////////////////////////////
if  ($cRadioMove!="") {
$SearchIDs = mysql_query("SELECT * FROM file WHERE FileID LIKE '$hidden4'");
$SearchID2 = @mysql_result($SearchIDs,0,"FileName");
$teststatus = mysql_query("SELECT * FROM virtual WHERE VirtualPath='$cRadioMove'");
if ((mysql_num_rows($teststatus))!=0) { 
while ($TestSta1 = mysql_fetch_array($teststatus)) {
$TestSta3 = $TestSta1["FileID"];
$TestSta2 = mysql_query("SELECT * FROM file WHERE FileID LIKE '$TestSta3'");
$TestSta4 = @mysql_result($TestSta2,0,"FileName");
if ($SearchID2==$TestSta4) { $error="1"; } //echo $SearchID2.$TestSta4;
} 
} 

if ($error!="1") {
if (($statuss=="Move to")&&($cButtonMove=="Move")) {
mysql_query("UPDATE virtual SET VirtualPath='$cRadioMove' WHERE  VirtualPath='$hidden3' AND FileID='$hidden4'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ย้าย virtual ไฟล์ ID ".$hidden4." จาก Path ".$hidden3." ไปเป็น Path ".$cRadioMove." <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
} else {if (($statuss=="Copy to")&&($cButtonCopy=="Copy")) { 
mysql_query("INSERT INTO virtual (VirtualPath,FileID) VALUES ('$cRadioMove','$hidden4')");
}}}//} else { $error = 1; }

}
//end move and copy///////////////////////////////////////////////////////////////
//delete///////////////////////////////////////////////////////////////////////////////////
if (($statuss=="Delete")&&($cButtonMove=="Sure")) { 
//echo $hidden3;
//echo $hidden4;
mysql_query ("DELETE FROM virtual WHERE VirtualPath='$hidden3' AND FileID='$hidden4'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ลบ virtual ไฟล์ ID ".$hidden4." ใน Path ".$hidden3." ไปอยู่ในโฟลเดอร์ unuse<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
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
//create  and delete virtual folder///////////////////////////////////////////////////////////////
if ($cVirtualSet!="") {  //main if
$stringSet = explode("/",$cVirtualSet);
$countstringSet = count($stringSet); //echo $countstringSet; echo $CreateText1; echo $cSubmit; echo $statuss;
if ($countstringSet<=3) { //if count over folw
if (($statuss=="Create Folder")&&($cSubmit!="Back")&&($CreateText1!="")) { //create if////////////////
$PathValue = $cVirtualSet.$CreateText1."/";
$TestEQs1 = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE '$PathValue'");
if(mysql_num_rows($TestEQs1)==0) {
mysql_query ("INSERT INTO virtual (VirtualPath,FileID) VALUES ('$PathValue','0')");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." Create Virtual Folder ".$PathValue."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
} else { $errorCreate = "1";}
}//end create if////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
} else {} //end if count over folw
//delete folder//////////////////////////////////////////////////////////////////////////////////////////////
if (($statuss=="Delete Folder")&&($cSubmit!=Back)) {
mysql_query("DELETE FROM virtual WHERE VirtualPath LIKE '$cVirtualSet'");
mysql_query("DELETE FROM virtual WHERE VirtualPath LIKE '$cVirtualSet%'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." Delete Virtual Folder ".$cVirtualSet."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG

}//end delete folder/////////////////////////////////////////////////////////////////////////////////////

}// end main if
//end create and delete folder//////////////////////////////////////////////////////////////////
$cRadioMove = "";
$statuss = "";
?>
<html>
<head>
<title>DMS Project : Virtual Folder</title>
<style type="text/css">
a:link {
    text-decoration: none;
    color: #0000FF;
}
a:visited {
    text-decoration: none;
    color: #0000FF;
}
a:hover {
    text-decoration: blink;
    color: #FF0000;
}
a:active {
    text-decoration: none;
    color: #0000FF;
}

a:visited:hover {
    text-decoration: blink;
    color: #FF0000;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/head.gif" width="778" height="69" border="0" usemap="#Map">    </td>
  </tr>
  <tr> 
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="3%">&nbsp;</td>
          <td width="97%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><img src="pictures/virtualdrive.gif" width="300" height="26"></strong></font><?php if ($errorCreate == "1") { ?>
            <br>
            <span class="style1"><font  color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>เกิดข้อผิดพลาด! คุณไม่สามารถสร้างแฟ้มชื่อเดียวกันในPathเดียวกันได้.</strong></font></span> 
				<?php $errorCreate = "0"; } ?>
		  <p><?php if ($error==1) { ?>
			  <font color="#FF0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><?php echo "ไม่สามารถกระทำได้เนื่องจากจุดหมายของคุณมีไฟล์เดียวกันอยู่แล้ว!"?></strong></font>
			  <?php $error=0; } ?>
            </p>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="10%"> 
                    <?php
					//path 1///////////////////////////////////////
				$SQLResult = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE '$user/%' ORDER BY VirtualPath");
				if ((mysql_num_rows($SQLResult))!==0)  {
				while ($ordersrow=mysql_fetch_array($SQLResult)) {
					$stringrow = $ordersrow["VirtualPath"]; //echo $stringrow;
					$string = explode("/",$stringrow);
					$countstring = count($string)-"1"; //echo $countstring;
					echo "<tr>";
					if ($countstring==1) { 
					?>
                <tr> 
                  <td colspan="4"><?php if ($Folder == $stringrow) { ?>
                    <a href="client.php<?php echo "?Folder="; echo $stringrow; ?>" target="_top"><img src="pictures/new3.gif" width="17" height="16" border="0"></a>                    <?php } else { ?>
                    <a href="client.php<?php echo "?Folder="; echo $stringrow; ?>" target="_top"><img src="pictures/new2.gif" width="17" height="16" border="0"></a>                    <?php } ?>
                    <a href="client.php<?php echo "?Folder="; echo $stringrow; ?>" target="_top"><img src="pictures/folder.gif" width="16" height="14" border="0"></a> <a href="client.php<?php echo "?Folder="; echo $stringrow; ?>">
				  <span class="style1"><font size="2"><?php echo $string[0]; ?></font></span></a></td>
                </tr>
				
<?php
				  //Detail of path 1///////////////////////////////////
				  if ($Folder == $stringrow) {
				  $IDSearch = mysql_query("SELECT DISTINCT FileID FROM virtual WHERE VirtualPath LIKE '$stringrow' ORDER BY FileID DESC");
				  if ((mysql_num_rows($IDSearch))!==0) {
				  while ($order=mysql_fetch_array($IDSearch)) { 
				  $orderID = $order["FileID"];
				  $Detail = mysql_query("SELECT FileName,Path,LastModify,PersonModify,Detail,FileStatus FROM  file WHERE  FileID LIKE 
				  '$orderID'"); 
				  ////////////////////////////
				  $PrioritySets = mysql_query("SELECT * FROM permission WHERE ID LIKE '$orderID' AND GroupAllow LIKE $usergroup");
				   $SetPermiss = @mysql_result($PrioritySets,0,"Permiss");
				 /* if ((mysql_num_rows($PrioritySets))!==0) {
				 while ($SetSQL = mysql_fetch_array($PrioritySets)) {
				  $SetPermiss = $SetSQL["Permiss"];
				  }}/////////////////////////
				  */
				  if (($orderID!=0)&&(($SetPermiss=="RW")||($SetPermiss=="R")||($SetPermiss=="RWS"))){
				  ?>
                <tr> 
                  <td colspan="4"><table width="96%"  border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                      <th scope="col"><form name="form1" method="post" action="action1.php">
                        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td background="pictures/bgc.gif" bgcolor="#FFFFFF" scope="col"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> </font> <font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                              <?php 
						while ($Details = mysql_fetch_array($Detail)) {
								echo "&nbsp;&nbsp;"; ?>
                              <img src="pictures/name.gif" width="48" height="16">
                              <?php
								echo $Details["FileName"]; ?>
                              <?php $CheckFileID = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$orderID'");
								$DownloadID = mysql_result($CheckFileID,0,"VirtualPath"); //echo $orderID; echo mysql_num_rows($CheckFileID);
								?>
                      &nbsp;&nbsp; <a href="upload/<?php echo $DownloadID.$Details["FileName"]; ?>" target="_blank"><img src="pictures/download.gif" width="81" height="16" border="0"></a>&nbsp;&nbsp;
                              <?php if($Details["FileStatus"]=='Y') {$Modifying = 0;}else { if (($SetPermiss=="RW")||($SetPermiss=="RWS")) {
								?>
                              <font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
                              <?php
								$Modifying = 1;
								echo "<br>&nbsp;&nbsp;ขณะนี้ คุณ''".$Details["FileStatus"]."'' กำลังเปลี่ยนแปลงไฟล์อยู่&nbsp;&nbsp;คุณจึงไม่สามารถดาวโหลดเพื่อเปลี่ยนแปลงซ้อนได้"; }
								?>
                              </font>
                              <?php
								}
							if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying==0)) {// $DWerror!="0"; 
							?>
                              <a href="download.php?dw=upload/<?php echo $DownloadID.$Details["FileName"]; ?>&cUse=<?php echo md5($user."upload/".$DownloadID.$Details["FileName"])."&an=".$Details["FileName"]; ?>&ID=<?php echo $orderID;?>" target="_blank"><img src="pictures/downloadformodify.gif" width="145" height="16" border="0"></a>
                              <?php } ?>
                              <?php
								echo "<br> &nbsp;&nbsp;";?>
                              <img src="pictures/lastmodify.gif" width="74" height="16">
							  <font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">								<?php
$regtime = $Details["LastModify"];
$year = substr ($regtime, 0,4);
$mont = substr ($regtime, 5,2);
$day = substr ($regtime, 8,2);
$hr = substr ($regtime, 11,2);
$min = substr ($regtime, 14,2);
$sec = substr ($regtime, 17,2);
echo "เวลา ".$hr.":".$min.":".$sec;
echo "    วันที่ ".$day."/".$mont."/".$year;
								//echo $Details["LastModify"];
								echo "&nbsp;&nbsp;ผู้เปลี่ยนแปลง : ";
								echo $Details["PersonModify"];
								echo "<br>&nbsp;&nbsp;";?>
                              <a href="<?php if (($SetPermiss=="RW")||($SetPermiss=="RWS")){?>detail2.php?editt=<?php echo $orderID;?>&Folder=<?php echo $stringrow; }else {echo "#";}?>"><img src="pictures/detail.gif" width="50" height="16" border="0"></a>&nbsp;&nbsp;<?php
								echo $Details["Detail"];
								//echo "<br>&nbsp;&nbsp;สถานะของไฟล์ : ";
								//echo $Details["FileStatus"];
								
								}
						 ?> </font>
                              <input name="hidden1" type="hidden" id="hidden1" value="<?php echo $stringrow;?>">
                              <input name="hidden2" type="hidden" id="hidden2" value="<?php echo $orderID;?>">
                              <br>
&nbsp;&nbsp;
        <input name="move" type="submit" id="move" value="Move to">
        <input name="copy" type="submit" id="copy" value="Copy to">
        <input name="delete" type="submit" id="delete" value="Delete from Virtual">
        <?php if (($SetPermiss=="RWS")) { ?>
        <input name="priority" type="submit" id="priority" value="Set Priority">
        <?php } ?>
        <input name="Folder" type="hidden" id="Folder" value="<?php if($Folder!="") {echo $Folder; }?>">
                            </font> </td>
                          </tr>
                        </table>
                      </form></th>
                    </tr>
                  </table>			    </td>
			    </tr>
				  <?php } 
				  } //end while loop
				  } // end if
				  } //end main if
				  /////////////////////////////////////////////
				//path 2/////////////////////////////////////
				$SQLResult2 = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE '$user/%' ORDER BY VirtualPath");
				if ((mysql_num_rows($SQLResult2))!==0)  {
				while ($ordersrow2=mysql_fetch_array($SQLResult2)) {
					$stringrow2 = $ordersrow2["VirtualPath"];
					$string2 = explode("/",$stringrow2);
					$countstring2 = count($string2)-"1";
					if ($countstring2==2) { ?>
                <tr> 
                  <td colspan="4">&nbsp;&nbsp;&nbsp;                    <?php if ($Folder == $stringrow2) { ?>
                    <a href="client.php<?php echo "?Folder="; echo $stringrow2; ?>" target="_top"><img src="pictures/new3.gif" width="17" height="16" border="0"></a>
                    <?php } else { ?>
                    <a href="client.php<?php echo "?Folder="; echo $stringrow2; ?>" target="_top"><img src="pictures/new2.gif" width="17" height="16" border="0"></a>
                    <?php } ?>                    <a href="client.php<?php echo "?Folder="; echo $stringrow2; ?>" target="_top"><img src="pictures/folder.gif" width="16" height="14" border="0"></a>  <a href="client.php<?php echo "?Folder="; echo $stringrow2; ?>">
				  <span class="style1"><font size="2"><?php echo $string2[1]; ?></font></span></a></td>
                </tr>									
					<?php
				  //Detail of path 2///////////////////////////////////
				  if ($Folder == $stringrow2) {
				  $IDSearch2 = mysql_query("SELECT DISTINCT FileID FROM virtual WHERE VirtualPath LIKE '$stringrow2' ORDER BY FileID DESC");
				  if ((mysql_num_rows($IDSearch2))!==0) {
				  while ($order2=mysql_fetch_array($IDSearch2)) { 
				  $orderID2 = $order2["FileID"];
				  $Detail2 = mysql_query("SELECT FileName,LastModify,PersonModify,Detail,FileStatus FROM  file WHERE  FileID LIKE 
				  '$orderID2'"); 
				  ////////////////////////////
				  $PrioritySets = mysql_query("SELECT * FROM permission WHERE ID LIKE '$orderID2' AND GroupAllow LIKE $usergroup");
				  $SetPermiss = @mysql_result($PrioritySets,0,"Permiss");
				 /* if ((mysql_num_rows($PrioritySets))!==0) {
				  while ($SetSQL = mysql_fetch_array($PrioritySets)) {
				  $SetPermiss = $SetSQL["Permiss"];
				  }}/////////////////////////
				  */
				  if (($orderID2!=0)&&(($SetPermiss=="RW")||($SetPermiss=="R")||($SetPermiss=="RWS"))){
				  ?>
                <tr> 
                  <td colspan="4"><table width="93%"  border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                      <th scope="col"><form name="form2" method="post" action="action1.php">
                        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td background="pictures/bgc.gif" bgcolor="#FFFFFF" scope="col"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> </font> <font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                              <?php 
						while ($Details2 = mysql_fetch_array($Detail2)) {
						
								echo "&nbsp;&nbsp;";?>
								<img src="pictures/name.gif" width="48" height="16">
								<?php
								echo $Details2["FileName"];?>
                              <?php $CheckFileID2 = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$orderID2'");
								$DownloadID2 = mysql_result($CheckFileID2,0,"VirtualPath"); //echo $orderID; echo mysql_num_rows($CheckFileID);
								?>
                      &nbsp;&nbsp; <a href="upload/<?php echo $DownloadID2.$Details2["FileName"]; ?>" target="_blank"><img src="pictures/download.gif" width="81" height="16" border="0"></a>&nbsp;&nbsp;
                              <?php if($Details2["FileStatus"]=='Y') {$Modifying2 = 0;}else { if (($SetPermiss=="RW")||($SetPermiss=="RWS")) {
								?>
                              <font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
                              <?php
								$Modifying2 = 1;
								echo "<br>&nbsp;&nbsp;ขณะนี้ คุณ''".$Details2["FileStatus"]."'' กำลังเปลี่ยนแปลงไฟล์อยู่&nbsp;&nbsp;คุณจึงไม่สามารถดาวโหลดเพื่อเปลี่ยนแปลงซ้อนได้"; }
								?>
                              </font>
                              <?php
								}
							if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying2==0)) { //$DWerror!="0"; 
							?>
                              <a href="download.php?dw=upload/<?php echo $DownloadID2.$Details2["FileName"]; ?>&cUse=<?php echo md5($user."upload/".$DownloadID2.$Details2["FileName"])."&an=".$Details2["FileName"]; ?>&ID=<?php echo $orderID2;?>" target="_blank"><img src="pictures/downloadformodify.gif" width="145" height="16" border="0"></a>
                              <?php } ?>
                              <?php
        				    
								echo "<br> &nbsp;&nbsp;";?>
                              <img src="pictures/lastmodify.gif" width="74" height="16">
							  <font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">								<?php
$regtime = $Details2["LastModify"];
$year = substr ($regtime, 0,4);
$mont = substr ($regtime, 5,2);
$day = substr ($regtime, 8,2);
$hr = substr ($regtime, 11,2);
$min = substr ($regtime, 14,2);
$sec = substr ($regtime, 17,2);
echo "เวลา ".$hr.":".$min.":".$sec;
echo "    วันที่ ".$day."/".$mont."/".$year;
								//echo $Details2["LastModify"];
								echo "&nbsp;&nbsp;ผู้เปลี่ยนแปลง : ";
								echo $Details2["PersonModify"];
								echo "<br>&nbsp;&nbsp;";?>
                              <a href="<?php if (($SetPermiss=="RW")||($SetPermiss=="RWS")){?>detail2.php?editt=<?php echo $orderID2;?>&Folder=<?php echo $stringrow2; }else {echo "#";}?>"><img src="pictures/detail.gif" width="50" height="16" border="0"></a>&nbsp;&nbsp;<?php
								echo $Details2["Detail"];
								//echo "<br>&nbsp;&nbsp;สถานะของไฟล์ : ";
								//echo $Details2["FileStatus"];
								
								}
						 ?></font>
                              <input name="hidden1" type="hidden" id="hidden1" value="<?php echo $stringrow2;?>">
                              <input name="hidden2" type="hidden" id="hidden2" value="<?php echo $orderID2;?>">
                              <br>
&nbsp;&nbsp;
        <input name="move" type="submit" id="move" value="Move to">
        <input name="copy" type="submit" id="copy" value="Copy to">
        <input name="delete" type="submit" id="delete" value="Delete from Virtual">
        <?php if (($SetPermiss=="RWS")) { ?>
        <input name="priority" type="submit" id="priority" value="Set Priority">
        <?php } ?>
        <input name="Folder" type="hidden" id="Folder" value="<?php if($Folder!="") {echo $Folder; }?>">
                            </font> </td>
                          </tr>
                        </table>
                      </form></th>
                    </tr>
                  </table></td>
			    </tr>
				  <?php } }//end while loop
				  } // end if
				  } //end main if
				  /////////////////////////////////////////////
					
				//path  3/////////////////////////////////////////
				$SQLResult3 = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE '$user/%' ORDER BY VirtualPath");
				if ((mysql_num_rows($SQLResult3))!==0)  {
				while ($ordersrow3=mysql_fetch_array($SQLResult3)) {
					$stringrow3 = $ordersrow3["VirtualPath"];
					$string3 = explode("/",$stringrow3);
					$countstring3 = count($string3)-"1";
					if (($countstring3==3)&&($string3[1]==$string2[1])) {  ?>
                <tr> 
                  <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    <?php if ($Folder == $stringrow3) { ?>
                    <a href="client.php<?php echo "?Folder="; echo $stringrow3; ?>" target="_top"><img src="pictures/new3.gif" width="17" height="16" border="0"></a>
                    <?php } else { ?>
                    <a href="client.php<?php echo "?Folder="; echo $stringrow3; ?>" target="_top"><img src="pictures/new2.gif" width="17" height="16" border="0"></a>
                    <?php } ?>                    <a href="client.php<?php echo "?Folder="; echo $stringrow3; ?>" target="_top"><img src="pictures/folder.gif" width="16" height="14" border="0"></a> <a href="client.php<?php echo "?Folder="; echo $stringrow3; ?>">
				  <span class="style1"><font size="2"><?php echo $string3[2]; ?></font></span></a></td>
                </tr>									
					<?php 
				  //Detail of path 3///////////////////////////////////
				  if ($Folder == $stringrow3) {
				  $IDSearch3 = mysql_query("SELECT DISTINCT FileID FROM virtual WHERE VirtualPath LIKE '$stringrow3' ORDER BY FileID DESC");
				  if ((mysql_num_rows($IDSearch3))!==0) {
				  while ($order3=mysql_fetch_array($IDSearch3)) { 
				  $orderID3 = $order3["FileID"];
				  $Detail3 = mysql_query("SELECT FileName,LastModify,PersonModify,Detail,FileStatus FROM  file WHERE  FileID LIKE 
				  '$orderID3'"); 
				  ////////////////////////////
				  $PrioritySets = mysql_query("SELECT * FROM permission WHERE ID LIKE '$orderID3' AND GroupAllow LIKE $usergroup");
				  $SetPermiss = @mysql_result($PrioritySets,0,"Permiss");
				  /*if ((mysql_num_rows($PrioritySets))!==0) {
				  while ($SetSQL = mysql_fetch_array($PrioritySets)) {
				  $SetPermiss = $SetSQL["Permiss"];
				  }}/////////////////////////
				  */
				  if (($orderID3!=0)&&(($SetPermiss=="RW")||($SetPermiss=="R")||($SetPermiss=="RWS"))){
				  ?>
                <tr> 
                  <td colspan="4"><table width="90%"  border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                      <th scope="col"><form name="form3" method="post" action="action1.php">
                        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td background="pictures/bgc.gif" bgcolor="#FFFFFF" scope="col"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> </font> <font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                              <?php 
						while ($Details3 = mysql_fetch_array($Detail3)) {
								echo "&nbsp;&nbsp;";?>
								<img src="pictures/name.gif" width="48" height="16">
								<?php
								echo $Details3["FileName"];?>
                              <?php $CheckFileID3 = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$orderID3'");
								$DownloadID3 = mysql_result($CheckFileID3,0,"VirtualPath"); //echo $orderID; echo mysql_num_rows($CheckFileID);
								?>
&nbsp;&nbsp; <a href="upload/<?php echo $DownloadID3.$Details3["FileName"]; ?>" target="_blank"><img src="pictures/download.gif" width="81" height="16" border="0"></a>&nbsp;&nbsp;
        <?php if($Details3["FileStatus"]=='Y') {$Modifying3 = 0;}else { if (($SetPermiss=="RW")||($SetPermiss=="RWS")) {
								?>
        <font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <?php
								$Modifying3 = 1;
								echo "<br>&nbsp;&nbsp;ขณะนี้ คุณ''".$Details3["FileStatus"]."'' กำลังเปลี่ยนแปลงไฟล์อยู่&nbsp;&nbsp;คุณจึงไม่สามารถดาวโหลดเพื่อเปลี่ยนแปลงซ้อนได้"; }
								?>
        </font>
        <?php
								}
							if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying3==0)) { //$DWerror!="0"; 
							?>
        <a href="download.php?dw=upload/<?php echo $DownloadID3.$Details3["FileName"]; ?>&cUse=<?php echo md5($user."upload/".$DownloadID3.$Details3["FileName"])."&an=".$Details3["FileName"]; ?>&ID=<?php echo $orderID3;?>" target="_blank"><img src="pictures/downloadformodify.gif" width="145" height="16" border="0"></a>
        <?php } ?>
        <?php
        				    
								echo "<br> &nbsp;&nbsp";?>
        <img src="pictures/lastmodify.gif" width="74" height="16">
		<font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;&nbsp;<?php
$regtime = $Details3["LastModify"];
$year = substr ($regtime, 0,4);
$mont = substr ($regtime, 5,2);
$day = substr ($regtime, 8,2);
$hr = substr ($regtime, 11,2);
$min = substr ($regtime, 14,2);
$sec = substr ($regtime, 17,2);
echo "เวลา ".$hr.":".$min.":".$sec;
echo "    วันที่ ".$day."/".$mont."/".$year;
								//echo $Details3["LastModify"];
								echo "&nbsp;&nbsp;ผู้เปลี่ยนแปลง : ";
								echo $Details3["PersonModify"];
								echo "<br>&nbsp;&nbsp;";?>
        <a href="<?php if (($SetPermiss=="RW")||($SetPermiss=="RWS")){?>detail2.php?editt=<?php echo $orderID3;?>&Folder=<?php echo $stringrow3; }else {echo "#";}?>"><img src="pictures/detail.gif" width="50" height="16" border="0"></a>        <?php
								echo $Details3["Detail"];
								//echo "<br>&nbsp;&nbsp;สถานะของไฟล์ : ";
								//echo $Details3["FileStatus"]; 
								
								}
						 ?></font>
        <input name="hidden1" type="hidden" id="hidden1" value="<?php echo $stringrow3;?>">
        <input name="hidden2" type="hidden" id="hidden2" value="<?php echo $orderID3;?>">
        <br>
&nbsp;&nbsp;
        <input name="move" type="submit" id="move" value="Move to">
        <input name="copy" type="submit" id="copy" value="Copy to">
        <input name="delete" type="submit" id="delete" value="Delete from Virtual">
        <?php if (($SetPermiss=="RWS")) { ?>
        <input name="priority" type="submit" id="priority" value="Set Priority">
        <?php } ?>
        <input name="Folder" type="hidden" id="Folder" value="<?php if($Folder!="") {echo $Folder; }?>">
                            </font> </td>
                          </tr>
                        </table>
                      </form></th>
                    </tr>
                  </table></td>
			    </tr>
				  <?php } } //end while loop
				  } // end if
				  } //end main if
				  /////////////////////////////////////////////
					}}} //end 3//////////////////////////////
					
					}}} ///end 2/////////////////////////
					
					} else {} //end 1////////////////////////////////
					
					echo "</tr>";
				}
				}
				?>
                <tr>
                  <td colspan="4">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="4"><form name="form4" method="post" action="action2.php">
                    <input name="cCreateFolder" type="submit" id="cCreateFolder" value="Create Folder">
                    <input name="cDeleteFolder" type="submit" id="cDeleteFolder" value="Delete Folder">
                    <font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                    <input name="Folder" type="hidden" id="Folder" value="<?php if($Folder!="") {echo $Folder; }?>">
                    </font>                  </form></td>
                </tr>
                <tr> 
                  <td colspan="4">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="4">&nbsp;</td>
                </tr>
              </table>
		  </td></tr>
    </table></td>
  </tr>
</table>
<map name="Map">
  <area shape="rect" coords="135,38,224,59" href="client.php">
  <area shape="rect" coords="237,38,326,58" href="all%20files.php">
  <area shape="rect" coords="435,37,524,57" href="profile.php">
  <area shape="rect" coords="337,37,426,57" href="search.php">
  <area shape="rect" coords="537,38,626,58" href="../index.php?Log=1">
</map>
</body>
</html>
