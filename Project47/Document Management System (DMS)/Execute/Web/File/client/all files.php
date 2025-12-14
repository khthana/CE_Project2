<?php
session_start();
session_register("user");
session_register("pass");
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
//Set Folder Priority//////////////////////////////////////////////////////////////
if ($cChange!="") {
mysql_query("DELETE FROM folderpermission WHERE FolderPath LIKE '$cSelect'"); //echo $cSelect;
for ($i=1;$i<=$group;$i++) { //echo $SetR[$k].$SetRW[$k].$SetRWS[$k];
if ($cSet[$i]=="SetR[$i]") {mysql_query("INSERT INTO folderpermission (FolderPath,GroupPermiss,Permission) VALUES ('$cSelect','$i','R')");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน Priority ของโฟลเดอร์ใน Path ".$cSelect." ของกรุ๊ป ".$i." เป็น R <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
if ($cSet[$i]=="SetRW[$i]") {mysql_query("INSERT INTO folderpermission (FolderPath,GroupPermiss,Permission) VALUES ('$cSelect','$i','RW')");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน Priority ของโฟลเดอร์ใน Path ".$cSelect." ของกรุ๊ป ".$i."  เป็น RW <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
if ($cSet[$i]=="SetRWS[$i]") {$a = mysql_query("INSERT INTO folderpermission (FolderPath,GroupPermiss,Permission) VALUES ('$cSelect','$i','RWS')"); 
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน Priority ของโฟลเดอร์ใน Path ".$cSelect." ของกรุ๊ป ".$i."  เป็น RWS <br>";  //echo $LogFile;
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
}
//end Set Folder Priority///////////////////////////////////////////////////////
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
if(!$deletesql) {echo "ไฟล์ของคุณมีขนาดใหญ่เกินไปค่ะ"; }  //echo $oldpath1.$newpath1;
if (@rename($oldpath1,$newpath1)) {} else { echo "ไม่สามารถย้ายไฟล์ได้เนื่องจากเกิดความผิดพลาด ระบบหาไฟล์ไม่พบ!"; }
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
}
//end delete////////////////////////////////////////////////////////////////////////////
//return file////////////////////////////////////////////////////////////////////////////////
if ($ReturnFile!="") {

$CheckRET1 = mysql_query("SELECT * FROM file WHERE FileID LIKE '$RadioReturn' AND FileStatus LIKE '$user'");
$CheckRET2 = mysql_result($CheckRET1,0,"FileName");
$CheckRET3 = mysql_result($CheckRET1,0,"Path");
$DetailRET = mysql_result($CheckRET1,0,"Detail");
$CheckRET4 = $CheckRET3."/".$CheckRET2;
if ($cReturn_name!=$CheckRET2) { $err_re = "1";
} else { 
$REname1 = $RadioReturn."_".$CheckRET2;
$REname2 = $unusePath.$REname1;
if (@rename($CheckRET4,$REname2)) {} else { } //

if (isset($cReturn)) {
	if(is_uploaded_file($cReturn)) {
	if (move_uploaded_file($cReturn,$CheckRET4)) {
	$date = date ("Y-m-d  H:i:s"); 
	mysql_query("UPDATE file SET file.FileName='$REname1',file.Path='$unusePath',file.FileStatus='UNUSE' WHERE file.FileID LIKE '$RadioReturn'");
	mysql_query("INSERT INTO file (file.FileID,file.FileName,file.Path,file.LastModify,file.PersonModify,file.Detail,file.Type,file.FileStatus) 
	VALUES ('','$CheckRET2','$CheckRET3','$date','$user','$DetailRET','file','Y')");
	$SFile1 = mysql_query("SELECT * FROM file WHERE file.FileName LIKE '$CheckRET2' AND file.Path LIKE '$CheckRET3'");
	$SFile2 = mysql_result($SFile1,0,"FileID");
	mysql_query("UPDATE virtual SET virtual.FileID='$SFile2' WHERE virtual.FileID LIKE '$RadioReturn'");
	
$FPermiss1 = mysql_query("SELECT * FROM permission WHERE permission.ID LIKE '$RadioReturn'");
if (mysql_num_rows($FPermiss1)!=0) {
while ($huhu=mysql_fetch_array($FPermiss1)) {
$FPermiss2 = $huhu["Permiss"];
$FPermiss3 = $huhu["GroupAllow"];
	mysql_query("INSERT INTO permission (ID,GroupAllow,Permiss) VALUES ('$SFile2','$FPermiss3','$FPermiss2')");
}}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
	$hahaha = mysql_result($SFile1,0,"FileID");
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." คืนไฟล์ ID ".$hahaha." ชื่อ ".$CheckRET2." คืนมาในระบบ<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
		//print "Return File success";
		}else {
			print "Return File FAIL!"; }
	}//end is_uploaded
	}// end isset
} // end else
} // end if
//end return file/////////////////////////////////////////////////////////////////////////
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
$checksPath = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE '$PathValue'");
if ((mysql_num_rows($checksPath))==0) {
mysql_query ("INSERT INTO virtual (VirtualPath,FileID) VALUES ('$PathValue','0')");
mysql_query ("INSERT INTO folderpermission (FolderPath,GroupPermiss,Permission) VALUES ('$PathValue','$usergroup','RWS')");
$CreateDir =  $uploadPath.$cVirtualSet.$CreateText1;
if (@mkdir($CreateDir)) {}else {echo "Can not create ".$CreateDir;}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." Create Folder ".$PathValue."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
} else { $errorPath = "1"; }
}//end create if////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
} else {} //end if count over folw
//delete folder//////////////////////////////////////////////////////////////////////////////////////////////
if (($statuss=="Delete Folder")&&($cSubmit!=Back)) {
$DeleteF = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE '$cVirtualSet%'"); //echo $cVirtualSet;
if ((mysql_num_rows($DeleteF))!==0) {
while ($DeleteF2 = mysql_fetch_array($DeleteF)) {
$DeletePath = $DeleteF2["VirtualPath"];
$DeleteID = $DeleteF2["FileID"];  //echo $DeleteID;

$DeletePoint  = mysql_query("SELECT * FROM file WHERE file.FileID LIKE '$DeleteID'"); //echo $DeletePoint;
if ($DeleteID!="0") {
$oldname = mysql_result($DeletePoint,0,"FileName");
$fileorder = $DeleteID;
$newname = $fileorder."_".$oldname;
$oldpath = mysql_result($DeletePoint,0,"Path"); //echo $oldpath;
$newpath = $unusePath;
$oldpath1 = $oldpath."/".$oldname; //echo "OldPath1 = ".$oldpath1;
$newpath1 = $newpath.$newname; //echo "NewPath1 = ".$newpath1;
$deletesql = mysql_query("UPDATE file SET file.FileName='$newname',file.Path='$newpath',file.FileStatus='UNUSE' WHERE FileID='$DeleteID'");
if(!$deletesql) {echo "update fail!!"; }
if (@rename($oldpath1,$newpath1)) { }//echo "Rename ID : ".$DeleteID;} //else { echo "ไม่สามารถย้ายไฟล์ได้เนื่องจากเกิดความผิดพลาด ระบบหาไฟล์ไม่พบ!"; echo "Pathเก่า : ".$oldpath1."Pathใหม่ : ".$newpath1;}
//if (@rmdir($oldpath)) { }//else { echo "ไม่สามารถลบโฟลเดอร์ได้ เนื่องจากเกิดความผิดพลาดในระบบ กรุณาแจ้งผู้ดูแลระบบด้วยค่ะ."; echo "Pathที่Delete : ".$oldpath;}
//echo  $oldpath;
} 

if ($DeleteID=="0") { 
$oldpath = $DeletePath;//echo $oldpath;
$oldpath = $uploadPath.$oldpath;
$oldpath1 = substr($oldpath,0,strrpos($oldpath,"/"));
$oldpath = $oldpath1; //echo $oldpath;

//if (@rmdir($oldpath)) { }
}

mysql_query("DELETE FROM virtual WHERE VirtualPath LIKE '$DeletePath' AND FileID LIKE '$DeleteID'");
mysql_query("DELETE FROM folderpermission WHERE FolderPath LIKE '$DeletePath'"); //echo $DeletePath;
//$a = $oldpath."/Thumbs.db";
//$b = $unusePath."Thumbs.db";
//if (@rename($a,$b)) { echo "successsss";} // echo "from".$oldpath."/Thumbs.db to ".$unusePath."Thumbs.db";
if (@rmdir($oldpath)) { }//echo "ได้แว้ว";}//else { echo "ไม่สามารถลบโฟลเดอร์ได้ เนื่องจากเกิดความผิดพลาดในระบบ กรุณาแจ้งผู้ดูแลระบบด้วยค่ะ."; echo "Pathที่Delete : ".$oldpath." DeleteID = ".$DeleteID;}
//mysql_query("DELETE FROM virual WHERE FileID LIKE '$DeleteID'");
//echo $newfile;
//}//end mysql_num_rows
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." Delete Folder ".$DeletePath."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}//end while loop
//if (@rmdir($oldpath)) { echo "ได้แว้ว";}//else { echo "ไม่สามารถลบโฟลเดอร์ได้ เนื่องจากเกิดความผิดพลาดในระบบ กรุณาแจ้งผู้ดูแลระบบด้วยค่ะ."; echo "Pathที่Delete : ".$oldpath." DeleteID = ".$DeleteID;}
} //end mysql_num_rows
}//end delete folder/////////////////////////////////////////////////////////////////////////////////////

}// end main if
//end create and delete folder//////////////////////////////////////////////////////////////////
$cRadioMove = "";
$statuss = "";
?>
<html>
<head>
<title>DMS Project : All Files</title>
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
    <td><img src="pictures/head2.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="client.php">
        <area shape="rect" coords="237,38,326,58" href="all%20files.php">
        <area shape="rect" coords="434,38,523,58" href="profile.php">
        <area shape="rect" coords="337,37,426,57" href="search.php">
        <area shape="rect" coords="538,38,627,58" href="../index.php?Log=1">
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
          <td><p><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><img src="pictures/allfiles.gif" width="288" height="27">
              <?php if ($errorPath=="1") {?><br><font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
			  เกิดข้อผิดพลาด! คุณไม่สามารถสร้างแฟ้มชื่อเดียวกันในPathเดียวกันได้.</font><?php }?></strong></font>
			  <?php if ($ErrorMove == "1") { ?>
				<br><span class="style1"><font  color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>ไม่สามารถย้ายไฟล์ได้ เนื่องจากคุณมีไฟล์ชื่อเดียวกันอยู่ในแฟ้มแล้วค่ะ</strong></font></span> 
				<?php $ErrorMove = "0"; } ?>
			  <?php if ($err_re == "1") { ?>
				<br><span class="style1"><font  color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>ไม่สามารถส่งคืนไฟล์ได้เนื่องจากชื่อไฟล์ไม่ตรงกับของเดิมค่ะ</strong></font></span> 
				<?php $err_re = "0"; } ?>
			  <br>
              <br>
            </p>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="10%"><?php
					//path 1///////////////////////////////////////
				$SQLResult = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE 'ALL/%' ORDER BY VirtualPath");
				if ((mysql_num_rows($SQLResult))!==0)  {
				while ($ordersrow=mysql_fetch_array($SQLResult)) {
					$stringrow = $ordersrow["VirtualPath"]; //echo $stringrow; echo $group;
					$string = explode("/",$stringrow);
					$countstring = count($string)-"1"; //echo $countstring;
					echo "<tr>";
					if ($countstring==1) { 
					$permissionfolders = mysql_query("SELECT * FROM folderpermission WHERE FolderPath LIKE '$stringrow' AND GroupPermiss LIKE '$usergroup'");
					if ((mysql_num_rows($permissionfolders))==1) {// check folder permission
					?>
                    <tr>
                                    <td colspan="4"><?php if ($Folder == $stringrow) { ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow; ?>" target="_top"><img src="pictures/new3.gif" width="17" height="16" border="0"></a>
                                      <?php } else { ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow; ?>" target="_top"><img src="pictures/new2.gif" width="17" height="16" border="0"></a>
                                      <?php } ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow; ?>" target="_top"><img src="pictures/folder.gif" width="16" height="14" border="0"></a> <a href="all files.php<?php echo "?Folder="; echo $stringrow; ?>"> <span class="style1"><font size="2"><?php echo $string[0]; ?></font></span></a>
									  <?php 
									  $TestPrio = mysql_query("SELECT * FROM folderpermission WHERE  FolderPath LIKE '$stringrow' AND GroupPermiss LIKE '$usergroup' AND Permission LIKE 'RWS'");
									  if (mysql_num_rows($TestPrio)!=0) { ?><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><a href="action7.php?cPriorityFolder=Set Folder Priority&Folder=<?php if($Folder!="") {echo $Folder; }?>&cSelect=<?php echo $stringrow;?>"><img src="pictures/p.gif" width="19" height="16" border="0"></a></font>
									  <?php }
									  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
									  ?></td>
                    </tr>
                                  <?php
				  //Detail of path 1///////////////////////////////////
				  if ($Folder == $stringrow) {
				  $IDSearch = mysql_query("SELECT DISTINCT FileID FROM virtual WHERE VirtualPath LIKE '$stringrow' ORDER BY FileID DESC");
				  if ((mysql_num_rows($IDSearch))!==0) {
				  while ($order=mysql_fetch_array($IDSearch)) { 
				  $orderID = $order["FileID"];
				  $Detail = mysql_query("SELECT FileName,LastModify,PersonModify,Detail,FileStatus FROM  file WHERE  FileID LIKE 
				  '$orderID'"); 
				  ////////////////////////////
				  $PrioritySets = mysql_query("SELECT * FROM permission WHERE ID LIKE '$orderID' AND GroupAllow LIKE $usergroup");
				   $SetPermiss = @mysql_result($PrioritySets,0,"Permiss");
				  if (($orderID!=0)&&(($SetPermiss=="RW")||($SetPermiss=="R")||($SetPermiss=="RWS"))){
				  ?>
                                  <tr>
                                    <td colspan="4"><table width="96%"  border="0" align="right" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <th scope="col"><form name="form1" method="post" action="action3.php">
                                          <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                              <td background="pictures/bgc.gif" bgcolor="#FFFFFF" scope="col"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                                                <?php 
						while ($Details = mysql_fetch_array($Detail)) {
								echo "&nbsp;&nbsp;";?><img src="pictures/name.gif">
								<?php
								echo $Details["FileName"];  ?>
&nbsp; &nbsp; &nbsp; &nbsp;<a href="action6.php<?php echo "?IDadd="; echo $orderID."&Folder=".$Folder; ?>" target="_top"><img src="pictures/addtovirtualdrive.gif" width="140" height="16" border="0"></a><?php $CheckFileID = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$orderID'");
								$DownloadID = mysql_result($CheckFileID,0,"VirtualPath"); //echo $orderID; echo mysql_num_rows($CheckFileID);
								?>
&nbsp;&nbsp;<a href="upload/<?php echo $DownloadID.$Details["FileName"]; ?>" target="_blank"><img src="pictures/download.gif" width="81" height="16" border="0"></a>&nbsp;&nbsp;
        <?php if($Details["FileStatus"]=='Y') {$Modifying = 0;}else { if (($SetPermiss=="RW")||($SetPermiss=="RWS")) {?>
        <font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <?php
								$Modifying = 1;
								echo "<br>&nbsp;&nbsp;ขณะนี้ คุณ''".$Details["FileStatus"]."'' กำลังเปลี่ยนแปลงไฟล์อยู่&nbsp;&nbsp;คุณจึงไม่สามารถดาวโหลดเพื่อเปลี่ยนแปลงซ้อนได้";?></font><?php }
								}
							if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying==0)) {  //$DWerror!="0"; 
							?>
       <a href="download.php?dw=upload/<?php echo $DownloadID.$Details["FileName"]; ?>&cUse=<?php echo md5($user."upload/".$DownloadID.$Details["FileName"])."&an=".$Details["FileName"]; ?>&ID=<?php echo $orderID;?>" target="_blank"><img src="pictures/downloadformodify.gif" width="145" height="16" border="0"></a>
        <?php } ?><br>&nbsp;&nbsp;<img src="pictures/lastmodify.gif">
								<font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
								<?php
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
								echo "<br>&nbsp;&nbsp;";?><a href="<?php if (($SetPermiss=="RW")||($SetPermiss=="RWS")){?>detail.php?editt=<?php echo $orderID;?>&Folder=<?php echo $stringrow; }else {echo "#";}?>"><img src="pictures/detail.gif" width="50" height="16" border="0"></a>&nbsp;&nbsp;<?php
								echo $Details["Detail"];
								//echo "<br>&nbsp;&nbsp;สถานะของไฟล์ : ";
								//echo $Details["FileStatus"];
								?></font><?php
								}
						 ?>
        <input name="hidden1" type="hidden" id="hidden1" value="<?php echo $stringrow;?>">
        <input name="hidden2" type="hidden" id="hidden2" value="<?php echo $orderID;?>">
        <br>
&nbsp;&nbsp;
        
        <?php if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying==0)) { ?>
		<input name="move" type="submit" id="move" value="Move to">
        <input name="delete" type="submit" id="delete" value="Delete">
        <?php } ?>
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
                                  <?php } 
				  } //end while loop
				  } // end if
				  } //end main if
				  /////////////////////////////////////////////
				//path 2/////////////////////////////////////
				$SQLResult2 = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE 'ALL/%' ORDER BY VirtualPath");
				if ((mysql_num_rows($SQLResult2))!==0)  {
				while ($ordersrow2=mysql_fetch_array($SQLResult2)) {
					$stringrow2 = $ordersrow2["VirtualPath"];
					$string2 = explode("/",$stringrow2);
					$countstring2 = count($string2)-"1";
					if ($countstring2==2) { 
					$permissionfolders2 = mysql_query("SELECT * FROM folderpermission WHERE FolderPath LIKE '$stringrow2' AND GroupPermiss LIKE '$usergroup'");
					if ((mysql_num_rows($permissionfolders2))==1) {// check folder permission
					?>
                                  <tr>
                                    <td colspan="4">&nbsp;&nbsp;&nbsp;
                                      <?php if ($Folder == $stringrow2) { ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow2; ?>" target="_top"><img src="pictures/new3.gif" width="17" height="16" border="0"></a>
                                      <?php } else { ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow2; ?>" target="_top"><img src="pictures/new2.gif" width="17" height="16" border="0"></a>
                                      <?php } ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow2; ?>" target="_top"><img src="pictures/folder.gif" width="16" height="14" border="0"></a> <a href="all files.php<?php echo "?Folder="; echo $stringrow2; ?>"> <span class="style1"><font size="2"><?php echo $string2[1]; ?></font></span></a>
									  <?php 
									  $TestPrio = mysql_query("SELECT * FROM folderpermission WHERE  FolderPath LIKE '$stringrow2' AND GroupPermiss LIKE '$usergroup' AND Permission LIKE 'RWS'");
									  if (mysql_num_rows($TestPrio)!=0) { ?><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><a href="action7.php?cPriorityFolder=Set Folder Priority&Folder=<?php if($Folder!="") {echo $Folder; }?>&cSelect=<?php echo $stringrow2;?>"><img src="pictures/p.gif" width="19" height="16" border="0"></a></font>
									  <?php }
									  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
									  ?></td>
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
				  if (($orderID2!=0)&&(($SetPermiss=="RW")||($SetPermiss=="R")||($SetPermiss=="RWS"))){
				  ?>
                                  <tr>
                                    <td colspan="4"><table width="93%"  border="0" align="right" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <th scope="col"><form name="form2" method="post" action="action3.php">
                                          <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                              <td background="pictures/bgc.gif" bgcolor="#FFFFFF" scope="col"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                                                <?php 
						while ($Details2 = mysql_fetch_array($Detail2)) {
								echo "&nbsp;&nbsp;";?><img src="pictures/name.gif">
								<?php
								echo $Details2["FileName"];  ?>
&nbsp; &nbsp; &nbsp; &nbsp;<a href="action6.php<?php echo "?IDadd="; echo $orderID2."&Folder=".$Folder;  ?>" target="_top"><img src="pictures/addtovirtualdrive.gif" width="140" height="16" border="0"></a><?php $CheckFileID2 = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$orderID2'");
								$DownloadID2 = mysql_result($CheckFileID2,0,"VirtualPath"); //echo $orderID; echo mysql_num_rows($CheckFileID);
								?>
&nbsp;&nbsp; <a href="upload/<?php echo $DownloadID2.$Details2["FileName"]; ?>" target="_blank"><img src="pictures/download.gif" width="81" height="16" border="0"></a>&nbsp;&nbsp;
        <?php if($Details2["FileStatus"]=='Y') {$Modifying2 = 0;}else { if (($SetPermiss=="RW")||($SetPermiss=="RWS")) {
								?>
        <font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <?php
								$Modifying2 = 1;
								echo "<br>&nbsp;&nbsp;ขณะนี้ คุณ''".$Details2["FileStatus"]."'' กำลังเปลี่ยนแปลงไฟล์อยู่&nbsp;&nbsp;คุณจึงไม่สามารถดาวโหลดเพื่อเปลี่ยนแปลงซ้อนได้";?></font><?php }
								}
							if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying2==0)) {  //$DWerror!="0"; 
							?>
        <a href="download.php?dw=upload/<?php echo $DownloadID2.$Details2["FileName"]; ?>&cUse=<?php echo md5($user."upload/".$DownloadID2.$Details2["FileName"])."&an=".$Details2["FileName"]; ?>&ID=<?php echo $orderID2;?>" target="_blank"><img src="pictures/downloadformodify.gif" width="145" height="16" border="0"></a>
        <?php } ?><br>&nbsp;&nbsp;<img src="pictures/lastmodify.gif">
								<font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
								<?php
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
								echo "<br>&nbsp;&nbsp;";?><a href="<?php if (($SetPermiss=="RW")||($SetPermiss=="RWS")){?>detail.php?editt=<?php echo $orderID2;?>&Folder=<?php echo $stringrow2; }else {echo "#";}?>"><img src="pictures/detail.gif" border="0"></a>&nbsp;&nbsp;
								<?php
								echo $Details2["Detail"];
								//echo "<br>&nbsp;&nbsp;สถานะของไฟล์ : ";
								//echo $Details2["FileStatus"];
								?></font><?php
								}
						 ?>
        <input name="hidden1" type="hidden" id="hidden1" value="<?php echo $stringrow2;?>">
        <input name="hidden2" type="hidden" id="hidden2" value="<?php echo $orderID2;?>">
        <br>
&nbsp;&nbsp;
        
        <?php if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying2==0)) { ?>
		<input name="move" type="submit" id="move" value="Move to">
        <input name="delete" type="submit" id="delete" value="Delete">
        <?php } ?>
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
				$SQLResult3 = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE 'ALL/%' ORDER BY VirtualPath");
				if ((mysql_num_rows($SQLResult3))!==0)  {
				while ($ordersrow3=mysql_fetch_array($SQLResult3)) {
					$stringrow3 = $ordersrow3["VirtualPath"];
					$string3 = explode("/",$stringrow3);
					$countstring3 = count($string3)-"1";
					if (($countstring3==3)&&($string3[1]==$string2[1])) {  
					$permissionfolders3 = mysql_query("SELECT * FROM folderpermission WHERE FolderPath LIKE '$stringrow3' AND GroupPermiss LIKE '$usergroup'");
					if ((mysql_num_rows($permissionfolders3))==1) {// check folder permission
					?>
                                  <tr>
                                    <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <?php if ($Folder == $stringrow3) { ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow3; ?>" target="_top"><img src="pictures/new3.gif" width="17" height="16" border="0"></a>
                                      <?php } else { ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow3; ?>" target="_top"><img src="pictures/new2.gif" width="17" height="16" border="0"></a>
                                      <?php } ?>
                                      <a href="all files.php<?php echo "?Folder="; echo $stringrow3; ?>" target="_top"><img src="pictures/folder.gif" width="16" height="14" border="0"></a> <a href="all files.php<?php echo "?Folder="; echo $stringrow3; ?>"> <span class="style1"><font size="2"><?php echo $string3[2]; ?></font></span></a>
									  <?php 
									  $TestPrio = mysql_query("SELECT * FROM folderpermission WHERE  FolderPath LIKE '$stringrow3' AND GroupPermiss LIKE '$usergroup' AND Permission LIKE 'RWS'");
									  if (mysql_num_rows($TestPrio)!=0) { ?><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><a href="action7.php?cPriorityFolder=Set Folder Priority&Folder=<?php if($Folder!="") {echo $Folder; }?>&cSelect=<?php echo $stringrow3;?>"><img src="pictures/p.gif" width="19" height="16" border="0"></a></font>
									  <?php }
									  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
									  ?> </td>
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
				  if (($orderID3!=0)&&(($SetPermiss=="RW")||($SetPermiss=="R")||($SetPermiss=="RWS"))){
				  ?>
                                  <tr>
                                    <td colspan="4"><table width="90%"  border="0" align="right" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <th scope="col"><form name="form3" method="post" action="action3.php">
                                          <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                              <td background="pictures/bgc.gif" bgcolor="#FFFFFF" scope="col"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                                                <?php 
						while ($Details3 = mysql_fetch_array($Detail3)) {
								echo "&nbsp;&nbsp;"; ?><img src="pictures/name.gif">
								<?php
								echo $Details3["FileName"];  ?>
&nbsp; &nbsp; &nbsp; &nbsp;<a href="action6.php<?php echo "?IDadd="; echo $orderID3."&Folder=".$Folder; ?>" target="_top"><img src="pictures/addtovirtualdrive.gif" width="140" height="16" border="0"></a><?php $CheckFileID3 = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$orderID3'");
								$DownloadID3 = mysql_result($CheckFileID3,0,"VirtualPath"); 
								?>
&nbsp;&nbsp; <a href="upload/<?php echo $DownloadID3.$Details3["FileName"]; ?>" target="_blank"><img src="pictures/download.gif" width="81" height="16" border="0"></a>&nbsp;&nbsp;
        <?php if($Details3["FileStatus"]=='Y') {$Modifying3 = 0;}else { if (($SetPermiss=="RW")||($SetPermiss=="RWS")) {
								?>
        <font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
        <?php
								$Modifying3 = 1;
								echo "<br>&nbsp;&nbsp;ขณะนี้ คุณ''".$Details3["FileStatus"]."'' กำลังเปลี่ยนแปลงไฟล์อยู่&nbsp;&nbsp;คุณจึงไม่สามารถดาวโหลดเพื่อเปลี่ยนแปลงซ้อนได้"; ?></font><?php }
								}
							if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying3==0)) {  //$DWerror!="0"; 
							?>
        <a href="download.php?dw=upload/<?php echo $DownloadID3.$Details3["FileName"]; ?>&cUse=<?php echo md5($user."upload/".$DownloadID3.$Details3["FileName"])."&an=".$Details3["FileName"]; ?>&ID=<?php echo $orderID3;?>" target="_blank"><img src="pictures/downloadformodify.gif" width="145" height="16" border="0"></a>
        <?php } ?><br>&nbsp;&nbsp;<img src="pictures/lastmodify.gif">
								<font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">
								<?php
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
								echo "<br>&nbsp;&nbsp;";?><a href="<?php if (($SetPermiss=="RW")||($SetPermiss=="RWS")){?>detail.php?editt=<?php echo $orderID3;?>&Folder=<?php echo $stringrow3; }else {echo "#";}?>"><img src="pictures/detail.gif" border="0"></a>&nbsp;&nbsp;
								<?php
								echo $Details3["Detail"];
								//echo "<br>&nbsp;&nbsp;สถานะของไฟล์ : ";
								//echo $Details3["FileStatus"]; 
								?></font><?php
								}
						 ?>
        <input name="hidden1" type="hidden" id="hidden1" value="<?php echo $stringrow3;?>">
        <input name="hidden2" type="hidden" id="hidden2" value="<?php echo $orderID3;?>">
        <br>
&nbsp;&nbsp;
        
        <?php if ((($SetPermiss=="RW")||($SetPermiss=="RWS"))&&($Modifying3==0)) { ?>
		<input name="move" type="submit" id="move" value="Move to">
        <input name="delete" type="submit" id="delete" value="Delete">
        <?php } ?>
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
					} else {if ((mysql_num_rows($permissionfolders3))>1) {echo "DataBase ERROR!! กรุณาแจ้ง Admin เพื่อทำการตรวจสอบ"; }}
					}}} //end 3//////////////////////////////
					
					} else {if ((mysql_num_rows($permissionfolders2))>1) {echo "DataBase ERROR!! กรุณาแจ้ง Admin เพื่อทำการตรวจสอบ"; }}
					}}} ///end 2/////////////////////////
					
					} else {if ((mysql_num_rows($permissionfolders))>1) {echo "DataBase ERROR!! กรุณาแจ้ง Admin เพื่อทำการตรวจสอบ"; }}
					}else {} //end 1////////////////////////////////
					echo "</tr>";
				}}
				?>
                                  <tr>
                                    <td colspan="4">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="4"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
                                      <tr>
                                        <th width="252" scope="col"><div align="left">
                                          <form name="form4" method="post" action="action4.php">
                                            <input name="cCreateFolder" type="submit" id="cCreateFolder" value="Create Folder">
                                            <input name="cDeleteFolder" type="submit" id="cDeleteFolder" value="Delete Folder">
                                            <input name="Folder" type="hidden" id="Folder" value="<?php if($Folder!="") {echo $Folder; }?>">
                                          </form>
                                        </div></th>
                                        <th scope="col"><div align="left">
                                          <form name="form5" method="post" action="action5.php">
                                            <input name="cAddFile" type="submit" id="cAddFile" value="Insert File">
                                            <input name="Folder" type="hidden" id="Folder" value="<?php if($Folder!="") {echo $Folder; }?>">                                          
                                                                                    </form>
                                        </div></th>
                                      </tr>
                                    </table></td>
                                  </tr>
                                  <tr>
                                    <td colspan="4"></td>
                                  </tr>
                                  <tr>
                                    <td colspan="4">&nbsp;</td>
                                  </tr>
                </table></td>
              </tr>
              <tr> 
                <td colspan="4">&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="4"> 
				<?php if (($IDadd!="Back")&&($IDadd!="")) {
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
                  <?php if(($cAddFile != "Back" )&&($cAddFile != "" )) {
				  $cPath = $uploadPath.$AddValue;
				  $cPath2 = substr($cPath,0,strrpos($cPath,"/"));
				  $cPath = $cPath2;
				  
				if (isset($cUploadFile)){
					if(is_uploaded_file($cUploadFile)){
					$addfileid3 = mysql_query("SELECT * FROM file WHERE FileName LIKE '$cUploadFile_name' AND Path LIKE '$cPath'");
					if ((mysql_num_rows($addfileid3))==0) { 
						if(move_uploaded_file($cUploadFile,"$cPath/$cUploadFile_name")){ 
							print "Uploaded File ";?>
                  <font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><?php print "$cUploadFile_name"; ?></strong></font> 
                  <?php print " success.\n";
				  			$FileType = filetype($cPath."/".$cUploadFile_name);
							$date = date ("Y-m-d  H:i:s"); 
							mysql_query("INSERT INTO `file` ( `FileID` , `FileName` , `Path` , `LastModify` , `PersonModify` , `Detail` , `Type` , `FileStatus`) 
							VALUES ('', '$cUploadFile_name', '$cPath', '$date', '$user', '$cDetailFile', '$FileType', 'Y')");
							$addfileid1 = mysql_query("SELECT * FROM file WHERE FileName LIKE '$cUploadFile_name' AND Path LIKE '$cPath'");
							$addfileid = mysql_result($addfileid1,0,"FileID");
							mysql_query("INSERT INTO virtual (VirtualPath,FileID) VALUES ('$AddValue','$addfileid')"); 
							mysql_query("INSERT INTO Permission (ID,GroupAllow,Permiss) VALUES ('$addfileid','$usergroup','RWS')");

							for($i=1;$i<=$group;$i++) {
							if ($i!=$usergroup) {
							$TestPaths = mysql_query("SELECT * FROM  folderpermission WHERE FolderPath LIKE '$AddValue' AND GroupPermiss LIKE '$i'");
							if ((mysql_num_rows($TestPaths))!=0) {
							$TestPath2 = mysql_result($TestPaths,0,"Permission"); //echo $TestPath2;
							mysql_query("INSERT INTO Permission (ID,GroupAllow,Permiss) VALUES ('$addfileid','$i','$TestPath2')");
							} //else
							//{mysql_query("INSERT INTI Permission");
							//}
							}
							}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ได้ Insert File ".$cUploadFile_name."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
				  /////////////////add permission
				  /////////////////////////////////////////
						} else {
							print "Uploaded File ";?> <font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><?php print "$cUploadFile_name"; ?></strong></font> 
                  <?php print " failed.\n";}
				  } else {?> <span class="style1"><font  color="#FF0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>ไม่สามารถ Upload File ได้ เนื่องจากคุณมีไฟล์ชื่อเดียวกันอยู่ในแฟ้มแล้วค่ะ</strong></font></span>                  <?php }
					}  else {
							print "Uploaded File ";?> <font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><?php print "$cUploadFile_name"; ?></strong></font> 
                  <?php print " failed.\n";}
				}
				}?> 
				<?php if ($errorDetect=="1") {?><span class="style1"><font  color="#FF0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>ไม่สามารถ Add File เข้า Virtual Drive ได้ เนื่องจากคุณมีไฟล์ชื่อเดียวกันอยู่ในแฟ้มแล้วค่ะ</strong></font></span> 
				<?php $errorDetect="0"; } 
				?>
                  <form action="all%20files.php<?php if($Folder!="") {echo "?Folder=".$Folder; }?>" method="post" enctype="multipart/form-data" name="return" id="return">
                    <p><font size="2" face="MS Sans Serif, Tahoma, sans-serif">คุณยังมีไฟล์ที่ต้องส่งคืนระบบเป็นจำนาน <font color="#FF0000"> <strong>
                      <?php  $ResultReturn = "0";
					  ///////////////////////////////////////////////// check ไฟล์ที่ยังไม่คืนว่ามีกี่ไฟล์
					  $CheckReturn1 = mysql_query("SELECT * FROM file WHERE FileStatus='$user'");
					  if ((mysql_num_rows($CheckReturn1))!=0) {
					  while ($CountCheck=mysql_fetch_array($CheckReturn1)) {
					  $ResultReturn = $ResultReturn+"1";
					  }
					  }//////////////////////////////////////////////////end check
					  echo $ResultReturn;
					  ?>
                    </strong></font> ไฟล์ คือ<br>
                    <strong><font color="#FF0000">
					<?php 
					 $CheckReturn1 = mysql_query("SELECT * FROM file WHERE FileStatus='$user'");
					  if ((mysql_num_rows($CheckReturn1))!=0) {
					  while ($CountCheck=mysql_fetch_array($CheckReturn1)) {
					  $IDreturn = $CountCheck["FileID"]; 
					  $IDdede = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$IDreturn'");
					  $IDdede2 = @mysql_result($IDdede,0,"VirtualPath");
					?>
					 <strong><font color="#FF0000">
                    <input name="RadioReturn" type="radio" value="<?php echo $IDreturn; ?>">
                    <?php echo  $CountCheck["FileName"]." (Path=".$IDdede2.")";?></font></strong></font><br>
					<?php }}?>
</p>
                    <p><span class="style1"><font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><img src="pictures/returnfile.gif" width="127" height="26" align="bottom"></font></span>
                      <input name="cReturn" type="file" id="cReturn">
                      <input name="ReturnFile" type="submit" id="ReturnFile" value="Send">
					  <input type="hidden" name="MAX_FILE_SIZE" value="2000000">
                    </p>
                </form></td>
              </tr>
            </table> </td>
        </tr>
    </table></td>
  </tr>
</table>

</body>
</html>
