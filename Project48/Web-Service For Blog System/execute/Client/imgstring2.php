<?php
			session_start();
			$rand = $_SESSION['ss_Temp'];
			header ("Content-type: image/gif");
			if ($rand == ""){
				$alphanum  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
				$rand = substr(str_shuffle($alphanum), 0, 5);	
			}
			$image = imagecreate(60, 23);
			$bgColor = imagecolorallocate ($image, 0, 113, 188); 
			$textColor = imagecolorallocate ($image, 255, 255, 255); 
			imagestring ($image, 8, 8, 4,  $rand, $textColor); 
			imagegif($image);
			imagedestroy($image);
?>