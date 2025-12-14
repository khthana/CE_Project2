<?
//=====MAKE FILE ==========
	
		$new_art_id=$art_id;
		$dir_location ="/www/htdocs/magazine/article/"."$col_name/"."article_"."$new_art_id/" ;
		mkdir($dir_location,a);		
		$it=chmod($dir_location,0777);
		$file_location = "$dir_location"."index.html";
		
		// ==== create file source //

		$source_file = fopen($file_location,"a+");
		echo " made file $file_location";


//	// =========== source data ===========	

//		$data = ereg_replace('\"','"',$data);
//		fputs($source_file,$data);
		
		echo "<br>\n data is : $data_article <br>\n"; 
		fputs($source_file,stripslashes($data_article));
		
		fclose($source_file);
		$it=chmod($file_location,0777);	
		
	//=======================================	
		$location=$dir_location;
	

?>
