<?php 
//----------------------------Header for link----------------------------
if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
        die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
 include("header.php");
 OpenTable();
 //-----------------------------------------------------------------------------
$userpage = 1;
$strDesc=$_POST['strDesc']; 
$description=$_POST['description'];
$cat=$_POST['cat'];
$fileUpload=$_FILES['fileUpload']['tmp_name']; 
$fileUpload_name=$_FILES['fileUpload'] ['name']; 
$fileUpload_size=$_FILES['fileUpload'] ['size']; 
$fileUpload_type=$_FILES['fileUpload'] ['type']; 
$fileUpload1=$_FILES['fileUpload1']['tmp_name']; 
$fileUpload_name1=$_FILES['fileUpload1'] ['name']; 
$fileUpload_size1=$_FILES['fileUpload1'] ['size']; 
$fileUpload_type1=$_FILES['fileUpload1'] ['type']; 
$user=$HTTP_SESSION_VARS["user"];
//---------------------------Crop picture------------------------------
	$filename=strtolower($fileUpload_name1);
	if(strstr($filename,".gif") || strstr($filename,".jpg") || strstr($filename,".png"))
	{	
		if(strstr($filename,".gif")){
           $im = imageCreateFromGif($fileUpload1); 
        }
       else if(strstr($filename,".jpg") ){      
           $im = imageCreateFromJpeg($fileUpload1); 
		}
		else if(strstr($filename,".png")  ){      
           $im = imageCreateFromPng($fileUpload1); 
		}
       
			if($im!=null){
				echo imagesx($im)."x";
				echo imagesy($im)."  ";
			if(imagesx($im)>100 || imagesy($im)>100){
			image_createThumb($fileUpload1,$fileUpload1,100,100,500);
				$size=$_FILES['fileUpload1'] ['size']; 
				echo "resize to thumbnail.............";
			}
			else{
			 echo "File small thumbnail no resize.............";
			}
		}
	}
	
			
 
//-----------------------------------------------------------------------
//if (is_uploaded_file($fileUpload)) ;

if(empty($strDesc) || $fileUpload == "none") 
die("You must enter both a description and file"); 


// Database connection variables 
$dbServer = "localhost"; 
$dbDatabase = "project"; 
$dbUser = "root"; 
$dbPass = ""; 


$fileHandle = fopen($fileUpload, "rb"); 
$fileContent = fread($fileHandle, $fileUpload_size); 
$fileContent = addslashes($fileContent); 
$fileHandle1 = fopen($fileUpload1, "rb"); 
$fileContent1 = fread($fileHandle1, $fileUpload_size1); 
$fileContent1 = addslashes($fileContent1); 
$user=$HTTP_SESSION_VARS["user"];


$sConn = mysql_connect($dbServer, $dbUser, $dbPass) 
or die("Couldn't connect to database server"); 

$dConn = mysql_select_db($dbDatabase, $sConn) 
or die("Couldn't connect to database $dbDatabase"); 

$dbQuery = "INSERT INTO multimedia VALUES "; 
$dbQuery .= "(0,'$fileUpload_name', '$strDesc', '$fileContent', '$fileUpload_type','$fileUpload_size','$fileContent1','$description','$cat','$user')"; 
mysql_query($dbQuery) or die("Couldn't add file to database"); 


echo "<center><h1>File Uploaded</h1>"; 
echo "The details of the uploaded file are shown below:<br><br>"; 
echo "<b>File name:</b> $fileUpload_name <br>"; 
echo "<b>File type:</b> $fileUpload_type <br>"; 
echo "<b>File size:</b> $fileUpload_size <br></center>"; 
//echo "<b>Uploaded to:</b> $fileUpload <br><br></center>"; 
/*
echo "<b>File thumnail name:</b> $file1_name <br>"; 
echo "<b>File thumnail type:</b> $file1_type <br>"; 
echo "<b>File thumnail size:</b> $file1_size <br>"; 
*/

//echo "<b>Uploaded to:</b> $fileUpload <br><br>"; 
echo "<center><a href=../nuke/modules.php?name=uploadfiles>Add Another File</a></center>"; 

 CloseTable();
 include("footer.php");

 //-------------------------------------------------------------------------------------------------------------
 function image_createThumb($src,$dest,$maxWidth,$maxHeight,$quality=100) { 
   if (file_exists($src)  && isset($dest)) { 
       // path info 
       $destInfo  = pathInfo($dest); 
       
       // image src size 
       $srcSize  = getImageSize($src); 
       
       // image dest size $destSize[0] = width, $destSize[1] = height 
       $srcRatio  = $srcSize[0]/$srcSize[1]; // width/height ratio 
       $destRatio = $maxWidth/$maxHeight; 
       if ($destRatio > $srcRatio) { 
           $destSize[1] = $maxHeight; 
           $destSize[0] = $maxHeight*$srcRatio; 
       } 
       else { 
           $destSize[0] = $maxWidth; 
           $destSize[1] = $maxWidth/$srcRatio; 
       } 
       $destInfo['extension'];
       // path rectification 
       if ($destInfo['extension'] == "gif") { 
           $dest = substr_replace($dest, 'jpg', -3); 
       } 
       
       // true color image, with anti-aliasing 
       $destImage = imageCreateTrueColor($destSize[0],$destSize[1]); 
       imageAntiAlias($destImage,true); 
       
       // src image 
       switch ($srcSize[2]) { 
           case 1: //GIF 
           $srcImage = imageCreateFromGif($src); 
           break; 
           
           case 2: //JPEG 
           $srcImage = imageCreateFromJpeg($src); 
           break; 
           
           case 3: //PNG 
           $srcImage = imageCreateFromPng($src); 
           break; 
           
           default: 
           return false; 
           break; 
       } 
       
       // resampling 
       imageCopyResampled($destImage, $srcImage, 0, 0, 0, 0,$destSize[0],$destSize[1],$srcSize[0],$srcSize[1]); 
       
       // generating image 
       switch ($srcSize[2]) { 
           case 1: 
           case 2: 
           imageJpeg($destImage,$dest,$quality); 
           break; 
           
           case 3: 
           imagePng($destImage,$dest); 
           break; 
       } 
       return true; 
   } 
   else { 
       return false; 
   } 
} 
?>




