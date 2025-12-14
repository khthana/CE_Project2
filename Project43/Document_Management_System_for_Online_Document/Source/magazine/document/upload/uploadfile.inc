<?
echo " this is file name : $file_name <br>\n";
if (empty($file_size)) {
	echo "no file";
} else  {
     
	$ext = strrchr($file_name,'.'); 
	if ($ext ==".txt" or $ext ==".html") {
		//=====MAKE FILE ==========
	
		$new_art_id=$art_id+1;
		$dir_location ="/www/htdocs/magazine/article/"."$col_name/"."article_"."$new_art_id/" ;
		mkdir($dir_location,a);		
		$it=chmod($dir_location,0777);
		$file_location = "$dir_location"."index.html";
		copy($file,$file_location);
		echo " got file $file_location";		
	}
	
	
	else if ($ext == ".zip") {

//=====MAKE FILE  from ZIP File ==========
	
		$new_art_id=$art_id+1;
		$dir_location ="/www/htdocs/magazine/article/"."$col_name/"."article_"."$new_art_id/" ;
		mkdir($dir_location,a);		
		$it=chmod($dir_location,0777);
		$file_location = "$dir_location"."source.zip";
		copy($file,$file_location);
		echo " got file $file_location";
		$it=chmod($file_location,0777);
		chdir($dir_location);
		echo  `unzip source.zip` ;
//		rename("index.html","source.txt");
		chdir("/www/htdocs/magazine/document/upload/");
	}

$location=$dir_location;	
echo "location:$location<br>\n";
//  ============================================================

}	

?>
