<?
		$max_x = 97;
		$max_y = 100;
		$size = GetImageSize($file);
		$x =  $size[0];
		$y = $size[1];
		$x_ratio = $max_x / $x;
		$y_ratio = $max_y/$y;
		if(($x <= $max_x) && ($y <= $max_y)){
			$new_x = $x;
		}
		else if(($x_ratio * $y) < $max_y){
			$new_x = $max_x;
			$new_y = ceil($x_ratio * $y);
		}
		else{
			$new_x = ceil($y_ratio * $x);
			$new_y = $max_y;
		}
		$src = ImageCreateFromJpeg($file);
		$dst = ImageCreate($new_x,$new_y);
		ImageCopyResized($dst,$src,0,0,0,0,$new_x,$new_y,$x,$y);
		header("Content-type: image/jpeg");
		ImageJpeg($dst,null,-1);
		ImageDestroy($src);
		ImageDestroy($dst);
?>